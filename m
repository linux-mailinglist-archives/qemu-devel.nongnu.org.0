Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8780E56AA23
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 19:58:53 +0200 (CEST)
Received: from localhost ([::1]:50170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Vm8-0005Vg-Lr
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 13:58:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o9VkD-0003PD-DV
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 13:56:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o9VkB-00041M-KR
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 13:56:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657216611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G6qC9ib5nqJ4lP0xTETi1OiVFL+EapjyPXbh/MMsPgE=;
 b=WPuutox9IxllFLRBXczwNY7ZjDBLbiNtUENX7goKipD/BHIps+3ZpxS4nTSs6R6PFZoON+
 QFOgMsJq56vA5ToeIrMPjMLCxHbopvSR9lbzUjzLQvs/Tm1p2FROhAEty5KGN+UZM1RWJ5
 w1nYNPF4Vq22eLcvIBo97GgkwtFoaOk=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-fH3kwg8xMNqsNNS4Gq213A-1; Thu, 07 Jul 2022 13:56:50 -0400
X-MC-Unique: fH3kwg8xMNqsNNS4Gq213A-1
Received: by mail-qk1-f200.google.com with SMTP id
 l189-20020a37bbc6000000b006af2596c5e8so18609478qkf.14
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 10:56:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=G6qC9ib5nqJ4lP0xTETi1OiVFL+EapjyPXbh/MMsPgE=;
 b=tIfIAPQrxgFm/V5yWRlxz9pwEgq5L2SpYy+SzpjP+7ANHPLBFjq37cUanWtqfVUTsY
 pFZgQmSPDZ754XgAIeB03BaeRHtyFcDvhaHp+9NUmv/WdGDWsLveo3772gXD0y5WxZjM
 +aeY4EYtTzhkpjtj/IJ8B+IMovLXogQSNF1Hb8gcHf/rhYXT76+KBsWXC21HoWIro6Oo
 XXdKsCdfMQtEon+cbhlVUJBltTWJgO16P1FAlq7AkKPVNgBKYt60X9to1e9cFPB41drX
 U6MB/NqT5wM4NwBOjDUcPZCdF0SLAJSU40xrUwBdTSwq0G4iQbPp4sIKqCxsy0dLi7Jg
 vLig==
X-Gm-Message-State: AJIora84ztzoeoR4cx7DdWSqFAZahjp4PLwEzAus9LE7/drNV59K9ooi
 zw//TGuVH7eSYajlzxgAUjitgrzw4dHkSQpSW3RKEQhA34MMw2EWg73u4JsmDB9TGb+naS3ZhIn
 9eJ8lOtLYlNc7/Pg=
X-Received: by 2002:a37:5ac4:0:b0:69a:1423:4cac with SMTP id
 o187-20020a375ac4000000b0069a14234cacmr32019636qkb.41.1657216609541; 
 Thu, 07 Jul 2022 10:56:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sqi/SaqDcCfJ1o5sKczCCn+/f/IkOCUX/7oONKOrrU9C2oboPzdMoaK5DYfZbdGmr3mHiekA==
X-Received: by 2002:a37:5ac4:0:b0:69a:1423:4cac with SMTP id
 o187-20020a375ac4000000b0069a14234cacmr32019621qkb.41.1657216609222; 
 Thu, 07 Jul 2022 10:56:49 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-37-74-12-30-85.dsl.bell.ca. [74.12.30.85])
 by smtp.gmail.com with ESMTPSA id
 gd7-20020a05622a5c0700b00304f7449e17sm24600121qtb.93.2022.07.07.10.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 10:56:48 -0700 (PDT)
Date: Thu, 7 Jul 2022 13:56:47 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 3/3] migration/multifd: Warn user when zerocopy not
 working
Message-ID: <YsceXwzZGaWBBe5D@xz-m1.local>
References: <20220704202315.507145-1-leobras@redhat.com>
 <20220704202315.507145-4-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220704202315.507145-4-leobras@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 04, 2022 at 05:23:15PM -0300, Leonardo Bras wrote:
> Some errors, like the lack of Scatter-Gather support by the network
> interface(NETIF_F_SG) may cause sendmsg(...,MSG_ZEROCOPY) to fail on using
> zero-copy, which causes it to fall back to the default copying mechanism.
> 
> After each full dirty-bitmap scan there should be a zero-copy flush
> happening, which checks for errors each of the previous calls to
> sendmsg(...,MSG_ZEROCOPY). If all of them failed to use zero-copy, then
> increment dirty_sync_missed_zero_copy migration stat to let the user know
> about it.
> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  migration/ram.h     | 2 ++
>  migration/multifd.c | 2 ++
>  migration/ram.c     | 5 +++++
>  3 files changed, 9 insertions(+)
> 
> diff --git a/migration/ram.h b/migration/ram.h
> index ded0a3a086..d3c7eb96f5 100644
> --- a/migration/ram.h
> +++ b/migration/ram.h
> @@ -87,4 +87,6 @@ void ram_write_tracking_prepare(void);
>  int ram_write_tracking_start(void);
>  void ram_write_tracking_stop(void);
>  
> +void dirty_sync_missed_zero_copy(void);
> +
>  #endif
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 684c014c86..3909b34967 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -624,6 +624,8 @@ int multifd_send_sync_main(QEMUFile *f)
>              if (ret < 0) {
>                  error_report_err(err);
>                  return -1;
> +            } else if (ret == 1) {
> +                dirty_sync_missed_zero_copy();
>              }
>          }
>      }

I know that Juan is working on some patch to only do
multifd_send_sync_main() for each dirty sync, but that's not landed, right?

Can we name it without "dirty-sync" at all (so it'll work before/after
Juan's patch will be applied)?  Something like "zero-copy-send-fallbacks"?

The other thing is the subject may need to be touched up as right now with
the field we don't warn the user anymore on zero-copy-send fallbacks.

Thanks,

> diff --git a/migration/ram.c b/migration/ram.c
> index 01f9cc1d72..db948c4787 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -407,6 +407,11 @@ static void ram_transferred_add(uint64_t bytes)
>      ram_counters.transferred += bytes;
>  }
>  
> +void dirty_sync_missed_zero_copy(void)
> +{
> +    ram_counters.dirty_sync_missed_zero_copy++;
> +}
> +
>  /* used by the search for pages to send */
>  struct PageSearchStatus {
>      /* Current block being searched */
> -- 
> 2.36.1
> 

-- 
Peter Xu



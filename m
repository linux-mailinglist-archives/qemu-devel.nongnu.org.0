Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF5B492F08
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 21:12:30 +0100 (CET)
Received: from localhost ([::1]:54998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9uqD-0003C6-GH
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 15:12:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n9uft-0004EM-PL
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 15:01:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n9ufr-00063X-Iy
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 15:01:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642536106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q/rV0diipbbEzBqueUvVD+y/6fIjSR6VxKwrEwDEb9M=;
 b=RFXO54Cl/0PSCjCMnf5JGA/crm1DslKxeQW8FhgO2vLURbsVYk+2CYSATNgwZV0wUsjOGX
 ikdE5L8n/sIijAq5fMMMIAFq2Xpoy4CyY8O/tR+ylYgkbVjv/T8qqfr/mFDcxUrMNMyXrH
 YxjbkwkY11VnR+i7s8OLUy6JepvNx74=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-280-nMrD_wi7Nr6uMEpTFrdsyg-1; Tue, 18 Jan 2022 15:01:45 -0500
X-MC-Unique: nMrD_wi7Nr6uMEpTFrdsyg-1
Received: by mail-wm1-f70.google.com with SMTP id
 bg32-20020a05600c3ca000b00349f2aca1beso201474wmb.9
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 12:01:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=q/rV0diipbbEzBqueUvVD+y/6fIjSR6VxKwrEwDEb9M=;
 b=saArYDb1itmahYa4zzrDRyZN+2AY2Lb3My5zN+41XhuWkWbEJ7ziZknlqetqCIq1U1
 tM29MEVf1TaTq0DL/Eymk40dLw9otHDTex3ZmQ2r+/jQWtS4okgtQRuSm1yeapiJTD+e
 O5EQcug8pc95PkVqN9kw4NDSgjoiz5fnRlT/dknt/ASsguCnCfiHXtti/tEN+IffE0zv
 p6Y2XVFBt9LtJSj3WPqEC+2C24v83ymoD2XC6LOx+PuR/JdGwzJc32LPEHKvty+QvQxx
 Dn7CJQ8ioB9+OWTN+ABja8GGPRBtQUad3rs24dJia33nUC0B4piptwitlZf/4vu0XLwL
 becA==
X-Gm-Message-State: AOAM532rBut2s9JtJhdssDmI55yW5ec5+Hr8AxmSjG6Y/3DGhlCD5hfq
 O3ueskH/uCbzSMS7hJUHd14ENdyKgag5x/QHmjJMJVqiNWThyaoNUo32Fjb8/vf1sJZ+FA1XGhF
 sPCHxJMpf05Li3fY=
X-Received: by 2002:a05:6000:c2:: with SMTP id
 q2mr21220943wrx.518.1642536103795; 
 Tue, 18 Jan 2022 12:01:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzUOtKaHjGGgDEryG9te86qVplsvDHBeBBBnGCs8r6NklmFpKVDkqbb1QvyYldTAlQPRoLvSA==
X-Received: by 2002:a05:6000:c2:: with SMTP id
 q2mr21220922wrx.518.1642536103566; 
 Tue, 18 Jan 2022 12:01:43 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id u16sm4503282wmq.23.2022.01.18.12.01.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 12:01:42 -0800 (PST)
Date: Tue, 18 Jan 2022 20:01:41 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v4 22/23] migration: Use multifd before we check for the
 zero page
Message-ID: <YeccpUQWfgU1sF7e@work-vm>
References: <20220111130024.5392-1-quintela@redhat.com>
 <20220111130024.5392-23-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220111130024.5392-23-quintela@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Leonardo Bras <leobras@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> So we use multifd to transmit zero pages.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/ram.c | 32 +++++++++++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 3536778e19..bdc7cec4cd 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -2168,6 +2168,32 @@ static int ram_save_target_page_legacy(RAMState *rs, PageSearchStatus *pss)
>      return ram_save_page(rs, pss);
>  }
>  
> +/**
> + * ram_save_target_page_multifd: save one target page
> + *
> + * Returns the number of pages written
> + *
> + * @rs: current RAM state
> + * @pss: data about the page we want to send
> + */
> +static int ram_save_target_page_multifd(RAMState *rs, PageSearchStatus *pss)
> +{
> +    RAMBlock *block = pss->block;
> +    ram_addr_t offset = ((ram_addr_t)pss->page) << TARGET_PAGE_BITS;
> +    int res;
> +
> +    if (!migration_in_postcopy()) {
> +        return ram_save_multifd_page(rs, block, offset);
> +    }
> +
> +    res = save_zero_page(rs, block, offset);

I'm confused; I think I was expecting to see in this patch, the one that
would check the parameter you added and do something different - where
did that go?

Note I think this is quite subtle that the difference here is really
just the ordering rather than adding a zero page test.

Dave

> +    if (res > 0) {
> +        return res;
> +    }
> +
> +    return ram_save_page(rs, pss);
> +}
> +
>  /**
>   * ram_save_host_page: save a whole host page
>   *
> @@ -3011,7 +3037,11 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
>      ram_control_before_iterate(f, RAM_CONTROL_SETUP);
>      ram_control_after_iterate(f, RAM_CONTROL_SETUP);
>  
> -    (*rsp)->ram_save_target_page = ram_save_target_page_legacy;
> +    if (migrate_use_multifd()) {
> +        (*rsp)->ram_save_target_page = ram_save_target_page_multifd;
> +    } else {
> +        (*rsp)->ram_save_target_page = ram_save_target_page_legacy;
> +    }
>      multifd_send_sync_main(f);
>      qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
>      qemu_fflush(f);
> -- 
> 2.34.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK



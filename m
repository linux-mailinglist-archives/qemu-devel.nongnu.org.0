Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 159485E69A1
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 19:29:13 +0200 (CEST)
Received: from localhost ([::1]:45914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obQ0e-0006AA-0I
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 13:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1obOYy-0002K8-UA
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:56:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1obOYv-0004Yf-8S
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:56:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663862187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cC4hzhgm8BG86gkV7Qeok3+KAX76gba7rsOl3vh18xI=;
 b=HBmnE3Y9DhpNdh+ZLD9Ti5dYaW0PrKSoUY2P6CakOgkkWgeAAtYS232x2GXOFQyiESIPJu
 5I/cPbh+TQvTBEEWn6pUg0dRoQhbv87BPWrTPCBCobs0KdgWRMJUh6+V3UmZhtgFy/6XND
 ZRFpm4n5Bi3EFOp0hq5jerXSNyMuzfA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-534-ctxfLkpgMO6wrEBAiqPKAg-1; Thu, 22 Sep 2022 11:56:26 -0400
X-MC-Unique: ctxfLkpgMO6wrEBAiqPKAg-1
Received: by mail-wr1-f70.google.com with SMTP id
 q17-20020adfab11000000b0022a44f0c5d9so3380227wrc.2
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 08:56:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=cC4hzhgm8BG86gkV7Qeok3+KAX76gba7rsOl3vh18xI=;
 b=wtyr//6hL+LgFnckS+wVbFTcqSMcB2OVpzD/mD6AL+25Uu8GHGcUWpdICE9Aq2AzFj
 Wo8ssZW3uyr0xN1bsgZlzib9AoPNoqJwFRI/Rw3cwg9BCgS8jwPCL9QduFeSsyffSUVl
 NlVRriQkZzI8KffwwokjsTp7U4unfecukiisKWGZIvgBnAU1hJXFNERRuXh+aHe9qbqe
 CfhKZAjPpE4TpFy6ZdoHXJVtZeoG9hnJmhlDvMVJ0K3qFRyJEzFWuJroW8CfB08LblCS
 lphYT06fmIhyuxrIEut2fIQIsbMAt4MMxJBA4AhkB82/zbnH89hR2H/USB6564QS+OhC
 ZyYw==
X-Gm-Message-State: ACrzQf3Afqlp/YeksdXz45JBVRdEoWASV7iTmIrpJgJf8oJptQa/KSBh
 k2Xzm7DiwSVow2mdW3Jjo//Z3YBEE4rQ55Ot6z1tV3HhZiWiEjFr8ofXiqhN0UDbaMb0UsaVo2L
 WgbcMPB/vwPlaz9Y=
X-Received: by 2002:a05:6000:387:b0:22a:3cae:93c4 with SMTP id
 u7-20020a056000038700b0022a3cae93c4mr2693437wrf.321.1663862184208; 
 Thu, 22 Sep 2022 08:56:24 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4hC+URF0BBfztwUH6FkkV957RV1apvJ7g8dOd9XIuvcPBPjFyL22lW3tMvxsLtfpiGLlpBkA==
X-Received: by 2002:a05:6000:387:b0:22a:3cae:93c4 with SMTP id
 u7-20020a056000038700b0022a3cae93c4mr2693420wrf.321.1663862183942; 
 Thu, 22 Sep 2022 08:56:23 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 y15-20020a05600c364f00b003b31c560a0csm5999258wmq.12.2022.09.22.08.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 08:56:23 -0700 (PDT)
Date: Thu, 22 Sep 2022 16:56:21 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH 3/5] migration: Disallow xbzrle with postcopy
Message-ID: <YyyFpTpuI03kdutm@work-vm>
References: <20220920223800.47467-1-peterx@redhat.com>
 <20220920223800.47467-4-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920223800.47467-4-peterx@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

* Peter Xu (peterx@redhat.com) wrote:
> It's not supported since the 1st day, as ram_load_postcopy does not handle
> RAM_SAVE_FLAG_XBZRLE.  Mark it disabled explicitly.

We've already got a check in ram_save_page:

    if (rs->xbzrle_enabled && !migration_in_postcopy()) {
        pages = save_xbzrle_page(rs, &p, current_addr, block,
                                 offset);

so that's supposed to allow you to enable xbzrle with postcopy and take
advantage of xbzrle during the precopy phase.

Dave

> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  migration/migration.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index bb8bbddfe4..fb4066dfb4 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1268,6 +1268,11 @@ static bool migrate_caps_check(bool *cap_list,
>              error_setg(errp, "Postcopy is not compatible with ignore-shared");
>              return false;
>          }
> +
> +        if (cap_list[MIGRATION_CAPABILITY_XBZRLE]) {
> +            error_setg(errp, "Postcopy is not compatible with xbzrle");
> +            return false;
> +        }
>      }
>  
>      if (cap_list[MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT]) {
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C08AD566EC0
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 14:53:00 +0200 (CEST)
Received: from localhost ([::1]:51278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8i31-0007BH-TJ
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 08:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o8i1g-0006PL-7b
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 08:51:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o8i1c-0004kJ-FA
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 08:51:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657025491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lj8+R9NPdehqn0Puk8Wx930kZMXjppuqT0bQuws5aBI=;
 b=NWWM3TXEHj9gMeYgN1R182h+7kWe+YncMvkP8CfOGpE0F2Ilke3JH2nVY77K0sMnpwsUTy
 u2O8IV75XTPhbImhOIf3bCWsDDaT1fEdj33gTOx5ZFWkvAIqlOgk8RC4SzFIy+9xz6aZBy
 6owTKnIC4Z7hOdFm7vlM4Klvcl4WySs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-279-lBXpkFQLP3GnrRAXWN1usg-1; Tue, 05 Jul 2022 08:51:27 -0400
X-MC-Unique: lBXpkFQLP3GnrRAXWN1usg-1
Received: by mail-wr1-f70.google.com with SMTP id
 f20-20020adfc994000000b0021d4aca9d0eso1849047wrh.0
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 05:51:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lj8+R9NPdehqn0Puk8Wx930kZMXjppuqT0bQuws5aBI=;
 b=W2UURZdfkaRNygVT9v9J2wg+rHb4ZO5GlrIkzGgTdui/bT/RHEQqxgNhKsK/xAvfLb
 z/ycxvAxKvsJrm07FiX0JbWxlwUGWxB02pDTmQp+GcP820xvR5t7N4bkLS5Rs8s5Nyqp
 hTWSk8uEJus9o3RHcdgiJJvCgXftI5cP/VIMANQj/tH6WQYVR3nmAnGLX+IxhmLrEEyj
 29ds0/TDFJrquizNR7xQA17//zWpiznd6g7XNZAs2Xmt18zvXUUQL/OhPjSAOmuxfzTx
 s+oIS6Whut0orGVnTSYEG70Z+dMyDOsjx1r3M/nqngwv3vb3KyY9RORShJY/HJnGQTsr
 bKSw==
X-Gm-Message-State: AJIora8Cb5ODSHTxnfLEF82ktgyuSmTFZf/FGksSFqXNKFX/IhUV2w+k
 lT72G9At8eT9t+/BygrWiQkn9HoEaYSWZfgCAExMVHJPnCvJ4fwrEa5266Yn/rHHL+OvIJQLBr2
 art470Z1oAVbE2rA=
X-Received: by 2002:a05:600c:4f42:b0:3a0:57ed:93a9 with SMTP id
 m2-20020a05600c4f4200b003a057ed93a9mr36120744wmq.143.1657025486840; 
 Tue, 05 Jul 2022 05:51:26 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vGIHtY8ioBzwU6EKYNW3/w6seannu8ImcAXhXK36NK1mA8vnZE2t2bZNnesBjYoo1ZXVDi8w==
X-Received: by 2002:a05:600c:4f42:b0:3a0:57ed:93a9 with SMTP id
 m2-20020a05600c4f4200b003a057ed93a9mr36120724wmq.143.1657025486613; 
 Tue, 05 Jul 2022 05:51:26 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 q4-20020adff944000000b0021b956da1dcsm32918726wrr.113.2022.07.05.05.51.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 05:51:25 -0700 (PDT)
Date: Tue, 5 Jul 2022 13:51:23 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras <leobras@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH 3/5] migration: Simplify ram_find_and_save_block()
Message-ID: <YsQzy7nOWFt4cpLI@work-vm>
References: <20220621140507.1246-1-quintela@redhat.com>
 <20220621140507.1246-4-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220621140507.1246-4-quintela@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

* Juan Quintela (quintela@redhat.com) wrote:
> We will need later that find_dirty_block() return errors, so
> simplify the loop.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/ram.c | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 35816a3a0a..1d4ff3185b 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -2256,7 +2256,6 @@ static int ram_find_and_save_block(RAMState *rs)
>  {
>      PageSearchStatus pss;
>      int pages = 0;
> -    bool again, found;
>  
>      /* No dirty page as there is zero RAM */
>      if (!ram_bytes_total()) {
> @@ -2272,18 +2271,17 @@ static int ram_find_and_save_block(RAMState *rs)
>      }
>  
>      do {
> -        again = true;
> -        found = get_queued_page(rs, &pss);
> -
> -        if (!found) {
> +        if (!get_queued_page(rs, &pss)) {
>              /* priority queue empty, so just search for something dirty */
> -            found = find_dirty_block(rs, &pss, &again);
> +            bool again = true;
> +            if (!find_dirty_block(rs, &pss, &again)) {
> +                if (!again) {
> +                    break;
> +                }
> +            }
>          }
> -
> -        if (found) {
> -            pages = ram_save_host_page(rs, &pss);
> -        }
> -    } while (!pages && again);
> +        pages = ram_save_host_page(rs, &pss);
> +    } while (!pages);
>  
>      rs->last_seen_block = pss.block;
>      rs->last_page = pss.page;
> -- 
> 2.34.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK



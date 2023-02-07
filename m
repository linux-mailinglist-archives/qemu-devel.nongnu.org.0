Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D7968E11F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 20:25:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPTb4-0003KC-1Y; Tue, 07 Feb 2023 14:25:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPTan-0003J8-4Q
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 14:25:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPTal-0007l3-CM
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 14:25:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675797922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HLLTY87lUEoZQboO944lmelib+/kXWtjP8YjFjLyeL8=;
 b=bTh9mkPeXZYO2hCzCXhLVieGxBU32yvSd3DxnDn64L8o1Jv7cVE5B8WHdV3cePMNoy5Fqs
 ZQMnFzgN4uOGrrgedValCTMO48TSUEg2rRb/5n9ddWUs/ezu2be3gWRrNEwKB+dS7Suiop
 OIHENdNamd/fIEERaqa2vmAUGCcJLmg=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-615-25RkpDLAO9GVbmWMcSCBgQ-1; Tue, 07 Feb 2023 14:25:20 -0500
X-MC-Unique: 25RkpDLAO9GVbmWMcSCBgQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 e5-20020a056214110500b0053547681552so8179850qvs.8
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 11:25:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HLLTY87lUEoZQboO944lmelib+/kXWtjP8YjFjLyeL8=;
 b=wiDO74GYQEOcCPeHhrgFHTHog4rPBj9Hs7lAwZI5+JUyyoBVoe4xaGoeooqqrXBUU5
 4UAAi62lLcLr+PU0eaw4DI7g+1rdQAm/0OSv2F/UqB+Oswa/3Ngn72crsZLyThVPLAuc
 tlcxe/+vZdGV9gRwIn29K+Y7a49x47T3nZ7CPXe4d0ORHIK6PLc2sEtSzNYmTbQdfQx4
 De2AuUhvO6fg/X296bLk33T+cFa+5BjgPt03Qb0fORBPOTO9KhQkLNJvQSv1o9Uiltw0
 JxFExRXfk3d3Wg4amSa5kL/0p0ivIZzQntm0NnxwLWO8Mva5gtW+wo+SLPymKxSzpBEf
 /MeA==
X-Gm-Message-State: AO0yUKXbiq54+b6fyIXbvN9PRcqMuv9rxFueoye5MHfmrX6E5BmKJ7Yb
 145hn3GwsW8UwYj6yJVaRzBpokoEPZx/bhRKDrePrQgNq6III+Xkst4Dr53CLKLRUcgnJkAKW/J
 1k+YgT3sKu2YCuJg=
X-Received: by 2002:ac8:5709:0:b0:3b5:5234:e895 with SMTP id
 9-20020ac85709000000b003b55234e895mr8602232qtw.15.1675797920356; 
 Tue, 07 Feb 2023 11:25:20 -0800 (PST)
X-Google-Smtp-Source: AK7set/tB4J3UrgYgk4i4TZp5ty0fs2hkTLPNa5rgVIkJj3d1HJWQs6BDA+9TmDCj74hMxTlaHq7Sg==
X-Received: by 2002:ac8:5709:0:b0:3b5:5234:e895 with SMTP id
 9-20020ac85709000000b003b55234e895mr8602205qtw.15.1675797920108; 
 Tue, 07 Feb 2023 11:25:20 -0800 (PST)
Received: from [192.168.8.105] (tmo-099-228.customers.d1-online.com.
 [80.187.99.228]) by smtp.gmail.com with ESMTPSA id
 fv22-20020a05622a4a1600b003b646123691sm10063565qtb.31.2023.02.07.11.25.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 11:25:19 -0800 (PST)
Message-ID: <f68aae0e-0cbf-bac0-0a03-1a8d331af70b@redhat.com>
Date: Tue, 7 Feb 2023 20:25:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Steve Sistare <steven.sistare@oracle.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <1675795623-234945-1-git-send-email-steven.sistare@oracle.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH V2 01/20] migration: fix populate_vfio_info
In-Reply-To: <1675795623-234945-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 07/02/2023 19.47, Steve Sistare wrote:
> Include CONFIG_DEVICES so that populate_vfio_info is instantiated for
> CONFIG_VFIO.  Without it, the 'info migrate' command never returns
> info about vfio.
> 
> Fixes: 43bd0bf30f ("migration: Move populate_vfio_info() into a separate file")

Oh, weird, I'm pretty sure that I tested my patch back then ... maybe I was 
on an older branch that did not have have the "#include CONFIG_DEVICES" 
stuff yet ... :-/

Anyway, this change here looks like the right fix:

Reviewed-by: Thomas Huth <thuth@redhat.com>


> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   migration/target.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/migration/target.c b/migration/target.c
> index 907ebf0..00ca007 100644
> --- a/migration/target.c
> +++ b/migration/target.c
> @@ -8,6 +8,7 @@
>   #include "qemu/osdep.h"
>   #include "qapi/qapi-types-migration.h"
>   #include "migration.h"
> +#include CONFIG_DEVICES
>   
>   #ifdef CONFIG_VFIO
>   #include "hw/vfio/vfio-common.h"
> @@ -17,7 +18,6 @@ void populate_vfio_info(MigrationInfo *info)
>   {
>   #ifdef CONFIG_VFIO
>       if (vfio_mig_active()) {
> -        info->has_vfio = true;
>           info->vfio = g_malloc0(sizeof(*info->vfio));
>           info->vfio->transferred = vfio_mig_bytes_transferred();
>       }



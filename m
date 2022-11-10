Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8908E623DBC
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 09:46:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot3Bs-00009U-81; Thu, 10 Nov 2022 03:45:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ot3BQ-00006s-B6
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 03:45:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ot3BO-0005pU-Rp
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 03:45:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668069910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vvAg1kNhG4FiNRhilzMHeg0+4jDFDcbXk7nkb9d25Qk=;
 b=cVYCMTG+l7NzZayjfirbsA5jdIahFgc2WMqOesACVWHgDqxnR4lpiSoySm9V5WCqxOt7eq
 ZTIPGpLrMmstMoFUYoyNSM8YsnASW4ecSs4Nfo112WBBpgHCOcmt/nA8S8esA57n31ubjt
 3wVHUYw7Gcp/KLIjGPWgBM9HIbAkrHQ=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-488-GZc7ZZfxMpKZqidA-skdwA-1; Thu, 10 Nov 2022 03:45:07 -0500
X-MC-Unique: GZc7ZZfxMpKZqidA-skdwA-1
Received: by mail-pl1-f198.google.com with SMTP id
 h16-20020a170902f55000b001871b770a83so969186plf.9
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 00:45:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vvAg1kNhG4FiNRhilzMHeg0+4jDFDcbXk7nkb9d25Qk=;
 b=FO/IW82RbUWc69ZtbGWYRvVUUqls17hGUf6QcrKMynG1DtsP0tUciwBECEdPnlwBx9
 J4rRpRdmpdh8TA4oYaC75Pa/8CT0FxTT9WHfBgyz8SomXLS5AvbQVNupszI+9T8LntG0
 jQpLVlHEMfFcyaF4/K79DimN4yKZEVlx89eJnJj3mguctZU6pUh/zoJIOlxlHls/lrBX
 4sOreF7beFBWnoBcD9BYWjslifxprv8YkZy2KLXbF8Vzs6m9phS/D9z4x/JW6/GX99Qe
 bcxoD7kswIWDAtUSnVTkKjbAfrIt0CtkKQvBLeRAziiAixXL62ZYHgCCI9a41+0p+t0R
 euLA==
X-Gm-Message-State: ACrzQf2Z36O6615RcMDCrSTWb2yxzNi7ZKnmcsJXj9dSdCrXu+zBbvp3
 cF1hJS2GVxAiPNFRwM01dMn8pLKgjFkXb43T+y74Cl/dbJKAtOKao27OmEDMGT+8SA/+7YygJ7Y
 HPSqJYoNpBzhjR9g=
X-Received: by 2002:a17:903:2447:b0:186:e200:6109 with SMTP id
 l7-20020a170903244700b00186e2006109mr64489659pls.104.1668069906504; 
 Thu, 10 Nov 2022 00:45:06 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4SNhd/8cGWcCMZDDUOpkZJ/+GxrlkA7qWduIFeh5UopuwznJZ8vmR/bQJmbfMblux4wiS5Hw==
X-Received: by 2002:a17:903:2447:b0:186:e200:6109 with SMTP id
 l7-20020a170903244700b00186e2006109mr64489650pls.104.1668069906228; 
 Thu, 10 Nov 2022 00:45:06 -0800 (PST)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 w7-20020a634747000000b0042b5095b7b4sm8720609pgk.5.2022.11.10.00.45.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 00:45:05 -0800 (PST)
Message-ID: <f6c1e498-7f23-5489-56d7-d1b1b598ef19@redhat.com>
Date: Thu, 10 Nov 2022 09:44:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 4/4] host-libusb: Remove unused variable
Content-Language: en-US
To: mrezanin@redhat.com, qemu-devel@nongnu.org
References: <cover.1668009030.git.mrezanin@redhat.com>
 <00df0db69ff9167d38bac81f6d03281955bd861a.1668009030.git.mrezanin@redhat.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <00df0db69ff9167d38bac81f6d03281955bd861a.1668009030.git.mrezanin@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 09/11/2022 16.57, mrezanin@redhat.com wrote:
> From: Miroslav Rezanina <mrezanin@redhat.com>
> 
> Variable unconnected used in usb_host_auto_check function is only incremented
> but never read as line where it is read was disabled since introducing the code.
> This causes 'Unused but set variable' warning on Clang 15.0.1 compiler.
> 
> Removing the variable and disabled code to prevent the warning.
> 
> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
> ---
>   hw/usb/host-libusb.c | 15 ---------------
>   1 file changed, 15 deletions(-)
> 
> diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
> index 28f8af8941..176868d345 100644
> --- a/hw/usb/host-libusb.c
> +++ b/hw/usb/host-libusb.c
> @@ -1837,7 +1837,6 @@ static void usb_host_auto_check(void *unused)
>       struct USBAutoFilter *f;
>       libusb_device **devs = NULL;
>       struct libusb_device_descriptor ddesc;
> -    int unconnected = 0;
>       int i, n;
>   
>       if (usb_host_init() != 0) {
> @@ -1897,9 +1896,6 @@ static void usb_host_auto_check(void *unused)
>           libusb_free_device_list(devs, 1);
>   
>           QTAILQ_FOREACH(s, &hostdevs, next) {
> -            if (s->dh == NULL) {
> -                unconnected++;
> -            }
>               if (s->seen == 0) {
>                   if (s->dh) {
>                       usb_host_close(s);
> @@ -1908,17 +1904,6 @@ static void usb_host_auto_check(void *unused)
>               }
>               s->seen = 0;
>           }
> -
> -#if 0
> -        if (unconnected == 0) {
> -            /* nothing to watch */
> -            if (usb_auto_timer) {
> -                timer_del(usb_auto_timer);
> -                trace_usb_host_auto_scan_disabled();
> -            }
> -            return;
> -        }
> -#endif
>       }
>   
>       if (!usb_vmstate) {

Reviewed-by: Thomas Huth <thuth@redhat.com>



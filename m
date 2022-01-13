Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 521D548D293
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 08:04:05 +0100 (CET)
Received: from localhost ([::1]:40374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7u9U-0005DC-46
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 02:04:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n7txG-0008U0-5h
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 01:51:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n7txE-0000cj-Lk
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 01:51:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642056683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EJyB3xFcnhMH5XNAli6aeyYenpUFM8sScxCOtfFrYeo=;
 b=UhrOZIAtLBAbDHN4vmjLf3cRt26bp8e5LvyzaSW4+6wyihDIlQ3qzN+F0QNZCfeg9gFvq3
 R+qmsBfS82HkWAMi4W+c/DFlaN0mVYhz3Rpb+Un/aEqukCxeXfJung7rNKVDgh6SDJj3Y2
 i9R+ss9TTorEXqLKWZD54D1dtiahtsg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-sAqD99QxNty7X9VDIUT1sw-1; Thu, 13 Jan 2022 01:51:22 -0500
X-MC-Unique: sAqD99QxNty7X9VDIUT1sw-1
Received: by mail-wm1-f72.google.com with SMTP id
 bg32-20020a05600c3ca000b00349f2aca1beso3104871wmb.9
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 22:51:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EJyB3xFcnhMH5XNAli6aeyYenpUFM8sScxCOtfFrYeo=;
 b=ZLuJKxNpu7wmlzCohqQkVlo9znomzjdoimoAH/JSQwN252nyfUuEZj6gPK9xitrgSf
 9Q/PAa4oXjTzDJm83YiH0AFtEvbN+niRIlsfmZLpNiCsr4Z1AVO/iqz5yxrPqca7R+4Y
 FjYPZ+VGBg6+x+VncShDYuAYBCNvlt9NmAgpT5Zv4EeRnczfda9PXPMdA0p/B1SyxuRK
 4yHRZxUYb/xai9/BJZIY7FXys52tSeRa0EB10dlDl3F9JO20Y4CRh57r57rjpeuQ3HdK
 7eMLNIn7bJy6H5Ir4m9SrStXxq5h7iDO+BJe/WV9lXZ/P4dEEqKJgOJ57DIvRmC+fjvL
 ayig==
X-Gm-Message-State: AOAM5309SiVXADeqJrFEb5YAlo1DIzERBjSkjxtTFVi0Jf8wNunzIsmk
 8iWuaZfaIAbmn9sJcfgs8hrd+dZD1mat4wyeCSahw/2Jk0KBvc8S55Rkdg4pVfkL/7G53ujuINF
 eWXsgBMYQb5mIb9k=
X-Received: by 2002:a05:600c:1907:: with SMTP id
 j7mr9736325wmq.175.1642056681020; 
 Wed, 12 Jan 2022 22:51:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZuDFKaAjyVmJG3D5Q8eOMzJmR60MKjLRGXmxDHNVHOweQEeUDdx345cE/S1xp9qHJNH2uNQ==
X-Received: by 2002:a05:600c:1907:: with SMTP id
 j7mr9736316wmq.175.1642056680750; 
 Wed, 12 Jan 2022 22:51:20 -0800 (PST)
Received: from [192.168.42.76] (tmo-065-240.customers.d1-online.com.
 [80.187.65.240])
 by smtp.gmail.com with ESMTPSA id g12sm1680301wrm.109.2022.01.12.22.51.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 22:51:20 -0800 (PST)
Message-ID: <1809ef54-88bc-9fae-8be7-c22dd700b469@redhat.com>
Date: Thu, 13 Jan 2022 07:51:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] configure: do not create roms/seabios/config.mak if
 SeaBIOS not present
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220107114717.509665-1-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220107114717.509665-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

On 07/01/2022 12.47, Paolo Bonzini wrote:
> If roms/seabios/Makefile is not present, the configure script
> is not creating the roms/seabios directory anymore (commit
> 5dce7b8d8c, "configure: remove DIRS", 2021-12-18); thus, creating
> roms/seabios/config.mak fails.
> 
> The easiest thing to do is to not create the file, since it will not
> be used.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   configure | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/configure b/configure
> index 0026388343..e1a31fb332 100755
> --- a/configure
> +++ b/configure
> @@ -3704,7 +3704,8 @@ export target_list source_path use_containers cpu
>   $source_path/tests/tcg/configure.sh)
>   
>   # temporary config to build submodules
> -for rom in seabios; do
> +if test -f $source_path/roms/seabios/Makefile; then
> +  for rom in seabios; do
>       config_mak=roms/$rom/config.mak

I think you can now simply remove the "for" loop line by setting 
config_mak=roms/seabios/config.mak here.

  Thomas


>       echo "# Automatically generated by configure - do not modify" > $config_mak
>       echo "SRC_PATH=$source_path/roms/$rom" >> $config_mak
> @@ -3717,7 +3718,8 @@ for rom in seabios; do
>       echo "IASL=$iasl" >> $config_mak
>       echo "LD=$ld" >> $config_mak
>       echo "RANLIB=$ranlib" >> $config_mak
> -done
> +  done
> +fi
>   
>   config_mak=pc-bios/optionrom/config.mak
>   echo "# Automatically generated by configure - do not modify" > $config_mak



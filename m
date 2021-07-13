Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A018B3C7557
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 18:54:15 +0200 (CEST)
Received: from localhost ([::1]:34246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Lfi-0007k0-Ni
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 12:54:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m3LUZ-0007uM-8l
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:42:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m3LUX-0005tM-1i
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:42:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626194560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dx5X9XgzTV7uVTJUmsO9C024JKO8sBWKxi3wpinZ868=;
 b=SFhoM286mkJJQ/fS+1QlEO9DOxUIPxqlK5ZrQYveD56cJuo3bZXjPgsoFF5J3Y4uszBwmf
 PlvFhXivDakPz1FVXn/W3T3Mp2Cs0B97/B0Fl3M//HyeQHLRYEQJ80I878QXNrk6vR/e0X
 lRWCuEdlgnSUi372G0wdJVNyqZVKwfc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-Uaq9jFMsMDm6Nob8Af7oJQ-1; Tue, 13 Jul 2021 12:42:38 -0400
X-MC-Unique: Uaq9jFMsMDm6Nob8Af7oJQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 y15-20020a5d614f0000b029013cd60e9baaso6630110wrt.7
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 09:42:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Dx5X9XgzTV7uVTJUmsO9C024JKO8sBWKxi3wpinZ868=;
 b=FAwlQ3lBBuYY7i8g3CyUoXDnQycZ0zFFTaUd/X2mf3UpxNKxSebQ8CqFU0tyfLUv1i
 yT4ZqGhCWTFeUBypd/HS1zxuWITYzU+eCg9zlRSLZ6Ek4d0T3v8m68R/02GM22YK27S3
 O0Ak/q2sOxqzckGClBeBT7LDN/WM0Ks9dUNZ6PZISmkaf7Q9V8nOVmYMCWreOvEQxOKn
 2zGvviNsj5krmTejX2J7Qq/xg36EKX4t2O1F0izfg/1MCLXaqFnlGZYFAYIvE0idY5UQ
 0sE1lOBhRBJ/1QeMJH3Lk0HcqQtKQaDP9YMo6DR1I9dnaR83kG4HlbaVkxeJjuNnAn50
 ihwA==
X-Gm-Message-State: AOAM532CcYTH76ZhsST8byVyxdk2HLd+lhWdYwAG1aH4e1ZAux8zXXtc
 E6O2Y7M0QOD6+4oRNOnaa/NNiO/o2zEI+qqyHcJkJR0WwNuJLZVccthJ7GKxf4s4ptoaUe1XPKE
 9FfbsTa7F8e625d8=
X-Received: by 2002:a5d:410b:: with SMTP id l11mr6970408wrp.173.1626194557561; 
 Tue, 13 Jul 2021 09:42:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwABR4gn2Snb2vEtB4kCSkhZoqKIhHL66Onv3vZrfGji48EOf2EaqdeCqqURGAL06qHm/+8kQ==
X-Received: by 2002:a5d:410b:: with SMTP id l11mr6970386wrp.173.1626194557365; 
 Tue, 13 Jul 2021 09:42:37 -0700 (PDT)
Received: from [192.168.1.24] (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr.
 [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id s24sm19264525wra.33.2021.07.13.09.42.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 09:42:37 -0700 (PDT)
Subject: Re: [PATCH 1/4] configure: Fix --without-default-features propagation
 to meson
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210713093155.677589-1-thuth@redhat.com>
 <20210713093155.677589-2-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0ea4b6c5-c0f9-9ce2-a291-9cc1171ed93a@redhat.com>
Date: Tue, 13 Jul 2021 18:42:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713093155.677589-2-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.368, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Alex

On 7/13/21 11:31 AM, Thomas Huth wrote:
> A typo prevents that many features get disabled when the user
> runs "configure" with the --without-default-features switch.
> 
> Reported-by: Cole Robinson <crobinso@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  configure | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 85db248ac1..229ea52516 100755
> --- a/configure
> +++ b/configure
> @@ -5205,7 +5205,7 @@ if test "$skip_meson" = no; then
>          -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
>          -Dvhost_user_blk_server=$vhost_user_blk_server -Dmultiprocess=$multiprocess \
>          -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek -Dguest_agent_msi=$guest_agent_msi -Dbpf=$bpf\
> -        $(if test "$default_features" = no; then echo "-Dauto_features=disabled"; fi) \
> +        $(if test "$default_feature" = no; then echo "-Dauto_features=disabled"; fi) \

The option should be name plural (default_features)...

What is 'auto_features' used for?

>  	-Dtcg_interpreter=$tcg_interpreter \
>          $cross_arg \
>          "$PWD" "$source_path"
> 



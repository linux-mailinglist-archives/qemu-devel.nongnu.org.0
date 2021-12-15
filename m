Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF604757C0
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:29:03 +0100 (CET)
Received: from localhost ([::1]:54258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxST0-0003bW-Va
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:29:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxRtv-0005y5-Ou
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:52:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxRts-0006fV-PV
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:52:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639565563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yl7Iat8NEH7R617MBcEG9XlQsFSTJgx7q72i+BxS6AM=;
 b=Hv9X/A06jUe/CMrQ3ZU+GUVjXJaXooRDW8eV9DKNZVD9fNUtKrDdZzbz6W6e01LdL+rWaf
 WfAjUQsmpPNbLSpEzBFqH5mAioXW0RYjnOlMCDiqj4QFWv5nSW5hZE0lJaWVZtRDZl7Hqx
 YMUV1FWeQ08o3Borpp5RgS0sZdC729g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-eT1CEpdGPKiAt034krvG5Q-1; Wed, 15 Dec 2021 05:52:42 -0500
X-MC-Unique: eT1CEpdGPKiAt034krvG5Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 ay34-20020a05600c1e2200b00337fd217772so8831660wmb.4
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:52:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Yl7Iat8NEH7R617MBcEG9XlQsFSTJgx7q72i+BxS6AM=;
 b=Yj8QYvMBTCSKc7QPNfl8SICY4U+X+/L7bPe4J4sznmQ8chmHyD975Ap7kmZMbm+oEC
 NzF/CLCdPRkt3fjGsOvLgrjTFsmD1maXOqIBtDe2ZPJSmV4kuVx2cT66owtTySwARVXV
 dPfOwSJxdQ9eipYG05JDYxKCV/tlFZwEp3RgqkOYwNrsuwPxtmiw05uTnsQIjYS/NISv
 UHkIHEezlrj9BF3GvsHoKCNo5kUyrSvY1sdEWKx4b5Pf7pc73CCd9SqiOcs9rp9QZ1Oh
 pt1UBivQZgt1poAaTo8822fe7AM/U7EXrHeZU/SFxppzH4Zb8GdLAaQ5KFxME1VuZPz7
 LCJg==
X-Gm-Message-State: AOAM533moB0g7t60EcSaqBD8zEGSXtVk54x0/TwKyvP0ruuhib2f3dcE
 oHXHiBMzytpnZmhPzKEeSXje/xR+nrnA70MV4myOEHxK116MvO2Sefo0rG9Qctt8Fs/w4xiv6DI
 cSvPIQ91f/TnkPhco1iRnrdo7lqxo9MOqH2gRmzYV8t+o7XNrvvzGpw+g+6Z7ILpN
X-Received: by 2002:a5d:68ce:: with SMTP id p14mr3990385wrw.116.1639565560773; 
 Wed, 15 Dec 2021 02:52:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzm+jFlLMhndi2bXsNeKf2CWoLLLFbJIaaPlyt3HRsdoFqq1tnDluDjZfzBV6L/dXY3OXVc3A==
X-Received: by 2002:a5d:68ce:: with SMTP id p14mr3990364wrw.116.1639565560530; 
 Wed, 15 Dec 2021 02:52:40 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id f7sm2007868wri.74.2021.12.15.02.52.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 02:52:40 -0800 (PST)
Message-ID: <dac2e8e7-87f2-7998-13a0-2529b7226e48@redhat.com>
Date: Wed, 15 Dec 2021 11:52:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] configure: Symlink binaries using .exe suffix with MinGW
To: qemu-devel@nongnu.org
References: <20211109144504.1541206-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211109144504.1541206-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.64, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Yonggang Luo <luoyonggang@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Laurent,

This patch is reviewed/acked, can it go via your trivial tree?

On 11/9/21 15:45, Philippe Mathieu-Daudé wrote:
> When using the MinGW toolchain, we use the .exe suffix for the
> executable name. We also need to use it for the symlinks in the
> build directory.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  configure | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 48c21775f3a..31e8f586dc7 100755
> --- a/configure
> +++ b/configure
> @@ -3786,7 +3786,7 @@ fi
>  
>  for target in $target_list; do
>      target_dir="$target"
> -    target_name=$(echo $target | cut -d '-' -f 1)
> +    target_name=$(echo $target | cut -d '-' -f 1)$EXESUF
>      mkdir -p $target_dir
>      case $target in
>          *-user) symlink "../qemu-$target_name" "$target_dir/qemu-$target_name" ;;
> 



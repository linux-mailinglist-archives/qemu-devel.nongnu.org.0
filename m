Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4FE57FBDF
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 10:57:39 +0200 (CEST)
Received: from localhost ([::1]:59958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFtuD-0006Ub-Vj
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 04:57:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oFtsD-00052g-8s
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 04:55:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oFts2-0006SQ-Cw
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 04:55:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658739318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XVutfrlhewmm4dCIiDW8gjHB3w4RzZnjpUOba1Vm1sg=;
 b=eygZH3z2tW9fWR9PZ7SyaRVxFZC991HfTxlMYpX63VMcMhgPFecURdj5lhaI5FddUqyW5w
 b49BpofAHi07vMPsh0gDgKMgn7FTJTwZ0q+1AgggdzOVhEnM/TABcUcrPMhCilVGnHRsIR
 9+jOrCMnix6lBdGh9mkrcce4uLexHa8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-434-PF1itPG3PLCdQ0-S-reZvQ-1; Mon, 25 Jul 2022 04:55:17 -0400
X-MC-Unique: PF1itPG3PLCdQ0-S-reZvQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 bh18-20020a05600c3d1200b003a32044cc9fso5873306wmb.6
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 01:55:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XVutfrlhewmm4dCIiDW8gjHB3w4RzZnjpUOba1Vm1sg=;
 b=lgFXf+Yucb88Rqd6GfNMD+NXcuAwN31UyQRU1mRBoeiMIF04vctBA5WaapgQa6teKW
 wdVGjNVWimJlVJ2Vo/93Ly413BzM5egOxessh4pFKcKC/WmRLPgFfxnRUdYKw4heHcww
 dSIXzJ71vcM8V9ET7rM+Ou1UUVhDgSMg/LINTgn30tqqGWN6My6UyPvdZtJ2H/CzS5eJ
 428rAU2rTy/bVsq+xnXZPNWLknhcZEJXNwnNQoQXWEN357sa6Tbv4BZb+svkn2CwYtgu
 MKj2aLd00IRI94/uJl44/WmOmAHai5bybx+OnFqmgKmpF54cbal4o8bhid8BJotFN2Pc
 7/RQ==
X-Gm-Message-State: AJIora/5hE2f23BC3wUWDxkWIIQyBVGOG6dbbKiNX/gd6+3t/rncrMbH
 KoCxwEHuryA4tnfpyVHrLtlGp5qTWGrTh/V6BBGMQwzqiQMPF10YwB0j9nN2bzpMFwFPpfSipKy
 UzuWKzWDufsHInsM=
X-Received: by 2002:a05:600c:3c83:b0:39c:9039:852c with SMTP id
 bg3-20020a05600c3c8300b0039c9039852cmr7749774wmb.187.1658739316000; 
 Mon, 25 Jul 2022 01:55:16 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tzcVyO+fTL5LROiy3kBazAEUyySZS+2yOUwp7dy90psHvt7XfZFyOvAatp7/0qNnbGh3Plbw==
X-Received: by 2002:a05:600c:3c83:b0:39c:9039:852c with SMTP id
 bg3-20020a05600c3c8300b0039c9039852cmr7749763wmb.187.1658739315812; 
 Mon, 25 Jul 2022 01:55:15 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-178-59.web.vodafone.de.
 [109.43.178.59]) by smtp.gmail.com with ESMTPSA id
 k13-20020a5d66cd000000b0021d888e1132sm11357808wrw.43.2022.07.25.01.55.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 01:55:15 -0700 (PDT)
Message-ID: <3c88f9cf-a5fd-0bef-91b2-6ac8ed787e4d@redhat.com>
Date: Mon, 25 Jul 2022 10:55:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] .cirrus.yml: Change winsymlinks to 'native'
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yonggang Luo <luoyonggang@gmail.com>
References: <20220719161230.766063-1-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220719161230.766063-1-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 19/07/2022 18.12, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> At present winsymlinks is set to 'nativestrict', and its behavior is:
> 
>    a) if native symlinks are enabled and <target> exists, creates
>       <destination> as a native Windows symlink;
>    b) else if native symlinks are not enabled or if <target> does
>       not exist, 'ln -s' fails.
> 
> This causes the following error message was seen during the configure:
> 
>    "ln: failed to create symbolic link
>    'x86_64-softmmu/qemu-system-x86_64.exe': No such file or directory"
> 
> Change winsymlinks to 'native' whose behavior is most similar to the
> behavior of 'ln -s' on *nix, that is:
> 
>    a) if native symlinks are enabled, and whether <target> exists
>       or not, creates <destination> as a native Windows symlink;
>    b) else if native symlinks are not enabled, and whether <target>
>       exists or not, 'ln -s' creates as a Windows shortcut file.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>   .cirrus.yml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/.cirrus.yml b/.cirrus.yml
> index 20843a420c..eac39024f2 100644
> --- a/.cirrus.yml
> +++ b/.cirrus.yml
> @@ -10,7 +10,7 @@ windows_msys2_task:
>       memory: 8G
>     env:
>       CIRRUS_SHELL: powershell
> -    MSYS: winsymlinks:nativestrict
> +    MSYS: winsymlinks:native
>       MSYSTEM: MINGW64
>       MSYS2_URL: https://github.com/msys2/msys2-installer/releases/download/2022-05-03/msys2-base-x86_64-20220503.sfx.exe
>       MSYS2_FINGERPRINT: 0

Acked-by: Thomas Huth <thuth@redhat.com>

Alex, if I've got that right, you're currently assembling a "testing" pull 
request - could you please pick up this patch for that, too? ... I currently 
don't have anything else pending right now, so I don't plan any new pull 
request soon.

  Thomas



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E26E6B4FC3
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 19:06:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pah8M-0007ur-MH; Fri, 10 Mar 2023 13:06:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pah8H-0007rp-O2
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 13:06:21 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pah8E-0005IH-QV
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 13:06:20 -0500
Received: by mail-pg1-x52a.google.com with SMTP id 16so3527317pge.11
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 10:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678471576;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=3UY6j2xf6fL0JpTSS8NDPMUq8QzKrt6F9N0GPqgXqMY=;
 b=BigGHXYt0B/0JptK6vNXMDf+CFTtB/FcFQgv3egcgieW17o/X3uoNSw51B8kAGOYPi
 Dvm0BYB4GemeWLBETWm8k5OqGtR0P6ujanlXXKUluOACjxge6AlXSXrJpMGevijN++Hk
 H+epZjZf5gNJB9OphP3y1kosX6bOKjExg5FFvjQK9lJ+c9i6/n9My2VzhwqDsI34QO/Z
 KSvpuvZ6TJ6EBPa5Bx48bvJcwQPUIAl8vDjTep8BX+e/Hl2+XdUJVwT0DExlnoSVTsgI
 qHunLHUiJ3VojXntQQNDO7/Zcu3N7NTA/yQb34bVqranB3RIowxsgHoIklUIn3NjQbDl
 c10g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678471576;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3UY6j2xf6fL0JpTSS8NDPMUq8QzKrt6F9N0GPqgXqMY=;
 b=H4VUkjFFirsCxdcNO3PYOqRJ9S9oz+9gXeRAiyURio/02aNNIBidV0nNHEpUPyIiuP
 +o+WbkTe6DRjyaREmzM9xLSZPjpLOWtzQenJn4b3O6LXpm41jjiJiEe4m3QQKjAcyW2c
 1CRyO2dYu4LfZQia5u09uFYixtH2dYD1U75uhz/w23UYPx8HMAXm5b1E2+4onJXGYjUJ
 C5DDywq/hHKXxZF6Ik5QUrtYaxefera0yA6CODoJ7QAf2TPXrbTzKp/mZpmyfNR5ZtX7
 Xmg+NUIEHUkEz1nN/mlmZSrPyO5yRkiM2MRPhcqWvvHZpkj+DVMcXY62L3J/C8biDI1w
 PpHg==
X-Gm-Message-State: AO0yUKUEHiMilW/c3I52bmlMcCK8S8NpUEF12Gv7qFImwaJp63xajWU+
 JON4H+HxO7dEnhQbr9/TDBUWPZA9Yds/3kFy4Jk=
X-Google-Smtp-Source: AK7set8JiIleOEuPyUHku/OuulDvpG1RNvBA9khIsdmG0fIPUe7u8go0i13ywfWbqp43DeYDoqMBFQ==
X-Received: by 2002:a62:1d93:0:b0:594:26a7:cbd2 with SMTP id
 d141-20020a621d93000000b0059426a7cbd2mr2558480pfd.8.1678471576141; 
 Fri, 10 Mar 2023 10:06:16 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 c2-20020a6566c2000000b004ff6b744248sm188790pgw.48.2023.03.10.10.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 10:06:15 -0800 (PST)
Date: Fri, 10 Mar 2023 10:06:15 -0800 (PST)
X-Google-Original-Date: Fri, 10 Mar 2023 10:05:26 PST (-0800)
Subject: Re: [PATCH v2 01/10] contrib/gitdm: Add Rivos Inc to the domain map
In-Reply-To: <20230310180332.2274827-2-alex.bennee@linaro.org>
CC: qemu-devel@nongnu.org, alex.bennee@linaro.org,
 Atish Patra <atishp@rivosinc.com>, 
 daolu@rivosinc.com, abrestic@rivosinc.com, Vineet Gupta <vineetg@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: alex.bennee@linaro.org
Message-ID: <mhng-a129e7b1-0807-49cf-aa45-228ac8181743@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=palmer@rivosinc.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 10 Mar 2023 10:03:23 PST (-0800), alex.bennee@linaro.org wrote:
> Whatever they are up to a number of people for the company are
> contributing to QEMU so lets group them together.
>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Atish Patra <atishp@rivosinc.com>
> Cc: Dao Lu <daolu@rivosinc.com>
> Cc: Andrew Bresticker <abrestic@rivosinc.com>
> Cc: Palmer Dabbelt <palmer@rivosinc.com>
> Cc: Vineet Gupta <vineetg@rivosinc.com>
> ---
>  contrib/gitdm/domain-map | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
> index 8913a886c9..7a8077e241 100644
> --- a/contrib/gitdm/domain-map
> +++ b/contrib/gitdm/domain-map
> @@ -32,6 +32,7 @@ oracle.com      Oracle
>  proxmox.com     Proxmox
>  quicinc.com     Qualcomm Innovation Center
>  redhat.com      Red Hat
> +rivosinc.com    Rivos Inc
>  rt-rk.com       RT-RK
>  samsung.com     Samsung
>  siemens.com     Siemens

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Thanks!


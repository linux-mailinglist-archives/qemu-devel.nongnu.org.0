Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E213E585798
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jul 2022 02:44:16 +0200 (CEST)
Received: from localhost ([::1]:55506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHaaV-0001P5-W1
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 20:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHaW5-0003FU-4M
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 20:39:41 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:42883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHaVx-0003NA-K8
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 20:39:40 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 d65-20020a17090a6f4700b001f303a97b14so6699687pjk.1
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 17:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:references:in-reply-to:content-transfer-encoding;
 bh=546YU1cC75jCiKYK62tCcs+2fnIo7z21eUDBMkE1TPM=;
 b=X8yWMnlZOkyyMcbLKm8ClZkcRME9X7eR386UCRkp85bg5Ews3AnQLSofXxSR3zZ3um
 ap1Z6TC9nhSghKWAAS8sqEaZis22YeoecCUIuYqjShcFiMPhdIsNH32I/j6O6KmlH5+Q
 BluEpCb3d4PNfPlSkhNzFCdxBWJJ0cQta+xX4Qt4MKPP+6fUWza5GU4NG7bhcwBelztE
 8igIC9T3C1F8AlFwPphUT9GWx44QUBmFeO9YycmLHGd5Mo5kbTrQ3pK5G14DBkpNUg3c
 YFz4auuovs39Susfu1khWgPR5kDKlpqk2kDKjewpQk3DAW1SqXnyMJK59SGy+fjv6MNO
 d2AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:references:in-reply-to
 :content-transfer-encoding;
 bh=546YU1cC75jCiKYK62tCcs+2fnIo7z21eUDBMkE1TPM=;
 b=PQWmbMHVqVT1SPStpbdCZzGzVPrfNPJSCKXCeqkz/wxJPmWlJrE/Ej8a8/qOmxTCNo
 J84nVbYqU6fJfJgXIt0c0gEbrnLIoUviJIAiy/Byayxvor8JECAh2so0WQkkgJ40UkxU
 DlEqUl1rKKv3YFSEfHM3Uu59XmOHl5omgfP1NvJebnyluA/XkUdFbDTmxhvztTUFjR1t
 zZ5+LsGGVIsNzVVZ4NaYKOONwkj4B/c6YrULVgxBHNK61szrKZOOiQRZGxAjfeNo0fj1
 BHwsn/zERt1O8gjXsEe5cKwx6AS/YWpBRVkAxqpkdgs3ekdMHe+F6CQcxBWBDNA02lQn
 d/4A==
X-Gm-Message-State: ACgBeo3CmPLbjQSx7KHpRuujBNEmjZPqxLfjNl7bDMC55WIxTmY6iYst
 7hIkAGLonZ0vRDka7qZXbj4HsOJ/5LGp6A==
X-Google-Smtp-Source: AA6agR6DKHSp+8WJelMSdr5cA7nUE5NwDymB/R7gt//mdAHjlQy6scXyy+VBvTudYpD40vCauGVk9g==
X-Received: by 2002:a17:90b:1c81:b0:1f1:aa6a:82d0 with SMTP id
 oo1-20020a17090b1c8100b001f1aa6a82d0mr6827632pjb.170.1659141567885; 
 Fri, 29 Jul 2022 17:39:27 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:a427:660:88d4:8559?
 ([2602:ae:1549:801:a427:660:88d4:8559])
 by smtp.gmail.com with ESMTPSA id
 d70-20020a621d49000000b0052ab9f1fe45sm3426646pfd.120.2022.07.29.17.39.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jul 2022 17:39:27 -0700 (PDT)
Message-ID: <2e5f4cae-314e-88d2-2581-766ea368059b@linaro.org>
Date: Fri, 29 Jul 2022 17:39:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 0/2] minor loongarch cleanups
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20220730003755.54019-1-richard.henderson@linaro.org>
In-Reply-To: <20220730003755.54019-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 7/29/22 17:37, Richard Henderson wrote:
> As this is a new target this release, and these patches
> are so minor, I'm applying these as a bug fix.
> 
> r~

Dangit, impatience

   https://gitlab.com/rth7680/qemu.git pull-la-20220729

r~


> Xiaojuan Yang (2):
>    hw/loongarch: Rename file 'loongson3.XXX' to 'virt.XXX'
>    hw/loongarch: Change macro name 'LS7A_XXX' to 'VIRT_XXX'
> 
>   include/hw/loongarch/virt.h          |  8 ++--
>   include/hw/pci-host/ls7a.h           | 43 ++++++++++-----------
>   hw/loongarch/acpi-build.c            | 18 ++++-----
>   hw/loongarch/{loongson3.c => virt.c} | 56 ++++++++++++++--------------
>   MAINTAINERS                          |  2 +-
>   hw/loongarch/meson.build             |  2 +-
>   target/loongarch/README              |  2 +-
>   7 files changed, 64 insertions(+), 67 deletions(-)
>   rename hw/loongarch/{loongson3.c => virt.c} (93%)
> 



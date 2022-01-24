Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 075DD497A75
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 09:42:54 +0100 (CET)
Received: from localhost ([::1]:51548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBuw8-0000QS-J8
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 03:42:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBuWf-0004Sd-Re
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 03:16:34 -0500
Received: from [2607:f8b0:4864:20::62f] (port=41759
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBuWd-0004gO-9c
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 03:16:32 -0500
Received: by mail-pl1-x62f.google.com with SMTP id z5so846768plg.8
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 00:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=h/itlCl8riAsYoX+wyL8G+DbZDAQG7AphHsbod/oxJ0=;
 b=pa4pU2LO9ZRW5yxWixnYOsuj2iCwoaE2WId0/8rj+QTm7iEN0/ORblj4W8ea+33vrZ
 fjGbJN7+/SlNHsWgi5CEk2lErI+6OAkrjaD2xoBfL45RTu5yrqxbTtE9J4uNmWvCXfw/
 3B/d/DmJbxHbhYPH59G8SW0A2Uu7SCgi1ayM3iJ3KDb4+q05yjlORQRJtP1/JOv4JIBt
 RhyUC8qASyVzn3j+ZpC0pfkMjhDWghtS4G2Jbx1m0PPo3Hb2k7DN5pKg7BhcM2dJwYIg
 WYLgy/+XdLAva2D136XIz9LqJwDkKndpTEvEqbUrYxrwe6PIkiqsLiyXxK7SuC02+nb2
 xk2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h/itlCl8riAsYoX+wyL8G+DbZDAQG7AphHsbod/oxJ0=;
 b=X40868sZTSqr6eptgbT+Plg8do6Q/GExm0LuUEBlJf52lqBtJ5jxk7VTgACWESjbYx
 0edk5Wn4YcyXGiv/EFSfGLYHm74PuS4W+NyymbHrUNkTBlB+jHdsYQUIk4yy9poBEttn
 4XMksbGcWur5twH0OB96eFc7bQCKy6W4hhK+QGBy8TrH86eePdb+pyBftcwN8ZxOdKa0
 dd22mjfcCtGHZhi8oMYsfn18OYn+10B7E9RAI6juPmR1NP4zlUUqlQ2JGLal57rmuLxS
 AVJytHC6d+9qvKrwKsxr7P7gvMflZPsb4nSEIirk9vBeluFFKEMTH0zJ7x52rUKZSVt/
 XsRA==
X-Gm-Message-State: AOAM533SJX8DcZH1Qr9x64Ut1HchR5eXptNvtG3aobIY5rB+bqbUpZnz
 Vy0iPnd71ojxUg8GAJTI/Q0rtQ==
X-Google-Smtp-Source: ABdhPJwmRfjc78IGBsua+SvimUV1F5gUerJ6S9EokSdUN6NZeF+F0b9An92ne9KS5vK6/nRc0qp7PQ==
X-Received: by 2002:a17:902:a5c6:b0:149:c926:7c31 with SMTP id
 t6-20020a170902a5c600b00149c9267c31mr13576663plq.141.1643012183154; 
 Mon, 24 Jan 2022 00:16:23 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id r11sm15471819pff.81.2022.01.24.00.16.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 00:16:22 -0800 (PST)
Subject: Re: [PATCH] meson: Use find_program() to resolve the entitlement.sh
 script
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220122002052.83745-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b7c904ac-5246-79b8-bcc7-5b7a377e0d52@linaro.org>
Date: Mon, 24 Jan 2022 19:16:18 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220122002052.83745-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/22/22 11:20 AM, Philippe Mathieu-Daudé via wrote:
> Using ../configure without any particular option generates 31 targets
> on Darwin, and meson search for the entitlement.sh script 31 times:
> 
>    Program nm found: YES
>    Program scripts/undefsym.py found: YES (/opt/homebrew/opt/python@3.9/bin/python3.9 /Code/qemu/scripts/undefsym.py)
>    Program scripts/feature_to_c.sh found: YES (/bin/sh /Code/qemu/scripts/feature_to_c.sh)
>    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>    Configuring 50-edk2-i386-secure.json using configuration
>    Configuring 50-edk2-x86_64-secure.json using configuration
> 
> Use find_program() which seems to cache the script path once found.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   meson.build | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


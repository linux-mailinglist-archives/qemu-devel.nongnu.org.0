Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAAB2DC697
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 19:36:14 +0100 (CET)
Received: from localhost ([::1]:35380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpben-00038y-MO
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 13:36:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpbae-000825-Nb
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 13:32:00 -0500
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:38830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpbaa-0001ej-Sv
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 13:31:56 -0500
Received: by mail-oi1-x232.google.com with SMTP id x13so19586615oic.5
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 10:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DSVAhYm8P85HjTQTQdKL+xjPYH2kCnjgdjH7F+F6lTw=;
 b=Fj+Ot5MtK2SZsfivSXD2QaIs1k8AdkBox7C6l4kU1jqbHXyP/O6RAstTZdkIcjN8LT
 Olfx3d/WjY0fXW72m+g2RFx8uGdrDmsYFiAVi/NU2UlVmuArcnhIF2w476RP1B8Sg8mF
 MFIaDbnfBMWkLgBy+QPmlpzdtOYZnGYxmcsN+KK/fcQiZDE+BLqw4qrpKD8EyicmLSyR
 zprIOzbNY1kXCyzf5O70FQYx5uKzQdIfjeshuT4c4EnXiQT32ZY4329LBXLWdFWGILMU
 NuT7i8VSMTAWuAGp+0Jq76TgnSiXHYVDwISHQdQOYraytRdOSP1IQdSks1tSPlJLZoSC
 BHxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DSVAhYm8P85HjTQTQdKL+xjPYH2kCnjgdjH7F+F6lTw=;
 b=mzYKxdts7yqhXEvMfkYCt0f4qhEIug8DkR1hybpjspSnRgSC7oH8RosPv4na4pNaX1
 9O6uaUaNfIfz3C0KFu5OUd2Fs72YGpRvU/W7xjRKLuCX4cJMULRDP37oU31wRU5hG3bg
 93dUl/1A1Xl/rkjDA6FvPp+OoeDlYmrp4IjS3UAdwhcMCPs7F+m+rPg3xLSigrr9gpxG
 vABwlXjNaViZoWqRRYlaqCSbP7z0DI3bSS4MVXs0q1TGiv4ITyH/zrqS6zoceJN4G4um
 FDJcV23osRs2KF3GjGNzN+7YdBU80bZWcOLDDbyLHZ8CNbNlcZpvbQd7yUq09+b3PSM8
 AOqg==
X-Gm-Message-State: AOAM533QJxFM1rI8SC22a0399ieSRjMJK4VL3DE7Uv4GIhDXWfxNVpg9
 jJakudV2JN/Z2SwpehGoWYD8dA==
X-Google-Smtp-Source: ABdhPJzBmRbep9t7vkoaGOAC+QfmQAwaVuehE4sJo8vYHCvinvshmPga6SVnIH3kYR3RpJ5+rQ0uxw==
X-Received: by 2002:aca:c4c2:: with SMTP id u185mr2627946oif.177.1608143511715; 
 Wed, 16 Dec 2020 10:31:51 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id s23sm725583oot.0.2020.12.16.10.31.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 10:31:51 -0800 (PST)
Subject: Re: [RFC v2 15/15] target/riscv: rvb: support and turn on B-extension
 from command line
To: Kito Cheng <kito.cheng@sifive.com>, Frank Chang <frank.chang@sifive.com>
References: <20201216020150.3157-1-frank.chang@sifive.com>
 <20201216020150.3157-16-frank.chang@sifive.com>
 <CALLt3Thrw7pRGPgLa2upS6ZUa87H2UAKYMw-yyC2wkHEfF3Epw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8bbf77c9-4346-a603-a8c7-7b2d3127b246@linaro.org>
Date: Wed, 16 Dec 2020 12:31:48 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CALLt3Thrw7pRGPgLa2upS6ZUa87H2UAKYMw-yyC2wkHEfF3Epw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x232.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/20 3:14 AM, Kito Cheng wrote:
> Hi Alistair, Frank:
> 
> Should we add the bext_spec option like Vector-ext? I would suggest
> adding one to align the behavior between V and B.
> But I have no strong opinion for this.
> 

I don't think there's any point in that.  The experimental extension will be
updated without backward compatibility until it reaches 1.0.  After which we
could add one, *if* we expected there to be future incompatible changes.


r~


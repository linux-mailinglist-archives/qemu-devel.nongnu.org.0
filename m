Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CC63F4F6F
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 19:22:19 +0200 (CEST)
Received: from localhost ([::1]:43432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIDeM-0000lW-FN
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 13:22:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIDdA-00005K-8t
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 13:21:04 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:53205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIDd5-0006yh-Ps
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 13:21:03 -0400
Received: by mail-pj1-x1032.google.com with SMTP id h1so6565032pjs.2
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 10:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=im4Eea6xuRxel8DK8h8uKN6KfYaMV0LsYWjB9veK23E=;
 b=UtgQdlKoeyVrzoVmKGUpYVhwZCRrMwZvWVc9gPATUP4GYGUkkX9bYE4BVOvneB0kFS
 tVj84cPcUXbYVAD1SPNYGWTFKN/V5GuGCW/NFTzQD5J3nvVePS8+rBa98Dbar4n5m+M2
 0zRr1KfxYV/6b+tS68p9JdLQA9pmzal2z45EgZmyIQOh1rxNaPcYPpvuJD23Iv9E04+C
 NdDrBVifFxQzq9SG0DzG28qAn15eJnIvMaeUKlRaY4X0PcCwQlmAP64EReRpbl/bbcqQ
 MhE1YRRL0VBjBM+jzAh41LVzcurl2kZu4NmpXtbBp9/6U594FFUIEToBdgsTa2xR8LCL
 R74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=im4Eea6xuRxel8DK8h8uKN6KfYaMV0LsYWjB9veK23E=;
 b=gex1pTOjwbpsDSkM8M/tmHkVnwCOVdY3fR8ob54WiU1O4Fdw0Iib/0Zo7uy5IIKIbW
 MiVPnVCc7aTvrXsFvgF61J2Bj+ekmMLTnXAgZNxKoPFWPXJclsg3Trhf3isN31F8+7DT
 X8H8b0ZfisZYEvXK8usI/6TMoJ/Pk5pcHx+WP7uScRRUcxkPyAFhMtINkIxEQL94EPGg
 hMZwYCbd60ceuGc7tfUC0i8hjo5wHL7SOeEjOOykB9naoDqdshdcWz7lWSbwq7uQBJXP
 MNzuqbThR9zAqxgDc+KKRQDgqZ/aqnk+tLWOW0/rXe1DvhM6Ue4PUnRuh17O2gldEw28
 U6jw==
X-Gm-Message-State: AOAM531zMUkfDnMRPrr2jXjX7ZCehCAyxzW334dwy9HwdTgDpLONsz0V
 yGXMGUaD9W+U2oqHI2H1HoF3kw==
X-Google-Smtp-Source: ABdhPJxnvYGcGfaJeJvUgivCP+A67aEMCt6F1Jxe9E+jkfj2aM9Vze3CvFU8SaM8d/QDSLziI3KEaA==
X-Received: by 2002:a17:90a:c085:: with SMTP id
 o5mr20754739pjs.113.1629739258372; 
 Mon, 23 Aug 2021 10:20:58 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id d17sm16575791pfn.110.2021.08.23.10.20.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 10:20:58 -0700 (PDT)
Subject: Re: [PATCH v3 08/15] target/riscv: Reassign instructions to the
 Zbb-extension
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20210823164038.2195113-1-philipp.tomsich@vrull.eu>
 <20210823164038.2195113-9-philipp.tomsich@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <550693f6-82b6-d4a7-d7f2-cad3a3c74982@linaro.org>
Date: Mon, 23 Aug 2021 10:20:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823164038.2195113-9-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.023,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/23/21 9:40 AM, Philipp Tomsich wrote:
> This reassigns the instructions that are part of Zbb into it, with the
> notable exceptions of the instructions (rev8, zext.w and orc.b) that
> changed due to gorci, grevi and pack not being part of Zb[abcs].
> 
> Signed-off-by: Philipp Tomsich<philipp.tomsich@vrull.eu>
> ---
> 
> Changes in v3:
> - The changes to the Zbb instructions (i.e. use the REQUIRE_ZBB macro)
>    are now in a separate commit.
> 
>   target/riscv/insn32.decode              | 40 ++++++++++----------
>   target/riscv/insn_trans/trans_rvb.c.inc | 50 ++++++++++++++-----------
>   2 files changed, 49 insertions(+), 41 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


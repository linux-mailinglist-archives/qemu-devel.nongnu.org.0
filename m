Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6CA58B2E5
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Aug 2022 01:48:58 +0200 (CEST)
Received: from localhost ([::1]:44938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oK73o-0005eR-Eb
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 19:48:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oK72S-0004Dg-DY
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 19:47:32 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:43907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oK72Q-0001rv-LD
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 19:47:32 -0400
Received: by mail-pf1-x434.google.com with SMTP id u133so3478817pfc.10
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 16:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:references:in-reply-to:content-transfer-encoding;
 bh=V77OkRAlGlhinbQwQguzIGAYQu2U1+dnm+4U1lFHz1g=;
 b=aGIPAkuz7fRdX8+cPVZM52yH449vCgSFpNL3dZk2EI6NLMbaViapGYSM3we1ruyNh6
 B0FgEvIV9rZeRiPA16kXzxBXHwZupGxg373UAkYsG0Ilhi0BrJXfOOlyxcVRcVDjQM0Q
 wJj3nC4QzHrg4n8uYmVauQNz9osEcKEKSA+qUTogXt2Wxp5Hd8J+E2hC56Z6QhIcHjNW
 30Sh4y0dFPuMooLOYlOeWKw6/LIwmYxdL+UElR1uRfSJsPf1YwMxf6777B39+SOsouzN
 qkDnWSSXSS47UwBhPV9hE+0MJTNlQlFmwg2gv8xMvECa8YqDA9S/UA7VTd0byL0JSAYC
 E1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:references:in-reply-to
 :content-transfer-encoding;
 bh=V77OkRAlGlhinbQwQguzIGAYQu2U1+dnm+4U1lFHz1g=;
 b=vF5Jb0k9UaZ4qvH8O652W2k0LM9F8WB5itdr3ekTNXU8swu/NrSXfqW6vRtIRrlcyC
 chCM/dayPhzLsfPMm6rfyyToaXwHQI728kXe1EzZl1R3Pvp3+pvpA1IzjJ5s0WGbUW6n
 l+c6v8v3vfKiTHmGN8aDI7M8BHm8ET42km9oF0pC3j27lAOsshRW5nG5FtSx2QlODnw1
 7uJmPEFPDZ88cWwkMZ0UmJHSWPV8eTnOvhw/CxTA1ZMiwg4VcW6smkxV7lJDfJpMi/CJ
 rgGvGJIe1/iD/+I8UBdZNs3riRuGuDyjaZtHUNYK53i2AY4vRwSczXLyU1aaSiNewMlD
 543Q==
X-Gm-Message-State: ACgBeo1PwZd3ZQtNhLz/BnbqPpiZPD11F+N9UFyrC2kgchghuujdAlQM
 UALpkrldnazvDziM8ZVjZfSrjv5vPgKjuA==
X-Google-Smtp-Source: AA6agR73F7rpZXlhXWdR1XXLC3GbpnhkA9f6KlTpxdUXEaZ9W2IDBdXBiNnKu7AFRq8Ipyk9JPolcg==
X-Received: by 2002:aa7:8195:0:b0:52c:7d6a:e89d with SMTP id
 g21-20020aa78195000000b0052c7d6ae89dmr9157926pfi.69.1659743248598; 
 Fri, 05 Aug 2022 16:47:28 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:abf8:e436:f4c:9089?
 ([2602:ae:154e:e201:abf8:e436:f4c:9089])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a170903111200b001640aad2f71sm3616171plh.180.2022.08.05.16.47.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 16:47:28 -0700 (PDT)
Message-ID: <eaaff99b-4ade-ec9b-d026-8a71aa874923@linaro.org>
Date: Fri, 5 Aug 2022 16:47:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 0/7] loongarch patch queue
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20220805195515.349768-1-richard.henderson@linaro.org>
In-Reply-To: <20220805195515.349768-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/5/22 12:55, Richard Henderson wrote:
> The following changes since commit 09ed077d7fae5f825e18ff9a2004dcdd1b165edb:
> 
>    Merge tag 'trivial-branch-for-7.1-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2022-08-04 17:21:13 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/rth7680/qemu.git tags/pull-la-20220805
> 
> for you to fetch changes up to 2f149c759ff352399e7a0eca25a62388822d7d13:
> 
>    target/loongarch: Update gdb_set_fpu() and gdb_get_fpu() (2022-08-05 10:02:40 -0700)
> 
> ----------------------------------------------------------------
> LoongArch updates:
>    Store value in SET_FPU_* macros.
>    Fix unused variable Werrors in acpi-build.c
>    Update xml to match upstream gdb.

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Qi Hu (1):
>        target/loongarch: Fix macros SET_FPU_* in cpu.h
> 
> Song Gao (6):
>        hw/loongarch: remove acpi-build.c unused variable 'aml_len'
>        target/loongarch: Fix GDB get the wrong pc
>        target/loongarch: add gdb_arch_name()
>        target/loongarch: update loongarch-base64.xml
>        target/loongarch: Update loongarch-fpu.xml
>        target/loongarch: Update gdb_set_fpu() and gdb_get_fpu()
> 
>   configs/targets/loongarch64-softmmu.mak |  2 +-
>   target/loongarch/cpu.h                  | 18 +++++++++--
>   target/loongarch/internals.h            |  3 ++
>   hw/loongarch/acpi-build.c               | 11 +------
>   linux-user/loongarch64/signal.c         | 24 ++------------
>   target/loongarch/cpu.c                  |  8 ++++-
>   target/loongarch/gdbstub.c              | 43 +++++++++++++++++++------
>   gdb-xml/loongarch-base64.xml            | 13 ++++----
>   gdb-xml/loongarch-fpu.xml               | 50 +++++++++++++++++++++++++++++
>   gdb-xml/loongarch-fpu64.xml             | 57 ---------------------------------
>   10 files changed, 119 insertions(+), 110 deletions(-)
>   create mode 100644 gdb-xml/loongarch-fpu.xml
>   delete mode 100644 gdb-xml/loongarch-fpu64.xml



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5B82DCE86
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 10:38:39 +0100 (CET)
Received: from localhost ([::1]:40320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kppk6-0001mH-3p
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 04:38:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kpphr-0000mR-3g
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:36:19 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:47489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kppho-00064x-5R
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:36:18 -0500
Received: from [192.168.100.1] ([82.252.144.198]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MsZeX-1jwE0q0nvv-00u0yq; Thu, 17 Dec 2020 10:36:07 +0100
Subject: Re: [PATCH v5 0/6] linux-user: Rework get_elf_hwcap() and support
 MIPS Loongson 2F/3A
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201214003215.344522-1-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <11b38723-32e5-0a5e-a5a8-54764232629c@vivier.eu>
Date: Thu, 17 Dec 2020 10:36:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201214003215.344522-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:aCYVuuvtZ8cMVB28qyJwxQufnmiDwp2wZiM82IxGyjAuiA0vZef
 WY3sbKuB+5A1Ad4yOCtljSwICDymLoNYBTht8DAGg40QjMvX/Nq9xkB01EzMmq0R5NIfJz+
 DSKCPF5gXEu+kC8ERovLmYoDyLnXf5J1g6WBfXnqf8fKL/oaxwQENETG9wZTotbRQDLCnP7
 6i98qdJICOZj3Dr7PAfXA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2lB0jo/BE6g=:UIhIdanMNUhuTUp1FFkoXG
 wuYyWNanFGKxr+cIMXVQCXCM8SkIcU+sjdXh14JRheCDwrJKCwBXeW9aUjTDmIhKj2BOXUv0c
 ZHR+Hki+1W9zEUYBvSiDVuXStAjAYzmqAubJKcgQ0AttVweqetDmY3UinobBKWhfU1i1OKULk
 gOryVgcFQ5q0T9DXQsOeW020qwItR2Nn2szyJX769zsaQJELM8d9VAmIwJ9czXWwxksUe3Kmq
 OpI5834AvRLF/jxlnJKiQdY0ZuPQm+RoxpRsDJTFHlcDyKpLFGIDKXcIaMWYrlNblQ5NXDuBt
 sZZmHvnf6SEhO+/dm3M6IMy4FHoHg5sabe9veWxq9d18TB3JdgYcCPQW6DO6YYagJjrlltG2N
 k9DWlOfaGmujAGE1hb+90yNYsS9d82P/5hDY1FeV/3a5RS8KU7r3uwhQEhMwG
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 14/12/2020 à 01:32, Philippe Mathieu-Daudé a écrit :
> Series now fully reviewed.
> 
> Since v5:
> - Dropped MAINTAINERS patch =)
> 
> Since v4:
> - Fixed yet another typo...
> 
> Since v3:
> - Add CP0C0_AR_LENGTH definition (Richard)
> - Fixed 3E -> 3A, Longsoon -> Loongson typos (Huacai)
> 
> Since v2:
> - Use extract32() in GET_FEATURE_REG_EQU (rth)
> 
> Introduce the GET_FEATURE_REG_SET() and GET_FEATURE_REG_EQU()
> macros to check if an instruction set is supported by a CPU
> using CP0 read-only bits (instead of QEMU insn_flags which
> is not always coherent - we might remove it soon).
> 
> Use these macros to test for MSA ASE and Release 6.
> 
> Update the ELF HWCAP bits and set the Loongson instructions
> so we can run 2F/3A userland binaries.
> 
> Philippe Mathieu-Daudé (6):
>   linux-user/elfload: Move GET_FEATURE macro out of get_elf_hwcap() body
>   linux-user/elfload: Rename MIPS GET_FEATURE() as GET_FEATURE_INSN()
>   linux-user/elfload: Introduce MIPS GET_FEATURE_REG_SET() macro
>   linux-user/elfload: Introduce MIPS GET_FEATURE_REG_EQU() macro
>   linux-user/elfload: Update HWCAP bits from linux 5.7
>   linux-user: Add support for MIPS Loongson 2F/3A
> 
>  target/mips/cpu.h    |  1 +
>  linux-user/elfload.c | 43 ++++++++++++++++++++++++++++++++++++-------
>  2 files changed, 37 insertions(+), 7 deletions(-)
> 

Series applied to my linux-user-for-6.0 branch

Thanks,
Laurent


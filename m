Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D7F702CE1
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 14:40:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyXUS-000734-KM; Mon, 15 May 2023 08:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pyXUP-00071o-GG
 for qemu-devel@nongnu.org; Mon, 15 May 2023 08:39:45 -0400
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pyXUL-0004V2-6m
 for qemu-devel@nongnu.org; Mon, 15 May 2023 08:39:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To
 :Reply-To:Subject:From:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UUSqc98fRDjg4ZSbB/OxiSjW8ku9vrW12Nd+aoRoiZ8=; b=TVNsQ3MYXpJH1caRMWj40Xqo5N
 6UhM8S25+dEnRFXDya/r1KWRjROJh8U0nsHe0t46oXAHkNhKM9Tw36xwyxB4r5zKhEE6gubqWpWlx
 zWG5HS+US9RkKEhaGuC39luiwIqP6UFaQYEjVYpJiHmqWM1sP7+83xVWltO/OmIIchjc=;
Message-ID: <cd74cfb8-1767-1832-292d-1b827c0613b8@rev.ng>
Date: Mon, 15 May 2023 14:39:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 31/84] tcg: Add page_bits and page_mask to TCGContext
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
 <20230503072331.1747057-32-richard.henderson@linaro.org>
Content-Language: en-US
Organization: rev.ng
In-Reply-To: <20230503072331.1747057-32-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.811,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Reply-to:  anjo@rev.ng
X-ACL-Warn: ,  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 5/3/23 09:22, Richard Henderson wrote:
> Disconnect guest page size from TCG compilation.
> While this could be done via exec/target_page.h, we want to cache
> the value across multiple memory access operations, so we might
> as well initialize this early.
>
> The changes within tcg/ are entirely mechanical:
>
>      sed -i s/TARGET_PAGE_BITS/s->page_bits/g
>      sed -i s/TARGET_PAGE_MASK/s->page_mask/g
>
> Signed-off-by: Richard Henderson<richard.henderson@linaro.org>
> ---
>   include/tcg/tcg.h                |  5 +++++
>   accel/tcg/translate-all.c        |  4 ++++
>   tcg/aarch64/tcg-target.c.inc     |  6 +++---
>   tcg/arm/tcg-target.c.inc         | 10 +++++-----
>   tcg/i386/tcg-target.c.inc        |  6 +++---
>   tcg/loongarch64/tcg-target.c.inc |  4 ++--
>   tcg/mips/tcg-target.c.inc        |  6 +++---
>   tcg/ppc/tcg-target.c.inc         | 14 +++++++-------
>   tcg/riscv/tcg-target.c.inc       |  4 ++--
>   tcg/s390x/tcg-target.c.inc       |  4 ++--
>   tcg/sparc64/tcg-target.c.inc     |  4 ++--
>   11 files changed, 38 insertions(+), 29 deletions(-)
Reviewed-by: Anton Johansson <anjo@rev.ng>


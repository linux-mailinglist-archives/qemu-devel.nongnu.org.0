Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF8E417F89
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 05:53:18 +0200 (CEST)
Received: from localhost ([::1]:33414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTykX-0006RQ-8R
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 23:53:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mTyjF-0005lo-5Y
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 23:51:57 -0400
Received: from [115.28.160.31] (port=48296 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mTyjC-00011M-6I
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 23:51:56 -0400
Received: from [192.168.9.172] (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 8064F60B2C;
 Sat, 25 Sep 2021 11:51:46 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632541906; bh=RmKBAJUlxb7uTRxvkwk7mwb5nVJFNvAh9ziDPaWWNtQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=xHOPhLpqUBFh9lK3CI5L01krVL27hqQaPNQV04Pf3KTLpfpolBAHh8Sm/yEuCnuL/
 DRESzUFkMkO0PSR0g9JM8Lp+fWByTm+S1AzuAemIvrEAHl7pWGyZXwOAIS650y8I0w
 lM+l8SxRzOvs5/G1JwuvGZi83KUBPM7HzCxXn+eE=
Message-ID: <313df1b0-9edf-7333-da46-7342ca308dfb@xen0n.name>
Date: Sat, 25 Sep 2021 11:51:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0a1
Subject: Re: [PATCH v5 04/30] tcg/loongarch64: Add generated instruction
 opcodes and encoding helpers
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20210924172527.904294-1-git@xen0n.name>
 <20210924172527.904294-5-git@xen0n.name>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <20210924172527.904294-5-git@xen0n.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 115.28.160.31 (failed)
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

On 9/25/21 01:25, WANG Xuerui wrote:
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/loongarch64/tcg-insn-defs.c.inc | 979 ++++++++++++++++++++++++++++
>   1 file changed, 979 insertions(+)
>   create mode 100644 tcg/loongarch64/tcg-insn-defs.c.inc
This patch series is only lacking Reviewed-by tag for this commit now; 
may I ask whose review do I additionally need to get this across the 
finish line? Or is this series waiting for upstream merge of toolchain 
and kernel support too?


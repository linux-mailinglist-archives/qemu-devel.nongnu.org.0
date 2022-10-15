Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C38C5FFABE
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Oct 2022 17:07:56 +0200 (CEST)
Received: from localhost ([::1]:56884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojilW-0006Wq-Oq
	for lists+qemu-devel@lfdr.de; Sat, 15 Oct 2022 11:07:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1ojikC-0004iC-2I
 for qemu-devel@nongnu.org; Sat, 15 Oct 2022 11:06:32 -0400
Received: from mail.xen0n.name ([115.28.160.31]:49678
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1ojik7-0001ed-0P
 for qemu-devel@nongnu.org; Sat, 15 Oct 2022 11:06:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
 t=1665846364; bh=NF0Ok+YNg77HF4cOQZNFJ54N+w4oHQrxNx7ETrFLjro=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FfoGfrTMzencFLTXIeDc2c05/51AjTgH1ZPawR6cDmgW8WaM/uYCBRVS9suy7Ulz+
 xxn1uYmbLJlBWS+FejYpgLHXYTxwdMPGqR/YI5KftQZ5mYtLkpKyk2B4ZZmGD8ZN4i
 tZvPCUPAm5RmJ6ht9pFi+LNGL3tc35zGRRfBfyZo=
Received: from [192.168.9.172] (unknown [101.88.135.226])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 5014460132;
 Sat, 15 Oct 2022 23:06:04 +0800 (CST)
Message-ID: <c76d732c-b7b6-8d6a-3b56-d13be268f18b@xen0n.name>
Date: Sat, 15 Oct 2022 23:06:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:107.0) Gecko/20100101
 Thunderbird/107.0a1
Subject: Re: [PATCH v4] tcg/loongarch64: Add direct jump support
Content-Language: en-US
To: Qi Hu <huqi@loongson.cn>, WANG Xuerui <git@xen0n.name>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
References: <20221015092754.91971-1-huqi@loongson.cn>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <20221015092754.91971-1-huqi@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.961,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/15/22 17:27, Qi Hu wrote:
> Similar to the ARM64, LoongArch has PC-relative instructions such as
> PCADDU18I. These instructions can be used to support direct jump for
> LoongArch. Additionally, if instruction "B offset" can cover the target
> address(target is within ±128MB range), a single "B offset" plus a nop
> will be used by "tb_target_set_jump_target".
>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Qi Hu <huqi@loongson.cn>
> ---
> Changes since v3:
> - Fix the offset check error which is pointed by WANG Xuerui.
> - Use TMP0 instead of T0.
> - Remove useless block due to direct jump support.
> - Add some assertions.
> ---
>   tcg/loongarch64/tcg-target.c.inc | 48 +++++++++++++++++++++++++++++---
>   tcg/loongarch64/tcg-target.h     |  9 ++++--
>   2 files changed, 50 insertions(+), 7 deletions(-)

Richard may want to double-check for restoring his R-b, but this looks 
good to me now. Thanks!

Reviewed-by: WANG Xuerui <git@xen0n.name>



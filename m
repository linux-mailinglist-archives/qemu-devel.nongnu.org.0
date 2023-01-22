Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F42676B9C
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Jan 2023 09:26:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJVfS-0000NN-II; Sun, 22 Jan 2023 03:25:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1pJVfO-0000Mm-C5
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 03:25:30 -0500
Received: from mail.xen0n.name ([115.28.160.31] helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1pJVfL-0004FS-4i
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 03:25:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
 t=1674375917; bh=MCSsubis0Afv+Ds5piI2sNMY5XLzxHVPmfBZvDrqm9E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=pE8tIs7sE0I+h6fr1SivODaZsf4hSC+TTeplJ+yg0R4MaPM8ORpV+fLvyP67Qa5/j
 aERpy66zazRQ8E+Vnz+Bl3gdCxBrRn5m3J3Eid1i4K+p3YDQEJL8xqt5YLfM6pCAax
 56PGoPrywn7H+4cjXD0O+JaSGtOYAdHsdV6sIJ0k=
Received: from [192.168.9.172] (unknown [101.88.135.165])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 7BD2460132;
 Sun, 22 Jan 2023 16:25:17 +0800 (CST)
Message-ID: <af3908a9-4ed3-a22c-2765-3b88aa254d23@xen0n.name>
Date: Sun, 22 Jan 2023 16:21:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101
 Firefox/111.0 Thunderbird/111.0a1
Subject: Re: [PATCH v2 04/10] tcg/loongarch64: Optimize immediate loading
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: git@xen0n.name, Rui Wang <wangrui@loongson.cn>
References: <20230118011123.392823-1-richard.henderson@linaro.org>
 <20230118011123.392823-5-richard.henderson@linaro.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <20230118011123.392823-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/18/23 09:11, Richard Henderson wrote:
> From: Rui Wang <wangrui@loongson.cn>
>
> diff:
>    Imm                 Before                  After
>    0000000000000000    addi.w  rd, zero, 0     addi.w  rd, zero, 0
>                        lu52i.d rd, zero, 0
>    00000000fffff800    lu12i.w rd, -1          addi.w  rd, zero, -2048
>                        ori     rd, rd, 2048    lu32i.d rd, 0
>                        lu32i.d rd, 0
>    ...
>
> Signed-off-by: Rui Wang <wangrui@loongson.cn>
> Message-Id: <20221107144713.845550-1-wangrui@loongson.cn>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/loongarch64/tcg-target.c.inc | 35 +++++++++++---------------------
>   1 file changed, 12 insertions(+), 23 deletions(-)

Reviewed-by: WANG Xuerui <git@xen0n.name>

Thanks!



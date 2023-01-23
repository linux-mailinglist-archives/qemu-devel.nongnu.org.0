Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD9C677625
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 09:13:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJrwW-0008Ll-S5; Mon, 23 Jan 2023 03:12:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1pJrwR-0008LH-BD
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 03:12:36 -0500
Received: from mail.xen0n.name ([115.28.160.31] helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1pJrwM-0006du-VW
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 03:12:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
 t=1674461545; bh=8whbZ5/nO4YObsJ3W1JSa2dAIUkYsI3/Zc82T1zK5oU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=F3gi+qFo2qpoYL6JqfbCoX4RWQOhXebxLajmRov/Lcn94n3ycUrQEd3dBWFLPYSv4
 3C8zfuMNP5Pa884isu01gXb2U7/gYrGX8zcfAX7iumu9wLav/TxpidIqCGjMECNtom
 hCSMLO8M/75P4HnlNmHc304fwWdldwFrVmFFylus=
Received: from [192.168.9.172] (unknown [101.88.135.165])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 3919D600BD;
 Mon, 23 Jan 2023 16:12:25 +0800 (CST)
Message-ID: <3491d124-1f56-96a6-ec98-b181dffc5611@xen0n.name>
Date: Mon, 23 Jan 2023 14:52:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101
 Firefox/111.0 Thunderbird/111.0a1
Subject: Re: [PATCH v2 06/10] tcg/loongarch64: Introduce tcg_out_addi
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: git@xen0n.name
References: <20230118011123.392823-1-richard.henderson@linaro.org>
 <20230118011123.392823-7-richard.henderson@linaro.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <20230118011123.392823-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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
> Adjust the constraints to allow any int32_t for immediate
> addition.  Split immediate adds into addu16i + addi, which
> covers quite a lot of the immediate space.  For the hole in
> the middle, load the constant into TMP0 instead.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/loongarch64/tcg-target-con-set.h |  4 +-
>   tcg/loongarch64/tcg-target-con-str.h |  2 +-
>   tcg/loongarch64/tcg-target.c.inc     | 57 ++++++++++++++++++++++++----
>   3 files changed, 53 insertions(+), 10 deletions(-)

I've checked some generated code and this indeed benefits.

Reviewed-by: WANG Xuerui <git@xen0n.name>



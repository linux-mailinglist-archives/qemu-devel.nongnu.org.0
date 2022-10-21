Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0514D606C6D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 02:18:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olfkM-0001FB-Kp
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 20:18:46 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olfem-0005d3-Gu
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 20:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@xen0n.name>) id 1olfef-0005ZQ-1i
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 20:12:53 -0400
Received: from mail.xen0n.name ([115.28.160.31] helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@xen0n.name>) id 1olfea-0008On-IR
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 20:12:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
 t=1666310657; bh=moV3m3buHul7BkNkY8dS5gJ7pUiL6CFAikVbEmbjB0A=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=qQlosNnl6MzzmeKBhzJPyTA9K0O/t1+RW5ECC8R+UJjN5DVE1JLnIzpQ1iuzNiXNe
 XpTrB7fWVtLCtu08yUv4bCoT+kX1H3ts55+vFNE8zLqOTqQ31fMDrQ7AskijVg4Xjh
 ivbqUbqDIhfZuH7WY3k0lYBGsOF8lANytW7etSeE=
Received: from [127.0.0.1] (unknown [101.88.135.226])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id B9E8C600DA;
 Fri, 21 Oct 2022 08:04:17 +0800 (CST)
Date: Fri, 21 Oct 2022 08:04:17 +0800
From: WANG Xuerui <i@xen0n.name>
To: Richard Henderson <richard.henderson@linaro.org>, Qi Hu <huqi@loongson.cn>,
 WANG Xuerui <git@xen0n.name>
CC: qemu-devel@nongnu.org
Subject: Re: [PATCH v4] tcg/loongarch64: Add direct jump support
User-Agent: K-9 Mail for Android
In-Reply-To: <9a9fea07-2242-5aff-ea94-cfc119207f09@linaro.org>
References: <20221015092754.91971-1-huqi@loongson.cn>
 <9a9fea07-2242-5aff-ea94-cfc119207f09@linaro.org>
Message-ID: <A99B67E2-6F23-40CA-807C-A66366D0C533@xen0n.name>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On October 21, 2022 6:42:58 AM GMT+08:00, Richard Henderson <richard=2Ehen=
derson@linaro=2Eorg> wrote:
>Fixed a minor nit:
>
>> +void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
>> +                              uintptr_t jmp_rw, uintptr_t addr)
>> +{
>> +    tcg_insn_unit i1, i2;
>> +    ptrdiff_t upper, lower;
>> +    ptrdiff_t offset =3D (ptrdiff_t)(addr - jmp_rx) >> 2;
>> +
>> +    if (offset =3D=3D sextreg(offset, 0, 26)) {
>> +        i1 =3D encode_sd10k16_insn(OPC_B, offset);
>> +        i2 =3D NOP;
>> +    } else {
>> +        tcg_debug_assert(offset =3D=3D sextreg(offset, 0, 36));
>
>This assert is smaller=2E=2E=2E
>
>> +/*
>> + * PCADDU18I + JIRL sequence can give 20 + 16 + 2 =3D 38 bits
>> + * signed offset, which is +/- 128 GiB=2E
>> + */
>> +#define MAX_CODE_GEN_BUFFER_SIZE  (128 * GiB)
>
>=2E=2E=2E than the correct calculation here=2E

Actually no=2E=2E=2E the offset above is pre-shifted so 36 is exactly 20 (=
pcaddu18i) + 16 (jirl)=2E The LoongArch assembly gotchas hit hard=2E=2E=2E


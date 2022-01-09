Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43120488885
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 10:37:44 +0100 (CET)
Received: from localhost ([::1]:36844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6Udz-00047m-B5
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 04:37:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n6UTa-0004Yv-F9
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 04:26:58 -0500
Received: from mail.xen0n.name ([115.28.160.31]:55706
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n6UTY-0006KX-Gf
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 04:26:58 -0500
Received: from [192.168.9.172] (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 5218762E73;
 Sun,  9 Jan 2022 17:26:43 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1641720403; bh=LAYNlbuAqI/GNiQrgkz3m2pb9JbN/JkcYEtpYCryTLk=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=tOZc4XmEPzV095lplsm/pV1YUA8pNIwtI/IghD7LdTdhdp6hJkcJP4Xt8DExbERYy
 Eyl4E5GZbuAbVENnzKKYo2FCG/ZWQiQWVo4rb4lxU9YlWLkCniwx5yu70JS13EgKGx
 pYliqtMNBfNh15HLXWD6/nvLVVDe57sdg8mPkq40=
Message-ID: <b4d302ec-4539-8fe0-cf26-cba707b6d39e@xen0n.name>
Date: Sun, 9 Jan 2022 17:25:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:97.0) Gecko/20100101
 Thunderbird/97.0a1
From: WANG Xuerui <i.qemu@xen0n.name>
Subject: Re: [PATCH v14 21/26] linux-user: Add LoongArch syscall support
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20220106094200.1801206-1-gaosong@loongson.cn>
 <20220106094200.1801206-22-gaosong@loongson.cn>
Content-Language: en-US
In-Reply-To: <20220106094200.1801206-22-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 1/6/22 17:41, Song Gao wrote:
> We should disable '__BITS_PER_LONG' at [1] before run gensyscalls.sh
>
>   [1] arch/loongarch/include/uapi/asm/bitsperlong.h
>
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> Reviewed-by: Richard Henderson<richard.henderson@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   linux-user/loongarch64/syscall_nr.h     | 313 ++++++++++++++++++++++++
>   linux-user/loongarch64/target_syscall.h |  48 ++++
>   linux-user/syscall_defs.h               |  10 +-
>   scripts/gensyscalls.sh                  |   1 +
>   4 files changed, 368 insertions(+), 4 deletions(-)
>   create mode 100644 linux-user/loongarch64/syscall_nr.h
>   create mode 100644 linux-user/loongarch64/target_syscall.h

This is exactly what we don't want to merge before the Linux port (and 
glibc) lands; things like UNAME_MINIMUM_RELEASE and the syscall numbers 
certainly need to be updated afterwards. Otherwise everything looks good 
though.

The "struct { ... } csr" part suggested by Philippe is deviating from 
the kernel sources, but the memory layout is the same, and in looking at 
other targets it seems we're not required to keep exact correspondence 
with kernel -- am I right? (Many targets do use the exact definition as 
kernel, e.g. aarch64, though)



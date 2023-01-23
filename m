Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1AC6779E0
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 12:13:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJukt-0005ST-5T; Mon, 23 Jan 2023 06:12:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1pJukp-0005SH-Hj
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 06:12:48 -0500
Received: from mail.xen0n.name ([115.28.160.31] helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1pJukm-00008L-Bq
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 06:12:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
 t=1674472357; bh=DJuZ6qJFwYpu3g45wb7mSI1wQrfljPE8e6DtvmMGJvU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=pyGNDVrUypIZ6TkQ0k/voRZfPuRA47XOed1AMs4rdNG8aWiL4eQwFYTiNotq6BZSV
 JAWrz/9G5RZ/tCivud9tfp44WWuNG+gBZqRRkbY4h5K8M2ovbZTSDDaDblNltmDlVT
 QtpqUhk22k/VaEhBdBeLKR2T+dH1Z+JZrQdzYSyk=
Received: from [192.168.9.172] (unknown [101.88.135.165])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 3724B600BD;
 Mon, 23 Jan 2023 19:12:37 +0800 (CST)
Message-ID: <27abbf00-6fe4-f4f1-f96e-5938e6f4e7c4@xen0n.name>
Date: Mon, 23 Jan 2023 19:12:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101
 Firefox/111.0 Thunderbird/111.0a1
Subject: Re: [PATCH] linux-user: Add support for LoongArch64's old world ABI
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Song Gao <gaosong@loongson.cn>, WANG Xuerui <git@xen0n.name>
References: <20230123102626.4144557-1-i.qemu@xen0n.name>
 <CAFEAcA8iVrpzFnKj6Ws+F63RJSzV-atUbspFQKqsWOtptOxwPw@mail.gmail.com>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <CAFEAcA8iVrpzFnKj6Ws+F63RJSzV-atUbspFQKqsWOtptOxwPw@mail.gmail.com>
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

On 1/23/23 18:47, Peter Maydell wrote:
> On Mon, 23 Jan 2023 at 10:27, WANG Xuerui <i.qemu@xen0n.name> wrote:
>>
>> From: WANG Xuerui <git@xen0n.name>
>>
>> This patch adds a "loongarch64ow-linux-user" target and a
>> corresponding "qemu-loongarch64ow" binary, for supporting user-mode
>> emulation of old-world LoongArch applications in the wild.
>>
>> Although the old-world LoongArch is already being (slowly) phased out,
>> there are already a number of deployments (mainly as a result of
>> LoongArch's early commercial growth), whose migration path is something
>> software developers have to care about. Support for user-mode emulation
>> in addition to system-level emulation would help development of such
>> migration & compatibility solutions.
> 
> Is this 'old-world' ABI supported by the upstream Linux kernel?
> I can't see signs of it from a quick grep. If it isn't, then
> I'm not sure if we should support it in QEMU user-mode emulation.
> We've always set "upstream Linux" as our definition of what the
> official ABI and featureset is for usermode emulation.

No, the old-world is not, and will not be, supported by upstream Linux, 
as it is strictly the premature state of this architecture only born for 
commercial reasons.

After sending the patch I've discussed with several other maintainers of 
various LoongArch ports, and it seems even Loongson the corporation 
itself is seeing to completely abandon old-world development in favor of 
a 100% new world future (which is even more courageous than me, an 
unaffiliated hobbyist user). Given the current old-world deployments all 
have commercial support, it's probably best to leave the migration work 
for them and keep upstream clean of any such legacy.

So I'm dropping this patch now, and thanks for the feedback!


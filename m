Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2504C442602
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 04:25:47 +0100 (CET)
Received: from localhost ([::1]:41334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhkQj-0002Lm-NC
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 23:25:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mhkJk-0004OE-4U
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 23:18:33 -0400
Received: from mail.xen0n.name ([115.28.160.31]:58054
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mhkJf-0007d8-RY
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 23:18:31 -0400
Received: from [100.100.57.93] (unknown [220.248.53.61])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 6B4DD600B0;
 Tue,  2 Nov 2021 11:18:19 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1635823099; bh=kzlVL7JzT+eBgGZQZnMPD/VZ4OVLHEAe0hYICw8jJJY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WpchOICJ6MY/cH5RyNzgd1BfCpSFiDK0/JL3DpWoEBaoBAgIeEvEItel5XOQg7B33
 VnlpJMyy8kmYz1MFIZENZlcNqUYdeB1eVe0hX8MQW4fzYUoxO6VB1JmTMup1StFlkE
 Sp8ShSqrPh3IcY+eZei88uk1e2ouT7sfwfv7YziU=
Message-ID: <7c90bbea-a3d8-9e0d-25d8-77e47eca4aee@xen0n.name>
Date: Tue, 2 Nov 2021 11:18:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:95.0)
 Gecko/20100101 Thunderbird/95.0a1
Subject: Re: [PATCH v8 28/29] accel/tcg/user-exec: Implement CPU-specific
 signal handler for loongarch64 hosts
Content-Language: en-US
To: gaosong <gaosong@loongson.cn>
References: <1635760311-20015-1-git-send-email-gaosong@loongson.cn>
 <1635760311-20015-29-git-send-email-gaosong@loongson.cn>
 <648d74b4-17fe-1f4b-448c-004896b22c17@xen0n.name>
 <117734f6-94b6-17b7-3ffc-78c62a52c9cd@loongson.cn>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <117734f6-94b6-17b7-3ffc-78c62a52c9cd@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.14,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 philmd@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 peterx@redhat.com, laurent@vivier.eu, yangxiaojuan@loongson.cn,
 alistair.francis@wdc.com, maobibo@loongson.cn, pbonzini@redhat.com,
 bmeng.cn@gmail.com, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 2021/11/1 19:21, gaosong wrote:
> Hi Xuerui,
>
> On 2021/11/1 下午6:45, WANG Xuerui wrote:
>> While I can see this patch and the next one are clearly from me, my
>> author info is lost as I didn't spot any "From:" line in the mail body?
>> Also I don't remember seeing "Base-on" tags in QEMU either.
>
> Sorry,  I refer to the commit 35f171a2eb25fcdf1b719c58a61a7da15b4fe078
>
> It seems that the reference is wrong.  I 'll correct it.
My patch series haven't gone into upstream yet, so I'm pretty sure this
commit hash would change in the final merged version. I think basing
your whole series on top of mine should be okay; mine has been
completely reviewed and IIUC only waiting for a test-purpose Docker
builder image before it can be merged, so the code should be fairly
stable and friendly for rebases.
>
>> I think you're meaning to include the "Based-on" tags in your cover
>> letter instead?
>
> I should take this way,  Sorry Again,
>
Never mind; you could of course use more caution when it comes to Git
operations later.


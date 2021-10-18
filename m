Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68678432656
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 20:27:03 +0200 (CEST)
Received: from localhost ([::1]:52494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcXLi-0006Yt-Ic
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 14:27:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mcXDJ-0002L4-0v
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 14:18:23 -0400
Received: from [115.28.160.31] (port=37432 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mcXDE-0001a2-JX
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 14:18:20 -0400
Received: from [192.168.9.172] (unknown [101.88.135.223])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 6455460AEF;
 Tue, 19 Oct 2021 02:18:06 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1634581086; bh=DB5VrN/9ZGB4UAMZCCpnnM48hjpgt0FF7fesHvqdXus=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mBa/MT63ECZbvaAo5KAspk9AZ4CUKgrY0WZITqDoXALYgWHRZXPiCXtgveiUM9jwz
 CXGueLMJKT+l29GSW2stPQu6hHqQkbEScmMJp3Ni4u9QjXiBOS+s06Gv7d05IwbGsE
 flz1fybzxFG6kzRIKCMe/YC0tTiUgfeKB0NLMHyo=
Message-ID: <75f4be9c-47b7-415f-4468-093b74130481@xen0n.name>
Date: Tue, 19 Oct 2021 02:18:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:95.0) Gecko/20100101
 Thunderbird/95.0a1
Subject: Re: [PATCH v7 16/21] target/loongarch: Add disassembler
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1634561247-25499-1-git-send-email-gaosong@loongson.cn>
 <1634561247-25499-17-git-send-email-gaosong@loongson.cn>
 <f55bffde-64ec-d390-2942-4ec4b2bbedbc@xen0n.name>
 <9ba04d0a-44bb-1ebd-31f4-35c282842b4a@linaro.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <9ba04d0a-44bb-1ebd-31f4-35c282842b4a@linaro.org>
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 philmd@redhat.com, yangxiaojuan@loongson.cn, peterx@redhat.com,
 laurent@vivier.eu, alistair.francis@wdc.com, maobibo@loongson.cn,
 pbonzini@redhat.com, bmeng.cn@gmail.com, alex.bennee@linaro.org,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 10/19/21 01:29, Richard Henderson wrote:
> On 10/18/21 8:38 AM, WANG Xuerui wrote:
>>
>> For now any implementation would suffice, and I already saw one or 
>> two bugs in the output during my TCG host work, but it surely would 
>> be nice to switch to generated decoder in the future. The 
>> loongarch-opcodes tables could be extended to support peculiarities 
>> as exhibited in the v1.00 ISA manual and binutils implementation, via 
>> additional attributes, and I'm open to such contributions.
>
> Perhaps it would be easiest to re-use the decodetree description?
> See e.g. target/openrisc/disas.c.
>
Indeed; I didn't thought of disassemblers in target/ instead of disas/. 
That would be the most elegant way forward!
>
> r~
>


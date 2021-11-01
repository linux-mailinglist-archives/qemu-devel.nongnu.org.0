Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9F3441A26
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 11:47:28 +0100 (CET)
Received: from localhost ([::1]:44432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhUqd-0008Qn-Dg
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 06:47:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mhUok-0007GE-3n
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 06:45:30 -0400
Received: from mail.xen0n.name ([115.28.160.31]:48816
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mhUof-0005AD-W4
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 06:45:29 -0400
Received: from [100.100.57.93] (unknown [220.248.53.61])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 64E21600B0;
 Mon,  1 Nov 2021 18:45:13 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1635763513; bh=vIYv564a7obdgc23lPFVyBqWH0j//7rdtX4GfICV9rY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LHHdc2tp5wqp7Eo58aqsT8ixNVYwG8mG3ooi1fQA+KsJiXrMZWLOTiatGjHn8Htks
 QOGaPzarhHGvCWr7Uzo+06YqTkJSoiYodN0TLrjpLdqulfiFsYhRtjdZbF4lEmUVBm
 IYeDxo3rdnDruwZlbgZ/sums0BJcpZKStlEVj6+s=
Message-ID: <648d74b4-17fe-1f4b-448c-004896b22c17@xen0n.name>
Date: Mon, 1 Nov 2021 18:45:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:95.0)
 Gecko/20100101 Thunderbird/95.0a1
Subject: Re: [PATCH v8 28/29] accel/tcg/user-exec: Implement CPU-specific
 signal handler for loongarch64 hosts
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1635760311-20015-1-git-send-email-gaosong@loongson.cn>
 <1635760311-20015-29-git-send-email-gaosong@loongson.cn>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <1635760311-20015-29-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.592,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, philmd@redhat.com,
 richard.henderson@linaro.org, laurent@vivier.eu, peterx@redhat.com,
 f4bug@amsat.org, yangxiaojuan@loongson.cn, alistair.francis@wdc.com,
 maobibo@loongson.cn, pbonzini@redhat.com, bmeng.cn@gmail.com,
 alex.bennee@linaro.org, chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 2021/11/1 17:51, Song Gao wrote:
> Base-on: <20210925173032.2434906-30-git@xen0n.name>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> ---
>  accel/tcg/user-exec.c | 64 ++++++++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 61 insertions(+), 3 deletions(-)

While I can see this patch and the next one are clearly from me, my
author info is lost as I didn't spot any "From:" line in the mail body?
Also I don't remember seeing "Base-on" tags in QEMU either.

I think you're meaning to include the "Based-on" tags in your cover
letter instead?



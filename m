Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BCD33ABA2
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 07:40:14 +0100 (CET)
Received: from localhost ([::1]:34098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLgth-0007fd-4m
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 02:40:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lLgsT-0007Fu-9l; Mon, 15 Mar 2021 02:38:57 -0400
Received: from mail.ispras.ru ([83.149.199.84]:33612)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lLgsR-0006pl-0L; Mon, 15 Mar 2021 02:38:56 -0400
Received: from [192.168.0.92] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id C78F440D403D;
 Mon, 15 Mar 2021 06:38:42 +0000 (UTC)
Subject: Re: Questions about timer interrupt handling in QEMU
To: Arnabjyoti Kalita <akalita@cs.stonybrook.edu>,
 qemu-discuss <qemu-discuss@nongnu.org>
References: <CAJGDS+FGbOseggf6PnYFdq+-SLKKUkWB7FAhy8Oe3b3r43PBiw@mail.gmail.com>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <c7d5bb3b-e908-83ba-e570-af8de9794db8@ispras.ru>
Date: Mon, 15 Mar 2021 09:38:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAJGDS+FGbOseggf6PnYFdq+-SLKKUkWB7FAhy8Oe3b3r43PBiw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14.03.2021 12:04, Arnabjyoti Kalita wrote:
> Hello all,
> 
> This is a continuation of some of the questions I had about the clock 
> record-replay handling process in QEMU. My previous post is here -
> 
> 
> https://www.mail-archive.com/qemu-discuss@nongnu.org/msg06231.html 
> <https://www.mail-archive.com/qemu-discuss@nongnu.org/msg06231.html>
> 
> 
> My experiment involves two steps. In the first step, I start QEMU in KVM 
> mode, save the QEMU state and record the host clock values for some 
> time. In the second step, I load the guest while starting QEMU in TCG 
> mode. I replay the host clock values as and when they are accessed. By 
> definition, the host clock is used by device models that simulate real 
> time sources and is a source of non-determinism. Below are some of the 
> questions I have -
> 
> 
> - How do I ensure that the CPU configuration is exactly the same in KVM 
> vs TCG modes? Can we use a generic CPU model, like "qemu64" and that 
> ensures it? Will different CPU flags in both the modes affect it ?

I have no idea.

> - I continuously see that the contents of memory are different when the 
> guest tries to run a timer interrupt handler after it is loaded. 
> Basically what happens is that I keep getting page faults when the 
> hander tries to erase a timer from the rbtree. I seem to be replaying 
> the host clock correctly, what else, might be wrong?
> 
> 
> - Given the minimal replay requirements I have, is it enough if I only 
> record the host clock timer ? Or do I need to record the other clock 
> timer types in addition to it to make the guest behave correctly ?

Host clock replay is not enough.
Interrupts must be injected at the same time too.
QEMU does not process interrupts immediately, they may be postponed 
until the translation block ends. That is why record/replay includes 
additional synchronization for them.

Pavel Dovgalyuk


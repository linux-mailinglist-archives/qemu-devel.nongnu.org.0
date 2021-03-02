Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C979132969E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 08:20:53 +0100 (CET)
Received: from localhost ([::1]:56126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGzKu-00066v-An
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 02:20:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lGzKA-0005eD-UD; Tue, 02 Mar 2021 02:20:06 -0500
Received: from mail.ispras.ru ([83.149.199.84]:55182)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lGzK6-0001xT-Vn; Tue, 02 Mar 2021 02:20:06 -0500
Received: from [192.168.0.92] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id C8FEE40755DD;
 Tue,  2 Mar 2021 07:19:53 +0000 (UTC)
Subject: Re: Some more questions with regards to QEMU clock record and replay
To: Arnabjyoti Kalita <akalita@cs.stonybrook.edu>,
 qemu-discuss <qemu-discuss@nongnu.org>
References: <CAJGDS+E24RdLWii1GbuxW4pBabpu9wboacMkT+qQ+0VL3-qyQw@mail.gmail.com>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <d4da90ae-3500-a1ae-728b-d4a4c5313900@ispras.ru>
Date: Tue, 2 Mar 2021 10:19:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAJGDS+E24RdLWii1GbuxW4pBabpu9wboacMkT+qQ+0VL3-qyQw@mail.gmail.com>
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

On 01.03.2021 20:16, Arnabjyoti Kalita wrote:
> Hello all,
> 
> I am really thankful for the wonderful answers in my last post linked below-
> 
> https://lists.nongnu.org/archive/html/qemu-discuss/2021-02/msg00131.html
> 
> In continuation with the last post, I have a few more questions to ask -
> 
> My experiment is still, mostly the same. I record clock values in KVM 
> mode, and then replay the clock values in TCG mode. However, now I am 
> recording and replaying all of the clock values (I was only 
> recording/replaying the host clock previously). However, I do not use 
> the -icount feature.
> 
> - Why are clock values being replayed at checkpoints?

Timers are replayed at checkpoints to be synchronized with vCPU.
Other clock requests (e.g., caused by vCPU instruction) are replayed 
immediately.

> - Can we ignore replaying at checkpoints and do a dumb replay as and 
> when the clock read actually happens?

I think we can, if we need just clock synchronization.

> - Based on the documentation available, I can see that checkpoints are 
> necessary for thread synchronization. Does this mean, if I do not replay 
> clock values at checkpoints, the guest kernel scheduler might behave 
> incorrectly during replay ?

Checkpoints are related to QEMU threads, not guest threads.
Timers are needed for virtual devices, that can generate interrupts, DMA 
requests and so on. Therefore we synchronize them with vCPU to make 
execution deterministic.


Pavel Dovgalyuk


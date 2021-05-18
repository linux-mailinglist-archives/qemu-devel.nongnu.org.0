Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA76838713C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 07:27:35 +0200 (CEST)
Received: from localhost ([::1]:38302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lisGU-0005aS-TY
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 01:27:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lisFa-0004uD-JY
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:26:38 -0400
Received: from mail.ispras.ru ([83.149.199.84]:33096)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lisFY-0003ZP-2F
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:26:38 -0400
Received: from [192.168.0.92] (unknown [62.118.138.151])
 by mail.ispras.ru (Postfix) with ESMTPSA id 3B23040D403D;
 Tue, 18 May 2021 05:26:28 +0000 (UTC)
Subject: Re: Best approach for supporting snapshots for QEMU's gdbstub?
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Luis Machado <luis.machado@linaro.org>
References: <87y2chjmsf.fsf@linaro.org>
 <6c8845b7-cc60-c8ba-3ada-6d0c6e65d8a5@linaro.org> <87bl99e03j.fsf@linaro.org>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <3b964beb-d86c-2780-535b-b567d689e37d@ispras.ru>
Date: Tue, 18 May 2021 08:26:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <87bl99e03j.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: gdb@gnu.org, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.05.2021 20:27, Alex Bennée wrote:
> 
> Luis Machado <luis.machado@linaro.org> writes:
> 
>> Hi,
>>
>> On 5/14/21 1:06 PM, Alex Bennée wrote:
>>> Hi,
>>> I've been playing around with QEMU's reverse debugging support which
>>> I have working with Pavel's latest patches for supporting virtio with
>>> record/replay. Once you get the right command line it works well enough
>>> although currently each step backwards requires replaying the entire
>>> execution history until you get to the right point.
>>> QEMU can quite easily snapshot the entire VM state so I was looking
>>> to
>>> see what the best way to integrate this would be. As far as I can tell
>>> there are two interfaces gdb supports: bookmarks and checkpoints.
>>> As far as I can tell bookmarks where added as part of GDB's reverse
>>> debugging support but attempting to use them from the gdbstub reports:
>>>     (gdb) bookmark
>>>     You can't do that when your target is `remote'
>>> so I guess that would need an extension to the stub protocol to
>>> support?
>>>
>>
>> Right. We don't support reverse step/next/continue for remote targets.
>> I think this would be the most appropriate way to implement this
>> feature in GDB. But it is not trivial.
> 
> You do because ";ReverseStep+;ReverseContinue+" is part of the gdbstub
> negotiation handshake.
> 
> Out of interest how is rr implemented? It presents a gdb interface so I
> thought it was some implemented using some remote magic.
> 
> <snip>
> 
>>> We could of course just add a custom monitor command like the
>>> qemu.sstep= command which could be used manually. However that would be
>>> a QEMU gdbstub specific approach.
>>
>> That would be an easy and quick way to allow GDB to control things in
>> QEMU, but I wouldn't say it is the best. Monitor commands are
>> basically a bypass of the RSP where GDB sends/receives commands
>> to/from the remote target.
> 
> We have some underlying commands we can set via the monitor including:
> 
>    monitor info replay
>    monitor replay_seek <N>
>    monitor replay_break <N>
> 
>>
>>> The other thing would be to be more intelligent on QEMU's side and
>>> save
>>> snapshots each time we hit an event, for example each time we hit a
>>> given breakpoint. However I do worry that might lead to snapshots
>>> growing quite quickly.
>>
>> GDB would need to be aware of such snapshots for them to be useful.
>> Otherwise GDB wouldn't be able to use them to restore state.
> 
> What does GDB need to know about them? Does it include something like
> the icount at a particular point.
> 
> I'm curious at how a break and reverse-continue is meant to work if that
> breakpoint is hit multiple times from the start of a run. You need to
> know if the last time you hit a particular breakpoint was in fact the
> last time before where the user was when they hit reverse-continue.

QEMU does this seamlessly. For reverse continue it replays the 
execution, noticing the last breakpoint that was hit. Then it replays 
again, but to the icount of that hit.


Pavel Dovgalyuk


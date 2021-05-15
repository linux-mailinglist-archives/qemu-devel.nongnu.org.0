Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 216B7381640
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 08:13:12 +0200 (CEST)
Received: from localhost ([::1]:42460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhnXy-00030S-NF
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 02:13:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lhnX6-0002Lw-Mw
 for qemu-devel@nongnu.org; Sat, 15 May 2021 02:12:16 -0400
Received: from mail.ispras.ru ([83.149.199.84]:39090)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lhnX4-0000Q8-Nr
 for qemu-devel@nongnu.org; Sat, 15 May 2021 02:12:16 -0400
Received: from [192.168.0.92] (unknown [62.118.138.151])
 by mail.ispras.ru (Postfix) with ESMTPSA id EB3E040D403E;
 Sat, 15 May 2021 06:12:08 +0000 (UTC)
Subject: Re: Best approach for supporting snapshots for QEMU's gdbstub?
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, gdb@gnu.org,
 QEMU Developers <qemu-devel@nongnu.org>,
 Luis Machado <luis.machado@linaro.org>
References: <87y2chjmsf.fsf@linaro.org>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <4dd935c3-fe40-6ecc-f037-e6eaf7dc7821@ispras.ru>
Date: Sat, 15 May 2021 09:12:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <87y2chjmsf.fsf@linaro.org>
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14.05.2021 19:06, Alex Bennée wrote:
> Hi,
> 
> I've been playing around with QEMU's reverse debugging support which
> I have working with Pavel's latest patches for supporting virtio with
> record/replay. Once you get the right command line it works well enough
> although currently each step backwards requires replaying the entire
> execution history until you get to the right point.
> 
> QEMU can quite easily snapshot the entire VM state so I was looking to
> see what the best way to integrate this would be. As far as I can tell
> there are two interfaces gdb supports: bookmarks and checkpoints.
> 
> As far as I can tell bookmarks where added as part of GDB's reverse
> debugging support but attempting to use them from the gdbstub reports:
> 
>    (gdb) bookmark
>    You can't do that when your target is `remote'
> 
> so I guess that would need an extension to the stub protocol to support?
> 
> The other option I found was checkpoints which seem to predate support
> for reverse debugging. However:
> 
>    (gdb) checkpoint
>    checkpoint: can't find fork function in inferior.
> 
> I couldn't tell what feature needs to be negotiated but I suspect it's
> something like fork-events if the checkpoint mechanism is designed for
> user space with a fork/freeze approach.
> 
> We could of course just add a custom monitor command like the
> qemu.sstep= command which could be used manually. However that would be
> a QEMU gdbstub specific approach.

For now you can just use 'monitor savevm sn1' in gdb.
But something like 'bookmark' seems more convenient.

> The other thing would be to be more intelligent on QEMU's side and save
> snapshots each time we hit an event, for example each time we hit a
> given breakpoint. However I do worry that might lead to snapshots
> growing quite quickly.
> 
> Any thoughts/suggestions?
> 



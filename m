Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADE2698F35
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 09:59:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSa6B-00045R-56; Thu, 16 Feb 2023 03:58:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pSa68-00045F-IL; Thu, 16 Feb 2023 03:58:36 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pSa66-0002ti-LM; Thu, 16 Feb 2023 03:58:36 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id F283B4750E;
 Thu, 16 Feb 2023 09:58:21 +0100 (CET)
Message-ID: <439f75e5-dbc6-264c-f82c-ee427a2a489a@proxmox.com>
Date: Thu, 16 Feb 2023 09:58:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Lost partition tables on ide-hd + ahci drive
To: John Snow <jsnow@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>,
 Aaron Lauterer <a.lauterer@proxmox.com>
References: <ad7e1294-f19f-5bea-e891-f6adbe323cd5@proxmox.com>
 <CAFn=p-ahLoVd3W2GaFp5EUFq5EOudz+bUkEk5DV+Z07AjHaHtg@mail.gmail.com>
 <d07bdbc1-065e-f8ec-2a44-ab141ffedd41@proxmox.com>
 <CAFn=p-Z1t+iMe+3KvsgkdViQgkkHJ1WHme-Ab8fKDOsWOD=kAw@mail.gmail.com>
Content-Language: en-US
From: Fiona Ebner <f.ebner@proxmox.com>
In-Reply-To: <CAFn=p-Z1t+iMe+3KvsgkdViQgkkHJ1WHme-Ab8fKDOsWOD=kAw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.257,
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

Am 15.02.23 um 22:47 schrieb John Snow:
> Hm, I'm not sure I see any pattern that might help. Could be that AHCI
> is just bugged during load, but it's tough to know in what way.

If we ever get a backtrace where the bad write actually goes through
QEMU, I'll let you know.

We are considering providing a custom build to affected users (using
GDB-hooks leads to too much slowdown in these performance-critical
paths) in the hope to catch it if it triggers again. We can't really
roll it out to all users, because most writes to sector zero are
legitimate after all and most users are not affected.

> What versions of QEMU are in use here? Is there a date on which you
> noticed an increased frequency of these reports?

There were a few reports around the time we rolled out 4.2 and 5.0
(Q2/Q3 of 2020), but the frequency was always very low. AFAICT, there's
about 20-40 reports that could be this issue in total. The earliest I
know of with lost partitions, but not much more information, are forum
threads from 2017/2018.

With 4.2, there was a rework with our backup patches so naturally, I
suspected that. Before 4.2, we had extended the backup job to allow
using a callback to handle the writes instead of the BlockDriverState
target. But starting from 4.2, we are not messing with that anymore and
using a custom driver as the backup target. That custom driver doesn't
even know about the source. The source is handled by the usual backup
job mechanisms.

If there was some general mix-up there, I'd not expect it to work for
>99.99% of backups and only trigger in combination with AHCI, but who knows?

Best Regards,
Fiona



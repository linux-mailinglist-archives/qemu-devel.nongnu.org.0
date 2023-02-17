Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF3669AB75
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 13:27:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSzof-0005tj-9L; Fri, 17 Feb 2023 07:26:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pSzoZ-0005me-4A; Fri, 17 Feb 2023 07:26:11 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pSzoV-0002yu-S8; Fri, 17 Feb 2023 07:26:10 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id A12F8476EB;
 Fri, 17 Feb 2023 13:26:03 +0100 (CET)
Message-ID: <0c0a4c9d-7253-d706-c475-827e0ad642c5@proxmox.com>
Date: Fri, 17 Feb 2023 13:25:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Lost partition tables on ide-hd + ahci drive
To: Mike Maslenkin <mike.maslenkin@gmail.com>
Cc: John Snow <jsnow@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>,
 Aaron Lauterer <a.lauterer@proxmox.com>
References: <ad7e1294-f19f-5bea-e891-f6adbe323cd5@proxmox.com>
 <CAFn=p-ahLoVd3W2GaFp5EUFq5EOudz+bUkEk5DV+Z07AjHaHtg@mail.gmail.com>
 <d07bdbc1-065e-f8ec-2a44-ab141ffedd41@proxmox.com>
 <CAL77WPAdDyKFWP_Dqsz_xr7OCzHLTkw6VbYDMGobi8kek4e_8A@mail.gmail.com>
 <edd04a3f-6ae7-fd28-81c9-25a2614076f6@proxmox.com>
 <CAL77WPBxNr537p_GOez9D_ZgzxEjtrvpoLHjMLAtUA0VFSVG0A@mail.gmail.com>
Content-Language: en-US
From: Fiona Ebner <f.ebner@proxmox.com>
In-Reply-To: <CAL77WPBxNr537p_GOez9D_ZgzxEjtrvpoLHjMLAtUA0VFSVG0A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.256,
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

Am 16.02.23 um 17:15 schrieb Mike Maslenkin:
> Makes sense for disks without partition table.
> But wouldn't Linux or any other OS write at least 4K bytes in that case?

Yes, it does here.

> Who may want to write 512 bytes for any purposes except for boot
> sector nowadays..

From a quick test, fdisk on Linux even causes a 4KiB write when
partitioning, Windows only 512 bytes.

> In dump mentioned before only 512 bytes were not zeroed, so I guess it
> was caused by IO from guest OS.

Yes, with all checks you suggested, most false positives could be
avoided, and we can hope to catch something with Windows. And on Linux
if the corruption on Linux is also just 512 bytes and not 4KiB, but we
don't have any dumps yet unfortunately.

> In other cases it can be caused by misconfigured IDE registers state
> or broken FIS memory area.

I stumbled upon [0], which will be addressed by [1]. Any chance that it
could be related?

[0]: https://gitlab.com/qemu-project/qemu/-/issues/62
[1]: https://lists.nongnu.org/archive/html/qemu-devel/2023-02/msg01141.html

Best Regards,
Fiona

> On Thu, Feb 16, 2023 at 6:25 PM Fiona Ebner <f.ebner@proxmox.com> wrote:
>>
>> Am 16.02.23 um 15:17 schrieb Mike Maslenkin:
>>> Does additional comparison make a sense here: check for LBA == 0 and
>>> then check MBR signature bytes.
>>> Additionally it’s easy to check buffer_is_zero() result or even print
>>> FIS contents under these conditions.
>>> Data looks like a part of guest memory of 64bit Windows.
>>
>> Thank you for the suggestion! I'll think about adding such a check and
>> dumping of FIS contents in a custom build for affected users. But in
>> general it would be too much noise for non-MBR cases: e.g. on a disk
>> formatted with ext4 (without any partitions), Linux will write to sector
>> 0 on every startup and shutdown.
>>
>> Best Regards,
>> Fiona
>>
> 



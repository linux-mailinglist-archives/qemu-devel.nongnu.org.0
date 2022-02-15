Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A40D4B6692
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 09:52:16 +0100 (CET)
Received: from localhost ([::1]:58118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJtZH-00036v-15
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 03:52:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1nJtWi-0001vE-0l; Tue, 15 Feb 2022 03:49:36 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:26538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1nJtWf-0001GR-Nv; Tue, 15 Feb 2022 03:49:35 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 35D35461F3;
 Tue, 15 Feb 2022 09:49:21 +0100 (CET)
Message-ID: <72558385-d52e-8025-5a21-f2ac6e1cf158@proxmox.com>
Date: Tue, 15 Feb 2022 09:49:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/4] Make qemu-img dd more flexible
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, Eric Blake <eblake@redhat.com>
References: <20220210133123.347350-1-f.ebner@proxmox.com>
 <20220211163100.lhqrztyrr2a4akji@redhat.com>
 <c0415413-9692-c284-3858-a62178078ab0@redhat.com>
From: Fabian Ebner <f.ebner@proxmox.com>
In-Reply-To: <c0415413-9692-c284-3858-a62178078ab0@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, w.bumiller@proxmox.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, aderumier@odiso.com, t.lamprecht@proxmox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 11.02.22 um 17:42 schrieb Hanna Reitz:
> On 11.02.22 17:31, Eric Blake wrote:
>> On Thu, Feb 10, 2022 at 02:31:19PM +0100, Fabian Ebner wrote:
>>> Adds support for reading from stdin and writing to stdout (when raw
>>> format is used), as well as overriding the size of the output and
>>> input image/stream.
>>>
>>> Additionally, the options -n for skipping output image creation and -l
>>> for loading a snapshot are made available like for convert.
>> Without looking at the series itself, I want to refer back to earlier
>> times that someone proposed improving 'qemu-img dd':
>>
>> https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg00636.html
>> https://lists.gnu.org/archive/html/qemu-devel/2018-08/msg02618.html
>>
>> As well as the observation that when we originally allowed 'qemu-img
>> dd' to be added, the end goal was that if 'qemu-img dd' can't operate
>> as a thin wrapper around 'qemu-img convert', then 'qemu-img convert'
>> needs to be made more powerful first.  Every time we diverge on what
>> the two uses can do, rather than keeping dd as a thin wrapper, we add
>> to our maintenance burden.

I'm wondering why it's not actually implemented as a thin wrapper then?
The fact that it isn't is (part of) the reason why dd was chosen, as
mentioned in the first patch:

"While dd and convert have overlapping use cases, `dd` is a
simple read/write loop while convert is much more
sophisticated and has ways to dealing with holes and blocks
of zeroes.
Since these typically can't be detected in pipes via
SEEK_DATA/HOLE or skipped while writing, dd seems to be the
better choice for implementing stdin/stdout streams."

Adding the same feature to convert seems much more involved.

>>
>> Sadly, there is a lot of technical debt in this area ('qemu-img dd
>> skip= count=' is STILL broken, more than 4 years after I first
>> proposed a potential patch), where no one has spent the necessary time
>> to improve the situation.
> 
> Note that by now (in contrast to 2018), we have FUSE disk exports, and I
> even have a script that uses them to let you run dd on any image:
> 
> https://gitlab.com/hreitz/qemu-scripts/-/blob/main/qemu-dd.py
> 
> Which is nice, because it gives you feature parity with dd, because it
> simply runs dd.

Thank you for the suggestion. It's definitely worth considering,
although it does add a bit of complexity and we currently don't have
FUSE support enabled in our builds.

> 
> (The main problem with the script is that it lives in that personal repo
> of mine and so nobody but me knows about it.  Suggestions to improve
> that situation are more than welcome.)
> 
> Now, the qemu storage daemon does not support loading qcow2 snapshots
> (as far as I’m aware), which is proposed in patch 4 of this series.  But
> I think that just means that it would be nice if the QSD could support
> that.

I suppose adding a snapshot-load QMP command would be a natural way to
add it?

> 
> Hanna
> 
> 



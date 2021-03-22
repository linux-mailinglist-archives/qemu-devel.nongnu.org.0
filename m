Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE08C344081
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 13:11:15 +0100 (CET)
Received: from localhost ([::1]:43816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOJOs-0007PE-VU
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 08:11:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lOJKU-0004EY-DC
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 08:06:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lOJKM-0004Ii-Jj
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 08:06:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616414793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9GOOoG5Mb1AX6iMgLoR9Sh3Au6elL/WnwUT+edpD11E=;
 b=iH+jZp+tIkC+EKkLvb8eJRLup0CVEbu7a+Hg3ILNhYHuDW6y6yeN0Km2a3Rg7kdvW36Yni
 tJtKt99QYlNUHwtVsU0rKC9iX4ZkN+keKMGtje1T6YT1ekKdUH2tLGpDxzsF+HLOhSrzSH
 sBWlKSKZdEJdftxEmqmylaD2GG4Hv5Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-GeXIi5DNOE-tGDI8XejaIg-1; Mon, 22 Mar 2021 08:06:31 -0400
X-MC-Unique: GeXIi5DNOE-tGDI8XejaIg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6122780006E;
 Mon, 22 Mar 2021 12:06:30 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-196.ams2.redhat.com
 [10.36.114.196])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5881760D43;
 Mon, 22 Mar 2021 12:06:27 +0000 (UTC)
Subject: Re: Fwd: [PATCH 0/2] block/raw: implemented persistent dirty bitmap
 and ability to dump bitmap content via qapi
To: =?UTF-8?Q?Patrik_Janou=c5=a1ek?= <pj@patrikjanousek.cz>,
 Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>
References: <20210320093235.461485-1-pj@patrikjanousek.cz>
 <856ca6ba-3871-068f-f821-269c40a5a4d5@patrikjanousek.cz>
 <6e142c5b-053c-dc58-277c-59a8ce67f8a7@redhat.com>
 <a779e20f-4720-3762-fa3d-d15f4980c0fb@patrikjanousek.cz>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <9f434671-005a-3b84-c6e0-c44e98984189@redhat.com>
Date: Mon, 22 Mar 2021 13:06:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <a779e20f-4720-3762-fa3d-d15f4980c0fb@patrikjanousek.cz>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>, lmatejka@kiv.zcu.cz
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.03.21 12:27, Patrik Janoušek wrote:
> On 3/22/21 11:48 AM, Max Reitz wrote:
>> Hi,
>>
>> On 20.03.21 11:01, Patrik Janoušek wrote:
>>> I'm sorry, but I forgot to add you to the cc, so I'm forwarding the
>>> patch to you additionally. I don't want to spam the mailing list
>>> unnecessarily.
>>
>> I think it’s better to still CC the list.  It’s so full of mail, one
>> more won’t hurt. :)
>>
>> (Re-adding qemu-block and qemu-devel, because the discussion belongs
>> on the list(s).)
>>
>>> -------- Forwarded Message --------
>>> Subject:     [PATCH 0/2] block/raw: implemented persistent dirty
>>> bitmap and ability to dump bitmap content via qapi
>>> Date:     Sat, 20 Mar 2021 10:32:33 +0100
>>> From:     Patrik Janoušek <pj@patrikjanousek.cz>
>>> To:     qemu-devel@nongnu.org
>>> CC:     Patrik Janoušek <pj@patrikjanousek.cz>, lmatejka@kiv.zcu.cz
>>>
>>>
>>>
>>> Currently, QEMU doesn't support persistent dirty bitmaps for raw format
>>> and also dirty bitmaps are for internal use only, and cannot be accessed
>>> using third-party applications. These facts are very limiting
>>> in case someone would like to develop their own backup tool becaouse
>>> without access to the dirty bitmap it would be possible to implement
>>> only full backups. And without persistent dirty bitmaps, it wouldn't
>>> be possible to keep track of changed data after QEMU is restarted. And
>>> this is exactly what I do as a part of my bachelor thesis. I've
>>> developed a tool that is able to create incremental backups of drives
>>> in raw format that are LVM volumes (ability to create snapshot is
>>> required).
>>
>> Similarly to what Vladimir has said already, the thing is that
>> conceptually I can see no difference between having a raw image with
>> the bitmaps stored in some other file, i.e.:
>>
>>    { "driver": "raw",
>>      "dirty-bitmaps": [ {
>>        "filename": "sdc1.bitmap",
>>        "persistent": true
>>      } ],
>>      "file": {
>>        "driver": "file",
>>        "filename": "/dev/sdc1"
>>      } }
>>
>> And having a qcow2 image with the raw data stored in some other file,
>> i.e.:
>>
>>    { "driver": "qcow2",
>>      "file": {
>>        "driver": "file",
>>        "filename": "sdc1.metadata"
>>      },
>>      "data-file": {
>>        "driver": "file",
>>        "filename": "/dev/sdc1"
>>      } }
>>
>> (Where sdc1.metadata is a qcow2 file created with
>> “data-file=/dev/sdc1,data-file-raw=on”.)
>>
>> To use persistent bitmaps with raw images, you need to add metadata
>> (namely, the bitmaps).  Why not store that metadata in a qcow2 file?
>>
>> Max
> 
> So if I understand it correctly. I can configure dirty bitmaps in the
> latest version of QEMU to be persistently stored in some other file.
> Because even Proxmox Backup Server can't perform an incremental backup
> after restarting QEMU, and that means something to me. I think they
> would implement it if it was that simple.
> 
> Could you please send me simple example on how to configure (via command
> line args) one raw format drive that can store dirty bitmaps
> persistently in other qcow2 file? I may be missing something, but I
> thought QEMU couldn't do it, because Proxmox community wants this
> feature for a long time.

One trouble is that if you use qemu-img create to create the qcow2 
image, it will always create an empty image, and so if use pass 
data_file to it, it will empty the existing raw image:

$ cp ~/tmp/arch.iso raw.img # Just some Arch Linux ISO

$ qemu-img create \
     -f qcow2 \
     -o data_file=raw.img,data_file_raw=on,preallocation=metadata \
     metadata.qcow2 \
     $(stat -c '%s' raw.img)
Formatting 'metadata.qcow2', fmt=qcow2 cluster_size=65536 
preallocation=metadata compression_type=zlib size=687865856 
data_file=raw.img data_file_raw=on lazy_refcounts=off refcount_bits=16

(If you check raw.img at this point, you’ll find that it’s empty, so you 
need to copy it from the source again:)

$ cp ~/tmp/arch.iso raw.img

Now if you use metadata.qcow2, the image data will actually all be 
stored in raw.img.


To get around the “creating metadata.qcow2 clears raw.img” problem, you 
can either create a temporary empty image of the same size as raw.img 
that you pass to qemu-img create, and then you use qemu-img amend to 
change the data-file pointer (which will not overwrite the new 
data-file’s contents):

$ qemu-img create -f raw tmp.raw $(stat -c '%s' raw.img)

$ qemu-img create \
     -f qcow2 \
     -o data_file=tmp.img,data_file_raw=on,preallocation=metadata \
     metadata.qcow2 \
     $(stat -c '%s' raw.img)
Formatting 'metadata.qcow2', fmt=qcow2 cluster_size=65536 
preallocation=metadata compression_type=zlib size=687865856 
data_file=tmp.img data_file_raw=on lazy_refcounts=off refcount_bits=16

$ qemu-img amend -o data_file=raw.img metadata.qcow2

$ rm tmp.img


Or you use the blockdev-create job to create the qcow2 image (because 
contrary to qemu-img create, that will not clear the data file):

$ touch metadata.qcow2

(Note that in the following QMP communication, what I sent and what qemu 
replies is mixed.  Everything that begins with '{ "execute"' is from me, 
everything else from qemu.  The number 687865856 is the size of raw.img 
in bytes.)

$ qemu-system-x86_64 -qmp stdio \
     -blockdev \
     '{ "node-name": "metadata-file",
        "driver": "file",
        "filename": "metadata.qcow2" }' \
     -blockdev \
     '{ "node-name": "data-file",
        "driver": "file",
        "filename": "raw.img" }'
{"QMP": {"version": {"qemu": {"micro": 0, "minor": 1, "major": 5}, 
"package": "qemu-5.1.0-9.fc33"}, "capabilities": ["oob"]}}

{ "execute": "qmp_capabilities" }
{"return": {}}

{ "execute": "blockdev-create",
   "arguments": {
     "job-id": "create",
     "options": {
       "driver": "qcow2",
       "file": "metadata-file",
       "data-file": "data-file",
       "data-file-raw": true,
       "preallocation": "metadata",
       "size": 687865856
     }
   }
}
{"timestamp": {"seconds": 1616414002, "microseconds": 836899}, "event": 
"JOB_STATUS_CHANGE", "data": {"status": "created", "id": "create"}}
{"timestamp": {"seconds": 1616414002, "microseconds": 837076}, "event": 
"JOB_STATUS_CHANGE", "data": {"status": "running", "id": "create"}}
{"return": {}}
{"timestamp": {"seconds": 1616414002, "microseconds": 870997}, "event": 
"JOB_STATUS_CHANGE", "data": {"status": "waiting", "id": "create"}}
{"timestamp": {"seconds": 1616414002, "microseconds": 871099}, "event": 
"JOB_STATUS_CHANGE", "data": {"status": "pending", "id": "create"}}
{"timestamp": {"seconds": 1616414002, "microseconds": 871185}, "event": 
"JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "create"}}

{ "execute": "job-dismiss", "arguments": { "id": "create" } }
{"timestamp": {"seconds": 1616414022, "microseconds": 202880}, "event": 
"JOB_STATUS_CHANGE", "data": {"status": "null", "id": "create"}}
{"return": {}}

{ "execute": "quit" }
{"return": {}}
{"timestamp": {"seconds": 1616414028, "microseconds": 56457}, "event": 
"SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}


In any case, in the end you get a metadata.qcow2 that holds the metadata 
and points to raw.img for its data.  So you can use it like this:

$ qemu-system-x86_64 -enable-kvm -m 512 \
     -blockdev \
     '{ "node-name": "node0",
        "driver": "qcow2",
        "file": {
          "driver": "file",
          "filename": "metadata.qcow2"
        } }' \
     -device ide-cd,drive=node0 \
     -qmp stdio
{"QMP": {"version": {"qemu": {"micro": 0, "minor": 1, "major": 5}, 
"package": "qemu-5.1.0-9.fc33"}, "capabilities": ["oob"]}}

{ "execute": "qmp_capabilities" }
{"return": {}}

{ "execute": "block-dirty-bitmap-add",
   "arguments": {
     "node": "node0",
     "name": "bmap0",
     "persistent": true
   }
}
{"return": {}}

{ "execute": "quit" }
{"return": {}}
{"timestamp": {"seconds": 1616414627, "microseconds": 928250}, "event": 
"SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}

$ qemu-img info metadata.qcow2
image: metadata.qcow2
file format: qcow2
virtual size: 656 MiB (687865856 bytes)
disk size: 452 KiB
cluster_size: 65536
Format specific information:
     compat: 1.1
     compression type: zlib
     lazy refcounts: false
     bitmaps:
         [0]:
             flags:
                 [0]: auto
             name: bmap0
             granularity: 65536
     refcount bits: 16
     data file: raw.img
     data file raw: true
     corrupt: false

So the bitmap is now in metadata.qcow2, and as the disk size indicates, 
all the data is still in raw.img.


I hope the above helps you.  Sorry if it’s confusing, especially the 
first part where I’m like “The obvious way to create metadata.qcow2 will 
delete your data, so here are two alternatives that are weird but do 
what you want.”

Max



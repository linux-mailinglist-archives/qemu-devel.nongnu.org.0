Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9112E698785
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 22:49:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSPcv-0006vb-0u; Wed, 15 Feb 2023 16:47:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pSPcs-0006uC-Fr
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 16:47:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pSPcp-0004CL-LG
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 16:47:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676497658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bJhvZGwjDuOyyG2qxQT6dDy/CWRRaA99ExokOMYIJsw=;
 b=MQxTvCe8b+nUQAOrpkQlVL/Iw3bUZ7L/20DBTJZB7P9QulNK2Ak/rBd67q0pOLMNMtk2r2
 X6GNEE4rNLzqpZJUl/QFshVqTqq2aNm5lxvkgGEYdQYZGC8BXzIIod5ccPer+Erd8NoL+w
 HDaLHVhRFYDMptQ3IAW/oMgCVAMO2G0=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-441--R7TtJnGNb2B6bLaikB5jQ-1; Wed, 15 Feb 2023 16:47:20 -0500
X-MC-Unique: -R7TtJnGNb2B6bLaikB5jQ-1
Received: by mail-pj1-f70.google.com with SMTP id
 gb21-20020a17090b061500b00233c6b388ddso26974pjb.5
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 13:47:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bJhvZGwjDuOyyG2qxQT6dDy/CWRRaA99ExokOMYIJsw=;
 b=fEHU9OXAyQ4UtfIHtbysEmG2iukjqHNlHBieSDuoEyjM0P4xc1LwRkt4qqwrWDWLW/
 yttHRNQzxZyQLAMy6QWqP0Kx5v7ge86NXSvrTNzAXuJFGgK2EM+DzVLVbwxKJ04wq671
 QvDpT5sYB8JCAruHk2R6QWWprNtY7lN8W0K2kW/h9oXT5ERZq18zqb4jdiRRTrhhqUXb
 2U66JMPTJowFbMRMGSE5Q57WO/hT4rUUTQGUEK1lPSAEFXW0EeyPaHMOc8OT6YxLDE8h
 EjI3TWjwEDvj9HFFyb4MpJ8+P2sVnlYYdtQM+ohqnBt4xetNk0rTNgbfhwPu3hTqLDvD
 whlA==
X-Gm-Message-State: AO0yUKVyMj54PIRA270bX4iMvys9RTmwuUbMzBFdZPgk7V4sbY/dFXgw
 C/s7QVv/E4LcO/nXew1dph5ZZBL94gQdHZ9yOOaRbne7kS2WXz7nJEyl/SDQb8YIMQaU9ApqAQG
 DYehc7mJFTFEhmbKjAU/TdH6HwraQRqvCy2U0
X-Received: by 2002:a17:90b:3909:b0:234:2592:efbe with SMTP id
 ob9-20020a17090b390900b002342592efbemr161192pjb.131.1676497631833; 
 Wed, 15 Feb 2023 13:47:11 -0800 (PST)
X-Google-Smtp-Source: AK7set8L42p5x9/O2e/f0p3NRu6qJYbHYix+OeYio3IBMKQzYw8tGXi2QymOjPXS24Pm9fou9s/73a1wEErOURyzVxQ=
X-Received: by 2002:a17:90b:3909:b0:234:2592:efbe with SMTP id
 ob9-20020a17090b390900b002342592efbemr161182pjb.131.1676497631363; Wed, 15
 Feb 2023 13:47:11 -0800 (PST)
MIME-Version: 1.0
References: <ad7e1294-f19f-5bea-e891-f6adbe323cd5@proxmox.com>
 <CAFn=p-ahLoVd3W2GaFp5EUFq5EOudz+bUkEk5DV+Z07AjHaHtg@mail.gmail.com>
 <d07bdbc1-065e-f8ec-2a44-ab141ffedd41@proxmox.com>
In-Reply-To: <d07bdbc1-065e-f8ec-2a44-ab141ffedd41@proxmox.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 15 Feb 2023 16:47:00 -0500
Message-ID: <CAFn=p-Z1t+iMe+3KvsgkdViQgkkHJ1WHme-Ab8fKDOsWOD=kAw@mail.gmail.com>
Subject: Re: Lost partition tables on ide-hd + ahci drive
To: Fiona Ebner <f.ebner@proxmox.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, 
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>, 
 Aaron Lauterer <a.lauterer@proxmox.com>
Content-Type: multipart/alternative; boundary="000000000000c8defa05f4c405f9"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--000000000000c8defa05f4c405f9
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 15, 2023, 5:53 AM Fiona Ebner <f.ebner@proxmox.com> wrote:

> Am 14.02.23 um 19:21 schrieb John Snow:
> > On Thu, Feb 2, 2023 at 7:08 AM Fiona Ebner <f.ebner@proxmox.com> wrote:
> >>
> >> Hi,
> >> over the years we've got 1-2 dozen reports[0] about suddenly
> >> missing/corrupted MBR/partition tables. The issue seems to be very rare
> >> and there was no success in trying to reproduce it yet. I'm asking here
> >> in the hope that somebody has seen something similar.
> >>
> >> The only commonality seems to be the use of an ide-hd drive with ahci
> bus.
> >>
> >> It does seem to happen with both Linux and Windows guests (one of the
> >> reports even mentions FreeBSD) and backing storages for the VMs include
> >> ZFS, RBD, LVM-Thin as well as file-based storages.
> >>
> >> Relevant part of an example configuration:
> >>
> >>>   -device 'ahci,id=ahci0,multifunction=on,bus=pci.0,addr=0x7' \
> >>>   -drive
> 'file=/dev/zvol/myzpool/vm-168-disk-0,if=none,id=drive-sata0,format=raw,cache=none,aio=io_uring,detect-zeroes=on'
> \
> >>>   -device 'ide-hd,bus=ahci0.0,drive=drive-sata0,id=sata0' \
> >>
> >> The first reports are from before io_uring was used and there are also
> >> reports with writeback cache mode and discard=on,detect-zeroes=unmap.
> >>
> >> Some reports say that the issue occurred under high IO load.
> >>
> >> Many reports suspect backups causing the issue. Our backup mechanism
> >> uses backup_job_create() for each drive and runs the jobs sequentially.
> >> It uses a custom block driver as the backup target which just forwards
> >> the writes to the actual target which can be a file or our backup
> server.
> >> (If you really want to see the details, apply the patches in [1] and see
> >> pve-backup.c and block/backup-dump.c).
> >>
> >> Of course, the backup job will read sector 0 of the source disk, but I
> >> really can't see where a stray write would happen, why the issue would
> >> trigger so rarely or why seemingly only ide-hd+ahci would be affected.
> >>
> >> So again, just asking if somebody has seen something similar or has a
> >> hunch of what the cause might be.
> >>
> >
> > Hi Floria;
> >
> > I'm sorry to say that I haven't worked on the block devices (or
> > backup) for a little while now, so I am not immediately sure what
> > might be causing this problem. In general, I advise against using AHCI
> > in production as better performance (and dev support) can be achieved
> > through virtio.
>
> Yes, we also recommend using virtio-{scsi,blk}-pci to our users and most
> do. Still, some use AHCI, I'd guess mostly for Windows, but not only.
>
> > Still, I am not sure why the combination of AHCI with
> > backup_job_create() would be corrupting the early sectors of the disk.
>
> It's not clear that backup itself is causing the issue. Some of the
> reports do correlate it with backup, but there are no precise timestamps
> when the corruption happened. It might be that the additional IO during
> backup is somehow triggering the issue.
>
> > Do you have any analysis on how much data gets corrupted? Is it the
> > first sector only, the first few? Has anyone taken a peek at the
> > backing storage to see if there are any interesting patterns that can
> > be observed? (Zeroes, garbage, old data?)
>
> It does seem to be the first sector only, but it's not entirely clear.
> Many of the affected users said that after fixing the partition table
> with TestDisk, the VMs booted/worked normally again. We only have dumps
> for the first MiB of three images. In this case, all Windows with Ceph
> RBD images.
>

There was a corruption case I diagnosed for a client many aeons ago where
Ceph under load turned out to be the culprit for qcow2 corruption.

I don't recall the BZ#, but I'd like to think any version in production
these days isn't prone to the same bug.

This was probably around late 2016 or so, but I don't know precisely when
the bug got fixed (after I shuffled it out of my queue!)


> See below[0] for the dumps. One was a valid MBR and matched the latest
> good backup, so that VM didn't boot for some other reason, not sure if
> even related to this bug. I did not include this one. One was completely
> empty and one contained other data in the first 512 Bytes, then again
> zeroes, but those zeroes are nothing special AFAIK.
>
> > Have any errors or warnings been observed in either the guest or the
> > host that might offer some clues?
>
> There is a single user who seemed to have hardware issues, and I'd be
> inclined to blame those in that case. But none of the other users
> reported any errors or warnings, though I can't say if any checked
> inside the guests.
>
> > Is there any commonality in the storage format being used? Is it
> > qcow2? Is it network-backed?
>
> There are reports with local ZFS volumes, local LVM-Thin volumes, RBD
> images, qcow2 on NFS. So no pattern to be seen.
>
> > Apologies for the "tier 1" questions.
>
> Thank you for your time!
>

Hm, I'm not sure I see any pattern that might help. Could be that AHCI is
just bugged during load, but it's tough to know in what way.

What versions of QEMU are in use here? Is there a date on which you noticed
an increased frequency of these reports?


> Best Regards,
> Fiona
>
> @Aaron (had access to the broken images): please correct me/add anything
> relevant I missed. Are the broken VMs/backups still present? If yes, can
> we ask the user to check the logs inside?
>
> [0]:
> > febner@enia ~/Downloads % hexdump -C dump-vm-120.raw
> > 00000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
> |................|
> > *
> > 00100000
> > febner@enia ~/Downloads % hexdump -C dump-vm-130.raw
> > 00000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
> |................|
> > *
> > 000000c0  00 00 19 03 46 4d 66 6e  00 00 00 00 00 00 00 00
> |....FMfn........|
> > 000000d0  04 f2 7a 01 00 00 00 00  00 00 00 00 00 00 00 00
> |..z.............|
> > 000000e0  f0 a4 01 00 00 00 00 00  c8 4d 5b 99 0c 81 ff ff
> |.........M[.....|
> > 000000f0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
> |................|
> > 00000100  00 42 e1 38 0d da ff ff  00 bc b4 3b 0d da ff ff
> |.B.8.......;....|
> > 00000110  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
> |................|
> > 00000120  78 00 00 00 01 00 00 00  a8 00 aa 00 00 00 00 00
> |x...............|
> > 00000130  a0 71 ba b0 0c 81 ff ff  2e 00 2e 00 00 00 00 00
> |.q..............|
> > 00000140  a0 71 ba b0 0c 81 ff ff  00 00 00 00 00 00 00 00
> |.q..............|
> > 00000150  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
> |................|
> > *
> > 000001a0  5c 00 44 00 65 00 76 00  69 00 63 00 65 00 5c 00
> |\.D.e.v.i.c.e.\.|
> > 000001b0  48 00 61 00 72 00 64 00  64 00 69 00 73 00 6b 00
> |H.a.r.d.d.i.s.k.|
> > 000001c0  56 00 6f 00 6c 00 75 00  6d 00 65 00 32 00 5c 00
> |V.o.l.u.m.e.2.\.|
> > 000001d0  57 00 69 00 6e 00 64 00  6f 00 77 00 73 00 5c 00
> |W.i.n.d.o.w.s.\.|
> > 000001e0  4d 00 69 00 63 00 72 00  6f 00 73 00 6f 00 66 00
> |M.i.c.r.o.s.o.f.|
> > 000001f0  74 00 2e 00 4e 00 45 00  54 00 5c 00 46 00 72 00
> |t...N.E.T.\.F.r.|
> > 00000200  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
> |................|
> > *
> > 00100000
>
>

--000000000000c8defa05f4c405f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Feb 15, 2023, 5:53 AM Fiona Ebner &lt;<a href=
=3D"mailto:f.ebner@proxmox.com">f.ebner@proxmox.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">Am 14.02.23 um 19:21 schrieb John Snow:<br>
&gt; On Thu, Feb 2, 2023 at 7:08 AM Fiona Ebner &lt;<a href=3D"mailto:f.ebn=
er@proxmox.com" target=3D"_blank" rel=3D"noreferrer">f.ebner@proxmox.com</a=
>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hi,<br>
&gt;&gt; over the years we&#39;ve got 1-2 dozen reports[0] about suddenly<b=
r>
&gt;&gt; missing/corrupted MBR/partition tables. The issue seems to be very=
 rare<br>
&gt;&gt; and there was no success in trying to reproduce it yet. I&#39;m as=
king here<br>
&gt;&gt; in the hope that somebody has seen something similar.<br>
&gt;&gt;<br>
&gt;&gt; The only commonality seems to be the use of an ide-hd drive with a=
hci bus.<br>
&gt;&gt;<br>
&gt;&gt; It does seem to happen with both Linux and Windows guests (one of =
the<br>
&gt;&gt; reports even mentions FreeBSD) and backing storages for the VMs in=
clude<br>
&gt;&gt; ZFS, RBD, LVM-Thin as well as file-based storages.<br>
&gt;&gt;<br>
&gt;&gt; Relevant part of an example configuration:<br>
&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0-device &#39;ahci,id=3Dahci0,multifunction=3Don,bu=
s=3Dpci.0,addr=3D0x7&#39; \<br>
&gt;&gt;&gt;=C2=A0 =C2=A0-drive &#39;file=3D/dev/zvol/myzpool/vm-168-disk-0=
,if=3Dnone,id=3Ddrive-sata0,format=3Draw,cache=3Dnone,aio=3Dio_uring,detect=
-zeroes=3Don&#39; \<br>
&gt;&gt;&gt;=C2=A0 =C2=A0-device &#39;ide-hd,bus=3Dahci0.0,drive=3Ddrive-sa=
ta0,id=3Dsata0&#39; \<br>
&gt;&gt;<br>
&gt;&gt; The first reports are from before io_uring was used and there are =
also<br>
&gt;&gt; reports with writeback cache mode and discard=3Don,detect-zeroes=
=3Dunmap.<br>
&gt;&gt;<br>
&gt;&gt; Some reports say that the issue occurred under high IO load.<br>
&gt;&gt;<br>
&gt;&gt; Many reports suspect backups causing the issue. Our backup mechani=
sm<br>
&gt;&gt; uses backup_job_create() for each drive and runs the jobs sequenti=
ally.<br>
&gt;&gt; It uses a custom block driver as the backup target which just forw=
ards<br>
&gt;&gt; the writes to the actual target which can be a file or our backup =
server.<br>
&gt;&gt; (If you really want to see the details, apply the patches in [1] a=
nd see<br>
&gt;&gt; pve-backup.c and block/backup-dump.c).<br>
&gt;&gt;<br>
&gt;&gt; Of course, the backup job will read sector 0 of the source disk, b=
ut I<br>
&gt;&gt; really can&#39;t see where a stray write would happen, why the iss=
ue would<br>
&gt;&gt; trigger so rarely or why seemingly only ide-hd+ahci would be affec=
ted.<br>
&gt;&gt;<br>
&gt;&gt; So again, just asking if somebody has seen something similar or ha=
s a<br>
&gt;&gt; hunch of what the cause might be.<br>
&gt;&gt;<br>
&gt; <br>
&gt; Hi Floria;<br>
&gt; <br>
&gt; I&#39;m sorry to say that I haven&#39;t worked on the block devices (o=
r<br>
&gt; backup) for a little while now, so I am not immediately sure what<br>
&gt; might be causing this problem. In general, I advise against using AHCI=
<br>
&gt; in production as better performance (and dev support) can be achieved<=
br>
&gt; through virtio.<br>
<br>
Yes, we also recommend using virtio-{scsi,blk}-pci to our users and most<br=
>
do. Still, some use AHCI, I&#39;d guess mostly for Windows, but not only.<b=
r>
<br>
&gt; Still, I am not sure why the combination of AHCI with<br>
&gt; backup_job_create() would be corrupting the early sectors of the disk.=
<br>
<br>
It&#39;s not clear that backup itself is causing the issue. Some of the<br>
reports do correlate it with backup, but there are no precise timestamps<br=
>
when the corruption happened. It might be that the additional IO during<br>
backup is somehow triggering the issue.<br>
<br>
&gt; Do you have any analysis on how much data gets corrupted? Is it the<br=
>
&gt; first sector only, the first few? Has anyone taken a peek at the<br>
&gt; backing storage to see if there are any interesting patterns that can<=
br>
&gt; be observed? (Zeroes, garbage, old data?)<br>
<br>
It does seem to be the first sector only, but it&#39;s not entirely clear.<=
br>
Many of the affected users said that after fixing the partition table<br>
with TestDisk, the VMs booted/worked normally again. We only have dumps<br>
for the first MiB of three images. In this case, all Windows with Ceph<br>
RBD images.<br></blockquote></div></div><div dir=3D"auto"><br></div><div di=
r=3D"auto">There was a corruption case I diagnosed for a client many aeons =
ago where Ceph under load turned out to be the culprit for qcow2 corruption=
.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I don&#39;t recall the=
 BZ#, but I&#39;d like to think any version in production these days isn&#3=
9;t prone to the same bug.</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">This was probably around late 2016 or so, but I don&#39;t know precisely=
 when the bug got fixed (after I shuffled it out of my queue!)</div><div di=
r=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">
<br>
See below[0] for the dumps. One was a valid MBR and matched the latest<br>
good backup, so that VM didn&#39;t boot for some other reason, not sure if<=
br>
even related to this bug. I did not include this one. One was completely<br=
>
empty and one contained other data in the first 512 Bytes, then again<br>
zeroes, but those zeroes are nothing special AFAIK.<br>
<br>
&gt; Have any errors or warnings been observed in either the guest or the<b=
r>
&gt; host that might offer some clues?<br>
<br>
There is a single user who seemed to have hardware issues, and I&#39;d be<b=
r>
inclined to blame those in that case. But none of the other users<br>
reported any errors or warnings, though I can&#39;t say if any checked<br>
inside the guests.<br>
<br>
&gt; Is there any commonality in the storage format being used? Is it<br>
&gt; qcow2? Is it network-backed?<br>
<br>
There are reports with local ZFS volumes, local LVM-Thin volumes, RBD<br>
images, qcow2 on NFS. So no pattern to be seen.<br>
<br>
&gt; Apologies for the &quot;tier 1&quot; questions.<br>
<br>
Thank you for your time!<br></blockquote></div></div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Hm, I&#39;m not sure I see any pattern that might h=
elp. Could be that AHCI is just bugged during load, but it&#39;s tough to k=
now in what way.</div><div dir=3D"auto"><br></div><div dir=3D"auto">What ve=
rsions of QEMU are in use here? Is there a date on which you noticed an inc=
reased frequency of these reports?</div><div dir=3D"auto"><br></div><div di=
r=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Best Regards,<br>
Fiona<br>
<br>
@Aaron (had access to the broken images): please correct me/add anything<br=
>
relevant I missed. Are the broken VMs/backups still present? If yes, can<br=
>
we ask the user to check the logs inside?<br>
<br>
[0]:<br>
&gt; febner@enia ~/Downloads % hexdump -C dump-vm-120.raw<br>
&gt; 00000000=C2=A0 00 00 00 00 00 00 00 00=C2=A0 00 00 00 00 00 00 00 00=
=C2=A0 |................|<br>
&gt; *<br>
&gt; 00100000<br>
&gt; febner@enia ~/Downloads % hexdump -C dump-vm-130.raw<br>
&gt; 00000000=C2=A0 00 00 00 00 00 00 00 00=C2=A0 00 00 00 00 00 00 00 00=
=C2=A0 |................|<br>
&gt; *<br>
&gt; 000000c0=C2=A0 00 00 19 03 46 4d 66 6e=C2=A0 00 00 00 00 00 00 00 00=
=C2=A0 |....FMfn........|<br>
&gt; 000000d0=C2=A0 04 f2 7a 01 00 00 00 00=C2=A0 00 00 00 00 00 00 00 00=
=C2=A0 |..z.............|<br>
&gt; 000000e0=C2=A0 f0 a4 01 00 00 00 00 00=C2=A0 c8 4d 5b 99 0c 81 ff ff=
=C2=A0 |.........M[.....|<br>
&gt; 000000f0=C2=A0 00 00 00 00 00 00 00 00=C2=A0 00 00 00 00 00 00 00 00=
=C2=A0 |................|<br>
&gt; 00000100=C2=A0 00 42 e1 38 0d da ff ff=C2=A0 00 bc b4 3b 0d da ff ff=
=C2=A0 |.B.8.......;....|<br>
&gt; 00000110=C2=A0 00 00 00 00 00 00 00 00=C2=A0 00 00 00 00 00 00 00 00=
=C2=A0 |................|<br>
&gt; 00000120=C2=A0 78 00 00 00 01 00 00 00=C2=A0 a8 00 aa 00 00 00 00 00=
=C2=A0 |x...............|<br>
&gt; 00000130=C2=A0 a0 71 ba b0 0c 81 ff ff=C2=A0 2e 00 2e 00 00 00 00 00=
=C2=A0 |.q..............|<br>
&gt; 00000140=C2=A0 a0 71 ba b0 0c 81 ff ff=C2=A0 00 00 00 00 00 00 00 00=
=C2=A0 |.q..............|<br>
&gt; 00000150=C2=A0 00 00 00 00 00 00 00 00=C2=A0 00 00 00 00 00 00 00 00=
=C2=A0 |................|<br>
&gt; *<br>
&gt; 000001a0=C2=A0 5c 00 44 00 65 00 76 00=C2=A0 69 00 63 00 65 00 5c 00=
=C2=A0 |\.D.e.v.i.c.e.\.|<br>
&gt; 000001b0=C2=A0 48 00 61 00 72 00 64 00=C2=A0 64 00 69 00 73 00 6b 00=
=C2=A0 |H.a.r.d.d.i.s.k.|<br>
&gt; 000001c0=C2=A0 56 00 6f 00 6c 00 75 00=C2=A0 6d 00 65 00 32 00 5c 00=
=C2=A0 |V.o.l.u.m.e.2.\.|<br>
&gt; 000001d0=C2=A0 57 00 69 00 6e 00 64 00=C2=A0 6f 00 77 00 73 00 5c 00=
=C2=A0 |W.i.n.d.o.w.s.\.|<br>
&gt; 000001e0=C2=A0 4d 00 69 00 63 00 72 00=C2=A0 6f 00 73 00 6f 00 66 00=
=C2=A0 |M.i.c.r.o.s.o.f.|<br>
&gt; 000001f0=C2=A0 74 00 2e 00 4e 00 45 00=C2=A0 54 00 5c 00 46 00 72 00=
=C2=A0 |t...N.E.T.\.F.r.|<br>
&gt; 00000200=C2=A0 00 00 00 00 00 00 00 00=C2=A0 00 00 00 00 00 00 00 00=
=C2=A0 |................|<br>
&gt; *<br>
&gt; 00100000<br>
<br>
</blockquote></div></div></div>

--000000000000c8defa05f4c405f9--



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E8F69D135
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 17:17:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU8qK-00019i-Ba; Mon, 20 Feb 2023 11:16:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmaline@mac.com>) id 1pU7vt-0005rD-LW
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:18:25 -0500
Received: from ms11p00im-qufo17291901.me.com ([17.58.38.48])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmaline@mac.com>) id 1pU7vr-0002m4-Rt
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:18:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mac.com; s=1a1hai;
 t=1676906300; bh=aZSLZlvwf5Z0rPUn59j29QNAXScpBWVyGALPAORl9TY=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=c1QJiIXVPJm1Qk8RWItLu/WB2xD9WmN+gdpPFTH8rXVwWtxVDirmlTyGirtF/Fhlp
 iBHLzgpctEuTDXBJGLamu7/jHGxSvNPgyTv7s/vPNcj/WRSlNSXfQoKFo/6kOhZ02H
 q7IgeX7nvL7lynu6+CN2xzz1up7eFyLqQrvkG2SmfbBBOGZnzgHK1qJCb1i9UEKwuu
 dqCWMnOKPp3TOTn68D2IDtCKZ+I5tB/SZhaJ9J8UhrY7A1XLxUo1cA1tO6sRaTRsPZ
 aFPKr5lTiFJZ5CiWMcHvpM0z5CEqE1PTUP48M1SLLQaLTao1fx+S+4J1ZCKi7Xsbk5
 Atg1Mm89zMMag==
Received: from smtpclient.apple (ms11p00im-dlb-asmtpmailmevip.me.com
 [17.57.154.19])
 by ms11p00im-qufo17291901.me.com (Postfix) with ESMTPSA id 66A37BC0CC1;
 Mon, 20 Feb 2023 15:18:19 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.2\))
Subject: online blockdev-backup, a clarification (was: Summary on new backup
 interfaces in QEMU)
From: John Maline <jmaline@mac.com>
In-Reply-To: <b68833dd-8864-4d72-7c61-c134a9835036@ya.ru>
Date: Mon, 20 Feb 2023 09:18:18 -0600
Cc: qemu block <qemu-block@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
 Peter Krempa <pkrempa@redhat.com>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A02B88C5-7655-401B-92BA-4EDE169BF6B8@mac.com>
References: <b68833dd-8864-4d72-7c61-c134a9835036@ya.ru>
To: Vladimir Sementsov-Ogievskiy <v.sementsov-og@ya.ru>
X-Mailer: Apple Mail (2.3696.120.41.1.2)
X-Proofpoint-GUID: cnzMSFbbHdgU8PuaZyj-9EahErQApykz
X-Proofpoint-ORIG-GUID: cnzMSFbbHdgU8PuaZyj-9EahErQApykz
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.572,17.11.62.513.0000000_definitions?=
 =?UTF-8?Q?=3D2020-02-14=5F11:2020-02-14=5F02,2020-02-14=5F11,2021-12-02?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 clxscore=1011 mlxscore=0
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2302200140
Received-SPF: pass client-ip=17.58.38.48; envelope-from=jmaline@mac.com;
 helo=ms11p00im-qufo17291901.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 20 Feb 2023 11:16:37 -0500
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

As a qemu newcomer I had a related question and confusion from reading =
existing docs. Searching qemu-block, this seemed related to my question =
so I=E2=80=99ll ask=E2=80=A6


> On Mar 15, 2022, at 12:57 PM, Vladimir Sementsov-Ogievskiy =
<v.sementsov-og@ya.ru> wrote:
>=20
> Hi all!
>=20
> Here I want to summarize new interfaces and use cases for backup in =
QEMU.
>=20
> TODO for me: convert this into good rst documentation in docs/.

The existing docs I found at =
https://qemu.readthedocs.io/en/latest/interop/live-block-operations.html#l=
ive-disk-backup-blockdev-backup-and-the-deprecated-drive-backup are =
confusing me. This, if I=E2=80=99m understanding, seem clearer.


>=20
> OK, let's begin.
>=20
> First, note that drive-backup qmp command is deprecated.
>=20
> Next, some terminology:
>=20
> push backup: the whole process is inside QEMU process, also may be =
called "internal backup"
>=20
> pull backup: QEMU only exports a kind of snapshot (for example by =
NBD), and third party software reads this export and stores it somehow, =
also called "external backup"
>=20
> copy-before-write operations: We usually do backup of active disk, =
guest is running and may write to the disk during the process of backup. =
When guest wants to rewrite data region which is not backed up yet, we =
must stop this guest write, and copy original data to somewhere before =
continuing guest write. That's a copy-before-write operation.
>=20
> image-fleecing: the technique that allows to export a "snapshotted" =
state of the active disk with help of copy-before-write operations. We =
create a temporary image - target for copy-before-write operations, and =
provide an interface to the user to read the "snapshotted" state. And =
for read, we do read from temporary image the data which is already =
changed in original active disk, and we read unchanged data directly =
from active disk. The temporary image itself is also called "reverse =
delta" or "reversed delta".
>=20
>=20
>=20
> =3D=3D Simple push backup =3D=3D
>=20
> Just use blockdev-backup, nothing new here. I just note some technical =
details, that are relatively new:
>=20
> 1. First, backup job inserts copy-before-write filter above source =
disk, to do copy-before-write operation.
> 2. Created copy-before-write filter shares internal block-copy state =
with backup job, so they work in collaboration, to not copy same things =
twice.

The simple case I=E2=80=99m aiming for matches a push backup. I=E2=80=99m =
OK w/ a snapshot.

Environment - macos 12.6 on arm processor, guest is aarch64 centos linux =
using hvf accelerator. Qemu 7.2.

I assume what you describe w/ copy-before-write is behavior in qemu 7.2. =
I=E2=80=99m fine if the Linux client needs to do a bit of log replay if =
I revert to a backup.

In the docs I link above it talks as if a VM shutdown is recommended =
after the job completes. Seems to ruin the whole point of an online =
backup. I tried instead finishing w/ a blockdev-del and I see the backup =
file closed by qemu. I=E2=80=99m guessing that=E2=80=99s an appropriate =
way to flush/complete the backup. In an experiment, it seemed the =
generated backup worked as expected.

I=E2=80=99m hoping for confirmation or correction on my approach.

Specifically I=E2=80=99m doing the following QMP commands.

{"execute": "qmp_capabilities"}

{"execute":"blockdev-add",
 "arguments":{"node-name":"backup-node", "driver":"qcow2", =
"file":{"driver":"file", "filename":"backups/backup1.img"}}
}

{"execute":"blockdev-backup",
 "arguments":{"device":"drive0", "job-id":"job0", =
"target":"backup-node", "sync":"full"}
}

... watch many job state change events ...

{"execute":"blockdev-del",
 "arguments": {"node-name":"backup-node"}
}



--
John Maline
jmaline@mac.com




Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A2B30C431
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 16:46:04 +0100 (CET)
Received: from localhost ([::1]:50112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6xsR-0001fu-Ea
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 10:46:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l6xoL-0008FU-BA
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:41:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l6xoJ-0003Ql-0N
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:41:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612280506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0FCX/CQL7u8SDUkGaZuNLXSrJbx2H75U5eztOD8lATU=;
 b=Uwlcn1ljXs0tvhOkcCYXA3WiVmBqI/R+A2KZQhC9w/h0m8Glni1sb/r8yzqRgAfTGtl09z
 YNoQlLaDUOFOJx7wYEvBn5vGPycF70s19NlGmtgxENCUgcI9b2RRe8+ME9AEtiGc1Fh0ks
 vYBmFfs8CpszZHVDQzwOygD1zV6XBUc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-LUwiMk_BP8m5vHsN4Iy9iQ-1; Tue, 02 Feb 2021 10:41:43 -0500
X-MC-Unique: LUwiMk_BP8m5vHsN4Iy9iQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40DF0804002;
 Tue,  2 Feb 2021 15:41:42 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-202.ams2.redhat.com
 [10.36.112.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 58CAE1980D;
 Tue,  2 Feb 2021 15:41:39 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 00/12] migration: bring improved savevm/loadvm/delvm to QMP
Date: Tue,  2 Feb 2021 15:41:26 +0000
Message-Id: <20210202154138.246464-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 v1: https://lists.gnu.org/archive/html/qemu-devel/2020-07/msg00866.html=0D
 v2: https://lists.gnu.org/archive/html/qemu-devel/2020-07/msg07523.html=0D
 v3: https://lists.gnu.org/archive/html/qemu-devel/2020-08/msg07076.html=0D
 v4: https://lists.gnu.org/archive/html/qemu-devel/2020-09/msg05221.html=0D
 v5: https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg00587.html=0D
 v6: https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg02158.html=0D
 v7: https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg06205.html=0D
 v8: https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg06464.html=0D
 v9: https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg05016.html=0D
=0D
This series aims to provide a better designed replacement for the=0D
savevm/loadvm/delvm HMP commands, which despite their flaws continue=0D
to be actively used in the QMP world via the HMP command passthrough=0D
facility.=0D
=0D
The main problems addressed are:=0D
=0D
 - The logic to pick which disk to store the vmstate in is not=0D
   satsifactory.=0D
=0D
   The first block driver state cannot be assumed to be the root disk=0D
   image, it might be OVMF varstore and we don't want to store vmstate=0D
   in there.=0D
=0D
 - The logic to decide which disks must be snapshotted is hardwired=0D
   to all disks which are writable=0D
=0D
   Again with OVMF there might be a writable varstore, but this can be=0D
   raw rather than qcow2 format, and thus unable to be snapshotted.=0D
   While users might wish to snapshot their varstore, in some/many/most=0D
   cases it is entirely uneccessary. Users are blocked from snapshotting=0D
   their VM though due to this varstore.=0D
=0D
 - The commands are synchronous blocking execution and returning=0D
   errors immediately.=0D
=0D
   This is partially addressed by integrating with the job framework.=0D
   This forces the client to use the async commands to determine=0D
   the completion status or error message from the operations.=0D
=0D
In the block code I've only dealt with node names for block devices, as=0D
IIUC, this is all that libvirt should need in the -blockdev world it now=0D
lives in. IOW, I've made not attempt to cope with people wanting to use=0D
these QMP commands in combination with -drive args, as libvirt will=0D
never use -drive with a QEMU new enough to have these new commands.=0D
=0D
The main limitations of this current impl=0D
=0D
 - The snapshot process runs serialized in the main thread. ie QEMU=0D
   guest execution is blocked for the duration. The job framework=0D
   lets us fix this in future without changing the QMP semantics=0D
   exposed to the apps.=0D
=0D
 - Most vmstate loading errors just go to stderr, as they are not=0D
   using Error **errp reporting. Thus the job framework just=0D
   reports a fairly generic message=0D
=0D
     "Error -22 while loading VM state"=0D
=0D
   Again this can be fixed later without changing the QMP semantics=0D
   exposed to apps.=0D
=0D
I've done some minimal work in libvirt to start to make use of the new=0D
commands to validate their functionality, but this isn't finished yet.=0D
=0D
My ultimate goal is to make the GNOME Boxes maintainer happy again by=0D
having internal snapshots work with OVMF:=0D
=0D
  https://gitlab.gnome.org/GNOME/gnome-boxes/-/commit/c486da262f6566326fbcb=
5e=3D=0D
f45c5f64048f16a6e=0D
=0D
Changed in v10:=0D
=0D
 - Fix some mis-placed patch chunks=0D
 - Update qapi version number annotations=0D
 - Move iotests to new naming scheme=0D
 - Fix shell based iotests in tests/qemu-iotests/tests subdir=0D
 - Expand QAPI examples=0D
 - Remove bogus submodule commit update=0D
 - Optimize shell pattern matching code=0D
 - Misc other typo/whitespace fixes=0D
=0D
Changed in v9:=0D
=0D
 - Rebase to git master to resolve conflicts=0D
 - Fixed accidental regression in error handling in previous v8=0D
 - Fixed formatting of iotest expected output now that we switched=0D
   to preserving whitespace in QMP input=0D
=0D
Changed in v8:=0D
=0D
 - Rebase to git master to resolve conflicts=0D
 - Updated QAPI since versions to 6.0=0D
=0D
Changed in v7:=0D
=0D
 - Incorporate changes from:=0D
=0D
     https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg03165.html=0D
=0D
 - Tweaked error message=0D
=0D
Changed in v6:=0D
=0D
 - Resolve many conflicts with recent replay changes=0D
 - Misc typos in QAPI=0D
=0D
Changed in v5:=0D
=0D
 - Fix prevention of tag overwriting=0D
 - Refactor and expand test suite coverage to validate=0D
   more negative scenarios=0D
=0D
Changed in v4:=0D
=0D
 - Make the device lists mandatory, dropping all support for=0D
   QEMU's built-in heuristics to select devices.=0D
=0D
 - Improve some error reporting and I/O test coverage=0D
=0D
Changed in v3:=0D
=0D
 - Schedule a bottom half to escape from coroutine context in=0D
   the jobs. This is needed because the locking in the snapshot=0D
   code goes horribly wrong when run from a background coroutine=0D
   instead of the main event thread.=0D
=0D
 - Re-factor way we iterate over devices, so that we correctly=0D
   report non-existant devices passed by the user over QMP.=0D
=0D
 - Add QAPI docs notes about limitations wrt vmstate error=0D
   reporting (it all goes to stderr not an Error **errp)=0D
   so QMP only gets a fairly generic error message currently.=0D
=0D
 - Add I/O test to validate many usage scenarios / errors=0D
=0D
 - Add I/O test helpers to handle QMP events with a deterministic=0D
   ordering=0D
=0D
 - Ensure 'delete-snapshot' reports an error if requesting=0D
   delete from devices that don't support snapshot, instead of=0D
   silently succeeding with no erro.=0D
=0D
Changed in v2:=0D
=0D
 - Use new command names "snapshot-{load,save,delete}" to make it=0D
   clear that these are different from the "savevm|loadvm|delvm"=0D
   as they use the Job framework=0D
=0D
 - Use an include list for block devs, not an exclude list=0D
=0D
Daniel P. Berrang=3DC3=3DA9 (11):=0D
  block: push error reporting into bdrv_all_*_snapshot functions=0D
  migration: stop returning errno from load_snapshot()=0D
  block: add ability to specify list of blockdevs during snapshot=0D
  block: allow specifying name of block device for vmstate storage=0D
  block: rename and alter bdrv_all_find_snapshot semantics=0D
  migration: control whether snapshots are ovewritten=0D
  migration: wire up support for snapshot device selection=0D
  migration: introduce a delete_snapshot wrapper=0D
  iotests: add support for capturing and matching QMP events=0D
  iotests: fix loading of common.config from tests/ subdir=0D
  migration: introduce snapshot-{save,load,delete} QMP commands=0D
=0D
Philippe Mathieu-Daud=3DC3=3DA9 (1):=0D
  migration: Make save_snapshot() return bool, not 0/-1=0D
=0D
 block/monitor/block-hmp-cmds.c                |   7 +-=0D
 block/snapshot.c                              | 256 ++++++---=0D
 include/block/snapshot.h                      |  23 +-=0D
 include/migration/snapshot.h                  |  47 +-=0D
 migration/savevm.c                            | 296 ++++++++--=0D
 monitor/hmp-cmds.c                            |  12 +-=0D
 qapi/job.json                                 |   9 +-=0D
 qapi/migration.json                           | 157 ++++++=0D
 replay/replay-debugging.c                     |  12 +-=0D
 replay/replay-snapshot.c                      |   5 +-=0D
 softmmu/vl.c                                  |   2 +-=0D
 tests/qemu-iotests/267.out                    |  12 +-=0D
 tests/qemu-iotests/common.qemu                | 106 +++-=0D
 tests/qemu-iotests/common.rc                  |  10 +-=0D
 .../tests/internal-snapshots-qapi             | 386 +++++++++++++=0D
 .../tests/internal-snapshots-qapi.out         | 520 ++++++++++++++++++=0D
 16 files changed, 1705 insertions(+), 155 deletions(-)=0D
 create mode 100755 tests/qemu-iotests/tests/internal-snapshots-qapi=0D
 create mode 100644 tests/qemu-iotests/tests/internal-snapshots-qapi.out=0D
=0D
--=3D20=0D
2.29.2=0D
=0D



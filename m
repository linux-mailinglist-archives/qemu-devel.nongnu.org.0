Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BE830F611
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 16:21:05 +0100 (CET)
Received: from localhost ([::1]:34008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7gRM-0004Ck-8P
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 10:21:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7gOL-0002Nu-LC
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:17:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7gOF-0000Vo-9U
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:17:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612451870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GSDGExyShk4RqRU+L+nvE7dzGcG/CcZSEYNVW5kGk5M=;
 b=cdZic69dDFt/LIrHw//UmHUH5zQKaCtP5pjozyf9KMgDoO+swSogbIMKl4DhSqVlpEK9ns
 j0HQ+LSURKZUIc74ACwbNxWXSGzTv4Lsrd5X478KjX8xwI4+tO7+WmY1xD6mfXXuu6xz1k
 w0AzFigMYxEbl1q8xE0LfoHVeOB9QFk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-M3b4ZnfpMQ-7SquIRN7jtA-1; Thu, 04 Feb 2021 10:17:46 -0500
X-MC-Unique: M3b4ZnfpMQ-7SquIRN7jtA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3069801960;
 Thu,  4 Feb 2021 15:17:44 +0000 (UTC)
Received: from work-vm (ovpn-114-21.ams2.redhat.com [10.36.114.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BD035C290;
 Thu,  4 Feb 2021 15:17:42 +0000 (UTC)
Date: Thu, 4 Feb 2021 15:17:39 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v11 00/12] migration: bring improved savevm/loadvm/delvm
 to QMP
Message-ID: <20210204151739.GF24147@work-vm>
References: <20210204124834.774401-1-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210204124834.774401-1-berrange@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
>  v1: https://lists.gnu.org/archive/html/qemu-devel/2020-07/msg00866.html
>  v2: https://lists.gnu.org/archive/html/qemu-devel/2020-07/msg07523.html
>  v3: https://lists.gnu.org/archive/html/qemu-devel/2020-08/msg07076.html
>  v4: https://lists.gnu.org/archive/html/qemu-devel/2020-09/msg05221.html
>  v5: https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg00587.html
>  v6: https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg02158.html
>  v7: https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg06205.html
>  v8: https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg06464.html
>  v9: https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg05016.html
>  vA: https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg00620.html
> 
> This series aims to provide a better designed replacement for the
> savevm/loadvm/delvm HMP commands, which despite their flaws continue
> to be actively used in the QMP world via the HMP command passthrough
> facility.

Queued.

> The main problems addressed are:
> 
>  - The logic to pick which disk to store the vmstate in is not
>    satsifactory.
> 
>    The first block driver state cannot be assumed to be the root disk
>    image, it might be OVMF varstore and we don't want to store vmstate
>    in there.
> 
>  - The logic to decide which disks must be snapshotted is hardwired
>    to all disks which are writable
> 
>    Again with OVMF there might be a writable varstore, but this can be
>    raw rather than qcow2 format, and thus unable to be snapshotted.
>    While users might wish to snapshot their varstore, in some/many/most
>    cases it is entirely uneccessary. Users are blocked from snapshotting
>    their VM though due to this varstore.
> 
>  - The commands are synchronous blocking execution and returning
>    errors immediately.
> 
>    This is partially addressed by integrating with the job framework.
>    This forces the client to use the async commands to determine
>    the completion status or error message from the operations.
> 
> In the block code I've only dealt with node names for block devices, as
> IIUC, this is all that libvirt should need in the -blockdev world it now
> lives in. IOW, I've made not attempt to cope with people wanting to use
> these QMP commands in combination with -drive args, as libvirt will
> never use -drive with a QEMU new enough to have these new commands.
> 
> The main limitations of this current impl
> 
>  - The snapshot process runs serialized in the main thread. ie QEMU
>    guest execution is blocked for the duration. The job framework
>    lets us fix this in future without changing the QMP semantics
>    exposed to the apps.
> 
>  - Most vmstate loading errors just go to stderr, as they are not
>    using Error **errp reporting. Thus the job framework just
>    reports a fairly generic message
> 
>      "Error -22 while loading VM state"
> 
>    Again this can be fixed later without changing the QMP semantics
>    exposed to apps.
> 
> I've done some minimal work in libvirt to start to make use of the new
> commands to validate their functionality, but this isn't finished yet.
> 
> My ultimate goal is to make the GNOME Boxes maintainer happy again by
> having internal snapshots work with OVMF:
> 
>   https://gitlab.gnome.org/GNOME/gnome-boxes/-/commit/c486da262f6566326fbcb5e=
> f45c5f64048f16a6e
> 
> Changed in v11:
> 
>  - Add missing docs for events for snapshot-delete
>  - Fix mistaken operation name in snapshot-delete docs
> 
> Changed in v10:
> 
>  - Fix some mis-placed patch chunks
>  - Update qapi version number annotations
>  - Move iotests to new naming scheme
>  - Fix shell based iotests in tests/qemu-iotests/tests subdir
>  - Expand QAPI examples
>  - Remove bogus submodule commit update
>  - Optimize shell pattern matching code
>  - Misc other typo/whitespace fixes
> 
> Changed in v9:
> 
>  - Rebase to git master to resolve conflicts
>  - Fixed accidental regression in error handling in previous v8
>  - Fixed formatting of iotest expected output now that we switched
>    to preserving whitespace in QMP input
> 
> Changed in v8:
> 
>  - Rebase to git master to resolve conflicts
>  - Updated QAPI since versions to 6.0
> 
> Changed in v7:
> 
>  - Incorporate changes from:
> 
>      https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg03165.html
> 
>  - Tweaked error message
> 
> Changed in v6:
> 
>  - Resolve many conflicts with recent replay changes
>  - Misc typos in QAPI
> 
> Changed in v5:
> 
>  - Fix prevention of tag overwriting
>  - Refactor and expand test suite coverage to validate
>    more negative scenarios
> 
> Changed in v4:
> 
>  - Make the device lists mandatory, dropping all support for
>    QEMU's built-in heuristics to select devices.
> 
>  - Improve some error reporting and I/O test coverage
> 
> Changed in v3:
> 
>  - Schedule a bottom half to escape from coroutine context in
>    the jobs. This is needed because the locking in the snapshot
>    code goes horribly wrong when run from a background coroutine
>    instead of the main event thread.
> 
>  - Re-factor way we iterate over devices, so that we correctly
>    report non-existant devices passed by the user over QMP.
> 
>  - Add QAPI docs notes about limitations wrt vmstate error
>    reporting (it all goes to stderr not an Error **errp)
>    so QMP only gets a fairly generic error message currently.
> 
>  - Add I/O test to validate many usage scenarios / errors
> 
>  - Add I/O test helpers to handle QMP events with a deterministic
>    ordering
> 
>  - Ensure 'delete-snapshot' reports an error if requesting
>    delete from devices that don't support snapshot, instead of
>    silently succeeding with no erro.
> 
> Changed in v2:
> 
>  - Use new command names "snapshot-{load,save,delete}" to make it
>    clear that these are different from the "savevm|loadvm|delvm"
>    as they use the Job framework
> 
>  - Use an include list for block devs, not an exclude list
> 
> Daniel P. Berrang=C3=A9 (11):
>   block: push error reporting into bdrv_all_*_snapshot functions
>   migration: stop returning errno from load_snapshot()
>   block: add ability to specify list of blockdevs during snapshot
>   block: allow specifying name of block device for vmstate storage
>   block: rename and alter bdrv_all_find_snapshot semantics
>   migration: control whether snapshots are ovewritten
>   migration: wire up support for snapshot device selection
>   migration: introduce a delete_snapshot wrapper
>   iotests: add support for capturing and matching QMP events
>   iotests: fix loading of common.config from tests/ subdir
>   migration: introduce snapshot-{save,load,delete} QMP commands
> 
> Philippe Mathieu-Daud=C3=A9 (1):
>   migration: Make save_snapshot() return bool, not 0/-1
> 
>  block/monitor/block-hmp-cmds.c                |   7 +-
>  block/snapshot.c                              | 256 ++++++---
>  include/block/snapshot.h                      |  23 +-
>  include/migration/snapshot.h                  |  47 +-
>  migration/savevm.c                            | 296 ++++++++--
>  monitor/hmp-cmds.c                            |  12 +-
>  qapi/job.json                                 |   9 +-
>  qapi/migration.json                           | 173 ++++++
>  replay/replay-debugging.c                     |  12 +-
>  replay/replay-snapshot.c                      |   5 +-
>  softmmu/vl.c                                  |   2 +-
>  tests/qemu-iotests/267.out                    |  12 +-
>  tests/qemu-iotests/common.qemu                | 106 +++-
>  tests/qemu-iotests/common.rc                  |  10 +-
>  .../tests/internal-snapshots-qapi             | 386 +++++++++++++
>  .../tests/internal-snapshots-qapi.out         | 520 ++++++++++++++++++
>  16 files changed, 1721 insertions(+), 155 deletions(-)
>  create mode 100755 tests/qemu-iotests/tests/internal-snapshots-qapi
>  create mode 100644 tests/qemu-iotests/tests/internal-snapshots-qapi.out
> 
> --=20
> 2.29.2
> 
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 164145F1CE7
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 16:41:07 +0200 (CEST)
Received: from localhost ([::1]:49086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oedfu-0001oa-5g
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 10:41:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oedcn-0005vc-RK
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:37:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oedci-0007tI-Ur
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:37:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664635067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EQqF3Y50epa7tiCd99mQU2eKJbvmQDXR23+iPblZ0mM=;
 b=WqqdI6Fw7gLAnEuOe8OB0nxJ5yFH2UYDWmaZ8KAVwZT5Gwpd2xTeG1GtDSxxLosoq9pYI1
 ehRso5QRfk++mxrhCx+pU+W7/iOGgAfoG0+KQKZcdvy0/hO3/1FntU8IyJo9SWTXyM8QJC
 VG7XroGxrCDIogRoS2PogmNHgsXCF+A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-K5VF5IFnOZCU1ousvui3Jg-1; Sat, 01 Oct 2022 10:37:46 -0400
X-MC-Unique: K5VF5IFnOZCU1ousvui3Jg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4EB329AB3E5;
 Sat,  1 Oct 2022 14:37:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 480B640C6EC2;
 Sat,  1 Oct 2022 14:37:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6E67E21E691D; Sat,  1 Oct 2022 16:37:41 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: huangy81@chinatelecom.cn
Cc: qemu-devel <qemu-devel@nongnu.org>,  Peter Xu <peterx@redhat.com>,  Juan
 Quintela <quintela@redhat.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Eric Blake <eblake@redhat.com>,  Thomas Huth
 <thuth@redhat.com>,  Laurent Vivier <lvivier@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  "Daniel P. Berrange" <berrange@redhat.com>
Subject: Re: [PATCH v1 0/8] migration: introduce dirtylimit capability
References: <cover.1662052189.git.huangy81@chinatelecom.cn>
Date: Sat, 01 Oct 2022 16:37:41 +0200
In-Reply-To: <cover.1662052189.git.huangy81@chinatelecom.cn> (huangy's message
 of "Fri, 2 Sep 2022 01:22:28 +0800")
Message-ID: <87wn9jk3t6.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

huangy81@chinatelecom.cn writes:

> From: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
>
> v1:
> - make parameter vcpu-dirty-limit experimental=20
> - switch dirty limit off when cancel migrate
> - add cancel logic in migration test=20
>
> Please review, thanks,
>
> Yong=20

Are you still pursuing this feature?

> Abstract
> =3D=3D=3D=3D=3D=3D=3D=3D
>
> This series added a new migration capability called "dirtylimit".  It can
> be enabled when dirty ring is enabled, and it'll improve the vCPU perform=
ance
> during the process of migration. It is based on the previous patchset:
> https://lore.kernel.org/qemu-devel/cover.1656177590.git.huangy81@chinatel=
ecom.cn/
>
> As mentioned in patchset "support dirty restraint on vCPU", dirtylimit wa=
y of
> migration can make the read-process not be penalized. This series wires u=
p the
> vcpu dirty limit and wrappers as dirtylimit capability of migration. I in=
troduce
> two parameters vcpu-dirtylimit-period and vcpu-dirtylimit to implement th=
e setup=20
> of dirtylimit during live migration.
>
> To validate the implementation, i tested a 32 vCPU vm live migration with=
 such=20
> model:
> Only dirty vcpu0, vcpu1 with heavy memory workoad and leave the rest vcpus
> untouched, running unixbench on the vpcu8-vcpu15 by setup the cpu affinit=
y as
> the following command:
> taskset -c 8-15 ./Run -i 2 -c 8 {unixbench test item}
>
> The following are results:
>
> host cpu: Intel(R) Xeon(R) Platinum 8378A
> host interface speed: 1000Mb/s
>   |---------------------+--------+------------+---------------|
>   | UnixBench test item | Normal | Dirtylimit | Auto-converge |
>   |---------------------+--------+------------+---------------|
>   | dhry2reg            | 32800  | 32786      | 25292         |
>   | whetstone-double    | 10326  | 10315      | 9847          |
>   | pipe                | 15442  | 15271      | 14506         |
>   | context1            | 7260   | 6235       | 4514          |
>   | spawn               | 3663   | 3317       | 3249          |
>   | syscall             | 4669   | 4667       | 3841          |
>   |---------------------+--------+------------+---------------|
>>From the data above we can draw a conclusion that vcpus that do not dirty=
 memory
> in vm are almost unaffected during the dirtylimit migration, but the auto=
 converge
> way does.=20
>
> I also tested the total time of dirtylimit migration with variable dirty =
memory
> size in vm.
>
> senario 1:
> host cpu: Intel(R) Xeon(R) Platinum 8378A
> host interface speed: 1000Mb/s
>   |-----------------------+----------------+-------------------|
>   | dirty memory size(MB) | Dirtylimit(ms) | Auto-converge(ms) |
>   |-----------------------+----------------+-------------------|
>   | 60                    | 2014           | 2131              |
>   | 70                    | 5381           | 12590             |
>   | 90                    | 6037           | 33545             |
>   | 110                   | 7660           | [*]               |
>   |-----------------------+----------------+-------------------|
>   [*]: This case means migration is not convergent.=20
>
> senario 2:
> host cpu: Intel(R) Xeon(R) CPU E5-2650
> host interface speed: 10000Mb/s
>   |-----------------------+----------------+-------------------|
>   | dirty memory size(MB) | Dirtylimit(ms) | Auto-converge(ms) |
>   |-----------------------+----------------+-------------------|
>   | 1600                  | 15842          | 27548             |
>   | 2000                  | 19026          | 38447             |
>   | 2400                  | 19897          | 46381             |
>   | 2800                  | 22338          | 57149             |
>   |-----------------------+----------------+-------------------|
> Above data shows that dirtylimit way of migration can also reduce the tot=
al
> time of migration and it achieves convergence more easily in some case.
>
> In addition to implement dirtylimit capability itself, this series
> add 3 tests for migration, aiming at playing around for developer simply:=
=20
>  1. qtest for dirty limit migration
>  2. support dirty ring way of migration for guestperf tool
>  3. support dirty limit migration for guestperf tool
>
> Please review, thanks !
>
> Hyman Huang (8):
>   qapi/migration: Introduce x-vcpu-dirty-limit-period parameter
>   qapi/migration: Introduce x-vcpu-dirty-limit parameters
>   migration: Introduce dirty-limit capability
>   migration: Implement dirty-limit convergence algo
>   migration: Export dirty-limit time info
>   tests: Add migration dirty-limit capability test
>   tests/migration: Introduce dirty-ring-size option into guestperf
>   tests/migration: Introduce dirty-limit into guestperf
>
>  include/sysemu/dirtylimit.h             |   2 +
>  migration/migration.c                   |  51 +++++++++++
>  migration/migration.h                   |   1 +
>  migration/ram.c                         |  53 ++++++++---
>  migration/trace-events                  |   1 +
>  monitor/hmp-cmds.c                      |  26 ++++++
>  qapi/migration.json                     |  57 ++++++++++--
>  softmmu/dirtylimit.c                    |  33 ++++++-
>  tests/migration/guestperf/comparison.py |  24 +++++
>  tests/migration/guestperf/engine.py     |  33 ++++++-
>  tests/migration/guestperf/hardware.py   |   8 +-
>  tests/migration/guestperf/progress.py   |  17 +++-
>  tests/migration/guestperf/scenario.py   |  11 ++-
>  tests/migration/guestperf/shell.py      |  25 +++++-
>  tests/qtest/migration-test.c            | 154 ++++++++++++++++++++++++++=
++++++
>  15 files changed, 465 insertions(+), 31 deletions(-)



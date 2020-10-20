Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 203C12817E0
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Oct 2020 18:26:56 +0200 (CEST)
Received: from localhost ([::1]:51322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kONtW-0003LK-UP
	for lists+qemu-devel@lfdr.de; Fri, 02 Oct 2020 12:26:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kONsM-0002hA-7H
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 12:25:42 -0400
Received: from mail.ispras.ru ([83.149.199.84]:55608)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kONsJ-0002oy-I0
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 12:25:41 -0400
Received: from [192.168.0.183] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id DF55340A1DAC;
 Fri,  2 Oct 2020 16:25:35 +0000 (UTC)
Subject: Re: [PATCH v6 00/14] Reverse debugging
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <160137726426.31007.12061315974029139983.stgit@pasha-ThinkPad-X280>
 <74dc59b1-7a2b-4f6b-a022-3d796f86b9c7@redhat.com>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <fefce44a-7d3a-afab-1a7f-7ae0106654e9@ispras.ru>
Date: Fri, 2 Oct 2020 19:25:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <74dc59b1-7a2b-4f6b-a022-3d796f86b9c7@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/02 12:01:39
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.256,
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
Cc: kwolf@redhat.com, ehabkost@redhat.com, philmd@redhat.com,
 mtosatti@redhat.com, stefanha@redhat.com, armbru@redhat.com, mreitz@redhat.com,
 wrampazz@redhat.com, crosa@redhat.com, alex.bennee@linaro.org,
 zhiwei_liu@c-sky.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02.10.2020 18:39, Paolo Bonzini wrote:
> On 29/09/20 13:01, Pavel Dovgalyuk wrote:
>> GDB remote protocol supports reverse debugging of the targets.
>> It includes 'reverse step' and 'reverse continue' operations.
>> The first one finds the previous step of the execution,
>> and the second one is intended to stop at the last breakpoint that
>> would happen when the program is executed normally.
>>
>> Reverse debugging is possible in the replay mode, when at least
>> one snapshot was created at the record or replay phase.
>> QEMU can use these snapshots for travelling back in time with GDB.
>>
>> Running the execution in replay mode allows using GDB reverse debugging
>> commands:
>>   - reverse-stepi (or rsi): Steps one instruction to the past.
>>     QEMU loads on of the prior snapshots and proceeds to the desired
>>     instruction forward. When that step is reaches, execution stops.
>>   - reverse-continue (or rc): Runs execution "backwards".
>>     QEMU tries to find breakpoint or watchpoint by loaded prior snapshot
>>     and replaying the execution. Then QEMU loads snapshots again and
>>     replays to the latest breakpoint. When there are no breakpoints in
>>     the examined section of the execution, QEMU finds one more snapshot
>>     and tries again. After the first snapshot is processed, execution
>>     stops at this snapshot.
>>
>> The set of patches include the following modifications:
>>   - gdbstub update for reverse debugging support
>>   - functions that automatically perform reverse step and reverse
>>     continue operations
>>   - hmp/qmp commands for manipulating the replay process
>>   - improvement of the snapshotting for saving the execution step
>>     in the snapshot parameters
>>   - avocado-based acceptance tests for reverse debugging
>>
>> The patches are available in the repository:
>> https://github.com/ispras/qemu/tree/rr-200901
> 
> Hi Pavel,
> 
> I'm still seeing failures in "make check-block":
> 
> https://gitlab.com/bonzini/qemu/-/jobs/769653852

Ok, now I can reproduce it with manually running 'check -qcow2 261'.
I'll send a patch soon.

> 
> Paolo
> 
>> v6 changes:
>>   - removed passing err variable without checking it's value after
>> v5 changes:
>>   - disabled reverse debugging tests for gitlab-based testing
>>     due to the unidentified timeout problem
>> v4 changes:
>>   - added VM snapshot creation on gdb connect (suggested by Alex Bennée)
>>   - removed useless calls to error_free
>>   - updated poll interrupt processing
>>   - minor changes
>> v3 changes:
>>   - rebased to support the new build system
>>   - bumped avocado framework version for using fixed remote gdb client
>> v2 changes:
>>   - rebased to the latest upstream version
>>   - fixed replaying of the POLL interrupts after the latest debug changes
>>
>> ---
>>
>> Pavel Dovgaluk (11):
>>        replay: provide an accessor for rr filename
>>        qcow2: introduce icount field for snapshots
>>        qapi: introduce replay.json for record/replay-related stuff
>>        replay: introduce info hmp/qmp command
>>        replay: introduce breakpoint at the specified step
>>        replay: implement replay-seek command
>>        replay: flush rr queue before loading the vmstate
>>        gdbstub: add reverse step support in replay mode
>>        gdbstub: add reverse continue support in replay mode
>>        replay: describe reverse debugging in docs/replay.txt
>>        tests/acceptance: add reverse debugging test
>>
>> Pavel Dovgalyuk (3):
>>        replay: don't record interrupt poll
>>        migration: introduce icount field for snapshots
>>        replay: create temporary snapshot at debugger connection
>>
>>
>>   MAINTAINERS                           |    2
>>   accel/tcg/cpu-exec.c                  |   21 ++
>>   accel/tcg/translator.c                |    1
>>   block/qapi.c                          |   18 +-
>>   block/qcow2-snapshot.c                |    9 +
>>   block/qcow2.h                         |    3
>>   blockdev.c                            |   10 +
>>   docs/interop/qcow2.txt                |    5
>>   docs/replay.txt                       |   46 +++++
>>   exec.c                                |    8 +
>>   gdbstub.c                             |   64 ++++++
>>   hmp-commands-info.hx                  |   11 +
>>   hmp-commands.hx                       |   50 +++++
>>   include/block/snapshot.h              |    1
>>   include/monitor/hmp.h                 |    4
>>   include/sysemu/replay.h               |   26 +++
>>   migration/savevm.c                    |   17 +-
>>   qapi/block-core.json                  |   11 +
>>   qapi/meson.build                      |    1
>>   qapi/misc.json                        |   18 --
>>   qapi/qapi-schema.json                 |    1
>>   qapi/replay.json                      |  121 ++++++++++++
>>   replay/meson.build                    |    1
>>   replay/replay-debugging.c             |  332 +++++++++++++++++++++++++++++++++
>>   replay/replay-events.c                |    4
>>   replay/replay-internal.h              |    6 -
>>   replay/replay.c                       |   22 ++
>>   softmmu/cpus.c                        |   19 ++
>>   stubs/replay.c                        |   15 +
>>   tests/acceptance/reverse_debugging.py |  208 +++++++++++++++++++++
>>   tests/qemu-iotests/267.out            |   48 ++---
>>   31 files changed, 1039 insertions(+), 64 deletions(-)
>>   create mode 100644 qapi/replay.json
>>   create mode 100644 replay/replay-debugging.c
>>   create mode 100644 tests/acceptance/reverse_debugging.py
>>
>> --
>> Pavel Dovgalyuk
>>
> 



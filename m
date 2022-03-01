Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB7B4C8FBD
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 17:11:19 +0100 (CET)
Received: from localhost ([::1]:34716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP55p-0004zB-Id
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 11:11:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nP536-0003Q0-LD
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 11:08:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nP533-0007w4-1k
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 11:08:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646150901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vH6/WKf056xSNTgd0V7z2a3Nx4IdhG+EfhZ307w2FFg=;
 b=gVdymXQOkv4BT66pg1aTDGcA70Lk8N2MgjM3LafOOz4mkY30L5xXWtuOzm0ozaovP0p5wJ
 qHaRyKk00gx0tMvDNRKZTF1HyUISNKlKAqVVzrl9+r83XUx4L1a7MrpduF8H6Rzfpd6js/
 uFl0s+XOiKv5gM9Ch7c81Sxa9CaXQjA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-hkB5QKEfP326naaPw2NJrA-1; Tue, 01 Mar 2022 11:08:17 -0500
X-MC-Unique: hkB5QKEfP326naaPw2NJrA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71DC1800422;
 Tue,  1 Mar 2022 16:08:15 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 185EA1059173;
 Tue,  1 Mar 2022 16:08:11 +0000 (UTC)
Date: Tue, 1 Mar 2022 17:08:10 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v7 00/31] block layer: split block APIs in global state
 and I/O
Message-ID: <Yh5E6odY1pUw2LVf@redhat.com>
References: <20220211145153.2861415-1-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220211145153.2861415-1-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="WvweWOLsyHUkJeaB"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--WvweWOLsyHUkJeaB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Am 11.02.2022 um 15:51 hat Emanuele Giuseppe Esposito geschrieben:
> Currently, block layer APIs like block.h contain a mix of
> functions that are either running in the main loop and under the
> BQL, or are thread-safe functions and run in iothreads performing I/O.
> The functions running under BQL also take care of modifying the
> block graph, by using drain and/or aio_context_acquire/release.
> This makes it very confusing to understand where each function
> runs, and what assumptions it provided with regards to thread
> safety.
> 
> We call the functions running under BQL "global state (GS) API", and
> distinguish them from the thread-safe "I/O API".
> 
> The aim of this series is to split the relevant block headers in
> global state and I/O sub-headers. The division will be done in
> this way:
> header.h will be split in header-global-state.h, header-io.h and
> header-common.h. The latter will just contain the data structures
> needed by header-global-state and header-io, and common helpers
> that are neither in GS nor in I/O. header.h will remain for
> legacy and to avoid changing all includes in all QEMU c files,
> but will only include the two new headers. No function shall be
> added in header.c .
> Once we split all relevant headers, it will be much easier to see what
> uses the AioContext lock and remove it, which is the overall main
> goal of this and other series that I posted/will post.
> 
> In addition to splitting the relevant headers shown in this series,
> it is also very helpful splitting the function pointers in some
> block structures, to understand what runs under AioContext lock and
> what doesn't. This is what patches 21-27 do.
> 
> Each function in the GS API will have an assertion, checking
> that it is always running under BQL.
> I/O functions are instead thread safe (or so should be), meaning
> that they *can* run under BQL, but also in an iothread in another
> AioContext. Therefore they do not provide any assertion, and
> need to be audited manually to verify the correctness.
> 
> Adding assetions has helped finding 2 bugs already, as shown in
> my series "Migration: fix missing iothread locking".
> 
> Tested this series by running unit tests, qemu-iotests and qtests
> (x86_64).
> Some functions in the GS API are used everywhere but not
> properly tested. Therefore their assertion is never actually run in
> the tests, so despite my very careful auditing, it is not impossible
> to exclude that some will trigger while actually using QEMU.
> 
> Patch 1 introduces qemu_in_main_thread(), the function used in
> all assertions. This had to be introduced otherwise all unit tests
> would fail, since they run in the main loop but use the code in
> stubs/iothread.c
> Patches 2-27 (with the exception of patch 9-10, that are an additional
> assert) are all structured in the same way: first we split the header
> and in the next (or same, if small) patch we add assertions.
> Patch 28-31 take care instead of the block layer permission API,
> fixing some bugs where they are used in I/O functions.
> 
> This serie depends on my previous serie "block layer: permission API
> refactoring in preparation to the API split"
> 
> Based-on: <20220209105452.1694545-1-eesposit@redhat.com>
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Verifying the correctness of all the categorisations looked hard, so
instead of that I'll give you something to review now. :-)

The best way I could think of is to hack up a small script that checks
the consistency of all the macro annotations, i.e. no direct caller of
IO_CODE() may indirectly call GLOBAL_STATE_CODE() etc.

I'll attach that script so you can verify if the approach makes sense to
you and if my code is correct.

The good news is that the resulting list of errors is relatively small,
but it's not entirely empty. A good number of them look like false
positives (probably everything going through bdrv_co_drain_bh_cb()), but
there seem to be a few real ones, too:

Error: bdrv_get_full_backing_filename() is IO_CODE(), but calls GLOBAL_STATE_CODE() code
       bdrv_get_full_backing_filename() -> bdrv_make_absolute_filename() -> bdrv_dirname() -> GLOBAL_STATE_CODE()

Error: blk_error_action() is IO_CODE(), but calls GLOBAL_STATE_CODE() code
       blk_error_action() -> send_qmp_error_event() -> blk_iostatus_is_enabled() -> GLOBAL_STATE_CODE()

Error: bdrv_drained_end_no_poll() is IO_CODE(), but calls GLOBAL_STATE_CODE() code
       bdrv_drained_end_no_poll() -> bdrv_do_drained_end() -> bdrv_do_drained_end() -> bdrv_co_yield_to_drain() -> bdrv_co_drain_bh_cb() -> bdrv_drain_all_begin() -> GLOBAL_STATE_CODE()

Error: nbd_co_do_establish_connection() is IO_CODE(), but calls GLOBAL_STATE_CODE() code
       nbd_co_do_establish_connection() -> nbd_handle_updated_info() -> bdrv_apply_auto_read_only() -> GLOBAL_STATE_CODE()

Error: bdrv_drained_end_no_poll() is IO_CODE(), but calls IO_OR_GS_CODE() code
       bdrv_drained_end_no_poll() -> bdrv_do_drained_end() -> bdrv_do_drained_end() -> bdrv_co_yield_to_drain() -> bdrv_co_drain_bh_cb() -> bdrv_drain_all_begin() -> bdrv_do_drained_begin() -> bdrv_do_drained_begin() -> bdrv_do_drained_begin_quiesce() -> IO_OR_GS_CODE()

Error: blk_drain() is IO_OR_GS_CODE(), but calls GLOBAL_STATE_CODE() code
       blk_drain() -> bdrv_ref() -> GLOBAL_STATE_CODE()

Error: bdrv_drained_begin() is IO_OR_GS_CODE(), but calls GLOBAL_STATE_CODE() code
       bdrv_drained_begin() -> bdrv_do_drained_begin() -> bdrv_do_drained_begin() -> bdrv_co_yield_to_drain() -> bdrv_co_drain_bh_cb() -> bdrv_drain_all_begin() -> GLOBAL_STATE_CODE()

Error: bdrv_subtree_drained_begin() is IO_OR_GS_CODE(), but calls GLOBAL_STATE_CODE() code
       bdrv_subtree_drained_begin() -> bdrv_do_drained_begin() -> bdrv_do_drained_begin() -> bdrv_co_yield_to_drain() -> bdrv_co_drain_bh_cb() -> bdrv_drain_all_begin() -> GLOBAL_STATE_CODE()

Error: bdrv_drained_end() is IO_OR_GS_CODE(), but calls GLOBAL_STATE_CODE() code
       bdrv_drained_end() -> bdrv_do_drained_end() -> bdrv_do_drained_end() -> bdrv_co_yield_to_drain() -> bdrv_co_drain_bh_cb() -> bdrv_drain_all_begin() -> GLOBAL_STATE_CODE()

Error: bdrv_subtree_drained_end() is IO_OR_GS_CODE(), but calls GLOBAL_STATE_CODE() code
       bdrv_subtree_drained_end() -> bdrv_do_drained_end() -> bdrv_do_drained_end() -> bdrv_co_yield_to_drain() -> bdrv_co_drain_bh_cb() -> bdrv_drain_all_begin() -> GLOBAL_STATE_CODE()

Error: bdrv_apply_subtree_drain() is IO_OR_GS_CODE(), but calls GLOBAL_STATE_CODE() code
       bdrv_apply_subtree_drain() -> bdrv_do_drained_begin() -> bdrv_do_drained_begin() -> bdrv_co_yield_to_drain() -> bdrv_co_drain_bh_cb() -> bdrv_drain_all_begin() -> GLOBAL_STATE_CODE()

Error: bdrv_unapply_subtree_drain() is IO_OR_GS_CODE(), but calls GLOBAL_STATE_CODE() code
       bdrv_unapply_subtree_drain() -> bdrv_do_drained_end() -> bdrv_do_drained_end() -> bdrv_co_yield_to_drain() -> bdrv_co_drain_bh_cb() -> bdrv_drain_all_begin() -> GLOBAL_STATE_CODE()

Error: bdrv_co_drain() is IO_OR_GS_CODE(), but calls GLOBAL_STATE_CODE() code
       bdrv_co_drain() -> bdrv_drained_begin() -> bdrv_do_drained_begin() -> bdrv_do_drained_begin() -> bdrv_co_yield_to_drain() -> bdrv_co_drain_bh_cb() -> bdrv_drain_all_begin() -> GLOBAL_STATE_CODE()

Error: bdrv_drain() is IO_OR_GS_CODE(), but calls GLOBAL_STATE_CODE() code
       bdrv_drain() -> bdrv_drained_begin() -> bdrv_do_drained_begin() -> bdrv_do_drained_begin() -> bdrv_co_yield_to_drain() -> bdrv_co_drain_bh_cb() -> bdrv_drain_all_begin() -> GLOBAL_STATE_CODE()

Do you want to address some of these cases before we merge the series? I
expect that usually we just miscategorised the caller, so the assertion
wouldn't actually fail at runtime, but I haven't checked in detail yet.

Kevin

--WvweWOLsyHUkJeaB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="check_calls.py"

#!/usr/bin/env python3

from typing import Dict, List, Sequence, Set, Tuple
import subprocess
import sys

def cflow(filenames: Sequence[str]) -> str:
    args = [
        'cflow',
        '-AArd2',
        *filenames
    ]
    print(' '.join(f'"{x}"' for x in args))
    p = subprocess.Popen(args,
                         stdout=subprocess.PIPE,
                         stderr=None,
                         universal_newlines=True)
    return p.communicate()[0]

CallGraph = Dict[str, List[str]]

def build_call_graph(cflow_output: str) -> CallGraph:
    call_graph = {}
    cur = None

    for line in cflow_output.split('\n'):
        if not line:
            continue
        indented = line[0] == ' '
        line = line.strip().split(None, 1)[0]
        if line.endswith(':'):
            line = line[:-1]

        if not indented:
            if line in call_graph:
                print(f"Warning: {line} redefined")
            else:
                call_graph[line] = []
            cur = line
        else:
            call_graph[cur].append(line)

    return call_graph

def recursive_callers(call_graph: CallGraph, start: str
                      ) -> Tuple[Set[str],Dict[str, str]]:
    result = set()
    to_process = [start]
    paths = {start: start}

    while to_process:
        caller = to_process.pop()
        if caller in result:
            continue
        result.add(caller)
        if caller in call_graph:
            to_process += call_graph[caller]
            for c in call_graph[caller]:
                paths[c] = f'{c} -> {paths[caller]}'
    return result, paths

def check_conflict(call_graph: CallGraph,
                   checked_class: str,
                   disallowed: Set[str],
                   disallowed_class: str,
                   disallowed_paths: Dict[str, str]) -> None:
    if checked_class not in call_graph:
        return

    for fn in call_graph[checked_class]:
        if fn in disallowed:
            print(f'Error: {fn} is {checked_class}, but calls {disallowed_class} code')
            print(f'       {disallowed_paths[fn]}')
            print()

def main() -> None:
    filenames = sys.argv[1:]
    cflow_output = cflow(filenames)
    call_graph = build_call_graph(cflow_output)

    calling_gs, paths_gs = recursive_callers(call_graph, 'GLOBAL_STATE_CODE()')
    calling_io_or_gs, paths_io_or_gs = recursive_callers(call_graph, 'IO_OR_GS_CODE()')
    calling_io, paths_io = recursive_callers(call_graph, 'IO_CODE()')

    check_conflict(call_graph, 'IO_CODE()',
                   calling_gs, 'GLOBAL_STATE_CODE()', paths_gs)
    check_conflict(call_graph, 'IO_CODE()',
                   calling_io_or_gs, 'IO_OR_GS_CODE()', paths_io_or_gs)
    check_conflict(call_graph, 'IO_OR_GS_CODE()',
                   calling_gs, 'GLOBAL_STATE_CODE()', paths_gs)

if __name__ == '__main__':
    main()

--WvweWOLsyHUkJeaB--



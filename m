Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6005F7507
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 10:04:14 +0200 (CEST)
Received: from localhost ([::1]:35638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogiL7-0006WB-5e
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 04:04:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1ogiHA-0004v2-6j
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 04:00:09 -0400
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200]:34650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1ogiGy-0004Yt-5c
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 03:59:59 -0400
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id F1D0460038;
 Fri,  7 Oct 2022 10:52:16 +0300 (MSK)
Received: from den-plotnikov-w.yandex-team.ru (unknown
 [2a02:6b8:b081:16::1:1f])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 9pXW8lgM7E-qFOesB7T; Fri, 07 Oct 2022 10:52:15 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1665129136; bh=Q5oo2EE1aR6vAJpWUcWBc+5YaEwUZ1JDqmWGdrHM6Os=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=aLJEdeHo9uCQDBNDqLaCN9N5dbqN5PjcncQecKRZZTpk+oNI7246w6zCGO0decMUL
 C6o3uKHGXSWwdgCNfFx6xbOsZwosPzp0XVLrkNk0Ryctz4uOwx1xHyMo4/dxSJvZ5P
 YRkllPrSoUOv9o/+CQtb0nd+Gd5eiljBAbCMFx00=
Authentication-Results: iva4-f06c35e68a0a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Denis Plotnikov <den-plotnikov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: yc-core@yandex-team.ru, armbru@redhat.com, michael.roth@amd.com,
 vsementsov@yandex-team.ru
Subject: [PATCH v1] qapi/qmp: Add timestamps to qmp command responses
Date: Fri,  7 Oct 2022 10:52:08 +0300
Message-Id: <20221007075208.175614-1-den-plotnikov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=den-plotnikov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Add "start" & "end" time values to qmp command responses.

These time values are added to let the qemu management layer get the exact
command execution time without any other time variance which might be brought by
other parts of management layer or qemu internals. This is particulary useful
for the management layer logging for later problems resolving.

Example of result:

    ./qemu/scripts/qmp/qmp-shell /tmp/qmp.socket

    (QEMU) query-status
    {"end": {"seconds": 1650367305, "microseconds": 831032},
     "start": {"seconds": 1650367305, "microseconds": 831012},
     "return": {"status": "running", "singlestep": false, "running": true}}

The responce of the qmp command contains the start & end time of
the qmp command processing.

Suggested-by: Andrey Ryabinin <arbn@yandex-team.ru>
Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
---
v0->v1:
 - remove interface to control "start" and "end" time values: return timestamps unconditionally
 - add description to qmp specification
 - leave the same timestamp format in "seconds", "microseconds" to be consistent with events
   timestamp
 - fix patch description

 docs/interop/qmp-spec.txt | 20 ++++++++++++++++++--
 qapi/qmp-dispatch.c       | 18 ++++++++++++++++++
 2 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/docs/interop/qmp-spec.txt b/docs/interop/qmp-spec.txt
index b0e8351d5b261..d1cca8bc447ce 100644
--- a/docs/interop/qmp-spec.txt
+++ b/docs/interop/qmp-spec.txt
@@ -158,7 +158,9 @@ responses that have an unknown "id" field.
 
 The format of a success response is:
 
-{ "return": json-value, "id": json-value }
+{ "return": json-value, "id": json-value,
+  "start": {"seconds": json-value, "microseconds": json-value},
+  "end": {"seconds": json-value, "microseconds": json-value} }
 
  Where,
 
@@ -169,13 +171,21 @@ The format of a success response is:
   command does not return data
 - The "id" member contains the transaction identification associated
   with the command execution if issued by the Client
+- The "start" member contains the exact time of when the command has been
+  stated to be processed. It is a fixed json-object with time in
+  seconds and microseconds relative to the Unix Epoch (1 Jan 1970)
+- The "end" member contains the exact time of when the command has been
+  finished to be processed. It is a fixed json-object with time in
+  seconds and microseconds relative to the Unix Epoch (1 Jan 1970)
 
 2.4.2 error
 -----------
 
 The format of an error response is:
 
-{ "error": { "class": json-string, "desc": json-string }, "id": json-value }
+{ "error": { "class": json-string, "desc": json-string }, "id": json-value
+  "start": {"seconds": json-value, "microseconds": json-value},
+  "end": {"seconds": json-value, "microseconds": json-value} }
 
  Where,
 
@@ -184,6 +194,12 @@ The format of an error response is:
   not attempt to parse this message.
 - The "id" member contains the transaction identification associated with
   the command execution if issued by the Client
+- The "start" member contains the exact time of when the command has been
+  stated to be processed. It is a fixed json-object with time in
+  seconds and microseconds relative to the Unix Epoch (1 Jan 1970)
+- The "end" member contains the exact time of when the command has been
+  finished to be processed. It is a fixed json-object with time in
+  seconds and microseconds relative to the Unix Epoch (1 Jan 1970)
 
 NOTE: Some errors can occur before the Server is able to read the "id" member,
 in these cases the "id" member will not be part of the error response, even
diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
index 0990873ec8ec1..fce87416f2128 100644
--- a/qapi/qmp-dispatch.c
+++ b/qapi/qmp-dispatch.c
@@ -130,6 +130,22 @@ static void do_qmp_dispatch_bh(void *opaque)
     aio_co_wake(data->co);
 }
 
+static void add_timestamps(QDict *qdict, uint64_t start_ms, uint64_t end_ms)
+{
+    QDict *start_dict, *end_dict;
+
+    start_dict = qdict_new();
+    qdict_put_int(start_dict, "seconds", start_ms / G_USEC_PER_SEC);
+    qdict_put_int(start_dict, "microseconds", start_ms % G_USEC_PER_SEC);
+
+    end_dict = qdict_new();
+    qdict_put_int(end_dict, "seconds", end_ms / G_USEC_PER_SEC);
+    qdict_put_int(end_dict, "microseconds", end_ms % G_USEC_PER_SEC);
+
+    qdict_put_obj(qdict, "start", QOBJECT(start_dict));
+    qdict_put_obj(qdict, "end", QOBJECT(end_dict));
+}
+
 /*
  * Runs outside of coroutine context for OOB commands, but in coroutine
  * context for everything else.
@@ -146,6 +162,7 @@ QDict *qmp_dispatch(const QmpCommandList *cmds, QObject *request,
     QObject *id;
     QObject *ret = NULL;
     QDict *rsp = NULL;
+    uint64_t ts_start = g_get_real_time();
 
     dict = qobject_to(QDict, request);
     if (!dict) {
@@ -270,5 +287,6 @@ out:
         qdict_put_obj(rsp, "id", qobject_ref(id));
     }
 
+    add_timestamps(rsp, ts_start, g_get_real_time());
     return rsp;
 }
-- 
2.25.1



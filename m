Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B374309E1C
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 18:36:15 +0100 (CET)
Received: from localhost ([::1]:39250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Gdy-0007rs-Ap
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 12:36:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1l6Gc9-00071H-J2
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 12:34:21 -0500
Received: from mailout02.t-online.de ([194.25.134.17]:36940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1l6Gc7-00031z-Ou
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 12:34:21 -0500
Received: from fwd41.aul.t-online.de (fwd41.aul.t-online.de [172.20.27.139])
 by mailout02.t-online.de (Postfix) with SMTP id 7EA23419B17F;
 Sun, 31 Jan 2021 18:34:16 +0100 (CET)
Received: from linpower.localnet
 (S+XiwZZ-8h8EL9GrRH7o5UwPlyH1tpIpp1rqsvl0C1r03B95ejssbHJ7D1yqUkQgGA@[93.236.159.226])
 by fwd41.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1l6Gc4-3r1LiS0; Sun, 31 Jan 2021 18:34:16 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id C7958200612; Sun, 31 Jan 2021 18:34:15 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH] simpletrace: build() missing 2 required positional arguments
Date: Sun, 31 Jan 2021 18:34:15 +0100
Message-Id: <20210131173415.3392-1-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: S+XiwZZ-8h8EL9GrRH7o5UwPlyH1tpIpp1rqsvl0C1r03B95ejssbHJ7D1yqUkQgGA
X-TOI-EXPURGATEID: 150726::1612114456-00000C4D-4A31962E/0/0 CLEAN NORMAL
X-TOI-MSGID: d97cfeb3-27b2-4c66-b820-b3418322b0e3
Received-SPF: none client-ip=194.25.134.17;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout02.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Cleber Rosa <crosa@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 4e66c9ef64 "tracetool: add input filename and line number to
Event" forgot to add a line number and a filename argument at one
build method call site.

Traceback (most recent call last):
  File "./scripts/simpletrace.py", line 261, in <module>
    run(Formatter())
  File "./scripts/simpletrace.py", line 236, in run
    process(events, sys.argv[2], analyzer, read_header=read_header)
  File "./scripts/simpletrace.py", line 177, in process
    dropped_event =
      Event.build("Dropped_Event(uint64_t num_events_dropped)")
TypeError: build() missing 2 required positional arguments:
  'lineno' and 'filename'

Add the missing arguments.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 scripts/simpletrace.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/simpletrace.py b/scripts/simpletrace.py
index 20f0026066..d61fb0bd87 100755
--- a/scripts/simpletrace.py
+++ b/scripts/simpletrace.py
@@ -174,7 +174,9 @@ def process(events, log, analyzer, read_header=True):
     if read_header:
         read_trace_header(log)
 
-    dropped_event = Event.build("Dropped_Event(uint64_t num_events_dropped)")
+    frameinfo = inspect.getframeinfo(inspect.currentframe())
+    dropped_event = Event.build("Dropped_Event(uint64_t num_events_dropped)",
+                                frameinfo.lineno + 1, frameinfo.filename)
     edict = {"dropped": dropped_event}
     idtoname = {dropped_event_id: "dropped"}
 
-- 
2.26.2



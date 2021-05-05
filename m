Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F173738C7
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 12:45:01 +0200 (CEST)
Received: from localhost ([::1]:51512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leF1Y-0000re-JI
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 06:45:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1leEv3-0001LX-4h
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:38:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1leEv0-0007kD-OD
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:38:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620211094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hhg8q6k50z+vNJQbPykxVts+XvN6KPzMWEvbV3M/T9Y=;
 b=FRLSxmoxRaoKiabAmiYfQ8tQy6rL4bzinApaz1nYn5UOudzTPfbwaaM2rcY7kCV0gpZVcY
 pCKlmSt9LBFd964Jvcfk7qvEC/2fmMqcAlFaTZTXLsludP9kgUmwPh1uE0I1pisDRtGiF1
 0j9wI+biBWsxj6VaAwnjw3UuAnUdN5A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-se2YcjuVOd-z_NLEHje_9g-1; Wed, 05 May 2021 06:38:12 -0400
X-MC-Unique: se2YcjuVOd-z_NLEHje_9g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A73A801B14;
 Wed,  5 May 2021 10:38:11 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-253.ams2.redhat.com
 [10.36.114.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40550679E9;
 Wed,  5 May 2021 10:38:05 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/7] linux-user: use GDateTime for formatting timestamp for
 core file
Date: Wed,  5 May 2021 11:37:01 +0100
Message-Id: <20210505103702.521457-7-berrange@redhat.com>
In-Reply-To: <20210505103702.521457-1-berrange@redhat.com>
References: <20210505103702.521457-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 virtio-fs@redhat.com, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The GDateTime APIs provided by GLib avoid portability pitfalls, such
as some platforms where 'struct timeval.tv_sec' field is still 'long'
instead of 'time_t'. When combined with automatic cleanup, GDateTime
often results in simpler code too.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 linux-user/elfload.c | 36 +++++++++---------------------------
 1 file changed, 9 insertions(+), 27 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index c6731013fd..c38b7b4d37 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -3386,7 +3386,6 @@ static size_t note_size(const struct memelfnote *);
 static void free_note_info(struct elf_note_info *);
 static int fill_note_info(struct elf_note_info *, long, const CPUArchState *);
 static void fill_thread_info(struct elf_note_info *, const CPUArchState *);
-static int core_dump_filename(const TaskState *, char *, size_t);
 
 static int dump_write(int, const void *, size_t);
 static int write_note(struct memelfnote *, int);
@@ -3685,32 +3684,16 @@ static void fill_auxv_note(struct memelfnote *note, const TaskState *ts)
  * for the name:
  *     qemu_<basename-of-target-binary>_<date>-<time>_<pid>.core
  *
- * Returns 0 in case of success, -1 otherwise (errno is set).
+ * Returns the filename
  */
-static int core_dump_filename(const TaskState *ts, char *buf,
-                              size_t bufsize)
+static char *core_dump_filename(const TaskState *ts)
 {
-    char timestamp[64];
-    char *base_filename = NULL;
-    struct timeval tv;
-    struct tm tm;
+    g_autoptr(GDateTime) now = g_date_time_new_now_local();
+    g_autofree char *nowstr = g_date_time_format(now, "%Y%m%d-%H%M%S");
+    g_autofree char *base_filename = g_path_get_basename(ts->bprm->filename);
 
-    assert(bufsize >= PATH_MAX);
-
-    if (gettimeofday(&tv, NULL) < 0) {
-        (void) fprintf(stderr, "unable to get current timestamp: %s",
-                       strerror(errno));
-        return (-1);
-    }
-
-    base_filename = g_path_get_basename(ts->bprm->filename);
-    (void) strftime(timestamp, sizeof (timestamp), "%Y%m%d-%H%M%S",
-                    localtime_r(&tv.tv_sec, &tm));
-    (void) snprintf(buf, bufsize, "qemu_%s_%s_%d.core",
-                    base_filename, timestamp, (int)getpid());
-    g_free(base_filename);
-
-    return (0);
+    return g_strdup_printf("qemu_%s_%s_%d.core",
+                           base_filename, nowstr, (int)getpid());
 }
 
 static int dump_write(int fd, const void *ptr, size_t size)
@@ -3938,7 +3921,7 @@ static int elf_core_dump(int signr, const CPUArchState *env)
     const CPUState *cpu = env_cpu((CPUArchState *)env);
     const TaskState *ts = (const TaskState *)cpu->opaque;
     struct vm_area_struct *vma = NULL;
-    char corefile[PATH_MAX];
+    g_autofree char *corefile = NULL;
     struct elf_note_info info;
     struct elfhdr elf;
     struct elf_phdr phdr;
@@ -3955,8 +3938,7 @@ static int elf_core_dump(int signr, const CPUArchState *env)
     if (dumpsize.rlim_cur == 0)
         return 0;
 
-    if (core_dump_filename(ts, corefile, sizeof (corefile)) < 0)
-        return (-errno);
+    corefile = core_dump_filename(ts);
 
     if ((fd = open(corefile, O_WRONLY | O_CREAT,
                    S_IRUSR|S_IWUSR|S_IRGRP|S_IROTH)) < 0)
-- 
2.31.1



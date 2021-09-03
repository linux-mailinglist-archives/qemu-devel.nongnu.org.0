Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4564004BA
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 20:16:52 +0200 (CEST)
Received: from localhost ([::1]:49600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMDkB-0006pR-67
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 14:16:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDHw-0001bu-Qn
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:47:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDHu-0002Yn-SI
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:47:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630691258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=75WD5cgGLGf6CXabmurrx2v8dkC4eCS9lx1cW5KQ36E=;
 b=Zl2wSn9j8mQSBAMT9yBLefxSJffSvnCxk2sRd1+Wk1nu8Gf/1gpK/GMjXukClzVwGqMbDX
 H5vHnu2r8gI9m1XncczNlodzag7Ld7sVW/BlhuxSYYbcuIjRfhzsJuxuRVzj9drkX5xHF9
 ZjaSADaqMkl/ihKrRUlgZryC15rNXC4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-Qz-i2dA7MbuXF8oza2fy6A-1; Fri, 03 Sep 2021 13:47:37 -0400
X-MC-Unique: Qz-i2dA7MbuXF8oza2fy6A-1
Received: by mail-wr1-f71.google.com with SMTP id
 p10-20020adfce0a000000b001572d05c970so1817016wrn.21
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 10:47:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=75WD5cgGLGf6CXabmurrx2v8dkC4eCS9lx1cW5KQ36E=;
 b=CbCz43Ya69/DKDe0pOjj7OL9td1SUAuNwJKrbSeNCDKqXdmSweCMXV92IFYBPzqmIK
 bp0mPtsMEp56uF+oeBGcRkyrM41u+Isr8/o5lQCKpDQtPCMbHokNw3nrryw4wYXc+WZY
 1k6J4qO+aH6JgSz+uHnWrRFBM56aTltAqh7KJFYmnn37E5ab8yQ70Pjvc4fMUX+H2LL3
 HzkfATgV6V6KT0tD2yIDMmWkjmlFf59j7yyy1bgcLoS2QsNInGjok66AD1tJPxYK5/YN
 MIh0fe8tZmzmcBxk40HMo+neCdjlH8xvohP54UsrtpwPBk/L3ZV3/WD/09L/P082r8I4
 LafA==
X-Gm-Message-State: AOAM533GaBK54bGh7vsA3DAeUqI+jmLevh5bIpjTDD1m5RLW+uum/mVf
 Tcg5HL1G9KLtZn1ikV8caA2JbRGPC6W+7fipU6iFszO20k/6Zhe92bD/VAryyasYJcFk3KNx8YR
 RAl3Guu2G//njDFGf7oM8oRZTIiUwlBKDHM3yFyHi08ziXET3zBqDsD2N+pJvCHW3
X-Received: by 2002:adf:dd11:: with SMTP id a17mr300015wrm.132.1630691256011; 
 Fri, 03 Sep 2021 10:47:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7BgK52mtpI3RuPzT5ho7tF6wWlyZMl2NdG2FpuBKkaQ39kg0uIo/dYn7Mgrr7l+Wu1Xe/0w==
X-Received: by 2002:adf:dd11:: with SMTP id a17mr299969wrm.132.1630691255750; 
 Fri, 03 Sep 2021 10:47:35 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id l124sm85542wml.8.2021.09.03.10.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 10:47:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 27/28] contrib: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:45:09 +0200
Message-Id: <20210903174510.751630-28-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903174510.751630-1-philmd@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

  The old API took the size of the memory to duplicate as a guint,
  whereas most memory functions take memory sizes as a gsize. This
  made it easy to accidentally pass a gsize to g_memdup(). For large
  values, that would lead to a silent truncation of the size from 64
  to 32 bits, and result in a heap area being returned which is
  significantly smaller than what the caller expects. This can likely
  be exploited in various modules to cause a heap buffer overflow.

Replace g_memdup() by the safer g_memdup2() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 contrib/plugins/lockstep.c |  2 +-
 contrib/rdmacm-mux/main.c  | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/contrib/plugins/lockstep.c b/contrib/plugins/lockstep.c
index 7fd35eb6692..1c6a9f7a044 100644
--- a/contrib/plugins/lockstep.c
+++ b/contrib/plugins/lockstep.c
@@ -130,7 +130,7 @@ static void report_divergance(ExecState *us, ExecState *them)
         }
     }
     divergence_log = g_slist_prepend(divergence_log,
-                                     g_memdup(&divrec, sizeof(divrec)));
+                                     g_memdup2(&divrec, sizeof(divrec)));
 
     /* Output short log entry of going out of sync... */
     if (verbose || divrec.distance == 1 || diverged) {
diff --git a/contrib/rdmacm-mux/main.c b/contrib/rdmacm-mux/main.c
index 771ca01e03f..0899dca2885 100644
--- a/contrib/rdmacm-mux/main.c
+++ b/contrib/rdmacm-mux/main.c
@@ -227,8 +227,8 @@ static RdmaCmMuxErrCode add_fd_ifid_pair(int fd, __be64 gid_ifid)
                            RDMACM_MUX_ERR_CODE_EACCES;
     }
 
-    g_hash_table_insert(server.umad_agent.gid2fd, g_memdup(&gid_ifid,
-                        sizeof(gid_ifid)), g_memdup(&fd, sizeof(fd)));
+    g_hash_table_insert(server.umad_agent.gid2fd, g_memdup2(&gid_ifid,
+                        sizeof(gid_ifid)), g_memdup2(&fd, sizeof(fd)));
 
     pthread_rwlock_unlock(&server.lock);
 
@@ -250,7 +250,7 @@ static RdmaCmMuxErrCode delete_fd_ifid_pair(int fd, __be64 gid_ifid)
         return RDMACM_MUX_ERR_CODE_ENOTFOUND;
     }
 
-    g_hash_table_remove(server.umad_agent.gid2fd, g_memdup(&gid_ifid,
+    g_hash_table_remove(server.umad_agent.gid2fd, g_memdup2(&gid_ifid,
                         sizeof(gid_ifid)));
     pthread_rwlock_unlock(&server.lock);
 
@@ -267,8 +267,8 @@ static void hash_tbl_save_fd_comm_id_pair(int fd, uint32_t comm_id,
 
     pthread_rwlock_wrlock(&server.lock);
     g_hash_table_insert(server.umad_agent.commid2fd,
-                        g_memdup(&comm_id, sizeof(comm_id)),
-                        g_memdup(&fde, sizeof(fde)));
+                        g_memdup2(&comm_id, sizeof(comm_id)),
+                        g_memdup2(&fde, sizeof(fde)));
     pthread_rwlock_unlock(&server.lock);
 }
 
-- 
2.31.1



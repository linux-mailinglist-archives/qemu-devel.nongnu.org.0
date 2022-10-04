Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB5F5F4954
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 20:36:49 +0200 (CEST)
Received: from localhost ([::1]:39740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofmme-00088j-7d
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 14:36:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ofmaz-0007SR-Oa
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 14:24:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ofmar-0005ev-K3
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 14:24:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664907876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aBo8kaSgzrPlPFCxry/VlgmoCrJ5p25bkvjheGnJSRg=;
 b=BKSR7+jDNF9QkgwLLM+KrE6wEkIM0CVWGMKjR7tF5CooRLo9b+JmSdq4q2y5QFWuAuGCZC
 DP3EfKAqaGKkTXflFGPLF2gtrtYhJa4e0LmV9izT8TWEQ/XncVrFEgrQcoDvC+Q7zHAPu2
 ulDOSBBwRUQo81LdgDl9sd1yG5UKSt4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-373-anBo071rNF-SeSZXAqpMHA-1; Tue, 04 Oct 2022 14:24:35 -0400
X-MC-Unique: anBo071rNF-SeSZXAqpMHA-1
Received: by mail-qv1-f72.google.com with SMTP id
 q6-20020a0cf5c6000000b004b1999f94bcso3247502qvm.15
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 11:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=aBo8kaSgzrPlPFCxry/VlgmoCrJ5p25bkvjheGnJSRg=;
 b=DWwID/Rc+cS4ud/TMsFBMMPcO9R3M1l8C0gxi+0JaxmN8kupf/SZAlOZSCO8djeNnc
 99diYadTBTz6djT5d1OLuorxOSRTxN3Nl+9AP12+RuWbATDGpa4Zzo0SvOU4I/U8nKhi
 UL1X5qZdiOaSenLMVMpuZVI0ad/Hoyg1hpW9oj2VhjZ+2g49b/rBYeUUepIv1Jl4t/72
 wrxZOHpYrslz4I7oQSjgLsUKwLO1BPvj4Ed14uP3ma5FdoffzxQZzjDfQJRnG0vWezuV
 VF0Eg4P/6lunU+aK6XeHgLUEqurDnks02HloaFipk30FrdW/54FHounAIBsPN/NxkjRq
 d6cQ==
X-Gm-Message-State: ACrzQf0D48G1IRA9OwzTU06h3qoe4qQkxMPwAWFs6CdYOWtvAghwD1WY
 Y79uMf9uJfthqBAx+dpKr0UM8i7SQioOefdokOnUlep39itPOXPH+i3joR18DxWXa+13C+67f61
 v404ZSZX4weOBDDCa47BVgHAE+9h9/tl8UpiNm33eLF7xIjvy6bXcf16eRAkJX6ln
X-Received: by 2002:a05:622a:64a:b0:389:b7de:1890 with SMTP id
 a10-20020a05622a064a00b00389b7de1890mr2598558qtb.488.1664907874548; 
 Tue, 04 Oct 2022 11:24:34 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7bKQtSemJ7ZAsUltXW5gAXYOsEaj96PdRYoi4wm/322OND4eap0iBEI+aFc16dWWUx/tJL1Q==
X-Received: by 2002:a05:622a:64a:b0:389:b7de:1890 with SMTP id
 a10-20020a05622a064a00b00389b7de1890mr2598534qtb.488.1664907874204; 
 Tue, 04 Oct 2022 11:24:34 -0700 (PDT)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 i1-20020ac813c1000000b0035c1e18762csm12334514qtj.84.2022.10.04.11.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 11:24:33 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH v2 2/5] migration: Fix race on qemu_file_shutdown()
Date: Tue,  4 Oct 2022 14:24:27 -0400
Message-Id: <20221004182430.97638-3-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221004182430.97638-1-peterx@redhat.com>
References: <20221004182430.97638-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

In qemu_file_shutdown(), there's a possible race if with current order of
operation.  There're two major things to do:

  (1) Do real shutdown() (e.g. shutdown() syscall on socket)
  (2) Update qemufile's last_error

We must do (2) before (1) otherwise there can be a race condition like:

      page receiver                     other thread
      -------------                     ------------
      qemu_get_buffer()
                                        do shutdown()
        returns 0 (buffer all zero)
        (meanwhile we didn't check this retcode)
      try to detect IO error
        last_error==NULL, IO okay
      install ALL-ZERO page
                                        set last_error
      --> guest crash!

To fix this, we can also check retval of qemu_get_buffer(), but not all
APIs can be properly checked and ultimately we still need to go back to
qemu_file_get_error().  E.g. qemu_get_byte() doesn't return error.

Maybe some day a rework of qemufile API is really needed, but for now keep
using qemu_file_get_error() and fix it by not allowing that race condition
to happen.  Here shutdown() is indeed special because the last_error was
emulated.  For real -EIO errors it'll always be set when e.g. sendmsg()
error triggers so we won't miss those ones, only shutdown() is a bit tricky
here.

Cc: Daniel P. Berrange <berrange@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/qemu-file.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 4f400c2e52..2d5f74ffc2 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -79,6 +79,30 @@ int qemu_file_shutdown(QEMUFile *f)
     int ret = 0;
 
     f->shutdown = true;
+
+    /*
+     * We must set qemufile error before the real shutdown(), otherwise
+     * there can be a race window where we thought IO all went though
+     * (because last_error==NULL) but actually IO has already stopped.
+     *
+     * If without correct ordering, the race can happen like this:
+     *
+     *      page receiver                     other thread
+     *      -------------                     ------------
+     *      qemu_get_buffer()
+     *                                        do shutdown()
+     *        returns 0 (buffer all zero)
+     *        (we didn't check this retcode)
+     *      try to detect IO error
+     *        last_error==NULL, IO okay
+     *      install ALL-ZERO page
+     *                                        set last_error
+     *      --> guest crash!
+     */
+    if (!f->last_error) {
+        qemu_file_set_error(f, -EIO);
+    }
+
     if (!qio_channel_has_feature(f->ioc,
                                  QIO_CHANNEL_FEATURE_SHUTDOWN)) {
         return -ENOSYS;
@@ -88,9 +112,6 @@ int qemu_file_shutdown(QEMUFile *f)
         ret = -EIO;
     }
 
-    if (!f->last_error) {
-        qemu_file_set_error(f, -EIO);
-    }
     return ret;
 }
 
-- 
2.37.3



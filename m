Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C912F3C19A6
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:12:59 +0200 (CEST)
Received: from localhost ([::1]:57946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ZSE-0007nv-R6
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m1ZMl-0000E8-RW
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:07:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m1ZMX-0003xJ-IS
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:07:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625771223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qoGIaSSybi+Tx59880HHNpG+HkBjifrEItBdgQov8Zc=;
 b=b5YBJXc/OcvCSY0VlGXYYfvK/YY+mterC9No2hlm/z2R0ghURX1jna2Mokz5FpYZeEvaaB
 RWfLPFPpBICF+CDjuvwzTLb3rcj46Vi5phl01FZ0IUH35ZEFUE6qrjcfy9ELtZwn88pfYJ
 sjYUAvAqBCj5APEwjeMKYTIxF9a16y4=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-Aiq9KeofN_G88bXKFVryXA-1; Thu, 08 Jul 2021 15:07:00 -0400
X-MC-Unique: Aiq9KeofN_G88bXKFVryXA-1
Received: by mail-qt1-f198.google.com with SMTP id
 q16-20020ac845100000b0290252006e22f6so4129703qtn.22
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 12:07:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qoGIaSSybi+Tx59880HHNpG+HkBjifrEItBdgQov8Zc=;
 b=FNMuIzpQLrZxgj9cCI5Y5sztHX5IQYt75AwklAOubimzJykS9JxeN4/aEylUVT3uDm
 L2OQl8m0HivK0ehQrv7/XK0UZnUqjc/s+ol5W24vwCJNatYX3+PHZQItYyYNEMVbhkZo
 N0taP1YXhpj5/Mpf+lYoK3hg3XEXsp8AS892yWREDUb7CwVD9pONQrm0+7BLqycI/8Tv
 nZ4H3WmdUDPnp5ekSbxo4jy5+QVaCVhyBuT+gypDfmAjPgm8FBeqx9nE1oMENhN7mThi
 qSaq8p+UhMrfwsd+hBLk6MJcdyA/ojXj31HD/aRMN6A0tm1Oo7HAh4jIcHtxPrIYfjaZ
 +oCQ==
X-Gm-Message-State: AOAM530splWDRbd5dyK18q1PL3sPI5DjkXfqum8LKP6tYqXQrgp8c8q5
 Xa3Dq6VDvyeN6Bo2i+CXMIcW8bFCYXtUbMJ0MOBbvO9MHDr9w53InkuoUQugkp0a8kBZszo4WnI
 DKaml7noXU4igmxaKkkoT8jmTtFmg0Heuu/e/cgQ48b4tfZu7/cRyhX1hm/V3koJA
X-Received: by 2002:a0c:d68f:: with SMTP id k15mr31602885qvi.14.1625771219261; 
 Thu, 08 Jul 2021 12:06:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9MixROmqxryFMKlkfBrq/qrsoYCiuPw+Vfu3jp6rSeUPNDTDbuyEFYQNyF2+6MXS8FA8yyQ==
X-Received: by 2002:a0c:d68f:: with SMTP id k15mr31602854qvi.14.1625771218970; 
 Thu, 08 Jul 2021 12:06:58 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id v15sm1430976qkp.96.2021.07.08.12.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 12:06:58 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] migration: Release return path early for paused postcopy
Date: Thu,  8 Jul 2021 15:06:51 -0400
Message-Id: <20210708190653.252961-2-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708190653.252961-1-peterx@redhat.com>
References: <20210708190653.252961-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: Lukas Straub <lukasstraub2@web.de>, Juan Quintela <quintela@redhat.com>,
 Li Xiaohui <xiaohli@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Li Xiaohui <xiaohuixiaohli@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When postcopy pause triggered, we rely on the migration thread to cleanup the
to_dst_file handle, and the return path thread to cleanup the from_dst_file
handle (which is stored in the local variable "rp").

Within the process, from_dst_file cleanup (qemu_fclose) is postponed until it's
setup again due to a postcopy recovery.

It used to work before yank was born; after yank is introduced we rely on the
refcount of IOC to correctly unregister yank function in channel_close().  If
without the early and on-time release of from_dst_file handle the yank function
will be leftover during paused postcopy.

Without this patch, below steps (quoted from Xiaohui) could trigger qemu src
crash:

  1.Boot vm on src host
  2.Boot vm on dst host
  3.Enable postcopy on src&dst host
  4.Load stressapptest in vm and set postcopy speed to 50M
  5.Start migration from src to dst host, change into postcopy mode when migration is active.
  6.When postcopy is active, down the network card(do migration via this network) on dst host.
  7.Wait untill postcopy is paused on src&dst host.
  8.Before up network card, recover migration on dst host, will get error like following.
  9.Ignore the error of step 8, go on recovering migration on src host:

  After step 9, qemu on src host will core dump after some seconds:
  qemu-kvm: ../util/yank.c:107: yank_unregister_instance: Assertion `QLIST_EMPTY(&entry->yankfns)' failed.
  1.sh: line 38: 44662 Aborted                 (core dumped)

Reported-by: Li Xiaohui <xiaohuixiaohli@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 5ff7ba9d5c..8786104c9a 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2818,12 +2818,12 @@ out:
              * Maybe there is something we can do: it looks like a
              * network down issue, and we pause for a recovery.
              */
+            qemu_fclose(rp);
+            ms->rp_state.from_dst_file = NULL;
+            rp = NULL;
             if (postcopy_pause_return_path_thread(ms)) {
                 /* Reload rp, reset the rest */
-                if (rp != ms->rp_state.from_dst_file) {
-                    qemu_fclose(rp);
-                    rp = ms->rp_state.from_dst_file;
-                }
+                rp = ms->rp_state.from_dst_file;
                 ms->rp_state.error = false;
                 goto retry;
             }
-- 
2.31.1



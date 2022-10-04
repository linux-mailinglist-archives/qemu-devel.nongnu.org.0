Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F06F5F4013
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 11:43:50 +0200 (CEST)
Received: from localhost ([::1]:43930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofeSr-0001cc-C0
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 05:43:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofeHi-0005KC-79
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 05:32:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofeHf-00052M-5O
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 05:32:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664875934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FBgkdlMBwjy7bhLxcoxN0RVYIcbT9m4Uf5Cu1Ql8m80=;
 b=hE+MLH2PQXUHRFFVbPbyxt/Gx4gLKcGqcUWjcZ4muaK2RaPZEDPSctlm6ZZAQP2C3SWPsc
 ip9g9+cPyZT8k0TnNGpwJCrtSAqqoEUpjwD5vL9pkBWBuGWem6BI6ZRYFNqWSSc3Pin25H
 g/2RORvPPR/akfOaOYhXJrW6JP7R71Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-PyEz9f_nNmKuh37v4_Yn3Q-1; Tue, 04 Oct 2022 05:32:11 -0400
X-MC-Unique: PyEz9f_nNmKuh37v4_Yn3Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CCA041C05AAF;
 Tue,  4 Oct 2022 09:32:10 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B4389492B04;
 Tue,  4 Oct 2022 09:32:09 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 2/4] linux-user: remove conditionals for many fs.h ioctls
Date: Tue,  4 Oct 2022 10:32:04 +0100
Message-Id: <20221004093206.652431-3-berrange@redhat.com>
In-Reply-To: <20221004093206.652431-1-berrange@redhat.com>
References: <20221004093206.652431-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

These ioctls have been defined in linux/fs.h for a long time

  * BLKGETSIZE64 - <2.6.12 (linux.git epoch)
  * BLKDISCARD - 2.6.28 (d30a2605be9d5132d95944916e8f578fcfe4f976)
  * BLKIOMIN - 2.6.32 (ac481c20ef8f6c6f2be75d581863f40c43874ef7)
  * BLKIOOPT - 2.6.32 (ac481c20ef8f6c6f2be75d581863f40c43874ef7)
  * BLKALIGNOFF - 2.6.32 (ac481c20ef8f6c6f2be75d581863f40c43874ef7)
  * BLKPBSZGET - 2.6.32 (ac481c20ef8f6c6f2be75d581863f40c43874ef7)
  * BLKDISCARDZEROES - 2.6.32 (98262f2762f0067375f83824d81ea929e37e6bfe)
  * BLKSECDISCARD - 2.6.36 (8d57a98ccd0b4489003473979da8f5a1363ba7a3)
  * BLKROTATIONAL - 3.2 (ef00f59c95fe6e002e7c6e3663cdea65e253f4cc)
  * BLKZEROOUT - 3.6 (66ba32dc167202c3cf8c86806581a9393ec7f488)
  * FIBMAP - <2.6.12 (linux.git epoch)
  * FIGETBSZ - <2.6.12 (linux.git epoch)

and when building with latest glibc, we'll see compat definitions
in syscall.c anyway thanks to the previous patch. Thus we can
assume they always exist and remove the conditional checks.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 linux-user/ioctls.h | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index f182d40190..071f7ca253 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -96,9 +96,7 @@
      IOCTL(BLKROGET, IOC_R, MK_PTR(TYPE_INT))
      IOCTL(BLKRRPART, 0, TYPE_NULL)
      IOCTL(BLKGETSIZE, IOC_R, MK_PTR(TYPE_ULONG))
-#ifdef BLKGETSIZE64
      IOCTL(BLKGETSIZE64, IOC_R, MK_PTR(TYPE_ULONGLONG))
-#endif
      IOCTL(BLKFLSBUF, 0, TYPE_NULL)
      IOCTL(BLKRASET, 0, TYPE_INT)
      IOCTL(BLKRAGET, IOC_R, MK_PTR(TYPE_LONG))
@@ -107,33 +105,15 @@
      IOCTL_SPECIAL(BLKPG, IOC_W, do_ioctl_blkpg,
                    MK_PTR(MK_STRUCT(STRUCT_blkpg_ioctl_arg)))
 
-#ifdef BLKDISCARD
      IOCTL(BLKDISCARD, IOC_W, MK_PTR(MK_ARRAY(TYPE_ULONGLONG, 2)))
-#endif
-#ifdef BLKIOMIN
      IOCTL(BLKIOMIN, IOC_R, MK_PTR(TYPE_INT))
-#endif
-#ifdef BLKIOOPT
      IOCTL(BLKIOOPT, IOC_R, MK_PTR(TYPE_INT))
-#endif
-#ifdef BLKALIGNOFF
      IOCTL(BLKALIGNOFF, IOC_R, MK_PTR(TYPE_INT))
-#endif
-#ifdef BLKPBSZGET
      IOCTL(BLKPBSZGET, IOC_R, MK_PTR(TYPE_INT))
-#endif
-#ifdef BLKDISCARDZEROES
      IOCTL(BLKDISCARDZEROES, IOC_R, MK_PTR(TYPE_INT))
-#endif
-#ifdef BLKSECDISCARD
      IOCTL(BLKSECDISCARD, IOC_W, MK_PTR(MK_ARRAY(TYPE_ULONGLONG, 2)))
-#endif
-#ifdef BLKROTATIONAL
      IOCTL(BLKROTATIONAL, IOC_R, MK_PTR(TYPE_SHORT))
-#endif
-#ifdef BLKZEROOUT
      IOCTL(BLKZEROOUT, IOC_W, MK_PTR(MK_ARRAY(TYPE_ULONGLONG, 2)))
-#endif
 
      IOCTL(FDMSGON, 0, TYPE_NULL)
      IOCTL(FDMSGOFF, 0, TYPE_NULL)
@@ -149,17 +129,13 @@
      IOCTL(FDTWADDLE, 0, TYPE_NULL)
      IOCTL(FDEJECT, 0, TYPE_NULL)
 
-#ifdef FIBMAP
      IOCTL(FIBMAP, IOC_W | IOC_R, MK_PTR(TYPE_LONG))
-#endif
 #ifdef FICLONE
      IOCTL(FICLONE, IOC_W, TYPE_INT)
      IOCTL(FICLONERANGE, IOC_W, MK_PTR(MK_STRUCT(STRUCT_file_clone_range)))
 #endif
 
-#ifdef FIGETBSZ
      IOCTL(FIGETBSZ, IOC_R, MK_PTR(TYPE_LONG))
-#endif
 #ifdef CONFIG_FIEMAP
      IOCTL_SPECIAL(FS_IOC_FIEMAP, IOC_W | IOC_R, do_ioctl_fs_ioc_fiemap,
                    MK_PTR(MK_STRUCT(STRUCT_fiemap)))
-- 
2.37.3



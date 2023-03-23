Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 691546C5E7D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 06:10:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfDCn-0006X8-2J; Thu, 23 Mar 2023 01:09:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pfDCl-0006Td-4v; Thu, 23 Mar 2023 01:09:39 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pfDCj-00035b-63; Thu, 23 Mar 2023 01:09:38 -0400
Received: by mail-pf1-x42c.google.com with SMTP id fd25so12455471pfb.1;
 Wed, 22 Mar 2023 22:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679548175;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BOl2Lpuh1vzQTaauC2+Qv2ujYQml+yz1ZnRJL9xF2oE=;
 b=mJKahMM1hRpOF0ouzHP1XHYvhXY+DUbh/psgcnEjLatRj4lZ+/vZtwdfz4TZcBu4bC
 RkKtExQQJVRBtLRacL0IPQMAVsZsMc0swiR8mNrlOp0Ifr5aUHVM1ralA5VJNvthJKuL
 nsBCwUjQIao87tj9mq8MJZEHvlsd5UXUlT7TtgQ8FDRRc45sGS+VP4tUanJ4FawcpP4A
 L4J17x+axihtuLOVzYs1DHpxIi71W9sUJDRSuUWYsccAuT7y+epePVKI9m86xzlG/94R
 fQgvrIImAWvnloDK6gyL3QcZTbM8Sx/YLF/J08Z257j0lsW4DiUJvwB2xRKYrF2OCibg
 LOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679548175;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BOl2Lpuh1vzQTaauC2+Qv2ujYQml+yz1ZnRJL9xF2oE=;
 b=a+r6yca9jv7HbhotuKkWJh3H0132F0YOdLg9VQ12cpy7ZSwmvvWquOdXzEQuuHjsYI
 TH0qNTmFh04TIZb+d0O/8a5zpP1MqF/gujYTs5GnI+TPMUY5MGKsw9Iz3ggj+pERS+r6
 1xvAp9ZTNXh2RTqJydiZKiwHz9ejzoHFD6CsA351aaihBVsLd55z3K87dDlJfWcIMOW3
 FIgf93kXdkdEYWVqKdmEO4P1MvQ9t5osBEEQFzytU37dMCV+XyygZRi60JFdzPTrtMCG
 ZtrlbeUJ3YjwyMZhZxESNgh6e1dI6JNqknCnJaqHZWEpdJNN/djjl8sWt5W4dNviGAd8
 NTTA==
X-Gm-Message-State: AO0yUKVR0uuLwMm8Abw9Irov7x2Jxg6pFOBew6p8Co+bPXT6+95DS98d
 dmW1ta5it+gLPDho0LoaEUWeh8gzuYjrqI3uh6g=
X-Google-Smtp-Source: AK7set8cyDd+ohhS51FCKFWjgCgkujyqNGBPteBp/0jkb8hajnrOiIbz21gFA+Jk0hg4lyEty2nF1Q==
X-Received: by 2002:a62:1b85:0:b0:62a:4fbd:60fe with SMTP id
 b127-20020a621b85000000b0062a4fbd60femr338751pfb.12.1679548174380; 
 Wed, 22 Mar 2023 22:09:34 -0700 (PDT)
Received: from fedlinux.. ([106.84.129.82]) by smtp.gmail.com with ESMTPSA id
 y22-20020aa78556000000b00627eac32b11sm8157888pfn.192.2023.03.22.22.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 22:09:34 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, damien.lemoal@opensource.wdc.com,
 Fam Zheng <fam@euphon.net>, hare@suse.de, dmitry.fomichev@wdc.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v17 7/8] block: add some trace events for new block layer APIs
Date: Thu, 23 Mar 2023 13:08:33 +0800
Message-Id: <20230323050834.5199-8-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230323050834.5199-1-faithilikerun@gmail.com>
References: <20230323050834.5199-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=faithilikerun@gmail.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Sam Li <faithilikerun@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
---
 block/file-posix.c | 3 +++
 block/trace-events | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/block/file-posix.c b/block/file-posix.c
index 5fa80933c9..65efe5147e 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -3266,6 +3266,7 @@ static int coroutine_fn raw_co_zone_report(BlockDriverState *bs, int64_t offset,
         },
     };
 
+    trace_zbd_zone_report(bs, *nr_zones, offset >> BDRV_SECTOR_BITS);
     return raw_thread_pool_submit(bs, handle_aiocb_zone_report, &acb);
 }
 #endif
@@ -3332,6 +3333,8 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
         },
     };
 
+    trace_zbd_zone_mgmt(bs, op_name, offset >> BDRV_SECTOR_BITS,
+                        len >> BDRV_SECTOR_BITS);
     ret = raw_thread_pool_submit(bs, handle_aiocb_zone_mgmt, &acb);
     if (ret != 0) {
         ret = -errno;
diff --git a/block/trace-events b/block/trace-events
index 48dbf10c66..3f4e1d088a 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -209,6 +209,8 @@ file_FindEjectableOpticalMedia(const char *media) "Matching using %s"
 file_setup_cdrom(const char *partition) "Using %s as optical disc"
 file_hdev_is_sg(int type, int version) "SG device found: type=%d, version=%d"
 file_flush_fdatasync_failed(int err) "errno %d"
+zbd_zone_report(void *bs, unsigned int nr_zones, int64_t sector) "bs %p report %d zones starting at sector offset 0x%" PRIx64 ""
+zbd_zone_mgmt(void *bs, const char *op_name, int64_t sector, int64_t len) "bs %p %s starts at sector offset 0x%" PRIx64 " over a range of 0x%" PRIx64 " sectors"
 
 # ssh.c
 sftp_error(const char *op, const char *ssh_err, int ssh_err_code, int sftp_err_code) "%s failed: %s (libssh error code: %d, sftp error code: %d)"
-- 
2.39.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 080F36C5EB7
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 06:22:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfDNW-0005Us-J6; Thu, 23 Mar 2023 01:20:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pfDNR-0005Sk-3M; Thu, 23 Mar 2023 01:20:41 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pfDNP-0000WC-55; Thu, 23 Mar 2023 01:20:40 -0400
Received: by mail-pj1-x102d.google.com with SMTP id q102so6003515pjq.3;
 Wed, 22 Mar 2023 22:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679548837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=apJVnbtB3zZY9fI/7ex9YhRC/36pavrkOcqtYY3aMVw=;
 b=KNiTOEssihfpFnvzEUfzjQ3LWwoE3QYX1OJEPouov3QtY6j0sFPiQgLQKcLiVn+cGZ
 9EN4WcHM6P00XK3tsREyg1cciUucPrDpmLA5b2IH+SYMokyOhiDdk/oJEPBwl4ATyGjY
 7nX9iPDgVzMpaMGLTWJo3ETCx/BqP/5WBacs4EdMcqQaZSgrTX52FCuBLq0WYT+JDzK8
 m6UhfFZneJ/Q7r5E7YMFVNdqqOWOdxgYCvayZEAjvgpLutm6sZo4bx+bHAyWYvze+5E7
 7o/FBmUoTotJ8NhGda6Psa0RNUiCmWZN0cKDCx0Hjm+85/2RAcNUlLPHQqnr9T1ZOJfJ
 soGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679548837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=apJVnbtB3zZY9fI/7ex9YhRC/36pavrkOcqtYY3aMVw=;
 b=YsirF6jgYbC40ONU5Ntj3RrqrY+3cD60unVEeL3Ft5JLWgrOsei5+KwY5bPC1d1oe0
 kqD3PCxYUwv5O7FKDwaVAqyB5HrNsqBXb/+w8LWGnKYMtydZQfFZ8oCxFMfk8sBLvAvn
 jOgZbPBU112Kgn2ke/XkAvjcJIJQxzjb+pQ1WTUV4vBhAbVfnDEQgn4NPmt6xD/TJH5W
 49wcqYA8O/PRnT/i3AAq+YlJjZAvUhZWjij4yAIMwZSRSBpbfJD7kIAhivmvQSrNDbU4
 Jv9HxH2xzF/lBb3s0HA600DUidCCLdewyXWrtxFBC532zRvRb0vSbXawe3B7VoUlgz8W
 JBmA==
X-Gm-Message-State: AO0yUKUFCGaySzVa/dgT/0G9oPe2f+JjN6c7BHA7Zg1MlEImrx1O+u7E
 OlLQUFx+C8hVHy03UCAe8Mib2sUhoJw9srAfxTw=
X-Google-Smtp-Source: AK7set/EojZA7+A9w8cspcTNZuj17Bloxq0c3DaAVszgrHyszFZvZEfdvO3LzC3qZI+2DjWpUvMoxQ==
X-Received: by 2002:a17:902:f906:b0:1a1:7da3:ef58 with SMTP id
 kw6-20020a170902f90600b001a17da3ef58mr4709641plb.28.1679548837112; 
 Wed, 22 Mar 2023 22:20:37 -0700 (PDT)
Received: from fedlinux.. ([106.84.129.82]) by smtp.gmail.com with ESMTPSA id
 c10-20020a170902b68a00b0019edf07eb06sm11428073pls.122.2023.03.22.22.20.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 22:20:36 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 hare@suse.de, Fam Zheng <fam@euphon.net>, dmitry.fomichev@wdc.com,
 damien.lemoal@opensource.wdc.com, Julia Suvorova <jusual@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, qemu-block@nongnu.org,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v7 4/4] block: add some trace events for zone append
Date: Thu, 23 Mar 2023 13:19:07 +0800
Message-Id: <20230323051907.5948-5-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230323051907.5948-1-faithilikerun@gmail.com>
References: <20230323051907.5948-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x102d.google.com
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
Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
---
 block/file-posix.c | 3 +++
 block/trace-events | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/block/file-posix.c b/block/file-posix.c
index 60ad3970f3..9866d073f5 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2497,6 +2497,8 @@ out:
             if (!BDRV_ZT_IS_CONV(*wp)) {
                 if (type & QEMU_AIO_ZONE_APPEND) {
                     *s->offset = *wp;
+                    trace_zbd_zone_append_complete(bs, *s->offset
+                        >> BDRV_SECTOR_BITS);
                 }
                 /* Advance the wp if needed */
                 if (offset + bytes > *wp) {
@@ -3544,6 +3546,7 @@ static int coroutine_fn raw_co_zone_append(BlockDriverState *bs,
         len += iov_len;
     }
 
+    trace_zbd_zone_append(bs, *offset >> BDRV_SECTOR_BITS);
     return raw_co_prw(bs, *offset, len, qiov, QEMU_AIO_ZONE_APPEND);
 }
 #endif
diff --git a/block/trace-events b/block/trace-events
index 3f4e1d088a..32665158d6 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -211,6 +211,8 @@ file_hdev_is_sg(int type, int version) "SG device found: type=%d, version=%d"
 file_flush_fdatasync_failed(int err) "errno %d"
 zbd_zone_report(void *bs, unsigned int nr_zones, int64_t sector) "bs %p report %d zones starting at sector offset 0x%" PRIx64 ""
 zbd_zone_mgmt(void *bs, const char *op_name, int64_t sector, int64_t len) "bs %p %s starts at sector offset 0x%" PRIx64 " over a range of 0x%" PRIx64 " sectors"
+zbd_zone_append(void *bs, int64_t sector) "bs %p append at sector offset 0x%" PRIx64 ""
+zbd_zone_append_complete(void *bs, int64_t sector) "bs %p returns append sector 0x%" PRIx64 ""
 
 # ssh.c
 sftp_error(const char *op, const char *ssh_err, int ssh_err_code, int sftp_err_code) "%s failed: %s (libssh error code: %d, sftp error code: %d)"
-- 
2.39.2



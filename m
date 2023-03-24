Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4686C81AF
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:45:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfdOo-0002ls-Ul; Fri, 24 Mar 2023 05:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pfdOk-0002kR-4O; Fri, 24 Mar 2023 05:07:46 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pfdOL-0000Vb-Sl; Fri, 24 Mar 2023 05:07:44 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 fy10-20020a17090b020a00b0023b4bcf0727so1010924pjb.0; 
 Fri, 24 Mar 2023 02:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679648821;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BOl2Lpuh1vzQTaauC2+Qv2ujYQml+yz1ZnRJL9xF2oE=;
 b=AGap14dgbnB5zd6acQobGRe8MdT5PqXUu/jvQ0fs42agMSdf5x8a98GxoXv0o4ECwk
 SAWCdiONq10qtkZM3m83XO7QJ04QkleUJQX07LlTei2rmzgMVRDE4zFz7slczp47v6j3
 kp5W8/aEZE/TZaJHpTGCrsd7ny7PIzXStbBrMtOKAg6DPA2+slc/f424QdkMmI8QZWjo
 lA7w8PQ+stww+5jz0LCWAmYoEVBvcyRVl28vN05wfTBCRTQBGeCoGCu8v4LNs2GMpLO6
 6G2963Og0ra+BTJJFpwVVEWaEns/mnUt0F3z+QRXcQZA4yTPgrxVkBe3GAYqsJ9EB1AI
 Dasg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679648821;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BOl2Lpuh1vzQTaauC2+Qv2ujYQml+yz1ZnRJL9xF2oE=;
 b=m8YY1HPpTEuCFx35Z7LQJO4I9WnaBk+qbBuywaOMRoUl//y+EAKe0QepzcKqfAV7sA
 /osN5Q+R46qZrub0ZvcEyLuNdwHEW24+A93H3+51UGMfZzRHrlacjImfTNEN/XSMAcmY
 Be5tONmlwcnF9zrzespzCbT1+yPcpc2B6YMxD3i6Nj3jUIhq1GTBkOsI7hKl9jsTNOuA
 4+G+JYDSrmfbfB8c7LJq7beWJuaIE7xyJ5klzNksjPe/qiYh7TagOiFfM/PwfBnT/OIS
 YoiMu0y/LiI5qVSAVzlpCvaSsBDVcp+14ZV6Et6Xel4yWnJPogFTr2YeOb8CHiFWa6er
 H4uw==
X-Gm-Message-State: AAQBX9fLytrtJM7fj5VeBvGWQ4UkI14Z4B6U/mq1y0kzRe+eebNzm+3H
 71Lk2CiX2q/1Q3+OwhByPJyr+brVAoOEy5vd
X-Google-Smtp-Source: AKy350Zuclh6CQCsn6WzPpS4cgJzlQUViGjOJFEZ/x5bXuLLbDhBY7B1cbH5538BNWogVO61IoS/9w==
X-Received: by 2002:a17:903:1104:b0:194:cc66:66f7 with SMTP id
 n4-20020a170903110400b00194cc6666f7mr2255615plh.19.1679648821060; 
 Fri, 24 Mar 2023 02:07:01 -0700 (PDT)
Received: from fedlinux.. ([106.84.130.185]) by smtp.gmail.com with ESMTPSA id
 u4-20020a170902b28400b001a06b33923bsm13722350plr.164.2023.03.24.02.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 02:07:00 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fam Zheng <fam@euphon.net>, Hanna Reitz <hreitz@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, hare@suse.de,
 damien.lemoal@opensource.wdc.com, dmitry.fomichev@wdc.com,
 qemu-block@nongnu.org, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v18 7/8] block: add some trace events for new block layer APIs
Date: Fri, 24 Mar 2023 17:06:04 +0800
Message-Id: <20230324090605.28361-8-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230324090605.28361-1-faithilikerun@gmail.com>
References: <20230324090605.28361-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x102e.google.com
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



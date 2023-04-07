Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEF06DA9F6
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 10:19:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkhIL-0002Zy-7s; Fri, 07 Apr 2023 04:18:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pkhIJ-0002Z4-ED; Fri, 07 Apr 2023 04:18:03 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pkhIH-0006vc-NT; Fri, 07 Apr 2023 04:18:03 -0400
Received: by mail-pl1-x62e.google.com with SMTP id z19so39500047plo.2;
 Fri, 07 Apr 2023 01:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680855479;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OfysosIon4cLXn+5mbW84tqo7DfsiuVD45/jVuhWsTY=;
 b=eP5sb93YV5j37frDD6g7RtEn1Z3dy06k4LzhLiqKov/Zch27IWMToc3DIzVEWWlqCM
 S1E0p5bQDh2dl4jDWsIfTPhFQ9SyoRRSvEfiI9TEkdrgREV1mz9U9zYotdorSS0kJ4MQ
 9+jO4HzwlVAz1n8D5NuMeCZBm0LXXWoVofjxnU3w6ivtxjYeaPt2vdFtKURXTbNtZpnJ
 8jAgvr3YhB6eE3gndwOZ8rnAYxg2UFqOkZQ8T+Jj5xfhID2ymkJu1t7rhzoVvBBYuTRE
 GH+VDgjvnnEdoHkHhRpnWhGEsoxzbbd8SSUXiiRQ3t5DgvtWgK3huNJg+iGGBHdEs4KD
 fo/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680855479;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OfysosIon4cLXn+5mbW84tqo7DfsiuVD45/jVuhWsTY=;
 b=UgwPm9tJzzI9Z32NNkplvIItTLS5iU+1e3pTk898beTP0Jbju3KiTU4Hf0UEj8oPP1
 3vE2s3HMahpehTSXQRZf/uYaEL+IQlI0gIDTHJGY9wqycl7m3IPQxvPmto4AFtx8kBz7
 d0JTXp5G4mqF/cP2x3vFP+1Zkqblvy38Dbt711OhGiaLb+CuaAA3jzYWAG4ccdP6MYVc
 hlayCP+2I1S3hlVGg4perSlG03bN9Ot+z0KJ5MpldDKXT1RTX0ejGwOo+5Pf360ojryJ
 C3/5i5gNxixPUpJxr7z8OUEWAzjFdii+FGR+SOkkNxK6GZXIT/3nu6RrOMQTFLMXs7R+
 7RXw==
X-Gm-Message-State: AAQBX9fOELuDHznNNCBSBk8QqKNbGIgbdZkcu61ZauyIUOTsyezW2g6m
 o/V60y9vogZaFrHR6eP5Ojq+0IECdairzATN
X-Google-Smtp-Source: AKy350aSUvfrQy3Rkddb3SpuohHg+An7n2/RZwjLcx0TmvNaJakZY/6pYa7jhK92+gtBEbvHX3sBdw==
X-Received: by 2002:a17:90b:3ec4:b0:237:d44c:5861 with SMTP id
 rm4-20020a17090b3ec400b00237d44c5861mr1594226pjb.12.1680855478982; 
 Fri, 07 Apr 2023 01:17:58 -0700 (PDT)
Received: from fedlinux.. ([106.84.131.166]) by smtp.gmail.com with ESMTPSA id
 jh19-20020a170903329300b00199193e5ea1sm2484890plb.61.2023.04.07.01.17.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 01:17:58 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: dmitry.fomichev@wdc.com, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 damien.lemoal@opensource.wdc.com, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Fam Zheng <fam@euphon.net>, hare@suse.de,
 Hanna Reitz <hreitz@redhat.com>, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v9 4/4] block: add some trace events for zone append
Date: Fri,  7 Apr 2023 16:16:57 +0800
Message-Id: <20230407081657.17947-5-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230407081657.17947-1-faithilikerun@gmail.com>
References: <20230407081657.17947-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x62e.google.com
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
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/file-posix.c | 3 +++
 block/trace-events | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/block/file-posix.c b/block/file-posix.c
index 4e26641ce0..da986a33fd 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2504,6 +2504,8 @@ out:
             if (!BDRV_ZT_IS_CONV(*wp)) {
                 if (type & QEMU_AIO_ZONE_APPEND) {
                     *s->offset = *wp;
+                    trace_zbd_zone_append_complete(bs, *s->offset
+                        >> BDRV_SECTOR_BITS);
                 }
                 /* Advance the wp if needed */
                 if (offset + bytes > *wp) {
@@ -3551,6 +3553,7 @@ static int coroutine_fn raw_co_zone_append(BlockDriverState *bs,
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



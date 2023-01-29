Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5618767FE31
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 11:30:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pM4wT-0005Nq-4M; Sun, 29 Jan 2023 05:29:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pM4wD-0005Jg-Au; Sun, 29 Jan 2023 05:29:30 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pM4w8-0007Bq-27; Sun, 29 Jan 2023 05:29:29 -0500
Received: by mail-pl1-x635.google.com with SMTP id jm10so8867088plb.13;
 Sun, 29 Jan 2023 02:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B5zy2i6OMLiLxR95p5Lc+yzOP4YWDvHLClp1ZG0GGEk=;
 b=BCpMWMENRvRU7jYNyorQFXQJjJgSSHF0mc3rGE4gpICpKMI2WSndQAe8uvjIo9iGFv
 nHi41vXT+raZF4yeYrkMl/cOiptQrEhAZvCyJoSdLF/SP5vXn/oY4byWHAcS5sX15P12
 tj0vg5JfKy4bsY2q8uM0vqkWfgDXqA/TBtgwPQaQGQFnb/rST9/aFmexyIri3TExTM4D
 FrAepD2jOUCK+011so+tHJ/CsfrV85AZK5RT3SLEJy7QJP2yxfbrxYoBbCBOjOrP2bZG
 wvRqJIF+Kd2KuZ0YKczViwK6MyT8vKI5WgDrGU5tH1yZBJMbjKlZhKbFDimq+BgXuxr8
 zqxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B5zy2i6OMLiLxR95p5Lc+yzOP4YWDvHLClp1ZG0GGEk=;
 b=j+4Pyv9D3rgl2YNSu+loStBak81Qm+iSPn9RW3dY/8yInmVuAS27qidATdTgd+TYHt
 T5nipUfBgyPQjRALNrsvbHH7VuTKbsdhZVqwEXG7kA99/xOESQuB4GnWEvInvhQw+Z03
 UD7ZhZF8c7YcRl3S1niZ9/EGuGP9pbdhMNe2HJDjnLcX5zB6SNIEDHo3pfCodTklyCg5
 PljhXjXAaPEtlfV2TFBhse5kbEUvQhyg5tAV2hnmaqBE9izG6Anv6I09+pyGeDipKhBe
 DddoLq51TY11ideAZcL2LN6OVIxIlYnQDndpGLO7H2dZBPjdquMeDeSrbmQk7pUynRVg
 QRdA==
X-Gm-Message-State: AO0yUKVEfu/Z2rw882vAYw1Wx2l/Y/P0TTwlHeEdsgzHGdLMGllvcGAC
 1YBf10xAz0BXXQ0OClJEWssEyeVj4fCx/gqlqQ4=
X-Google-Smtp-Source: AK7set9jzR9K1UpPmzLqGlpG/9yoSJGThhJezVG5zHIHjQUNWpYQSXUGiV8HVhetNuCaqIcFe890iQ==
X-Received: by 2002:a17:902:e493:b0:192:820d:d1 with SMTP id
 i19-20020a170902e49300b00192820d00d1mr3639770ple.25.1674988161835; 
 Sun, 29 Jan 2023 02:29:21 -0800 (PST)
Received: from fedlinux.. ([106.84.129.237]) by smtp.gmail.com with ESMTPSA id
 jl1-20020a170903134100b0019644d4242dsm5439416plb.82.2023.01.29.02.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 02:29:21 -0800 (PST)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, dmitry.fomichev@wdc.com, hare@suse.de,
 damien.lemoal@opensource.wdc.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v15 4/8] raw-format: add zone operations to pass through
 requests
Date: Sun, 29 Jan 2023 18:28:46 +0800
Message-Id: <20230129102850.84731-5-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230129102850.84731-1-faithilikerun@gmail.com>
References: <20230129102850.84731-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x635.google.com
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

raw-format driver usually sits on top of file-posix driver. It needs to
pass through requests of zone commands.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
---
 block/raw-format.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/block/raw-format.c b/block/raw-format.c
index b6a0ce58f4..dbbb8f3859 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -317,6 +317,17 @@ static int coroutine_fn raw_co_pdiscard(BlockDriverState *bs,
     return bdrv_co_pdiscard(bs->file, offset, bytes);
 }
 
+static int coroutine_fn raw_co_zone_report(BlockDriverState *bs, int64_t offset,
+                                           unsigned int *nr_zones,
+                                           BlockZoneDescriptor *zones) {
+    return bdrv_co_zone_report(bs->file->bs, offset, nr_zones, zones);
+}
+
+static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
+                                         int64_t offset, int64_t len) {
+    return bdrv_co_zone_mgmt(bs->file->bs, op, offset, len);
+}
+
 static int64_t raw_getlength(BlockDriverState *bs)
 {
     int64_t len;
@@ -618,6 +629,8 @@ BlockDriver bdrv_raw = {
     .bdrv_co_pwritev      = &raw_co_pwritev,
     .bdrv_co_pwrite_zeroes = &raw_co_pwrite_zeroes,
     .bdrv_co_pdiscard     = &raw_co_pdiscard,
+    .bdrv_co_zone_report  = &raw_co_zone_report,
+    .bdrv_co_zone_mgmt  = &raw_co_zone_mgmt,
     .bdrv_co_block_status = &raw_co_block_status,
     .bdrv_co_copy_range_from = &raw_co_copy_range_from,
     .bdrv_co_copy_range_to  = &raw_co_copy_range_to,
-- 
2.38.1



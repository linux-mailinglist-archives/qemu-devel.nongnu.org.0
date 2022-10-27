Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 747D760FC53
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 17:50:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo558-0002EK-HP; Thu, 27 Oct 2022 11:46:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oo54z-0001hy-8M; Thu, 27 Oct 2022 11:46:06 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oo54t-00016y-WC; Thu, 27 Oct 2022 11:46:01 -0400
Received: by mail-pl1-x62b.google.com with SMTP id d24so1920693pls.4;
 Thu, 27 Oct 2022 08:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xDdFVSm8ncoeSJJtfyHTb4bkGYhcGVxibxrd/95vTWc=;
 b=MtWS/aTAVTZIb0hzc5XGg5HSnN9TICnM+n7pFGtv5mM1oqYOSdALZj45Y/L0k1P3Iz
 TqDHZPgkuOeqQpkenTR6irsgjs6oIYDPztgRnRnKOnKcWCZODkoXf8GHFdNKoPUtydYQ
 OSY6iGcGxbf4GXRmFmrvyhY4BrwtBNHvQs8QU6m2jPh2iW0q6YYyWOubKwP3/nV7v+kH
 sWYSuiU3Kpsk6oZaazjGArF4KWXdUg8jk3Y47IBeDbepk421M2nALjHFHuwWOwJSjWLu
 chA32AGa7hKLGJUSuG9qL1BgRUYyOPUgoCtthFfUFiazsYDrBm7Z+m0zu/iTI3oZW7Ex
 AtYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xDdFVSm8ncoeSJJtfyHTb4bkGYhcGVxibxrd/95vTWc=;
 b=DtjWaZBy56jtr/g+Qmxaxamn2z8eNY2ovmK5WWZRJm2JVbXWi5YlHQPInsc0Byi2Uz
 989KlFPEpk46eREOlE83Dy/Mxb9vctfiVMC7HUs0ymefFlSVBp22LZfwi5avP6ELt7qJ
 56mxHjeBIvb508qHlAPce9php4efagElZpFqlLPG5oHo8xUhn07YIqhRvVZhBp52yx6h
 h19isrItReccFGWdf4f+3p72Fi9WbkHO2JG6uDPHK2YrgJH6/ziQpsDgPGipxyAzoJ56
 RhtM7T+nho3DUrDymkhCV2Db+xI7a8yvkN8AdxDJ0lzJfL7NGqfQ7u96Y4xtcnVnrjvy
 YBRg==
X-Gm-Message-State: ACrzQf0xGET/crUEKcdO7Z3CU08TDZbCvYMjuv0rwMf7kp3yp76OdRtW
 Diy0hFdIqD3bjP/Oq2mcDGykGmnYREzbjVGt
X-Google-Smtp-Source: AMsMyM6HplgD5XVEJVv2QedjxS/rOjmf2YWFOulV0OQUFyQ0QfT++PEmJpEFqpXZSrqS//fxKaUVMA==
X-Received: by 2002:a17:90a:cb96:b0:213:1dc2:b1de with SMTP id
 a22-20020a17090acb9600b002131dc2b1demr10567344pju.21.1666885551955; 
 Thu, 27 Oct 2022 08:45:51 -0700 (PDT)
Received: from roots.. ([112.44.202.248]) by smtp.gmail.com with ESMTPSA id
 q9-20020a63d609000000b004405c6eb962sm1232801pgg.4.2022.10.27.08.45.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 08:45:51 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Hanna Reitz <hreitz@redhat.com>,
 damien.lemoal@opensource.wdc.com, qemu-block@nongnu.org,
 stefanha@redhat.com, Markus Armbruster <armbru@redhat.com>, hare@suse.de,
 Kevin Wolf <kwolf@redhat.com>, dmitry.fomichev@wdc.com,
 Eric Blake <eblake@redhat.com>, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v13 4/8] raw-format: add zone operations to pass through
 requests
Date: Thu, 27 Oct 2022 23:45:00 +0800
Message-Id: <20221027154504.20684-5-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221027154504.20684-1-faithilikerun@gmail.com>
References: <20221027154504.20684-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x62b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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
index f337ac7569..bac43f1d25 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -314,6 +314,17 @@ static int coroutine_fn raw_co_pdiscard(BlockDriverState *bs,
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
@@ -615,6 +626,8 @@ BlockDriver bdrv_raw = {
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



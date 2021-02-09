Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 870D43154A0
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 18:06:50 +0100 (CET)
Received: from localhost ([::1]:55348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9WTM-0003GD-0F
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 12:06:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l9WOL-0000aw-9Y
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 12:01:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l9WOI-0003e6-Bw
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 12:01:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612890088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=C8Xffz0J0Y47gvusmVO0935zMBbfmfZkBD6TpcslbUE=;
 b=R14LnRcPf0pggHJZa5IX2qach2pl0JA8H9+gb/24P7jzsLft2OhxExxvQbkykKfQ7v0O3f
 12q6O7UPtbSVUdihTD8n/k4knccB83NYxzyoF/oRl5idrZLnAqMafE9slh9R3/1EkZlJA0
 eZs/5hcYeg283x+vqjbr0Hny2+D/baE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-uzTLiRpaO_aLuSqjlHBhsw-1; Tue, 09 Feb 2021 12:01:25 -0500
X-MC-Unique: uzTLiRpaO_aLuSqjlHBhsw-1
Received: by mail-ej1-f71.google.com with SMTP id bx12so16528296ejc.15
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 09:01:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C8Xffz0J0Y47gvusmVO0935zMBbfmfZkBD6TpcslbUE=;
 b=o68lO4tD8qKnPYMf5p4xPn8uNA7rRW4pQdAD8hbG82s7FCfIBmlC0Km+OMdjpTS89R
 eMMAefKRBcGHOmzGxWdWIDCgPyy10sbcHrSHVceB4nB1lC1tC+6YyeoVmUWlJbBVmplZ
 KChi59a1rYS7c5bA+jQUdUcjBZmfMagw+y9JcnwNxy6jLFkmKqewivxAAoLPGpugH8V1
 6sxbWBPTw6fF4hedVuEg1OUomTMp1cZODyqt9eZ/XYDRCX8BKyEgQiU/fLT4KyuWlofn
 +2yrRf6KdHi/FGMFNQDgFoO0Y2tIqDHe81iW3dETDyz7wuRr05PA+x1HKRJVHeDzSaJ7
 b9Hw==
X-Gm-Message-State: AOAM532wWBPVgwXEpOWXmrECji9l4jDVBNMIWFtYf2mYBEQi4UdhPEtu
 DI1oumULjoKSQxhQ/VeJ0HfVhaRL/wcebyCiEOn4ObCRhpNKf89EOkG08Ql+75tpQj9K+siIPY+
 f0CupEC/X0nJlcVEoYwnbbc6HwSmGi1bJsCbil41maWtIUME26dMpSXczhIhviqW6
X-Received: by 2002:a17:906:f6c7:: with SMTP id
 jo7mr24093828ejb.178.1612890084218; 
 Tue, 09 Feb 2021 09:01:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy7L/oKF6hCoEpdvC17xHchOJH18yqL/k+koXeETx2sLfzxz5bkz4boGwzxKbYxcRXXjizpSA==
X-Received: by 2002:a17:906:f6c7:: with SMTP id
 jo7mr24093799ejb.178.1612890083789; 
 Tue, 09 Feb 2021 09:01:23 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id p16sm10976880eja.109.2021.02.09.09.01.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 09:01:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] block/null: Use 'read-zeroes' mode by default
Date: Tue,  9 Feb 2021 18:01:21 +0100
Message-Id: <20210209170121.3310151-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The null-co driver is meant for (performance) testing.
By default, read operation does nothing, the provided buffer
is not filled with zero values and its content is unchanged.

This can confuse security experts. For example, using the default
null-co driver, buf[] is uninitialized, the blk_pread() call
succeeds and we then access uninitialized memory:

  static int guess_disk_lchs(BlockBackend *blk,
                             int *pcylinders, int *pheads,
                             int *psectors)
  {
      uint8_t buf[BDRV_SECTOR_SIZE];
      ...

      if (blk_pread(blk, 0, buf, BDRV_SECTOR_SIZE) < 0) {
          return -1;
      }
      /* test msdos magic */
      if (buf[510] != 0x55 || buf[511] != 0xaa) {
          return -1;
      }

We could audit all the uninitialized buffers and the
bdrv_co_preadv() handlers, but it is simpler to change the
default of this testing driver. Performance tests will have
to adapt and use 'null-co,read-zeroes=on'.

Suggested-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
RFC maybe a stricter approach is required?
---
 block/null.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/null.c b/block/null.c
index cc9b1d4ea72..f9658fd70ac 100644
--- a/block/null.c
+++ b/block/null.c
@@ -93,7 +93,7 @@ static int null_file_open(BlockDriverState *bs, QDict *options, int flags,
         error_setg(errp, "latency-ns is invalid");
         ret = -EINVAL;
     }
-    s->read_zeroes = qemu_opt_get_bool(opts, NULL_OPT_ZEROES, false);
+    s->read_zeroes = qemu_opt_get_bool(opts, NULL_OPT_ZEROES, true);
     qemu_opts_del(opts);
     bs->supported_write_flags = BDRV_REQ_FUA;
     return ret;
-- 
2.26.2



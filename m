Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96605318D83
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 15:38:32 +0100 (CET)
Received: from localhost ([::1]:42274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAD71-0005iP-FY
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 09:38:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lACwA-0005Hq-M0
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 09:27:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lACw6-0003ec-1I
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 09:27:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613053633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D4Z11FEsaA36rEKX69D+N+Q14103WaLLz/9eqppF61E=;
 b=A6DZUW7HbhhEMmZtQRkOdy9WgbmsMGHn6byvhCTiY69gf+sRIdJz/M/miTpK0spZYtkedf
 qylGUyucFZpjhkLVo8At3CSpVBNKuqPjuP+W7U9tY3wx+KjpZbKTu9sJUtTaUZr5316Dae
 6m7OrRdSvjwP/ji0b9nC60aDvQDkdbU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-pHgoU4tdPXCeCBxgTdR6fg-1; Thu, 11 Feb 2021 09:27:11 -0500
X-MC-Unique: pHgoU4tdPXCeCBxgTdR6fg-1
Received: by mail-ej1-f69.google.com with SMTP id q11so4870579ejd.0
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 06:27:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D4Z11FEsaA36rEKX69D+N+Q14103WaLLz/9eqppF61E=;
 b=HJ7G+4sZ1JzkOAl+eMGQYshjpenl4cMJa6PckOe2mBlG+41wlJVZUnwZ9MJ8P79EC5
 51nwHjHmGS+1L3wOolHMOJj77rbqCGsG4qW6UGlLoyFlLQpl3VJTvDzSI/uyEUj8Ue9g
 3agKQFKAMfL23zxDaqE4MEMjGr+Zw11FIkQgEqBaHY52MuxTigznef0AlMQJc5lbQ0Lq
 UgvXmf8WtvgnQiNiFNQ45DcZ041eygOgoiW9oCTFAItdhtkJFg1/XJ4f8Eulhijsv6T8
 DY4lCIYgn9acZkJEh7TDD5W6MmJO5iSb5WAJlH+Fg28kM4KAkRS+Y9H0Ju/z2Hg5jLli
 0Yzw==
X-Gm-Message-State: AOAM53141OG6M993LSTz+CnORFIg/i9SMSLWoIY7/oTm9W8IgqSrmU86
 XvHrcywnTTn3FfOKuAmatplplG3U/c679UJZsp/dUg/7XS5Ygv5gWN3CiX4uDLONcqRNwdyvfjP
 U6bAzqPvKITxHM5eI55EoYfzHKebOH45PZAMAZjkyV3G09ke5Kvy9bJ1AR6Y7Z/0A
X-Received: by 2002:a17:906:408b:: with SMTP id
 u11mr8523596ejj.299.1613053630498; 
 Thu, 11 Feb 2021 06:27:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzxTsxge7qfxvilOLXgRfz6yd/hySRzdzhsu+1Qs/hC1oL61bxA20D36PYGirQR8/XKsUlc6w==
X-Received: by 2002:a17:906:408b:: with SMTP id
 u11mr8523565ejj.299.1613053630258; 
 Thu, 11 Feb 2021 06:27:10 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id a1sm4200072edj.6.2021.02.11.06.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 06:27:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] block/null: Enable 'read-zeroes' mode by default
Date: Thu, 11 Feb 2021 15:26:56 +0100
Message-Id: <20210211142656.3818078-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210211142656.3818078-1-philmd@redhat.com>
References: <20210211142656.3818078-1-philmd@redhat.com>
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
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The null-co driver is meant for (performance) testing.
By default, read operation does nothing, the provided buffer
is not filled with zero values and its content is unchanged.

This performance 'feature' becomes an issue from a security
perspective.  For example, using the default null-co driver,
buf[] is uninitialized, the blk_pread() call succeeds and we
then access uninitialized memory:

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
to adapt and use 'null-co,read-zeroes=off'.

Suggested-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
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



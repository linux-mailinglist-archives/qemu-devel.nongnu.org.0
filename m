Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B19141D4970
	for <lists+qemu-devel@lfdr.de>; Fri, 15 May 2020 11:25:09 +0200 (CEST)
Received: from localhost ([::1]:55500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZWaa-0005zR-Qh
	for lists+qemu-devel@lfdr.de; Fri, 15 May 2020 05:25:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZWVd-0005wJ-HY
 for qemu-devel@nongnu.org; Fri, 15 May 2020 05:20:02 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:51488
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZWVb-0005bd-Ec
 for qemu-devel@nongnu.org; Fri, 15 May 2020 05:20:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589534398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vb8q8zQaBSYsdnfCJN6XZiKEXfcSXXKGGn1WabOTPgg=;
 b=gqQnlZiCWmOOKH2ep5linOLWFPGhLwNVGHZWJnpbFVWkBSeCSAXccGFbl+O3+mR3zGKedu
 qPQW05Xi/ZMA0DF+xrx5KRVYsvDaX1yrCNm/YS6xJPo2M3n8q7TeaXQrcLKD2eUIObyvxQ
 0n1j9qW4tqdluLEOphy7FZ28oQfua1g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-lUs7a7QGN4O0cSuFdicydQ-1; Fri, 15 May 2020 05:19:56 -0400
X-MC-Unique: lUs7a7QGN4O0cSuFdicydQ-1
Received: by mail-wr1-f72.google.com with SMTP id 37so886842wrc.4
 for <qemu-devel@nongnu.org>; Fri, 15 May 2020 02:19:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vb8q8zQaBSYsdnfCJN6XZiKEXfcSXXKGGn1WabOTPgg=;
 b=LF+uJncCbsChCZrDZC58qjd4flsazTA5OEX45tyQMY23D8Snoy70erUU9pygFhXpb0
 Y5oWtoY6zJeOVsYI/CgWgu6LYu1+XfURoJv9FOufqKUOPblrXg4fXsYX+vLJQd6Ddf04
 jZIEvThSOxYUodrowaydRUEPDLP3Nm2OP3yINPtg0qcXQzb0j+xL6jcAt2jFFUh8FIFf
 y+orCb0MZn/Cw5YmDONh6QiTrxj8OjEJHWpE7PhJX2CkFsKyMVH1blMce70ba8WScac5
 n4ajyzwMHy5OaSAR8R3ujy/0hYDPGzWFewZ/y4eMsaVgl6jtPpONLrnIA2sTjQPrvy06
 tzDg==
X-Gm-Message-State: AOAM532n/qu7OZ97ToWCNJ+J+qrGno+0XVNGlIGeaW1/cEm9Yj5gGezi
 JdrXAgN26vOiRnOHpXQ9xqscNlZsmeiMHcb1pffLKgnzYPE6uNVdPlVDN45eZ8TFNwrZz8U32Ir
 QJl5u3F0UvJ/EMG8=
X-Received: by 2002:adf:e449:: with SMTP id t9mr3213542wrm.108.1589534395521; 
 Fri, 15 May 2020 02:19:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/KRuEOOdAykHM+bwA5nWSjKrb13F5jW566HzDaVXU9gp+2KPshci5KrauElkZXtDX3ST4Fw==
X-Received: by 2002:adf:e449:: with SMTP id t9mr3213525wrm.108.1589534395300; 
 Fri, 15 May 2020 02:19:55 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id u10sm2648032wmc.31.2020.05.15.02.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 02:19:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/5] sysemu/block-backend: Document blk_get_max_iov()
 returned value
Date: Fri, 15 May 2020 11:19:24 +0200
Message-Id: <20200515091924.14380-6-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200515091924.14380-1-philmd@redhat.com>
References: <20200515091924.14380-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/14 23:27:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/sysemu/block-backend.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index b693dfb8f0..7b12563c65 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -227,6 +227,7 @@ void blk_eject(BlockBackend *blk, bool eject_flag);
 int blk_get_flags(BlockBackend *blk);
 uint32_t blk_get_request_alignment(BlockBackend *blk);
 uint32_t blk_get_max_transfer(BlockBackend *blk);
+/* Returns the maximum number of iovec elements */
 int blk_get_max_iov(BlockBackend *blk);
 void blk_set_guest_block_size(BlockBackend *blk, int align);
 /* callers must free the returned pointer with qemu_vfree() */
-- 
2.21.3



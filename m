Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4777E455B4E
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 13:11:56 +0100 (CET)
Received: from localhost ([::1]:40372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mngGh-0006Mc-1i
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 07:11:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mngBo-0001f4-CO
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 07:06:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mngBi-00043S-Ff
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 07:06:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637237205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jQgJq8UQRrsSz2LTJWEcm7fv7ub6tAHvzmzHdQGoASg=;
 b=HBpSKoYeAVv4UOhO1wV2xr44PzlnKcNpZdeYn2l6S5bUboVFWrmpyZaO+y+Fa3XnecWD0h
 3MKay3xcduaE4f+DOb6HRV76UvKsniqxS1ZWBUWa/+YUV3MZW1N1+uT9i/AxwmoJDxlm9i
 y+lrsTXhQ9y6GxEFmhon2vfO/5BB0WA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-WaUsdVmcNQ6h--U64nvE0Q-1; Thu, 18 Nov 2021 07:06:44 -0500
X-MC-Unique: WaUsdVmcNQ6h--U64nvE0Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 b1-20020a5d6341000000b001901ddd352eso1028851wrw.7
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 04:06:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jQgJq8UQRrsSz2LTJWEcm7fv7ub6tAHvzmzHdQGoASg=;
 b=bERJQnxHZoe44RJFOnjNTagUC633NGr6AYUjmRMGsHIpxg4+v0adbtxs3TYRRQSj6q
 bBNFPY9exftejt6LgtkyqMOlJNhmESA+FLD5W1HPXNQw02dTkjVhe8L2xsdY2vo3Tt0K
 rmU+AqdLnXNIoe4TNG7i28TxE0XIx+3xCsOYQoXBr0JUGPjxPozzcDFAkOYaO96RD0OF
 hbT5LEpdCBE+G1XTjz0uX12NhUhT/Lsg2e5K/buPqmz8eog80yNNqGJ7WAEBuO42S28J
 McX0TkT/gGPfX4RNbkpb6nRj4Jis5J4aC4uExzuVgEwHSoyYZvoDXR5AZueZbnPdxyDX
 HjKQ==
X-Gm-Message-State: AOAM531qTiKEFk/r9CjOx4cMhh5nsJik4EsK4gYzZYrdvY3HoJzDO0yP
 +J8U+QXqDA7L0W7P9AaP5KmsQekc/6+S8yLPNh/l5jQNo039AMd7CaYh60EzF5LtKTN3QzMwuaH
 90WZYvnSMK3CjH9DZm3OhHkT7SzZL45Ta0byptjaqih+dWdkvov3EZntOJ8vpf+JN
X-Received: by 2002:a1c:1941:: with SMTP id 62mr9058020wmz.131.1637237203360; 
 Thu, 18 Nov 2021 04:06:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzFsojgTDTDS9qD2uxJc1zleNYE1KqNYZH/RRs2s/DwoXu+ACYb3IKpxcewDzjG9ew7G3vzGA==
X-Received: by 2002:a1c:1941:: with SMTP id 62mr9057932wmz.131.1637237202796; 
 Thu, 18 Nov 2021 04:06:42 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 z8sm3004513wrh.54.2021.11.18.04.06.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 04:06:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 v3 1/2] hw/block/fdc: Kludge missing floppy drive to
 fix CVE-2021-20196
Date: Thu, 18 Nov 2021 13:06:34 +0100
Message-Id: <20211118120635.4043197-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211118120635.4043197-1-philmd@redhat.com>
References: <20211118120635.4043197-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Prasad J Pandit <pjp@fedoraproject.org>,
 qemu-block@nongnu.org, Darren Kenny <darren.kenny@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-stable@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Gaoning Pan <pgn@zju.edu.cn>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Guest might select another drive on the bus by setting the
DRIVE_SEL bit of the DIGITAL OUTPUT REGISTER (DOR).
The current controller model doesn't expect a BlockBackend
to be NULL. A simple way to fix CVE-2021-20196 is to create
an empty BlockBackend when it is missing. All further
accesses will be safely handled, and the controller state
machines keep behaving correctly.

Cc: qemu-stable@nongnu.org
Fixes: CVE-2021-20196
Reported-by: Gaoning Pan (Ant Security Light-Year Lab) <pgn@zju.edu.cn>
BugLink: https://bugs.launchpad.net/qemu/+bug/1912780
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/338
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/fdc.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index d21b717b7d6..6f94b6a6daa 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -1161,7 +1161,19 @@ static FDrive *get_drv(FDCtrl *fdctrl, int unit)
 
 static FDrive *get_cur_drv(FDCtrl *fdctrl)
 {
-    return get_drv(fdctrl, fdctrl->cur_drv);
+    FDrive *cur_drv = get_drv(fdctrl, fdctrl->cur_drv);
+
+    if (!cur_drv->blk) {
+        /*
+         * Kludge: empty drive line selected. Create an anonymous
+         * BlockBackend to avoid NULL deref with various BlockBackend
+         * API calls within this model (CVE-2021-20196).
+         * Due to the controller QOM model limitations, we don't
+         * attach the created to the controller device.
+         */
+        cur_drv->blk = blk_new(qemu_get_aio_context(), 0, BLK_PERM_ALL);
+    }
+    return cur_drv;
 }
 
 /* Status A register : 0x00 (read-only) */
-- 
2.31.1



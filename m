Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C5736453B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 15:48:24 +0200 (CEST)
Received: from localhost ([::1]:59920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYUGF-000386-Fs
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 09:48:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYUB3-0007SJ-JN; Mon, 19 Apr 2021 09:43:01 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:44604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYUAz-0004zE-NW; Mon, 19 Apr 2021 09:43:01 -0400
Received: by mail-wr1-x430.google.com with SMTP id e7so25135231wrs.11;
 Mon, 19 Apr 2021 06:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ATiydl4QAEN0F9mJEpmGHmBCiByjc7mLThRon7z1f8g=;
 b=mVLdjB+02c8Z44LeXc+QuysVbW9JZxerfSyJdry+sE3PThwo5DnNEoVjMH5jUiv1Lc
 kz7kolAf2+k1W6c6pI5jU+W8RidHzSqREppFf0HKCIV39/nNRZcyRIItm1R2xx8/7qEI
 eUn6Wn2rqlFqWnng2hn2tflQGUVGTNrBeXxNRicTcWe9FnOHaD+4chzgZP6Ho4/WDJb8
 9IJw7r6opDM08kSRTPAaS2UnCK+b3MqFK0hOAwhwtfjQTZ7EUv1RcVnbo/MW01+/a/aQ
 hB1VH4xGgmnK6hS29qJtN7TRAZajbge+xwQrUILm5htX93+TYaIKejHz9TPnB98Wxwt7
 zB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ATiydl4QAEN0F9mJEpmGHmBCiByjc7mLThRon7z1f8g=;
 b=JNS7+xHbDvA5FwKBJbvJ6tTWGA/w2LO9fLJ49jV2sIfKbYDTDgGRT1CGztWUCYLbb9
 IjHmtLNb0PePruOPjqNwBcSZbUH/bJVa28P+WqIDx21WdcdmgtmvmuhnbgtWEKaBxkBV
 J3BRBh5HVcqUm50+MFmf14bCure8FeLpNxU8LsOJerwZMvyuP57KzYdPXX7sxdfVzMQ7
 +PXXNB3a6Uqf9Aa3u+otl8wqpjA2UdS4bah+6q1vPQs/c7qsdGT3W91h0b8CKACusOjN
 NjyQgX6sdX27JHACVTRU3uFEC63VbWJ139qW4cFu+agiIxJDg6IVbp9I8M2yos0jlfZb
 eqbQ==
X-Gm-Message-State: AOAM531aYDkYCBEdKkeGZhjk7s8tS0g8bPX4HP4a2hcqo+BBDrV5flNN
 xipd9wtoU0E5q3oXjLCdNfFyFD1XvGfA1A==
X-Google-Smtp-Source: ABdhPJwbLzz3q2vWtVsmUJr8TRUrdSdC0i8EDr/ULWtV3K/SEu40lf65fJB8t4p8HK6cKgqiFDyy3g==
X-Received: by 2002:adf:f108:: with SMTP id r8mr14609973wro.147.1618839770408; 
 Mon, 19 Apr 2021 06:42:50 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id g13sm26482616wrr.9.2021.04.19.06.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 06:42:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.0? v3] mptsas: Remove unused MPTSASState 'pending' field
 (CVE-2021-3392)
Date: Mon, 19 Apr 2021 15:42:47 +0200
Message-Id: <20210419134247.1467982-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Prasad J Pandit <pjp@fedoraproject.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Cheolwoo Myung <cwmyung@snu.ac.kr>, Li Qiang <liq3ea@gmail.com>,
 qemu-stable@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Michael Tokarev <mjt@tls.msk.ru>

While processing SCSI i/o requests in mptsas_process_scsi_io_request(),
the Megaraid emulator appends new MPTSASRequest object 'req' to
the 's->pending' queue. In case of an error, this same object gets
dequeued in mptsas_free_request() only if SCSIRequest object
'req->sreq' is initialised. This may lead to a use-after-free issue.

Since s->pending is actually not used, simply remove it from
MPTSASState.

Cc: qemu-stable@nongnu.org
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210416102243.1293871-1-mjt@msgid.tls.msk.ru>
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Reported-by: Cheolwoo Myung <cwmyung@snu.ac.kr>
BugLink: https://bugs.launchpad.net/qemu/+bug/1914236 (CVE-2021-3392)
Fixes: e351b826112 ("hw: Add support for LSI SAS1068 (mptsas) device")
[PMD: Reworded description, added more tags]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v3: Remove now unused variable in mptsas_free_request (pm215)

MJT patch:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg799236.html

Since rc4 is soon, I'm directly respining his patch with my comments
addressed.

This is not a new regression (present since QEMU v2.6.0) but is a
CVE...

PJP first patch:
https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg02660.html
---
 hw/scsi/mptsas.h | 1 -
 hw/scsi/mptsas.c | 6 ------
 2 files changed, 7 deletions(-)

diff --git a/hw/scsi/mptsas.h b/hw/scsi/mptsas.h
index b85ac1a5fcc..c046497db71 100644
--- a/hw/scsi/mptsas.h
+++ b/hw/scsi/mptsas.h
@@ -79,7 +79,6 @@ struct MPTSASState {
     uint16_t reply_frame_size;
 
     SCSIBus bus;
-    QTAILQ_HEAD(, MPTSASRequest) pending;
 };
 
 void mptsas_fix_scsi_io_endianness(MPIMsgSCSIIORequest *req);
diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
index 7416e787061..db3219e7d20 100644
--- a/hw/scsi/mptsas.c
+++ b/hw/scsi/mptsas.c
@@ -251,13 +251,10 @@ static int mptsas_build_sgl(MPTSASState *s, MPTSASRequest *req, hwaddr addr)
 
 static void mptsas_free_request(MPTSASRequest *req)
 {
-    MPTSASState *s = req->dev;
-
     if (req->sreq != NULL) {
         req->sreq->hba_private = NULL;
         scsi_req_unref(req->sreq);
         req->sreq = NULL;
-        QTAILQ_REMOVE(&s->pending, req, next);
     }
     qemu_sglist_destroy(&req->qsg);
     g_free(req);
@@ -303,7 +300,6 @@ static int mptsas_process_scsi_io_request(MPTSASState *s,
     }
 
     req = g_new0(MPTSASRequest, 1);
-    QTAILQ_INSERT_TAIL(&s->pending, req, next);
     req->scsi_io = *scsi_io;
     req->dev = s;
 
@@ -1319,8 +1315,6 @@ static void mptsas_scsi_realize(PCIDevice *dev, Error **errp)
 
     s->request_bh = qemu_bh_new(mptsas_fetch_requests, s);
 
-    QTAILQ_INIT(&s->pending);
-
     scsi_bus_new(&s->bus, sizeof(s->bus), &dev->qdev, &mptsas_scsi_info, NULL);
 }
 
-- 
2.26.3



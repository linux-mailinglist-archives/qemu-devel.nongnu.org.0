Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F11F3454C67
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 18:47:03 +0100 (CET)
Received: from localhost ([::1]:49130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnP1T-0005rZ-4B
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 12:47:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnP0F-0003oU-H6
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 12:45:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnP0C-0001ss-C8
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 12:45:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637171138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=f37MSGK414Wbp3NDgsIaQJYzTojVO4QmSmz21ap/IRQ=;
 b=YqMAGzTg56cujddgpUd1MXU1R5/v8mB5EwpCLgnXUMETFf6siK006IXS2znxnc6gs7au3C
 OK+Oxai44cjjGBKiG3M4cDN5Hq3UoCm262+PKzPOCrHVC5U8ZlDepFhld4MsYKsAH9k897
 gtRkzj9aNCWVtaXqqPWL9W2CSZ07Zic=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-6SiPLR9fNDe0460Erxa28A-1; Wed, 17 Nov 2021 12:45:37 -0500
X-MC-Unique: 6SiPLR9fNDe0460Erxa28A-1
Received: by mail-wm1-f69.google.com with SMTP id
 v62-20020a1cac41000000b0033719a1a714so1393140wme.6
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 09:45:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f37MSGK414Wbp3NDgsIaQJYzTojVO4QmSmz21ap/IRQ=;
 b=cTqiFvQR+xkxrLnJxxQFwfatBOcwrt556h9GUNpZfcRaYuFNUWUWdDF5OORRuzpOuO
 g+FN/KirkyHcszwX29JBVeLAtoISTiJcoe+oysNaDjYDa2/n7QigDevUtUn6TppwznLE
 b0RFRPeYHuKt0Nz8E51/LOakbFlsHNhS6ZVJFvFq1pAgmfJon0/a6AAQiosNQ3yYxk5b
 TvRDyU/OBvmB22f0PxrcbIBcxVHpcEUk6orS00hAuv0xbozMnyN9M0jGH2L4pigZ1x6e
 G2zbUgPPd2BJGv9UsHqQu8gXXCu55+r61jWictNXaHRGoatbirpDWRtg0O5sz/GtZHxh
 k/6w==
X-Gm-Message-State: AOAM531S0HghxhPPXTQCnmWJTzAjFvnjF9FjjGayuiXFbKp82Uqvl2ck
 TA9rjRIs7aW+rHszkPa7FCKykou8ptkDbKuCOXtkfTXye8kXwK3tHS944eQdbUmcRGLpd7R1Oid
 gEjbkFhTloilQvOQLbkvwd4axKCxCQ7mAicdkpPUdKVlpSRsgwGubaT9KXI3GG3vA
X-Received: by 2002:a5d:6707:: with SMTP id o7mr21988309wru.172.1637171135566; 
 Wed, 17 Nov 2021 09:45:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw8jSP9keXvkPmwPAT+gJTNQyihBWcUgH4e0/M8rCDVn30KsECPXExJf2iYrt2lZmxktKIXlQ==
X-Received: by 2002:a5d:6707:: with SMTP id o7mr21988277wru.172.1637171135359; 
 Wed, 17 Nov 2021 09:45:35 -0800 (PST)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id z6sm638964wmp.1.2021.11.17.09.45.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 09:45:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qemu-keymap: Add license in generated files
Date: Wed, 17 Nov 2021 18:45:33 +0100
Message-Id: <20211117174533.1900570-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 qemu-keymap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/qemu-keymap.c b/qemu-keymap.c
index 536e8f2385d..4095b654a60 100644
--- a/qemu-keymap.c
+++ b/qemu-keymap.c
@@ -187,6 +187,7 @@ int main(int argc, char *argv[])
     }
 
     fprintf(outfile,
+            "# SPDX-License-Identifier: GPL-2.0-or-later\n"
             "#\n"
             "# generated by qemu-keymap\n"
             "#    model   : %s\n"
-- 
2.31.1



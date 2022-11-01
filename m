Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0692061428B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 02:02:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opfdH-0004UU-S8; Mon, 31 Oct 2022 20:59:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opfcz-0004Mx-E1
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 20:59:41 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opfcy-0005dS-0H
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 20:59:41 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 q1-20020a17090a750100b002139ec1e999so7296329pjk.1
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 17:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vn8QAsjO7gtbZVeE7QQx9COaGQRw61V/sT24VvnuPKo=;
 b=FOYVO998YjsdHVk1ojpi9V5BHUeBMPrW0BVEhVBhLx5EISMrbv/Hi9j911oa3VwlUN
 9CJOYgUoZ6gi9h03YChSOtOyYSPcIS+fQ9f11Ww8G9HS9/YkeP9HjzFgqxTUnAKXsC/S
 zq+Uj7UvvtrIf0jVFT2RlGrOkNXJsMbksEjIX6vrgtzOfTs7bFfKGokpxNNPX384gl/o
 7fnpfPIZ5ieaIIDPRv6R9dsgMUNzG8Zjm5PNeuwHxrmSpY7/iA4fhLMC7bwxSXndrdOD
 Qkv54r/QdWEabP8L0CbGYuSQDgCOquIERNcTTC6hYKf8Z1ljT2dVmHioDMd+1CLbSCNZ
 0zJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vn8QAsjO7gtbZVeE7QQx9COaGQRw61V/sT24VvnuPKo=;
 b=jx6W5AySf+l11tMOepBGOkoyeWX7a1CYts+cNp187BkE4y2CJEAAtKrH0LNSJl/QDp
 voskYxk7Jh11XkC+1KsoCAVju3DWF0WfWxCVG56CZL/xn0vWJ2sV8sGI+N8LScqnCXsf
 nXD6X0YpwmJ2+tBe6TKOU77cT5cj+1uyY+t9TWwxbEMc0XLIA2PhDuVMWvindPmvtA7u
 GtaIoV+6Y6TkgyGCARwF/wt0M4AHY0F7Iy+l+FddoHimzxlHgxnlyRtbdvCktZtJotZ0
 8AC/tg7ViMA0vDdAvoVyy2FbCOL/mITRtlhN6lmczVYFC+nItTk4bTSWmoj9V66CMR9b
 /Xjw==
X-Gm-Message-State: ACrzQf0qJ3igBx8dteRyPufbEOj7koV14PRxfamWEnPTHzAOkYNshhi7
 vOvCKQyMZRCmFTmIplYKvdwoZ5w4ESE/sRzy
X-Google-Smtp-Source: AMsMyM54wwNJ8oH2m54RF68Gvnf6c8bgu6qypJoQPVKjEUuCynl319MJTcwIm2ihxi3aNi9891iCdQ==
X-Received: by 2002:a17:90a:b897:b0:213:d66b:4996 with SMTP id
 o23-20020a17090ab89700b00213d66b4996mr10007930pjr.3.1667264379112; 
 Mon, 31 Oct 2022 17:59:39 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 o9-20020aa79789000000b0056d98e359a5sm1875644pfp.165.2022.10.31.17.59.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 17:59:38 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v7 06/17] eepro100: Omit errp for pci_add_capability
Date: Tue,  1 Nov 2022 09:58:48 +0900
Message-Id: <20221101005859.4198-7-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101005859.4198-1-akihiko.odaki@daynix.com>
References: <20221101005859.4198-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

Omitting errp for pci_add_capability() causes it to abort if
capabilities overlap. This behavior is appropriate here because all of
the capabilities set in this device are defined in the program and
their overlap should not happen unless there is a programming error.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/eepro100.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index 679f52f80f..bf2ecdded9 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -549,12 +549,7 @@ static void e100_pci_reset(EEPRO100State *s, Error **errp)
     if (info->power_management) {
         /* Power Management Capabilities */
         int cfg_offset = 0xdc;
-        int r = pci_add_capability(&s->dev, PCI_CAP_ID_PM,
-                                   cfg_offset, PCI_PM_SIZEOF,
-                                   errp);
-        if (r < 0) {
-            return;
-        }
+        pci_add_capability(&s->dev, PCI_CAP_ID_PM, cfg_offset, PCI_PM_SIZEOF);
 
         pci_set_word(pci_conf + cfg_offset + PCI_PM_PMC, 0x7e21);
 #if 0 /* TODO: replace dummy code for power management emulation. */
-- 
2.38.1



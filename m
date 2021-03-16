Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F8733D395
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 13:16:02 +0100 (CET)
Received: from localhost ([::1]:33242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM8cD-0003dU-Qm
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 08:16:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM8RZ-00038a-5i
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:05:02 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:33013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM8RX-0003xo-3L
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:05:00 -0400
Received: by mail-pg1-x52c.google.com with SMTP id g4so22466011pgj.0
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 05:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m4a685HUG50oDycdiMz8MX8zwTLJNRbcKkuniaQymBg=;
 b=M26o6+/gIoVWq1yhrwPviF3LbgG2XPyKRaYJDYEGXBPfKWm4kqGh+b2ucaZGDQA8Q3
 zSOBSRdV9KpRsT+lyfUT6rTfEq14e3ln5YrnZ/B09e438sKaoeW5LAKeNu5TRc0SGfMb
 mqDQBWpHzmtd+GFqvqT+ZowGfq3Pwkjdix5KxcNFH4I0JQUsUgCbxQO9mLj4hUQqCpcC
 gH2lNaazG1kDAkKgSc5wbQnrvqycTkB/8tCwcVc0sC8oxnvcyvhh79NsToyw/ePp1qol
 eW7XUNyEWJI/rued2KPJkUBd0IB/wMyPwW9xrGeyflyoLzpRn3w9+ogT+xpSP9yQwpvk
 78cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m4a685HUG50oDycdiMz8MX8zwTLJNRbcKkuniaQymBg=;
 b=b4OQQRoYvlbjZ9i1QHqTh5TOlQ9+iWvpyy7kEfT76EcgVS0axER+2CrxYIT8tE0MQn
 nwTKT5U3wDSUMoEwxFO7lC+1YtfH33oSmmrRJM9gS76RbJARWo/JzGc6b9/IG1finSTs
 iKt2gEzn0WglgXqnVM623FPVgtuBQ88fAdqd4QS8mSUquG8LZHEjNV+P//Nt9c7mZk37
 rmIV5JDSvVBFcO4llr9mQZpeYSxSsrusRHwEzbIRE1rokxj6yZblc3fOtRwC64cqRgwI
 w30U+q35E66mzsnc5zqBswqDlpzwSPGtIMi8cZezMkMVrmpuuj6mrw+ZjET9PIhev4CT
 qIIA==
X-Gm-Message-State: AOAM532i8keEYeaNV5fumearhfBzUOuAbCGhaD8uEwD6Ig/iyJES5WfO
 il1Ml6tiF3wQFpmA9wNKrADJwwMBejU=
X-Google-Smtp-Source: ABdhPJwItLozJEM/PSo39Kr1OzMeR5J+B7pUINjjCzGDndlLp+Bs4RbaeX5nZ1BzGIvLGzrow0yfqQ==
X-Received: by 2002:aa7:9d1c:0:b029:1f1:53b2:a5b0 with SMTP id
 k28-20020aa79d1c0000b02901f153b2a5b0mr14392083pfp.13.1615896297451; 
 Tue, 16 Mar 2021 05:04:57 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id d5sm2722166pjo.12.2021.03.16.05.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 05:04:56 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v4 11/12] hw/net: sungem: Remove the logic of padding short
 frames in the receive path
Date: Tue, 16 Mar 2021 20:04:19 +0800
Message-Id: <20210316120420.19658-12-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210316120420.19658-1-bmeng.cn@gmail.com>
References: <20210316120420.19658-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we have implemented unified short frames padding in the
QEMU networking codes, remove the same logic in the NIC codes.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

(no changes since v1)

 hw/net/sungem.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/hw/net/sungem.c b/hw/net/sungem.c
index 33c3722df6..3fa83168db 100644
--- a/hw/net/sungem.c
+++ b/hw/net/sungem.c
@@ -550,7 +550,6 @@ static ssize_t sungem_receive(NetClientState *nc, const uint8_t *buf,
     PCIDevice *d = PCI_DEVICE(s);
     uint32_t mac_crc, done, kick, max_fsize;
     uint32_t fcs_size, ints, rxdma_cfg, rxmac_cfg, csum, coff;
-    uint8_t smallbuf[60];
     struct gem_rxd desc;
     uint64_t dbase, baddr;
     unsigned int rx_cond;
@@ -584,19 +583,6 @@ static ssize_t sungem_receive(NetClientState *nc, const uint8_t *buf,
         return size;
     }
 
-    /* We don't drop too small frames since we get them in qemu, we pad
-     * them instead. We should probably use the min frame size register
-     * but I don't want to use a variable size staging buffer and I
-     * know both MacOS and Linux use the default 64 anyway. We use 60
-     * here to account for the non-existent FCS.
-     */
-    if (size < 60) {
-        memcpy(smallbuf, buf, size);
-        memset(&smallbuf[size], 0, 60 - size);
-        buf = smallbuf;
-        size = 60;
-    }
-
     /* Get MAC crc */
     mac_crc = net_crc32_le(buf, ETH_ALEN);
 
-- 
2.25.1



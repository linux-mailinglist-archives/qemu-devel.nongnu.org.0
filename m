Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59288683518
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 19:21:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMvGB-0002JH-DJ; Tue, 31 Jan 2023 13:21:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vlaomao@gmail.com>)
 id 1pMvFp-00026q-Fk; Tue, 31 Jan 2023 13:21:14 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vlaomao@gmail.com>)
 id 1pMvFm-0004dN-N5; Tue, 31 Jan 2023 13:21:11 -0500
Received: by mail-pj1-x102f.google.com with SMTP id j5so14985311pjn.5;
 Tue, 31 Jan 2023 10:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ysNCTqWaPnAGQ3dgjxnJlhfeW1HUqcrTZzoOO7atXzg=;
 b=ju51IrIIBzsdQEdK9yRfKFbcHpBUt1rmTVxrY/WkriecAKv+6laxeXEDb/MI9oKrl4
 SQYOn4sC+tpn4vsq5R67Fm7/m8S2WkcqfDtc+cnlo4a6+0ga44R+gzRJ52gQh46lXv9G
 wOpty7+28yUgvgfoE4hm9No+qTUqUiO2Qd/Su+xz3FGIBwsjr6Ccgm9jwB83sen6Num0
 jiJR0h5bvCz8lpxwS3C903umh9YvlRQH9RHWhJjfgGkvVV3vGLIHCK+4xfYHmmiUUGaP
 V4bKzH8JV/tZ7qK4jS9z3l2RAFnMYlqK6+qiJQUcd5BHXpuPpO6eguxKmhmiJAasvx9r
 i+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ysNCTqWaPnAGQ3dgjxnJlhfeW1HUqcrTZzoOO7atXzg=;
 b=K3fJxlVjWC0/ll55FoQDaMc+5NB3/VcajOOEDmcc0YO/hFIqdqqfqCs8kfX5OyUTWx
 Z+eE/yfLJxv7Mgx1wxk01pBLOq1jn+uUwFCaXbwF20vzFaW4GUhnRIKlBNVzcWcjKbl3
 +iTDCwfGDIdv+qzDJHm4nekP18Qg1JxPgQUDPwpSMq5HhQNkqbJD0EuzY6lKrPpmEBkr
 iP4OIyf9Xn+Xl/oF7K1CzsGn5w+lL4dxVWxl7mTDUe3dy7vJgkOitEsF88Gr1paXe2ss
 CQShxCG469ZLHMUuVinnWgR/f6SZaUolVIyU8m6EvpxUxuwFiBziAovD0hPJPO7HPhZt
 F70Q==
X-Gm-Message-State: AO0yUKUOjYL08fCOT2ShoLW8y8xLfrPX8ZCYMY2wb+Uxnp/OXrrw6eOv
 vhotXHIn2f78lTYOl2RYwWw=
X-Google-Smtp-Source: AK7set/kgR2snHeb4vw+gH/gBnwfCTfwcNHooGBHViHiGTeiQ6IDcMa2ld1RGlGt+Dfm3eKBsGGBSA==
X-Received: by 2002:a17:903:1d1:b0:196:433e:236b with SMTP id
 e17-20020a17090301d100b00196433e236bmr26017689plh.54.1675189267442; 
 Tue, 31 Jan 2023 10:21:07 -0800 (PST)
Received: from localhost.localdomain ([94.181.144.4])
 by smtp.googlemail.com with ESMTPSA id
 jd13-20020a170903260d00b0019893d572bfsm2260414plb.211.2023.01.31.10.21.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 10:21:07 -0800 (PST)
From: Vlao Mao <vlaomao@gmail.com>
To: dmitry@daynix.com
Cc: jasowang@redhat.com, qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 laurent@vivier.eu, VlaoMao <vlaomao@gmail.com>
Subject: [PATCH qemu 1/1] vmxnet3: add mac address restore upon reset
Date: Tue, 31 Jan 2023 21:20:48 +0300
Message-Id: <20230131182048.15535-2-vlaomao@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230131182048.15535-1-vlaomao@gmail.com>
References: <20230131182048.15535-1-vlaomao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=vlaomao@gmail.com; helo=mail-pj1-x102f.google.com
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

From: VlaoMao <vlaomao@gmail.com>

Changing the address with a subsequent reboot makes this address permanent until the vm is turned off

Signed-off-by: Vlao Mao <vlaomao@gmail.com>
---
 hw/net/vmxnet3.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
index 04159c8222..695ca2f923 100644
--- a/hw/net/vmxnet3.c
+++ b/hw/net/vmxnet3.c
@@ -1206,6 +1206,8 @@ static void vmxnet3_reset(VMXNET3State *s)
     s->drv_shmem = 0;
     s->tx_sop = true;
     s->skip_current_tx_pkt = false;
+
+    vmxnet3_reset_mac(s);
 }
 
 static void vmxnet3_update_rx_mode(VMXNET3State *s)
-- 
2.35.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CBE638F1A
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 18:32:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oycXY-0004TL-BX; Fri, 25 Nov 2022 12:31:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oycXM-0004PD-PX
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 12:30:54 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oycXJ-0004VQ-42
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 12:30:51 -0500
Received: by mail-wr1-x42d.google.com with SMTP id i12so7846950wrb.0
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 09:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Ird9EWm5rUrfSLhU9FEPVhmmn/d7w0Px+XaTSgwxrQ=;
 b=NYpMmAQONbqei4NhdhtgfPWqiYWMpEZg0yrNuQhU80fLybCSTkDMli50KFYlIxsiCR
 eVXoZHp9KreRzRWQ76cPj9r52H7UWWNAxR7qTHojrCDoeyoXrhe/igNBLeyzU8zEYiSF
 Igx7b7Z/4ab3SMvtGiG/zkHW5HG12FC/aG7VNC2OFjApZvGiVcZi9SpNUFXucCaPwynE
 /RSCi0l6PYoCa56TsC2CN0f9aF57OlP2q1M9lk9+BIMtrJgQUuZE/HsdSoCteSWA1Qc6
 0p2VQQwE468bH31zf2BbzB/tTqAwTjsIDfn0l7ezupiWvAwZSL+3jsmMbrt/x6H40i82
 Xkxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1Ird9EWm5rUrfSLhU9FEPVhmmn/d7w0Px+XaTSgwxrQ=;
 b=FEfN974AzA6wWMCoehK0HgRATaUlFUnsvnHxewbcTlNKnPGuiralOtFML7BInKB4qz
 GCZadHW0qp7EwVEFSviiNRsONQbaMybgC73yqQP7UVnE4Hcqihqs1h8nC80uzgGr9PR3
 nO2eEtGWgXCYN4aJLAWaEKniDYF7VSqpWY0xtykBZAMcXcyvbhWfYxtknSpPX0Nr7D75
 fappQ4Jde78q9bi3DmJ749HSEcThWb/NKMWcvCG/raP4EOUNQAUUoLx4jDr9JiPp4GHk
 nUOuo3O8Gw+Fp/LSqD1rxSjN11OGSH4jVcYaszDhUCXU5HIIPh2p0pymC0eOrrGcfzrk
 4lQA==
X-Gm-Message-State: ANoB5pkyoqUXIqmsOIPrVRL4H/IIyhNbpUZsBDwQJtbcQZ3UfyCdKOir
 vAZ3pfx1sK/sKML8+F2HaVhGnw==
X-Google-Smtp-Source: AA0mqf5rjH81jq1aQhWuh+UwOq+jX065lcdNVeV/Q6uT+8tyft74lPlYoBNqBgTg3JmTH1ptwjJ1Ig==
X-Received: by 2002:a5d:50c9:0:b0:241:dc84:eb93 with SMTP id
 f9-20020a5d50c9000000b00241dc84eb93mr12353618wrt.136.1669397447777; 
 Fri, 25 Nov 2022 09:30:47 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a5d46cc000000b0022ca921dc67sm4101213wrs.88.2022.11.25.09.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 09:30:44 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7F4831FFBC;
 Fri, 25 Nov 2022 17:30:43 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 sgarzare@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 4/5] hw/virtio: ensure a valid host_feature set for
 virtio-user-gpio
Date: Fri, 25 Nov 2022 17:30:42 +0000
Message-Id: <20221125173043.1998075-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221125173043.1998075-1-alex.bennee@linaro.org>
References: <20221125173043.1998075-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

There was a disconnect here because vdev->host_features was set to
random rubbish. This caused a weird negotiation between the driver and
device that took no account of the features provided by the backend.
To fix this we must set vdev->host_features once we have initialised
the vhost backend.

[AJB: however this is confusing because AFAICT none of the other
vhost-user devices do this.]

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/virtio/vhost-user-gpio.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/virtio/vhost-user-gpio.c b/hw/virtio/vhost-user-gpio.c
index 5851cb3bc9..b2496c824c 100644
--- a/hw/virtio/vhost-user-gpio.c
+++ b/hw/virtio/vhost-user-gpio.c
@@ -228,6 +228,12 @@ static int vu_gpio_connect(DeviceState *dev, Error **errp)
         return ret;
     }
 
+    /*
+     * Once we have initialised the vhost backend we can finally set
+     * the what host features are available for this device.
+     */
+    vdev->host_features = vhost_dev->features;
+
     /* restore vhost state */
     if (virtio_device_started(vdev, vdev->status)) {
         vu_gpio_start(vdev);
-- 
2.34.1



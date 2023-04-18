Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 157226E6958
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 18:22:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poo5T-0006lH-35; Tue, 18 Apr 2023 12:21:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poo5R-0006k9-B3
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 12:21:45 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poo5P-00019u-Hr
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 12:21:45 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 ay3-20020a05600c1e0300b003f17289710aso131506wmb.5
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 09:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681834902; x=1684426902;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2d/kTabziFWz81diPGPd2lcq9eXntPtMnKyAEA11+CY=;
 b=VBIl2DDITwHYzCBWk8T/c3PSW1X/2UIjoMDfUr0uzjO1UAEp9twCZm7Pu6X01Vb4TS
 MDDcY8sUPQvlfFBou1xMdSZ8oMBcyY6dAh7h/8HGUxYrlDuQpOYVKBdGUOEBs8g2oNF3
 hNzuNZHkf87fQTu/BlnAJKfu6mD4W6HV3DyZ7bElssGj2fsRDQsrLfOea90OVg7uuxST
 qICsIFBVYL9wzNoV0qnAMT7M1CnOdEBK+FF62kykL9Vm0ghchrwt9xpmxF2Z6mQYFGBY
 sIFy2WBte33dS4OPTCmE+njA9hediQv9SIC+QyHCjaymAv93BCJ0P0f+WGjfb6A/2xaC
 88og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681834902; x=1684426902;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2d/kTabziFWz81diPGPd2lcq9eXntPtMnKyAEA11+CY=;
 b=BwhhAVdjOJhbW6AZLsbd4eYv1MnjBdIbZFrWrU9yGxiM36EXKsCnC261fGvLfPvutM
 Uziu6uevZVIAUN2mcM7t1TUMnsLQ39Tvwmorig44WiDbm8cU9X7YhvushNITOQ91bVHs
 VwHx6pnqh5ajaWxfjtMD86m21WkYNGDLyUjf/TewA6Lnro48n7IERgjhdyBl0+PSEydu
 D5SXpOP/sINLmcSOyPgMhea5iTFME6CTBalVBtCHBarqJv3C+qta0AkQPkqvAQGrvTo1
 lvyVjUj/tPf+wYjVBIEcLAUYQyP0hnPxDQxsEvU26YgRxVzXUMb0oV6WN/dj2gNDrsx2
 OfiQ==
X-Gm-Message-State: AAQBX9cFhjaRjEvYQsY3KLZcnOE9RLHduNmdkUgSMOHeLzluI6j7Ka+4
 OEXRj1qVBAWy1/evUu3Ud+9Sag==
X-Google-Smtp-Source: AKy350YtD6bBJft2RRV38a3ORIWN/9fGZgfO3eHwzCTzevswU1L/ErwgMViK2taC//TGcSrBeiduOQ==
X-Received: by 2002:a05:600c:21c4:b0:3f1:6ef6:c9d6 with SMTP id
 x4-20020a05600c21c400b003f16ef6c9d6mr8330381wmj.32.1681834902140; 
 Tue, 18 Apr 2023 09:21:42 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 z16-20020adff750000000b002fb6a79dea0sm3963944wrp.7.2023.04.18.09.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 09:21:40 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 57F9D1FFBA;
 Tue, 18 Apr 2023 17:21:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,
 Erik Schilling <erik.schilling@linaro.org>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>, virtio-fs@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v2 02/13] include/hw: document the device_class_set_parent_*
 fns
Date: Tue, 18 Apr 2023 17:21:29 +0100
Message-Id: <20230418162140.373219-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230418162140.373219-1-alex.bennee@linaro.org>
References: <20230418162140.373219-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

These are useful functions for when you want proper inheritance of
functionality across realize/unrealize calls.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/qdev-core.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index d4bbc30c92..b1d194b561 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -795,9 +795,36 @@ void device_class_set_props(DeviceClass *dc, Property *props);
 void device_class_set_parent_reset(DeviceClass *dc,
                                    DeviceReset dev_reset,
                                    DeviceReset *parent_reset);
+
+/**
+ * device_class_set_parent_realize(): set up for chaining realize fns
+ * @dc: The device class
+ * @dev_realize: the device realize function
+ * @parent_realize: somewhere to save the parents realize function
+ *
+ * This is intended to be used when the new realize function will
+ * eventually call its parent realization function during creation.
+ * This requires storing the function call somewhere (usually in the
+ * instance structure) so you can eventually call:
+ *   my_dev->parent_realize(dev, errp);
+ */
 void device_class_set_parent_realize(DeviceClass *dc,
                                      DeviceRealize dev_realize,
                                      DeviceRealize *parent_realize);
+
+
+/**
+ * device_class_set_parent_unrealize(): set up for chaining unrealize fns
+ * @dc: The device class
+ * @dev_unrealize: the device realize function
+ * @parent_unrealize: somewhere to save the parents unrealize function
+ *
+ * This is intended to be used when the new unrealize function will
+ * eventually call its parent unrealization function during the
+ * unrealize phase. This requires storing the function call somewhere
+ * (usually in the instance structure) so you can eventually call:
+ *   my_dev->parent_unrealize(dev);
+ */
 void device_class_set_parent_unrealize(DeviceClass *dc,
                                        DeviceUnrealize dev_unrealize,
                                        DeviceUnrealize *parent_unrealize);
-- 
2.39.2



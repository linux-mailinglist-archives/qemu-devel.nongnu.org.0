Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF53653CBF
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 09:02:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8GV8-00008T-3B; Thu, 22 Dec 2022 03:00:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8GUt-00006H-TO
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 03:00:14 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8GUr-0003lR-O0
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 03:00:11 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 z8-20020a05600c220800b003d33b0bda11so3630379wml.0
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 00:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=S94DCk4FKjoYsfdjHsj30dWPfli7J/Iy9TltG36gYfQ=;
 b=CzNZWF7uplJiyRIJ2/ML9D8C5iYFTP0T1U3UA79gg3IuHQGlIuFjvvcWyIJWfhppjn
 tMuJ3x1Ht3YnObgSPfchhmXrki9h5GaadXEjdWb3XQAFtDbpYS17rqYUvmPxfcZNxL/p
 81ii8DkgQw09WfDTwL5b+tGDi7vIU4p8sTKE+T1XHfE+7q6kQ4hS9JzT7CwUKVEGXvV+
 eE+KLV3PHG+/+20r+kOiakwW6QW9riYUkHMNlLeKl5TWLdPWD4ghsUzPPzOisk/+2/I0
 vXv+JVYNuMmQurCoYwlgitAsZ9RAHyuKoPh3bfSp4AT1dYrtKGJLLu5BbYgy9csdsmdZ
 2FKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S94DCk4FKjoYsfdjHsj30dWPfli7J/Iy9TltG36gYfQ=;
 b=1eozAFJgqTke6/1s6CuFQSABUPfezEPJk2C9omgdmyTj618uULp5+Bra1Ow1pyz/Ii
 w9ht6IuXKY40d8O5ICFDYnSujdeGoTfm36qJ5B+K+b2Tjt2CSDNQl/9ySXZWRhbE2ONo
 1KPoopbRhOSezCUH3s5nN9/hapnQrqSfyiRJ7qT23+JhXHfhV109BJEDFajii99bmB/4
 5XpAvvryeX20iPyoY1Cr1K24yNhOxgdAi6/pEXQTz+2SMy1SEPWRkulMEqmXiQbpsnUr
 Cbh8S3elWJSbtpb7x/VmcPBERf2rtUphv8lWwion2YtEbm9/lc8mDx34J6kMFcFcCQ4D
 +BDg==
X-Gm-Message-State: AFqh2kpzBtE8VaQPMfP+Jh/OuTC0HDsWAlC5Rc0U1HaeXF080H36jIvT
 8DKjkYyX4SM/4TbuPpGqG0jcg/a4kpocTJsTA5s=
X-Google-Smtp-Source: AMrXdXuKtZqkmZ6QxDSEK9dKkqOZcHlFqF8W+5cVECaQ6ydSSsKafRyDvFFyWBeJkzESpV0pl+Kfag==
X-Received: by 2002:a05:600c:a4d:b0:3cf:6e78:e2ca with SMTP id
 c13-20020a05600c0a4d00b003cf6e78e2camr6171384wmq.5.1671696007647; 
 Thu, 22 Dec 2022 00:00:07 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a05600c0a4400b003cf75213bb9sm5550409wmq.8.2022.12.22.00.00.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 22 Dec 2022 00:00:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jonah Palmer <jonah.palmer@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/2] hw/virtio: Extract QMP QOM-specific functions to
 virtio-qmp.c
Date: Thu, 22 Dec 2022 09:00:03 +0100
Message-Id: <20221222080005.27616-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

Move more QMP code from virtio.c, as suggested by Jonah while
reviewing "hw/virtio: Split ioconfig / qmp code from virtio.c"
(https://lore.kernel.org/qemu-devel/20221213111707.34921-1-philmd@linaro.org/).

Philippe Mathieu-Daudé (2):
  hw/virtio: Rename virtio_device_find() -> qmp_find_virtio_device()
  hw/virtio: Extract QMP QOM-specific functions to virtio-qmp.c

 hw/virtio/virtio-qmp.c | 192 +++++++++++++++++++++++++++++++++++++++-
 hw/virtio/virtio-qmp.h |   9 ++
 hw/virtio/virtio.c     | 195 +----------------------------------------
 3 files changed, 203 insertions(+), 193 deletions(-)

-- 
2.38.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2C46F7315
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 21:14:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pueNp-0005J8-D8; Thu, 04 May 2023 15:12:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1pueNn-0005IZ-6e
 for qemu-devel@nongnu.org; Thu, 04 May 2023 15:12:51 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1pueNl-0004c4-Jw
 for qemu-devel@nongnu.org; Thu, 04 May 2023 15:12:50 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-642f5394651so850569b3a.3
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 12:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1683227567; x=1685819567;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xJz5UKjThfKKNl/bQ2PI+tYFf8ELmB4Zwo10orVvGeg=;
 b=jjhzE+yJJLJoLKsrkmLgwF9psy5cTQuDTlOQ1nHIAVMfc/BzbkrHRY8xfO4WkQZxYs
 gczTZwA79SpzCzLhB98OPzg9k6lbOg6eEBKqeoDj5uCcAg/rIiOrHnysZj896BMXXVbf
 WLUAzdEGs1byhnzHpIVQXos6LBPAaqiUVhT70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683227567; x=1685819567;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xJz5UKjThfKKNl/bQ2PI+tYFf8ELmB4Zwo10orVvGeg=;
 b=P5UH7D7+//bjPnM1HME/sD+jyiGjJb6f/CwWeP5ysWLeN2NMz8IWzH54QAaPpLj8HC
 BvBIX6AjUFRkzf31DvyeFxAQXqKIxYukx8DdH46j5kGdeKj0U03UF+/XwZ/xrCUkBnGQ
 q1Y1UiYOPyeZDf1Qhq/eMMflphBXBRQ2Os03rMBL+2QdbgI18W7WZ+QuzlRbVbotc2SW
 pBM2TXi1cmqlXJ7SOAB9mBItFpDsUeJgwS3paIayQLQoYzG645Kh953gNIEpb9+qHtz5
 PJpK+6mw8WIWzrCPDNYPt5QKgdxQBztCHH7O+53v+thIG67MOIMUeYu9cPgIQF0NhzzE
 knDQ==
X-Gm-Message-State: AC+VfDzib9NY1+N8Vinyjs8iWPosdAMwvQ2DeMsTvku6ur48QyE1ue7U
 mjuQZ5HY85/GI/aPiGmryp3M8i9XQgbGy2PyRFw=
X-Google-Smtp-Source: ACHHUZ4sjjdL5yLT19b4vw49WVwaPZULaknXy89e3mJTgrKbNMFZ+9ZMOlLfm0vR87K4pjPl62xH3g==
X-Received: by 2002:a17:902:f546:b0:1ab:665:c152 with SMTP id
 h6-20020a170902f54600b001ab0665c152mr5896995plf.2.1683227567045; 
 Thu, 04 May 2023 12:12:47 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:a7:2:4891:407:d4c8:7fa9])
 by smtp.gmail.com with ESMTPSA id
 w2-20020a170902e88200b001ab2a0733aasm2185980plg.39.2023.05.04.12.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 12:12:46 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, kraxel@redhat.com, marcandre.lureau@redhat.com,
 akihiko.odaki@gmail.com, dmitry.osipenko@collabora.com, ray.huang@amd.com,
 alex.bennee@linaro.org, shentey@gmail.com
Subject: [PATCH v3 0/5] virtio-gpu cleanups and obvious definitions
Date: Thu,  4 May 2023 12:12:38 -0700
Message-Id: <20230504191243.746-1-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=gurchetansingh@chromium.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Gurchetan Singh <gurchetansingh@google.com>

v3 of "virtio-gpu cleanups and obvious definitions"

https://lists.gnu.org/archive/html/qemu-devel/2023-04/msg05392.html

All patches have been reviewed, though there was a question from
Bernhard Beschow about patch (3) and how it fits with the QOM:

https://lists.gnu.org/archive/html/qemu-devel/2023-05/msg00057.html

I go into detail in patch 3 commit message, but I think we meet
the requirements (which are tricky/fuzzy anyways).  Also, I think
this is the cleanest way to add another 3D virtgpu backend.  But
if anyone has other ideas, please do reply/review.

Antonio Caggiano (1):
  virtio-gpu: CONTEXT_INIT feature

Dr. David Alan Gilbert (1):
  virtio: Add shared memory capability

Gurchetan Singh (3):
  hw/display/virtio-gpu-virgl: virtio_gpu_gl -> virtio_gpu_virgl
  hw/display/virtio-gpu-virgl: make GL device more library agnostic
  hw/display/virtio-gpu-virgl: define callbacks in realize function

 hw/display/virtio-gpu-base.c   |   3 +
 hw/display/virtio-gpu-gl.c     | 114 +--------------------------
 hw/display/virtio-gpu-virgl.c  | 137 +++++++++++++++++++++++++++++++--
 hw/virtio/virtio-pci.c         |  18 +++++
 include/hw/virtio/virtio-gpu.h |  11 +--
 include/hw/virtio/virtio-pci.h |   4 +
 6 files changed, 160 insertions(+), 127 deletions(-)

-- 
2.40.1.521.gf1e218fcd8-goog



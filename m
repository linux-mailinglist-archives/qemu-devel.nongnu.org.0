Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB52463B32A
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 21:29:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozkjI-0002hl-Tg; Mon, 28 Nov 2022 15:27:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozkjE-0002e9-Aj
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 15:27:49 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozkjC-00027J-GH
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 15:27:47 -0500
Received: by mail-wm1-x333.google.com with SMTP id t1so9386156wmi.4
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 12:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JOnbDGyVf5k/5lf6GMSnay/oOBUuU7F9b/x1tgkaw5Y=;
 b=yI4l9qYaztYlWqV8Ulkhzm8NkUlyq40m/hBv1oFCz/urIGz4I8ut5rTFo1JjjBXZv+
 RR+9T+a1NohFX6TE3h95UucnoNPhpsxEF1jSfYyVF07GnUJgHoP8D4s3gttxBpVL7FCy
 yiBG93Hymm7twKVTd/KOKfFUxq/s8vQj35Sp/8E5tuZefNe+IwR0uL9lpPXq2o4qIx/g
 6dpb0lSuFzVuO/gqNj/LUe5J5m9vC+36RLqHPNPT/8voLOuwNnnMc69SIZnHuyMmMNPJ
 +/Rwt6y5SaaweDg4g00Q5gWP4SDsAy4U3UaMqbzMg0SZsRXZC0NikPGr+TEhRwotTMgk
 5wIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JOnbDGyVf5k/5lf6GMSnay/oOBUuU7F9b/x1tgkaw5Y=;
 b=1JGHcKhPzZM6oSm+EoxiaVKJl7wpmMEMARYHwKEitLNxHaS3HChTkQVVqqIVyKKjLt
 Ywf/FPSuJYW1JJmw0IrP94RGvHjCR35qC44OQ62ayCyfQBVYk52y/lxDHFN2DUYVLnIJ
 FF2ZtQxv84sCi0UctbFEjsGep08f5Si6km3ef09g0UBIKlCVe9qGx3E0XlM4fqX+e9ai
 K5Ibf04XDphOhiVsbML0M8cmZll97I+v5HcviCZMpike0FHbMStN/bP3YbCOEnD3etDh
 l2/JfFoHmourq7VVkPDJOVtqXFXiQoaNR+ProJ2rqcsYbR31G0gUZkcjEKLBmy+JMynC
 5LOA==
X-Gm-Message-State: ANoB5pmztbaAt0KflG6TF0gwGpvgj6gBrztNoWslkGOXLvskSRjiLK5T
 uhQOCq9z+w7DXYdO3D4e9ITA27R+pf/j3w==
X-Google-Smtp-Source: AA0mqf5oV0pEzpUOGmb33wEXvOpQIuz8Tx/WkRqDIhNxNWH9pb8wa6BM+pXhFRUv1cKgQhKuGjN8gw==
X-Received: by 2002:a1c:7219:0:b0:3cf:77b7:61e6 with SMTP id
 n25-20020a1c7219000000b003cf77b761e6mr27827386wmc.162.1669667264083; 
 Mon, 28 Nov 2022 12:27:44 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a05600c19ca00b003c5571c27a1sm20764242wmq.32.2022.11.28.12.27.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Nov 2022 12:27:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Cc: Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH-for-7.2 v3 0/5] hw/display/qxl: Avoid buffer overrun in
 qxl_phys2virt()
Date: Mon, 28 Nov 2022 21:27:36 +0100
Message-Id: <20221128202741.4945-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

Since v2:
- Do not abort checking guest-provided addresses (Stefan)
- Handle chunked QEMUCursor (Gerd)

Since v1:
- Moved overrun check in qxl_get_check_slot_offset (Marc-André)

memory_region_get_ram_ptr() returns a host pointer for a
MemoryRegion. Sometimes we do offset calculation using this
pointer without checking the underlying MemoryRegion size.

Wenxu Yin reported a buffer overrun in QXL. This series
aims to fix it. I haven't audited the other _get_ram_ptr()
uses (yet). Eventually we could rename it _get_ram_ptr_unsafe
and add a safer helper which checks for overrun.

Worth considering for 7.2?

Regards,

Phil.

Philippe Mathieu-Daudé (5):
  hw/display/qxl: Have qxl_log_command Return early if no log_cmd
    handler
  hw/display/qxl: Document qxl_phys2virt()
  hw/display/qxl: Pass requested buffer size to qxl_phys2virt()
  hw/display/qxl: Avoid buffer overrun in qxl_phys2virt (CVE-2022-4144)
  hw/display/qxl: Assert memory slot fits in preallocated MemoryRegion

 hw/display/qxl-logger.c | 22 ++++++++++++++++++---
 hw/display/qxl-render.c | 20 ++++++++++++++++----
 hw/display/qxl.c        | 42 ++++++++++++++++++++++++++++++++---------
 hw/display/qxl.h        | 23 +++++++++++++++++++++-
 4 files changed, 90 insertions(+), 17 deletions(-)

-- 
2.38.1



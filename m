Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA68E63AA04
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 14:49:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozeV2-0004tL-Q6; Mon, 28 Nov 2022 08:48:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozeUw-0004rA-At
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 08:48:42 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozeUt-0000G5-V9
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 08:48:37 -0500
Received: by mail-wm1-x32c.google.com with SMTP id t4so8467305wmj.5
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 05:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MZHon2ssKS6cYVjv8apiNU4TDNXbrqNz46t6j8lZTCs=;
 b=ID2RRaRALYJNnQm5/tSLrzz2NgvmZp48cx5kbX6kEYU4rUKWSKJMMYD8NsLTZTKfEL
 D2IZA3AkB8HTR8zL8rt0ZESBJuGPmkt6EnP1LPfl4lJt4BKDaQ0CxLF0O/W5IPquqga4
 S/NPAgkAH3ZXOSB+AxsvCHhP7Vt5hUqQoQax2Xxp83YHYK/1vLxQXvcnxfxbWNdCBjDK
 zFWypObgVBXaetUZikB2B6XUbJ+OlPK646Ij8MOznQ+bbvZquVTGvN5xFcPyMTshpNv4
 8Ek+gy/FG3af7E38H5UzciC4vq0UsnxcGSmi2fyDcfo5WZGxUWUfNr0UcX5ZyXnw1mcN
 TOzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MZHon2ssKS6cYVjv8apiNU4TDNXbrqNz46t6j8lZTCs=;
 b=yDBpEKv1KMKvy76SjH/aiVqCV1MK24Swr1sJbhbDTYeFoZM4H3Js5/ZRmrW71GKBut
 KbYba+XpiPhIERATp5fa/kxsqG5hp0lrFPnTXY26UHTcRgs/py0hRsYk2NgsdcCdjkyK
 C65gr3rR/Ei+poCyZxw8wJsQ7XCKOlGrSWI9VaOdH8fGeTDPvdKKhJK4ELS41Uzo3T6i
 s0aqeCVeYMJ4JWYsweQxn/8yHwkDlcqvDAomoE81IWkUc8UUMdNMiSTFCypgZd3OCSQG
 7KPpLKBkiJw4PslfgpFNTekPkgZz4daT60i46CmVOzU9nagXwmzAhs/St3v+LgAJYqwO
 bWPQ==
X-Gm-Message-State: ANoB5pldTP6GWPbxq6NAb07NPTlLdNU3IRlWtaGtWybLhbtG39Z3mVGs
 amcL2wUFw0owedZmFOpj79zDSQ==
X-Google-Smtp-Source: AA0mqf7rZ65X1xQlvJSpWhzb5IvdIbz/GaBoWQxiea7FQe0KdODeejRdg6F5UIPlbdWyU/w7XEGFEw==
X-Received: by 2002:a05:600c:4e12:b0:3cf:d4f7:e70d with SMTP id
 b18-20020a05600c4e1200b003cfd4f7e70dmr26757830wmq.187.1669643314363; 
 Mon, 28 Nov 2022 05:48:34 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 a11-20020adfed0b000000b002365730eae8sm11053419wro.55.2022.11.28.05.48.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Nov 2022 05:48:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH-for-7.2 0/5] hw/display/qxl: Avoid buffer overrun in
 qxl_phys2virt()
Date: Mon, 28 Nov 2022 14:48:27 +0100
Message-Id: <20221128134832.84867-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

Since v1:
- Addressed Marc-André review comments
- Moved overrun check in qxl_get_check_slot_offset()

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

 hw/display/qxl-logger.c | 22 +++++++++++++++++++---
 hw/display/qxl-render.c | 12 ++++++++----
 hw/display/qxl.c        | 37 ++++++++++++++++++++++++++++---------
 hw/display/qxl.h        | 23 ++++++++++++++++++++++-
 4 files changed, 77 insertions(+), 17 deletions(-)

-- 
2.38.1



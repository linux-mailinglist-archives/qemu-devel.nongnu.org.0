Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5866C638D99
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 16:42:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyaok-0001fx-SN; Fri, 25 Nov 2022 10:40:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oyaof-0001fh-TU
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 10:40:37 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oyaoe-0005lR-D1
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 10:40:37 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 p13-20020a05600c468d00b003cf8859ed1bso3687719wmo.1
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 07:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KIUbotBmyk9vnhMj0kuXAD/ZorzGhC158mTq9vzJAlI=;
 b=vPQAC0OTp9F3TxoDOoSwhdG6MEfI0s1K1kOJeDfzD26annSj+5Oj3LgI4CpAniBuL0
 zJ4afkHL+2QZmSKPbxnaTj6/fggNG8g1MJXcvIekFSnAHNIVaVNJHGSv4tQ5UcS226oA
 pHPGtny3WhmZ9SbD/S+5rEAs1VFNqhO9W1BvdDAwfo75QrAylgzuJUqi4kOkCvync7r9
 /dhwIVNNAt4tX9qQqmQtg4rHcbADHn4ySj4TckOnaxww7kTSbStda/Kva3Q4yeFt7zJG
 AzJSF79w2PR23bqLGDFOzWhIcXSaGwQdrYuXMGlV44t9lHtoIDSN/pt65jRezzSBGims
 m7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KIUbotBmyk9vnhMj0kuXAD/ZorzGhC158mTq9vzJAlI=;
 b=gpJJgFsK5IGP9iDgTxx8JgPtPMF/snr/zJGCe6Rj61cAoFmTq/EQseUJ3Hbi8X+26k
 juMkmYUoCedH8aX7jr8npxCZ1F+hgr9zlxJWwiaH2YrOI8e3DotJiuxlIz8n8xV4nY7Y
 2Ey3hgSnVrZa9ABjWI1feHji2WESJTwnpF5PDFV0cFOspr95aMQNE0w/IjVHx0yPQKqk
 B6MW+V50uC5F+8rEacG2OsnuBTN47rtab2gXFew+HcOlg3TbOlx783J6hgkJvyt0fmDi
 EUw2EghcchbmCdsPdwljrdtYamZlrXtlBG+Z84SCMjbWsLLdVYZiGjU6qs0h0tgc8/Nr
 58Wg==
X-Gm-Message-State: ANoB5plCjXRFBrhMMjoqwA/kn9h3H79akwwWNOSgMfh29Eyb4TazI2rP
 PIAgsLJbR1asGgEsAuL5x0cT7SHvR87oEw==
X-Google-Smtp-Source: AA0mqf7F+h0YNI1Rj+01otk5oycTfGQ6937IS5pJby/Jhl53MFm4X7WRdEwt8n2vu3+uqRVACmnrvg==
X-Received: by 2002:a1c:6a0a:0:b0:3cf:d64e:1cea with SMTP id
 f10-20020a1c6a0a000000b003cfd64e1ceamr14673743wmc.183.1669390832388; 
 Fri, 25 Nov 2022 07:40:32 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e30-20020adfa45e000000b0022e344a63c7sm4075681wra.92.2022.11.25.07.40.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 25 Nov 2022 07:40:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mauro Matteo Cascella <mcascell@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH-for-7.2 0/4] hw/display/qxl: Avoid buffer overrun in
 qxl_phys2virt()
Date: Fri, 25 Nov 2022 16:40:26 +0100
Message-Id: <20221125154030.42108-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

Philippe Mathieu-Daudé (4):
  hw/display/qxl: Have qxl_log_command Return early if no log_cmd
    handler
  hw/display/qxl: Document qxl_phys2virt()
  hw/display/qxl: Pass qxl_phys2virt size
  hw/display/qxl: Avoid buffer overrun in qxl_phys2virt()

 hw/display/qxl-logger.c | 22 +++++++++++++++++++---
 hw/display/qxl-render.c | 11 +++++++----
 hw/display/qxl.c        | 25 +++++++++++++++++++------
 hw/display/qxl.h        | 23 ++++++++++++++++++++++-
 4 files changed, 67 insertions(+), 14 deletions(-)

-- 
2.38.1



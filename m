Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E8C258D5D
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 13:25:03 +0200 (CEST)
Received: from localhost ([::1]:38036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kD4PO-0000GE-81
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 07:25:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kD4Nt-0007RN-8T
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 07:23:29 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:51062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kD4Nr-0007Le-HO
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 07:23:28 -0400
Received: by mail-wm1-x342.google.com with SMTP id e17so769295wme.0
 for <qemu-devel@nongnu.org>; Tue, 01 Sep 2020 04:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+QxXMhQFsrjlRtR6MdpHMZEV9+kuxTu8qRDE9hc8cHY=;
 b=U7x6WwJ3u1/EuyA2RidPp7wMlxgl6YVJR4eyNRRO9FQIabNDlhFr4oEuhRk3neQwQv
 pSRS5ypQO7vyQfRTSzPYjYnjFD+t0WmJQdHmGCnlHyZwBK4uJmTk8aUGmjbAnFo7Noxp
 bzUMAq0LFpIsFK/XNnWY1lJYaW/PcqWpMzOv7klpsmI/TAr1+dwOgQZ+S8s7SiMgGmKs
 xQGP/np/usJeewgYorro3deTORz78uzPFYJn70M3IUSJS3w0ibGyhCNkBUAjjfQ823lM
 S7PaXhFLoFppOIpdbhGOR09l0tSbkhpo2oA8pOLh4JM4tgpVvbJwSF4AghGrC2p62c8D
 M11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=+QxXMhQFsrjlRtR6MdpHMZEV9+kuxTu8qRDE9hc8cHY=;
 b=b00kn98MJWbe5mKhlZJjTvmK9ZISeU0P5BoBB9Gk7MqoXR8i2wFh3ygCDbBwbJu/dg
 kaxlJcZZhpUYlAZyGw9Vtyo5leM45eD5bByI79s2I/ppF/tlvnz3LX2M2tFverRKWStV
 5MAgQMFrHpo6feeFAiShrAQXYVTIhCiHIy/n/GOugFGm8MuRZbNStuhSUETpUIefJ2Xv
 IdazLq3V/YQWdtZ+8OvYhvlHde2+ZzqB3VocWE5Kz+YBA+A9Nm5CI4G/wMK4UJ9ZsQ5w
 u2t1EcuD1odUR8hnKn1GyefrWsNwr0/wwoVqqq8/o3n1wxFLVFtg1mo6kYLJTRhCvZR4
 Z5Aw==
X-Gm-Message-State: AOAM530l9g/lBSnywEAgrNtm989aSzLS6h6ZOnK6sG3IZFHuNXIey9RR
 32OPilEaKghOtEkuv2ruo65N8aAlp4E=
X-Google-Smtp-Source: ABdhPJzJagobWbapDkdH19O1uyRH9Ad84AU5Mb2OUrhzRL0ahf5as8BJDoScLj+TPDnQihylHC+ZYQ==
X-Received: by 2002:a1c:4d14:: with SMTP id o20mr1283415wmh.74.1598959405372; 
 Tue, 01 Sep 2020 04:23:25 -0700 (PDT)
Received: from localhost.localdomain (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id n11sm1769124wrx.91.2020.09.01.04.23.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 04:23:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] hw/core: Move hw_error() out of cpus.c
Date: Tue,  1 Sep 2020 13:23:21 +0200
Message-Id: <20200901112323.94969-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Claudio Fontana <cfontana@suse.de>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move hw_error() out of cpus.c because we already have cpu_abort()
there.

Philippe Mathieu-Daudé (2):
  cpus: Do not dump CPU state when calling hw_error()
  hw/core: Move hw_error() out of cpus.c

 hw/core/error.c     | 38 ++++++++++++++++++++++++++++++++++++++
 softmmu/cpus.c      | 17 -----------------
 hw/core/meson.build |  1 +
 3 files changed, 39 insertions(+), 17 deletions(-)
 create mode 100644 hw/core/error.c

-- 
2.26.2



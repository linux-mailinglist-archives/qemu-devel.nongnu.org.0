Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9008E3E2C3C
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 16:11:45 +0200 (CEST)
Received: from localhost ([::1]:53968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC0Zc-0006Iy-Le
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 10:11:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mC0YI-0004rw-MP
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 10:10:22 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:43535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mC0YH-0008D5-3Z
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 10:10:22 -0400
Received: by mail-wr1-x430.google.com with SMTP id h14so11230851wrx.10
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 07:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MA8hYibKJMWIEtbNaZEoCzgws0aEufHky77lbfew1s0=;
 b=vhHbKilEv4/XB3ep0W80RT7c29rIdkquQoysSdG7rQuAhRCfGTu6CNeBVs/u3fXGmL
 lQQhCj4eQ3190KPb5TGYiZ026fxVvV1Q3BX/j5MNReFJ9Juii7P9g2oSGPpdAm6eQutA
 m9JQIWBSS1HBlXUTOFZ/GsUB6VAbBQiON/7oRLN+57iJRyJNu+bECJY2HK/Xs4yaa0T+
 DAroERxN+heEL8Cnd0CUuA+5qyNsbWr3xeKWg0D+yL63HmYF+3V83Td8KPT3eIOlD9/D
 4u5JPL+QP9QafD/Lsw6Aa4QTqNcnG2ZPRxFskhdAG6DrM/47XZYmBzkccnIzi383lm5Y
 Xteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MA8hYibKJMWIEtbNaZEoCzgws0aEufHky77lbfew1s0=;
 b=HJ+nQKeO8kY3MT71QU/8lPZse/c8FuRaIv/HlZ4dwdnr2nLmf7H5ugg36FVSYNVYzw
 QnHhhHUyG61soUelGrkG019iGp6wPfdd9jruTvf8UCIz7g0FmlgJeGdMX5pqnP0meruY
 Noo/QZXFyiWg/hNMuWZvXrAlzy1RlqPs3314vYmM8x58jLIuy2yzTdpEuZnRRRDHVUNW
 Z+/gTF9fOCTuX8Ij5KHARlrCb/pRs2SSAOcekqABERLvpAWFbOZfu8Gd2BdjSnJjOyZK
 5lx9VANDLpQvvCBHdOURrzPnMTXZgR55kPUkyHQNYr9excR3kEsRufAi9ufqqEqxHgjt
 AIoA==
X-Gm-Message-State: AOAM532ntkZ/tQg0IqM1GyebDE0t7GGuxyYB1Rem/wbjutqb7EGDxjJT
 zgVxWQp6YeWpNC9fvR+4JyMtQA==
X-Google-Smtp-Source: ABdhPJws/5+HXU56RIt8mzTwoac3cy9Qp/rn7TPyzMyByUWb9UfeNzYiqKP3R1KFJaY13nkwp6mvTg==
X-Received: by 2002:a5d:4fd0:: with SMTP id h16mr11371134wrw.268.1628259018946; 
 Fri, 06 Aug 2021 07:10:18 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n186sm14430073wme.40.2021.08.06.07.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 07:10:16 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 03B3D1FF9A;
 Fri,  6 Aug 2021 15:10:16 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 3/4] gitlab-ci: Remove superfluous "dnf install" statement
Date: Fri,  6 Aug 2021 15:10:14 +0100
Message-Id: <20210806141015.2487502-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210806141015.2487502-1-alex.bennee@linaro.org>
References: <20210806141015.2487502-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

The container already features meson and ninja, so there is no need
to try to install it with dnf again.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210730143809.717079-3-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/buildtest.yml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index f390f98044..38f08452f1 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -590,8 +590,6 @@ build-libvhost-user:
   image: $CI_REGISTRY_IMAGE/qemu/fedora:latest
   needs:
     job: amd64-fedora-container
-  before_script:
-    - dnf install -y meson ninja-build
   script:
     - mkdir subprojects/libvhost-user/build
     - cd subprojects/libvhost-user/build
-- 
2.30.2



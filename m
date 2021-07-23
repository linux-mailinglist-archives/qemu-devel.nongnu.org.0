Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE3E3D3E32
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 19:08:41 +0200 (CEST)
Received: from localhost ([::1]:47458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6yfA-0000Ik-3w
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 13:08:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6ybH-0000Y0-Ns
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:04:39 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6ybF-0005c0-7S
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:04:39 -0400
Received: by mail-wr1-x42e.google.com with SMTP id q3so3164488wrx.0
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 10:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/cY65pZFEZ3lIu728W3SlqofdPjbJJ/X3y/wSDRF6pM=;
 b=f+HeETJZGit89itG5lffmbG/xG6u2HTAZaWjBO3GViHryQY+5zaBEaGzv0wKuxgARv
 COA8DWWSuSxouD1YiM3Frz43yqF8c1RysSFKN2TSm5bBqOg9NHeJ9sT2oZFLzdidh1KG
 fuTGantk6ZrUJQJrFb666YQg+kOZ0/0REYxEnHWRtcc9F58G+j+uZshsjSO6c8hFtTqt
 Cu/0uLIZ+8vos6X58KKgTWumzQRNblvh5omcvr26jNI1T5rEWIqjxwc4/XZRzLeDiMPk
 KgdaeRoKOCDOOmpJmeIrCI18a+4g/MNcJGO+RUUtv8rSKuIqN9O+UNqHOwPAOrwP1OWj
 +xeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/cY65pZFEZ3lIu728W3SlqofdPjbJJ/X3y/wSDRF6pM=;
 b=lzLQsg+rUgmm/xN1P+5Yr9lwJsH15ImUwN6SXk0Kc/KZbkIGUErbx4ITaFUrN7S0jM
 eKcI0FQyaeVUFtRk/OUsSg2tYGFjEhdB1jZ2w2y3lFLJmbtW0QsZ0b1IBncNuQuNKMFk
 879s1wO5C9LLwrPBVk1rNmXZGUwL67oAGzlomvDSCE9wFQWXuRTZZD2hOVCm2mGtmbOC
 F5lkL9ziE6k+52Vulmf0AN/uWUDnNjKMNZ3VGJ9F8Sf69zxNQfiBcxcspRunTfh8kXJz
 tIbzVBgAw2WYIX5bppcGliKwpfqjBxpgZJMkNKWBqpD3GxpiMkTd9UaDQ/yPN5rtFPl7
 ziKQ==
X-Gm-Message-State: AOAM530a7lbAf3Sp5HWztAZuf26+lNndB4OxuZSgcqwpcROqr3jRAD2T
 VoL5LJWhFbCGaL4CFodDce15qg==
X-Google-Smtp-Source: ABdhPJwWAxm/1MHitE0vMP/U+jg4U/aLHaMy5IZhhT0ZAnc0vhMsRn5GYF/keiI9tXkpH/gK4m7nMQ==
X-Received: by 2002:a5d:64c2:: with SMTP id f2mr6347509wri.374.1627059875976; 
 Fri, 23 Jul 2021 10:04:35 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d18sm26513407wmp.46.2021.07.23.10.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 10:04:30 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2ABCB1FF99;
 Fri, 23 Jul 2021 18:03:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 10/28] contrib/gitdm: add domain-map/group-map mappings for
 Samsung
Date: Fri, 23 Jul 2021 18:03:36 +0100
Message-Id: <20210723170354.18975-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723170354.18975-1-alex.bennee@linaro.org>
References: <20210723170354.18975-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Minwoo Im <minwoo.im.dev@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Minwoo's work from their personal address are treated as personal
contributions.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Klaus Jensen <k.jensen@samsung.com>
Cc: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Cc: Minwoo Im <minwoo.im.dev@gmail.com>
Message-Id: <20210720232703.10650-11-alex.bennee@linaro.org>

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index efbbb15643..beeb24341e 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -26,6 +26,7 @@ proxmox.com     Proxmox
 quicinc.com     Qualcomm Innovation Center
 redhat.com      Red Hat
 rt-rk.com       RT-RK
+samsung.com     Samsung
 siemens.com     Siemens
 sifive.com      SiFive
 suse.com        SUSE
diff --git a/contrib/gitdm/group-map-individuals b/contrib/gitdm/group-map-individuals
index 36bbb77c39..4ac2f98823 100644
--- a/contrib/gitdm/group-map-individuals
+++ b/contrib/gitdm/group-map-individuals
@@ -29,3 +29,4 @@ mrolnik@gmail.com
 huth@tuxfamily.org
 jhogan@kernel.org
 atar4qemu@gmail.com
+minwoo.im.dev@gmail.com
-- 
2.20.1



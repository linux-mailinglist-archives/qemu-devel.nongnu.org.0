Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5C2606480
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 17:28:44 +0200 (CEST)
Received: from localhost ([::1]:55412 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXTO-00054A-8g
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:28:42 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXKV-0003TA-MI
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:19:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olUDS-0000bx-09
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:00:19 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:34500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olUDO-00051A-5k
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:00:00 -0400
Received: by mail-wr1-x42a.google.com with SMTP id b4so33967229wrs.1
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uhZG6uFO7/KPb47lY7UPH3MmoXpMaIKZscxb3RV9Z/I=;
 b=NRPUxiRTWQHVWpV7iHcXJw7DNuDsvFu8fHOPlBG0ccKkz63/+3weTHMguoiYEZIG8i
 NEsISItHdVwf0ebLFi79CGC3jehMXoNQyRIvj+hVb0Ao3HdwXNIf8CoRBTjZSluer8R8
 /aIume2tMOzpJ6HBF3m8uYRaTdyu9IufqU1iQR52DTRN9YSIAUZFZfaCiYScGr9Dlk44
 VlsN8DsO2ABwjT1RuLlkVt2N1PjxiJ/o0zxKXNg7QeoVqZV+Gf5PpsrequGYrVv5VBs/
 /Y0amn+hxAlpLY3rndu2IGj5oW9FLklqSSI7uq6zAOjzEfQUNJK2zUXrcBz0SNHDW7U5
 7xVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uhZG6uFO7/KPb47lY7UPH3MmoXpMaIKZscxb3RV9Z/I=;
 b=1ckwR6CuduJUtkeyZAzN8waPg6NaxZhJfNwv/LD5QheakOmqox5YbR2bsSIzQEzRhr
 Qw7MYaPF/6P/Tm24TSX/heLoiDt0vuMApgT1dpfVzNX8tuvvBVezldkdZhotK9g06fiQ
 xlTHXt+teK5fK95b0kt7f/xfTnAZJ4HYXfugmJTu6i1dK45ENrW+bDQSUkUvcxDEhgZG
 UNFkSzVMl0wzK957wua7Up28WEIUWQmZ2ZB2R+Y+/vW08ELYxh8+HkjUTlEGUmASDREd
 3w5kehCc2pri0ZfiukukCYOC5/XWooVRdf05R6qt5ime2842SXhPo+qQdKDFTiQPfJqo
 2nEg==
X-Gm-Message-State: ACrzQf1L9hqIpX3YflespzWepW3+Q6v85VeQwE+4cqbGW42nc+B5AX91
 n+NIhCN0YxJykuX+wGFjO33ToQ==
X-Google-Smtp-Source: AMsMyM6OH+uwVGbtdrmyn5Rr8Y47w1qJ2Q85TX5xtaUHReRTbEwpSnP2d5ARx4QFptImpXqX0pYPIw==
X-Received: by 2002:a5d:558f:0:b0:22e:2fac:d550 with SMTP id
 i15-20020a5d558f000000b0022e2facd550mr8729655wrv.652.1666267196639; 
 Thu, 20 Oct 2022 04:59:56 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 i17-20020a5d6311000000b0022e035a4e93sm15920919wru.87.2022.10.20.04.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:59:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 768481FFD0;
 Thu, 20 Oct 2022 12:52:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 26/26] tests/tcg: include CONFIG_PLUGIN in config-host.mak
Date: Thu, 20 Oct 2022 12:52:09 +0100
Message-Id: <20221020115209.1761864-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115209.1761864-1-alex.bennee@linaro.org>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221013131304.623740-1-pbonzini@redhat.com>
---
 configure | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configure b/configure
index 8c2c4c1a04..4275f5419f 100755
--- a/configure
+++ b/configure
@@ -2486,6 +2486,9 @@ echo "HOST_CC=$host_cc" >> $config_host_mak
 if test -n "$gdb_bin"; then
     echo "HAVE_GDB_BIN=$gdb_bin" >> $config_host_mak
 fi
+if test "$plugins" = "yes" ; then
+    echo "CONFIG_PLUGIN=y" >> $config_host_mak
+fi
 
 tcg_tests_targets=
 for target in $target_list; do
-- 
2.34.1



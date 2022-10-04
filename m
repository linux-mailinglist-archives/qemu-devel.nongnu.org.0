Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC20A5F440F
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 15:18:51 +0200 (CEST)
Received: from localhost ([::1]:60472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofhow-0000Sk-Q3
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 09:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhYa-0008GA-HX
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:01:56 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:39802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhYW-0007PR-E2
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:01:56 -0400
Received: by mail-wr1-x430.google.com with SMTP id f11so18561930wrm.6
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=BaHnxjvMW4fTyPvIodljy6k1DRCBm9AVpyaepMnYPJs=;
 b=XdkOfEtr1cHXCVh0FqZD/w/eD5A3p7Xywrj5y4naHcMng4Q/tfolb9ves4/Eg5zMa5
 SmhOQNS/JQwG02HRnhioASzR/Oi/atTzFErLZHw385Gy3i/+TDQno0SEzqccCw6ArZb0
 bwvFumkfJuacc3N3CdDSfOj+W/1kNVx0dtkNBgsxpQJJSdd2eEeEVnhm6XcOjIkzxaBj
 saqMfjk0fg32lznzFBLumbGrkdyztVAK/11hYXFziddq8Vm0qaevJcnBQwwq9qDvrvMi
 MZ2DQ8iFg5Q1bH+zSRI3WeWpZaO88mGtNFkeOplMkAmu6Itb4BgMPRuu7nVdgKL0nNvz
 hubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=BaHnxjvMW4fTyPvIodljy6k1DRCBm9AVpyaepMnYPJs=;
 b=2pC8kMLPmB/r0W/ji2wHK8x926A9mbyr3CaoEGZoLu0OXRt/IdE/so2ofxUIhEAbZo
 hZkZRzc5qKbjMhSc5CDKeNhdC7v/Ph2/pWG/h3QMCpIX2h6bRIVo8z+JSXSbu8xru4aa
 wzDIcB6W5ileCtHisNlNKOcel5/CZ9kIushfSwYlhSfu0V1fxLs0KBuzCeiwcvxZZ3Bj
 1JxXU2QWZBG19BYAr9ksQSZSwZU6uFVDRMNkSoq99idQuomJlPG79Xph9gWsOztnQQtV
 7wDZAObHvQCAdGhfeHp95a7cKOsa/3FDBsCnH+l/U2TVCABvhUcdfH6gJPleIZXddPOH
 cu4Q==
X-Gm-Message-State: ACrzQf1i1thGRN6bnwWoudnqCvgTK30DoTshhiCg0sIa/evRauxIFQV9
 MRjKOBrguXDW6zAvoI3/UlTUvA==
X-Google-Smtp-Source: AMsMyM7umee4xHqM7kJ+E3XsX4+kCFJtT5VyBsiDp8/morzPk7t3HOqbQAns/8WMrfQhIjfU7QW1Cw==
X-Received: by 2002:a05:6000:156b:b0:22a:a83a:d349 with SMTP id
 11-20020a056000156b00b0022aa83ad349mr16481632wrz.277.1664888511012; 
 Tue, 04 Oct 2022 06:01:51 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q11-20020adf9dcb000000b0022ac672654dsm12818823wre.58.2022.10.04.06.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:01:46 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9E5E61FFC3;
 Tue,  4 Oct 2022 14:01:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [PULL 11/54] tests/qtest: bump up QOS_PATH_MAX_ELEMENT_SIZE
Date: Tue,  4 Oct 2022 14:00:55 +0100
Message-Id: <20221004130138.2299307-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
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

It seems the depth of stack we need to support can vary depending on
the order of the init constructors getting called. It seems
--enable-lto shuffles things around just enough to push you over the
limit.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1186
Acked-by: Thomas Huth <thuth@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220929114231.583801-12-alex.bennee@linaro.org>

diff --git a/tests/qtest/libqos/qgraph.h b/tests/qtest/libqos/qgraph.h
index 6e94824d09..5c0046e989 100644
--- a/tests/qtest/libqos/qgraph.h
+++ b/tests/qtest/libqos/qgraph.h
@@ -24,7 +24,7 @@
 #include "libqos-malloc.h"
 
 /* maximum path length */
-#define QOS_PATH_MAX_ELEMENT_SIZE 50
+#define QOS_PATH_MAX_ELEMENT_SIZE 64
 
 typedef struct QOSGraphObject QOSGraphObject;
 typedef struct QOSGraphNode QOSGraphNode;
-- 
2.34.1



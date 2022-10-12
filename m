Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 854AD5FC51D
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 14:16:38 +0200 (CEST)
Received: from localhost ([::1]:53956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiaf7-0002SR-3H
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 08:16:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oiaad-0006SN-GK
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 08:11:59 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oiaab-0006TP-Jg
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 08:11:58 -0400
Received: by mail-wr1-x436.google.com with SMTP id a3so26000781wrt.0
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 05:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZdaI4XzCxbrqNtaz9+Qc63wwXrtLcrr5DtfukOI3M2E=;
 b=rqjXHfQ6WaQXh+b956oOSVtHuSZ46wi2wR2gvxTVsWKOz8hWceTQb76956gPF6lN2E
 GJmDGuhbcKb+XDp+ht5sc5Dcpa/Sue8JyM/uDdtc1eia7hsMfSIYRSLV2K430y8zKoYm
 +35XtA8QT1S/r94xQUI+MqgxG/3S2dC++MSWGUpsYW8H5W8ijqeJg8BiqUrnXs1S+0pF
 ezZlCckaZlMmMU+OMeLUyslxJauj5GWCpkQxKUOEHvVvgakMsMoFbfOrYLQrmDpW4l10
 yr5KDsJ5sUi/ApFDJXf5hYdLbQ8v0bSkyv+YsqNViBOfqxO5NLmSvPGZjhbMIzB6I5hp
 y3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZdaI4XzCxbrqNtaz9+Qc63wwXrtLcrr5DtfukOI3M2E=;
 b=aYML/q90G429FrOawvbVETSIq9abqUZ00/0xLdwzluUjyHYTRrS6wWH5SKHY2mEbhB
 w6GHgK14s/7lgahzqU2WM+iGe0xAtWCj92S6jkqtulqHHozW3nv4Y0ffX5wmGwsZSAZ1
 /XsqS6MQyJuC54d69R9gHATDqejhFkeLD3YxxmjcYVGkRh0e+3qq51s3W0nn95CzO/iP
 Fgc1Hun8YRDyOh7gP5rAZkJ3j7TqE4/dqJ3pYd7cXDXAk+w0xJ1WcqwxpQOTfQNDwgT3
 VZf8jSxA2IjHCPDgk1FCNO9061ZX0pcQnSqtibmtnxYB3c7IclqYdqDjkb1QraWpyiwp
 P6tg==
X-Gm-Message-State: ACrzQf1bGI9ZSI3UnbY7XkEeLu3s1QFdWIHmUz0q0p3NV1mMiSzgEGG4
 QwWoshaPQOSg85O0XMvp6z9emg==
X-Google-Smtp-Source: AMsMyM62jCTJ0KanFPRf2XoacB6KpKBi/E1IQQq9F5xgvvhl93jWqTSi+BoA5xNuhTemLkLWyaauPw==
X-Received: by 2002:a5d:5148:0:b0:22e:53bd:31c5 with SMTP id
 u8-20020a5d5148000000b0022e53bd31c5mr17508353wrt.241.1665576716096; 
 Wed, 12 Oct 2022 05:11:56 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j37-20020a05600c1c2500b003c6b874a0dfsm2049871wms.14.2022.10.12.05.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Oct 2022 05:11:53 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B936E1FFBA;
 Wed, 12 Oct 2022 13:11:52 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, stefanha@redhat.com, peter.maydell@linaro.org,
 agraf@csgraf.de, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 2/4] docs/devel: make language a little less code centric
Date: Wed, 12 Oct 2022 13:11:50 +0100
Message-Id: <20221012121152.1179051-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221012121152.1179051-1-alex.bennee@linaro.org>
References: <20221012121152.1179051-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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

We welcome all sorts of patches.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/submitting-a-patch.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
index fec33ce148..fb1673e974 100644
--- a/docs/devel/submitting-a-patch.rst
+++ b/docs/devel/submitting-a-patch.rst
@@ -3,11 +3,11 @@
 Submitting a Patch
 ==================
 
-QEMU welcomes contributions of code (either fixing bugs or adding new
-functionality). However, we get a lot of patches, and so we have some
-guidelines about submitting patches. If you follow these, you'll help
-make our task of code review easier and your patch is likely to be
-committed faster.
+QEMU welcomes contributions to fix bugs, add functionality or improve
+the documentation. However, we get a lot of patches, and so we have
+some guidelines about submitting patches. If you follow these, you'll
+help make our task of code review easier and your patch is likely to
+be committed faster.
 
 This page seems very long, so if you are only trying to post a quick
 one-shot fix, the bare minimum we ask is that:
-- 
2.34.1



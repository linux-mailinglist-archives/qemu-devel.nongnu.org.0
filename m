Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B53B629AAB
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 14:37:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouw6h-0006Wk-Rt; Tue, 15 Nov 2022 08:36:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ouw5S-0006IK-AI
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 08:34:53 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ouw5Q-0004L1-Tu
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 08:34:50 -0500
Received: by mail-wr1-x42f.google.com with SMTP id bs21so24290697wrb.4
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 05:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sww7S1L4kgQAku0tJMD0FzqA1RW7m8mrVqehdeq+qRo=;
 b=duXxXBbL5Qh8cwi5tQgBdx+Jg5P20Wv+tAX5bwAJD98fbL+VMU4ttsel7oVDNXC03N
 pPXEH6+yD18Ge4231W/+PLGfdJQeQmqOixv2uQm05EsZeMUzzKn7fPsLauFCY/zkkg6o
 sR5sndPfuJn2TusJwMWzNxm2BXnR7Y6v9zQA4llOJYSd+dm1aD0n4TD13GV2aEB3iQIv
 Sc6/Zdy53f6PkVzMNYOooMa2yddPG47vhf3sWBUd1LKJmuXkIX5fEaNikRd3BexRzr6Q
 8jcYEkxfT2yPXttl1ECGm3miFLp1gq2gX0nexf8Wm/2XGsb5qChg3M7tt/0h0W5259vI
 ZnEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sww7S1L4kgQAku0tJMD0FzqA1RW7m8mrVqehdeq+qRo=;
 b=BObBIFHhyJzeP7g3+VLeH7ldQDMbV7SptCOVJ3a5s8hR7iJlmoBSI32j06vZKlykrN
 tILx7CecRHYyHSe5ZTq4BSjwnJ5K+hMuGH69URTuruUqqZ2SubPe/FvZdeH0UTxYlIde
 2oAz1x+vF9aJ1KSoqZSudrVgePR2Q1LQJ1zxepEHFw1J3/IabMgofUrJEzgNsL5qWbWM
 hfPgIBuZlKf0+bCKAgCK2XmVHT/zT838RBeUl3/iJ3enoyHI3TWbEUV9NrzpSYnDgtyj
 +3A60LKqvgu1AmIj7MO6AOh/LexuUngg18yKx7ao+U/sCAfde7kGzuXqt5KiSvh9ZsJj
 r8/w==
X-Gm-Message-State: ANoB5pkStRM6T41sKse3gNmmDZOZhqokfXWh6Dx5xNTke5MlSlR28Dni
 IZ/xcdwllv8JS1yBOaC7uwuC9rPNHkRjzw==
X-Google-Smtp-Source: AA0mqf5XQlzr+IHiELXCHyBn73AaCF4wSu/v1T8j4cTFJfq80+KqxXgn5sPU4HBjboBHPqxOmgAMDw==
X-Received: by 2002:a5d:6e07:0:b0:238:3d63:5736 with SMTP id
 h7-20020a5d6e07000000b002383d635736mr11077813wrz.513.1668519287147; 
 Tue, 15 Nov 2022 05:34:47 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o39-20020a05600c33a700b003b47e75b401sm20164310wmp.37.2022.11.15.05.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 05:34:43 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D65A51FFBE;
 Tue, 15 Nov 2022 13:34:39 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 06/10] docs/devel: make language a little less code centric
Date: Tue, 15 Nov 2022 13:34:35 +0000
Message-Id: <20221115133439.2348929-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221115133439.2348929-1-alex.bennee@linaro.org>
References: <20221115133439.2348929-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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

We welcome all sorts of patches.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20221111145529.4020801-7-alex.bennee@linaro.org>

diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
index fec33ce148..9c7c4331f3 100644
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
+some guidelines about submitting them. If you follow these, you'll
+help make our task of code review easier and your patch is likely to
+be committed faster.
 
 This page seems very long, so if you are only trying to post a quick
 one-shot fix, the bare minimum we ask is that:
-- 
2.34.1



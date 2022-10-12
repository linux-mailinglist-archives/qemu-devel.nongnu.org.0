Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E0D5FC533
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 14:21:32 +0200 (CEST)
Received: from localhost ([::1]:59308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiajs-0006zv-1N
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 08:21:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oiaaf-0006UP-QG
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 08:12:02 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:35334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oiaae-0006Tz-0r
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 08:12:01 -0400
Received: by mail-wr1-x42d.google.com with SMTP id u10so25958753wrq.2
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 05:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DlsvyOz6lGN+SY7b4A4nzZ2KHrnChjwcQ+AUZzWn5OY=;
 b=DpgVk8RvrdeLB3StjEXzw9opncXA1s/nVQgAXkLYWjDciqo8IlXRNiKCGAmDuMxNRP
 05UpOaaYaGxhM2z2CuQuRZOjrYmhjwrXCboAb1pjXF5B5XoUgut8rXXpUiMcnhwQ3fQy
 juKHEXXmfM7vfJcKN/Rhbi7Mh9fOn04fLbefJeiNsjppxzch7sY70r8AfASO6zDBBpdS
 lPmanWh6HIwOn2czfzs4vsJywxZtXeRTw5GSeVEEMAL0yyUYOAJIZB3p8bSoN4WTn6gv
 Vys2hIxePQTgSXAXtF0RZ20UQ5Z6W5jF4qcp4R8AzhMI2UG7w3s1UfUBGklWRYm0IQbv
 QqLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DlsvyOz6lGN+SY7b4A4nzZ2KHrnChjwcQ+AUZzWn5OY=;
 b=XJVAJCkSpDzmCm51st4zDD5f3uExAhmTud/JaV/8AOt4U1x7q56adxdCHFiMOgwgcY
 Xp706J827FdvLkxbPX/Oz5NYpKEmjT0/o2fKkTH2hL52Bz8j/8UC1qqRqibB5SrlNdZc
 l5NV3qRXi2jqJ5+4mkyTtTnU1aP0GPH8WJ30AgBn9GPfQ9YhmMQym/GOHddDK7kRSVmG
 tfK+qkbZW+EKT5X1/IkZGBAHzrJ+KxhGTwyDS7rD2x9trBgyqgPH4NUnis2V4Of6AHy3
 euyIxPi9Q0ePLWeIHaUoC5Iy7rYr9l7grApS71LE49JLgqvOEDhg/XDvzd2Uv2Tec688
 fHew==
X-Gm-Message-State: ACrzQf2odGQhtUSTihwV+1rwy01KsOHaUuCds7kxPErxlc2u67ZyhojJ
 LrC0yvgLNQRujoaksA/PQFtc5A==
X-Google-Smtp-Source: AMsMyM6fLGGR6iSpUumojm5bH/GpgoM0PeULRshVLumr+woqV+YactV5aFJm4Fi7SvrKRFPotLJghA==
X-Received: by 2002:a05:6000:68d:b0:22e:4484:cd4b with SMTP id
 bo13-20020a056000068d00b0022e4484cd4bmr17509833wrb.524.1665576718727; 
 Wed, 12 Oct 2022 05:11:58 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a05600c1d0600b003a5f3f5883dsm1796374wms.17.2022.10.12.05.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Oct 2022 05:11:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E61DA1FFBC;
 Wed, 12 Oct 2022 13:11:52 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, stefanha@redhat.com, peter.maydell@linaro.org,
 agraf@csgraf.de, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 4/4] docs/devel: try and improve the language around patch
 review
Date: Wed, 12 Oct 2022 13:11:52 +0100
Message-Id: <20221012121152.1179051-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221012121152.1179051-1-alex.bennee@linaro.org>
References: <20221012121152.1179051-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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

It is important that contributors take the review process seriously
and we collaborate in a respectful way while avoiding personal
attacks. Try and make this clear in the language.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/submitting-a-patch.rst | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
index 41771501bf..5b6dc7ddf1 100644
--- a/docs/devel/submitting-a-patch.rst
+++ b/docs/devel/submitting-a-patch.rst
@@ -434,14 +434,20 @@ developers will identify bugs, or suggest a cleaner approach, or even
 just point out code style issues or commit message typos. You'll need to
 respond to these, and then send a second version of your patches with
 the issues fixed. This takes a little time and effort on your part, but
-if you don't do it then your changes will never get into QEMU. It's also
-just polite -- it is quite disheartening for a developer to spend time
-reviewing your code and suggesting improvements, only to find that
-you're not going to do anything further and it was all wasted effort.
+if you don't do it then your changes will never get into QEMU.
+
+Remember that a maintainer is under no obligation to take your
+patches. If someone has spent the time reviewing your code and
+suggesting improvements and you simply re-post without either
+addressing the comment directly or providing additional justification
+for the change then it becomes wasted effort. You cannot demand others
+merge and then fix up your code after the fact.
 
 When replying to comments on your patches **reply to all and not just
 the sender** -- keeping discussion on the mailing list means everybody
-can follow it.
+can follow it. Remember the spirit of the :ref:`code_of_conduct` and
+keep discussions respectful and collaborative and avoid making
+personal comments.
 
 .. _pay_attention_to_review_comments:
 
-- 
2.34.1



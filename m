Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6F7620C19
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 10:24:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osKpO-0007H0-40; Tue, 08 Nov 2022 04:23:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1osKpE-0007EQ-U1
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 04:23:21 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1osKpC-0005pq-CD
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 04:23:20 -0500
Received: by mail-wr1-x436.google.com with SMTP id a14so19964651wru.5
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 01:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yLNK2qdPNMQMvzK3A+Wa0kPh913JqNLXh3QyXKK7U+k=;
 b=u2Z+YKLP0aPMdHuzajDgrxdi213GM3D/1hKyz/jCvCw/YwUnZcRGbGdCrA/QaxQV/L
 lCDYOSdZYdgIvQtq5BcwgZ+yzqmTEFC1YHxYGLR1yVNfDi7QdMpWSTAzNG7yH7mo9vBf
 +2114x2Hm1HY+aXxapYEezSSy3hOUP3fhmTSNPEpuCXlIEBUBvjkC2UMBdOnpMgbbGG2
 9C70FXtVJ5ipSUFa3MG2Fk94retDjxzbYGLYXUZc+rXbOZ4CA/rkfQO5emnq7C6ccSQx
 FhQwHLNfteubtBZ32iwVR2r7UreoQNGClrzNlVMlrGwT/WxWmgYVZIrVEc9pqWXTmUzK
 yyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yLNK2qdPNMQMvzK3A+Wa0kPh913JqNLXh3QyXKK7U+k=;
 b=NOvnYx91TKV6zvHsgiDB7HQufD6Hae+txjtEiY4tiJ5fte9yz8y72Q8OagH1tUMzI+
 JQLzsQl0GusE/BLKg673ZKgvaoHYBdYOzi0yKuQ0rR9zSop7lXW9/uo0Ou7CUhFGBVSJ
 8Lwg6LW6I0X4AzXqotavkI8yrGLZZRqOGN+Ad85gJKWKxG+VDqCjo1f2H2CVlSwiMn5c
 i9Zh9jsKtyU0dJPD5+QbtKh91M9J6pSo7ZZkt1PHKJCDRT0h3+/MnZcRU3LxHwiBDppp
 0FkQDrMcTA26M8H5ZY+EuYwQqvH7q1qGWwE9hrH4wpTlHMJw6lwM1vHiHKKDJb4x3Kbo
 V3Cw==
X-Gm-Message-State: ACrzQf0RemTPOiSeJiBci3pLyBwA3niN6oiKmEve6tV0t6AxNJbk3rQZ
 EwoEoV+NY40/SJWbK2NwUJNyqF88xaWclA==
X-Google-Smtp-Source: AMsMyM54Y+9yViienlAebcgJQoSkLcXknIkhbCT9Ig73sse5UW2/8eOu/Jb4qVkPePTou3i9aebRDA==
X-Received: by 2002:a5d:644b:0:b0:236:862b:9ef1 with SMTP id
 d11-20020a5d644b000000b00236862b9ef1mr34495500wrw.691.1667899396924; 
 Tue, 08 Nov 2022 01:23:16 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 s7-20020adfeb07000000b0022a3a887ceasm9538905wrn.49.2022.11.08.01.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 01:23:13 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1E7871FFC1;
 Tue,  8 Nov 2022 09:23:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v1 9/9] docs/devel: try and improve the language around patch
 review
Date: Tue,  8 Nov 2022 09:23:08 +0000
Message-Id: <20221108092308.1717426-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221108092308.1717426-1-alex.bennee@linaro.org>
References: <20221108092308.1717426-1-alex.bennee@linaro.org>
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

It is important that contributors take the review process seriously
and we collaborate in a respectful way while avoiding personal
attacks. Try and make this clear in the language.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20221012121152.1179051-5-alex.bennee@linaro.org>
---
 docs/devel/submitting-a-patch.rst | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
index 1f2bde0625..80e8693bb6 100644
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



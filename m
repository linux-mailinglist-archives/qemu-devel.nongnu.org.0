Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D2F629AC3
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 14:40:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouw6r-0006rX-1k; Tue, 15 Nov 2022 08:36:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ouw5Y-0006JF-0u
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 08:34:58 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ouw5W-0004LV-1L
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 08:34:55 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso13122183wme.5
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 05:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aRZ/eD6ZaUedeEXWQl7NVWa5eF5sUkL83SXNmlmtL6M=;
 b=rnEokUju9x1/kOw2T+ajwmb79WymaOYNfjgU3wpdoW1bf2srEF6jqXxE1cJ3gjduas
 55iBpdr01tqskVYjSeTk0ZuPCkq1GGlDuPqktegNe0yu8ggC//Crzzx54XPaRCbXIDdn
 julCoznnbK007JwVUzwj/UsuVYVcAWe7kY6DKBOKUekV5QAKvzQC6hODg6s5hW1V6IKi
 Z6EAB/3Xkvx3sQ3YWvdNP3/f01vN49xRfUJ/tWGbJTn1541KbFFrBNJdKmPZ9SNFrDIT
 ANf94hcdnZqIFmCrwX2+hq4WkuktrXa16cYIlm+bqSBxQyTiQMjJBwruZ4S8xtbOCWRP
 6Ejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aRZ/eD6ZaUedeEXWQl7NVWa5eF5sUkL83SXNmlmtL6M=;
 b=rRzprAJy7pRZCIZrEoVhaGefsaA9G92epitcInua2JUO5I5YMfYEt7WRQmEFmEg0TU
 PoYlods14yLXAB+a1uvG+rwwVfCAqvJIBNJb/OGxRzntEIPXeVfiFk3u5bF+xfERiAMY
 +5P9JAu3ZaJn0oS2AB9+U6R0f00J9kKfaxMxgtFCEwBJ1FgbK28XLCfr51Cwi/DGa6yB
 HCPp1t4Yskd5F7aqmni8OVB7insTvEZ0MQyAdP51Gh3BQhgpj6YxeOjxymSGEPY/9gzz
 Fteb58oIDCUPoXt+hrle0hejhNetf2MGGhMM66W4jD3a6nt1s1gEVwxrpHNaUjTCgzRe
 eEYQ==
X-Gm-Message-State: ANoB5pn9NzLJZHSGww2j+pEWZr6JnSQxgdAFzy6ESdn43m68rnTrJlAB
 hSbewF0Golfil9o4vshYQQ7gWg==
X-Google-Smtp-Source: AA0mqf5p8Uqr+hNcKGRYsL193LPI2w6TVLd46K7nR761Omo4SFxNug1Y36kGJsoh2fWz8Poc+2KUaQ==
X-Received: by 2002:a1c:f204:0:b0:3cf:6fe0:b16a with SMTP id
 s4-20020a1cf204000000b003cf6fe0b16amr514899wmc.28.1668519291557; 
 Tue, 15 Nov 2022 05:34:51 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 fc18-20020a05600c525200b003b49bd61b19sm23605563wmb.15.2022.11.15.05.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 05:34:43 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 119911FFC0;
 Tue, 15 Nov 2022 13:34:40 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 08/10] docs/devel: try and improve the language around patch
 review
Date: Tue, 15 Nov 2022 13:34:37 +0000
Message-Id: <20221115133439.2348929-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221115133439.2348929-1-alex.bennee@linaro.org>
References: <20221115133439.2348929-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Message-Id: <20221111145529.4020801-9-alex.bennee@linaro.org>

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



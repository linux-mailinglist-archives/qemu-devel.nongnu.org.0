Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 053DF63392B
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 10:56:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxQ0s-0002TC-M7; Tue, 22 Nov 2022 04:56:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oxQ0o-0002KY-O1
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:56:18 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oxQ0n-0003rJ-2T
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:56:18 -0500
Received: by mail-wm1-x335.google.com with SMTP id t1so10309656wmi.4
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 01:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zegCns/hbxeRS6uSc3QTrVi/SCCsN8HyRoAJg014Vic=;
 b=LqHpS0QlldkNdmqGdkhLS81ZRUUrSt4QadygaocVPqBpcjmjczBbdVJe/Fy3ELdL4p
 6Y3gkk1QHmJ2S6AbYKUA0zUms0bfYZQ4cWVc6bx0SR7l7f2Je2xNscC6LfhnjO1XcnhN
 0MkE+JGb6DiEcv9JBCjQ5VF/AJcOkde5INOjfMi6ct7ws4RK6vgSgZKt6OeNJ75g+ZsB
 H7uAZA+cHSNKatNrUnlxJDkJEAEFQSKMXay/GmwI8j3eoryB2oelMP3ExPuYJ7Qn555r
 YnyPaNhRFR4dZ2MHb4xUPND+mBIHg2zhp3dfjAJ+Dzoc70tR21CpEVEzRLotVSP82FDF
 /WEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zegCns/hbxeRS6uSc3QTrVi/SCCsN8HyRoAJg014Vic=;
 b=w0uyT1x6Yt2CDfCLPoAjr9c3ltSEjxFriW0VXaw7FbMTzTwCzAWRT3sZgKKMVPHAS/
 +HckfdfdzH4OGJBQn5Adc6GrPtlfQr4hSr8qDRL3uVXP0DbzWFi8VjEefWDnWIg4iTAk
 j4mNJA8eRIKe0gUP1vYyTyZCx3pv6/306exEXZw3BRlnr2rtC23pcxrqpsgeShU4YoJ9
 sGu1XnNhW9NaodPGjVFjnrJcmT+a4sk3p67SumS2v6U/eZvtD3EZtOO+wEuhPVLNPBOW
 YpkP5MXomscDwKiABjUymSVtD9XjqeooCzlfLRPWs7cXJroat+c+VQ85aRXYFHgglsh4
 4osQ==
X-Gm-Message-State: ANoB5pmgVcgm7abRtAHUCGyBqea2f9sMarbRW6Qvs1VBGZOswu1TZntc
 nJ287e2xnIvpgYK8pQxIFhT0hg==
X-Google-Smtp-Source: AA0mqf4mIfmfUVkNyFLzD58a8H5VM39KUMscSl/SPPp9XquEA4CxXJWdWA+PbDAk9kLm2FR74qgbng==
X-Received: by 2002:a05:600c:298:b0:3d0:2707:ad98 with SMTP id
 24-20020a05600c029800b003d02707ad98mr1990478wmk.171.1669110975376; 
 Tue, 22 Nov 2022 01:56:15 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a5d5949000000b0022e344a63c7sm13493940wri.92.2022.11.22.01.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 01:56:13 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3C51B1FFBF;
 Tue, 22 Nov 2022 09:56:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 07/11] docs/devel: try and improve the language around patch
 review
Date: Tue, 22 Nov 2022 09:56:06 +0000
Message-Id: <20221122095610.3343175-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221122095610.3343175-1-alex.bennee@linaro.org>
References: <20221122095610.3343175-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221117172532.538149-8-alex.bennee@linaro.org>

diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
index b2a162ff4c..c641d948f1 100644
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



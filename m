Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7A1625D9E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 15:57:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otVRc-00075C-7e; Fri, 11 Nov 2022 09:55:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otVRW-00072t-DN
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 09:55:42 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otVRT-0007xV-Hx
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 09:55:42 -0500
Received: by mail-wm1-x32b.google.com with SMTP id t4so3072008wmj.5
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 06:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yLNK2qdPNMQMvzK3A+Wa0kPh913JqNLXh3QyXKK7U+k=;
 b=BoeQrQnI2ZGynBzAvlcqSMhgTLDrnrzj5VQILDx2IiaEyT0k5ab4id+mD6gswK1tlg
 RjVH2YqCPaMmyykL1JEhreuc56uXeYnBBE4360FNR+HeZHEfwGmn6q8tzGi18Ynj15JO
 qhnJqnkU+P08rGX122no8HIBYBdWfAUk0Rzp96dbcmN9kb0H1cf2WLSFMCUTYsGg992Y
 Rp1SNWIhCWil30LpnAZsl3xIbJmjO74i8kUZupjUOFqMcimURqR+IW1KesYJD59yFqoM
 yJNV4jNncqzBIAtCB5Mdgr3KXUNzz2DPXc/KpVQhdyLYolq/1va1+1ulju18al8eAJxq
 6ioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yLNK2qdPNMQMvzK3A+Wa0kPh913JqNLXh3QyXKK7U+k=;
 b=ShDmYgi6zINtqc7XaVfG1ofk/KHctqDk4Yy2z1CqEMuKj0pN2/7Uxb2/Pq/J71riFG
 JvEFD81nMyF2ITx0Y9f+iSfrMlmqgxZR3+InqgTWlt7ogELND8ZEii7BCJd5Ucn40R5z
 Uyubv9Q5IcazzoArOicrFAXjL2rkhA3BPt6Bq1+dwNN+HrRnAgVuFnT5Ste0Y/KKxOkK
 COytcJJK4Ks81EUrQ3MUj7I6sYAsxWKEb66ICPQkwQpUXrqimunRdpa3OvW6t55irbYB
 eTVSKV+YRHMESbHAW3qxjMoS2FHx8upcsPsUyr3qsiCbA8WZ2a4aw0Owr3u2E3tkRFsW
 18Mw==
X-Gm-Message-State: ANoB5pnhqoLsHZMhoW7ryU99WbT21256KKiQkZCkb84RRQeMcg35Ofjn
 t+pFReLX2RFmwGa5ZkVbOAIxCQ==
X-Google-Smtp-Source: AA0mqf6Fteo0elof9NunwwuvA9CV1HGVGikFFNnjrEKtiFFDoE2XWaZpeSVF8OvsGzcK8vwnOHW80A==
X-Received: by 2002:a7b:c4d3:0:b0:3cf:88e7:f808 with SMTP id
 g19-20020a7bc4d3000000b003cf88e7f808mr1492201wmk.200.1668178537813; 
 Fri, 11 Nov 2022 06:55:37 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a05600c3b8200b003b476cabf1csm3672104wms.26.2022.11.11.06.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 06:55:32 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BD5D71FFC0;
 Fri, 11 Nov 2022 14:55:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v2 08/12] docs/devel: try and improve the language around
 patch review
Date: Fri, 11 Nov 2022 14:55:25 +0000
Message-Id: <20221111145529.4020801-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111145529.4020801-1-alex.bennee@linaro.org>
References: <20221111145529.4020801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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



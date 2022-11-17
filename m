Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2329D62E30A
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 18:29:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovieE-0006Pe-KK; Thu, 17 Nov 2022 12:25:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ovie2-0006KW-Bs
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 12:25:48 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ovidw-0006EO-GI
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 12:25:43 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 ja4-20020a05600c556400b003cf6e77f89cso5026175wmb.0
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 09:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a1Pj8Pcso9OCC5jDWRBbmf7M1aOUY8qcP9iBCC6JI9I=;
 b=BIXXAqCRgV8XLbwgfKsl5T7yi/UBZBzUZ/EyDas9cEVyUzgSjKEf1jq8fnETxjjwlu
 nzLIQmUfep6Ok2/NvcbQKNd6Q96B4hr98o+H+qJ8e1SDeZsLVm6ERzkcXpIe7lqsIlcW
 BqRoIwTkxo1EiBfYpmjhE/mMLYV+hxbs+4LbHwp1rr8df6PVnkZvG/C2yBfXq9CYNcwa
 r5iPl/cGIPQc5feDGMOctp/eCizw5uOykmS8U8JXXHeMfheM1NQdMvQ3xPZRoS1u+oBH
 lpe4CEn02TVw3ecfy/29ZdcXhoISO8fLzcT61bJ6bNVBt64EtbH0CThjuFaeICJx7WTM
 yqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a1Pj8Pcso9OCC5jDWRBbmf7M1aOUY8qcP9iBCC6JI9I=;
 b=jcznV/sWfukc+tsT47UPQy+9DfLcptT0Q7so1qNMPxnDm3vgKN3CSlK9m55xZJJZQW
 CYJvoGF+MeREVucNI0QrhKchwdBqdDYlSsWvbCNdSY0vxMFGH6wB/k+3evcDFdhY+vaN
 Ca0wwxhvcby5J1EnBJL6zG9JeaLdYZnn7gyEzn7QDGvlMpDP/UPK3u6GzVcxFxyY+T8j
 w3jYV4gvgW9O1W84O6sIE/+TaJ/RdDVJYnAXI4sKIrzIfz6r1x5z+0APnDzW6Lozhp2o
 J43gSDz8KSGaEiIopLxz2emdKJ6lpnkxq7s9HG04sDSER5bm7d5QkGyLzZJ2Gn0/2LKk
 BTRw==
X-Gm-Message-State: ANoB5pmoJaSJZ0b/FwGVpjfDEW8EQ5WmssBOunwbUND2b93cXQ7btyqG
 2msNox1PuWkTDH/CFTGzAfcRFg==
X-Google-Smtp-Source: AA0mqf56+aODP8jDjDjOWvExZJAkrK64R3TjrQX/+W1HpVJ46V2xqbqVIG98QMdJSoPb+ddliyG6ow==
X-Received: by 2002:a05:600c:3b1e:b0:3c6:c182:b125 with SMTP id
 m30-20020a05600c3b1e00b003c6c182b125mr2433826wms.145.1668705938326; 
 Thu, 17 Nov 2022 09:25:38 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 e16-20020adffd10000000b00241b933f8cesm1473859wrr.74.2022.11.17.09.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 09:25:35 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 857EF1FFBF;
 Thu, 17 Nov 2022 17:25:33 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v3 07/13] docs/devel: try and improve the language around
 patch review
Date: Thu, 17 Nov 2022 17:25:26 +0000
Message-Id: <20221117172532.538149-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221117172532.538149-1-alex.bennee@linaro.org>
References: <20221117172532.538149-1-alex.bennee@linaro.org>
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



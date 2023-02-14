Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05240696BB7
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 18:32:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRzA7-0000Dm-2v; Tue, 14 Feb 2023 12:32:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pRz9k-0000Ca-Ne
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 12:31:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pRz9e-0000jb-Fe
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 12:31:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676395901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Zsw8I1ux3Lf33Qez1PObiTdnO+8RuD8pXXDqjj68YZA=;
 b=AWesHxi0UTOjow8uh+6fTgDJyoRk27KKeSC3Oip/2AOyk+0mNivSUxIcSQRC/4xCY5lP7w
 eLZIoTZnYJvv12ah3CNZK58vfgwtTlSDu46hJOCMAPMuNIUjO7uhjVNeVY34RK3DVtDCBw
 o9/3BOnA4lBfBx5U36fRpAmwdCZdIMU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-118-7lUKkXynPsKW94ZsLcun9Q-1; Tue, 14 Feb 2023 12:31:39 -0500
X-MC-Unique: 7lUKkXynPsKW94ZsLcun9Q-1
Received: by mail-ej1-f70.google.com with SMTP id
 lf9-20020a170907174900b0087861282038so10319366ejc.6
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 09:31:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Zsw8I1ux3Lf33Qez1PObiTdnO+8RuD8pXXDqjj68YZA=;
 b=aBCwXoal/ftQzTRKw3JpQTkyYI3ua2Y/mgXLAcyrSOYtG7yt//+CVZfJhM6m67mkB5
 Aw5X8V94eF8iTLUl8IVg6zEdXgZ2TbuhJ4XTwuGH6joxB3A5PAV57l8V6rXs9bAiYJ7d
 Sbr45FwyNlpCsTUMop40jZerUGsjvrJ7Sitdnf4XsjEn3V+zRcNd8d4fiuY8vcBvsmt0
 6gCN6HB1yIgNDMem96hRju/ZHjDvsUQEEyl45kRvfrhvnOTgMlpQgI3xZ3DjSWX+rEd1
 0BRbj2gB7+/ORvIM1aFt5FaWnYVkNx7dt0tFh84TAvE9Wpmfg33/t0dN9MMt5YCOQcvP
 ujZw==
X-Gm-Message-State: AO0yUKWgku7TzkONCBFi8xw620gjPRk4MY249IvXNdV8hLapaG4CQh9D
 5+Oc61EH83gt+FakPidN9yGVYQuUWkyaz6wfeUA3DnaO97G2hyQMfFB1w3KetTGN8epZUsG7I8f
 kNUAuXZPyGm3Obk8kuIwZHgnOID/iYmZbmzJ5+YMie3V5bvbLZSn8x9fghIP+DDsrkgydeaR8
X-Received: by 2002:a17:907:7245:b0:8a5:8620:575 with SMTP id
 ds5-20020a170907724500b008a586200575mr4933761ejc.3.1676395898486; 
 Tue, 14 Feb 2023 09:31:38 -0800 (PST)
X-Google-Smtp-Source: AK7set+Vr1hb0F38eTMsgd+v+OFoBK/WFn9oeFnPaoUoFacVdhYw9JKq/gTfNwUZ+HZE6QK4QxL0qQ==
X-Received: by 2002:a17:907:7245:b0:8a5:8620:575 with SMTP id
 ds5-20020a170907724500b008a586200575mr4933722ejc.3.1676395898024; 
 Tue, 14 Feb 2023 09:31:38 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a1709064e0f00b008af424d4d75sm8091097eju.194.2023.02.14.09.31.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 09:31:37 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu-web PATCH] fix dead link to template
Date: Tue, 14 Feb 2023 18:31:35 +0100
Message-Id: <20230214173135.72551-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

The link to the Linear theme that provided the basis for the QEMU web site
is dead.  Replace it with something that at least works.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 LICENSE.md | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/LICENSE.md b/LICENSE.md
index 218e3c7..330ac2a 100644
--- a/LICENSE.md
+++ b/LICENSE.md
@@ -11,8 +11,8 @@ a choice of two licenses:
 
 ## Site design
 
-The design is derived from the [Linear](https://templated.co/linear)
-template from [TEMPLATED](http://templated.co). It is made available
-under:
+The design is derived from the
+[Linear](https://jekyll-demos.github.io/Linear-Jekyll-Theme/) template
+by TEMPLATED. It is made available under:
 
  * [Creative Commons Attribution 3.0 Unported](/license-cc-by-3.0)
-- 
2.39.1



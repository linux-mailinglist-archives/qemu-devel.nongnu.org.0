Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FAC373BF2
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 15:04:32 +0200 (CEST)
Received: from localhost ([::1]:39668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leHCZ-0006OG-Pd
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 09:04:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leH6k-00015v-Bc
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:58:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leH6Y-0003qk-Cn
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:58:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620219496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=De1zNt8H2UUyBTh6D8k0brVA+tYPsHcMOj4zokKdIAU=;
 b=fc9JPwRE7EIDoTaAYGDYbFCJhBZiBV1gvk7GqFsvhEY/kvnyH1mPhZMj+ZFn6tvmc+vYIm
 kJZ4zNi2bt7+WjyrmELV0Q16aQUDClYA/RdJGPux4uZ2Inzu0jS/mdRSPFyZWvqn10zci1
 KyUbfpg0CcfSh4yOMsMdxdEy4joMbGI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-AUA8UQreOHyZLQfiK8-fHA-1; Wed, 05 May 2021 08:58:14 -0400
X-MC-Unique: AUA8UQreOHyZLQfiK8-fHA-1
Received: by mail-wm1-f71.google.com with SMTP id
 l185-20020a1c25c20000b029014b0624775eso1576214wml.6
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 05:58:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=De1zNt8H2UUyBTh6D8k0brVA+tYPsHcMOj4zokKdIAU=;
 b=q/3/kF2G6/LXyjiE7jFX+olRJQ1gm1KQMYVwz8NNSZfwY46+s5aOmgygh9xtYHKjfi
 HWqtUDGWlilOa91uT75QlpbbdzyejvkQ9HPUNolsxg3wnT1ks5DiWZfpZ1I1whkEnpek
 Z2tveDYB0PwfraKLtAW9e/bAAgp+ZgCpV2VDuY60BLDfx6H9gHH6b2qHd36dfze7ux1m
 tzMscYLD5FoKPWxaVLfPmUZ7PF8zNxnbhVNFEoP8wMyAKJtG4atU00vzSFXXZdorSTvh
 AiVlNXUqXF2uVrNtzJ//b9uKuGitTayqDllVgIlUfSiFvEzZMxqEY+8oY53070I31J5N
 JaIA==
X-Gm-Message-State: AOAM531cn9nNtdkuyqo7ZPD176aIVPzIhKHbt9BHlu+fZhUUq/Z+Cr1O
 tBkgOgZ+lyRgy6AnHrCxi3MFWA0NH+kbEirEDl6GGTOhz2mBUIkH+FGa8W1FqBGb9HhyHNtUl1M
 pOWBBKbxvMPhg/NtJLJufaPMVWWDcG49ODY1YTHlYPwyTvgET6+IkxzD7JMKGc5Dv
X-Received: by 2002:a1c:7315:: with SMTP id d21mr33489812wmb.155.1620219493224; 
 Wed, 05 May 2021 05:58:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEZlWX4x/bJogMeFb0uPmSbBBi2YOvtb81vSYBU+2RaGY9OakUDotcJDquRckQTNvbUCp0WA==
X-Received: by 2002:a1c:7315:: with SMTP id d21mr33489792wmb.155.1620219493076; 
 Wed, 05 May 2021 05:58:13 -0700 (PDT)
Received: from x1w.redhat.com
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id a2sm16493076wrn.13.2021.05.05.05.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 05:58:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 01/12] MAINTAINERS: Add qtest/arm-cpu-features.c to ARM TCG
 CPUs section
Date: Wed,  5 May 2021 14:57:55 +0200
Message-Id: <20210505125806.1263441-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210505125806.1263441-1-philmd@redhat.com>
References: <20210505125806.1263441-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want the ARM maintainers and the qemu-arm@ list to be
notified when this file is modified. Add an entry to the
'ARM TCG CPUs' section in the MAINTAINERS file.

Acked-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8e4e3298104..61b58a4b7aa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -156,6 +156,7 @@ S: Maintained
 F: target/arm/
 F: tests/tcg/arm/
 F: tests/tcg/aarch64/
+F: tests/qtest/arm-cpu-features.c
 F: hw/arm/
 F: hw/cpu/a*mpcore.c
 F: include/hw/cpu/a*mpcore.h
-- 
2.26.3



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 931AD3000F8
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 12:01:32 +0100 (CET)
Received: from localhost ([::1]:34142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2uC3-00007k-K5
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 06:01:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2u9e-0007J7-1o
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 05:59:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2u9c-0003oI-7R
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 05:59:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611313138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H+Pq8Z9GG4F4ZYMbIAnDME9sYtYMxfqDFI3WzJbMa8g=;
 b=NktoAVG75NPssVUjBuWFN+CHhrLdpBVa1f8nX7z46PG5rMqC+LKWy/P7cMdBvYfRJ+7T+w
 Y+yjzvHf3R3w1iwWnqoU9k9u1NNFDdWt99yDUaj5T24bsNJ9Mf/Ie7ge9SW6UhCweeUkDP
 NYU30dFSBHmgCvJwVfF3E+zyjs/nD4o=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-S6HGfCtiNe63xIJM1Bd9hg-1; Fri, 22 Jan 2021 05:58:56 -0500
X-MC-Unique: S6HGfCtiNe63xIJM1Bd9hg-1
Received: by mail-ed1-f72.google.com with SMTP id w4so2731545edu.0
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 02:58:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H+Pq8Z9GG4F4ZYMbIAnDME9sYtYMxfqDFI3WzJbMa8g=;
 b=lu2+amMe2ewWKod2/0Vs6MmOr6r0ZyQ7cxwSc4D+qLs5VAiIceZsXrz2YLNmW717NY
 w4LI/oXvmgYy2hEhh6EpQNj0VcEgnwhri3HTwwiKCTYqYIiHWbO25eED5wgxhEE51A1X
 3JHWmmybY/kizkhrWhoiVUCyo/nVcQlPE3UwLikTHLThQ4mXjB0Qno235oxr3DF+TKJ+
 j5Xa2JBEjNWpt4lMmzaCWKFTNkx87WkQ+4+aGkrGb+Pe9ZHhzdbORVsImeZpY9kLOapT
 RpDiiZr9jL1M3XET+jlHlmcIhQ2P0BcmLY1P5Tu9TfGcBdYzOuBq3yLtE6fVF/0rpYXc
 7Oaw==
X-Gm-Message-State: AOAM530402krL683bO8LYbtuTV3Hq07ppCqtY6n3ccDKOGwp3ss5o1RU
 wBns3b0XDKyEzttlIa84OU7vbVAAuyEl8EEaJowQQIyobFSOSblBN9i6fKooN9leY0u+8b+5gS5
 fE9x9oiss9/ns7ow7hfbTaQrgiAGODehHuUbtMUI9ZByK1CtVmL/99F/iczxG6SgO
X-Received: by 2002:a17:907:1701:: with SMTP id
 le1mr2680585ejc.68.1611313135338; 
 Fri, 22 Jan 2021 02:58:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxePCKVC0sCfO/tfOGopndsXH5PiT03ujGBvbb9AiW9wAcN4hsQ6U+c1yN7JD4Yd58cezhZUQ==
X-Received: by 2002:a17:907:1701:: with SMTP id
 le1mr2680570ejc.68.1611313135134; 
 Fri, 22 Jan 2021 02:58:55 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id d8sm5169602edm.75.2021.01.22.02.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 02:58:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] configure: Improve TCI feature description
Date: Fri, 22 Jan 2021 11:58:35 +0100
Message-Id: <20210122105836.1878506-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210122105836.1878506-1-philmd@redhat.com>
References: <20210122105836.1878506-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Users might want to enable all features, without realizing some
features have negative effect. Mention the TCI feature is slow
and experimental, hoping it will be selected knowingly.

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 9f016b06b54..71bdc523aa0 100755
--- a/configure
+++ b/configure
@@ -1753,7 +1753,7 @@ Advanced options (experts only):
   --with-trace-file=NAME   Full PATH,NAME of file to store traces
                            Default:trace-<pid>
   --disable-slirp          disable SLIRP userspace network connectivity
-  --enable-tcg-interpreter enable TCG with bytecode interpreter (TCI)
+  --enable-tcg-interpreter enable TCG with bytecode interpreter (experimental and slow)
   --enable-malloc-trim     enable libc malloc_trim() for memory optimization
   --oss-lib                path to OSS library
   --cpu=CPU                Build for host CPU [$cpu]
-- 
2.26.2



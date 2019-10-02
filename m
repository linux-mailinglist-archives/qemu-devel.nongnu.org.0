Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7E6C8F78
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Oct 2019 19:10:53 +0200 (CEST)
Received: from localhost ([::1]:57846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFi9M-0000Y6-Ex
	for lists+qemu-devel@lfdr.de; Wed, 02 Oct 2019 13:10:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35573)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iFhrb-0005nd-Lk
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 12:52:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iFhrZ-0003hQ-I9
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 12:52:31 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:33858)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1iFhrZ-0003g7-CJ
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 12:52:29 -0400
Received: by mail-wm1-x343.google.com with SMTP id y135so5359332wmc.1
 for <qemu-devel@nongnu.org>; Wed, 02 Oct 2019 09:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SMJwE8Po6gqDcIMCVlLUJtYONx0fpzl7bDQkyAr27WI=;
 b=blNBNqFf318bJBWyTHWJA2SzafzWoZleULzgxSfZ88Ds+FlN8L+E44q7eow97uxLzr
 XNHra2sSJlN1HeiCVXql5UEyhXbGvqFFFOrNhlpgatc3w/OOlD+Bc/iJOeiZ+iyATMeS
 4AZk5NQN2MOlweWpeQEnK87AJJnxqjAj5mHyF/5YWYYlzjPbblRo5Ajx87vy+uz83hg6
 475KljAlLAp2WM/iJy9r9kU1KMDw+dkL9sCDAZHpR8JFVGj84qfUFSFDW/BI94RVGY35
 beFjL+CzRoTWNbtDXHPUth1TjxK5Ro+WufDoxPqy9hou2S8ZmRzAO3B2jn6qSDQxAZAY
 HJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SMJwE8Po6gqDcIMCVlLUJtYONx0fpzl7bDQkyAr27WI=;
 b=aJoUUFTIw98u/FVXp3N4qOGhkT5mNONQAGHiMeVNhKk05Z1HjAbCqxOpkiMF1ZL3MH
 RqX97edD+QK406mSXnNfRotDU2RCbXovot20lRGqrdQ6DWSHlY+a7ZVUbXt6BOpClgut
 jmFE/rvS25XPQPFrFzQkr9tOYIh4oSPGeVp5hqimzTJs4yeBw27ODuPe9PnyNgll6gCr
 l3vDHTvrERI6GqMk/NlA5mMRGLFz1PngocxX4dmmlxq0x+9+BQ8fAlZ36dAcKkFWKeR/
 LbZL9PzlbxQlP5XLg6iqdLLOrsQWQNoRAmwzXWjo/FkjVaw7X90W72Exq746lop+jM4+
 ZUXQ==
X-Gm-Message-State: APjAAAVQk9iSbURxqq3WziDUw+xpBRbHfLGxSixTyTids6xjRzvjNgzB
 RO0Ziqddfel1Hn/i3F7AcW+Uw5LI
X-Google-Smtp-Source: APXvYqyVti6vP2kaz+LWY7933E/mmK8a89v1hV4ivrNDUh7DFBdld0eC992dsHJPVqAQlBuhsF5ALw==
X-Received: by 2002:a1c:2d44:: with SMTP id t65mr3647412wmt.12.1570035148081; 
 Wed, 02 Oct 2019 09:52:28 -0700 (PDT)
Received: from 640k.localdomain ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id g4sm27303990wrw.9.2019.10.02.09.52.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 02 Oct 2019 09:52:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 30/30] accel/kvm: ensure ret always set
Date: Wed,  2 Oct 2019 18:51:53 +0200
Message-Id: <1570035113-56848-31-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1570035113-56848-1-git-send-email-pbonzini@redhat.com>
References: <1570035113-56848-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

Some of the cross compilers rightly complain there are cases where ret
may not be set. 0 seems to be the reasonable default unless particular
slot explicitly returns -1.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index aabe097..d2d96d7 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -712,11 +712,11 @@ static int kvm_physical_log_clear(KVMMemoryListener *kml,
     KVMState *s = kvm_state;
     uint64_t start, size, offset, count;
     KVMSlot *mem;
-    int ret, i;
+    int ret = 0, i;
 
     if (!s->manual_dirty_log_protect) {
         /* No need to do explicit clear */
-        return 0;
+        return ret;
     }
 
     start = section->offset_within_address_space;
@@ -724,7 +724,7 @@ static int kvm_physical_log_clear(KVMMemoryListener *kml,
 
     if (!size) {
         /* Nothing more we can do... */
-        return 0;
+        return ret;
     }
 
     kvm_slots_lock(kml);
-- 
1.8.3.1



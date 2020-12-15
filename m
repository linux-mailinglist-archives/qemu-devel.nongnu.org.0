Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF33A2DAE58
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 14:56:18 +0100 (CET)
Received: from localhost ([::1]:45336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpAoL-00089j-RG
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 08:56:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kpAh1-0008QN-47
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 08:48:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kpAgz-0007Il-Ga
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 08:48:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608040120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OGkz30TH9slFy1KJ3peEryg0Ol9LvAKDwVMRM/P3o0k=;
 b=MCCbDs978xVtX1BQ1JuFiB4CcXkP6XhPFU3FgrUTX7ztBihVsmTkeu2sOjVbAj2ACML6k1
 IK9WhOhLyxqtFGzT5kLrJiY4sbKjL7p6RxO7SrpHYZ/1mB4F0fEjzIte7JrazEmzIf+jR3
 rjXNqXJpmbapqYNNGGzODQl9qI104sc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-5Jf_s5oqMvqZwzHwoMViQA-1; Tue, 15 Dec 2020 08:48:36 -0500
X-MC-Unique: 5Jf_s5oqMvqZwzHwoMViQA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 904ED107ACE4;
 Tue, 15 Dec 2020 13:48:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B425B19C44;
 Tue, 15 Dec 2020 13:48:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B908B9D9C; Tue, 15 Dec 2020 14:48:26 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/7] audio: Simplify audio_bug() removing old code
Date: Tue, 15 Dec 2020 14:48:25 +0100
Message-Id: <20201215134826.5504-7-kraxel@redhat.com>
In-Reply-To: <20201215134826.5504-1-kraxel@redhat.com>
References: <20201215134826.5504-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Gerd Hoffmann <gerd@kraxel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

This code (introduced in commit 1d14ffa97ea, Oct 2005)
is likely unused since years. Time to remove it.  If
the condition is true, simply call abort().

Suggested-by: Gerd Hoffmann <gerd@kraxel.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-id: 20201210223506.263709-1-philmd@redhat.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/audio.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index a21340927033..0fdb808d6a57 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -104,9 +104,6 @@ const struct mixeng_volume nominal_volume = {
 
 static bool legacy_config = true;
 
-#ifdef AUDIO_IS_FLAWLESS_AND_NO_CHECKS_ARE_REQURIED
-#error No its not
-#else
 int audio_bug (const char *funcname, int cond)
 {
     if (cond) {
@@ -119,25 +116,11 @@ int audio_bug (const char *funcname, int cond)
             AUD_log (NULL, "I am sorry\n");
         }
         AUD_log (NULL, "Context:\n");
-
-#if defined AUDIO_BREAKPOINT_ON_BUG
-#  if defined HOST_I386
-#    if defined __GNUC__
-        __asm__ ("int3");
-#    elif defined _MSC_VER
-        _asm _emit 0xcc;
-#    else
-        abort ();
-#    endif
-#  else
-        abort ();
-#  endif
-#endif
+        abort();
     }
 
     return cond;
 }
-#endif
 
 static inline int audio_bits_to_index (int bits)
 {
-- 
2.27.0



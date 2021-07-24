Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D28B73D4679
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Jul 2021 10:57:40 +0200 (CEST)
Received: from localhost ([::1]:40126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7DTX-0005o1-Cr
	for lists+qemu-devel@lfdr.de; Sat, 24 Jul 2021 04:57:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m7DQw-00031g-SV
 for qemu-devel@nongnu.org; Sat, 24 Jul 2021 04:54:58 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:42574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m7DQv-0002sI-Bz
 for qemu-devel@nongnu.org; Sat, 24 Jul 2021 04:54:58 -0400
Received: by mail-ed1-x52a.google.com with SMTP id df26so4661849edb.9
 for <qemu-devel@nongnu.org>; Sat, 24 Jul 2021 01:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ADci9kmFOfUAUYnapr+htMkPLZRgVlK8/wLF0z9khFs=;
 b=k1tnfhi7wP9zk+m0nGPHgJY6+M2RhyKl4onJsFgSkaNhUJEFlS8rPtd/9mErfBrzc2
 J/2LLiXXNtpZoOVEyjr0HVGsbBxCONh5Pl4fELFCflD6U/SrkBUupJeZgreUV6LCIamP
 cJxKU3MBwy3CjacHXm6GpiuRYxQO0ILyxSM50Qvwc+AIuIaLIUrdqNgUR+REhtTpmzED
 T0ApV2cnrmYUUkIqIYJIz5ow+voYn2sFzn04Y+1PCq0yNIwjmnZKXVXp754uqZFZBYa8
 DiFeXCzKIue5/8L5V0RM+JehZ6GmfjjxYa3gSb7vy6NdLoos+A07dmxAK/g/qHhN7CFx
 ie+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ADci9kmFOfUAUYnapr+htMkPLZRgVlK8/wLF0z9khFs=;
 b=G3Gd2ws622JrqhEkrqIB4Uy+abflSPwE+LMqiz5c+uA6j8pzoiM76tgI8MZW1kl/fy
 k/+UK6Gs/lNMH+0zDBitjwnK38E0WNEBBEfIhedAJetJ27p1/CI38SUpkzJv7ydQhBmD
 dhxOAhX6rmq9fsta+fWlYjS+0PVDVlHLp6CdR93TaDEJUBqzNQyE71dWulrD2voIZcrP
 azdq3dtgiF1va9r19u+zc6IVHIZYcaa+LzUyK0bwQXIK44KQmBaS61wloaEf38ZJ9jkd
 JYEQ4a3tIRWs01cZQElAtywDB5wYcc8w21dDEBKiJsVKILTfycS0a/CTbQNXs6gBRG/b
 XC6A==
X-Gm-Message-State: AOAM531X/9ONE5hmmIT6UdijUQ3MRxo3b1sX4Sy1m0S6nXFqXLd4D1x+
 u/i/GCPizx/lKo/hsDaf7zDAahLhwUSlwQ==
X-Google-Smtp-Source: ABdhPJwTIuemk/6qNM3FF694vJN5rJHY9/1CuJjGkM4em76L9ImrmN7nBoxHAAnaY3n1mB5rnjqr4A==
X-Received: by 2002:aa7:cd9a:: with SMTP id x26mr7044629edv.26.1627116896161; 
 Sat, 24 Jul 2021 01:54:56 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id j21sm15723881edq.76.2021.07.24.01.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 01:54:55 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/9] meson: fix dependencies for modinfo #2
Date: Sat, 24 Jul 2021 10:54:45 +0200
Message-Id: <20210724085453.16791-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210724085453.16791-1-pbonzini@redhat.com>
References: <20210724085453.16791-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

modinfo runs the preprocessor and therefore needs all generated input files
to be there.  The "depends" clause does not work in Meson 0.55.3, so for
now use "input".

Part #2: Update the rule for target-specific modules too.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20210723120156.1183920-1-kraxel@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index df5094e563..f2e148eaf9 100644
--- a/meson.build
+++ b/meson.build
@@ -2373,9 +2373,9 @@ foreach d, list : target_modules
             # FIXME: Should use sl.extract_all_objects(recursive: true) too.
             modinfo_files += custom_target(module_name + '.modinfo',
                                            output: module_name + '.modinfo',
-                                           input: target_module_ss.sources(),
+                                           input: target_module_ss.sources() + genh,
                                            capture: true,
-                                           command: [modinfo_collect, '--target', target, '@INPUT@'])
+                                           command: [modinfo_collect, '--target', target, target_module_ss.sources()])
           endif
         endif
       endforeach
-- 
2.31.1




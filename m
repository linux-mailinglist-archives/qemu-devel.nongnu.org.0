Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 033FC2F373A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:36:11 +0100 (CET)
Received: from localhost ([::1]:39964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzNaU-0001Uj-1q
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:36:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzNG6-0003bX-AE
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:15:06 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:43286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzNG2-0004se-4M
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:15:04 -0500
Received: by mail-ej1-x629.google.com with SMTP id jx16so4551560ejb.10
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 09:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yWr91yo72rto7Dn2uyOSF5tkbrOpQMoyc3mdj2af5Ig=;
 b=FoBTKFCJwSo1yndhD3JJHqih8G8Js0uKDd9uWQtEQcIBlYkQGwtZoAfbmLgSahE2DP
 3I2W9DiFxPKG7LDxMRSCPjrHbL06DNnZL2VoPvN0fbxM7AMqYqDhXhmzRz3CWzxulwko
 wMtGz815UB4/Zcbpbzoj4O8fSMTv0jrzPHPSR/ByL2jx0X3mrKn1UdPTj6ROZRk2B6Lq
 DckYLk3dl63Kngaiul72LmzXSN/nKUuUZ+h5x68rDtlrii7oIf+bb/v5OIcBy66QS5KP
 AU9QfrfbP+RA7mazv9r1BkRihKeNRCAPXsJsYLRzkhd9tRRyS3kD4vbe4UHx6FRFaj7l
 vdgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yWr91yo72rto7Dn2uyOSF5tkbrOpQMoyc3mdj2af5Ig=;
 b=FS42UklZAY1LQiOOwfNULchEZ1aCXjXWmjXLtc8z84zGeP+SymWatQQzY1Wps1rDLu
 VydcEbFTIvFu880qbRAIKXv1bsP7vOEy5g/NJCroxAmpmweFXxvyVQ2q0bZw/D0Mc1gJ
 bUIbRelHOJlFU4HfSOE35kABwzNwgRRf3ACMp6k2fFgfLKOIbbcZ3LZD1fljtQBQM+GT
 +3GMQIRvsTQBMOz6gvuzdiJsUHeRaRfZVFcwVJt217DHZG6U/LXzrWs1TB+O9282bpHM
 DraE54fSb4BeM3IoQqqol3bfVRcIdOylbNan2loURPOkAUrGslUp4GNgRAj93cwHqsGK
 Ckzg==
X-Gm-Message-State: AOAM532Q6k+Usu6zVA1XBdurvSHzx9s0/PP8AVz+EXvv5ESt8szxMqy2
 xGjoXbiWU9peBt1Nck8eNcXuXqkSANz4Ww==
X-Google-Smtp-Source: ABdhPJzwccGRnK7rZ6AIGMePII6n3E3kdHN7YLPcOng2qLLqQiInwucZuj+zRVpLl19QCmkIF06xtQ==
X-Received: by 2002:a17:906:3949:: with SMTP id
 g9mr3716201eje.493.1610471700299; 
 Tue, 12 Jan 2021 09:15:00 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k22sm397302edv.33.2021.01.12.09.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 09:14:59 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/20] scripts/gdb: fix 'qemu coroutine' when users selects a
 non topmost stack frame
Date: Tue, 12 Jan 2021 18:14:39 +0100
Message-Id: <20210112171450.791427-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112171450.791427-1-pbonzini@redhat.com>
References: <20210112171450.791427-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x629.google.com
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
Cc: Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Maxim Levitsky <mlevitsk@redhat.com>

The code that dumps the stack frame works like that:
* save current registers
* overwrite current registers (including rip/rsp) with coroutine snapshot
  in the jmpbuf
* print backtrace
* restore the saved registers.

If the user has currently selected a non topmost stack frame in gdb,
the above code will still restore the selected frame registers,
but the gdb will then lose the selected frame index, which makes it impossible
to switch back to frame 0, to continue debugging the executable.

Therefore switch temporarily to the topmost frame of the stack
for the above code.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Message-Id: <20201217155436.927320-2-mlevitsk@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/qemugdb/coroutine.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/qemugdb/coroutine.py b/scripts/qemugdb/coroutine.py
index db61389022..e1399211e6 100644
--- a/scripts/qemugdb/coroutine.py
+++ b/scripts/qemugdb/coroutine.py
@@ -70,6 +70,11 @@ def bt_jmpbuf(jmpbuf):
     regs = get_jmpbuf_regs(jmpbuf)
     old = dict()
 
+    # remember current stack frame and select the topmost
+    # so that register modifications don't wreck it
+    selected_frame = gdb.selected_frame()
+    gdb.newest_frame().select()
+
     for i in regs:
         old[i] = gdb.parse_and_eval('(uint64_t)$%s' % i)
 
@@ -81,6 +86,8 @@ def bt_jmpbuf(jmpbuf):
     for i in regs:
         gdb.execute('set $%s = %s' % (i, old[i]))
 
+    selected_frame.select()
+
 def coroutine_to_jmpbuf(co):
     coroutine_pointer = co.cast(gdb.lookup_type('CoroutineUContext').pointer())
     return coroutine_pointer['env']['__jmpbuf']
-- 
2.29.2




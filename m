Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 382392DFD03
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 15:48:56 +0100 (CET)
Received: from localhost ([::1]:46462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krMUZ-0007kF-6u
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 09:48:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMQq-0004m3-18
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:04 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMQo-0007gf-Cm
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:03 -0500
Received: by mail-wr1-x42b.google.com with SMTP id w5so11291697wrm.11
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g0fGdFEztzm8rAibMt6QoL7YynVwcGLqq1vKO1IDiTA=;
 b=GhPflRf0FrMecdr7q4aCOBR1BOd8mRN9fk6mkxmDwrgVPlBDQJcni/YDkBF6UF5pQt
 /oaZ0MrE7FAfVbzvNo4VWdQLV4jR8BEthiwj3/LcZ9ZIRrdPLHyUPyyQoXNnL7IIsSOl
 dyT1y6TDVGDJIZ289qqixARVVmM0VOtQRaq4kbeJp1Ri3zX4kOmd20dUd3gQCkNlhSd7
 V4RUatQeWBp2MAkdjKEyXd02iHaLSaTql7nfggJ30x+SmsXAPqEgXgA0kNOjhRReV0iO
 KLBMLucA8sVTKK9g0T09f7hbu7KICvC9GBD3WXcxHx1Qi2zBoK/xj8a1p2HiMddiXB6w
 Gsug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=g0fGdFEztzm8rAibMt6QoL7YynVwcGLqq1vKO1IDiTA=;
 b=maaCJjDkajVv6Vju0Z2FosbylvPE62Kp7YX2yxGSBJ5HwrzlMRBhiMBLwBI7NC8Fso
 QlGDWyv92H1Ib+SkfmFoYgfdkZq3uaKZ9lbj9XZWa9Fw86hhtEpcay00v5ESUmokKwQG
 zI2z9OYvwS1W1ZD0fh/gS7gR4xRymTnc+sgeO3pb5MkRHpB2kxTSEFRKrt0yFtrVXTIv
 N4nCJKiBWIG9BgeTbOVlEjg3dnXSe9BKwhsbKE8GI+YngZ9t2JI1XRioMhV74ToA5mbg
 +HRRoVI0AEF1eWktC+R6S+REqipQIkviejBfHzIY/NjUs1AnrwuLSa7XVFzgI9yvT8TR
 PsVA==
X-Gm-Message-State: AOAM53348XnuXfVwOu+vpmw5hJaiO+w3M3msh8TnYTziY+WtzskDtbMA
 QfVssf2Kvl2t8daC4uhCXKp3nLzQdNw=
X-Google-Smtp-Source: ABdhPJxsIZEPQNCm6kSZu7vRm7weyloiA84P/vpFE4HA93z3fKMq9edn22vo5LPjoyVC4Q74ZROLRg==
X-Received: by 2002:a05:6000:108b:: with SMTP id
 y11mr18889352wrw.379.1608561901141; 
 Mon, 21 Dec 2020 06:45:01 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:45:00 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/55] test-char: Destroy chardev correctly at
 char_file_test_internal()
Date: Mon, 21 Dec 2020 15:44:05 +0100
Message-Id: <20201221144447.26161-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eduardo Habkost <ehabkost@redhat.com>

commit 1e419ee68fa5 ("chardev: generate an internal id when none
given") changed the reference ownership semantics of
qemu_chardev_new(NULL, ...): now all chardevs created using
qemu_chardev_new() are added to the /chardevs QOM container, and
the caller does not own a reference to the newly created object.

However, the code at char_file_test_internal() had not been
updated and was calling object_unref() on a chardev object it
didn't own.  This makes the chardev be destroyed, but leaves a
dangling pointer in the /chardev container children list, and
seems to be the cause of the following char_serial_test() crash:

  Unexpected error in object_property_try_add() at ../qom/object.c:1220: \
      attempt to add duplicate property 'serial-id' to object (type 'container')
  ERROR test-char - too few tests run (expected 38, got 9)

Update the code to use object_unparent() at the end of
char_file_test_internal(), to make sure the chardev will be
correctly removed from the QOM tree.

Fixes: 1e419ee68fa5 ("chardev: generate an internal id when none given")
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20201215224133.3545901-2-ehabkost@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/test-char.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/test-char.c b/tests/test-char.c
index 953e0d1c1f..06102977b6 100644
--- a/tests/test-char.c
+++ b/tests/test-char.c
@@ -1298,7 +1298,7 @@ static void char_file_test_internal(Chardev *ext_chr, const char *filepath)
     g_assert(strncmp(contents, "hello!", 6) == 0);
 
     if (!ext_chr) {
-        object_unref(OBJECT(chr));
+        object_unparent(OBJECT(chr));
         g_unlink(out);
     }
     g_free(contents);
-- 
2.29.2




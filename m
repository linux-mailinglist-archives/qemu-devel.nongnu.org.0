Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A923164E92D
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 11:10:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p67e7-0004ak-O1; Fri, 16 Dec 2022 05:08:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p67e3-0004aK-B8
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 05:08:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p67e1-0001PY-LA
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 05:08:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671185324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nNOmRrsHPtBQhQTF9lfyyn6dv9cNBUyxueAuv++IYNg=;
 b=V+Yk0eutG6+IZGcbMw+gz7xFd5v8iJtNPCUt+dIJe7z10oxjQODXHCGippKBHT9E4xbzZO
 o+jccYLYPAa5HA9XH5tsRo/X0FMLV8+oq1eJEDTS4GZB+9oWQrPlK65D8EH695DiXU1oxP
 gvlGN+z++mVRbrB0pWV0NzZ1FQkFh3M=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-91-KWENXHTsPbu8Z2Z_8jTWFQ-1; Fri, 16 Dec 2022 05:08:42 -0500
X-MC-Unique: KWENXHTsPbu8Z2Z_8jTWFQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 z3-20020a056402274300b0046b14f99390so1537702edd.9
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 02:08:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nNOmRrsHPtBQhQTF9lfyyn6dv9cNBUyxueAuv++IYNg=;
 b=5akEbbe6uHOH1ly0/5MmM12hV7Yv3k4FPeSsDYuv0SAXuO0R9g+/YyPnKXjKONHE63
 GUD2INT/ip9m9044VrY/S4D25/PMVscegcWDUHxJtk8RyWT9xMv38uuYf+0ToY52kYYu
 8bIjaGQsz0VSVtC9JblNcSDkx0Wf8wU6xE95HBEUvxWlY6nGW6blEz8JhjDAHpHaLSDs
 BMxoTaCVqHRuXENpMux/NTRw/6/2O11wD1H64vTvzxJVAD6i0QsnLdYKYX8KXMNMOakz
 /rNXjr+EUpu72seP9xBu50gAi7heSEraJ6JjJYNJ/9BlimWZDcZb3/WznRzZO1DGcbFA
 8qYw==
X-Gm-Message-State: ANoB5pkyVoee4tmN0HLrZgQwmjdMBJnNbYYcDcvkoXWAeCcFWMzQQJSX
 qCeFESqKciQ3fXMpgyhaftBINsyvLbZc5llpHDSWdjYBirmAlpQQTJiQPJ8uuqYd30w8lyoEA9b
 AvXuCwFA67QnDATYFKpUX+oTSGTEbP+PTWoaMPJvk0f2vvq4+B1ijARwrObyjewLpEvg=
X-Received: by 2002:a05:6402:7ca:b0:46b:aa:8564 with SMTP id
 u10-20020a05640207ca00b0046b00aa8564mr23531268edy.30.1671185321266; 
 Fri, 16 Dec 2022 02:08:41 -0800 (PST)
X-Google-Smtp-Source: AA0mqf50YP6PiPijKnRchpvSocE0XRp4DWVDubrKrGtHyXz9BogqsoORzjmcoFonqO1QxuLQhPIHPQ==
X-Received: by 2002:a05:6402:7ca:b0:46b:aa:8564 with SMTP id
 u10-20020a05640207ca00b0046b00aa8564mr23531246edy.30.1671185320885; 
 Fri, 16 Dec 2022 02:08:40 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:cdd2:bd6:b053:4614])
 by smtp.gmail.com with ESMTPSA id
 x8-20020aa7cd88000000b0046892e493dcsm683399edv.26.2022.12.16.02.08.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 02:08:40 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/qapi-schema: remove Meson workaround
Date: Fri, 16 Dec 2022 11:08:38 +0100
Message-Id: <20221216100838.518435-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

The referenced issue has been fixed since version 0.61, so remove the
workaround.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qapi-schema/meson.build | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index 406bc7255d23..9dfe98bc9a68 100644
--- a/tests/qapi-schema/meson.build
+++ b/tests/qapi-schema/meson.build
@@ -277,10 +277,6 @@ if build_docs
                                     command: ['perl', '-pe', '$x = chr 13; s/$x$//', '@INPUT@'],
                                     capture: true)
 
-  # "full_path()" needed here to work around
-  # https://github.com/mesonbuild/meson/issues/7585
-  test('QAPI rST doc', diff, args: ['-u', qapi_doc_ref_nocr[0].full_path(),
-                                    qapi_doc_out_nocr[0].full_path()],
-       depends: [qapi_doc_ref_nocr, qapi_doc_out_nocr],
+  test('QAPI rST doc', diff, args: ['-u', qapi_doc_ref_nocr[0], qapi_doc_out_nocr[0]],
        suite: ['qapi-schema', 'qapi-doc'])
 endif
-- 
2.38.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CAC6535EB
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 19:11:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p83QD-0000wp-EE; Wed, 21 Dec 2022 13:02:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83QB-0000tq-6x
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83Q9-0004Kj-KF
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671645745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nNOmRrsHPtBQhQTF9lfyyn6dv9cNBUyxueAuv++IYNg=;
 b=NzAD0yTVl35mNuanKTA/pfFkVvwGMMKcyPGwfE9bH4UQeiaV6xZJCV6d67HEIIKVVtljH9
 m91QYCdRKrs8ha5UmWgQjjLDwre+jPvzoDOSCrIBHkljOA4v403SfrO/q5/+ELp7Bj64pH
 X/tWu0eSJXiaRIIsQyf7lUFaOQ+4yY0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-310-lMz7iCHQNI6XqtTiFmF_2g-1; Wed, 21 Dec 2022 13:02:23 -0500
X-MC-Unique: lMz7iCHQNI6XqtTiFmF_2g-1
Received: by mail-ed1-f71.google.com with SMTP id
 y2-20020a056402440200b004779fcdf1baso9220463eda.4
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 10:02:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nNOmRrsHPtBQhQTF9lfyyn6dv9cNBUyxueAuv++IYNg=;
 b=yHA2cyGVEgD3fkMZfKoyn/ZAP8R9eZ4EgdCMIgjxsW+JOTGWsjLlP3nTP5vP+SKYhQ
 eTjgBKbfhjXgeYbx7UKNx6Ggl2qsrBaUlT0AsVBXT29Jwd3aSrgK/BqjOHFzmUf1dofu
 n1v0ibXuEEhQGyO/cUeZYZShZg2iHjVVt0yLmB6UA7tEioKIaH3ssJsycBtocAhjCwUW
 uWE6FcsILMiQEL3Onb8szNddnQZUu2asWwUja66i1NEwAfXl6QZDzIIGC+S9nLFacUUv
 OJi7O+AgyyYqBQwV7tpZsSbh+k02eIZSYgJ2mDwumgYkhYuIWFNHuM2S4GIAFLB36GoR
 EBHg==
X-Gm-Message-State: AFqh2kpkavYLVfDVMUk24LF1/MhxWdvijpI/EpsyRz04GaOXQAv1+6Jl
 JKkrYdD+9ld00jTLvKtyiqUiGSivPU3MfEI2WOkCzc3ahIgNmBFIB6D8CtL19amLHhtro1aNGaA
 frPnUPLRi2LF7hPXU735L60xIhuNZiEQdNAdPi4IEc34tHoVCcL9OxAe03qzEheXUYWc=
X-Received: by 2002:a17:906:9c85:b0:7c1:27a:80ed with SMTP id
 fj5-20020a1709069c8500b007c1027a80edmr2085489ejc.0.1671645742103; 
 Wed, 21 Dec 2022 10:02:22 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuLedHBCcpNzutnXWF6jPNOpPJdE5F0xKonMkQARPn9rr+MfkMTuKBL6LSvW0JxE0P0RqttwQ==
X-Received: by 2002:a17:906:9c85:b0:7c1:27a:80ed with SMTP id
 fj5-20020a1709069c8500b007c1027a80edmr2085475ejc.0.1671645741870; 
 Wed, 21 Dec 2022 10:02:21 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 jx14-20020a170906ca4e00b007b47749838asm7292426ejb.45.2022.12.21.10.02.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 10:02:21 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/24] tests/qapi-schema: remove Meson workaround
Date: Wed, 21 Dec 2022 19:01:31 +0100
Message-Id: <20221221180141.839616-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221180141.839616-1-pbonzini@redhat.com>
References: <20221221180141.839616-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
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



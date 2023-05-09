Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3066FC25E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 11:07:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwJHm-0005e9-65; Tue, 09 May 2023 05:05:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwJHj-0005b3-QW
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:05:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwJHi-00051j-80
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:05:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683623125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aRyBg5nmn6s4UHxBL727Es/39cSPibg5txcxNKJjMS8=;
 b=FIMUiFgo8LnRx995wyWsV6wx7FJmTYATUmGqodXNwswid4WN7UL9tpnga1mW4ZMtrLnCkf
 PA0pzooGs92MONP+cNN2/96QvUYe6eMJNNPX+ht3vSZ21VWkka6mWCC+tBMDW1WNZL8BDP
 rKHQ3QS8+rwhOzVdaif7Qv+e3He2o/s=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-201-b9CPx3gOOwC-VM9dCcliLg-1; Tue, 09 May 2023 05:05:24 -0400
X-MC-Unique: b9CPx3gOOwC-VM9dCcliLg-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-9662fbb79b3so291301266b.0
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 02:05:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683623123; x=1686215123;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aRyBg5nmn6s4UHxBL727Es/39cSPibg5txcxNKJjMS8=;
 b=T9Iw0y/4mrg2/RmtziIyNtCc+8nVoYpUYR4GQwaIYVALFkWRgMmpprg6sZapmYHaCt
 hriNN8lWsoouYKeb+e6tO62EdAfj6NJRtl6y+1wQeBOA5Riz6Zg0oWRQj1rEWmBZrb3d
 8WgdBOXQK8bOn2blZGvFTrU5tzZgWEbKnXojeMIA4OmLl+b5iRiWdfVqjQ3kaLFYGBXR
 7yArqaGQ0Ni/G35PqQ5pdfP0ypzn1bW+yHajVsYmPZ7Xwp8q8RHgfdqX7LJ54kVhGlk/
 pmtPbJSwIFPa4IIq2LF0yX8hhSg3LptSOJbaxaozntxHcdKOQOTrPa56g1PVaSb+roxh
 4G5Q==
X-Gm-Message-State: AC+VfDxtaLt1kBMrr+bnnhO46jl8KuURT4im2Teegmr0sNK+hiYyOUl8
 l+YGsHzc8fogjiHXjTOXF7yT48BAYyS5IkwXqo2y9yGYjIc5OoT9R3/ab7RnWFs3tULKmnXAPmk
 /Z6wjCncJRdCT/Bi6Jm9HhrNuQhNVwonht9KrEQcbz+r34yifQIBIZJqKM+zyWsRW/Z92sUdtD1
 w=
X-Received: by 2002:a17:907:2dab:b0:96a:2b4:eb65 with SMTP id
 gt43-20020a1709072dab00b0096a02b4eb65mr126455ejc.9.1683623122819; 
 Tue, 09 May 2023 02:05:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4EqYMp98WDnCobiYAq4mQkTBzb1AzRhvbzpzLHi3a562oqBGUfTcpqjK5UwyoJbF/6HPW1dQ==
X-Received: by 2002:a17:907:2dab:b0:96a:2b4:eb65 with SMTP id
 gt43-20020a1709072dab00b0096a02b4eb65mr126432ejc.9.1683623122291; 
 Tue, 09 May 2023 02:05:22 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 tl14-20020a170907c30e00b00961277a426dsm1036951ejc.205.2023.05.09.02.05.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 02:05:21 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/16] docs: clarify --without-default-devices
Date: Tue,  9 May 2023 11:04:52 +0200
Message-Id: <20230509090453.37884-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509090453.37884-1-pbonzini@redhat.com>
References: <20230509090453.37884-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--without-default-devices is a specialized option that should only be used
when configs/devices/ is changed manually.

Explain the model towards which we should tend, with respect to failures
to start guests and to run "make check".

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/kconfig.rst | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/docs/devel/kconfig.rst b/docs/devel/kconfig.rst
index ac9453eba909..e3a544e463fd 100644
--- a/docs/devel/kconfig.rst
+++ b/docs/devel/kconfig.rst
@@ -282,9 +282,19 @@ want to change some lines in the first group, for example like this::
    CONFIG_PCI_DEVICES=y
    #CONFIG_TEST_DEVICES=n
 
-and/or pick a subset of the devices in those device groups.  Right now
-there is no single place that lists all the optional devices for
-``CONFIG_PCI_DEVICES`` and ``CONFIG_TEST_DEVICES``.  In the future,
+and/or pick a subset of the devices in those device groups.  Without
+further modifications to ``configs/devices/``, a system emulator built
+without default devices might not do much more than start an empty
+machine, and even then only if ``--nodefaults`` is specified on the
+command line.  Starting a VM *without* ``--nodefaults`` is allowed to
+fail, but should never abort.  Failures in ``make check`` with
+``--without-default-devices`` are considered bugs in the test code:
+the tests should either use ``--nodefaults``, and should be skipped
+if a necessary device is not present in the build.  Such failures
+should not be worked around with ``select`` directives.
+
+Right now there is no single place that lists all the optional devices
+for ``CONFIG_PCI_DEVICES`` and ``CONFIG_TEST_DEVICES``.  In the future,
 we expect that ``.mak`` files will be automatically generated, so that
 they will include all these symbols and some help text on what they do.
 
-- 
2.40.1



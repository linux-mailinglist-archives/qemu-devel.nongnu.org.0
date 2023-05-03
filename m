Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EB96F5D0F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 19:32:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puGJw-00040o-4y; Wed, 03 May 2023 13:31:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puGJo-0003xr-Rm
 for qemu-devel@nongnu.org; Wed, 03 May 2023 13:31:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puGJk-0000HQ-0y
 for qemu-devel@nongnu.org; Wed, 03 May 2023 13:31:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683135063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8YnTf91+PgVR4BiV135cJMJDv3ew5X0T/xr60TRguBc=;
 b=ZkF/Ab2Brl84K9PT5ZzvUNM/+xiW4mAx59XbwwCVa2uXAF48iME9aAZCXy8QbUff+zcFty
 zg14IaI7bUUM7knN4r4Vjgj7CD7m05MdCBim6zSs1DmvweTTHIgxDL8AEHGRy6qpV9ry2P
 KVq+Gn0bcVI0RXf6rpHbHi9axl7tJQQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-ypZIJutxN8q9t9MtR5GyDw-1; Wed, 03 May 2023 13:31:01 -0400
X-MC-Unique: ypZIJutxN8q9t9MtR5GyDw-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-94f29909e11so490036266b.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 10:31:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683135060; x=1685727060;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8YnTf91+PgVR4BiV135cJMJDv3ew5X0T/xr60TRguBc=;
 b=kTW+ua3HuPjc5xT+GbpBYSvwm855JrN07c3tbykbci/uMUVFI+C08JeRMCC5TRpji8
 itbHRtjmH8KScBSJ/N4PJa6h5w5EXt17p40BkE1Q7jcoZjp602/iE5TQqCbNI6+hyS+o
 2nQd3h42hsbm0DpfZ1TmbshL55PqvCi2os0TJlDMI/lfrnBzmgxPR22IEvptqcZPQk4a
 dVCKVZmEBe0+ut6xvjldQIBgHkFpOaBwf7au/T8ZTAd8ver6paP+G+TVCC9MSHHslkEz
 N0TR+Pccex6Yv3OhAwlZRp6YsWFDJfEuzQWJCqOo/PFMWiezABAXNkGXi9g3bPe+cNdj
 OqMg==
X-Gm-Message-State: AC+VfDwXngClWQyO1hGlfM4peZmpVN5/ilOjlznDhYZQ+cskslEnptgM
 gOLdvww7PPcFbrbSGW1ZxcaclJ9DFVhoKjHV+b5HH+Zzea6kgky13kQRZVraPxuFVpUxXonCYxG
 jUoo02gYyt/5246sbsy8DByMcwmLujS9ynerC1vIF48lsYbX273PjWWiDYh8YmwMe57ul+dd/NE
 0=
X-Received: by 2002:a17:907:60ce:b0:94a:67a9:6052 with SMTP id
 hv14-20020a17090760ce00b0094a67a96052mr4144979ejc.67.1683135060279; 
 Wed, 03 May 2023 10:31:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4Bh+EDkfZeO1CEvVshE0hl3cxkFWRzQxBzQeDF8GQ8chkQlr81hDYoceb80Q4ji/htz0PaXA==
X-Received: by 2002:a17:907:60ce:b0:94a:67a9:6052 with SMTP id
 hv14-20020a17090760ce00b0094a67a96052mr4144954ejc.67.1683135059904; 
 Wed, 03 May 2023 10:30:59 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 jy4-20020a170907762400b00961164a4a73sm6759816ejc.223.2023.05.03.10.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 10:30:59 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	farosas@suse.de
Subject: [PATCH] docs: clarify --without-default-devices
Date: Wed,  3 May 2023 19:30:58 +0200
Message-Id: <20230503173058.156613-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
index a68fbc142efc..01984ae9fa9c 100644
--- a/docs/devel/kconfig.rst
+++ b/docs/devel/kconfig.rst
@@ -281,9 +281,19 @@ want to change some lines in the first group, for example like this::
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
2.40.0



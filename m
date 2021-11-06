Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F934470F9
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Nov 2021 00:31:41 +0100 (CET)
Received: from localhost ([::1]:33902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjV9w-0003Uk-5C
	for lists+qemu-devel@lfdr.de; Sat, 06 Nov 2021 19:31:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mjV8D-0001NB-28
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 19:29:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mjV89-0000BH-UT
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 19:29:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636241389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DJYfP/QRIwsFnsckddLG3kmV+HJzA8I64Kxk3V2kOPs=;
 b=Yw3NUP9KjGH+DfpALYwRFZjyz4/aLEo8v3juX0BSpgrsl/ecRpNYAriRJzuOxNMdANok8f
 k9KPFij7h9OD+jIUZWyF0GIw/8Tpzs5ze3q5tGoUfPECPsScyb1R148CBQkxstBmVildre
 GIA4n3JFt5rKMNB6S6Eiada7RDJNh6g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-RZVmJm99OjCi2-vdgZECWQ-1; Sat, 06 Nov 2021 19:29:44 -0400
X-MC-Unique: RZVmJm99OjCi2-vdgZECWQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 o18-20020a05600c511200b00332fa17a02eso4653301wms.5
 for <qemu-devel@nongnu.org>; Sat, 06 Nov 2021 16:29:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZwsTFxHCTCgjdVogC8TsqXRXB7Ph5QaoBzp7Ym98dxU=;
 b=r6rttjiiklCS/jYXuCpMPpmdMwSGq9X8In9KDLGERSY1MHbgyBOVR+1UjzNe/LO9fS
 v8jywdB+veDmlXW2IU5uMXHCaLea5tHAIlhl5TbIW9ZkqV97ZMnBv1UDzgt4/k2vi4y0
 c89Mw0yRCZYMLYvMW5hCiOgVskpcYhoXgBs2nOsR/6FUs1S9226/wmY6SSE8Du32mA4k
 9r3Igtc8vlxA0DgvHDbf9ZK2Q5+/k3rh761WKhw70KTx2nvxtgGkgmQd9AbZWgldaaxP
 EzQEDIkdbUdc01nPCZxM+7gaYSL+WDE3SZSSAtNRzqxOgvbjG58zza9MWrl4n124sLR1
 4WJA==
X-Gm-Message-State: AOAM530oVI0GxPgXRSNSJ3lnRbwB+8NvIGL43CSf6Ku29WSRYLrXhKyc
 1IPaTED8Ly9bKphA26syw+JIByJeb2RQ+r+pIDoAojHOQv0DOWeY0peQR7GLdkGApw2O7EkPbi/
 mqiNHFzvd0VzMB2IfUtwFFvUx1O11IpQPdYmu62DgJhVoOtlkU/NscmD6TioIYiJ5QfA=
X-Received: by 2002:a1c:4c19:: with SMTP id z25mr41942581wmf.177.1636241383129; 
 Sat, 06 Nov 2021 16:29:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1iY5rt6tLaJSI4c8SFyZbXP/JW+gQubds0afzd+H55J2Hjh3pmG2MW0oX0kSSt662IrrHPQ==
X-Received: by 2002:a1c:4c19:: with SMTP id z25mr41942549wmf.177.1636241382897; 
 Sat, 06 Nov 2021 16:29:42 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id u14sm11761408wrt.49.2021.11.06.16.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Nov 2021 16:29:42 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] Migration 20211106 patches
Date: Sun,  7 Nov 2021 00:29:39 +0100
Message-Id: <20211106232941.46184-1-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.735,
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
Cc: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit c39deb218178d1fb814dd2138ceff4b541a03d85=
:=0D
=0D
  Merge remote-tracking branch 'remotes/kraxel/tags/egl-20211105-pull-reque=
st' into staging (2021-11-05 11:42:06 -0400)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://github.com/juanquintela/qemu.git tags/migration-20211106-pull-req=
uest=0D
=0D
for you to fetch changes up to f78d4ed701454f10079461b981ba2a61a95762ab:=0D
=0D
  docs: fix qemu incorrect tag (2021-11-06 12:35:38 +0100)=0D
=0D
----------------------------------------------------------------=0D
Migration Pull request=0D
=0D
- fix vhost-user crash when using postcopy (me)=0D
- fix incorrect tag for docs (hyman)=0D
=0D
Please apply, Juan.=0D
=0D
----------------------------------------------------------------=0D
=0D
Hyman Huang(=E9=BB=84=E5=8B=87) (1):=0D
  docs: fix qemu incorrect tag=0D
=0D
Juan Quintela (1):=0D
  migration: Check that postcopy fd's are not NULL=0D
=0D
 qapi/migration.json      | 10 +++++-----=0D
 migration/postcopy-ram.c |  4 ++++=0D
 2 files changed, 9 insertions(+), 5 deletions(-)=0D
=0D
--=20=0D
2.33.1=0D
=0D



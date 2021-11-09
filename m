Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FFE44A81E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 09:05:09 +0100 (CET)
Received: from localhost ([::1]:40376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkM7w-0001Ji-Bd
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 03:05:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mkM5r-0007nU-4x
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 03:02:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mkM5o-0002Ac-64
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 03:02:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636444974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AsdWssWvW1r76n/6FjoHf47ysZ6tO1mZu0w0QAb14Gs=;
 b=BOsB6Tmduvcsyy/mGqi8PdgivHQEYJOYcc7BYvRoWhOYxRdscizuTH8z7qCr0ejF8iQZPh
 f8UM9w1lvsJKbr1HjtzS6BBuNdVyzRL2mgWoSZ3xV/uZRvGt5x0w+vlEZ2E1WmzUnlCp2W
 GotRyRLcEMbZuAaDFK2F7jLoBPmivyw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-dTOqW9yROaKfDg6TquXDGA-1; Tue, 09 Nov 2021 03:02:52 -0500
X-MC-Unique: dTOqW9yROaKfDg6TquXDGA-1
Received: by mail-wm1-f69.google.com with SMTP id
 a186-20020a1c7fc3000000b00332f1a308e7so931886wmd.3
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 00:02:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=klDvh5oEM8KeY732Z9CnE6ZRUozeBC7+lp403pndHSg=;
 b=masBI1fY/XChuGX3lEAygCXgnKglojWUzr8vgH7qj10oi6Y4fiDQ6PxWXly6XXSo16
 Q/DcUTCmtONtbNLr3CtZ04w6/YE2IYRDJMIW6xElHOLccrEbHFR+72cDXslm3ZGxJglk
 WefMHGW5O9alkmwQCjO1ZdaP5Kamyw8GGkpNlVmJecMaezPyqNg7D8MKOQMgLeZzamnQ
 WCvNM5FTMDepEpt/2inmdJ/CDwcpnGWn5xpDIie4xRT8Ooy0RZIcWPhio2KxQMIGhVGb
 x9JRx8d/Uy4xBS5HX0ZNAvelfJ/jyNwCFEQHPZMMhujwRjxctc1s/sWH2YeVqIReWfXH
 vtVg==
X-Gm-Message-State: AOAM531j3JeFEE0vrGjWMv8MUfgyCorUQbRv5mWMv/TpCNMtIAXoXngV
 P4RIZsq8j3oA2va0Trts5F4Zo9jvy8Ip3Vtpnct2iVbPfpwc8VoNfxbygFYX9HDdVpSix8EawG/
 tvsYgXzVp+Mfjbmas5QwmIdG7rhVGkPzReP8onSNvU/NcMYYHzEK/d0KpdwonidE1rJ8=
X-Received: by 2002:a1c:7715:: with SMTP id t21mr4992682wmi.183.1636444970787; 
 Tue, 09 Nov 2021 00:02:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzEDf0L1Pf4r86TElcB7RJjt3V/p/1is9BbKQ1mQZ3/tQg+yi8QPXSZXSF31I0iO/nFyO20SA==
X-Received: by 2002:a1c:7715:: with SMTP id t21mr4992649wmi.183.1636444970475; 
 Tue, 09 Nov 2021 00:02:50 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id e18sm18946468wrs.48.2021.11.09.00.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 00:02:50 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/3] Migration 20211109 patches
Date: Tue,  9 Nov 2021 09:02:44 +0100
Message-Id: <20211109080247.62559-1-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Markus Armbruster <armbru@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 114f3c8cc427333dbae331dfd2ecae64676b087e=
:=0D
=0D
  Merge remote-tracking branch 'remotes/philmd/tags/avocado-20211108' into =
staging (2021-11-08 18:50:09 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://github.com/juanquintela/qemu.git tags/migration-20211109-pull-req=
uest=0D
=0D
for you to fetch changes up to 91fe9a8dbd449a2f333aefb82ec8adb1f6424408:=0D
=0D
  Reset the auto-converge counter at every checkpoint. (2021-11-09 08:48:36=
 +0100)=0D
=0D
----------------------------------------------------------------=0D
Migration Pull request=0D
=0D
Hi=0D
=0D
This pull request includes:=0D
- fix sample-pages doc by hyman=0D
- cleanup colo pages by contiguous blocks by Rao=0D
- reset auto-converge by checkpoint by Rao.=0D
=0D
Please, apply.=0D
=0D
----------------------------------------------------------------=0D
=0D
Hyman Huang(=E9=BB=84=E5=8B=87) (1):=0D
  docs: fix 'sample-pages' option tag=0D
=0D
Rao, Lei (2):=0D
  Reduce the PVM stop time during Checkpoint=0D
  Reset the auto-converge counter at every checkpoint.=0D
=0D
 qapi/migration.json |  2 +-=0D
 migration/ram.h     |  1 +=0D
 migration/colo.c    |  4 ++++=0D
 migration/ram.c     | 57 ++++++++++++++++++++++++++++++++++++++++++---=0D
 4 files changed, 60 insertions(+), 4 deletions(-)=0D
=0D
--=20=0D
2.33.1=0D
=0D



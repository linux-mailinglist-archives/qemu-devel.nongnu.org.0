Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EC347E133
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 11:16:44 +0100 (CET)
Received: from localhost ([::1]:52142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0L9O-0000GL-Nj
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 05:16:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0L7O-0006Zy-GU
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 05:14:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0L7M-0006qk-4P
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 05:14:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640254475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wrBJ6rUNo2Cfop9dnAvTxpV0ZPjhX8aSQY+ASLs9THY=;
 b=cnJEsttIxLwonjlGVxquj4EGXkljOfTxRmeGwVhNoJ3mPStmjAPgwGUksOWJg9qW/+E4iC
 qZPTTR1u3x8HOAatrjyEBkw2WhBPipnXdw+7lG2Lpm2BUj1rxLnc2KtMYcwg6UyKYLuynQ
 5QpC9SgtBcVEfhO91VuIDQfb458riN4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-41-vFCp_fEsNIO84rzMjgPMHQ-1; Thu, 23 Dec 2021 05:14:34 -0500
X-MC-Unique: vFCp_fEsNIO84rzMjgPMHQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 m19-20020a05600c4f5300b00345cb6e8dd4so1558055wmq.3
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 02:14:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RsyZSeptQ2Ic7m7iT6QJcLL0+F9eV+PB0m3XuV9lcwk=;
 b=L4rVgkHVttMwDAdPZj1AgHSih51G/Mgfp9Et6DReSZjLD/cWGc41d0ON9hUEw0n9hn
 qPlYWRpzKztcIsqM5abH4pe8SAa8PVwuDL1xdKBlNEeHi8N+90PdLdiLObT8X9YYNl95
 TUkuf8y9iF4wJMdRmKVukC2X9ToQhwtWQTd43lznwvH6eqGNu6I3SD0EsGUmIwlDfdqU
 AqD5/b0BbRraEhjnwnX+w5B5NUpvuG6A0Z+HxasHrQrotan3ImanIcn1a+ryMi+z7vlP
 nEQrtJmpys2XAp2nkyMFOAuqsWRMuowplM9RX+8ucpzGR4uMjfHE3ihSanpbE9KqmkW+
 oDwQ==
X-Gm-Message-State: AOAM531Y7WA1lTHwTKatSeDSS7uNGPibbA4HcyC/DEpxILb5ViOLj526
 Le6uvmH36cDzfIdU/6xRR5ha1C1youULAAT7xX57Stj/pOvf0/CBLfgIg5VNSeXgy2tkcogMdQy
 EbxPjArqaa+b2YVfA/skrZIJ1OsujD07AWf4FutYufa0yQYIbn/T3LMTh3YzZtyHQ
X-Received: by 2002:a7b:c310:: with SMTP id k16mr1290944wmj.169.1640254472750; 
 Thu, 23 Dec 2021 02:14:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJywLUBHa7lM1oKnF9SU5zMDkVvqUzU66PdqSiurQD7i7gFyz8eIp2nGpHYJN2+ZuPDi45bm0A==
X-Received: by 2002:a7b:c310:: with SMTP id k16mr1290920wmj.169.1640254472427; 
 Thu, 23 Dec 2021 02:14:32 -0800 (PST)
Received: from x1w.. (33.red-193-152-124.dynamicip.rima-tde.net.
 [193.152.124.33])
 by smtp.gmail.com with ESMTPSA id bg12sm5291640wmb.5.2021.12.23.02.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 02:14:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] block: Minor vhost-user-blk fixes
Date: Thu, 23 Dec 2021 11:14:24 +0100
Message-Id: <20211223101426.3143647-1-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

- Add vhost-user-blk help to qemu-storage-daemon,=0D
- Do not list vhost-user-blk in BlockExportType when=0D
  CONFIG_VHOST_USER_BLK_SERVER is disabled.=0D
=0D
Since v1:=0D
- Reword patch 2 description (Markus)=0D
- Fix BlockExportOptions enum build failure (Markus)=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  qemu-storage-daemon: Add vhost-user-blk help=0D
  qapi/block: Restrict vhost-user-blk to CONFIG_VHOST_USER_BLK_SERVER=0D
=0D
 qapi/block-export.json               |  6 ++++--=0D
 storage-daemon/qemu-storage-daemon.c | 13 +++++++++++++=0D
 2 files changed, 17 insertions(+), 2 deletions(-)=0D
=0D
--=20=0D
2.33.1=0D
=0D



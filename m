Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B33F47B58D
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 23:00:45 +0100 (CET)
Received: from localhost ([::1]:33594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzOty-00045y-8K
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 15:04:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzOpv-0001fj-8b
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 15:00:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzOps-000380-Dv
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 15:00:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640030439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mjKqYa6zVdH+Yd9qRkYoY1VOby8S1ckU/s29aDnYcqw=;
 b=O3JLZp7n9ubIbbWJVvkOkja8p04yRsAr5LMgQrT/hsSoc4fijncGyzTCPnTWKgY/R+2/sQ
 jWkNabyIypVePPNhYKLvQkGabTGcN3u4hhpdGTwB52+uWx4pPvUToOU6CcDK3h28wwNVQy
 9uAnxZ2/dbk8G6EtWEx8rUVZyvqtgNM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-306-v03lET-0NfW3bbXJ1eX6bQ-1; Mon, 20 Dec 2021 15:00:38 -0500
X-MC-Unique: v03lET-0NfW3bbXJ1eX6bQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 144-20020a1c0496000000b003305ac0e03aso66582wme.8
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 12:00:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jHRtWFsWmz2FbitNrp2AVfbKj4HPyOKrCjKRZ0P+sqQ=;
 b=3nN0OVp55K+/QJcRpijQgj/KG/OOwSdUCT04cRusXltyf2s75vCddRIigiBLGAXPEz
 ERx5ynGIIFLAGofwXDylV0U7YFGuRNE8bors4FD9tAtecYF22Ice53HtQ11Rmj/uTIRq
 0+/BgJsuOwaZsS9LEJBU8L9W6tiXJVyd7dYPdQ5bnkUY7U9gr8KOVB114992OnyTl7T+
 BtDsaGxYQwcHAhl+t27/3MmuZcbfqdbrExIXpNVhX5b8EZrZrMyeoIZhrGqiWeubyf/H
 43JHYGRs0vaA8Q9iMaK0pz9ybgc7ofhXlP0OpWK59qTk5j2zfX0eMt9eGQPhwlmc9nIo
 AE7A==
X-Gm-Message-State: AOAM532zpTcYBHX/NpbeSzAd13P+B986ZfeojFEBx8Hnp5u/SEJauMtG
 njTJjPdlFT1+msfpwN2g/LcCyKojAQW82ADhbhwDKG0oEPJmOGOAeGw7fT3IEWag1IqAYsEHd94
 GNEmpX2L83Sx6MPTGHWuQyvDleaFjrfzkK/LafJm43xMn9pfxHTwo7vY7BmfUrnzY
X-Received: by 2002:adf:80ca:: with SMTP id 68mr13851615wrl.528.1640030436871; 
 Mon, 20 Dec 2021 12:00:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwrFFCY1+mlnsGOZO45danGCX4zZgN0s8uJIfHiELUT+TgQT0KLKo8PdXzDAXBHrfF/n4Oj8Q==
X-Received: by 2002:adf:80ca:: with SMTP id 68mr13851591wrl.528.1640030436407; 
 Mon, 20 Dec 2021 12:00:36 -0800 (PST)
Received: from x1w.redhat.com (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id d2sm308591wmb.24.2021.12.20.12.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 12:00:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] block: Minor vhost-user-blk fixes
Date: Mon, 20 Dec 2021 21:00:32 +0100
Message-Id: <20211220200034.2233987-1-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.209,
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
Philippe Mathieu-Daud=C3=A9 (2):=0D
  qemu-storage-daemon: Add vhost-user-blk help=0D
  qapi/block: Restrict vhost-user-blk to CONFIG_VHOST_USER_BLK_SERVER=0D
=0D
 qapi/block-export.json               |  3 ++-=0D
 storage-daemon/qemu-storage-daemon.c | 13 +++++++++++++=0D
 2 files changed, 15 insertions(+), 1 deletion(-)=0D
=0D
--=20=0D
2.33.1=0D
=0D



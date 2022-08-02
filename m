Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E06A587B9A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 13:28:31 +0200 (CEST)
Received: from localhost ([::1]:33034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIq4c-0001ZH-8j
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 07:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oIq1K-0004Jy-Oh
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 07:25:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oIq1F-0007BS-VK
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 07:25:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659439495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=L3zD4A7tmJtCK/i64q2Vph9qXAUw9fW33Z/y7Frkur4=;
 b=dR1cHwlDcrEkLRiY/3D+VHFzH3MEBfIxmr2o86la635DCcfTUYxoUH3iBOLwNRt2R8MiF4
 TWt+AxGiiy07MyvhwrQaiMn26Xoqu1dUZwW2yVd/2DkfRVenha6duhAM0UfHsfX4nV6LhW
 pFJ5xWwed74npBY9bHv2supFw8icATo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-QFzzQGcQOdOBtZ7oZsDGSQ-1; Tue, 02 Aug 2022 07:24:51 -0400
X-MC-Unique: QFzzQGcQOdOBtZ7oZsDGSQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 85FD5801231;
 Tue,  2 Aug 2022 11:24:51 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C6992026D4C;
 Tue,  2 Aug 2022 11:24:50 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PATCH 0/2] vdpa: Merge all net_init_vhost_vdpa error goto
Date: Tue,  2 Aug 2022 13:24:45 +0200
Message-Id: <20220802112447.249436-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Few steps allocate new resources, and all of the allocated can be=0D
checked to avoid trying to free an invalid one.=0D
=0D
This series includes an already posted patch [1], because it must be applie=
d=0D
on top of that.=0D
=0D
[1] https://lists.nongnu.org/archive/html/qemu-devel/2022-08/msg00089.html=
=0D
=0D
Eugenio P=C3=A9rez (2):=0D
  vdpa: Fix file descriptor leak on get features error=0D
  vdpa: Merge all net_init_vhost_vdpa error goto=0D
=0D
 net/vhost-vdpa.c | 10 ++++------=0D
 1 file changed, 4 insertions(+), 6 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D



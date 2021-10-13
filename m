Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8033342C909
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 20:48:34 +0200 (CEST)
Received: from localhost ([::1]:35128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1majIn-0002xU-KM
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 14:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1maiyY-0004LD-8x
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 14:27:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1maiyW-0006p4-Ig
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 14:27:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634149655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0MyypYtqGI0oKUPIIA479PBgpreo2fmb2jmtJbJG6yY=;
 b=VO8Dinzicq8MluGvlhNoD+eztW8nKfHx8Nuj5v+njza778/YU82CwNdzEjHdbo512jPCfS
 bx+yWOpAZ10VTD6KV+zleKLY0AlRKYOIrTis2WgaLDTIms+do+IVsETXHngrNeNv72DcyR
 OqYjYpq79rghJvYUCosKoRTbMmkzib0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-GaVNL0uhPJGmwT5s25p7xA-1; Wed, 13 Oct 2021 14:27:32 -0400
X-MC-Unique: GaVNL0uhPJGmwT5s25p7xA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E2C0362F8;
 Wed, 13 Oct 2021 18:27:31 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.195.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 59C33641AA;
 Wed, 13 Oct 2021 18:27:17 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/1] util: Make some iova_tree functions parameters const
Date: Wed, 13 Oct 2021 20:27:12 +0200
Message-Id: <20211013182713.888753-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some guidelines misses I found while working on Shadow Virtqueue, that=0D
uses these functions at this moment.=0D
=0D
v2:=0D
* Add a missed const in iova_tree_find_address.=0D
=0D
Eugenio P=C3=A9rez (1):=0D
  util: Make some iova_tree parameters const=0D
=0D
 include/qemu/iova-tree.h |  8 ++++----=0D
 hw/i386/intel_iommu.c    |  2 +-=0D
 util/iova-tree.c         | 12 ++++++------=0D
 3 files changed, 11 insertions(+), 11 deletions(-)=0D
=0D
--=20=0D
2.27.0=0D
=0D



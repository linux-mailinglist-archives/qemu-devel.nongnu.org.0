Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A174B5A9F
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 20:43:50 +0100 (CET)
Received: from localhost ([::1]:40184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJhGH-0004td-J2
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 14:43:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nJh7W-0001zJ-TJ
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 14:34:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nJh7T-0003nr-2X
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 14:34:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644867276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WbZkGO9qyjq6RDpnrsDF29OORphhT1cLxLl0CsElxKg=;
 b=duHhQIBWqJITE1UkhKomraMITLjEMrUjostLrs/0hSbbI52T2JtBdpLLwVjgYdqfBcxxZm
 Cm17jPwh7TeNySxGZLs2QZrAB2xWXhsuZlBBvss5xk/q4zRp6f2zOo0K0aP1ywZo0iURHN
 FdpDaXOZODarPGsCHlJrgqr4YPAl1a8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-D54XxXb-PPms2SY-bxYDnA-1; Mon, 14 Feb 2022 14:34:33 -0500
X-MC-Unique: D54XxXb-PPms2SY-bxYDnA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C3122F25;
 Mon, 14 Feb 2022 19:34:32 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.195.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8AFF75F4EA;
 Mon, 14 Feb 2022 19:34:18 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/1] vdpa: Make ncs autofree
Date: Mon, 14 Feb 2022 20:34:14 +0100
Message-Id: <20220214193415.1606752-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-trivial@nongnu.org, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Trivial patch extracted from [1] series. It helps to simplify the memory=0D
management of the function when adding exit paths following the qemu=0D
guidelines.=0D
=0D
Thanks!=0D
=0D
[1] https://patchwork.kernel.org/project/qemu-devel/patch/20220121202733.40=
4989-30-eperezma@redhat.com/=0D
=0D
Eugenio P=C3=A9rez (1):=0D
  vdpa: Make ncs autofree=0D
=0D
 net/vhost-vdpa.c | 5 ++---=0D
 1 file changed, 2 insertions(+), 3 deletions(-)=0D
=0D
--=20=0D
2.27.0=0D
=0D



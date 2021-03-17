Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE0F33EDA0
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 10:57:58 +0100 (CET)
Received: from localhost ([::1]:48944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMSw9-0008I1-Tc
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 05:57:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMSuu-000751-Di
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 05:56:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMSur-0001a7-Q9
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 05:56:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615974997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=keKjcQHvJVFkAsUuLHCiwbgHiNumyxIfwXEx6h+0k8I=;
 b=SlDIZ65o4ZOjYj++1fPrIBAmJKl4QwrvbZSDlPDEEhelU0AOJeAU23oSzyGciEP0sq5yIA
 TziZK+Iww5JPHPmS1MGE/2mvoU9ZcXAYDsXnMgChUSE0bzegsd+XsrO7xwdnr62zn/0Cv/
 tSjMEgFmCnfKcNbK7GrSty3RhnlYzQM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-AlDO12C4MeyaYEzkenFAZQ-1; Wed, 17 Mar 2021 05:56:35 -0400
X-MC-Unique: AlDO12C4MeyaYEzkenFAZQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2941887A83E;
 Wed, 17 Mar 2021 09:56:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 911486F960;
 Wed, 17 Mar 2021 09:56:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9DF48180038B; Wed, 17 Mar 2021 10:56:22 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] s390x: modularize virtio-gpu-ccw
Date: Wed, 17 Mar 2021 10:56:19 +0100
Message-Id: <20210317095622.2839895-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Maybe not the most elegant but rather simple approach to the "parent=0D
object missing" problem: Use a symbol reference to make sure ccw modules=0D
load only in case ccw support is present.=0D
=0D
Also split the cpu changes to a separate patch.=0D
=0D
Gerd Hoffmann (3):=0D
  s390x: move S390_ADAPTER_SUPPRESSIBLE=0D
  s390x: add have_virtio_ccw=0D
  s390x: modularize virtio-gpu-ccw=0D
=0D
 hw/s390x/virtio-ccw.h        | 5 +++++=0D
 include/hw/s390x/css.h       | 7 -------=0D
 include/hw/s390x/s390_flic.h | 3 +++=0D
 target/s390x/cpu.h           | 9 ++++++---=0D
 hw/s390x/virtio-ccw-gpu.c    | 4 +++-=0D
 hw/s390x/virtio-ccw.c        | 2 ++=0D
 util/module.c                | 1 +=0D
 hw/s390x/meson.build         | 8 +++++++-=0D
 8 files changed, 27 insertions(+), 12 deletions(-)=0D
=0D
--=20=0D
2.30.2=0D
=0D



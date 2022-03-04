Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A38E4CD3E7
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 13:01:34 +0100 (CET)
Received: from localhost ([::1]:52594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ6ch-0008OI-LA
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 07:01:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQ6Yq-00065A-Pd
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 06:57:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQ6Ym-0006F0-R6
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 06:57:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646395043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oAqmDBTjaRZDUnkDOq0yosRHqiHAkhV7gg+zyWyYgHo=;
 b=hgRtg7glEVe6X6D9GzrRURmcCL37NmqWUG8HxVloCnkKrqjHvkv9Zi5ZdOaXyLsDvXVP9Y
 k2EGu2ye7GdCnnBvMMz6xEfVlsWBW1aeX3/HhT6b5XYt6JUhQe4Da6qJ6aMOc0M9e+d8D6
 fMg1qa4Q61Uy7ZFvJsLkfnD+mxEHDL0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-408-kMrRYze0NcSG3c-wx8kTow-1; Fri, 04 Mar 2022 06:57:20 -0500
X-MC-Unique: kMrRYze0NcSG3c-wx8kTow-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 480CD1006AA5;
 Fri,  4 Mar 2022 11:57:19 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BBB292B45E;
 Fri,  4 Mar 2022 11:56:58 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] softmmu: move and refactor -runas, -chroot and -daemonize
Date: Fri,  4 Mar 2022 11:56:53 +0000
Message-Id: <20220304115657.3177925-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 libvir-list@redhat.com, Stefan Weil <sw@weilnetz.de>,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This small series was motivated by my thoughts on the proposals in=0D
=0D
  https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg01135.html=0D
=0D
It demostrates the approach I mention there, and has the further=0D
benefit of untangling and isolating the implementation of UID=0D
changing, chrooting and daemonized, from the parsing of the=0D
corresponding command line options.=0D
=0D
Daniel P. Berrang=C3=A9 (4):=0D
  softmmu: remove deprecated --enable-fips option=0D
  os-posix: refactor code handling the -runas argument=0D
  os-posix: refactor code handling the -chroot argument=0D
  softmmu: move parsing of -runas, -chroot and -daemonize code=0D
=0D
 docs/about/deprecated.rst       |  12 --=0D
 docs/about/removed-features.rst |  11 ++=0D
 include/qemu/osdep.h            |   3 -=0D
 include/sysemu/os-posix.h       |   4 +-=0D
 include/sysemu/os-win32.h       |   1 -=0D
 os-posix.c                      | 222 ++++++++++----------------------=0D
 os-win32.c                      |   9 --=0D
 qemu-options.hx                 |  10 --=0D
 softmmu/vl.c                    |  76 ++++++++++-=0D
 ui/vnc.c                        |   7 -=0D
 util/osdep.c                    |  28 ----=0D
 11 files changed, 154 insertions(+), 229 deletions(-)=0D
=0D
--=20=0D
2.34.1=0D
=0D



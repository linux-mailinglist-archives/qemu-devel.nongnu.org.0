Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B4425C8FE
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 20:54:37 +0200 (CEST)
Received: from localhost ([::1]:57680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDuNX-0002ic-TE
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 14:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1kDuMa-0001T6-Ni
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 14:53:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1kDuMY-0005cE-KX
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 14:53:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599159212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tftXqpqFJsgRD5Fttp4qFkcw3VaDtN5iyL9jWo/SYtg=;
 b=CJ+s9AFt73Nrom1ECoIuADDk0GJrTYSjYB0ajUvI/rZFAdWBBV/HAzKpTj6tsOr05w2Yuf
 xGQCV9n4JmnXVc1aqZDdxt651/zZPAGJkWZe4jD0CBKkBB0yjTDFMmJd0v6MyNYU5peVWg
 sYIPSRFTErJ40YtXpBXIBx1LmBmRV4Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-bSo_MeBaOV6-q2fiDYQu-g-1; Thu, 03 Sep 2020 14:53:31 -0400
X-MC-Unique: bSo_MeBaOV6-q2fiDYQu-g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39FF610074AF
 for <qemu-devel@nongnu.org>; Thu,  3 Sep 2020 18:53:30 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-218.ams2.redhat.com
 [10.36.112.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 19381672C6;
 Thu,  3 Sep 2020 18:53:28 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] vhost-vdpa: improve parameters error management
Date: Thu,  3 Sep 2020 20:53:25 +0200
Message-Id: <20200903185327.774708-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 04:23:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cindy Lu <lulu@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If vhostdev is not provided QEMU crashes, and more generally=0D
vhost-vdpa doesn't explain why parameters are wrong.=0D
=0D
This series fixes that.=0D
=0D
Laurent Vivier (2):=0D
  vhost-vdpa: define and use default value for vhostdev=0D
  vhost-vdpa: improve error reporting=0D
=0D
 net/vhost-vdpa.c | 19 +++++++++++++++----=0D
 1 file changed, 15 insertions(+), 4 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D



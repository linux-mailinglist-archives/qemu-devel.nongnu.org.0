Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3952EB369
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 20:20:35 +0100 (CET)
Received: from localhost ([::1]:40072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwrsg-0002xY-Cd
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 14:20:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1kwrpr-0001fK-Jb
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 14:17:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1kwrpo-0005Uz-Ph
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 14:17:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609874252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Mggyw0zpQKGuqMOxFVS6d8isJ4NrhllqMqer+5joxlk=;
 b=BS1U7DLPWh2IfcyO3GUFY30bpi0VeEvppjYcZ5c5Q/Y55Stwp/bgLhXn1T+ZYTMXq2ImNu
 NeHgHiCF7bNi85X/S+wXNciCMsxhEhF+mxPFxDuX7wJR7SuWlzfskzLYYOEXx/SAfGg6sW
 ZwXa5K/rOT50s4XLm3V2FJMnsrPAbXg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-PbXiDBCdPESgMaj0hjcCpw-1; Tue, 05 Jan 2021 14:17:30 -0500
X-MC-Unique: PbXiDBCdPESgMaj0hjcCpw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83D138049CE
 for <qemu-devel@nongnu.org>; Tue,  5 Jan 2021 19:17:29 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-113-101.ams2.redhat.com
 [10.36.113.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7BCB361F5E;
 Tue,  5 Jan 2021 19:17:22 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] tracetool: fix log-stap format
Date: Tue,  5 Jan 2021 20:17:19 +0100
Message-Id: <20210105191721.120463-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The first patch fixes a problem I have introduced in vhost-vdpa=0D
traces by adding an unsupported format ("%llu").=0D
=0D
The second patch fixes a problem I've seen while I was checking=0D
the result of the first patch: %PRI formats are not decoded=0D
correctly and we can end with things like "0x%u" because=0D
the used format is always the one of the first format of the string.=0D
=0D
Laurent Vivier (2):=0D
  vhost-vdpa: fix "unsigned long long" error with stap=0D
  tracetool: fix "PRI" macro decoding=0D
=0D
 hw/virtio/trace-events               | 2 +-=0D
 hw/virtio/vhost-vdpa.c               | 4 ++--=0D
 scripts/tracetool/format/log_stap.py | 1 +=0D
 3 files changed, 4 insertions(+), 3 deletions(-)=0D
=0D
--=20=0D
2.29.2=0D
=0D



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D54F373ADA
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 14:14:56 +0200 (CEST)
Received: from localhost ([::1]:37094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leGQZ-0005ap-OS
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 08:14:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1leGOR-0004gg-RA
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:12:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1leGOQ-0003cg-A2
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:12:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620216761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MhLdIA24YDp7qI/d62LRo+jw/DctR/Lo/FTAz1cZilM=;
 b=UwJyfLipdTa4r3h6SLPn/Ykp5o/90ZcErz/k2NqRQxUaEEfHoYyTZCVAT5eYbcrBhU/dVU
 HzpTX9+W8B16CRsVjsBR7tHGab8O39Ejy/StNUCj11HkxYpIYxhDBdQLmKFetpEUoXPuBQ
 xfBfNdv1XssDvHNAaf5FZQKtr9q0qQo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-cB4AjuNyNL28G88D-WGH2w-1; Wed, 05 May 2021 08:12:39 -0400
X-MC-Unique: cB4AjuNyNL28G88D-WGH2w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81485107ACED
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 12:12:38 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-253.ams2.redhat.com
 [10.36.114.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 98E96620DE;
 Wed,  5 May 2021 12:12:37 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] net/tap: minor fixes to interaction with the bridge helper
Date: Wed,  5 May 2021 13:12:34 +0100
Message-Id: <20210505121236.532755-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU fails to report a good error message if the bridge helper exits=0D
with success code, but forgets to pass back an FD.=0D
=0D
There is also a minor portability problem impacting FreeBSD/NetBSD=0D
dealing with cmsg initialization.=0D
=0D
Daniel P. Berrang=C3=A9 (2):=0D
  net/tap: fix FreeBSD portability problem receiving TAP FD=0D
  net/tap: fix error reporting when bridge helper forgets to send an FD=0D
=0D
 net/tap.c | 34 +++++++++++++++++++++++-----------=0D
 1 file changed, 23 insertions(+), 11 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D



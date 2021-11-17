Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FAE454DCA
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 20:19:53 +0100 (CET)
Received: from localhost ([::1]:44412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnQTI-0005jO-5r
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 14:19:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mnQRD-0004sa-Im
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 14:17:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mnQRA-0005PE-AH
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 14:17:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637176658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Afpt2lmc0/NRegCWDbqKuHUU1nel6OTzoJv3xKFtNek=;
 b=BsIdG2lgXrXxpqLdmTc5XyQCGqUVd/Yt5oeaR8LPzl8SxtPZ3IZ+qH6Vafwsq5py1Lu631
 eK1ILkp5otTLx5zEbiCB0kfez7IkTJYZ3gO+3j9bLvJDy1STiTXUb6Z6fq1A22nwyEBDiv
 rVZCevhfMICsBjrzmZOdM4JPSTYxXCg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-283-7ra5i6MdM7GaJi1GolDSZA-1; Wed, 17 Nov 2021 14:17:37 -0500
X-MC-Unique: 7ra5i6MdM7GaJi1GolDSZA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49BC91808325;
 Wed, 17 Nov 2021 19:17:36 +0000 (UTC)
Received: from [172.30.41.16] (ovpn-113-228.phx2.redhat.com [10.3.113.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 264DB5D9DE;
 Wed, 17 Nov 2021 19:17:31 +0000 (UTC)
Subject: [PULL 0/1] VFIO fixes 2021-11-17 (for v6.2)
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 17 Nov 2021 12:17:31 -0700
Message-ID: <163717652748.2560806.10593927801828190496.stgit@omen>
User-Agent: StGit/1.0-8-g6af9-dirty
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: liangpeng10@huawei.com, alex.williamson@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 3bb87484e77d22cf4e580a78856529c982195d32:

  Merge tag 'pull-request-2021-11-17' of https://gitlab.com/thuth/qemu into staging (2021-11-17 12:35:51 +0100)

are available in the Git repository at:

  git://github.com/awilliam/qemu-vfio.git tags/vfio-fixes-20211117.0

for you to fetch changes up to f3bc3a73c908df15966e66f88d5a633bd42fd029:

  vfio: Fix memory leak of hostwin (2021-11-17 11:25:55 -0700)

----------------------------------------------------------------
VFIO fixes 2021-11-17

 * Fix hostwin memory leak (Peng Liang)

----------------------------------------------------------------
Peng Liang (1):
      vfio: Fix memory leak of hostwin

 hw/vfio/common.c | 8 ++++++++
 1 file changed, 8 insertions(+)




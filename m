Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B02E49C817
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 11:53:55 +0100 (CET)
Received: from localhost ([::1]:60612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCfw1-00005i-UR
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 05:53:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nCftk-0006PV-Mg
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 05:51:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nCfth-0004gq-V7
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 05:51:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643194284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2uNtUPv9GOwRBL+9TZ5aGbUTRwlpLoNG4nD96v0VQCU=;
 b=Pj4TdGZLmbmmT097V6TixZxFXdU3LvrzOtflWmXPbSDdHTTKulZJ427K95qyZ5WSLFeZG/
 J4tR5P+uCPacMEvvB7WnpSkv0au/U3Mx2NYnU4qde0RkgGV9U5+A1BR/WHRRSOMnwvZzjv
 lgcnfQC1hutZLVmwpVh7uuyp5tE50Q8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-oKUDYClJO1C_q8aqSo8q6g-1; Wed, 26 Jan 2022 05:51:20 -0500
X-MC-Unique: oKUDYClJO1C_q8aqSo8q6g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85178835B47;
 Wed, 26 Jan 2022 10:51:19 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.195.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E2601F305;
 Wed, 26 Jan 2022 10:51:17 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	shawtao1125@gmail.com,
	vgoyal@redhat.com
Subject: [PULL 0/1] virtiofs queue
Date: Wed, 26 Jan 2022 10:51:11 +0000
Message-Id: <20220126105112.28711-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: mszeredi@redhat.com, mcascell@redhat.com, slp@redhat.com,
 virtio-fs@redhat.com, stefanha@redhat.com, pj.pandit@yahoo.co.in
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The following changes since commit aeb0ae95b7f18c66158792641cb6ba0cde5789ab:

  Merge remote-tracking branch 'remotes/jsnow-gitlab/tags/python-pull-request' into staging (2022-01-22 12:03:22 +0000)

are available in the Git repository at:

  https://gitlab.com/dagrh/qemu.git tags/pull-virtiofs-20220126

for you to fetch changes up to 449e8171f96a6a944d1f3b7d3627ae059eae21ca:

  virtiofsd: Drop membership of all supplementary groups (CVE-2022-0358) (2022-01-26 10:32:05 +0000)

----------------------------------------------------------------
virtiofsd: Security fix

Fixes: CVE-2022-0358

----------------------------------------------------------------
Vivek Goyal (1):
      virtiofsd: Drop membership of all supplementary groups (CVE-2022-0358)

 tools/virtiofsd/passthrough_ll.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)



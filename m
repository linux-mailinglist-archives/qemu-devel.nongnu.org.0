Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C1F4A90BA
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 23:38:19 +0100 (CET)
Received: from localhost ([::1]:45454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFkk5-0004g9-OA
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 17:38:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nFkhK-00032p-KR
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 17:35:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nFkhH-0001Wl-Lj
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 17:35:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643927723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=duzIvngUOkB8hRtcA7dOFFg3NAreKqwc5Cv4JkWYUhk=;
 b=FEFZffo76CB/6ByhsmzMR4A4aEmu/XtwVgrcZIk8oB2Cw/QRnabAq2fpPW6FDPWJcyZjx4
 C9gt63PSl6GqL3OyHzi/FoPbSMF+EaikKPQjjSKsoMebZBA+6rTLB54wdYAaWRJ0Vttb+V
 jnHk0VRqOLkG5o19m1wM1mfe1s6vEVQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-231-81PI_as-M_CcOz9_bYrnSg-1; Thu, 03 Feb 2022 17:35:20 -0500
X-MC-Unique: 81PI_as-M_CcOz9_bYrnSg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A62E1091DA2;
 Thu,  3 Feb 2022 22:35:19 +0000 (UTC)
Received: from [172.30.41.16] (unknown [10.2.16.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2DCF41042A9C;
 Thu,  3 Feb 2022 22:35:18 +0000 (UTC)
Subject: [PULL 0/2] VFIO fixes 2022-02-03
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 03 Feb 2022 15:35:17 -0700
Message-ID: <164392758602.1683127.4327439310436541025.stgit@omen>
User-Agent: StGit/1.0-8-g6af9-dirty
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
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
Cc: Eric Auger <eric.auger@redhat.com>,
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 8f3e5ce773c62bb5c4a847f3a9a5c98bbb3b359f:

  Merge remote-tracking branch 'remotes/hdeller/tags/hppa-updates-pull-request' into staging (2022-02-02 19:54:30 +0000)

are available in the Git repository at:

  git://github.com/awilliam/qemu-vfio.git tags/vfio-fixes-20220203.0

for you to fetch changes up to 36fe5d5836c8d5d928ef6d34e999d6991a2f732e:

  hw/vfio/common: Silence ram device offset alignment error traces (2022-02-03 15:05:05 -0700)

----------------------------------------------------------------
VFIO fixes 2022-02-03

 * Fix alignment warnings when using TPM CRB with vfio-pci devices
   (Eric Auger & Philippe Mathieu-Daudé)

----------------------------------------------------------------
Eric Auger (2):
      tpm: CRB: Use ram_device for "tpm-crb-cmd" region
      hw/vfio/common: Silence ram device offset alignment error traces

 hw/tpm/tpm_crb.c     | 22 ++++++++++++++++++++--
 hw/vfio/common.c     | 15 ++++++++++++++-
 hw/vfio/trace-events |  1 +
 3 files changed, 35 insertions(+), 3 deletions(-)



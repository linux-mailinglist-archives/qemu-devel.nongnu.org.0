Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B99C2DB3DF
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 19:39:09 +0100 (CET)
Received: from localhost ([::1]:59594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpFE4-00076A-G4
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 13:39:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kpFBr-0005j0-3M
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 13:36:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kpFBp-0006vY-Cn
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 13:36:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608057407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=crJYZz0iGJPI9L2KP3pdPn7qz6mJ6QZz8je0LEd/8OQ=;
 b=NHvy6r1gbPF6el/x7RCUJEQVjqBgWjLo5b6mokNtDjV9o87VKjc8srbpYaIGtHHn4Nm9fW
 5pvFguJeOu152S7tLE71A1o5+TgNIJzHWqMBpY8mcv+SunFQAJyWrViM5/e4W78eXl1ZO4
 V2DHtQw6RfZFXnSR/xo8QAZj4VKtVzo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-iiWUadUUNkisW90R0VZ77Q-1; Tue, 15 Dec 2020 13:36:45 -0500
X-MC-Unique: iiWUadUUNkisW90R0VZ77Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74CB1425EE;
 Tue, 15 Dec 2020 18:36:27 +0000 (UTC)
Received: from thuth.com (ovpn-112-194.ams2.redhat.com [10.36.112.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7F9760864;
 Tue, 15 Dec 2020 18:36:25 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v2 0/3] tests/acceptance: Test virtio-rng and -balloon on s390x
Date: Tue, 15 Dec 2020 19:36:20 +0100
Message-Id: <20201215183623.110128-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add two more simple tests to check that virtio-rng and virtio-balloon
are at least (very) basically working on s390x.

Based-on: 20201204121450.120730-1-cohuck@redhat.com

v2:
 - Cosmetic changes according to Cornelia's suggestions
 - Added Reviewed-bys from Wainer and Willian

Thomas Huth (3):
  tests/acceptance: Extract the code to clear dmesg and wait for CRW
    reports
  tests/acceptance: Test virtio-rng on s390 via /dev/hwrng
  tests/acceptance: Test the virtio-balloon device on s390x

 tests/acceptance/machine_s390_ccw_virtio.py | 59 +++++++++++++++------
 1 file changed, 43 insertions(+), 16 deletions(-)

-- 
2.27.0



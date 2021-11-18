Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0050A455E58
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 15:37:55 +0100 (CET)
Received: from localhost ([::1]:34878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mniXx-0006fK-SD
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 09:37:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mniWA-0004Es-SS
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 09:36:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mniW9-0004ky-Dr
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 09:36:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637246160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Bh5NlB/ElVjVX7KWnuD3enuO7TtP/X5msxhKL9q3cI4=;
 b=CzCPjT7vVfD1VfOMueZIU0CWRYCATqKQSlvuZ8JyifX7pKJTQCBcKsqrMTlixYIHIWcLq1
 o4GhT4vtO5EX27zaw69MIsBIAhuqfRbWATvB6EZ6DYdEcamwE1d6k47qv/c5fJmZIlCRsT
 0Sd+FzUOncwfL0JWgBDHiJrpSvSnyDg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-W2zVEGbLPhyaJdcoK_vQJA-1; Thu, 18 Nov 2021 09:35:59 -0500
X-MC-Unique: W2zVEGbLPhyaJdcoK_vQJA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94246875109;
 Thu, 18 Nov 2021 14:35:58 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD70460657;
 Thu, 18 Nov 2021 14:35:55 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] block: misc fixes & improvements for SSH block driver key
 fingerprints
Date: Thu, 18 Nov 2021 14:35:44 +0000
Message-Id: <20211118143547.2045554-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 * The docs were pointing people towards the obsolete and insecure=0D
   MD5 fingerprint config instead of preferred sha256=0D
 * The sha256 fingerprint handling wasn't wired up into the legacy=0D
   CLI parsing code=0D
 * Finger print check failures were hard to diagnose due to limited=0D
   info reported on error.=0D
=0D
Daniel P. Berrang=C3=A9 (3):=0D
  block: better document SSH host key fingerprint checking=0D
  block: support sha256 fingerprint with pre-blockdev options=0D
  block: print the server key type and fingerprint on failure=0D
=0D
 block/ssh.c                            | 42 +++++++++++++++++++++-----=0D
 docs/system/qemu-block-drivers.rst.inc | 30 +++++++++++++++---=0D
 2 files changed, 61 insertions(+), 11 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D



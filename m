Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A69E30FC46
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 20:13:55 +0100 (CET)
Received: from localhost ([::1]:40776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7k4g-0006kS-92
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 14:13:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7jTk-0002XN-Q8
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 13:35:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7jTQ-0004T5-7f
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 13:35:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612463719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+76274dK4ou09nFcA1FZOsxSLKy+6Y1HyTu06G5arCk=;
 b=SrdZdP7Mhoix41Pb6u+JpuSyHADYgII6Wt0RqznR7PNnTpLtPZXgZkjJ3P8i7ynOY6r62e
 tf6b7sjA/3mQJfQtPyFOQz9fiaL6FHCNJ8wzYxBl0OLZAorSy1Rc5QP+Eo91CAqyfWZn9G
 LizFt/B9Uxv3O+g9toOCppKB611TFDs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-a0m_4rotOV22IB_7LVs1bQ-1; Thu, 04 Feb 2021 13:35:14 -0500
X-MC-Unique: a0m_4rotOV22IB_7LVs1bQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BEC4715720;
 Thu,  4 Feb 2021 18:35:13 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-21.ams2.redhat.com
 [10.36.114.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DAEC970483;
 Thu,  4 Feb 2021 18:35:06 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, virtio-fs@redhat.com, stefanha@redhat.com,
 groug@kaod.org, qemu-stable@nongnu.org
Subject: [PULL 0/5] virtiofs queue: Security fix
Date: Thu,  4 Feb 2021 18:34:34 +0000
Message-Id: <20210204183439.546918-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The following changes since commit 1ba089f2255bfdb071be3ce6ac6c3069e8012179:

  Merge remote-tracking branch 'remotes/armbru/tags/pull-qmp-2021-02-04' into staging (2021-02-04 14:15:35 +0000)

are available in the Git repository at:

  https://gitlab.com/dagrh/qemu.git tags/pull-virtiofs-20210204

for you to fetch changes up to cf269ff8032392bbdd700e7bfd21823ad9eee3a9:

  virtiofsd: Add restart_syscall to the seccomp whitelist (2021-02-04 17:50:08 +0000)

----------------------------------------------------------------
virtiofs: Security pull 2021-02-04

This contains an important CVE fix for virtiofsd,
together with two fixes for over-eager seccomp rules.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

----------------------------------------------------------------
Greg Kurz (2):
      virtiofsd: Add _llseek to the seccomp whitelist
      virtiofsd: Add restart_syscall to the seccomp whitelist

Stefan Hajnoczi (3):
      virtiofsd: extract lo_do_open() from lo_open()
      virtiofsd: optionally return inode pointer from lo_do_lookup()
      virtiofsd: prevent opening of special files (CVE-2020-35517)

 tools/virtiofsd/passthrough_ll.c      | 224 ++++++++++++++++++++++------------
 tools/virtiofsd/passthrough_seccomp.c |   2 +
 2 files changed, 150 insertions(+), 76 deletions(-)



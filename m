Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF82345AB7
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 10:24:19 +0100 (CET)
Received: from localhost ([::1]:39930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOdGq-0002ws-GN
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 05:24:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lOdF1-0001CU-6A
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 05:22:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lOdEx-0007cE-HL
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 05:22:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616491337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ULfXwY3kfRvW8YZR9tu8NOOWDVuvYIqUxRRdf72IZWI=;
 b=YyTbFyPZ+TthyYvc/ZHnCvNxYY4ATZEI4bQRXViIxUwoDTKBKD2Mj/xjwtAocRufps4oE4
 XpJJyxOcQk8ARBZqJKa5THib0Cc+E2LZWjkeinfPsC1W8EG+5I1Z5/kV08SAZFCGhgNZN/
 XPbFoYTPjJvq76MSbaasDhIXytCy+ys=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-qMgDRRVvN0GXOCzJVhscgQ-1; Tue, 23 Mar 2021 05:22:14 -0400
X-MC-Unique: qMgDRRVvN0GXOCzJVhscgQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AEEC7107ACCA
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 09:22:13 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-113-239.ams2.redhat.com
 [10.36.113.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8DD59CA0;
 Tue, 23 Mar 2021 09:22:12 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] optionrom/pvh: use memcmp() to find the RSDP signature
Date: Tue, 23 Mar 2021 10:22:09 +0100
Message-Id: <20210323092211.44597-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In this version I added a memcmp() implementation. In v1 I tried with
__builtin_memcmp() but CI failed with clang [1] and gcc 4.8.5.

v2:
- added patch 1 to provide a memcmp() implementation
- made 'rsdp_signature' static const [Phil]
- uses memcmp() instead of __builtin_memcmp()
- added pvh.bin binary with the changes applied

v1: https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg07425.html

Thanks,
Stefano

[1] https://gitlab.com/sgarzarella/qemu/-/jobs/1117036403#L385

Stefano Garzarella (2):
  optionrom: add memcmp() implementation
  optionrom/pvh: use memcmp() to find the RSDP signature

 pc-bios/optionrom/optrom.h   |  15 +++++++++++++++
 pc-bios/optionrom/pvh_main.c |  12 +++++++-----
 pc-bios/pvh.bin              | Bin 1536 -> 1536 bytes
 3 files changed, 22 insertions(+), 5 deletions(-)

-- 
2.30.2



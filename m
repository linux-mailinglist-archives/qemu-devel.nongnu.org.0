Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7AB5A9AFA
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 16:56:16 +0200 (CEST)
Received: from localhost ([::1]:47824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTlc7-0005RA-W8
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 10:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1oTlTB-0001Bt-DS
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 10:47:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1oTlGJ-0006w6-5Q
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 10:33:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662042819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HI9cIilMHbO+J7DvfPXmG2zWGatXz6HBT8KqVXDbYD8=;
 b=fBi+mnkvUE8JAkQ3D2Adu4DKuSYQ2XM7/Qmh4bXa6RdQT2ycP8hEtxxvq8n3OuzJB5eSjo
 9QvNsVdwd+V4A0i0iAITHil0E7m7eE8i+hSYPC7qn25ZPQP4TGth4xxB3bdWEv8XWvEQG3
 bJuFqcLjUYFynJbL1MHuXRxMwHS6I1A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-90-z4B7CRzKNmenSXJgHiIRHQ-1; Thu, 01 Sep 2022 10:32:26 -0400
X-MC-Unique: z4B7CRzKNmenSXJgHiIRHQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 467423C10228;
 Thu,  1 Sep 2022 14:32:26 +0000 (UTC)
Received: from loop.redhat.com (unknown [10.35.206.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 299FE403162;
 Thu,  1 Sep 2022 14:32:24 +0000 (UTC)
From: Nir Soffer <nsoffer@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Nir Soffer <nsoffer@redhat.com>
Subject: [PATCH 0/3] Add qemu-img checksum command using blkhash
Date: Thu,  1 Sep 2022 17:32:20 +0300
Message-Id: <20220901143223.201295-1-nsoffer@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since blkhash is available only via copr now, the new command is added as
optional feature, built only if blkhash-devel package is installed.

Nir Soffer (3):
  qemu-img: Add checksum command
  iotests: Test qemu-img checksum
  qemu-img: Speed up checksum

 docs/tools/qemu-img.rst                       |  22 +
 meson.build                                   |  10 +-
 meson_options.txt                             |   2 +
 qemu-img-cmds.hx                              |   8 +
 qemu-img.c                                    | 388 ++++++++++++++++++
 tests/qemu-iotests/tests/qemu-img-checksum    | 149 +++++++
 .../qemu-iotests/tests/qemu-img-checksum.out  |  74 ++++
 7 files changed, 652 insertions(+), 1 deletion(-)
 create mode 100755 tests/qemu-iotests/tests/qemu-img-checksum
 create mode 100644 tests/qemu-iotests/tests/qemu-img-checksum.out

-- 
2.37.2



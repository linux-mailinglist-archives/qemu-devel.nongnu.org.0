Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6F34D8E5D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 21:39:58 +0100 (CET)
Received: from localhost ([::1]:38984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTrTx-0001Qp-Ve
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 16:39:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nTrSY-0007T9-19
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 16:38:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nTrSV-0001yG-8V
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 16:38:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647290306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=j5TRkpO2f5yQsS+SvdhSp/uqbJs6SGASU8oNY2vYZLg=;
 b=G+h+al0tO7U8YNybGRDS3qJBJgf45e27Vszy4Vd8Jr5HXGtdG7SijbPEaDrXkZWZCdxIYN
 uBuqBeXRMQ+pa7BnJP/0kQad8VCwJLkqi64CnXOJRMXDuAE8dudREd8ZyEz9KhLpS4bgwI
 p4+abx6ifTK2W5zPOKRaBDdFUJRVfkI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513-GLdeVSBhMMW1-Chn8wx0TQ-1; Mon, 14 Mar 2022 16:38:23 -0400
X-MC-Unique: GLdeVSBhMMW1-Chn8wx0TQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC4EC3806736;
 Mon, 14 Mar 2022 20:38:19 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.22.17.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 62D2C1410DD5;
 Mon, 14 Mar 2022 20:38:19 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/3] nbd: MULTI_CONN for shared writable exports
Date: Mon, 14 Mar 2022 15:38:15 -0500
Message-Id: <20220314203818.3681277-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: nsoffer@redhat.com, v.sementsov-og@ya.ru, rjones@redhat.com,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2 was here:
https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg03314.html

Since then:
- expose the knob through 'qemu-nbd -m on|off|auto'
- reuse QAPI OnOffAuto type instead of rolling my own
- rewrite the iotest from bash into python (thanks: Nir, Vladimir)
- split out easy preliminary fixes (patches 1 and 2 are new)

Given that this is a new feature, it probably needs to be 7.1 material.

Eric Blake (3):
  docs: Consistent typography for options of qemu-nbd
  qemu-nbd: Pass max connections to blockdev layer
  nbd/server: Allow MULTI_CONN for shared writable exports

 docs/interop/nbd.txt                       |   1 +
 docs/tools/qemu-nbd.rst                    |  26 ++--
 qapi/block-export.json                     |  19 ++-
 include/block/nbd.h                        |   5 +-
 blockdev-nbd.c                             |  13 +-
 nbd/server.c                               |  27 +++-
 qemu-nbd.c                                 |  22 ++-
 MAINTAINERS                                |   1 +
 tests/qemu-iotests/tests/nbd-multiconn     | 157 +++++++++++++++++++++
 tests/qemu-iotests/tests/nbd-multiconn.out |   5 +
 10 files changed, 252 insertions(+), 24 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/nbd-multiconn
 create mode 100644 tests/qemu-iotests/tests/nbd-multiconn.out

-- 
2.35.1



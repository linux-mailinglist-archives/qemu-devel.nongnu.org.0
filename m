Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8C71F1EF9
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jun 2020 20:29:06 +0200 (CEST)
Received: from localhost ([::1]:39708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jiMW9-0003xn-Ci
	for lists+qemu-devel@lfdr.de; Mon, 08 Jun 2020 14:29:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jiMTt-0002YR-Rf
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 14:26:45 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:45570
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jiMTs-0008I8-9f
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 14:26:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591640802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Vcjq0Pw1eoP/Ximgm6CtyJv6pOGSZQhEif2mR2moLhM=;
 b=ZeMMdP75Hv4T0PMCnQa0Sc0OPLLq6b9lbYqop5Xq/DKoPfROCt5y8r3KTqeBw/NFB18yow
 UqD99ZL+f7TL8tzA9LsGizbg4jU2K/OOdx2VK0z9sK+zaCk4AvjrlTBVmuQ0cXsDJ4IjLf
 fSzkVolGvlSbhcuE9XhMM3IyZHuTNII=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-wt8ObxgGPHKio39VmXdXvQ-1; Mon, 08 Jun 2020 14:26:40 -0400
X-MC-Unique: wt8ObxgGPHKio39VmXdXvQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2FD4800053;
 Mon,  8 Jun 2020 18:26:39 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-22.phx2.redhat.com [10.3.113.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 574D6768BB;
 Mon,  8 Jun 2020 18:26:39 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] Fix NBD CVE-2020-10761
Date: Mon,  8 Jun 2020 13:26:36 -0500
Message-Id: <20200608182638.3256473-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 05:40:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: xuwei@redhat.com, vsementsov@virtuozzo.com, qemu-stable@nongnu.org,
 qemu-block@nongnu.org, ppandit@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In qemu 4.2, I accidentally introduced the ability for an NBD client
obeying the specification to kill qemu as NBD server with an assertion
failure when the client requests an unusually long export name, as a
regression from the intended graceful server error message back to the
client.  Given that the DoS security hole can be mitigated by
requiring TLS (and a client with TLS credentials is less likely to
play such games), the plan is to make the issue public today and send
a pull request through my NBD tree on Tuesday.

We may still want to revisit whether the block layer caps display
names to 4095 bytes, or whether it should track a malloc'd name even
when that name exceeds 4k.

Eric Blake (2):
  nbd/server: Avoid long error message assertions CVE-2020-10761
  block: Call attention to truncation of long NBD exports

 block.c                    |  7 +++++--
 block/nbd.c                | 21 +++++++++++++--------
 nbd/server.c               | 28 +++++++++++++++++++++++++---
 tests/qemu-iotests/143     |  4 ++++
 tests/qemu-iotests/143.out |  2 ++
 5 files changed, 49 insertions(+), 13 deletions(-)

-- 
2.27.0



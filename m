Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 282AE31A379
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 18:24:02 +0100 (CET)
Received: from localhost ([::1]:37190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAcAi-0007zl-EU
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 12:24:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lAc7W-0005ph-K1
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 12:20:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lAc7S-0001xZ-8h
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 12:20:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613150436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1SutVegI9LJBRkh/3Gixw+N1c/u+omu2iPZYhd+pg1I=;
 b=U1rKF6urN3eixgULLg0XysqLX8K2gMISeD7MmzLIpFtJQQPAfmNIYu8GoCMuSVYj/rs0gO
 +/DXC/wcOA1N9YnufMtXESdhKwd79NHVoPsSK/XqewajFTu7CEJ+4YVrSZ3eAtZKL0VxQ7
 AAt/nFDwZ9Rk+HfNA4xjKAc5CS6Dg+A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-myVeZseZMJuBlfTS6vTBoQ-1; Fri, 12 Feb 2021 12:20:33 -0500
X-MC-Unique: myVeZseZMJuBlfTS6vTBoQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95696107ACC7
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 17:20:32 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-163.ams2.redhat.com [10.36.112.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C246E1B5FB;
 Fri, 12 Feb 2021 17:20:31 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] monitor: Shutdown fixes
Date: Fri, 12 Feb 2021 18:20:26 +0100
Message-Id: <20210212172028.288825-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This fixes the bug(s) that Markus reported here:
https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg07719.html

Kevin Wolf (2):
  monitor: Fix assertion failure on shutdown
  monitor/qmp: Stop processing requests when shutdown is requested

 monitor/monitor.c | 25 +++++++++++++++----------
 monitor/qmp.c     |  5 +++++
 2 files changed, 20 insertions(+), 10 deletions(-)

-- 
2.29.2



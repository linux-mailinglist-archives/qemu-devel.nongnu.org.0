Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 932F43D2242
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 12:47:33 +0200 (CEST)
Received: from localhost ([::1]:50846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6WEm-0003o2-29
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 06:47:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1m6WDL-0002D8-3o
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 06:46:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1m6WDH-0002Fl-NE
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 06:46:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626950758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JEVbe1IxCOK+503Y9bUmDTb805WumH1bGgS2kbjlVPc=;
 b=Q6WxpcIt+WJjzIXec1cVGCSLyGNL40KRr3zyHfpj5652s28QZJUehdsxLvMXH5aw7R5mua
 KEqoW70wpQ66niBDy9jwFnVfXGg/5hc9UY8dLj72Qa6VxNMGuqfUyflquycO3kEtdfrbzR
 hsOHwSl+B8MqgxrHpqtuy+jr1G80Bro=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-_m6F254QMhOCw_8Y13pvVw-1; Thu, 22 Jul 2021 06:45:56 -0400
X-MC-Unique: _m6F254QMhOCw_8Y13pvVw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A86831932481;
 Thu, 22 Jul 2021 10:45:55 +0000 (UTC)
Received: from pick.home.annexia.org (ovpn-114-133.ams2.redhat.com
 [10.36.114.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9089E797C0;
 Thu, 22 Jul 2021 10:45:54 +0000 (UTC)
From: "Richard W.M. Jones" <rjones@redhat.com>
To: vsementsov@virtuozzo.com
Subject: [PATCH] nbd/server: Suppress Broken pipe errors on abrupt
 disconnection
Date: Thu, 22 Jul 2021 11:45:51 +0100
Message-Id: <20210722104552.2351167-1-rjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
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
Cc: eblake@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This simple patch suppresses a warning message from qemu-nbd when a
client abruptly disconnects.  There is a way to work around this in
the client (by shutting down the connection properly).  Nevertheless
the "Broken pipe" error seems unnecessary to me as it does not convey
any useful information and might be used to fill up logs.

Rich.




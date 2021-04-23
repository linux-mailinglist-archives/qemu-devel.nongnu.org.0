Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F59F369642
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 17:34:48 +0200 (CEST)
Received: from localhost ([::1]:33892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZxpP-0002Z7-BB
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 11:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbrivio@redhat.com>)
 id 1lZxm3-0007yS-Gq
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 11:31:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbrivio@redhat.com>)
 id 1lZxm1-0000hF-TA
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 11:31:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619191877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Tv5vEFhmRF6oukFeUGYhIRVx7o2CgwzHMBWaqD+XNEw=;
 b=h/B9eme6JVdWUE2Qa0GpvmUvvu1crdPJP1/fm5W8qpdqGntzoRukGQmcF00vD4UbqzvYYy
 SaQOGSGXDyGczDKlRuoCpEU6syjAlLszWD+9OrvyCsV/O5v0M7s1khfXwD967H7ZFOwktl
 Fvzzg5+S8L+nHpgyQYEmrVStTeXGrew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-9ZZkyPGhMTSQ4tYZEXuUFA-1; Fri, 23 Apr 2021 11:31:04 -0400
X-MC-Unique: 9ZZkyPGhMTSQ4tYZEXuUFA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C11488030CA;
 Fri, 23 Apr 2021 15:31:03 +0000 (UTC)
Received: from epycfail.redhat.com (unknown [10.36.110.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 89F76620DE;
 Fri, 23 Apr 2021 15:30:58 +0000 (UTC)
From: Stefano Brivio <sbrivio@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] Support for AF_UNIX -netdev socket and a small fix
Date: Fri, 23 Apr 2021 17:30:43 +0200
Message-Id: <cover.1619190878.git.sbrivio@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sbrivio@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sbrivio@redhat.com;
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
Cc: Ralph Schmieder <ralph.schmieder@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laine Stump <laine@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Patch 1/2 introduces support for AF_UNIX stream-oriented socket to
be passed as -netdev, and patch 2/2 fixes a minor issue I found while
trying to connect to an invalid path.

Stefano Brivio (2):
  net: Allow also UNIX domain sockets to be used as -netdev socket
  net: Don't ignore EINVAL on netdev socket connection

 net/socket.c    | 109 +++++++++++++++++++++++++++++++++++++++---------
 qemu-options.hx |  12 +++---
 2 files changed, 95 insertions(+), 26 deletions(-)

-- 
2.29.2



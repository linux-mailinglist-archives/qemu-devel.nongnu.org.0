Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6BC2F1C1C
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 18:19:33 +0100 (CET)
Received: from localhost ([::1]:56814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz0qq-00021y-I1
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 12:19:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1kz0hS-00026k-Tm
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:09:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1kz0hQ-0006AP-ML
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:09:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610384987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HpQRGa889XesvuXauRORigdCiSS3dux83aA9Wkriv5o=;
 b=dGjEHrkf5010N0FTxqb2PGQ1XhUFooS0/FTr+2XcqOtYj1fK8jDN7TWYA77muOE6DfbjuQ
 KkIehNOQr+8AI1QISDxDClRRim0yhVPM4Zk+3e131xjh2The1JA4z1bbehgC0w16zbiFdq
 9ZecZgjVDzIpRTY3WfuPJ6AyEwbys9Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-gupCcRsfPNC_X98Mcu4bfg-1; Mon, 11 Jan 2021 12:09:44 -0500
X-MC-Unique: gupCcRsfPNC_X98Mcu4bfg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FD50BBEE2
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 17:09:43 +0000 (UTC)
Received: from workimage2020.rezanina.moe.rezanina.moe (unknown [10.40.192.93])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 604A91972B
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 17:09:42 +0000 (UTC)
From: Miroslav Rezanina <mrezanin@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] Fixing several GCC 11 warnings
Date: Mon, 11 Jan 2021 18:09:39 +0100
Message-Id: <cover.1610384501.git.mrezanin@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mrezanin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mrezanin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Compiling qemu using GCC 11 we got several new warnings. To allow
build with --enable-werror, we need to solve issues generating these
warnings.

Signed-of-by: Miroslav Rezanina <mrezanin@redhat.com>

v2:
 - Patch 2 rewrite to use strpadcpy
 - removed Patch 3 (different version sent by Philippe Mathieu-Daudé)

Miroslav Rezanina (2):
  Fix net.c warning on GCC 11
  s390x: Fix vm name copy length

 net/eth.c                  |  3 +++
 target/s390x/kvm.c         | 12 +++++-------
 target/s390x/misc_helper.c |  7 +++++--
 3 files changed, 13 insertions(+), 9 deletions(-)

-- 
2.18.4



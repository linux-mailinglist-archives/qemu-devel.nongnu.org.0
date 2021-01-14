Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C07F2F5B0D
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 08:09:35 +0100 (CET)
Received: from localhost ([::1]:41282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzwlB-0001Mg-RJ
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 02:09:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1kzwjU-0008RI-BO
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 02:07:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1kzwjQ-00043D-Ps
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 02:07:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610608061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iDvv8FY7PQsMLpwDIAhzpyGwMl6Ib6JBfDLUsf7K4uo=;
 b=I3n39whUXAsYOH5PP78bUw7i5eMQHNr8EX8ISzOQm2si8qU30EO0mUWPirjHYC5kgiyoRD
 wxrzjd6eLCsKzVJLih7osy/gig4tqZRTdYZzU1vXplyPBbyyVWprCpFf6WOAZJt/VEtynn
 5Yt6fy6yeft+bHi0vsZ/tcYr05JS2PY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-7In_NOIHNBG9vpMd6CZ2yA-1; Thu, 14 Jan 2021 02:07:40 -0500
X-MC-Unique: 7In_NOIHNBG9vpMd6CZ2yA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D959580667D
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 07:07:38 +0000 (UTC)
Received: from workimage2020.rezanina.moe.rezanina.moe (unknown [10.40.195.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40F32272A4
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 07:07:37 +0000 (UTC)
From: Miroslav Rezanina <mrezanin@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] Fixing several GCC 11 warnings
Date: Thu, 14 Jan 2021 08:07:34 +0100
Message-Id: <cover.1610607906.git.mrezanin@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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

v3:
 - Fixed patch commit logs (no cod changes)

Miroslav Rezanina (2):
  Fix net.c warning on GCC 11
  s390x: Use strpadcpy for copying vm name

 net/eth.c                  |  3 +++
 target/s390x/kvm.c         | 12 +++++-------
 target/s390x/misc_helper.c |  7 +++++--
 3 files changed, 13 insertions(+), 9 deletions(-)

-- 
2.18.4



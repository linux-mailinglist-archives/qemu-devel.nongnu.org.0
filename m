Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 964BF3F20BA
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 21:39:44 +0200 (CEST)
Received: from localhost ([::1]:48876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGnt9-00038K-LX
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 15:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mGnrb-0000nc-Eh
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 15:38:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mGnrY-0008UK-Ov
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 15:38:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629401883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rpuC6Xjmm4QF0ooJ2UtZemFh01a3Pg6isfx6cE/aTRw=;
 b=H9b7Y33l0VjxKNWcLjtOBppY2v2Y/2B0PNcNIC/OA2YCqtmzjfipUgUGj7AuOpGaGSafD3
 +Up0JkL3TJGDI5CX2JIilgLcnzDKkff8M9uSwrpKJ4ic5OamCNy1ItybF7Slw/6qZU2Ec8
 69A5Qz180XRsspj37mRnBXcg6z6kv8o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-o0h-9jRYNFuhgX8DrhevcA-1; Thu, 19 Aug 2021 15:38:02 -0400
X-MC-Unique: o0h-9jRYNFuhgX8DrhevcA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FE2518C8C0C;
 Thu, 19 Aug 2021 19:38:01 +0000 (UTC)
Received: from gator.home (unknown [10.40.192.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 202ED1970F;
 Thu, 19 Aug 2021 19:37:58 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH 0/4] target/arm/cpu: Introduce sve_vq_supported bitmap
Date: Thu, 19 Aug 2021 21:37:54 +0200
Message-Id: <20210819193758.149660-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 ishii.shuuichir@fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While reviewing the new A64FX CPU type it became clear that CPU
types should be able to specify which SVE vector lengths are
supported. This series adds a new bitmap member to ARMCPU and
modifies arm_cpu_sve_finalize() to validate inputs against it.
So far we only need to set the bitmap for the 'max' CPU type
though and, since it supports all vector lengths, we just fill
the whole thing.

This series was inspired by Richard Henderson's suggestion to
replace arm_cpu_sve_finalize's kvm_supported bitmap with something
that could be shared with TCG.

So far I've only lightly tested this. I'll do more testing and
report back later. I'd also be happy to get test results from
others.

Thanks,
drew

Andrew Jones (4):
  target/arm/cpu: Introduce sve_vq_supported bitmap
  target/arm/kvm64: Ensure sve vls map is completely clear
  target/arm/cpu64: Replace kvm_supported with sve_vq_supported
  target/arm/cpu64: Validate sve vector lengths are supported

 target/arm/cpu.h   |   4 ++
 target/arm/cpu64.c | 118 +++++++++++++++++++++------------------------
 target/arm/kvm64.c |   2 +-
 3 files changed, 61 insertions(+), 63 deletions(-)

-- 
2.31.1



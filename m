Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 086066187A3
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 19:36:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqf4g-0006Re-Ra; Thu, 03 Nov 2022 14:36:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oqf4b-0006Qy-Mw
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 14:36:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oqf4Z-0005gl-Rm
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 14:36:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667500573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mP+hs/+3nDgklUncZuE539ElL9gVkZig7ScD+RonTU0=;
 b=hIiUB1FmOAvEJzvqD+23mORMuYzyXUiRwhXIdI4R+me0+jZZKhbzXq2AgDkfT2ESS0XtML
 Bur9F4yX0QaSopRnk284Z3vid1TFxUQp4OQspW8wVe78JcVQaorSsemsquTvbJIHEbnEgT
 wwH9rGWvJsLRPiCoiXsipH+1aHr5wY8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-vvda85UXPlGLvelr0hRrXg-1; Thu, 03 Nov 2022 14:36:12 -0400
X-MC-Unique: vvda85UXPlGLvelr0hRrXg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5256D1C0A104;
 Thu,  3 Nov 2022 18:36:12 +0000 (UTC)
Received: from localhost (unknown [10.39.194.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B5CFD1121331;
 Thu,  3 Nov 2022 18:36:11 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, nsoffer@redhat.com,
 <qemu-block@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH v2 0/2] file-posix: alignment probing improvements
Date: Thu,  3 Nov 2022 14:36:07 -0400
Message-Id: <20221103183609.363027-1-stefanha@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

v2:
- Make sure that XFS_IOC_DIOINFO takes priority over logical blocksize [Eric Biggers]
- Included a link to Eric's linux-block regression email

These patches fix alignment probing with dm-crypt and add support for the new
Linux statx(STATX_DIOALIGN) interface.

Given that Linux v6.0 kernels with dm-crypt returning EIO are out there, I
think we might as well rejig the alignment probing loop to handle that.

Let's also add support for the new STATX_DIOALIGN interface so probing is not
required on new kernels.

Stefan Hajnoczi (2):
  file-posix: fix Linux alignment probing when EIO is returned
  file-posix: add statx(STATX_DIOALIGN) support

 block/file-posix.c | 102 ++++++++++++++++++++++++---------------------
 1 file changed, 55 insertions(+), 47 deletions(-)

-- 
2.38.1



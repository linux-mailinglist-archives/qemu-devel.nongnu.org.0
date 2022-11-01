Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E194F6151DE
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 20:02:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opwVh-00065Z-49; Tue, 01 Nov 2022 15:01:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opwVb-0005sl-T3
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 15:01:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opwVJ-0004K6-2B
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 15:01:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667329251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qwuxP/sV/FuzSLPrYlfh2Ovu8kB1qh1JdO9Pr5Ndh5M=;
 b=hZ3sip3ALX9huHupmempwAHnd7K+e/IHO88zbX7UErzqWKA0pUXurb8l6wykpBZJaMympU
 MH2VsV44rZlYEigmO8WlRSAl4DolNXq3Cb5d4ebEtd+Yz3U/7d0v5WI3t8WCmZU8T4t1br
 4JCz2T7RNjpgIg8kgGxxC3ZQI97TE/g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-TXcW4Y8qPEGtNuUZ2GxRVw-1; Tue, 01 Nov 2022 15:00:50 -0400
X-MC-Unique: TXcW4Y8qPEGtNuUZ2GxRVw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D127929DD9AE;
 Tue,  1 Nov 2022 19:00:49 +0000 (UTC)
Received: from localhost (unknown [10.39.192.93])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 52B814B4011;
 Tue,  1 Nov 2022 19:00:49 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: hreitz@redhat.com, qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 nsoffer@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 0/2] file-posix: alignment probing improvements
Date: Tue,  1 Nov 2022 15:00:29 -0400
Message-Id: <20221101190031.6766-1-stefanha@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.051,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

These patches fix alignment probing with dm-crypt and add support for the new
Linux statx(STATX_DIOALIGN) interface.

Stefan Hajnoczi (2):
  file-posix: fix Linux alignment probing when EIO is returned
  file-posix: add statx(STATX_DIOALIGN) support

 block/file-posix.c | 96 +++++++++++++++++++++++++---------------------
 1 file changed, 52 insertions(+), 44 deletions(-)

-- 
2.38.1



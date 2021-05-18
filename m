Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2D2388238
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 23:38:06 +0200 (CEST)
Received: from localhost ([::1]:34862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj7Pg-0001QR-Ss
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 17:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lj7Ne-00071m-7a
 for qemu-devel@nongnu.org; Tue, 18 May 2021 17:35:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lj7Na-0007Od-In
 for qemu-devel@nongnu.org; Tue, 18 May 2021 17:35:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621373752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JUWvjTtHfv8AZZkeJooqd4m+jB3+eGxchAvCm2M5B3g=;
 b=Ful8dAF774tBl40Zbq2vJdWb8xDhDgEZ+C0JDU0g4ptGpYjQzKccI6HPFAh6lD9ijXWweZ
 dfew+Q8jC4Vq/mKxykYziFd8AI43BBbQM7X0cC42iqBDCUrliEl2J3S4Ar6dUNwxTB9+AE
 No8Atwehu1Zihknz+zYCnlI7s487fsQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-Y-dZoTuRMpSxpIpYxOydnA-1; Tue, 18 May 2021 17:35:51 -0400
X-MC-Unique: Y-dZoTuRMpSxpIpYxOydnA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39621801817
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 21:35:50 +0000 (UTC)
Received: from horse.redhat.com (ovpn-114-77.rdu2.redhat.com [10.10.114.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA29810074E0;
 Tue, 18 May 2021 21:35:46 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 5B2B9220BCF; Tue, 18 May 2021 17:35:46 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v2 0/7] virtiofsd: Few cleanups in virtio_send_data_iov()
Date: Tue, 18 May 2021 17:35:31 -0400
Message-Id: <20210518213538.693422-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: ckuehl@redhat.com, dgilbert@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is V2 of the patches. Changes since V1 are.

- Took care of coding style issue.
- Got rid of label "err" completely in last patch. (Dave, Connor). 
- Captured Reviewed-by tags from Connor and David.

Code in virtio_send_data_iov() little twisted and complicated. This
patch series just tries to simplify it a bit to make it little easier
to read this piece of code.

Thanks
Vivek


Vivek Goyal (7):
  virtiofsd: Check for EINTR in preadv() and retry
  virtiofsd: Get rid of unreachable code in read
  virtiofsd: Use iov_discard_front() to skip bytes
  virtiofsd: get rid of in_sg_left variable
  virtiofsd: Simplify skip byte logic
  virtiofsd: Check EOF before short read
  virtiofsd: Set req->reply_sent right after sending reply

 tools/virtiofsd/fuse_virtio.c | 81 +++++++++++------------------------
 1 file changed, 25 insertions(+), 56 deletions(-)

-- 
2.25.4



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 541E73D7939
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 17:03:37 +0200 (CEST)
Received: from localhost ([::1]:57198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8OcI-0007Km-UW
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 11:03:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1m8OZV-0003vY-7p
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 11:00:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1m8OZT-0002EC-Ld
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 11:00:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627398038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LOUgJvUzBAiYn0gtNO9UG2fcEyKQR84UmACYnuFHfpM=;
 b=ANxfMDHUnBwBqthozrpyX3VFiMzF/G6CSeu7EGzTUCsIzryI4ZqZNzjb0LKJwvw3a79rfR
 Rr6850AElJPUf0xCS1t3o9IsFB4VLMVNdP9P/9xrjO2/IGRZV53MAjuzIiLrjTKBq/L849
 YgPW11zEG+gueNXsRU7dEBo8HuNMSnU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-haZSfb9gPX6x6bzG_E2fpA-1; Tue, 27 Jul 2021 11:00:36 -0400
X-MC-Unique: haZSfb9gPX6x6bzG_E2fpA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7F7E8B428F
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 14:59:41 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-113-36.ams2.redhat.com
 [10.36.113.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2FEFE34B54;
 Tue, 27 Jul 2021 14:59:36 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] iothread: cleanup after adding a new parameter to IOThread
Date: Tue, 27 Jul 2021 16:59:34 +0200
Message-Id: <20210727145936.147032-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We recently added a new parameter (aio-max-batch) to IOThread.
This series cleans up the code a bit, no functional changes.

Stefano Garzarella (2):
  iothread: rename PollParamInfo to IOThreadParamInfo
  iothread: use IOThreadParamInfo in iothread_[set|get]_param()

 iothread.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

-- 
2.31.1



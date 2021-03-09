Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CA1332670
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 14:20:00 +0100 (CET)
Received: from localhost ([::1]:46396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJcHH-0002ti-U3
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 08:19:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lJc3q-0008UU-V4
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 08:06:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lJc3n-0001R1-9Z
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 08:06:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615295150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WxF35X1Sq5IvBQk6BnHUWIAuR/YRx0QtZrACyclcYXM=;
 b=QXz/Sli/MNHKibFY/LOdvby5v5Kf4MHU7F2IiQCYQ4PP9trWkdSaenlKCbVl1Z2HAIzUX+
 dQbmKCVKwBdBi0VkKeWTA4ZZ0wSI7dmHSwWxT0R+Zs8NQfppd36viZFpNz8xTEpAvrwmXO
 rk/xi+np4HXxQ16WJCvxGxeDhyYcaho=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-JwqlZKRxNbCoDPEclOd4EQ-1; Tue, 09 Mar 2021 08:05:44 -0500
X-MC-Unique: JwqlZKRxNbCoDPEclOd4EQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B93B4804337;
 Tue,  9 Mar 2021 13:05:43 +0000 (UTC)
Received: from localhost (ovpn-112-45.ams2.redhat.com [10.36.112.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 50E4B5D9DB;
 Tue,  9 Mar 2021 13:05:43 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/2] block/curl: Disconnect sockets from CURLState
Date: Tue,  9 Mar 2021 14:05:39 +0100
Message-Id: <20210309130541.37540-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

There’s been a bug report concerning our curl driver on Launchpad:
  https://bugs.launchpad.net/qemu/+bug/1916501

When downloading an image from a certain URL, it crashes.
(https://download.cirros-cloud.net/0.4.0/cirros-0.4.0-x86_64-disk.img)

The crash is a use-after-free: A CURLState (which basically represents a
transfer) has several CURLSocket objects (encapsulating an FD) over
which the data is transmitted.  Once that transfer is done, the state is
purged and all CURLSocket objects belonging to it are freed, under the
assumption that once the transfer is done, the sockets are no longer
used.

That seems to work with most servers.

However, I suspect that in the above case, some sockets might be reused
for later transfers; so libcurl doesn’t actually tell us to drop them
(by invoking curl_sock_cb() with CURL_POLL_REMOVE), and that means our
AIO handler (curl_multi_do()) is invoked for some socket after its
corresponding CURLSocket object is freed, leading to said
use-after-free.

I don’t think libcurl actually says anywhere that sockets are bound to
CURL states (“CURL” objects), though one is always passed to
curl_sock_cb().  But I can’t find any mention that a socket might not be
reused by some other state.

In fact, there is absolutely no necessity to bind sockets to states.  We
can trivially replace the CURLState pointer in CURLSocket by a
BDRVCURLState pointer (patch 1), and very easily move the sockets from a
per-state list to a global hash table (patch 2).

By doing so, there is no longer any need to free any socket object when
purging a CURLState, because the sockets are then independent of any
such state.  (As far as I can tell from testing, this does not lead to
any memory leaks.  For every socket there is, libcurl does tell us
eventually to remove it by invoking curl_sock_cb() with
CURL_POLL_REMOVE.)


Max Reitz (2):
  curl: Store BDRVCURLState pointer in CURLSocket
  curl: Disconnect sockets from CURLState

 block/curl.c | 50 ++++++++++++++++++++++++++++----------------------
 1 file changed, 28 insertions(+), 22 deletions(-)

-- 
2.29.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 926873BC1C3
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 18:43:27 +0200 (CEST)
Received: from localhost ([::1]:47608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Rgs-00071e-Lx
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 12:43:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m0Rdf-00026n-Vk
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:40:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m0RdZ-0002Y4-Ux
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:40:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625503199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Wct2MOq9qrlWpqCxAXXvkNta5BcA13V99bRfxRM+3ug=;
 b=PsLFmUxShg6DyTAnCbqhTVZ39lHy13T6gsM3Kid0bz4bQYOlcai3acAZPI3lF9Y26hUQFi
 IyAjGRuwrh0P1dSP6jyvy+fzvQpdAFQftDcwKohefpuxFwhGG/kaBhEWbL6Y3J6Oe5JLVj
 UJ3Vri6TibSY96uoXL+XDlUpqS3NCIE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-naWkCibUOE6-UgxPAMwk7w-1; Mon, 05 Jul 2021 12:39:58 -0400
X-MC-Unique: naWkCibUOE6-UgxPAMwk7w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6FAA804144;
 Mon,  5 Jul 2021 16:39:56 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-112-39.ams2.redhat.com [10.36.112.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 50ABE60877;
 Mon,  5 Jul 2021 16:39:55 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>
Subject: [PATCH v2 0/2] s390x: improve subchannel error handling (vfio)
Date: Mon,  5 Jul 2021 18:39:50 +0200
Message-Id: <20210705163952.736020-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a followup on the first version (which I had sent out in May,
and which kind of fell through the cracks.) While the first patch
is mostly unchanged, I added a second patch to address some possible
problems with the generated unit exceptions; non-vfio subchannels
are not affected by this.

As before, this works on the good path, and I have not managed to
actually get my system to exercise the error path :(

v1->v2:
- add comments regarding -ENODEV/-EACCES handling
- add second patch

Cornelia Huck (2):
  vfio-ccw: forward halt/clear errors
  css: fix actl handling for unit exceptions

 hw/s390x/css.c         | 38 ++++++++++++++++++++++++++++++++++----
 hw/vfio/ccw.c          |  4 ++--
 include/hw/s390x/css.h |  3 ++-
 3 files changed, 38 insertions(+), 7 deletions(-)

-- 
2.31.1



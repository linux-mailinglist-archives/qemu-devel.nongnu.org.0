Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5073B75E9
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 17:52:18 +0200 (CEST)
Received: from localhost ([::1]:41678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyG23-0008VJ-RR
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 11:52:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1lyG0F-0007Jl-Pf
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 11:50:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1lyG0B-0003DL-MZ
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 11:50:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624981818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RtuI2oTe00qstGacTw9K2s3pdpFWaOKwrl3Rir93eNE=;
 b=TdA2HUAiICPuuda8As+PpzVcDFknBxPb3sIFTgA3VX9q0+SnEStI7nVoxDVsTTLPzcvh9I
 8DogSZyskqarj+Sq8f2HVkLK+8NmqNjfV5lE5W+2N0VHVJCzTFsTOD5B/Mtgw2dctKEs25
 jFe4ZvWSxaRAS30yJZc4k91/utGCf6Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-5cwNt0bpNI6XQpv5H8W2tw-1; Tue, 29 Jun 2021 11:50:16 -0400
X-MC-Unique: 5cwNt0bpNI6XQpv5H8W2tw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ECC151084F55
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 15:50:15 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-114-217.ams2.redhat.com
 [10.36.114.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0275160854;
 Tue, 29 Jun 2021 15:50:09 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] migration: failover: continue to wait card unplug on error
Date: Tue, 29 Jun 2021 17:50:05 +0200
Message-Id: <20210629155007.629086-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Jens Freimann <jfreimann@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We need to wait the end of the unplug phase to be able=0D
to plug back the card.=0D
=0D
Bug: https://bugzilla.redhat.com/show_bug.cgi?id=3D1976852=0D
=0D
Laurent Vivier (2):=0D
  migration: move wait-unplug loop to its own function=0D
  migration: failover: continue to wait card unplug on error=0D
=0D
 migration/migration.c | 65 ++++++++++++++++++++++++-------------------=0D
 1 file changed, 37 insertions(+), 28 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D



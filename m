Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 593E12D18B2
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 19:43:36 +0100 (CET)
Received: from localhost ([::1]:58634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmLTr-0001Bf-Or
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 13:43:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1kmLHY-0003P3-DP
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 13:30:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1kmLHV-0002Pk-4u
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 13:30:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607365838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=niYsuo2X8pirydx1VdN8fsdVSfkcCP6HTS9/qefV270=;
 b=ALxsehmY+mzHHXx9itVWBnsiMaLwPBzdF4GgtP1SJjAVzCb0zy+mjRMQGWdJEFfYTDYi+J
 BxsAfxw9XSxxLIKf8x9GMQrImzs7EmP3jmusqezAJCNd3L9nIgQYaddFxPxv8YhKx6IL4T
 64Z77cOrnKXSn/4iBxIR5+SAAd3bjWE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-lqU5BlVKPzGcfGK-sIH6YA-1; Mon, 07 Dec 2020 13:30:37 -0500
X-MC-Unique: lqU5BlVKPzGcfGK-sIH6YA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D34C8015C3
 for <qemu-devel@nongnu.org>; Mon,  7 Dec 2020 18:30:36 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-41.rdu2.redhat.com [10.10.116.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A4FDD60BD8;
 Mon,  7 Dec 2020 18:30:27 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 256F4220BCF; Mon,  7 Dec 2020 13:30:27 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] virtiofsd: Fix lo_flush() and inode->posix_lock init
Date: Mon,  7 Dec 2020 13:30:18 -0500
Message-Id: <20201207183021.22752-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: mszeredi@redhat.com, dgilbert@redhat.com, virtio-fs@redhat.com,
 stefanha@redhat.com, lersek@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Laszlo is writing a virtiofs client for OVMF and noticed that if he
sends fuse FLUSH command for directory object, virtiofsd crashes.
virtiofsd does not expect a FLUSH arriving for a directory object.

This patch series has one of the patches which fixes that. It also
has couple of posix lock fixes as a result of lo_flush() related debugging.

Vivek Goyal (3):
  virtiofsd: Set up posix_lock hash table for root inode
  virtiofsd: Disable posix_lock hash table if remote locks are not
    enabled
  virtiofsd: Check file type in lo_flush()

 tools/virtiofsd/passthrough_ll.c | 54 +++++++++++++++++++++++---------
 1 file changed, 39 insertions(+), 15 deletions(-)

-- 
2.25.4



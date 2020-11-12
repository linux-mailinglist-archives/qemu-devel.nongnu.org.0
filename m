Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA9A2B0C89
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 19:26:10 +0100 (CET)
Received: from localhost ([::1]:43740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdHIO-0007WR-QX
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 13:26:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1kdHGv-0006PZ-Hr
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:24:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1kdHGt-0001Su-Mg
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:24:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605205474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=z27rNXUWHFbmUNX9MySnVY/eNaMBlAY+m2HgrthvP/g=;
 b=GWai3v+rOEERgnYud0PTaqk6flGdi4+SDwsQXF1BWs4lHuNVSJ/Qoz+29/mThWZp8rxRot
 NM9cd10Cd8phXWWUXOYAUNPRA7OT79pLjf5zhG0BjBIYtXlj5HEwaMJoLi+yDjnCrdnInf
 1hA4iVcmu0MsrN2F8vw5I8dQuTBgNmw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-R1ZTSJiRPdGjgUhdHXG4AA-1; Thu, 12 Nov 2020 13:24:32 -0500
X-MC-Unique: R1ZTSJiRPdGjgUhdHXG4AA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFAFB8BE481
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 18:24:31 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-211.rdu2.redhat.com [10.10.116.211])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D18BE60C0F;
 Thu, 12 Nov 2020 18:24:28 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 57DE9220BCF; Thu, 12 Nov 2020 13:24:28 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v2 0/2] viritofsd: Add support for FUSE_HANDLE_KILLPRIV_V2
Date: Thu, 12 Nov 2020 13:24:16 -0500
Message-Id: <20201112182418.25395-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 00:52:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: mszeredi@redhat.com, dgilbert@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is V2 of patches to add support for FUSE_HANDLE_KILLPRIV_V2. This
is basically a feature file server can opt-in. And with xattr enabled,
this improves write performance many fold (jumps from 50MB/s to
300MB/s approx).

kernel patches have now been staged in for-next branch of fuse tree by Miklos.

https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git/log/?h=for-next

I tested virtiofsd with these patches and things look good to me.
Posting now for review and inclusion as soon as kernel patches are
merged in 5.11.

Thanks
Vivek

Vivek Goyal (2):
  virtiofsd: Save error code early at the failure callsite
  viriofsd: Add support for FUSE_HANDLE_KILLPRIV_V2

 include/standard-headers/linux/fuse.h |  28 ++++++-
 tools/virtiofsd/fuse_common.h         |  15 ++++
 tools/virtiofsd/fuse_lowlevel.c       |  11 ++-
 tools/virtiofsd/fuse_lowlevel.h       |   1 +
 tools/virtiofsd/passthrough_ll.c      | 116 +++++++++++++++++++++++---
 5 files changed, 153 insertions(+), 18 deletions(-)

-- 
2.25.4



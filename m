Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5045C2AF535
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 16:41:03 +0100 (CET)
Received: from localhost ([::1]:33972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcsF4-0004lB-2W
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 10:41:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kcsDb-0003NG-NF
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 10:39:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kcsDY-0002Wx-Ku
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 10:39:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605109167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jWBqvTwmSkbkGYTj/RivcCVFDqnHAZZO1GC39aWZdM8=;
 b=IoRbz3Sd66hifDErlOGjMGnIUPYKnfTAv/QXcAZ/TSmuyLpajQYRQHvhttyDr58dES4f+K
 qLrp3h1qsoUk5TwqJNAqfu2zgpg4SVkiBaieq8WZRMFyf9V6sK4QSrxqzka354vC+x4o4o
 1PfhT1DxP/SRx9gM85RGQaXZagkO+oQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-ABZyAWM2PqqY7rTlbi_fcQ-1; Wed, 11 Nov 2020 10:39:26 -0500
X-MC-Unique: ABZyAWM2PqqY7rTlbi_fcQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFE1A640BE;
 Wed, 11 Nov 2020 15:39:18 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 31D865B4CD;
 Wed, 11 Nov 2020 15:39:14 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] RFC: Issue with discards on raw block device without
 O_DIRECT
Date: Wed, 11 Nov 2020 17:39:11 +0200
Message-Id: <20201111153913.41840-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Jan Kara <jack@suse.cz>,
 qemu-block@nongnu.org, "Darrick J . Wong" <darrick.wong@oracle.com>,
 Peter Lieven <pl@kamp.de>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

clone of "starship_production"=0D
=0D
Maxim Levitsky (2):=0D
  file-posix: allow -EBUSY errors during write zeros on raw block=0D
    devices=0D
  qemu-img: align next status sector on destination alignment.=0D
=0D
 block/file-posix.c |  1 +=0D
 qemu-img.c         | 13 ++++++++-----=0D
 2 files changed, 9 insertions(+), 5 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D



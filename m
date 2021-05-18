Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A93A387CB0
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 17:46:01 +0200 (CEST)
Received: from localhost ([::1]:50882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj1uy-0005MH-3G
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 11:46:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lj1pb-0007bt-PE
 for qemu-devel@nongnu.org; Tue, 18 May 2021 11:40:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lj1pV-0006m1-HB
 for qemu-devel@nongnu.org; Tue, 18 May 2021 11:40:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621352420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Nj/X7FEpBCre1SETzhsZJ8gufEhvIdqy0k658HryHTc=;
 b=KVpDDMowlx/ckNRKTQ52KbpwmH2suy5d8+Z+4YoqykAECEYj4SLhxKFa+9w92KdRIasuyD
 1dsMhUdI/b4mdawzkVAml8CvG99+iPDazRYB7LvI11OcyIVHFgQCJfBRYrFHuU945ABLRm
 /VkGMAoGO0AuQVXqHvR+Nk2DaK9kXmY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-zlx5sThnPvCsGWYSyc1KZw-1; Tue, 18 May 2021 11:40:15 -0400
X-MC-Unique: zlx5sThnPvCsGWYSyc1KZw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D14EEE7B54;
 Tue, 18 May 2021 15:40:14 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C2861037F40;
 Tue, 18 May 2021 15:40:14 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] vl: add -object support back into -readconfig
Date: Tue, 18 May 2021 11:40:11 -0400
Message-Id: <20210518154014.2999326-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: kwolf@redhat.com, armbru@redhat.com, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

LXD developers have reported that [object] stanzas have stopped
working in configuration files.

The problem is that QEMU 6.0 switched the creation of objects from
qemu_opts_foreach to a bespoke QTAILQ, in preparation for supporting
JSON syntax in -object.  Entries from the configuration file however
do not go through object_option_parse, and are thus lost.  Of the many
fixes that are possible, I chose one that is slightly more invasive but
more consistent with the plans for keyval-ification of options such as
-M and -accel.

-set was also broken by the same change, but for simplicity I chose
not to add it back yet.  However, this series will report the
breakage instead of failing silently.

The first two patches of this series are thus a reduced version of
https://patchew.org/QEMU/20210513162901.1310239-1-pbonzini@redhat.com/
([PATCH 00/14] vl: compound properties for machines and accelerators),
with the -set infrastructure removed.  The third is very simple and
uses the newly-provided hooks to parse objects from configuration files.

Paolo Bonzini (3):
  qemu-config: parse configuration files to a QDict
  vl: plumb keyval-based options into -readconfig
  vl: plug -object back into -readconfig

 include/block/qdict.h      |   2 -
 include/qapi/qmp/qdict.h   |   3 ++
 include/qemu/config-file.h |   7 ++-
 softmmu/vl.c               | 104 ++++++++++++++++++++++++++-----------
 util/qemu-config.c         |  91 +++++++++++++++++++++-----------
 5 files changed, 145 insertions(+), 62 deletions(-)

-- 
2.27.0



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AC42AED98
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 10:26:04 +0100 (CET)
Received: from localhost ([::1]:47590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcmOB-00084c-4E
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 04:26:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kcmMx-0007HC-UT
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 04:24:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kcmMw-0006wF-AG
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 04:24:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605086685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=1YGE3npnI1uhkzQJcSMzfyG/xPlLGlg8ypOsoLfa7LA=;
 b=M6/tYp/XDo1KA9FFTGcpTDL7LBowtme9LMO9EG4RxFmm9uF8TsGQ3+QEMb5WBT6T465nbh
 gc6VdEEPi21kxXqMoyARDMTjui0ioVAlmpRBYXsKPEQ06fVLgopmmeMbhTyEJ0ScZoZcYi
 TPL9ABa704Z/1cTwUzpgnTHv2P5LuaU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-e32iv4aQMdSUCMTG5JX4jA-1; Wed, 11 Nov 2020 04:24:43 -0500
X-MC-Unique: e32iv4aQMdSUCMTG5JX4jA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9A911800D4A
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 09:24:42 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-124.ams2.redhat.com [10.36.114.124])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE9F427BB9;
 Wed, 11 Nov 2020 09:24:41 +0000 (UTC)
Date: Wed, 11 Nov 2020 10:24:40 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: Command line QAPIfication and -readconfig
Message-ID: <20201111092423.GA3898@merkur.fritz.box>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pbonzini@redhat.com, jsnow@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

while QAPIfying the chardev configuration, I noticed that dropping
QemuOpts completely in vl.c would break -readconfig. So for now I'm
stopping at the point where internal interfaces are fully QAPIfied and
the QemuOpts interfaces are only a thin wrapper around them.

But do we already have a plan what to do with -readconfig? Should we
just deprecate it in 5.2 so we can complete the work in 6.1 and leave
vl.c unconverted for now? Or should we rather convert half of vl.c and
keep both QAPI and QemuOpts around for the same option for now?

Kevin



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B913D279F
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 18:35:04 +0200 (CEST)
Received: from localhost ([::1]:45518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6bf0-0007sM-83
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 12:34:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1m6be2-0006vQ-GW
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 12:33:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1m6bdy-0007an-Az
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 12:33:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626971633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=E96l/yUPmsEvWHFI8cytPMQZ6N6Um5q08Twezaol72o=;
 b=hkL5NasAPDIhmkOqHPFrLS7x92cSrPOEVPOPR9tSdgrpIDL3o76DWJfSrhHkPNcPMyqJ6B
 o9hiXXkS9qwLVaFJmqu3r63bDpCFwH3WXHyaWR0RSLTY8SucuLTh9MSr6urwJcx0b0bqwi
 a/izsiTBNdPEaofmwMCxW7e2sozrlVw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-UsMYCFRtMre6Q1yEYVRdnw-1; Thu, 22 Jul 2021 12:33:51 -0400
X-MC-Unique: UsMYCFRtMre6Q1yEYVRdnw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3C9F1008541;
 Thu, 22 Jul 2021 16:33:50 +0000 (UTC)
Received: from devr9.home.annexia.org (ovpn-114-133.ams2.redhat.com
 [10.36.114.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0287860C05;
 Thu, 22 Jul 2021 16:33:49 +0000 (UTC)
From: "Richard W.M. Jones" <rjones@redhat.com>
To: eblake@redhat.com
Subject: [PATCH] nbd/server: Add --selinux-label option
Date: Thu, 22 Jul 2021 17:32:39 +0100
Message-Id: <20210722163240.1722364-1-rjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: vsementsov@virtuozzo.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

https://bugzilla.redhat.com/show_bug.cgi?id=1984938

The purpose of the patch is explained in the commit message / bug.  In
the cover I want to explain a couple of design choices.

If libselinux isn't available at build time then the --selinux-label
option is still present.  It does not appear in the qemu-nbd --help
output.  If you still use it, it is ignored.  (By contrast nbdkit will
give an error if you try to use the option without having SELinux
support.  It's not clear which is better.)

We give an error if setsockcreatecon_raw fails.  In theory we could
ignore this error (warning?) and keep going.  Either SELinux would
later reject clients or it wouldn't.

Rich.





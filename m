Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCE933EF2C
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 12:07:16 +0100 (CET)
Received: from localhost ([::1]:41550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMU1D-0006wv-DJ
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 07:07:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lMTzP-0005zI-7q
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 07:05:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lMTzL-0007pu-UR
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 07:05:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615979119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nOXGCXSB4ySRxnryjOu1yzGiDbcVaA2ALv65bXScHwc=;
 b=DZi8Uo7H3FAXq0IDFyr6r2t5/KclchsEc1RzRz6WyJMaHp7OB4TqCqkN3Xc/5qJFGnnpiv
 mmGOE102ZwCXdzrSdlbjgqO4HkOpZDNlcnBnjBG92xBerCy+j2hLSHeVjOl5Xt7DskWyNu
 190kDiVxj7TIBuht9wM5A4I6X4BnpM8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-2_zeTMmmO8CdkE-faQu30g-1; Wed, 17 Mar 2021 07:05:17 -0400
X-MC-Unique: 2_zeTMmmO8CdkE-faQu30g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4234388127C;
 Wed, 17 Mar 2021 11:05:16 +0000 (UTC)
Received: from thuth.com (ovpn-112-84.ams2.redhat.com [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B3E76C32F;
 Wed, 17 Mar 2021 11:05:14 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Ed Maste <emaste@freebsd.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Subject: [PATCH 0/2] Fix atomic test in "configure" + bump FreeBSD CI to 12.2
Date: Wed, 17 Mar 2021 12:05:10 +0100
Message-Id: <20210317110512.583747-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FreeBSD 12.1 is out of service now, so the Cirrus-CI task is failing due
to using some packages from 12.2 on the 12.1 image. We have to update
it to 12.2. However, there are two obstacles:

First, the check for the 128-bit atomic functions in the configure
script does not work right with the version of Clang in FreeBSD 12.2
anymore. Looks like the __atomic_*_16() functions do not have valid
prototypes anymore. First patch fixes this issue.

Second, there is a problem with libtasn1 and the latest version of
Clang that also triggers on FreeBSD 12.2. We have to disable gnutls
in this task until libtasn1 got fixed in FreeBSD.

Thomas Huth (2):
  configure: Don't use the __atomic_*_16 functions for testing 128-bit
    support
  cirrus.yml: Update the FreeBSD task to version 12.2

 .cirrus.yml | 5 +++--
 configure   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

-- 
2.27.0



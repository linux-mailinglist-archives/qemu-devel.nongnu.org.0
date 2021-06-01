Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A829397714
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 17:47:40 +0200 (CEST)
Received: from localhost ([::1]:59014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo6cF-0002zK-Ay
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 11:47:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lo6am-0001FA-58
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:46:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lo6ak-0006kM-32
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:46:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622562364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z4nqMz1LmUb5qF+gj2dWgBT2+V67DGroi3Z9KopQlBg=;
 b=ZkN4+sp5/HtGrE25xMWcjiYtzBFfCUASwoLPdqjqLA1XDWs0A9U/34GLRCTzla8aPUl6uK
 1KBCFlEXt/rIOxMznUTd5joismDs2O8cRVePUBrKwhHauQJjiIbMFCSQWmBL+2bcpL8OTK
 XGObuRJtI7J9mLToJHaYCZbOH6BHz24=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-AXbyF382NQWHVDtog8KY8A-1; Tue, 01 Jun 2021 11:46:02 -0400
X-MC-Unique: AXbyF382NQWHVDtog8KY8A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53F8518BA286;
 Tue,  1 Jun 2021 15:46:01 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-153.phx2.redhat.com
 [10.3.112.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B66A60CCC;
 Tue,  1 Jun 2021 15:45:49 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/1] VM tests: account for changes in
 qemu.utils.get_info_usernet_hostfwd_port()
Date: Tue,  1 Jun 2021 11:45:45 -0400
Message-Id: <20210601154546.130870-1-crosa@redhat.com>
In-Reply-To: <20210528023220.417057-1-jsnow@redhat.com>
References: <20210528023220.417057-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Auger Eric <eric.auger@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The utility function actually accepts a string, and not the raw=0D
dictionary response from QMP.  Also, it returns (optionally) an=0D
integer, so that must also be accounted for.=0D
=0D
The issue can be replicated with (and verified the fix) with `make=0D
vm-build-freebsd`.=0D
=0D
Cleber Rosa (1):=0D
  VM tests: account for changes in=0D
    qemu.utils.get_info_usernet_hostfwd_port()=0D
=0D
 tests/vm/basevm.py | 4 ++--=0D
 1 file changed, 2 insertions(+), 2 deletions(-)=0D
=0D
--=20=0D
2.25.4=0D
=0D



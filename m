Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B736A4036
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:12:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWbPO-0001Ru-1I; Mon, 27 Feb 2023 06:11:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWbPL-0001OA-36
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:11:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWbPJ-0000nc-Gr
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:11:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677496260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=HqNrPaN6lC01QUipjdhuAjHY1FZrvMej85mjtvyYQtg=;
 b=Q+4hJb6VKoY/rHk9+C52gtAknpLHiiVRa7pNSaSoYQ5rm+wWW4UTAxWbqyspo70RSOMACj
 onGhPRikOEENRBH0bv7G4UuJm1juoqHAXDINMkKAz8LdYYtnZtM4cU8pe2JsCyX3WJo/wl
 OA+HO99yDiJnoTvbGlU9WvIIYZ4qWCo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-3BnZ8YXjO9i2G0RP3ALa-A-1; Mon, 27 Feb 2023 06:10:55 -0500
X-MC-Unique: 3BnZ8YXjO9i2G0RP3ALa-A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3AD063848C27;
 Mon, 27 Feb 2023 11:10:55 +0000 (UTC)
Received: from thuth.com (unknown [10.45.227.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B36A740C6EC4;
 Mon, 27 Feb 2023 11:10:52 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 libvir-list@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH 0/2] Deprecate support for 32-bit x86 and arm hosts
Date: Mon, 27 Feb 2023 12:10:48 +0100
Message-Id: <20230227111050.54083-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We're struggling quite badly with our CI minutes on the shared
gitlab runners, so we urgently need to think of ways to cut down
our supported build and target environments. qemu-system-i386 and
qemu-system-arm are not really required anymore, since nobody uses
KVM on the corresponding systems for production anymore, and the
-x86_64 and -arch64 variants are a proper superset of those binaries.
So it's time to deprecate them and the corresponding 32-bit host
environments now.

This is a follow-up patch series from the previous discussion here:

 https://lore.kernel.org/qemu-devel/20230130114428.1297295-1-thuth@redhat.com/

where people still mentioned that there is still interest in certain
support for 32-bit host hardware. But as far as I could see, there is
no real need for 32-bit host support for system emulation on x86 and
arm anymore, so it should be fine if we drop these host environments
now (these are also the two architectures that contribute the most to
the long test times in our CI, so we would benefit a lot by dropping
those).

Thomas Huth (2):
  docs/about: Deprecate 32-bit x86 hosts and qemu-system-i386
  docs/about: Deprecate 32-bit arm hosts and qemu-system-arm

 docs/about/deprecated.rst | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

-- 
2.31.1



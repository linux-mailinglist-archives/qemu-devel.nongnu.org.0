Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBD16A9FFB
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 20:21:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYAx6-00029D-1t; Fri, 03 Mar 2023 14:20:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pYAx3-000292-Rm
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 14:20:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pYAx2-0003WG-0h
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 14:20:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677871218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=liQ8kuMIrYxsYTu7Odnl0ItPBxkwbKf74w/Bc0RJF9E=;
 b=R8Lv0xxKssQBqVZILPAq/f6u07vzSKcD0bMl9ELfTsNUTQfkDrm8soaPYywHzW6JB9dWGh
 p3pcADRrJ/CAnVPBwhWLsBUU/ffquq/VoDDu04X8AfU6zMmYPs5PjJYS8s+P01WZ8toG5c
 4cq/xduSnqQXRDKAVAPhzMFrk1vuKDY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-b710R53hNLuIpVErZoUIRw-1; Fri, 03 Mar 2023 14:20:15 -0500
X-MC-Unique: b710R53hNLuIpVErZoUIRw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6DEF6380607D;
 Fri,  3 Mar 2023 19:20:14 +0000 (UTC)
Received: from kostyanf14nb.redhat.com (unknown [10.45.224.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EAB51140EBF4;
 Fri,  3 Mar 2023 19:20:09 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, Stefan Weil <sw@weilnetz.de>,
 Yonggang Luo <luoyonggang@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
 Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, brian.wiltse@live.com
Subject: [PATCH v3 0/2] QGA installer fixes
Date: Fri,  3 Mar 2023 21:20:06 +0200
Message-Id: <20230303192008.109549-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

resolves: https://bugzilla.redhat.com/show_bug.cgi?id=2167423
fixes: CVE-2023-0664 (2 parts)

CVE Technical details: The cached installer for QEMU Guest Agent in c:\windows\installer
(https://github.com/qemu/qemu/blob/master/qga/installer/qemu-ga.wxs),
can be leveraged to begin a repair of the installation without validation
that the repair is being performed by an administrative user. The MSI repair
custom action "RegisterCom" and "UnregisterCom" is not set for impersonation
which allows for the actions to occur as the SYSTEM account
(LINE 137 AND 145 of qemu-ga.wxs). The custom action also leverages cmd.exe
to run qemu-ga.exe in line 134 and 142 which causes an interactive command
shell to spawn even though the MSI is set to be non-interactive on line 53.

Reported-by: Brian Wiltse <brian.wiltse@live.com>

v2: https://lists.nongnu.org/archive/html/qemu-devel/2023-02/msg05979.html
v2 -> v3:
  Minor fix in commit messages

v1: https://lists.nongnu.org/archive/html/qemu-devel/2023-02/msg05661.html
v1 -> v2:
  Add explanation into commit messages

Konstantin Kostiuk (2):
  qga/win32: Remove change action from MSI installer
  qga/win32: Use rundll for VSS installation

 qga/installer/qemu-ga.wxs | 11 ++++++-----
 qga/vss-win32/install.cpp |  9 +++++++++
 qga/vss-win32/qga-vss.def |  2 ++
 3 files changed, 17 insertions(+), 5 deletions(-)

--
2.25.1



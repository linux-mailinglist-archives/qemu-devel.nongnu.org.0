Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 139B71FACC0
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 11:37:34 +0200 (CEST)
Received: from localhost ([::1]:41654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jl829-0002kL-3P
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 05:37:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jl80J-0000lb-VX
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 05:35:39 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:34292
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jl80I-0000Kp-DH
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 05:35:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592300137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qDNBig6IWQiFeyOxhMViPcQxZlm7fNfvrCXicg2128w=;
 b=bNcG3gIyLlcVLyZ2dRXTgLg6md7D1+SphVuS0N4DTwfhUDeSxVgtYVJaU0HaA8p4R/aw3b
 QhJUCDwHdkOx5yK7eGOWOOr2W/88hb4rW8ZfJtxEE5lfW/UJfUS9CSZ0ZAyLeXCzMJdXgj
 3UV/KPYigov/ICi8JcSrUsCiBbIidxk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-nKtsuXKmNG-R_jQlY-OSYw-1; Tue, 16 Jun 2020 05:35:34 -0400
X-MC-Unique: nKtsuXKmNG-R_jQlY-OSYw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0407107B7C5;
 Tue, 16 Jun 2020 09:35:32 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B1F45C1BD;
 Tue, 16 Jun 2020 09:35:21 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v5 3/3] docs/specs/tpm: ACPI boot now supported for TPM/ARM
Date: Tue, 16 Jun 2020 11:34:57 +0200
Message-Id: <20200616093457.24709-4-eric.auger@redhat.com>
In-Reply-To: <20200616093457.24709-1-eric.auger@redhat.com>
References: <20200616093457.24709-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 02:45:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: thuth@redhat.com, lersek@redhat.com, drjones@redhat.com,
 shannon.zhaosl@gmail.com, marcandre.lureau@redhat.com, philmd@redhat.com,
 ardb@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ACPI boot now is supported. Let's remove the comment
saying it is not.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 docs/specs/tpm.rst | 2 --
 1 file changed, 2 deletions(-)

diff --git a/docs/specs/tpm.rst b/docs/specs/tpm.rst
index 5e61238bc5..eeeb93730a 100644
--- a/docs/specs/tpm.rst
+++ b/docs/specs/tpm.rst
@@ -346,8 +346,6 @@ In case an Arm virt machine is emulated, use the following command line:
     -drive if=pflash,format=raw,file=flash0.img,readonly \
     -drive if=pflash,format=raw,file=flash1.img
 
-  On Arm, ACPI boot with TPM is not yet supported.
-
 In case SeaBIOS is used as firmware, it should show the TPM menu item
 after entering the menu with 'ESC'.
 
-- 
2.20.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BCE313CC7
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 19:10:40 +0100 (CET)
Received: from localhost ([::1]:60450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Azf-0002Ik-8D
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 13:10:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l96kW-0003Bv-Fg
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:38:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l96k9-00055b-HI
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:38:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612791497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tQqqhHVMsVsFY7bRJoze1V3h8iOjQeP6Azr1lzMcONQ=;
 b=HxMb5TPLMAoeHeRDbIaOL9YnmGR133eIL1cm0Hj08I1/qx/VsfMpViQlFRc3ASMLDVuD2q
 5jIyWOSAUj4Hey/MXAZdOSc3wvGPndQsKckckp75BEj3hIVeeADSYH83l4CyTAhQ3mxB2r
 pl/mjxHcxozMlqohU4UNz8qafe74Nwo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-r8JtAkkVNjy8qYwr9ZC3Pw-1; Mon, 08 Feb 2021 08:38:16 -0500
X-MC-Unique: r8JtAkkVNjy8qYwr9ZC3Pw-1
Received: by mail-wr1-f71.google.com with SMTP id o10so2903926wru.11
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 05:38:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tQqqhHVMsVsFY7bRJoze1V3h8iOjQeP6Azr1lzMcONQ=;
 b=mrQRLUqYfhUrB4F3O8DFNWDLz6eu+saw2aEm0PNyXi63bGYpQe4jClntYakwMLyLut
 TuKl0ABN/beFjpswmZIMkmGfhG9zIJclJtpC0oejrCKNXnvqshxRI7p0Xpr8bOr2lpRa
 tEs5PhDljaRBAyV1UtQHrguCjXh9HnoUot5qRd8jhjr15Wg0PJGkX2iRjxBR+sBYBLTC
 RNjKVgrKwDbQ7g85vly28NIOzH7K5+893YZ2nmoZKXYSeVlr1xN6Y8nuGdlYGvgrgr2h
 W+5TX3fHyTq7Zv5trC8jUxGENBcH9YSvjYVTRuomycLUcmnDs+qN0Qd7e33YAxxpXwOR
 dcfQ==
X-Gm-Message-State: AOAM5300/tu4XOZBBeyltojdlDMEPU11yrtu9PlCi3RQLxOVoiUO6Esb
 w6bbKL3cXVLhJt0ziLoOLdAwxGoiUAdU1WNCOGfqaPILYzlBZIiHijb/yrf6Q1cG/Y6UaIyzZgL
 Vj7p2lDDxCdyYkhsRx2oUAEJDfK5md42wkhhx/tK+zSr7LuSM7qAfhTCIWE3H8si7
X-Received: by 2002:a05:600c:4857:: with SMTP id
 j23mr3417864wmo.66.1612791489915; 
 Mon, 08 Feb 2021 05:38:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxesWyA+5r0Csr1qqiAIr8f86uV1/nkrqgrVNsD2ZKeGWD5red28OGzbPUpXRlwonylxXzu9g==
X-Received: by 2002:a05:600c:4857:: with SMTP id
 j23mr3417669wmo.66.1612791486323; 
 Mon, 08 Feb 2021 05:38:06 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id w25sm21038768wmc.42.2021.02.08.05.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 05:38:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/18] tests/acceptance/boot_linux: fix typo on cloudinit error
 message
Date: Mon,  8 Feb 2021 14:37:03 +0100
Message-Id: <20210208133711.2596075-11-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210208133711.2596075-1-philmd@redhat.com>
References: <20210208133711.2596075-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cleber Rosa <crosa@redhat.com>

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Beraldo Leal <bleal@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210203172357.1422425-2-crosa@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/acceptance/boot_linux.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/acceptance/boot_linux.py b/tests/acceptance/boot_linux.py
index 1da4a53d6a1..2ac3e575874 100644
--- a/tests/acceptance/boot_linux.py
+++ b/tests/acceptance/boot_linux.py
@@ -70,7 +70,7 @@ def download_cloudinit(self, ssh_pubkey=None):
                           phone_home_port=self.phone_home_port,
                           authorized_key=ssh_pubkey)
         except Exception:
-            self.cancel('Failed to prepared cloudinit image')
+            self.cancel('Failed to prepare the cloudinit image')
         return cloudinit_iso
 
 class BootLinux(BootLinuxBase):
-- 
2.26.2



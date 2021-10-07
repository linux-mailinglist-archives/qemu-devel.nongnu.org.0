Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66835425046
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 11:43:56 +0200 (CEST)
Received: from localhost ([::1]:42968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYPwR-0000IY-DN
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 05:43:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYPs1-0001oi-AQ
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 05:39:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYPrz-0004zm-Qh
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 05:39:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633599559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=O6gHvl+V3DdX2ER9EkW+g056NvC3DDNHig7lmoGLbJo=;
 b=LFi9lNzMMj1K8JrMsATZL2+XXPjMW68zCrjKg0FKS92oNBb8SxjjCRsEZzCGynU/z1D03x
 4yiovwBu38HPbE4U7eon+MXYjBXJrrhtBrJMDSQSfptq0ZAVCkGJP4+cPv6e1wKXA4Ls/m
 BXzGOMJPl/htqMXAST+Z48/CkMnzfE4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-wS2icdN2NtODAKLHCdmYwg-1; Thu, 07 Oct 2021 05:39:18 -0400
X-MC-Unique: wS2icdN2NtODAKLHCdmYwg-1
Received: by mail-wr1-f69.google.com with SMTP id
 m17-20020adffa11000000b00160c1ac74e9so4209095wrr.9
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 02:39:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O6gHvl+V3DdX2ER9EkW+g056NvC3DDNHig7lmoGLbJo=;
 b=FM47FBF/v51wBB2fhiTkCKh+MJ6RxDU9NrojljQNBcuqPPsSyRmrGZIlxR7JF4ERcs
 gqIEVjLujs1Oey23aAFFiUS8cq8JsC2gLOTx0Fp50oNsXJxl6rTIxXT9fTZIOzdut4cl
 wpHhx4XYXyNQCsCGQ+GwL//KUzDA1lAM4McUN9wk4YylGesSgFgZP/VLqzxRS8O9QM8H
 kUiWSg+c6EemgHLt8Qx2Ndy21maS6oXbxKHOd1xeIt1+zPjnDKLKFEyCeqiTw53VXihi
 LQvzurDd+eALC2hWFNcV4gTs19J/hhJAoSxipdN8TCSbl4BtV66VLhCBZjFQIAnPQ4Sw
 DmSQ==
X-Gm-Message-State: AOAM530aPFR7Tfi3PnmrlSpw55PrAOVK4B+IQhcXv/6NmESiY0AEytko
 RUEIcR1nVTUU3/Miyljvv5ZlqZut/aUOg983SgX0sFXDI4aJDdC2vKOSec5a0C8PnO9Ud5zVjs+
 fW8Sfs7Wu3QTO9vbtmiKWYruhDWP5QCtRLHYGObGYZ3xfUGy/SktEDYO7eV3iqDAA
X-Received: by 2002:adf:8bdd:: with SMTP id w29mr3973307wra.49.1633599070061; 
 Thu, 07 Oct 2021 02:31:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmb3/xqoaRaAuKDWYmQaFbK3pyag8zv1KmFFp4HwgS6gazHzy07Y0Cn9G47LKatWfvrSQbXw==
X-Received: by 2002:adf:8bdd:: with SMTP id w29mr3973266wra.49.1633599069841; 
 Thu, 07 Oct 2021 02:31:09 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id c18sm8144571wmb.27.2021.10.07.02.31.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 02:31:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] MAINTAINERS: Add myself as reviewer of 'Machine core' API
Date: Thu,  7 Oct 2021 11:31:08 +0200
Message-Id: <20211007093108.323223-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In order to help Eduardo and Marcel with the machine
core API, add myself as reviewer. That will also help
me to learn more about this subsystem :)

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 50435b8d2f5..b0a7bf36aa4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1617,6 +1617,7 @@ F: pc-bios/bios-microvm.bin
 Machine core
 M: Eduardo Habkost <ehabkost@redhat.com>
 M: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
+R: Philippe Mathieu-Daudé <philmd@redhat.com>
 S: Supported
 F: cpu.c
 F: hw/core/cpu.c
-- 
2.31.1



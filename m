Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4065C48046B
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Dec 2021 20:39:24 +0100 (CET)
Received: from localhost ([::1]:50472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1vq7-0002Gp-Bc
	for lists+qemu-devel@lfdr.de; Mon, 27 Dec 2021 14:39:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1n1via-0003Jc-OC
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 14:31:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1n1viX-00058W-EZ
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 14:31:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640633492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6AExfDQMqY19heM+BOJJWYlxz7rXjqGXSBaenbUMh60=;
 b=Pawu+YYpdqOFtXJhCiyE27sY1yiskeFLV0M1CWqwDS/qX7r+dCTLiqGXqjOVxFBfFHzW3p
 nlm8S7rpX7jAhHG7uKBxdBmRXi9Ib5TBI4witk6IUT7nalUYX2HhI/eqJsuFFPfx76Ihbg
 5T4axIPPqeimj8boeKhrazHaLy2lZAQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-uQ4DpTClP06wg3Lapae6SA-1; Mon, 27 Dec 2021 14:31:29 -0500
X-MC-Unique: uQ4DpTClP06wg3Lapae6SA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 489CD8042A2;
 Mon, 27 Dec 2021 19:31:28 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 65DA360BF4;
 Mon, 27 Dec 2021 19:31:22 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] Fix -acpitable regression
Date: Mon, 27 Dec 2021 14:31:16 -0500
Message-Id: <20211227193120.1084176-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.575,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: dlenski@gmail.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Since 6.2 QEMU will assert when SLIC table is passed with                        
help of -acpitable. This series fixes the issue and adds a test                  
case for it.                                                                     
                                                                                 
                                                                                 
PS: gitlab whining:                                                              
* the issue was reported and ivestigated via shiny gitlab issue tracker,      
  the problem is that all that discussion is buried there and is not stored     
  in qemu-devel mail list. So when gitlab is gone, so will be all the history    
  and one won't have (nicely and locally stored) mail archive to search in       
  a convenient way.                                                              
  Also I'd notice the report earlier if it were forwarded to qemu-devel.         
  I wonder if there is a way to bridge issue tracker discussions to mail list?   
* another issue is that gitlab hides user's emails, with a bit of detective work 
  one can find email if the user has committed a patch via gitlab, but that doesn't
  work for every user. So I can't CC/properly credit reporter when posting formal
  patch. 

CC: dlenski@gmail.com
CC: mst@redhat.com


Igor Mammedov (4):
  acpi: fix QEMU crash when started with SLIC table
  tests: acpi: whitelist expected blobs before changing them
  tests: acpi: add SLIC table test
  tests: acpi: SLIC: update expected blobs

 hw/acpi/core.c                 |   4 ++--
 hw/i386/acpi-build.c           |   2 ++
 tests/data/acpi/q35/FACP.slic  | Bin 0 -> 244 bytes
 tests/data/acpi/q35/SLIC.slic  | Bin 0 -> 36 bytes
 tests/qtest/bios-tables-test.c |  15 +++++++++++++++
 5 files changed, 19 insertions(+), 2 deletions(-)
 create mode 100644 tests/data/acpi/q35/FACP.slic
 create mode 100644 tests/data/acpi/q35/SLIC.slic

-- 
2.31.1



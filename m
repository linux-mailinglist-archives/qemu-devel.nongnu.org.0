Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D95866AC178
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 14:37:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZAwA-0004Dd-W5; Mon, 06 Mar 2023 08:31:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZAvA-0002LA-Gf
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:30:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZAv8-0007WJ-0e
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:30:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678109429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UuKSCGlnqZ1RlzzMRsKGrxjXRiPEQP7BzhCqfp+bNb0=;
 b=DE10+8Ke+s9qW4l3E0gZVAYDJuEs7xmeXM1cnjSZ/FkAMW7AryDadN7O3tMljHbZ29juAX
 8OB6uuYlb6uDzTMll5XtXZEXqxBXExM4UpXpwTaLgsjk9BKrNq7R8vQewM21L9c6DtNxaN
 +4Qg5BwFQq6sglA/s3xu0057ohcEcDE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-323-1tmDNz81PYGLfu0mIrIoMA-1; Mon, 06 Mar 2023 08:30:18 -0500
X-MC-Unique: 1tmDNz81PYGLfu0mIrIoMA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 597FF280BF6B;
 Mon,  6 Mar 2023 13:30:18 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF02940C10FA;
 Mon,  6 Mar 2023 13:30:17 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 16/16] pc-bios/s390-ccw: Update s390-ccw.img with the
 list-directed IPL fix
Date: Mon,  6 Mar 2023 14:30:02 +0100
Message-Id: <20230306133002.418421-17-thuth@redhat.com>
In-Reply-To: <20230306133002.418421-1-thuth@redhat.com>
References: <20230306133002.418421-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

This update includes the list-directed IPL fix from Jared Rossi.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 pc-bios/s390-ccw.img | Bin 42608 -> 42608 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/pc-bios/s390-ccw.img b/pc-bios/s390-ccw.img
index 554fcbd1b7af8ea5f8f0d887fba98d52b7a8611d..c9a5a21c50b9e78a7048d456d842ddbfdf9e6ba3 100644
GIT binary patch
delta 7990
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

delta 7429
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
H>*T)x;j>b2

-- 
2.31.1



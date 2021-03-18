Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82886340EDB
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 21:11:24 +0100 (CET)
Received: from localhost ([::1]:54268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMyzL-0000vb-If
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 16:11:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lMyxw-0008Gc-UX
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 16:09:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lMyxu-0001n2-PM
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 16:09:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616098194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DT+LgJ0eW9zhxD7NCxfjN+e3TecrLzcSBJID/qgoVvo=;
 b=N35oDunXTOFOOoJxdZYnFjnTOFoGZgBE9JjDZjF2NeEiM0ZLtgOMu+f0XaDJL3pTfIdRcJ
 W95I58nCQUcB0l6B7GadwPckk2GI+2/Wnk2/2K7aTsFHlG0CNpSmjvYc9yG6s8GrIXQxz+
 tGsqaEpqYJskZUdAzVfafTuqrlm2BHk=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-kalQgLsTNRSvlB0-lRmWqw-1; Thu, 18 Mar 2021 16:09:52 -0400
X-MC-Unique: kalQgLsTNRSvlB0-lRmWqw-1
Received: by mail-oi1-f198.google.com with SMTP id t186so3001835oih.1
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 13:09:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DT+LgJ0eW9zhxD7NCxfjN+e3TecrLzcSBJID/qgoVvo=;
 b=PHNHn0ylqEUWZrcyoyF5GI9O0Zz86CwsQnlenFNeGuAVpZEmV9nT5r8QgbGh/WbGsj
 YVT3OmeriI+kKlOYEVcgknoAbP/Be+S++M9Uqg3KDLLsbakewOt4PT+hfkOWpbVjW+3M
 CatwLD4vAP/ZrcduFK/GqSxCMjTdPeH4uMKYj0Qj4hNPn8lemryeDkC/6iQrLejIdbxc
 jb/p54KI7PzaF0WuUUftqDWfU2bcIG308X6CXmiG0m/mHVE8QZWOhMvthzAqlh6sG77P
 g/WRGm23JW2ZI7JyH6G+Bz2g9S92ktPONQFAMgoHGtUDwTgeIRny1j7H6ddSoPLFLSgK
 9W6g==
X-Gm-Message-State: AOAM530D+AR+zeoutn2+AxZTCbExX/TRvE7syV5q5gRka2Knck27aq1n
 I//OAkmgj8Oc/VJMZJOzMVul1QvO4qcqFsEWMng4do7P7vtZD8YMcTr/nEQfPI0D9YAmEn/khE4
 7pgXgm5ZMGOceNnU=
X-Received: by 2002:aca:4785:: with SMTP id u127mr4086039oia.163.1616098191899; 
 Thu, 18 Mar 2021 13:09:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDhzrCK4CIPM01f94qcZLrR315MLV7pauD7XFDvRd9wXeZGxI3kP4R7iyCu8aLrIj11bEx7Q==
X-Received: by 2002:aca:4785:: with SMTP id u127mr4086032oia.163.1616098191749; 
 Thu, 18 Mar 2021 13:09:51 -0700 (PDT)
Received: from redhat.redhat.com (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id o23sm697833otp.45.2021.03.18.13.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 13:09:51 -0700 (PDT)
From: Connor Kuehl <ckuehl@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 1/1] iotests: fix 051.out expected output after error text
 touchups
Date: Thu, 18 Mar 2021 15:09:49 -0500
Message-Id: <20210318200949.1387703-2-ckuehl@redhat.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210318200949.1387703-1-ckuehl@redhat.com>
References: <20210318200949.1387703-1-ckuehl@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A patch was recently applied that touched up some error messages that
pertained to key names like 'node-name'. The trouble is it only updated
tests/qemu-iotests/051.pc.out and not tests/qemu-iotests/051.out as
well.

Do that now.

Fixes: 785ec4b1b9 ("block: Clarify error messages pertaining to
'node-name'")
Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
---
 tests/qemu-iotests/051.out | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/051.out b/tests/qemu-iotests/051.out
index de4771bcb3..db8c14b903 100644
--- a/tests/qemu-iotests/051.out
+++ b/tests/qemu-iotests/051.out
@@ -61,13 +61,13 @@ QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) quit
 
 Testing: -drive file=TEST_DIR/t.qcow2,node-name=123foo
-QEMU_PROG: -drive file=TEST_DIR/t.qcow2,node-name=123foo: Invalid node name
+QEMU_PROG: -drive file=TEST_DIR/t.qcow2,node-name=123foo: Invalid node-name: '123foo'
 
 Testing: -drive file=TEST_DIR/t.qcow2,node-name=_foo
-QEMU_PROG: -drive file=TEST_DIR/t.qcow2,node-name=_foo: Invalid node name
+QEMU_PROG: -drive file=TEST_DIR/t.qcow2,node-name=_foo: Invalid node-name: '_foo'
 
 Testing: -drive file=TEST_DIR/t.qcow2,node-name=foo#12
-QEMU_PROG: -drive file=TEST_DIR/t.qcow2,node-name=foo#12: Invalid node name
+QEMU_PROG: -drive file=TEST_DIR/t.qcow2,node-name=foo#12: Invalid node-name: 'foo#12'
 
 
 === Device without drive ===
-- 
2.30.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E543243982C
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 16:10:42 +0200 (CEST)
Received: from localhost ([::1]:34502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf0gU-000099-0k
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 10:10:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mf0de-0004cJ-Ly
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 10:07:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mf0dc-0005vA-RN
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 10:07:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635170864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8erAyC6VVUD5BfIdlIquvBBvcuoZlRJKReRhticBUKs=;
 b=FaAdV3lP6I1qKzXYt40SZ7qtYf2DZDQwzppYxIXzTQFiTCNwmztDU/VhTf6cq/oBslLMAH
 M2xDS2aSyf4YUnS/l5R4V6Uykz5qZGTsZ4uSe4hxC1qi9L756XNjcKp1KQGRy5m9y+oRhF
 yyeV24bWlU7m9EifzH894OowKdVGuq0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-LsauKrBTNNevuJKiw5155Q-1; Mon, 25 Oct 2021 10:07:41 -0400
X-MC-Unique: LsauKrBTNNevuJKiw5155Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3FE38018AC;
 Mon, 25 Oct 2021 14:07:39 +0000 (UTC)
Received: from localhost (unknown [10.39.192.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C99BD19D9D;
 Mon, 25 Oct 2021 14:07:17 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC 0/2] tls: add macros for coroutine-safe TLS variables
Date: Mon, 25 Oct 2021 15:07:14 +0100
Message-Id: <20211025140716.166971-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: fweimer@redhat.com, Kevin Wolf <kwolf@redhat.com>, thuth@redhat.com,
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a preview of how we can solve the coroutines TLS problem. Coroutine=
s=0D
re-entered from another thread sometimes see stale TLS values. This happens=
=0D
because compilers may cache values across yield points, so a value from the=
=0D
previous thread will be used when the coroutine is re-entered in another=0D
thread.=0D
=0D
Serge Guelton developed this technique, see the first patch for details. I'=
m=0D
submitting it for discussion before I go ahead with a full conversion of th=
e=0D
source tree.=0D
=0D
Todo:=0D
- Convert all uses of __thread=0D
- Extend checkpatch.pl to reject code that uses __thread=0D
=0D
Stefan Hajnoczi (2):=0D
  tls: add macros for coroutine-safe TLS variables=0D
  util/async: replace __thread with QEMU TLS macros=0D
=0D
 MAINTAINERS        |   1 +=0D
 include/qemu/tls.h | 142 +++++++++++++++++++++++++++++++++++++++++++++=0D
 util/async.c       |  12 ++--=0D
 3 files changed, 150 insertions(+), 5 deletions(-)=0D
 create mode 100644 include/qemu/tls.h=0D
=0D
--=20=0D
2.31.1=0D
=0D



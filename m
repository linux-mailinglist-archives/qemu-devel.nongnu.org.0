Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 756854D036C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 16:50:54 +0100 (CET)
Received: from localhost ([::1]:50750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRFdN-0005JR-J3
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 10:50:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nRFS2-0000Rz-J4
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 10:39:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nRFS1-0004Aj-4U
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 10:39:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646667548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9hI0WnxZmkfkYA88tElMOUGMwF1uu21cYybKyao9/sU=;
 b=G9C8oyqeDIr/FU9kGYqF0BQ8h5ipSv3EcFegWHfBExHLGIVCda4OEdzaEQTDraCB45OstL
 Cj8OhQ6bQHRWsNyz9q4munOmXconuXv6tFzebCz6FPo8Xchgq1NG66mHpGs9klqdjyMf1f
 B035pzLUDx0eYbPZjIsLmWVlob3PoUw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-juYJ7PpmOdiiTBaCXvDOGA-1; Mon, 07 Mar 2022 10:39:07 -0500
X-MC-Unique: juYJ7PpmOdiiTBaCXvDOGA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31E021856A65;
 Mon,  7 Mar 2022 15:39:06 +0000 (UTC)
Received: from localhost (unknown [10.39.193.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7474C866EC;
 Mon,  7 Mar 2022 15:38:54 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] coroutine: use QEMU_DEFINE_STATIC_CO_TLS()
Date: Mon,  7 Mar 2022 15:38:50 +0000
Message-Id: <20220307153853.602859-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, Stefan Weil <sw@weilnetz.de>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The coroutine implementation uses __thread variables internally. Compiler=
=0D
optimizations may cache Thread-Local Storage values across=0D
qemu_coroutine_yield(), leading to stale values being used after the corout=
ine=0D
is re-entered from another thread.=0D
=0D
Kevin pointed out that the coroutine implementation itself is vulnerable to=
=0D
this problem. As a follow-up to my coroutine TLS patch series I'm sending t=
hese=0D
patches to convert __thread variables to the new "qemu/coroutine-tls.h" mac=
ros=0D
so they are safe.=0D
=0D
Stefan Hajnoczi (3):=0D
  coroutine-ucontext: use QEMU_DEFINE_STATIC_CO_TLS()=0D
  coroutine: use QEMU_DEFINE_STATIC_CO_TLS()=0D
  coroutine-win32: use QEMU_DEFINE_STATIC_CO_TLS()=0D
=0D
 util/coroutine-ucontext.c | 38 +++++++++++++++++++++++-------------=0D
 util/coroutine-win32.c    | 18 ++++++++++++-----=0D
 util/qemu-coroutine.c     | 41 +++++++++++++++++++++++----------------=0D
 3 files changed, 61 insertions(+), 36 deletions(-)=0D
=0D
--=20=0D
2.35.1=0D
=0D



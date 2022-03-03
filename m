Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C3C4CC387
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 18:15:55 +0100 (CET)
Received: from localhost ([::1]:40158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPp3R-0001RR-OM
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 12:15:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nPp1j-0000c5-Ag
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 12:14:07 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:36941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nPp1h-0005bF-Kz
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 12:14:06 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-tL2oDBD7MMGK44P6s8DaTw-1; Thu, 03 Mar 2022 12:14:01 -0500
X-MC-Unique: tL2oDBD7MMGK44P6s8DaTw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B6ED51DC;
 Thu,  3 Mar 2022 17:14:00 +0000 (UTC)
Received: from bahia.redhat.com (unknown [10.39.193.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A073784965;
 Thu,  3 Mar 2022 17:13:24 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] virtiofsd: Support FUSE_SYNCFS on unannounced submounts
Date: Thu,  3 Mar 2022 18:13:21 +0100
Message-Id: <20220303171323.580712-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: German Maglione <gmaglione@redhat.com>,
 Sebastian Hasler <sebastian.hasler@stuvus.uni-stuttgart.de>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 virtio-fs@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the current patches I have : one to track submounts=0D
and the other to call syncfs() on them. Tested on simple=0D
cases only.=0D
=0D
I won't be able to work on this anymore, so I'm posting for the=0D
records. Anyone is welcome to pick it up as there won't be a v2=0D
from my side.=0D
=0D
Cheers,=0D
=0D
--=0D
Greg=0D
=0D
Greg Kurz (2):=0D
  virtiofsd: Track submounts=0D
  virtiofsd: Support FUSE_SYNCFS on unannounced submounts=0D
=0D
 tools/virtiofsd/passthrough_ll.c | 61 ++++++++++++++++++++++++++++----=0D
 1 file changed, 55 insertions(+), 6 deletions(-)=0D
=0D
--=20=0D
2.34.1=0D
=0D



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B98756195C3
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 13:03:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqvQ0-0000H9-80; Fri, 04 Nov 2022 08:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1oqvPb-0000E3-9G
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 08:03:03 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1oqvPZ-00044j-Dx
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 08:03:02 -0400
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-527-vJKZLTJiOD2Nd9Vp5mvg_Q-1; Fri, 04 Nov 2022 08:01:02 -0400
X-MC-Unique: vJKZLTJiOD2Nd9Vp5mvg_Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0DC8929AB3F7;
 Fri,  4 Nov 2022 12:01:02 +0000 (UTC)
Received: from bahia.redhat.com (unknown [10.39.192.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B94F9403161;
 Fri,  4 Nov 2022 12:01:00 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 0/2] util/log: Make the per-thread flag immutable
Date: Fri,  4 Nov 2022 13:00:57 +0100
Message-Id: <20221104120059.678470-1-groug@kaod.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

While working on the "util/log: Always send errors to logfile when daemoniz=
ed"=0D
series [1], I've encountered some issues with the per-thread flag. They ste=
m=0D
from the code not being designed to allow the per-thread flag to be enabled=
=0D
or disabled more than once, but nothing is done to prevent that from=0D
happening. This results in unexpected results like the creation of a log=0D
file with a `%d` in its name or confusing errors when using the `log`=0D
command in the monitor.=0D
=0D
I'm posting fixes separately now in case it makes sense to merge them durin=
g=0D
soft freeze. If so, I'll open an issue as explained in this recent mail [2]=
.=0D
=0D
[1] https://patchew.org/QEMU/20221019151651.334334-1-groug@kaod.org/=0D
[2] https://lists.nongnu.org/archive/html/qemu-devel/2022-11/msg00137.html=
=0D
=0D
Date: Wed, 19 Oct 2022 17:16:49 +0200=0D
Message-ID: <20221019151651.334334-1-groug@kaod.org>=0D
=0D
Greg Kurz (2):=0D
  util/log: Make the per-thread flag immutable=0D
  util/log: Ignore per-thread flag if global file already there=0D
=0D
 util/log.c | 9 +++++++++=0D
 1 file changed, 9 insertions(+)=0D
=0D
-- =0D
2.38.1=0D
=0D



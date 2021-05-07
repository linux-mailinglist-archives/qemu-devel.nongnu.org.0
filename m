Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FA337664B
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 15:39:06 +0200 (CEST)
Received: from localhost ([::1]:50686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf0h7-0004Aa-5V
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 09:39:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lf0fF-00030p-QN
 for qemu-devel@nongnu.org; Fri, 07 May 2021 09:37:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lf0fC-0007mp-Mg
 for qemu-devel@nongnu.org; Fri, 07 May 2021 09:37:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620394624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=etG0SOdB+gkph+XHl+FlTUHnkD4VJesdgyOJMb32xJI=;
 b=ZRzabdq8eZ9lilOrbdDoOy+fgrvIjpqqpUz5fxvL0Az4xrL3qzaJ9II3WoArqg/qz51Kjo
 FkY810/88IUIXAjVzXhGNZLZ09gqf0NzedHUfBkv5vihtlXdpj+cMLRlHMK/Cq73v7220f
 1MtjScr+80q99SRyJs4Eo38Y5zsFcVc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-a14nQy7CMZe1432E2ty5nA-1; Fri, 07 May 2021 09:37:01 -0400
X-MC-Unique: a14nQy7CMZe1432E2ty5nA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C38BD8189DF;
 Fri,  7 May 2021 13:37:00 +0000 (UTC)
Received: from foo.redhat.com (ovpn-114-155.ams2.redhat.com [10.36.114.155])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16FD25C1C5;
 Fri,  7 May 2021 13:36:51 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] i386: use better matching family/model/stepping for
 generic CPUs
Date: Fri,  7 May 2021 14:36:48 +0100
Message-Id: <20210507133650.645526-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is in response to this bug report:=0D
=0D
   https://gitlab.com/qemu-project/qemu/-/issues/191=0D
=0D
The generic 'qemu64' and 'max' CPUs currently defined to report a=0D
family/model/stepping that approximately corresponds to an AMD K7=0D
vintage architecture. The K7 series predates the introduction of=0D
64-bit support by AMD in the K8 series. This has been reported to=0D
lead to LLVM complaints about generating 64-bit code for a 32-bit=0D
CPU target=0D
=0D
  LLVM ERROR: 64-bit code requested on a subtarget that doesn't support it!=
=0D
=0D
The bug report is fairly limited, but it suggests LLVM looks at the=0D
family/model/stepping and decides it to be 32-bit, despite qemu64=0D
reporting it is 64-bit capable. I've not reproduced this myself,=0D
however, so I'm largely trusting the original reporter's diagnosis=0D
=0D
Of course interpreting the family/model/stepping only makes sense=0D
with scoped to the reported vendor ID.  Under TCG, the vendor is=0D
honoured, but AFAICT, under KVM the vendor defined by the QEMU=0D
model model is ignored and the real host vendor passed through.=0D
This will make the chosen family/model/stepping non-sensical when=0D
run under KVM on an Intel host.=0D
=0D
None the less these patches change to report a CPUID with the=0D
family, model and stepping taken from a=0D
=0D
 AMD Athlon(tm) 64 X2 Dual Core Processor 4000+=0D
=0D
which is one of the first 64-bit AMD CPUs. This is at least more=0D
accurate in terms of the static CPU model definition, even if it=0D
is still nonsense in the case where KVM overrides the vendor to=0D
be non-AMD.=0D
=0D
Daniel P. Berrang=C3=A9 (2):=0D
  i386: use better matching family/model/stepping for 'qemu64' CPU=0D
  i386: use better matching family/model/stepping for 'max' CPU=0D
=0D
 hw/i386/pc.c      |  6 +++++-=0D
 target/i386/cpu.c | 12 +++++++++---=0D
 2 files changed, 14 insertions(+), 4 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D



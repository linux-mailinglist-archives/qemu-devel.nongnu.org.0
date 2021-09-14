Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F53D40B3FC
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 17:59:27 +0200 (CEST)
Received: from localhost ([::1]:42798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQAqE-0002KY-38
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 11:59:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1mQAjR-00017c-FL
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 11:52:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1mQAjQ-0002p0-0U
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 11:52:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631634740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rsc7F78hfpb2cAPyQAe2qVvV2kE4WtG8AgRwBpIg1Ek=;
 b=gN3+S48OYs2B9Q64FHWV5HU+BEOagPrJP60go8TaCcNYAMcNoVL0rl8icO21WVXCUBaivi
 /pLaMnosooKXEto8+fXP73cOt1GVLnci2jzlZegzSHgdxd+/VMY29NV9I6kwaUTjXGw6Tl
 /7BS7VWQWo5zPgvAHUfHvOHpJmTZFV8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-HMinhiJtNM6AW3I-2Hl-Pw-1; Tue, 14 Sep 2021 11:52:19 -0400
X-MC-Unique: HMinhiJtNM6AW3I-2Hl-Pw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC6A1835DEA;
 Tue, 14 Sep 2021 15:52:17 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 141875D9D3;
 Tue, 14 Sep 2021 15:52:15 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] KVM: qemu patches for few KVM features I developed
Date: Tue, 14 Sep 2021 18:52:11 +0300
Message-Id: <20210914155214.105415-1-mlevitsk@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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
Cc: kvm@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These patches implement the qemu side logic to support=0D
the KVM features I developed recently.=0D
=0D
First two patches are for features that are already accepted=0D
upstream, and I already posted them on the qemu mailing list once.=0D
=0D
And the 3rd patch is for nested TSC scaling on SVM=0D
which isn't yet accepted in KVM but can already be added to qemu since=0D
it is conditional on KVM supporting it, and ABI wise it only relies=0D
on SVM spec.=0D
=0D
Best regards,=0D
    Maxim Levitsky=0D
=0D
Maxim Levitsky (3):=0D
  KVM: use KVM_{GET|SET}_SREGS2 when supported.=0D
  gdbstub: implement NOIRQ support for single step on KVM=0D
  KVM: SVM: add migration support for nested TSC scaling=0D
=0D
 accel/kvm/kvm-all.c   |  30 +++++++++++=0D
 gdbstub.c             |  60 +++++++++++++++++----=0D
 include/sysemu/kvm.h  |  17 ++++++=0D
 target/i386/cpu.c     |   5 ++=0D
 target/i386/cpu.h     |   7 +++=0D
 target/i386/kvm/kvm.c | 122 +++++++++++++++++++++++++++++++++++++++++-=0D
 target/i386/machine.c |  53 ++++++++++++++++++=0D
 7 files changed, 282 insertions(+), 12 deletions(-)=0D
=0D
-- =0D
2.26.3=0D
=0D



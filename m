Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 326212DD490
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 16:50:47 +0100 (CET)
Received: from localhost ([::1]:35604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpvYE-0008Uj-7f
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 10:50:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kpvMB-0003es-Ez
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 10:38:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kpvM9-00078l-Ud
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 10:38:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608219497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zQFqj5HTBDwVcYiBQoeLw0j6oXEPEaHi/2xsFKzjnTU=;
 b=HUeYwyATymkmNbZkbcX7G42wePVm/uV5xe4bqc4+5TXI34Lwfb34/fFoZhqWFWFZSXcy9Y
 sB/CZqlNIxWBq8hqD1PS7nt5kHXDAwHUra0me2LTOiYrL8KOrb6k+vnzqvXvTYbBVMHJag
 6hcN+Yhm9kHvs5OhhTfwiLzU816ysYc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-LKIbtA6mMz-bfjurfFElwQ-1; Thu, 17 Dec 2020 10:38:15 -0500
X-MC-Unique: LKIbtA6mMz-bfjurfFElwQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95A4918C8C00;
 Thu, 17 Dec 2020 15:38:14 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 699F910013C0;
 Thu, 17 Dec 2020 15:38:12 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] Quality of life patches for qemu coroutine debugging
Date: Thu, 17 Dec 2020 17:38:09 +0200
Message-Id: <20201217153811.919932-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These are two patches that improve a bit the qemu gdb scripts in regard to=
=0D
coroutines.=0D
=0D
First patch fixes a bug in 'qemu coroutine' in regard to usage on non topmo=
st=0D
stack frame.=0D
=0D
Second patch implements 'qemu bt' as Stefan suggested.=0D
=0D
Best regards,=0D
        Maxim Levitsky=0D
=0D
Maxim Levitsky (2):=0D
  scripts/gdb: fix 'qemu coroutine' when users selects a non topmost=0D
    stack frame=0D
  scripts/gdb: implement 'qemu bt'=0D
=0D
 scripts/qemu-gdb.py          |  1 +=0D
 scripts/qemugdb/coroutine.py | 39 +++++++++++++++++++++++++++++++++++-=0D
 2 files changed, 39 insertions(+), 1 deletion(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 023322A6D3D
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Nov 2020 19:55:44 +0100 (CET)
Received: from localhost ([::1]:43392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaNwd-0006PJ-1k
	for lists+qemu-devel@lfdr.de; Wed, 04 Nov 2020 13:55:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kaNrg-0006f7-Ub
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 13:50:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kaNre-0003HF-6H
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 13:50:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604515833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZrsEWcwgjrit6biRucwbyfWIuGqVVJkJCDkQvHdrhB4=;
 b=NIK92hf70vDNABXl2L8qigrjhZ2r5AOX0X1hEfGDhTEd4sNXbraLNzJ7OmvuIgxJ6TYgAl
 Ons6i+4tFcFhTQGP4i+fyGgUyCx8DoqURnFd8RpbyDRWrOOmVUAiYJw0BYp618TII/U7DZ
 udu7HKonUQ4bpU2F8iNz2atyZ7I6YpQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-X2NcpeKjM0a6DNa_We5ang-1; Wed, 04 Nov 2020 13:50:31 -0500
X-MC-Unique: X2NcpeKjM0a6DNa_We5ang-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 709341084D60;
 Wed,  4 Nov 2020 18:50:30 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.207.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE9CD6266E;
 Wed,  4 Nov 2020 18:50:26 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] Assorted fixes to tests that were broken by recent
 scsi changes
Date: Wed,  4 Nov 2020 20:50:23 +0200
Message-Id: <20201104185025.434703-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 22:09:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While most of the patches in V1 of this series are already merged upstream,=
=0D
the patch that fixes iotest 240 was broken on s390 and was not accepted.=0D
=0D
This is=09an updated version of this patch, based on Paulo's suggestion,=0D
that hopefully makes this iotest work on both x86 and s390.=0D
=0D
V3: addressed review feedback=0D
=0D
Best regards,=0D
=09Maxim Levitsky=0D
=0D
Maxim Levitsky (2):=0D
  iotests: add filter_qmp_virtio_scsi function=0D
  iotests: rewrite iotest 240 in python=0D
=0D
 tests/qemu-iotests/240        | 219 ++++++++++++++--------------------=0D
 tests/qemu-iotests/240.out    |  76 ++++++------=0D
 tests/qemu-iotests/iotests.py |  10 ++=0D
 3 files changed, 140 insertions(+), 165 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D



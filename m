Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 735422AF855
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 19:41:31 +0100 (CET)
Received: from localhost ([::1]:32780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcv3f-0001SS-0f
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 13:41:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kcv0r-00007f-3M
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 13:38:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kcv0o-0007tc-PM
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 13:38:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605119908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BWP1z0zZdyz2OW0tFR8YxbeogZ96/ppob0q/HhuqH2k=;
 b=gV0Pbc/x2oYWTTUrgpFRNbZ/ZkNFuE+zI5ha/8ApYOeF4tZyMLYAdDn4p59gZ6RjK82cWt
 /IG6ScPQNElo5U2Ccc41bk6IFzvR8i1HosYZqzZFzDXlmPsxtzIqISCn9uW84938VVHjCf
 pnEIo7yejpA5dPlli/71NFslrS3MC/I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-eVxXrkKWPF6xz3-VGWAbSg-1; Wed, 11 Nov 2020 13:38:26 -0500
X-MC-Unique: eVxXrkKWPF6xz3-VGWAbSg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C00441006C85
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 18:38:25 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8919B60CD0;
 Wed, 11 Nov 2020 18:38:25 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/12] qom: Convert some properties to class properties
Date: Wed, 11 Nov 2020 13:38:11 -0500
Message-Id: <20201111183823.283752-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: John Snow <jsnow@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Class properties make QOM introspection simpler and easier, as it=0D
doesn't require an object to be instantiated.  This series=0D
converts a few existing object_property_add*() calls to register=0D
class properties instead.=0D
=0D
Changes v1 -> v2:=0D
* Bug fix at "i386: Register feature bit properties as class properties"=0D
* Included patches that were originally submnitted as part of=0D
  "qom: Make all -object types use only class properties"=0D
* All other patches are unchanged from v1=0D
=0D
Eduardo Habkost (12):=0D
  vexpress: Register "secure" as class property=0D
  vexpress-a15: Register "virtualization" as class property=0D
  tmp421: Register properties as class properties=0D
  i386: Register feature bit properties as class properties=0D
  arm/virt: Register most properties as class properties=0D
  virt: Register "its" as class property=0D
  arm/cpu64: Register "aarch64" as class property=0D
  can_host: Use class properties=0D
  colo: Use class properties=0D
  netfilter: Reorder functions=0D
  netfilter: Use class properties=0D
  input: Use class properties=0D
=0D
 hw/arm/vexpress.c     | 25 ++++++------=0D
 hw/arm/virt.c         | 88 +++++++++++++++++++++++--------------------=0D
 hw/misc/tmp421.c      | 30 +++++++--------=0D
 net/can/can_host.c    | 16 +++-----=0D
 net/colo-compare.c    | 57 ++++++++++++++--------------=0D
 net/dump.c            | 10 ++---=0D
 net/filter-buffer.c   | 26 ++++++-------=0D
 net/filter-mirror.c   | 64 +++++++++++++++----------------=0D
 net/filter-rewriter.c |  7 ++--=0D
 net/filter.c          | 24 ++++++------=0D
 target/arm/cpu64.c    | 16 +++-----=0D
 target/i386/cpu.c     | 40 ++++++++------------=0D
 ui/input-barrier.c    | 22 +++++++++++=0D
 ui/input-linux.c      | 14 +++++++=0D
 14 files changed, 231 insertions(+), 208 deletions(-)=0D
=0D
--=20=0D
2.28.0=0D
=0D



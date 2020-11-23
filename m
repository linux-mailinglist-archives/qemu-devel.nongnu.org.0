Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1765C2C14C3
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 20:52:51 +0100 (CET)
Received: from localhost ([::1]:54818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khHtK-00088G-2U
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 14:52:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khHpQ-0006Cp-92
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:48:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khHpO-0007lk-4Z
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:48:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606160923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KCJ3F5piHSCFTXqtybKk/yRZJKA7CcQobZuLyCQSt3A=;
 b=Iq+2YLQdcHnCeuCcwiEj11v3uFzL9/fBmLKBPrFTD7p0QXe/NrpDDMSYKDQf/kSsF+kkAW
 TMu8FrLHCn1vhkvRdyVchVWHTDFkZQ2Y4froTYDbhBfqaPqbBo3o7OiVBaRvifU6f5Cgzt
 Yo0USpa8RrBdgsoH22KHICaKR0PDOMI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-OENu5oftPtCFt-jTQnm3vg-1; Mon, 23 Nov 2020 14:48:36 -0500
X-MC-Unique: OENu5oftPtCFt-jTQnm3vg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0E8484A5F2
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 19:48:20 +0000 (UTC)
Received: from localhost (unknown [10.10.67.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 67D4560C04;
 Mon, 23 Nov 2020 19:48:20 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/19] qom: Use qlit to represent property defaults
Date: Mon, 23 Nov 2020 14:47:59 -0500
Message-Id: <20201123194818.2773508-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: 20201104160021.2342108-1-ehabkost@redhat.com=0D
Git branch: https://gitlab.com/ehabkost/qemu/-/commits/work/qdev-qlit-defau=
lts=0D
=0D
This extend qlit.h to support all QNum types (signed int,=0D
unsigned int, and double), and use QLitObject to represent field=0D
property defaults.=0D
=0D
It allows us to get rid of most type-specific .set_default_value=0D
functions for QOM property types.=0D
=0D
The only remaining .set_default_value function in the code is=0D
field_prop_set_default_value_enum().  This will take a bit more=0D
work because the default is currently stored as int, but parsed=0D
as string, so it will be addressed in a separate series.=0D
=0D
Changes v2 -> v3:=0D
=0D
* qnum/qlit patches:=0D
  * Variable naming in qnum code=0D
  * Coding style changes in qnum code=0D
  * Split "qlit: Support all types of QNums"=0D
    in smaller patches=0D
  * Replace QLIT_QNUM with QLIT_QNUM_INT=0D
  * Extend test cases, move most of the new test case code to=0D
    check-qlit.c=0D
  * Remove qnum_get_value() and qlit_get_type() function=0D
  * Removed kernel-doc conversion patch, to reduce noise in series review=
=0D
* qom patches:=0D
  * Split "qom: Use qlit to represent property defaults" in=0D
    smaller patches, hopefully making review easier=0D
  * Small changes in UUID property code (See=0D
    "qom: Don't ignore defval on UUID property" and=0D
    "qom: Fix documentation of UUID property type")=0D
=0D
Changes v1 -> v2:=0D
* Rebase to latest version of field properties series=0D
* Fix unit test failure=0D
* Coding style changes=0D
=0D
Eduardo Habkost (19):=0D
  qnum: Make qnum_get_double() get const pointer=0D
  qnum: Make num_x/num_y variables at qnum_is_equal() const=0D
  qnum: QNumValue type for QNum value literals=0D
  qnum: qnum_value_is_equal() function=0D
  qlit: Use qnum_value_is_equal() when comparing QNums=0D
  qlit: Rename QLIT_QNUM to QLIT_QNUM_INT=0D
  qlit: Use QNumValue to represent QNums=0D
  qlit: Move qlit_equal_qobject() reference values to array=0D
  qlit: Add more test literals to qlit_equal_qobject() test case=0D
  qlit: Support all types of QNums=0D
  qom: field_prop_set_default_value() helper=0D
  qom: Replace defval value in Property with QLitObject=0D
  qom: Fix documentation of UUID property type=0D
  qom: Don't ignore defval on UUID property=0D
  qom: Make object_property_set_default() public=0D
  qom: Make PropertyInfo.set_default_value optional=0D
  qom: Delete field_prop_set_default_value_*int()=0D
  qom: Delete set_default_uuid()=0D
  qom: Delete set_default_value_bool()=0D
=0D
 include/hw/qdev-properties-system.h   |   4 +-=0D
 include/qapi/qmp/qlit.h               |  11 ++-=0D
 include/qapi/qmp/qnum.h               |  26 +++++-=0D
 include/qom/field-property-internal.h |   7 +-=0D
 include/qom/field-property.h          |  30 +++----=0D
 include/qom/object.h                  |  11 +++=0D
 include/qom/property-types.h          |  18 ++--=0D
 hw/core/qdev-properties-system.c      |  13 +--=0D
 qobject/qlit.c                        |   5 +-=0D
 qobject/qnum.c                        | 113 ++++++++++++++------------=0D
 qom/field-property.c                  |  36 ++++++--=0D
 qom/object.c                          |   2 +-=0D
 qom/property-types.c                  |  37 ++-------=0D
 tests/check-qjson.c                   |  30 +++----=0D
 tests/check-qlit.c                    |  72 +++++++++++++---=0D
 tests/check-qnum.c                    |  14 ++--=0D
 16 files changed, 253 insertions(+), 176 deletions(-)=0D
=0D
--=20=0D
2.28.0=0D
=0D



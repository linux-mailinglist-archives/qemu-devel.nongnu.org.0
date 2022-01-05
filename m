Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 652F7485314
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 13:56:33 +0100 (CET)
Received: from localhost ([::1]:58424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n55qC-0008Dm-EY
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 07:56:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n55ZE-0005u0-NL
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 07:39:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n55ZC-0001Ad-C5
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 07:38:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641386337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bqdbEq/0hcanE9PpIjZdOOp/7ePN0TWz+oJqmCTGOnE=;
 b=XVLFjpRC7f90jOEsKjUHglUGDG/8fEoj8MENLNqdVaK/HMTTpZ2UcQpxveKhObVFTx7HZD
 6r3Aph0/KGunpyGdHZZUpYp+0DyA+N5t7kL6/yNtvV9TioiLZ/SwaFmM8gBJ3zdH3I9KUf
 j/6Dlnf27LV9WHNw106enayX76CLSaI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-msHFuGdLN_-qUE132MDCzA-1; Wed, 05 Jan 2022 07:38:56 -0500
X-MC-Unique: msHFuGdLN_-qUE132MDCzA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3864344E6;
 Wed,  5 Jan 2022 12:38:55 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8BC67316C;
 Wed,  5 Jan 2022 12:38:48 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/1] Fix -device JSON support wrt hotplug
Date: Wed,  5 Jan 2022 12:38:46 +0000
Message-Id: <20220105123847.4047954-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Libvirt switched to using -device JSON support, but we discovered in=0D
testing that it is broken for hotplug, never sending DEVICE_DELETED=0D
events. This is caused by a subtle refcount leak.=0D
=0D
Daniel P. Berrang=C3=A9 (1):=0D
  softmmu: fix device deletion events with -device JSON syntax=0D
=0D
 qapi/qdev.json                 |  5 ++++-=0D
 softmmu/vl.c                   |  4 +++-=0D
 tests/qtest/device-plug-test.c | 19 +++++++++++++++++++=0D
 3 files changed, 26 insertions(+), 2 deletions(-)=0D
=0D
--=20=0D
2.33.1=0D
=0D



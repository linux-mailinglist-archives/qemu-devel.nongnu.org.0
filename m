Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A84CC3A2B75
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 14:24:35 +0200 (CEST)
Received: from localhost ([::1]:48502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrJje-0000rY-IS
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 08:24:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lrJiU-000092-W3
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 08:23:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lrJiP-0006tm-Ky
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 08:23:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623327795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=508Y80UcSxfBLw8PvKE4Cas3Cvo+fbyQc3KYwiWonIE=;
 b=Gtuci4Ydq1+u93leUG9KWnX9qC6ryK1+GH4Ad6+dFKZepKI1bKDDEHzyFyaRCDps0ttUiW
 tC2vtynmkjxCGJzrGA2/0MpjXCfPWrHuHzI45eDkcwx7rzgazNFBYJeliuw5tJYJcPtUXM
 BrrbHBUtiSgbekH5Vj280Q6IUKPzAqA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-VrizshAlMRSGLAluliUDYw-1; Thu, 10 Jun 2021 08:23:12 -0400
X-MC-Unique: VrizshAlMRSGLAluliUDYw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31EF0803621;
 Thu, 10 Jun 2021 12:23:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-69.ams2.redhat.com
 [10.36.113.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 46C1C5D6BA;
 Thu, 10 Jun 2021 12:23:07 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B8DD718000B2; Thu, 10 Jun 2021 14:23:05 +0200 (CEST)
Date: Thu, 10 Jun 2021 14:23:05 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH 0/4] modules: add support for target-specific modules.
Message-ID: <20210610122305.zxdaqsft5evcrli6@sirius.home.kraxel.org>
References: <20210610101553.943689-1-kraxel@redhat.com>
 <4a1a23af-461f-92c4-d9f0-1f8133d611db@suse.de>
MIME-Version: 1.0
In-Reply-To: <4a1a23af-461f-92c4-d9f0-1f8133d611db@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, jose.ziviani@suse.com, pbonzini@redhat.com,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 10, 2021 at 12:34:14PM +0200, Claudio Fontana wrote:
> On 6/10/21 12:15 PM, Gerd Hoffmann wrote:
> > Based on the "modules: add metadata database" patch series sent
> > earlier today.  Adds support for target-specific modules to the
> > module code and build infrastructure.  Builds one simple module
> > (virtio-9p-device) for testing purposes.  Well, one module per
> > target to be exact ;)
> > 
> > Gerd Hoffmann (4):
> >   modules: factor out arch check
> >   modules: check arch on qom lookup
> >   modules: target-specific module build infrastructure
> >   modules: build virtio-9p modular
> > 
> >  hw/9pfs/virtio-9p-device.c |  2 ++
> >  util/module.c              | 30 ++++++++++++++++++++++++------
> >  hw/9pfs/meson.build        | 11 ++++++++++-
> >  meson.build                | 26 ++++++++++++++++++++++++++
> >  4 files changed, 62 insertions(+), 7 deletions(-)
> > 
> 
> Very interesting, Cc:ing also Philippe on this.

Build qtest modular on top of that was easy, patch below.

I'm not convinced though that the approach will work for other
accelerators too given that they have dependencies to directories
outside accel/ ...

full branch:
  https://git.kraxel.org/cgit/qemu/log/?h=sirius/modinfo-playground

take care,
  Gerd

------------------------- cut here ----------------------
From baa7ca6bc334b043d25acd659c8d44697a2fc197 Mon Sep 17 00:00:00 2001
From: Gerd Hoffmann <kraxel@redhat.com>
Date: Thu, 10 Jun 2021 13:59:25 +0200
Subject: [PATCH] modules: build qtest accel modular

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 accel/accel-common.c    | 2 +-
 accel/qtest/qtest.c     | 3 +++
 accel/meson.build       | 4 ++++
 accel/qtest/meson.build | 7 +++----
 4 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/accel/accel-common.c b/accel/accel-common.c
index cf07f78421d6..7b8ec7e0f72a 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -44,7 +44,7 @@ static const TypeInfo accel_type = {
 AccelClass *accel_find(const char *opt_name)
 {
     char *class_name = g_strdup_printf(ACCEL_CLASS_NAME("%s"), opt_name);
-    AccelClass *ac = ACCEL_CLASS(object_class_by_name(class_name));
+    AccelClass *ac = ACCEL_CLASS(module_object_class_by_name(class_name));
     g_free(class_name);
     return ac;
 }
diff --git a/accel/qtest/qtest.c b/accel/qtest/qtest.c
index edb29f6fa4c0..d2bca1c02151 100644
--- a/accel/qtest/qtest.c
+++ b/accel/qtest/qtest.c
@@ -45,6 +45,7 @@ static const TypeInfo qtest_accel_type = {
     .parent = TYPE_ACCEL,
     .class_init = qtest_accel_class_init,
 };
+module_obj("qtest-accel"); // FIXME: use TYPE_QTEST_ACCEL
 
 static void qtest_accel_ops_class_init(ObjectClass *oc, void *data)
 {
@@ -61,6 +62,7 @@ static const TypeInfo qtest_accel_ops_type = {
     .class_init = qtest_accel_ops_class_init,
     .abstract = true,
 };
+module_obj("qtest-accel-ops"); // FIXME: use ACCEL_OPS_NAME
 
 static void qtest_type_init(void)
 {
@@ -69,3 +71,4 @@ static void qtest_type_init(void)
 }
 
 type_init(qtest_type_init);
+module_arch(TARGET_NAME);
diff --git a/accel/meson.build b/accel/meson.build
index dfd808d2c8e5..0e824c9a3a72 100644
--- a/accel/meson.build
+++ b/accel/meson.build
@@ -1,3 +1,5 @@
+accel_modules = {}
+
 specific_ss.add(files('accel-common.c'))
 softmmu_ss.add(files('accel-softmmu.c'))
 user_ss.add(files('accel-user.c'))
@@ -16,3 +18,5 @@ dummy_ss.add(files(
 
 specific_ss.add_all(when: ['CONFIG_SOFTMMU', 'CONFIG_POSIX'], if_true: dummy_ss)
 specific_ss.add_all(when: ['CONFIG_XEN'], if_true: dummy_ss)
+
+target_modules += { 'accel' : accel_modules }
diff --git a/accel/qtest/meson.build b/accel/qtest/meson.build
index a2f327645980..d106bb33c36a 100644
--- a/accel/qtest/meson.build
+++ b/accel/qtest/meson.build
@@ -1,6 +1,5 @@
 qtest_ss = ss.source_set()
-qtest_ss.add(files(
-  'qtest.c',
-))
+qtest_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_POSIX'],
+             if_true: files('qtest.c'))
 
-specific_ss.add_all(when: ['CONFIG_SOFTMMU', 'CONFIG_POSIX'], if_true: qtest_ss)
+accel_modules += {'qtest': qtest_ss }
-- 
2.31.1



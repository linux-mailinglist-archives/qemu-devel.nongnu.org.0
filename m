Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C22A25AAA5
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Sep 2020 13:58:07 +0200 (CEST)
Received: from localhost ([::1]:52372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDROw-0001yV-AK
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 07:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kDRKj-0002FC-H5
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 07:53:45 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:60607
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kDRKh-0006vf-QQ
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 07:53:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599047622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YdxUfCLTfvRpKJ/AnoPXLejfEY0JgVgEKvuEcjuVXAQ=;
 b=BEIay4ZY0ctbKEg6GF1YAOF8PWjGiJAk6A62Z+NVY1KL9esSmkUckJZtt0G4Qc/iKCI9A0
 sRURPu0V5RwZwBmB7Bdpi0NEauwOySzz/hx/epcx5olJguAViYoPYiTevLDzHjUpJW5Ha4
 QX/NKD/Hw6FQEWPP3YqxUmrAxaoZ5zY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-t_MxxpNKOy2KYvloG3jUAA-1; Wed, 02 Sep 2020 07:53:40 -0400
X-MC-Unique: t_MxxpNKOy2KYvloG3jUAA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A626718B9EC0;
 Wed,  2 Sep 2020 11:53:39 +0000 (UTC)
Received: from localhost (ovpn-66-226.rdu2.redhat.com [10.10.66.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6EA2419C66;
 Wed,  2 Sep 2020 11:53:36 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 08/20] hda-audio: Set instance_size at base class
Date: Wed,  2 Sep 2020 07:53:11 -0400
Message-Id: <20200902115323.850385-9-ehabkost@redhat.com>
In-Reply-To: <20200902115323.850385-1-ehabkost@redhat.com>
References: <20200902115323.850385-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 03:24:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Setting instance_size correctly at the base class will help us
avoid mistakes when declaring new subclasses.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20200826171005.4055015-3-ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/audio/hda-codec.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/audio/hda-codec.c b/hw/audio/hda-codec.c
index cbd92b72f2..2d16448181 100644
--- a/hw/audio/hda-codec.c
+++ b/hw/audio/hda-codec.c
@@ -898,6 +898,7 @@ static void hda_audio_base_class_init(ObjectClass *klass, void *data)
 static const TypeInfo hda_audio_info = {
     .name          = TYPE_HDA_AUDIO,
     .parent        = TYPE_HDA_CODEC_DEVICE,
+    .instance_size = sizeof(HDAAudioState),
     .class_init    = hda_audio_base_class_init,
     .abstract      = true,
 };
@@ -914,7 +915,6 @@ static void hda_audio_output_class_init(ObjectClass *klass, void *data)
 static const TypeInfo hda_audio_output_info = {
     .name          = "hda-output",
     .parent        = TYPE_HDA_AUDIO,
-    .instance_size = sizeof(HDAAudioState),
     .class_init    = hda_audio_output_class_init,
 };
 
@@ -930,7 +930,6 @@ static void hda_audio_duplex_class_init(ObjectClass *klass, void *data)
 static const TypeInfo hda_audio_duplex_info = {
     .name          = "hda-duplex",
     .parent        = TYPE_HDA_AUDIO,
-    .instance_size = sizeof(HDAAudioState),
     .class_init    = hda_audio_duplex_class_init,
 };
 
@@ -946,7 +945,6 @@ static void hda_audio_micro_class_init(ObjectClass *klass, void *data)
 static const TypeInfo hda_audio_micro_info = {
     .name          = "hda-micro",
     .parent        = TYPE_HDA_AUDIO,
-    .instance_size = sizeof(HDAAudioState),
     .class_init    = hda_audio_micro_class_init,
 };
 
-- 
2.26.2



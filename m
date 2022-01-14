Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB8648E4DE
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 08:30:46 +0100 (CET)
Received: from localhost ([::1]:49252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8H2o-00054T-Kp
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 02:30:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n8GUa-0007bI-LS
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 01:55:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n8GUX-0007V6-FF
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 01:55:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642143316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wcVOdlcY+aG5+PurdoxFONFnBf312t/TsvGNS3NIlGo=;
 b=ZRJWYlDXoZyydC1vvNYJlTTmyLXYuYPuogAGHxfmdsSwNo+Mw9UNHJbE76FXB0UluD4+7p
 ZFUkDzzGyzQ2rUW7i4ZRYu1h6hk5I/nHgJYy6IeFTUx+0rrpresbJrE+jzSZoJ7wnAGIp3
 MesZsL4xJ85QBsJbVMffQTTuH9JebQA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-93-UCm2twCcN868Ne6jfTK09Q-1; Fri, 14 Jan 2022 01:55:13 -0500
X-MC-Unique: UCm2twCcN868Ne6jfTK09Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D857A85B660;
 Fri, 14 Jan 2022 06:55:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE2115F90D;
 Fri, 14 Jan 2022 06:54:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AC09A180063D; Fri, 14 Jan 2022 07:53:26 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/20] hw/audio/intel-hda: fix stream reset
Date: Fri, 14 Jan 2022 07:53:12 +0100
Message-Id: <20220114065326.782420-7-kraxel@redhat.com>
In-Reply-To: <20220114065326.782420-1-kraxel@redhat.com>
References: <20220114065326.782420-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

Quote from:
High Definition Audio Specification 1.0a, section 3.3.35

Offset 80: {IOB}SDnCTL Stream Reset (SRST): Writing a 1 causes
the corresponding stream to be reset. The Stream Descriptor
registers (except the SRST bit itself) ... are reset.

Change the code to reset the Stream Descriptor Control and Status
registers except the SRST bit.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/757
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20211226154017.6067-3-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/audio/intel-hda.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
index 2b55d521503f..5f8a878f20c1 100644
--- a/hw/audio/intel-hda.c
+++ b/hw/audio/intel-hda.c
@@ -581,7 +581,7 @@ static void intel_hda_set_st_ctl(IntelHDAState *d, const IntelHDAReg *reg, uint3
     if (st->ctl & 0x01) {
         /* reset */
         dprint(d, 1, "st #%d: reset\n", reg->stream);
-        st->ctl = SD_STS_FIFO_READY << 24;
+        st->ctl = SD_STS_FIFO_READY << 24 | SD_CTL_STREAM_RESET;
     }
     if ((st->ctl & 0x02) != (old & 0x02)) {
         uint32_t stnr = (st->ctl >> 20) & 0x0f;
-- 
2.34.1



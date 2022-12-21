Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC47653141
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:05:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7yll-0003yW-P8; Wed, 21 Dec 2022 08:04:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ylj-0003x9-MV
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:04:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ylh-0003uW-9W
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:04:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671627860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=estDuuS6eTISuM/8xP+V6EClOQT23mxmy/FNAfxSQac=;
 b=KCz3hPfCbC9jzbv+g0CXgKufZNQ+CrXpZzGxJLHrIcY1BHhlLwemsHwacv+8L7TSxjMRYS
 eV1WFAbS4bX6daAeXSr7pSVPs/vODgRZ621H6mKdBv2eAoXs9uAz6vmPH2HiNCbuT5ub1A
 wflWB0nFllvH77Fqj7R9MCHU/2Bmi/U=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-288-dv6XwU34OnegdEsmCnjUVw-1; Wed, 21 Dec 2022 08:04:18 -0500
X-MC-Unique: dv6XwU34OnegdEsmCnjUVw-1
Received: by mail-ej1-f70.google.com with SMTP id
 hs18-20020a1709073e9200b007c0f9ac75f9so10440563ejc.9
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 05:04:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=estDuuS6eTISuM/8xP+V6EClOQT23mxmy/FNAfxSQac=;
 b=O0xkg6n9+w59ZsIh4mXNDw69QH6Lx1zjuZj/Yc8n2PDww7jDEgr1nDXfle4QIhU3Qx
 VYRNoMjx3zOag2b/999IU7mpaYd4m+7KyC4T/s44RZHimgPiP8fHGrjqqSFSD2d73zXb
 x7Y8ZhApTdzIC8ENPuEFIigKFvwEplGI6eG6pEO7C/p13KN02THF0X7/0KRw1ypiS3Wa
 4XjTkJ49VYLvkhpgt7NTC2v1fkF9aTLNiU3d02pLgrGXj+1zhgsDUEaiZqMS1E+SEGCR
 pxli860AWIPUejMVLYxisJJGyL501UXMxaesZX51CuMlNzQ8DVOS3jK+cmzypV1SJ7jG
 LmhQ==
X-Gm-Message-State: AFqh2krnw/XrkucFR1AeK/qfQWbTbQKDKhsr+8ivqs5dQ2j4RuAy5qcA
 Nd+ERlku05+gAroW+wIuQUleX8hu3DKN2WdASHOY47pvE3tpmbnbGO3YDksLIpsBeXNDpdcQZTA
 iMK0cOov3kTy9Se7gUbcoTGm9xC2uJlMSHo2phcpdzs4CBJfd4QDVoIFRzkr/
X-Received: by 2002:aa7:d60e:0:b0:46c:edb5:afdf with SMTP id
 c14-20020aa7d60e000000b0046cedb5afdfmr1362667edr.41.1671627853558; 
 Wed, 21 Dec 2022 05:04:13 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs42xPR4QCkcwlNRrCAd6fwut5ifed9rb60UGBo/AGCd1dyLAwkU6bzsKLQ2F6oNuhD8hoJiw==
X-Received: by 2002:aa7:d60e:0:b0:46c:edb5:afdf with SMTP id
 c14-20020aa7d60e000000b0046cedb5afdfmr1362626edr.41.1671627853205; 
 Wed, 21 Dec 2022 05:04:13 -0800 (PST)
Received: from redhat.com ([2.52.8.61]) by smtp.gmail.com with ESMTPSA id
 q185-20020a1c43c2000000b003cff309807esm2243387wma.23.2022.12.21.05.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 05:04:11 -0800 (PST)
Date: Wed, 21 Dec 2022 08:04:06 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 "Richard W . M . Jones" <rjones@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 01/41] hw/acpi: add trace events for TCO watchdog register
 access
Message-ID: <20221221130339.1234592-2-mst@redhat.com>
References: <20221221130339.1234592-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221221130339.1234592-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Daniel P. Berrangé <berrange@redhat.com>

These tracepoints aid in understanding and debugging the guest drivers
for the TCO watchdog.

Reviewed-by: Richard W.M. Jones <rjones@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20221216125749.596075-2-berrange@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/tco.c        | 41 ++++++++++++++++++++++++++++-------------
 hw/acpi/trace-events |  2 ++
 2 files changed, 30 insertions(+), 13 deletions(-)

diff --git a/hw/acpi/tco.c b/hw/acpi/tco.c
index 4783721e4e..9ebd3e5e64 100644
--- a/hw/acpi/tco.c
+++ b/hw/acpi/tco.c
@@ -86,6 +86,7 @@ static inline int can_start_tco_timer(TCOIORegs *tr)
 static uint32_t tco_ioport_readw(TCOIORegs *tr, uint32_t addr)
 {
     uint16_t rld;
+    uint32_t ret = 0;
 
     switch (addr) {
     case TCO_RLD:
@@ -96,35 +97,49 @@ static uint32_t tco_ioport_readw(TCOIORegs *tr, uint32_t addr)
         } else {
             rld = tr->tco.rld;
         }
-        return rld;
+        ret = rld;
+        break;
     case TCO_DAT_IN:
-        return tr->tco.din;
+        ret = tr->tco.din;
+        break;
     case TCO_DAT_OUT:
-        return tr->tco.dout;
+        ret = tr->tco.dout;
+        break;
     case TCO1_STS:
-        return tr->tco.sts1;
+        ret = tr->tco.sts1;
+        break;
     case TCO2_STS:
-        return tr->tco.sts2;
+        ret = tr->tco.sts2;
+        break;
     case TCO1_CNT:
-        return tr->tco.cnt1;
+        ret = tr->tco.cnt1;
+        break;
     case TCO2_CNT:
-        return tr->tco.cnt2;
+        ret = tr->tco.cnt2;
+        break;
     case TCO_MESSAGE1:
-        return tr->tco.msg1;
+        ret = tr->tco.msg1;
+        break;
     case TCO_MESSAGE2:
-        return tr->tco.msg2;
+        ret = tr->tco.msg2;
+        break;
     case TCO_WDCNT:
-        return tr->tco.wdcnt;
+        ret = tr->tco.wdcnt;
+        break;
     case TCO_TMR:
-        return tr->tco.tmr;
+        ret = tr->tco.tmr;
+        break;
     case SW_IRQ_GEN:
-        return tr->sw_irq_gen;
+        ret = tr->sw_irq_gen;
+        break;
     }
-    return 0;
+    trace_tco_io_read(addr, ret);
+    return ret;
 }
 
 static void tco_ioport_writew(TCOIORegs *tr, uint32_t addr, uint32_t val)
 {
+    trace_tco_io_write(addr, val);
     switch (addr) {
     case TCO_RLD:
         tr->timeouts_no = 0;
diff --git a/hw/acpi/trace-events b/hw/acpi/trace-events
index eb60b04f9b..78e0a8670e 100644
--- a/hw/acpi/trace-events
+++ b/hw/acpi/trace-events
@@ -55,6 +55,8 @@ piix4_gpe_writeb(uint64_t addr, unsigned width, uint64_t val) "addr: 0x%" PRIx64
 # tco.c
 tco_timer_reload(int ticks, int msec) "ticks=%d (%d ms)"
 tco_timer_expired(int timeouts_no, bool strap, bool no_reboot) "timeouts_no=%d no_reboot=%d/%d"
+tco_io_write(uint64_t addr, uint32_t val) "addr=0x%" PRIx64 " val=0x%" PRIx32
+tco_io_read(uint64_t addr, uint32_t val) "addr=0x%" PRIx64 " val=0x%" PRIx32
 
 # erst.c
 acpi_erst_reg_write(uint64_t addr, uint64_t val, unsigned size) "addr: 0x%04" PRIx64 " <== 0x%016" PRIx64 " (size: %u)"
-- 
MST



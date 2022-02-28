Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AF74C6A84
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 12:31:06 +0100 (CET)
Received: from localhost ([::1]:43662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOeF1-0006wc-Vu
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 06:31:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nOeAc-000469-B6
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 06:26:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nOeAX-00077k-M9
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 06:26:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646047579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u+KdPj4nunu7sAqKxdo+/X7MP94GLUYj9/RHqP/oWvw=;
 b=SBVOpq80KYjaOyntXTljaQ2LU8ezV7HpczZOnHyB6gKi1MWV02+KA8lf6kooRsEWV+DQuL
 7wiqCL1QCDo/FAoXlkV+EcF1HwPpLsC17suxlFBMqG7JXGGziAiCt8LxKC1KrwabwEv3j2
 uRO9ub7tkcXHEsdWNeaAjtYCO66S5ME=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-vjC3JttvOay1oGa6B31YMg-1; Mon, 28 Feb 2022 06:26:18 -0500
X-MC-Unique: vjC3JttvOay1oGa6B31YMg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2675F824FA7;
 Mon, 28 Feb 2022 11:26:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D04DD2B3DC;
 Mon, 28 Feb 2022 11:26:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D36FC21E691F; Mon, 28 Feb 2022 12:26:13 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 7/9] hw/rtc: Compile pl031 once-only
Date: Mon, 28 Feb 2022 12:26:11 +0100
Message-Id: <20220228112613.520040-8-armbru@redhat.com>
In-Reply-To: <20220228112613.520040-1-armbru@redhat.com>
References: <20220228112613.520040-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Now that the RTC_CHANGE event is no longer target-specific,
we can move the pl031 back to a compile-once source file
rather than a compile-per-target one.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220221192123.749970-4-peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/rtc/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/rtc/meson.build b/hw/rtc/meson.build
index 8fd8d8f9a7..7cecdee5dd 100644
--- a/hw/rtc/meson.build
+++ b/hw/rtc/meson.build
@@ -2,7 +2,7 @@
 softmmu_ss.add(when: 'CONFIG_DS1338', if_true: files('ds1338.c'))
 softmmu_ss.add(when: 'CONFIG_M41T80', if_true: files('m41t80.c'))
 softmmu_ss.add(when: 'CONFIG_M48T59', if_true: files('m48t59.c'))
-specific_ss.add(when: 'CONFIG_PL031', if_true: files('pl031.c'))
+softmmu_ss.add(when: 'CONFIG_PL031', if_true: files('pl031.c'))
 softmmu_ss.add(when: 'CONFIG_TWL92230', if_true: files('twl92230.c'))
 softmmu_ss.add(when: ['CONFIG_ISA_BUS', 'CONFIG_M48T59'], if_true: files('m48t59-isa.c'))
 softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP', if_true: files('xlnx-zynqmp-rtc.c'))
-- 
2.35.1



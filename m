Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C7747A0F5
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Dec 2021 15:30:56 +0100 (CET)
Received: from localhost ([::1]:42388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myxDE-00047R-3F
	for lists+qemu-devel@lfdr.de; Sun, 19 Dec 2021 09:30:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1myx2r-0003bl-HC
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 09:20:13 -0500
Received: from [2a00:1450:4864:20::52f] (port=37581
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1myx2p-0006MO-3t
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 09:20:13 -0500
Received: by mail-ed1-x52f.google.com with SMTP id e3so27848384edu.4
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 06:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xDwweGBWt7zYTH3DzYQOaKZ+/j+vUNSBNMZBpH7Nrkc=;
 b=pOr3IKagJSkLL6LIMkWQtYsORJIyrfDT/E84Vv7Ag/hYOqKvztGXPUXU7pMTlXziix
 NVKS1xl5Ld5XGIRQ7p9Xl/FzkyTmOeKajolb0jFlOBvDr5Kk5aacdap+2d6HOw0EDamG
 0u0aGkXI8THoBmmMXM1jwMjudzv3i4B3BfZ+ss4TemrDsFYtgOjzPU5Vrqct7/6aGwQS
 4ruAxWXOMKGHKUuUkTX/qmRbs2O3KcxYSihlcIbKejPq84SMDJZwO5Y0cXzmP+2bMbFh
 /KFthBUIiq9QjT8RFyZnRscf3ouGkICdQsUS3IpbwDwLcp+vffAiq8mUnr5TUpJU4D7W
 mghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xDwweGBWt7zYTH3DzYQOaKZ+/j+vUNSBNMZBpH7Nrkc=;
 b=CXvvbTBmvAbqjHTmcl/4LFat+uC1lRFsxDUZbo/jrsNW+MGxwrb68tRlYW4qDjSHEc
 hDLErnLivvEokP60el5DWKOQl6V1FoAGysJROd3oj8dgAeAhdZ46kKg+Q135U7gkVvLg
 GLi07MXgTXw+DZvvxUUKtKAhgzjmXlejBLUO6vRKjfDl4auz8wrtcqC993CdmQfraOtX
 17ECIoUACpsYkDCn6v4z2N6pT7ijrWogIlquWctpwA2cpgbDo/71hi974vTCRo6oBtAv
 q6vrVte9G6v3OfHzS0GyWZr+ePPuR12bteCBNIgDAF4zuyKTqQ9DDHtObUSUiHhBicIy
 xQaQ==
X-Gm-Message-State: AOAM530+yIaAY093OcsXglr6odBIMF7iTGnNDKs0xKH4AEWGKlaN2Md6
 ZGiX2WATluH9VB4Wihvb96cWST4CuiI=
X-Google-Smtp-Source: ABdhPJw3l+Qvutr6gEx9jY15WCrR4p4sI+x0pSVoYw5UD5xlqJdQcjF2fxdAzdBBaXp5mQIm69X2EA==
X-Received: by 2002:a05:6402:2ce:: with SMTP id
 b14mr11353066edx.122.1639923609887; 
 Sun, 19 Dec 2021 06:20:09 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id y19sm5791584edc.17.2021.12.19.06.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Dec 2021 06:20:09 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/16] hw/scsi: Fix scsi_bus_init_named() docstring
Date: Sun, 19 Dec 2021 15:20:05 +0100
Message-Id: <20211219142008.248807-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211219141711.248066-1-pbonzini@redhat.com>
References: <20211219141711.248066-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Commit 739e95f5741 ("scsi: Replace scsi_bus_new() with
scsi_bus_init(), scsi_bus_init_named()") forgot to rename
scsi_bus_init() in the function documentation string.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211122104744.1051554-1-f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/hw/scsi/scsi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index a567a5ed86..2ef80af6dc 100644
--- a/include/hw/scsi/scsi.h
+++ b/include/hw/scsi/scsi.h
@@ -158,7 +158,7 @@ struct SCSIBus {
  * provided by the caller. It is the caller's responsibility to make
  * sure that name does not clash with the name of any other bus in the
  * system. Unless you need the new bus to have a specific name, you
- * should use scsi_bus_new() instead.
+ * should use scsi_bus_init() instead.
  */
 void scsi_bus_init_named(SCSIBus *bus, size_t bus_size, DeviceState *host,
                          const SCSIBusInfo *info, const char *bus_name);
-- 
2.33.1




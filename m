Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0233247FDD1
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Dec 2021 15:31:07 +0100 (CET)
Received: from localhost ([::1]:40418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1r1l-0004Q6-H9
	for lists+qemu-devel@lfdr.de; Mon, 27 Dec 2021 09:31:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1n1qzP-0001jw-7R
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 09:28:39 -0500
Received: from [2607:f8b0:4864:20::62c] (port=33451
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1n1qzN-00032P-MB
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 09:28:38 -0500
Received: by mail-pl1-x62c.google.com with SMTP id i6so5480451pla.0
 for <qemu-devel@nongnu.org>; Mon, 27 Dec 2021 06:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tqTtnT1TEOPMErpZuVNDwuohtAdiw2v+obbt+THHjU4=;
 b=Oug5mnmJjCAp4gIu03fOknpsdN52rgRNnSaXsjx/Koa4OXq4ilog1tvqblB4L1Lf/Y
 YneRo2Ul0e08eR/l3gIodv1eeUxR1aKP+ekTDdqjH8SELq8bs6eAKdlBAkARX91obvUV
 v41zMNz1YtcRmDXbDLeIg9N0OFBLQMrJnS+/eT4NZjXCkoZ6sVxo6aM36hya3DoRwKyq
 RdEjT12Ay5yyI2ZFVsjWJ46Sk+VuUqHrqkzdfcZALWCMmQ3AiZd8NTdc0B9TI4RalcGa
 kURaNjUsFjUSxGd7+RvMorrDauHlrHdAPQ4K79EGV932VgENm72jDRWCECtzfMAyFEuH
 HpNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tqTtnT1TEOPMErpZuVNDwuohtAdiw2v+obbt+THHjU4=;
 b=DgGawC/a94SbMaI9xkHeYQH4uKvqsDWnVZEySJeaHtyDk+dvXbPV28dT9uQspzOPxX
 SS2CMd6DIAxc/vxIeYk9criypL+TxGLVXcFl+cRKVtHPplCUcaZGMaoMAQgtgbcxM7Zr
 ROzSp4fxW4C4ukeYH3BVCXVLN7Wdj04ba2EC3v4vGShov8qtb23Okf1lzBGkYp4m6FBH
 QkflB4FMtS3OQ+/jTEmvfAfmDAgXEaSAJ6cvgOhdoGy1GwUqAqAgfnDqxDs9TKtCE2xM
 eRJAmlOIUc/Fck9UL9zWJOlf/aX/TmhS9yNVh5hb04Ijws9TsAQrhkrJDrtViQbNiWpt
 Jzaw==
X-Gm-Message-State: AOAM533Id3pg67TqWnM1aIPBnxQ235hnYu8rhxzU+16F4eknkpWVWeD9
 oe8BRv7Q2PvBAQtVnDxHCSuftw==
X-Google-Smtp-Source: ABdhPJxn9NFOf2ONAOpk+f6gdsd+gQNM3yoZRYvnnQ+3Pyhtc+M5N9e+XeyWH3vIlGJrMaqhD6RMuA==
X-Received: by 2002:a17:902:ec81:b0:148:f1f7:2989 with SMTP id
 x1-20020a170902ec8100b00148f1f72989mr17576247plg.169.1640615316575; 
 Mon, 27 Dec 2021 06:28:36 -0800 (PST)
Received: from libai.bytedance.net ([153.254.110.96])
 by smtp.gmail.com with ESMTPSA id p2sm15072916pgn.73.2021.12.27.06.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 06:28:36 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: peter.maydell@linaro.org, richard.henderson@linaro.org, kraxel@redhat.com,
 eblake@redhat.com, pbonzini@redhat.com
Subject: [PATCH 3/5] usb: Introduce video&mescellaneous
Date: Mon, 27 Dec 2021 22:27:32 +0800
Message-Id: <20211227142734.691900-4-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211227142734.691900-1-pizhenwei@bytedance.com>
References: <20211227142734.691900-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, zhenwei pi <pizhenwei@bytedance.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Define USB class code for video&mescellaneous.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 include/hw/usb.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/hw/usb.h b/include/hw/usb.h
index 33668dd0a9..8e3d30b9f4 100644
--- a/include/hw/usb.h
+++ b/include/hw/usb.h
@@ -77,9 +77,11 @@
 #define USB_CLASS_PRINTER		7
 #define USB_CLASS_MASS_STORAGE		8
 #define USB_CLASS_HUB			9
+#define USB_CLASS_VIDEO                 0xe
 #define USB_CLASS_CDC_DATA		0x0a
 #define USB_CLASS_CSCID			0x0b
 #define USB_CLASS_CONTENT_SEC		0x0d
+#define USB_CLASS_MISCELLANEOUS         0xef
 #define USB_CLASS_APP_SPEC		0xfe
 #define USB_CLASS_VENDOR_SPEC		0xff
 
-- 
2.25.1



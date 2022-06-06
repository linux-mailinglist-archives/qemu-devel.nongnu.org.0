Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 416B753F224
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 00:28:38 +0200 (CEST)
Received: from localhost ([::1]:35452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyLDB-0001TT-6c
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 18:28:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nyL8m-0003Ad-48
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 18:24:04 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:37703)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nyL8j-0005J9-04
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 18:24:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1654554241; x=1686090241;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DJ2FQUzlzFooiI8OUXfaZqpJWoNDzWz8uveYy2V95GU=;
 b=x7pFn0XHwsNgVYAB54zbsIjSNpaD6w7g+wcQzY1bTMtOVuBAL7i/kCcG
 KFTA7lq585UKD5UBPupy++g+zbfHwcgrdvLzTETJyOhsboMkXaol7PfMh
 X0glzVhMtpA9KYGosrBpIBnmT2VKjhlxwFDIsJwhXU08YpSz1r0Y9FYX5 Y=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 06 Jun 2022 15:24:00 -0700
X-QCInternal: smtphost
Received: from hu-tsimpson-lv.qualcomm.com (HELO
 hu-devc-lv-u18-c.qualcomm.com) ([10.47.235.220])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP; 06 Jun 2022 15:23:59 -0700
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id D3D2C5005B9; Mon,  6 Jun 2022 15:23:39 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, f4bug@amsat.org,
 ale@rev.ng, bcain@quicinc.com, mlambert@quicinc.com
Subject: [PATCH] Hexagon (tests/tcg/hexagon) Fix alignment in load_unpack.c
Date: Mon,  6 Jun 2022 15:23:26 -0700
Message-Id: <20220606222327.7682-5-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220606222327.7682-1-tsimpson@quicinc.com>
References: <20220606222327.7682-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=129.46.98.28; envelope-from=tsimpson@qualcomm.com;
 helo=alexa-out.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIGluY3JlbWVudCB1c2VkIGluIDpicmV2IHRlc3RzIHdhcyBjYXVzaW5nIHVuYWxpZ25lZCBh
ZGRyZXNzZXMKQ2hhbmdlIHRoZSBpbmNyZW1lbnQgYW5kIHRoZSByZWxldmFudCBleHBlY3RlZCB2
YWx1ZXMKClNpZ25lZC1vZmYtYnk6IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNv
bT4KLS0tCiB0ZXN0cy90Y2cvaGV4YWdvbi9sb2FkX3VucGFjay5jIHwgMTQgKysrKysrKy0tLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvdGVzdHMvdGNnL2hleGFnb24vbG9hZF91bnBhY2suYyBiL3Rlc3RzL3RjZy9oZXhh
Z29uL2xvYWRfdW5wYWNrLmMKaW5kZXggMzU3NWEzN2EyOC4uNGFhMjZmYzM4OCAxMDA2NDQKLS0t
IGEvdGVzdHMvdGNnL2hleGFnb24vbG9hZF91bnBhY2suYworKysgYi90ZXN0cy90Y2cvaGV4YWdv
bi9sb2FkX3VucGFjay5jCkBAIC0yNDUsNyArMjQ1LDcgQEAgVEVTVF9wcihsb2FkYnN3NF9wciwg
bG9uZyBsb25nLCBTLCA0LCAweDAwMDBmZjAwMDAwMGZmMDBMTCwKICAqLwogI2RlZmluZSBCeFdf
TE9BRF9wYnIoU1osIFJFUywgUFRSKSBcCiAgICAgX19hc21fXyggXAotICAgICAgICAicjQgPSAj
KDEgPDwgKDE2IC0gMykpXG5cdCIgXAorICAgICAgICAicjQgPSAjKDEgPDwgKDE2IC0gNCkpXG5c
dCIgXAogICAgICAgICAibTAgPSByNFxuXHQiIFwKICAgICAgICAgIiUwID0gbWVtIiAjU1ogIigl
MSsrbTA6YnJldilcblx0IiBcCiAgICAgICAgIDogIj1yIihSRVMpLCAiK3IiKFBUUikgXApAQCAt
MjczLDE1ICsyNzMsMTUgQEAgdm9pZCB0ZXN0XyMjTkFNRSh2b2lkKSBcCiB9CiAKIFRFU1RfcGJy
KGxvYWRiencyX3BiciwgaW50LCBaLCAweDAwMDAwMDAwLAotICAgIDB4MDAwMjAwODEsIDB4MDAw
NjAwODUsIDB4MDAwNDAwODMsIDB4MDAwODAwODcpCisgICAgMHgwMDAyMDA4MSwgMHgwMDBhMDA4
OSwgMHgwMDA2MDA4NSwgMHgwMDBlMDA4ZCkKIFRFU1RfcGJyKGxvYWRic3cyX3BiciwgaW50LCBT
LCAweDAwMDBmZjAwLAotICAgIDB4MDAwMjAwODEsIDB4MDAwNjAwODUsIDB4MDAwNDAwODMsIDB4
MDAwODAwODcpCisgICAgMHgwMDAyMDA4MSwgMHgwMDBhZmY4OSwgMHgwMDA2ZmY4NSwgMHgwMDBl
ZmY4ZCkKIFRFU1RfcGJyKGxvYWRienc0X3BiciwgbG9uZyBsb25nLCBaLCAweDAwMDAwMDAwMDAw
MDAwMDBMTCwKLSAgICAweDAwMDQwMDgzMDAwMjAwODFMTCwgMHgwMDA4MDA4NzAwMDYwMDg1TEws
Ci0gICAgMHgwMDA2MDA4NTAwMDQwMDgzTEwsIDB4MDAwYTAwODkwMDA4MDA4N0xMKQorICAgIDB4
MDAwNDAwODMwMDAyMDA4MUxMLCAweDAwMGMwMDhiMDAwYTAwODlMTCwKKyAgICAweDAwMDgwMDg3
MDAwNjAwODVMTCwgMHgwMDEwMDA4ZjAwMGUwMDhkTEwpCiBURVNUX3Bicihsb2FkYnN3NF9wYnIs
IGxvbmcgbG9uZywgUywgMHgwMDAwZmYwMDAwMDBmZjAwTEwsCi0gICAgMHgwMDA0MDA4MzAwMDIw
MDgxTEwsIDB4MDAwODAwODcwMDA2MDA4NUxMLAotICAgIDB4MDAwNjAwODUwMDA0MDA4M0xMLCAw
eDAwMGEwMDg5MDAwODAwODdMTCkKKyAgICAweDAwMDQwMDgzMDAwMjAwODFMTCwgMHgwMDBjZmY4
YjAwMGFmZjg5TEwsCisgICAgMHgwMDA4ZmY4NzAwMDZmZjg1TEwsIDB4MDAxMGZmOGYwMDBlZmY4
ZExMKQogCiAvKgogICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKLS0gCjIuMTcuMQoK


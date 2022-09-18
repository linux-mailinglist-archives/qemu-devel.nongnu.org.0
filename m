Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 609C55BBFA4
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 21:53:25 +0200 (CEST)
Received: from localhost ([::1]:40066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oa0M0-0001RN-5T
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 15:53:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oa0Ew-00071c-0I
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 15:46:13 -0400
Received: from mout.gmx.net ([212.227.17.21]:57245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oa0Eq-0007b6-Or
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 15:46:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1663530358;
 bh=roH/tkWQlaK8ZoFaWtgJx1vvKW8Za+SwcdWg6wbUaY4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Y/cQrpkVdlqqLLZK/cUoSBD8BfOqu6PzL2VCtHHHBBYE2zYmzUUx748rL+BGjgmUO
 HcZf43e+0gt4liNpyJ/UrRaGnOa9RSbTAdi4ZY/l3Yhj+Vf7upIZzuM56L1MzRd1g3
 ZelS2YRwT5QPSq0X4Nt+IO2wGINbqTBckT+z3ksY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.165.224]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N5G9t-1pGecl1CVx-011Bn0; Sun, 18
 Sep 2022 21:45:58 +0200
From: Helge Deller <deller@gmx.de>
To: Stefan Hajnoczi <stefanha@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: deller@gmx.de
Subject: [PATCH v3 12/12] linux-user: Add parameters of getrandom() syscall
 for strace
Date: Sun, 18 Sep 2022 21:45:55 +0200
Message-Id: <20220918194555.83535-13-deller@gmx.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220918194555.83535-1-deller@gmx.de>
References: <20220918194555.83535-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GgUT+2APbNeTBTtipupm/sVPDjEKZyljdwHTiYgdW6nyMLV5XVS
 cPZA/9hAs4CuL0qnZjZJxWKQC18n1WuE7/ldfYk2y8baXCs7QZirU+eFEKgU6MOJYmEpLDV
 G9cyuQKV5B1tYfEso2UqWIyoU2rZN7+6ZXFNa2E0D43n1Nhk7d5EQdZiDFzx7o5JQsOgH5K
 Q7n//iVZ+0dwerRTRar0g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vrm+OO1mZuE=:9B2qdxvgVfJvhcfuECtwF1
 LPwTO9qoduZW0PfuYKLYe7hgNvLXTXcxPiav9i7dCN7i0p+KezapERuwDTKf0m2AQsYCI7xuC
 5hNu4NYQFT4euKH4OnR/WbMRxTjsdrZTo1sV36iiFVpi1efpNLxI976X6QSu0lt4zhBf3rCIp
 2hgxJxmE4hYV5tnT60dHgZwjDzDQ0M5ifeY/+Vo3uMBFM9BVMBakQX0nCzusjSGAWw1r9Wpn1
 3cO1utc0IZHGZ8VUOTN/BixqhCcFozzbazf76DsACieJB42DEJAv6ELYpQ1dkA+zXHayEXgSs
 TmNwz3q9ydHaUizl5Sy6X3chjZvGXsMhBM57kKkRpJSkIKK0dRPLSWnpw3Rt4Y62p8jUyN4Dy
 h3E3HbaYnwu/IefL/18abgHDSfPea8JrLFe+MHRz9++LrGj3tCjXUQ44XLhjZr/nw/AFcJV2c
 R2LhVw/oMGrno5SqeoiCDZ+otDgWsIzwUrbce+OT/J8H+hRZKbVyx8+xkG6MQPAwC/IYPKjlS
 N45Vqu0ERDFRBafh2GfY3ehty/Sfn24N2eaCvTo2PNn1h6HOlVs5QBIGyb5/AFFCbjoZhCsiq
 LD7vv7FvFhs2FeQOhjQJB5n21ZZrQD5WOheN7irQBCbCMCKZphPYq1DmpthFNvQW1dPRWuM3V
 SGPfpIvZPIaTZmgDj6bPze8JCcv4Ikwc02fP910FKy78+yjArSC0IRb7RGDPvUWMLEtFS1B66
 Ch30UkP053+PDOdkBq6WZrQYRqi5NBv6qrS4KQy8WCsrsFCfETecXSZd0qub+0fLY31DIH540
 38Fl3GyeEBxhZqnsUWCNCihCcURlMdbfoUFMXCB6+wtPgzT4oitiGALdqEfar8GHxD0ATy/cx
 ggY+ULx5e1pPOfKcIzV17Qw4mWaEu0eaZMIdqhJ46U7Q4zkqKsq4NiQ4/aLN2QnGfYQFtdxho
 /WIdiFSrcGeGdmcJ34z1niIYkRls36RDOO9g9F2OqoVRsN8GrJiSAbpUxgvi4/3EbfxPXF8W5
 R+/7b5S2kLeFKLAzrCvxGyCtziolMGnTduz6WgNgQ9aiHWcm/CLiotiCaMLbGmfiGZxmKPLp2
 AJDy+0xic1lDu3gSUvXdmwjcJcqyFha0mwBPauz2Z+oo9blx9AqdaUK+Wsdu6SOcKT9mcrf2M
 lER2/d6DBwX2NcR90IKCb66DKa
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/strace.list | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/strace.list b/linux-user/strace.list
index ad9ef94689..97d8ccadac 100644
=2D-- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -355,7 +355,7 @@
 { TARGET_NR_getpriority, "getpriority", "%s(%#x,%#x)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_getrandom
-{ TARGET_NR_getrandom, "getrandom", NULL, NULL, NULL },
+{ TARGET_NR_getrandom, "getrandom", "%s(%p,%u,%d)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_getresgid
 { TARGET_NR_getresgid, "getresgid" , NULL, NULL, NULL },
=2D-
2.37.3



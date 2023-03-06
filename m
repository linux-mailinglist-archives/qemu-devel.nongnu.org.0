Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3876AD2B8
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 00:16:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZK3Q-0000gY-KS; Mon, 06 Mar 2023 18:15:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1pZK3H-0000fm-QT; Mon, 06 Mar 2023 18:15:31 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1pZK3F-0003UP-Mj; Mon, 06 Mar 2023 18:15:31 -0500
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 326Me1FE020398; Mon, 6 Mar 2023 23:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=qcppdkim1; bh=Ah+QrRcrh8BKeGPWfFyn+HMwziYE8pv49iXy/fSLX5A=;
 b=FKm9+FbyQllN1XU9VNmOiTnMwJ1Lm4+nsh1ymeDA5c6/8/2igl2Sy/79z7FXERPZQf6C
 ojw+rgMEsiOeN8PUJ+f1Yn/q7hs2q96Gcr7sGKNiPS8+Qw58YBOJWIVvD/Hv0K2nN2Qg
 Hmqv4BYy8d7QMgDhn9NaQz/KckUKdI0g46GlzcflwfayR4H5pp6SxZcfOAxBCDPGNgxc
 DwdSvcY/lLvJ8pqddR+PigZCl30bLDGMK9LgqsD8SktORHVEEiU0G21NBF5SzSIon9Ox
 QIThqHV7Nd7bijAitRCMt7QbOmD52Tcqq784yqdeGYvay1QCybkAnh34jG68ZqcMmHvu cg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p420c66b1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Mar 2023 23:15:25 +0000
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-mathbern-lv.qualcomm.com
 [10.47.235.147])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 326NFNRH023133
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 6 Mar 2023 23:15:23 GMT
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 4229910)
 id A8D1567C5; Mon,  6 Mar 2023 20:15:23 -0300 (-03)
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, antoine.damhet@shadow.tech,
 charles.frey@shadow.tech, berrange@redhat.com
Subject: [PATCH] io/channel-tls: plug memory leakage on GSource
Date: Mon,  6 Mar 2023 20:15:21 -0300
Message-Id: <98f750b6ded2dd2e8d0e4ffc9935d3d6e0cd59f4.1678144392.git.quic_mathbern@quicinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: DuSwFJrmnh7q3i9ePBMJpzxheFBBdd5H
X-Proofpoint-GUID: DuSwFJrmnh7q3i9ePBMJpzxheFBBdd5H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1011 suspectscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303060202
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=mathbern@qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This leakage can be seen through test-io-channel-tls:

$ ../configure --target-list=aarch64-softmmu --enable-sanitizers
$ make ./tests/unit/test-io-channel-tls
$ ./tests/unit/test-io-channel-tls

Indirect leak of 104 byte(s) in 1 object(s) allocated from:
    #0 0x7f81d1725808 in __interceptor_malloc ../../../../src/libsanitizer/asan/asan_malloc_linux.cc:144
    #1 0x7f81d135ae98 in g_malloc (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x57e98)
    #2 0x55616c5d4c1b in object_new_with_propv ../qom/object.c:795
    #3 0x55616c5d4a83 in object_new_with_props ../qom/object.c:768
    #4 0x55616c5c5415 in test_tls_creds_create ../tests/unit/test-io-channel-tls.c:70
    #5 0x55616c5c5a6b in test_io_channel_tls ../tests/unit/test-io-channel-tls.c:158
    #6 0x7f81d137d58d  (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x7a58d)

Indirect leak of 32 byte(s) in 1 object(s) allocated from:
    #0 0x7f81d1725a06 in __interceptor_calloc ../../../../src/libsanitizer/asan/asan_malloc_linux.cc:153
    #1 0x7f81d1472a20 in gnutls_dh_params_init (/lib/x86_64-linux-gnu/libgnutls.so.30+0x46a20)
    #2 0x55616c6485ff in qcrypto_tls_creds_x509_load ../crypto/tlscredsx509.c:634
    #3 0x55616c648ba2 in qcrypto_tls_creds_x509_complete ../crypto/tlscredsx509.c:694
    #4 0x55616c5e1fea in user_creatable_complete ../qom/object_interfaces.c:28
    #5 0x55616c5d4c8c in object_new_with_propv ../qom/object.c:807
    #6 0x55616c5d4a83 in object_new_with_props ../qom/object.c:768
    #7 0x55616c5c5415 in test_tls_creds_create ../tests/unit/test-io-channel-tls.c:70
    #8 0x55616c5c5a6b in test_io_channel_tls ../tests/unit/test-io-channel-tls.c:158
    #9 0x7f81d137d58d  (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x7a58d)

...

SUMMARY: AddressSanitizer: 49143 byte(s) leaked in 184 allocation(s).

The docs for `g_source_add_child_source(source, child_source)` says
"source will hold a reference on child_source while child_source is
attached to it." Therefore, we should unreference the child source at
`qio_channel_tls_read_watch()` after attaching it to `source`. With this
change, ./tests/unit/test-io-channel-tls shows no leakages.

Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
---
 io/channel-tls.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/io/channel-tls.c b/io/channel-tls.c
index 8052945ba0..5a7a3d48d6 100644
--- a/io/channel-tls.c
+++ b/io/channel-tls.c
@@ -446,6 +446,7 @@ qio_channel_tls_read_watch(QIOChannelTLS *tioc, GSource *source)
     object_ref(OBJECT(tioc));
 
     g_source_add_child_source(source, child);
+    g_source_unref(child);
 }
 
 static GSource *qio_channel_tls_create_watch(QIOChannel *ioc,
-- 
2.37.2



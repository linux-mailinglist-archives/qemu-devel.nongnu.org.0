Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 500A25B5F9A
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 19:52:50 +0200 (CEST)
Received: from localhost ([::1]:46908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXnc1-0007sj-EQ
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 13:52:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1oXnXD-0003RY-R0
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 13:47:51 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:31186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1oXnXB-0000fI-LS
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 13:47:51 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28CHDDv6001777
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 17:47:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=0kic6l/1F7yPs7wDs5VxrR9JzmtZG5RnbxxzoF9ymhY=;
 b=dWr8oTuQI7ykEAGKDbVl3rkl54OKrSHUF1tXXvVi2YbP+sKlLuzghOfU2qC8/CnEQqXS
 ueHCm8cW0Bj8tH3f8orXMFmKpzNsL4BycPfVxeqxNxmx7Q2YiIjjB6Bzk4kK5PON24gm
 3fv1lMCHY9/atwLJQ07sTHawcAuCXzVHJGkeTb5hCm2j0oh+/dikUhIQWO5YIHdYyZbs
 jSjMXbWA4sfxtIuAbyprwTcTPhyO/flSU1Ed3dHObfJcxRdXA9wk1aZAzJyme0GRSWaX
 Sda/zKaKTAUmqSltaLmCjVzRoY4MrDQ8aLRp4wz4Fu1FkXQTvoVUVNTKpKGqxHcHLsrc vg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jj5m7gdw1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 17:47:46 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28CHH9Yv031307
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 17:47:46 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jj5m7gdv4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Sep 2022 17:47:46 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28CHaGAf002082;
 Mon, 12 Sep 2022 17:47:44 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03wdc.us.ibm.com with ESMTP id 3jgj796n6q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Sep 2022 17:47:44 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 28CHli4Z1966656
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Sep 2022 17:47:45 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 556F2136053;
 Mon, 12 Sep 2022 17:47:43 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 09C0A13604F;
 Mon, 12 Sep 2022 17:47:42 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 12 Sep 2022 17:47:42 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org, marcandre.lureau@redhat.com
Cc: Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH 0/2] tpm_emulator: Signal swtpm to again lock storage
Date: Mon, 12 Sep 2022 13:47:39 -0400
Message-Id: <20220912174741.1542330-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pUp22ZoyXOkATMRA6SLsiHhIRSugItc-
X-Proofpoint-ORIG-GUID: UPWtjS4rhk3RdyO_bSzZAqqlKL3CI4sF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_12,2022-09-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 phishscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
 suspectscore=0 mlxscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209120060
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Swtpm has been extended to release the lock on the storage where its state
is written to upon migration of the last one of its state blobs. Signal
swtpm to again lock the storage upon migration fallback. An explicit signal
helps swtpm to lock the storage earlier because otherwise it would have
to wait for the next TPM command from the VM.

Releasing the lock on the storage is necessary for setups where the storage
holding the TPM state is shared between hosts.

Regards,
   Stefan

v3:
 - extended timeout to 3 seconds

Stefan Berger (2):
  tpm_emulator: Use latest tpm_ioctl.h from swtpm project
  tpm_emulator: Have swtpm relock storage upon migration fall-back

 backends/tpm/tpm_emulator.c | 60 ++++++++++++++++++++++-
 backends/tpm/tpm_ioctl.h    | 96 +++++++++++++++++++++++++++++--------
 backends/tpm/trace-events   |  2 +
 3 files changed, 137 insertions(+), 21 deletions(-)

-- 
2.37.2



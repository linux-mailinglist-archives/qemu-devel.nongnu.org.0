Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3926968D19A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 09:42:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPJXs-0007PX-9Y; Tue, 07 Feb 2023 03:41:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1pPJXn-0007O4-U9
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 03:41:40 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1pPJXl-00036S-JL
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 03:41:39 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3178MKj6033283; Tue, 7 Feb 2023 08:41:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=1jYPxsby7mgt0KD38Gi2aCJ6aMWLn8Z6FZmZcEKbDMA=;
 b=eoOW5ifJpT7zn5IH80x7/lBb1wW+tw4qDs5R3Evy7p096E6gdx9H5YfvyxCWh4SyjrLV
 gFBf9uEYCPvCZACiTm/AfYypd8qgIjtBsewpeKniKLnu/8+R2TYnrhDzu9v9wN5pgQx/
 +AHhKL2uncmNJii/cG5Ra0YadvzAQIgMcYx/bahKKgtkcuJ4rALQ4o8qm/nKcTOfZeC2
 m/efx3pcdLuGMqf/wgH4fPRSe9Tv8izHp7vB2z10IE5NPjNj6eFHGNj4REat5JzvQyD3
 kAK5hwhN6geX1p4+oPGhwh9ub6XO0CxdTNbs4EggkKBSkVx9q8KOaRpJQR10PH1Y5nmQ 7Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nkk2xgbvf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Feb 2023 08:41:30 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3178ZgPO036400;
 Tue, 7 Feb 2023 08:41:30 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nkk2xgbuq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Feb 2023 08:41:30 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3178Rnn6001041;
 Tue, 7 Feb 2023 08:41:28 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
 by ppma01wdc.us.ibm.com (PPS) with ESMTPS id 3nhf076ytd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Feb 2023 08:41:28 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com
 [10.241.53.105])
 by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3178fQOO30671292
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Feb 2023 08:41:27 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A304358055;
 Tue,  7 Feb 2023 08:41:26 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D55DE58043;
 Tue,  7 Feb 2023 08:41:25 +0000 (GMT)
Received: from amdrome3.watson.ibm.com (unknown [9.2.130.16])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Tue,  7 Feb 2023 08:41:25 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: Dov Murik <dovmurik@linux.ibm.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 James Bottomley <jejb@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
Subject: [PATCH] x86: Don't add RNG seed to Linux cmdline for SEV guests
Date: Tue,  7 Feb 2023 08:41:16 +0000
Message-Id: <20230207084116.285787-1-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RrffsNN6QPZzDuNo5_5AByA9ugaYkdqF
X-Proofpoint-ORIG-GUID: u56_dapRxGFjLFlZABxxGt6a9xm0o8fO
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_02,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302070077
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Recent feature to supply RNG seed to the guest kernel modifies the
kernel command-line by adding extra data at its end; this breaks
measured boot with SEV and OVMF, and possibly signed boot.

Specifically SEV doesn't miss this feature because it uses UEFI/OVMF
which has its own way of getting random seed (not to mention that
getting the random seed from the untrusted host breaks the confidential
computing trust model).

Disable the RNG seed feature in SEV guests.

Fixes: eac7a7791bb6 ("x86: don't let decompressed kernel image clobber setup_data")
Reported-by: Tom Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>

---

There might be a need for a wider change to the ways setup_data entries
are handled in x86_load_linux(); here I just try to restore the
situation for SEV guests prior to the addition of the SETUP_RNG_SEED
entry.

Recent discussions on other (safer?) ways to pass this setup_data entry:
[1] https://lore.kernel.org/qemu-devel/da39abab9785aea2a2e7652ed6403b6268aeb31f.camel@linux.ibm.com/

Note that in qemu 7.2.0 this is broken as well -- there the
SETUP_RNG_SEED entry is appended to the Linux kernel data (and therefore
modifies and breaks the measurement of the kernel in SEV measured boot).
A similar fix will be needed there (but I fear this patch cannot be
applied as-is).
---
 hw/i386/x86.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index eaff4227bd..e65a83f8df 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1103,7 +1103,7 @@ void x86_load_linux(X86MachineState *x86ms,
         load_image_size(dtb_filename, setup_data->data, dtb_size);
     }
 
-    if (!legacy_no_rng_seed && protocol >= 0x209) {
+    if (!legacy_no_rng_seed && protocol >= 0x209 && !sev_enabled()) {
         setup_data_offset = cmdline_size;
         cmdline_size += sizeof(SetupData) + RNG_SEED_LENGTH;
         kernel_cmdline = g_realloc(kernel_cmdline, cmdline_size);

base-commit: 6661b8c7fe3f8b5687d2d90f7b4f3f23d70e3e8b
-- 
2.25.1



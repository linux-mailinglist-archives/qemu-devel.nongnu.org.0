Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 962B35366A9
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 19:41:01 +0200 (CEST)
Received: from localhost ([::1]:40706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nudxM-0006Cf-OG
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 13:41:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1nudsx-00041k-Ko
 for qemu-devel@nongnu.org; Fri, 27 May 2022 13:36:27 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:59448
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1nudsi-0005Nw-9U
 for qemu-devel@nongnu.org; Fri, 27 May 2022 13:36:27 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24RHMstC008483
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 17:36:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=0gA/uT1LBdXVOryGm/99a+EXBNedXz1zwRABih3GJTo=;
 b=Uh81f/PH3j3iFdqlKklM4BSdsfwDXh1WfcXAq32BQpVACpccKoNi0qKuAGzguvJzJuHF
 WL6ISpQZPrc/07UNwfvBPcx4VyIqacfNBqGFaiFu5CbQVXx2iJcjxkMXevEHSMFIXkb6
 tOfo77viXPcGYEW80+P/OFw9n5dogHV4iVnWFC/zymayAuLRjhy3BZ3BLbuM88GS/eaz
 wRU11xqK9P6LxAfXLWUsL+aWsYTYHj0NSeUQW3hg7AK3eWrqHBlncdS6neajP5qr7Anj
 si1AWZtiWgjLKrLpGnmjXdplO9kZjD9nNhJjF7+o+tPlnQ2PHJDjlLcPYsaL5i8+FR9/ Cw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gb30ag73n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 17:36:10 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24RHZ72d019386
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 17:36:09 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gb30ag73e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 May 2022 17:36:09 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24RHLCQ8018403;
 Fri, 27 May 2022 17:31:09 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04wdc.us.ibm.com with ESMTP id 3gaenbq19m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 May 2022 17:31:09 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24RHV8aQ13566278
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 May 2022 17:31:08 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4CA79B206A;
 Fri, 27 May 2022 17:31:08 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 36623B205F;
 Fri, 27 May 2022 17:31:08 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 27 May 2022 17:31:08 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org, marcandre.lureau@redhat.com
Cc: Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH 0/2] backend/tpm: Resolve issue with TPM 2 DA lockout
Date: Fri, 27 May 2022 13:30:56 -0400
Message-Id: <20220527173058.226210-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sF7ESaHAOVAecc61QDKnv93ZT43HoyoC
X-Proofpoint-ORIG-GUID: maK7GUEQFc4OdTHYuEkqWBignFQcdwpy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-27_05,2022-05-27_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 suspectscore=0 mlxscore=0 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205270085
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

This series of patches resolves an issue with a TPM 2's dictionary attack
lockout logic being triggered upon well-timed VM resets. Normally, the OS
TPM driver sends a TPM2_Shutdown to the TPM 2 upon reboot and before a VM
is reset. However, the OS driver cannot do this when the user resets a VM.
In this case QEMU must send the command because otherwise several well-
timed VM resets will trigger the TPM 2's dictionary attack (DA) logic and
it will then refuse to do certain key-related operations until the DA
logic has timed out.

Regards,
  Stefan

Stefan Berger (2):
  backends/tpm: Record the last command sent to the TPM
  backends/tpm: Send TPM2_Shutdown upon VM reset

 backends/tpm/tpm_emulator.c | 44 +++++++++++++++++++++++++++++++++++++
 backends/tpm/tpm_int.h      |  3 +++
 backends/tpm/tpm_util.c     |  9 ++++++++
 backends/tpm/trace-events   |  1 +
 include/sysemu/tpm_util.h   |  3 +++
 5 files changed, 60 insertions(+)

-- 
2.35.3



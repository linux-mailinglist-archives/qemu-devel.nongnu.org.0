Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B349B3589F2
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 18:43:02 +0200 (CEST)
Received: from localhost ([::1]:53630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUXkD-0003iL-Qi
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 12:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1lUXa3-000141-SR; Thu, 08 Apr 2021 12:32:31 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:4620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1lUXZv-0001bM-2N; Thu, 08 Apr 2021 12:32:31 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 138G4h25059144; Thu, 8 Apr 2021 12:32:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=KY+fcE6p6EDu1MMtObG+WTQOVGhPFmZDlXYcVqGfYS8=;
 b=WyC/TorQtnGxkQ7HqXnIzsCgN+FdLOkacY4u1C08sp3Io+5fwKa8TwGp3zQTKFAw0+n6
 Ly6m6aosJeUQgQTzhdgMuEhXNZlItaoqaDQh1YPZPw5wwoRiKBKdRt/danN2oW2cH9yX
 LSqai1+pcX0YVZPtwjTeWixM12kGZMdMI/zHz88Xs6PQERVvL6+2zX7ycc0RrHMBUUDs
 25+Cgm3xFkYAZ2pMHectMabkCTlnCjWYhfQSiKLOjH4cvTQ2FjfjX4pKP7+Hu3GXXAaO
 Fx3Ul1/vVq0wyCv6HL27mhL45nJK16l1FVdNiUCHPI0F4+pD4tpm1jwFt76KO9HLVWnj RA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37rvn1qh33-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Apr 2021 12:32:18 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 138G53r3061993;
 Thu, 8 Apr 2021 12:32:18 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37rvn1qh2b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Apr 2021 12:32:18 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 138GRW9E016240;
 Thu, 8 Apr 2021 16:32:15 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 37rvbsgxmw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Apr 2021 16:32:15 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 138GWCtU36766098
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 Apr 2021 16:32:12 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 99D264C05E;
 Thu,  8 Apr 2021 16:32:12 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 24B864C074;
 Thu,  8 Apr 2021 16:32:12 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.156.198])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  8 Apr 2021 16:32:12 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/1] s390x: css: report errors from ccw_dstream_read/write
Date: Thu,  8 Apr 2021 18:32:08 +0200
Message-Id: <1617899529-9329-1-git-send-email-pmorel@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pZ0N9c7q3bC0G9XjzOpIj63nFBViWcMZ
X-Proofpoint-ORIG-GUID: ffDKd5_cN9qHstQoktHoxgIrlipvduln
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-08_03:2021-04-08,
 2021-04-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 spamscore=0 mlxscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104080107
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: thuth@redhat.com, frankja@linux.ibm.com, david@redhat.com,
 cohuck@redhat.com, richard.henderson@linaro.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, mst@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, imbrenda@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

By checking the results of errors on SSCH in the kvm-unit-tests
We noticed that no error was reported when a SSCH is started
to access addresses not existing in the guest.
For exemple accessing 3G on a guest with 1G memory.

If we look at QEMU ccw_dstream_write/write functions we see that they
are often not checked for error in various places.

It follows that accessing an invalid address does not trigger a
subchannel status program check to the guest as it should.

Regards,
Pierre


Pierre Morel (1):
  s390x: css: report errors from ccw_dstream_read/write

 hw/char/terminal3270.c | 11 +++++--
 hw/s390x/3270-ccw.c    |  5 +++-
 hw/s390x/css.c         | 14 +++++----
 hw/s390x/virtio-ccw.c  | 66 ++++++++++++++++++++++++++++++------------
 4 files changed, 69 insertions(+), 27 deletions(-)

-- 
2.17.1

changelog:

from v1:

- handle_payload_3270_read, return CSS error on CSS access errors
  keep returning -EIO for other 3270 internal errors.
  (Connie)

- css_interpret_ccw, let CSS handle the residual count even on errors
  it is supposed to do it right.
  (Connie)



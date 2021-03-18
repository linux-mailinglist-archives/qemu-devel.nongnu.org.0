Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E931340AF0
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 18:04:51 +0100 (CET)
Received: from localhost ([::1]:50206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMw4o-0004Y7-BX
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 13:04:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lMvZb-00058m-PI; Thu, 18 Mar 2021 12:32:35 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:43154
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lMvZY-0000Wj-Iz; Thu, 18 Mar 2021 12:32:35 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12IG43Vd059858; Thu, 18 Mar 2021 12:32:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=to : cc : from : subject
 : message-id : date : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=dybXEcvKR3MPheoZwaCk6CTSWe39xPTSbTtw+UVSvCg=;
 b=YXhAAJELp2lqphlhdZJZ4GughtMXL1s0JQAq+NWIWf2aosGDE2ZxG3BCJMTuozJQIi78
 LzUZMnKzL/f8ygGxNcaIyYpGEHrjx0DP6uR5E3D7XhBv3NEJInjsBHxpNfJRSUQv8Iaq
 dovZnEuxkfsAJMdBidCzTLO0Au6wOlWNnEDuYuxRggrhlCHi/B2F9TGbhCBShfqoiOxN
 bnLNkOs5fpsgWHCRE6QDlYS9Wj5TOabF/JOXNrOiRlVb7JShEqMoHQ/Ky0qV3L4lZ1cR
 NmpUSxhvL/xTzZ2NB7hPlepcaiEuzuIONUXDNxb2RImfkf0Z78ocoW1DdzA4Z76bz67m Tw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37by16d4mp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Mar 2021 12:32:29 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12IG4O0I065018;
 Thu, 18 Mar 2021 12:32:29 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37by16d4m0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Mar 2021 12:32:29 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12IGSPYt019080;
 Thu, 18 Mar 2021 16:32:27 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 37brpfre85-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Mar 2021 16:32:27 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12IGWP6O36241788
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Mar 2021 16:32:25 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 86BED11C058;
 Thu, 18 Mar 2021 16:32:25 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 527B011C04C;
 Thu, 18 Mar 2021 16:32:25 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.66.184])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 18 Mar 2021 16:32:25 +0000 (GMT)
To: Max Reitz <mreitz@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: iotest 051 failure on s390
Message-ID: <a574a10b-541f-ea49-9514-027b4a471e2a@de.ibm.com>
Date: Thu, 18 Mar 2021 17:32:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-18_09:2021-03-17,
 2021-03-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=619 clxscore=1015 mlxscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103180112
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On s390 with latest master I do get

051   fail       [17:30:00] [17:30:05]   5.4s                 output mismatch (see 051.out.bad)
--- /home/cborntra/REPOS/qemu/tests/qemu-iotests/051.out
+++ 051.out.bad
@@ -61,13 +61,13 @@
  (qemu) quit

  Testing: -drive file=TEST_DIR/t.qcow2,node-name=123foo
-QEMU_PROG: -drive file=TEST_DIR/t.qcow2,node-name=123foo: Invalid node name
+QEMU_PROG: -drive file=TEST_DIR/t.qcow2,node-name=123foo: Invalid node-name: '123foo'

  Testing: -drive file=TEST_DIR/t.qcow2,node-name=_foo
-QEMU_PROG: -drive file=TEST_DIR/t.qcow2,node-name=_foo: Invalid node name
+QEMU_PROG: -drive file=TEST_DIR/t.qcow2,node-name=_foo: Invalid node-name: '_foo'

  Testing: -drive file=TEST_DIR/t.qcow2,node-name=foo#12
-QEMU_PROG: -drive file=TEST_DIR/t.qcow2,node-name=foo#12: Invalid node name
+QEMU_PROG: -drive file=TEST_DIR/t.qcow2,node-name=foo#12: Invalid node-name: 'foo#12'


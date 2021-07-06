Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F353BDD86
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 20:48:42 +0200 (CEST)
Received: from localhost ([::1]:44562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0q7d-0004rx-SX
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 14:48:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.albrecht@linux.vnet.ibm.com>)
 id 1m0q6C-0004A4-E8; Tue, 06 Jul 2021 14:47:12 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:16912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.albrecht@linux.vnet.ibm.com>)
 id 1m0q6A-0001m9-6y; Tue, 06 Jul 2021 14:47:12 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 166IjXcw175797; Tue, 6 Jul 2021 14:47:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type : date :
 from : to : cc : subject : in-reply-to : references : message-id :
 content-transfer-encoding : mime-version; s=pp1;
 bh=+fP2SGgdL+F4wU861tfgAHPTL0jfF6b0nMiut+nEpzk=;
 b=WGSZ3GcF4BMT6CwPi6UUFgtBMf9vEb9gwV504fQ1Z09l8xFKLBXUpeBURRrp45XRaC+C
 G/ZV7WW+vOSyLw9pjQoNllSBoA469ktZOhPtm2oaN1vVg00DaKBSkyQelNO3waI3oAcr
 pB7mhEDzexWwW5FYHGBbTdOhn0cc4SL9RtVR7sMdfXzvQZUdFDx3KeZKhImAaX9pA8JA
 VLvj4YH14L0WYIzP+F/4uh1q5E4sKg75lJX3r/O/Z7JWMzJ3kMvVyp85hw2FkZ7UcrcR
 bThuZeZuYXBRugk8WdgyvaVv/VNqZLqWyp+0BnfIR9iJ+FVB790vcmuV1CMP9GjoqE4t +Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39mtr3b5w9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Jul 2021 14:47:04 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 166IjXZM175814;
 Tue, 6 Jul 2021 14:47:03 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39mtr3b5w1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Jul 2021 14:47:03 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 166IQpXZ024909;
 Tue, 6 Jul 2021 18:47:02 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma05wdc.us.ibm.com with ESMTP id 39jfhbe98d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Jul 2021 18:47:02 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 166Il1tn47841588
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Jul 2021 18:47:01 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 27BEB6E053;
 Tue,  6 Jul 2021 18:47:01 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98D336E04E;
 Tue,  6 Jul 2021 18:47:00 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.10.229.42])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  6 Jul 2021 18:47:00 +0000 (GMT)
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Date: Tue, 06 Jul 2021 14:47:00 -0400
From: "jonathan.albrecht" <jonathan.albrecht@linux.vnet.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH 0/2] linux-user/s390x: signal with SIGFPE on
 compare-and-trap
Organization: IBM
In-Reply-To: <87tul9hzxf.fsf@redhat.com>
References: <20210621141452.2045-1-jonathan.albrecht@linux.vnet.ibm.com>
 <87tul9hzxf.fsf@redhat.com>
Message-ID: <c1e807849f96306dcc5faffae056f937@imap.linux.ibm.com>
X-Sender: jonathan.albrecht@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.1.12
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dRki9vbOrfX5GTWlGY4im0N94U7Pv5DM
X-Proofpoint-ORIG-GUID: kVcSs0t8Njtlccw4Fvay68uyfR9_wE_p
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-06_10:2021-07-06,
 2021-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011
 malwarescore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107060087
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=jonathan.albrecht@linux.vnet.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-s390x
 <qemu-s390x-bounces+jonathan.albrecht=linux.vnet.ibm.com@nongnu.org>,
 iii@linux.ibm.com, david@redhat.com, richard.henderson@linaro.org,
 laurent@vivier.eu, qemu-devel@nongnu.org, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org, krebbel@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021-07-05 5:29 am, Cornelia Huck wrote:
> On Mon, Jun 21 2021, Jonathan Albrecht
> <jonathan.albrecht@linux.vnet.ibm.com> wrote:
> 
>> qemu-s390x signals with SIGILL on compare-and-trap instructions. This
>> breaks OpenJDK which expects SIGFPE in its implementation of implicit
>> exceptions.
>> 
>> This patch depends on [PATCH v3 0/2] target/s390x: Fix SIGILL psw.addr
>> reporting.
>> https://lore.kernel.org/qemu-devel/20210602002210.3144559-1-iii@linux.ibm.com/
>> 
>> Based-on: 20210602002210.3144559-1-iii@linux.ibm.com
>> 
>> Jonathan Albrecht (2):
>>   linux-user/s390x: signal with SIGFPE on compare-and-trap
>>   tests/tcg: Test that compare-and-trap raises SIGFPE
>> 
>>  linux-user/s390x/cpu_loop.c     |  19 +++---
>>  tests/tcg/s390x/Makefile.target |   1 +
>>  tests/tcg/s390x/trap.c          | 100 
>> ++++++++++++++++++++++++++++++++
>>  3 files changed, 111 insertions(+), 9 deletions(-)
>>  create mode 100644 tests/tcg/s390x/trap.c
> 
> Assuming that this will also go through the linux-user tree:
> 
> Acked-by: Cornelia Huck <cohuck@redhat.com>

Thanks and yes, IIUC, 
https://lore.kernel.org/qemu-devel/20210705210434.45824-1-iii@linux.ibm.com/
is going through the linux-user tree so this should as well.

I'm going to send a v2 of this patch shortly to fix conflicts with the 
latest
tests/tcg/s390x/Makefile.target changes.

Jon


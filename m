Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D6464BB3E
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 18:41:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p59GY-0006dW-N3; Tue, 13 Dec 2022 12:40:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1p59GU-0006br-T0; Tue, 13 Dec 2022 12:40:27 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1p59GS-0001Or-R3; Tue, 13 Dec 2022 12:40:26 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BDH0sif011703; Tue, 13 Dec 2022 17:40:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Xh1ip6VDpOoE3GMyZTRGQntByek6xZsT9F3J00FBhWw=;
 b=DLM8iP7XP3a0iUMAiJBNlRG8bRu4/JedyK3KjkLVRi/vhR3EZEHtb3iwzLpJEUaMnKED
 c8yaMOhp1cCKqki+z4AilSkbp1tFK6SpTj9gPd6dQE9eIGxbx+iu0vhChUddNVT1L9Cr
 SBW+0+srzW7nZJwTOvPc+vjlLcieJewR6xtFS3EA5PYSOCjNriLQKN41TDuCPdmpSMfU
 uuzSJVhLqHDOLG5WDqB/BEpHvdCOelUmkhHaThQ7wJ0M5JtcImQ70MUMZ0VAxtB1RO6k
 +mjpwjFH3nLwQdQgITPezTRJBcdR6KbaanzoJBHGnnz+rJ/X/gL+/0Cs8MjHxhz+l2+v Gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mewe0s2rk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Dec 2022 17:40:19 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BDH13cQ013139;
 Tue, 13 Dec 2022 17:40:18 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mewe0s2qc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Dec 2022 17:40:18 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BD606a9030249;
 Tue, 13 Dec 2022 17:40:16 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3mchr5vh7d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Dec 2022 17:40:16 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BDHeC4v5571038
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Dec 2022 17:40:12 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 846F020043;
 Tue, 13 Dec 2022 17:40:12 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0612C20040;
 Tue, 13 Dec 2022 17:40:11 +0000 (GMT)
Received: from [9.171.23.219] (unknown [9.171.23.219])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 13 Dec 2022 17:40:10 +0000 (GMT)
Message-ID: <ca338024-4e00-6e45-2eea-ffb034c854a9@linux.ibm.com>
Date: Tue, 13 Dec 2022 18:40:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v13 4/7] s390x/cpu_topology: CPU topology migration
Content-Language: en-US
To: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, pasic@linux.ibm.com, richard.henderson@linaro.org, 
 david@redhat.com, thuth@redhat.com, cohuck@redhat.com, mst@redhat.com,
 pbonzini@redhat.com, kvm@vger.kernel.org, ehabkost@redhat.com,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 seiden@linux.ibm.com, nrb@linux.ibm.com, scgl@linux.ibm.com,
 frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20221208094432.9732-1-pmorel@linux.ibm.com>
 <20221208094432.9732-5-pmorel@linux.ibm.com>
 <65b704e7-ee3a-c9de-45fa-b59c9731cb54@de.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <65b704e7-ee3a-c9de-45fa-b59c9731cb54@de.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: B3JdRGT2_GgnEW400oIh_7xLQbSeOS16
X-Proofpoint-ORIG-GUID: 1sLm1x_Oa2XEgO_kI1NmyvogJxOHr6AT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-13_03,2022-12-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212130155
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 12/13/22 14:26, Christian Borntraeger wrote:
> Am 08.12.22 um 10:44 schrieb Pierre Morel:
>> The migration can only take place if both source and destination
>> of the migration both use or both do not use the CPU topology
>> facility.
>>
>> We indicate a change in topology during migration postload for the
>> case the topology changed between source and destination.
> 
> I dont get why we need this? If the target QEMU has topology it should
> already create this according to the configuration. WHy do we need a
> trigger?

We do not.
The first idea was to migrate the topology with a dedicated object but 
after today discussion, it will be recreated by the admin on the target 
and the MTCR will not be migrated but simply set to 1 on target start.

So next spin will not get migration included.

Regards,
Pierre


-- 
Pierre Morel
IBM Lab Boeblingen


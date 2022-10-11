Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD9D5FADEF
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 10:01:33 +0200 (CEST)
Received: from localhost ([::1]:54754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiACh-0004Sm-Uw
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 04:01:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1oi9aJ-0003KO-Ll; Tue, 11 Oct 2022 03:21:51 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:48208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1oi9aF-0001Ct-Pg; Tue, 11 Oct 2022 03:21:51 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29B6W4QI015541;
 Tue, 11 Oct 2022 07:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=smmXResZ6f3D913gi8urH/JnshMq5UDRdNt+b1aTpHM=;
 b=WfMWyw2aME2BepkEl4E+HFb5B2Zhs/2WYfMeTdAXs11R2o1guLOdUfD/Iu/9DfRx1jgp
 7cLnt5UKm/yG2E4fl0MI/uEKgyggQaVcNyXrPbJHaCKvNFqp04EwvnaB5pnddGPfLsVt
 iBjnrxxPGbx8krHJabR4S+yT+kKZP+x9vw2bEoDTg4Z6CCHOTQrio1MFLfB2oP9WARgS
 PXEzOc6zCrqmMUQDWYncADt/fDDzebqPo7x9+lZADlvx7UnH4DaUgoN76LTlWLqWlTZp
 +9LR5I05iUDqs+WmYHngKd5uw/RmCT5txzuf9B0gM1DT9T6Mx5tpgG/5WKZH8fu8RtCz Ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k510jcmgf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Oct 2022 07:21:41 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29B6XWLq024949;
 Tue, 11 Oct 2022 07:21:40 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k510jcmfd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Oct 2022 07:21:40 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29B7KcnS013474;
 Tue, 11 Oct 2022 07:21:38 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3k30u93uk2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Oct 2022 07:21:38 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29B7LYVw22610346
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Oct 2022 07:21:34 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D197652052;
 Tue, 11 Oct 2022 07:21:34 +0000 (GMT)
Received: from [9.171.33.113] (unknown [9.171.33.113])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 5EE9452050;
 Tue, 11 Oct 2022 07:21:32 +0000 (GMT)
Message-ID: <e48d20de-11a4-9e2b-77a1-0a6014f7e0ea@linux.ibm.com>
Date: Tue, 11 Oct 2022 09:21:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v9 01/10] s390x/cpus: Make absence of multithreading clear
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Nico Boehr <nrb@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 frankja@linux.ibm.com, berrange@redhat.com
References: <20220902075531.188916-1-pmorel@linux.ibm.com>
 <20220902075531.188916-2-pmorel@linux.ibm.com>
 <166237756810.5995.16085197397341513582@t14-nrb>
 <c394823e-edd5-a722-486f-438e5fba2c9d@linux.ibm.com>
 <0d3fd34e-d060-c72e-ee19-e9054e06832a@kaod.org>
 <724d962a-c11b-c18d-f67f-9010eb2f32e2@linux.ibm.com>
 <dff1744f-3242-af11-6b4b-02037a7e2af5@linux.ibm.com>
 <3becce0a-1b7a-385a-4180-f68cf192595a@kaod.org>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <3becce0a-1b7a-385a-4180-f68cf192595a@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: CjHXYjK9yxikh4N73u43zzkEViyqZQDW
X-Proofpoint-GUID: qKtZy4TeqV25a_rKk4YOciIulF8JNBC_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-11_03,2022-10-10_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 phishscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 clxscore=1011 mlxlogscore=889 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210110039
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.007,
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



On 9/28/22 18:28, Cédric Le Goater wrote:
> On 9/28/22 18:16, Pierre Morel wrote:
>> More thinking about this I will drop this patch for backward 
>> compatibility and in topology masks treat CPUs as being cores*threads
> 
> yes. You never know, people might have set threads=2 in their
> domain file (like me). You could give the user a warning though,
> with warn_report().

More thinking, I come back to the first idea after Daniel comment and 
protect the change with a new machine type version.


> 
> Thanks,
> 
> C.
> 
> 
>>

-- 
Pierre Morel
IBM Lab Boeblingen


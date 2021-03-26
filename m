Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FF334A8AD
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 14:47:17 +0100 (CET)
Received: from localhost ([::1]:55610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPmo0-0004j8-Ea
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 09:47:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbhat@linux.ibm.com>)
 id 1lPmml-0003mW-Dv; Fri, 26 Mar 2021 09:46:00 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:42992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbhat@linux.ibm.com>)
 id 1lPmmg-0002pg-8O; Fri, 26 Mar 2021 09:45:58 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12QDYFhK012278; Fri, 26 Mar 2021 09:45:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=hN0aKM+lO6uutXnfbRXmXi0g8UDR1FbhTJDTauPMVfA=;
 b=KW5iwY4LBagg3jAZK0EPVylMDgcApBiM/dnAooLxKwxoPpvKN+DEbPEtfWukve5Yo8Hu
 1zdlfsK7zLkFdaHRWXk7wW5F+cldOG+WxmVmk3mk9sdzsEVt5IxuhOqrgA62XHWbiG6g
 5Tg9HeDylYCJzRdKHA3TPSWXsuqYf9dnDIjKGps8IuO094f10S2jcTWawhpAl9hnTVs4
 R1Jb7mj+X7VXNPwqw0WeTS1r9VPsIoZi3rLp3CYVfgqlHmDMssFqfjNUTS9st1tEAbuH
 CrPEQTIp0aptspzugQ9SzEfdW+NDcncZWcDoaJnMUC6T8haHxCqgB9Q4KYgC1BKTFEP/ pg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37hcdufnb5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 09:45:43 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12QDYjL5018182;
 Fri, 26 Mar 2021 09:45:43 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37hcdufn93-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 09:45:43 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12QDhoJJ028750;
 Fri, 26 Mar 2021 13:45:40 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma05fra.de.ibm.com with ESMTP id 37h14vgc2v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 13:45:40 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12QDjc8T45941002
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Mar 2021 13:45:38 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE3BD5204E;
 Fri, 26 Mar 2021 13:45:37 +0000 (GMT)
Received: from [9.199.49.154] (unknown [9.199.49.154])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id A538B52054;
 Fri, 26 Mar 2021 13:45:33 +0000 (GMT)
Subject: Re: [PATCH v3 2/3] spapr: nvdimm: Implement H_SCM_FLUSH hcall
To: David Gibson <david@gibson.dropbear.id.au>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
References: <161650723087.2959.8703728357980727008.stgit@6532096d84d3>
 <161650725183.2959.12071056430236337803.stgit@6532096d84d3>
 <YFqs8M1dHAFhdCL6@yekko.fritz.box>
 <19b5aa0b-df85-256d-d4c4-eacd0ea8312e@linux.ibm.com>
 <YFvsmKiXtb+h9HBO@yekko.fritz.box>
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Message-ID: <8c642adb-7c07-41e1-07d0-f23bb6c2f865@linux.ibm.com>
Date: Fri, 26 Mar 2021 19:15:32 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <YFvsmKiXtb+h9HBO@yekko.fritz.box>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TfjaPP-Svek39ukV1IUMfj-VmbPxt41r
X-Proofpoint-ORIG-GUID: 9jkdStyqWjplPIyzdFqhl-2TNvJTeUAy
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-26_06:2021-03-26,
 2021-03-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 mlxlogscore=887 clxscore=1015 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2103250000 definitions=main-2103260103
Received-SPF: pass client-ip=148.163.156.1; envelope-from=sbhat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ehabkost@redhat.com, mst@redhat.com, bharata@linux.vnet.ibm.com,
 linux-nvdimm@lists.01.org, groug@kaod.org, kvm-ppc@vger.kernel.org,
 qemu-devel@nongnu.org, shivaprasadbhat@gmail.com, qemu-ppc@nongnu.org,
 imammedo@redhat.com, sbhat@linux.vnet.ibm.com, xiaoguangrong.eric@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/25/21 7:21 AM, David Gibson wrote:
> On Wed, Mar 24, 2021 at 09:34:06AM +0530, Aneesh Kumar K.V wrote:
>> On 3/24/21 8:37 AM, David Gibson wrote:
>>> On Tue, Mar 23, 2021 at 09:47:38AM -0400, Shivaprasad G Bhat wrote:
>>>> The patch adds support for the SCM flush hcall for the nvdimm devices.
...
>>>> collects all the hcall states from 'completed' list. The necessary
>>>> nvdimm flush specific vmstate structures are added to the spapr
>>>> machine vmstate.
>>>>
>>>> Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
>>> An overal question: surely the same issue must arise on x86 with
>>> file-backed NVDIMMs.  How do they handle this case?
>> On x86 we have different ways nvdimm can be discovered. ACPI NFIT, e820 map
>> and virtio_pmem. Among these virio_pmem always operated with synchronous dax
>> disabled and both ACPI and e820 doesn't have the ability to differentiate
>> support for synchronous dax.
> Ok.  And for the virtio-pmem case, how are the extra flushes actually
> done on x86?


virtio-pmem device has virtqueue with virtio_pmem_flush() as the handler

which gets called for all flush requests from guest. virtio_pmem_flush() is

offloading the flush to thread pool with a worker doing fsync() and the

completion callback notifying the guest with response.


>> With that I would expect users to use virtio_pmem when using using file
>> backed NVDIMMS
> So... should we prevent advertising an NVDIMM through ACPI or e820 if
> it doesn't have sync-dax enabled?


Is it possible to have different defaults for sync-dax based on 
architecture ?

The behaviour on x86 is sync-dax=on for nvdimms. So, it would be correct to

have the default as "on" for x86. For pseries -  "off" for new machines.

Looking at code, I didnt find much ways to achieve this. Can you suggest

what can be done ?



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF163478ED
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 13:55:29 +0100 (CET)
Received: from localhost ([::1]:34636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP32m-0002d9-EO
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 08:55:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aneesh.kumar@linux.ibm.com>)
 id 1lOuky-0007cW-PG; Wed, 24 Mar 2021 00:04:32 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:20672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aneesh.kumar@linux.ibm.com>)
 id 1lOukw-0006OR-OL; Wed, 24 Mar 2021 00:04:32 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12O42j4F096158; Wed, 24 Mar 2021 00:04:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=KMzKvsJ+4PcCy7f2/cfJEV8IWxLjNZ1e+OGep2nWj+w=;
 b=lUrIZrsGDGJBs3lw6BDLsPaHvNr9ydPEIZjPAw4ycGlOkRi/3KcKcTuBqYFe60FXbOt5
 YdS4QZkGrEl2jRnZrpUVtU7HR6reKlVDSTXOHBoJi6HJRJBnpZ6W+n2FQI1nqCWcAOZU
 UWoWakcJnp1fZQfXjFffS5fV+KAtj/HyNfBj+bgIO2FVJ7KQOArXFY3h9VN7LAXZNa5c
 2BJ7cOdizYO62q1TFsJFM0+2PwPWr3lr+eWa3l3cp7jmT54Z/tvTqC6aefEh9oPwxcav
 cDoFl68uP0XOTeB/4b3yjdi2LyDQKi60NH7dmzHBowteFAbYYHdAmqByYg8YKSEPTa6g Iw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37fuq42st6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Mar 2021 00:04:14 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12O44EjG099912;
 Wed, 24 Mar 2021 00:04:14 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37fuq42ssn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Mar 2021 00:04:14 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12O42tRW024310;
 Wed, 24 Mar 2021 04:04:12 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 37d9bmkxg5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Mar 2021 04:04:12 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12O449Dm40567082
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Mar 2021 04:04:10 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8D1C4C046;
 Wed, 24 Mar 2021 04:04:09 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 101A64C05A;
 Wed, 24 Mar 2021 04:04:07 +0000 (GMT)
Received: from [9.85.94.223] (unknown [9.85.94.223])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 24 Mar 2021 04:04:06 +0000 (GMT)
Subject: Re: [PATCH v3 2/3] spapr: nvdimm: Implement H_SCM_FLUSH hcall
To: David Gibson <david@gibson.dropbear.id.au>,
 Shivaprasad G Bhat <sbhat@linux.ibm.com>
References: <161650723087.2959.8703728357980727008.stgit@6532096d84d3>
 <161650725183.2959.12071056430236337803.stgit@6532096d84d3>
 <YFqs8M1dHAFhdCL6@yekko.fritz.box>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <19b5aa0b-df85-256d-d4c4-eacd0ea8312e@linux.ibm.com>
Date: Wed, 24 Mar 2021 09:34:06 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YFqs8M1dHAFhdCL6@yekko.fritz.box>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-24_03:2021-03-23,
 2021-03-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 adultscore=0 clxscore=1011 suspectscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103240029
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=aneesh.kumar@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 24 Mar 2021 08:50:04 -0400
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

On 3/24/21 8:37 AM, David Gibson wrote:
> On Tue, Mar 23, 2021 at 09:47:38AM -0400, Shivaprasad G Bhat wrote:
>> The patch adds support for the SCM flush hcall for the nvdimm devices.
>> To be available for exploitation by guest through the next patch.
>>
>> The hcall expects the semantics such that the flush to return
>> with H_BUSY when the operation is expected to take longer time along
>> with a continue_token. The hcall to be called again providing the
>> continue_token to get the status. So, all fresh requsts are put into
>> a 'pending' list and flush worker is submitted to the thread pool.
>> The thread pool completion callbacks move the requests to 'completed'
>> list, which are cleaned up after reporting to guest in subsequent
>> hcalls to get the status.
>>
>> The semantics makes it necessary to preserve the continue_tokens
>> and their return status even across migrations. So, the pre_save
>> handler for the device waits for the flush worker to complete and
>> collects all the hcall states from 'completed' list. The necessary
>> nvdimm flush specific vmstate structures are added to the spapr
>> machine vmstate.
>>
>> Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
> 
> An overal question: surely the same issue must arise on x86 with
> file-backed NVDIMMs.  How do they handle this case?

On x86 we have different ways nvdimm can be discovered. ACPI NFIT, e820 
map and virtio_pmem. Among these virio_pmem always operated with 
synchronous dax disabled and both ACPI and e820 doesn't have the ability 
to differentiate support for synchronous dax.

With that I would expect users to use virtio_pmem when using using file 
backed NVDIMMS

-aneesh


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB24402698
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 11:56:46 +0200 (CEST)
Received: from localhost ([::1]:49080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNXqP-0006NI-B0
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 05:56:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mNXmR-0002f3-CK; Tue, 07 Sep 2021 05:52:39 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:39314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mNXmJ-0002vM-9M; Tue, 07 Sep 2021 05:52:39 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1879ZQrD057391; Tue, 7 Sep 2021 05:52:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=A3EuiHBXM5a3NYbOZVb9Q/IbePsMBb9P3APYF9HRlMI=;
 b=JKP8jeQgGLetLqGAlsTAJVNMIY4EO6hpwp5Ix8iVen8IABOAzA8s8/xiw6GJbExDlPaz
 gwzCUjrl8OsmM2Lr18uGjOM9T1BaC521OFzVy8dGhNDwta07KcOhZYdBKKRxji2Uv3oY
 wnsNJMcbYvRvOwKMwvEoNUbrm0uGaNWsJ5r92JspWUoKMcepbL7ZQcf3R7Na+4tvoCNj
 wKs+rIf9mGK9hS1EFBbbGxiwjok3aRLjfAbwbBAv0lW4UMx8/WPw+Y8t2XZpBTHDW/CN
 e43bvGiclLiHvgSvQR5lXnUl923PWRSBz8j73XTWrZFq0BRJIp/Am0NiO0EJPcKg3IPj 4g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ax4mh20ak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 05:52:28 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1879cuRP063879;
 Tue, 7 Sep 2021 05:52:27 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ax4mh20a6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 05:52:27 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1879q3CF007142;
 Tue, 7 Sep 2021 09:52:25 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3av02jne3h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 09:52:25 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1879qLmo49938906
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Sep 2021 09:52:21 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BEBCCAE05A;
 Tue,  7 Sep 2021 09:52:21 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7414EAE057;
 Tue,  7 Sep 2021 09:52:21 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.9.165])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  7 Sep 2021 09:52:21 +0000 (GMT)
Subject: Re: [PATCH v2 5/5] s390x: topology: implementating Store Topology
 System Information
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org
References: <1626975764-22131-1-git-send-email-pmorel@linux.ibm.com>
 <1626975764-22131-6-git-send-email-pmorel@linux.ibm.com>
 <cd353458-d70e-b020-4195-2f8f9f9c6741@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <70fe96ef-89df-9321-c1d9-2496073aa3e5@linux.ibm.com>
Date: Tue, 7 Sep 2021 11:52:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <cd353458-d70e-b020-4195-2f8f9f9c6741@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: W5WGUR8RJTo5pgeCASe2f1gh6T7gswQK
X-Proofpoint-ORIG-GUID: 1_M6ixHQo4sqQDj-EYfP9kmKpUt5nFiJ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-07_03:2021-09-03,
 2021-09-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109070063
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.332,
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
Cc: david@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/7/21 10:00 AM, Thomas Huth wrote:
> On 22/07/2021 19.42, Pierre Morel wrote:
>> The handling of STSI is enhenced with the interception of the
> 
> s/enhenced/enhanced/

yes, thanks

> 
>> function code 15 for storing CPU topology.

...

>> +static void insert_stsi_15_1_x(S390CPU *cpu, int sel2, __u64 addr, 
>> uint8_t ar)
>> +{
>> +    const MachineState *machine = MACHINE(qdev_get_machine());
>> +    void *p;
>> +    int ret, cc;
>> +
>> +    /*
>> +     * Until the SCLP STSI Facility reporting the MNEST value is used,
>> +     * a sel2 value of 2 is the only value allowed in STSI 15.1.x.
>> +     */
>> +    if (sel2 != 2) {
>> +        setcc(cpu, 3);
>> +        return;
>> +    }
>> +
>> +    p = g_malloc0(4096);
> 
> Use TARGET_PAGE_SIZE instead of magic value 4096?
yes
> 
>> +   insert_stsi_15_1_2(machine, p);
> 
> Wrong indentation (3 instead of 4 spaces).

oh, yes, thanks

> 
>> +    if (s390_is_pv()) {
>> +        ret = s390_cpu_pv_mem_write(cpu, 0, p, 4096);
>> +    } else {
>> +        ret = s390_cpu_virt_mem_write(cpu, addr, ar, p, 4096);
> 
> TARGET_PAGE_SIZE?

yes, of course.

> 
>> +    }
>> +    cc = ret ? 3 : 0;
>> +    setcc(cpu, cc);
>> +    g_free(p);
>> +}
>> +
>>   static int handle_stsi(S390CPU *cpu)
>>   {
>>       CPUState *cs = CPU(cpu);
>> @@ -1920,6 +2017,10 @@ static int handle_stsi(S390CPU *cpu)
>>           /* Only sysib 3.2.2 needs post-handling for now. */
>>           insert_stsi_3_2_2(cpu, run->s390_stsi.addr, run->s390_stsi.ar);
>>           return 0;
>> +    case 15:
>> +        insert_stsi_15_1_x(cpu, run->s390_stsi.sel2, 
>> run->s390_stsi.addr,
>> +                           run->s390_stsi.ar);
>> +        return 0;
>>       default:
>>           return 0;
>>       }
>>
> 
>   Thomas
> 

Thanks for reviewing,
Pierre

-- 
Pierre Morel
IBM Lab Boeblingen


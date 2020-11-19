Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4D22B932B
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 14:12:04 +0100 (CET)
Received: from localhost ([::1]:44800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfjjH-0005TB-Cs
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 08:12:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1kfjiD-00052r-Ki
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 08:10:57 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:47694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1kfjiB-000408-9t
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 08:10:57 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AJD4hb8034143; Thu, 19 Nov 2020 08:10:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=4LyAACrCrfDrTx9SGkzfJTDkl1SW6dbtKMMSLTiTLjY=;
 b=F+4K8p/9S2XyoTIW0fcM9ySpunpXIxAJIfGPXfY1LTqXxNiV/fgGyFqYHtx0OaNd971V
 6+n1r0TECwNF73U9f/Kc/5Z80BkYogK/WTv0JIdVKVu0iTMlJBKmmgo2sz+pWi8MoaAY
 2DrdolCgQuhrMRz/o2HIFcNNqa8TWCI1KhA4N2AY+NcJguA8XfQP/udYcph5dn7IxPyJ
 zoKCWY9Gbpvym3p/HgSbh4C9DY70duSP2b2Ld+FhSzejmc6X7r8ONigm9BOxo8aTquYz
 MZVDkyS5HGSRTIU+160NQqSSXzDw1VaPF35twnkfLCPLPUcxfOoOZ0BH7gSg533Lxas7 jQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34wg6efxww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 08:10:07 -0500
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AJD5udO048512;
 Thu, 19 Nov 2020 08:10:07 -0500
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34wg6efxv1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 08:10:06 -0500
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AJD87XO002339;
 Thu, 19 Nov 2020 13:10:03 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma02fra.de.ibm.com with ESMTP id 34t6v8bpyp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 13:10:03 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0AJDA1iQ42205544
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Nov 2020 13:10:01 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D7814C064;
 Thu, 19 Nov 2020 13:10:01 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D58A4C05E;
 Thu, 19 Nov 2020 13:09:59 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.22.151])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 19 Nov 2020 13:09:59 +0000 (GMT)
Subject: Re: [PATCH v2] drivers/virt: vmgenid: add vm generation id driver
To: Alexander Graf <graf@amazon.de>,
 "Catangiu, Adrian Costin" <acatan@amazon.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Jann Horn <jannh@google.com>
References: <3E05451B-A9CD-4719-99D0-72750A304044@amazon.com>
 <300d4404-3efe-880e-ef30-692eabbff5f7@de.ibm.com>
 <da1a1fa7-a1de-d0e6-755b-dd587687765e@amazon.de>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <c06a298e-a851-f637-6fc3-9a8dca991c6f@de.ibm.com>
Date: Thu, 19 Nov 2020 14:09:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <da1a1fa7-a1de-d0e6-755b-dd587687765e@amazon.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-TM-AS-GCONF: 00
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-19_08:2020-11-19,
 2020-11-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 priorityscore=1501 mlxlogscore=999 malwarescore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011190094
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 07:02:56
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "asmehra@redhat.com" <asmehra@redhat.com>,
 "dgunigun@redhat.com" <dgunigun@redhat.com>, KVM list <kvm@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 "ghammer@redhat.com" <ghammer@redhat.com>,
 "vijaysun@ca.ibm.com" <vijaysun@ca.ibm.com>, "Weiss,
 Radu" <raduweis@amazon.com>, Qemu Developers <qemu-devel@nongnu.org>,
 Michal Hocko <mhocko@kernel.org>, Andrey Vagin <avagin@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
 linux-s390 <linux-s390@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Biggers <ebiggers@kernel.org>,
 "Singh, Balbir" <sblbir@amazon.com>, "bonzini@gnu.org" <bonzini@gnu.org>,
 Dmitry Safonov <0x7f454c46@gmail.com>, "oridgar@gmail.com" <oridgar@gmail.com>,
 Andy Lutomirski <luto@kernel.org>, "gil@azul.com" <gil@azul.com>,
 "MacCarthaigh, Colm" <colmmacc@amazon.com>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 Linux API <linux-api@vger.kernel.org>, "areber@redhat.com" <areber@redhat.com>,
 kernel list <linux-kernel@vger.kernel.org>,
 Pavel Emelyanov <ovzxemul@gmail.com>, Mike Rapoport <rppt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Willy Tarreau <w@1wt.eu>, "Woodhouse,
 David" <dwmw@amazon.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 19.11.20 13:51, Alexander Graf wrote:
> 
> 
> On 19.11.20 13:02, Christian Borntraeger wrote:
>>
>> On 16.11.20 16:34, Catangiu, Adrian Costin wrote:
>>> - Background
>>>
>>> The VM Generation ID is a feature defined by Microsoft (paper:
>>> http://go.microsoft.com/fwlink/?LinkId=260709) and supported by
>>> multiple hypervisor vendors.
>>>
>>> The feature is required in virtualized environments by apps that work
>>> with local copies/caches of world-unique data such as random values,
>>> uuids, monotonically increasing counters, etc.
>>> Such apps can be negatively affected by VM snapshotting when the VM
>>> is either cloned or returned to an earlier point in time.
>>>
>>> The VM Generation ID is a simple concept meant to alleviate the issue
>>> by providing a unique ID that changes each time the VM is restored
>>> from a snapshot. The hw provided UUID value can be used to
>>> differentiate between VMs or different generations of the same VM.
>>>
>>> - Problem
>>>
>>> The VM Generation ID is exposed through an ACPI device by multiple
>>> hypervisor vendors but neither the vendors or upstream Linux have no
>>> default driver for it leaving users to fend for themselves.
>>
>> I see that the qemu implementation is still under discussion. What is
> 
> Uh, the ACPI Vmgenid device emulation is in QEMU since 2.9.0 :).

Ah right. Found it. 
> 
>> the status of the other existing implementations. Do they already exist?
>> In other words is ACPI a given?
>> I think the majority of this driver could be used with just a different
>> backend for platforms without ACPI so in any case we could factor out
>> the backend (acpi, virtio, whatever) but if we are open we could maybe
>> start with something else.
> 
> I agree 100%. I don't think we really need a new framework in the kernel for that. We can just have for example an s390x specific driver that also provides the same notification mechanism through a device node that is also named "/dev/vmgenid", no?
> 
> Or alternatively we can split the generic part of this driver as soon as a second one comes along and then have both driver include that generic logic.

Yes. I think it is probably the best variant to check if we split this into a front end /back end or provide a new driver when we have something. 
> 
> The only piece where I'm unsure is how this will interact with CRIU. Can containers emulate ioctls and device nodes?
> 
> 
> Alex
> 
> 
> 
> Amazon Development Center Germany GmbH
> Krausenstr. 38
> 10117 Berlin
> Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
> Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
> Sitz: Berlin
> Ust-ID: DE 289 237 879
> 
> 


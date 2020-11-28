Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 084952C6DFB
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Nov 2020 01:45:03 +0100 (CET)
Received: from localhost ([::1]:58466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kioMG-00071G-Mh
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 19:45:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ankur.a.arora@oracle.com>)
 id 1kioKq-0006Yn-QX
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 19:43:32 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:34572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ankur.a.arora@oracle.com>)
 id 1kioKn-0007Rj-Du
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 19:43:32 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AS0Ynrp136576;
 Sat, 28 Nov 2020 00:43:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=rsPHSkfMDfh6AwFcXKCs0oDgvBfFL80hGtAvcoex4vw=;
 b=OFepjgXGxdg1qybXF0N8vcPv5+GLjM9drqp72GaN4YUeQq5MWyDEf/8ADS+mwD2f7a/F
 Nb7cy3PXFB7QJn7F//hYF18rD1x9GAjiODNYHmMCphj8a+I1hiwZqqFZiwDosMF0xzxO
 k/qj45qW2cbOjVS3GxGMmDcw7Fk2n69E8juj2svtQwSU75X2HiRCn56X2kRfFp2ItKRq
 TDD9AIT9OA0diAlgZ1P1KY3Rwm37ZszjTeblHZKBdKmu1js0D69XL6PRbR27b6FB4ZjQ
 vy7upd3IG7cPvsda3hCANP6pcZW1gALSNFWWdXjlb1JrekVD3GTkzENgBmiw3hLkxEK9 KA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 351kwhjt3g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 28 Nov 2020 00:43:27 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AS0e3pW093715;
 Sat, 28 Nov 2020 00:43:26 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 351kwjpbak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 28 Nov 2020 00:43:26 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0AS0hOQI009291;
 Sat, 28 Nov 2020 00:43:25 GMT
Received: from [10.159.152.214] (/10.159.152.214)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 27 Nov 2020 16:43:24 -0800
Subject: Re: [RFC] ich9:cpuhp: add support for cpu hot-unplug with SMI
 broadcast enabled
To: Laszlo Ersek <lersek@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20201124122507.1014839-1-imammedo@redhat.com>
 <bf87cef4-cac9-1c1b-5bd4-c6bc97dff994@redhat.com>
 <20201126213807.3205f5db@redhat.com>
 <fc1431da-a600-ad4c-f718-7cf8f77dde3e@oracle.com>
 <a92b50df-f693-ebda-e549-7bc9e6d2d7a5@redhat.com>
From: Ankur Arora <ankur.a.arora@oracle.com>
Message-ID: <c197150c-7156-6f19-b36e-5199a5536fcd@oracle.com>
Date: Fri, 27 Nov 2020 16:43:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <a92b50df-f693-ebda-e549-7bc9e6d2d7a5@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9818
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 phishscore=0
 malwarescore=0 spamscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011280003
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9818
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011280002
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=ankur.a.arora@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020-11-27 7:19 a.m., Laszlo Ersek wrote:
> On 11/27/20 05:10, Ankur Arora wrote:
> 
>> Yeah I was wondering what would happen for simultaneous hot add and remove.
>> I guess we would always do remove first and then the add, unless we hit
>> the break due to max_cpus_per_pass and switch to hot-add mode.
> 
> Considering the firmware only, I disagree with remove-then-add.
> 
> EFI_SMM_CPU_SERVICE_PROTOCOL.AddProcessor() and
> EFI_SMM_CPU_SERVICE_PROTOCOL.RemoveProcessor() (implemented in
> SmmAddProcessor() and SmmRemoveProcessor() in
> "UefiCpuPkg/PiSmmCpuDxeSmm/CpuService.c", respectively) only mark the
> processors for addition/removal. The actual processing is done only
> later, in BSPHandler() --> SmmCpuUpdate(), when "all SMI handlers are
> finished" (see the comment in SmmRemoveProcessor()).
> 
> Consequently, I would not suggest replacing a valid APIC ID in a
> particular mCpuHotPlugData.ApicId[Index] slot with INVALID_APIC_ID
> (corresponding to the unplug operation), and then possibly replacing
> INVALID_APIC_ID in the *same slot* with the APIC ID of the newly plugged
> CPU, in the exact same SMI invocation (= in the same execution of
> CpuHotplugMmi()). That might cause some component in edk2 to see the
> APIC ID in mCpuHotPlugData.ApicId[Index] to change from one valid ACPI
> ID to another valid APIC ID, and I don't even want to think about what
> kind of mess that could cause.

Shudders.

> 
> So no, please handle plugs first, for which unused slots in
> mCpuHotPlugData.ApicId will be populated, and *then* handle removals (in
> the same invocation of CpuHotplugMmi()).

Yeah, that ordering makes complete sense.

> 
> By the way, for unplug, you will not have to re-set
> mCpuHotPlugData.ApicId[Index] to INVALID_APIC_ID, as
> SmmRemoveProcessor() does that internally. You just have to locate the
> Index for the APIC ID being removed, for calling
> EFI_SMM_CPU_SERVICE_PROTOCOL.RemoveProcessor().

Right. The hotplug is more involved (given the need to pen the new CPU)
but for the unplug, AFAICS all the actual handling for removal is in
.RemoveProcessor() and at SMI exit in SmmCpuUpdate().


Thanks
Ankur

> 
> 
> Thanks
> Laszlo
> 


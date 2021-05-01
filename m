Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA022370777
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 15:58:18 +0200 (CEST)
Received: from localhost ([::1]:41590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcq8P-0006MI-7h
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 09:58:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aneesh.kumar@linux.ibm.com>)
 id 1lcq6f-0005PH-Hm; Sat, 01 May 2021 09:56:29 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:44570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aneesh.kumar@linux.ibm.com>)
 id 1lcq6d-0005nE-Hw; Sat, 01 May 2021 09:56:29 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 141DXOEH043051; Sat, 1 May 2021 09:56:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=zfHDntymIWxlMHIRQDwwFhACh84asPFqu9RpJfxBHps=;
 b=n7rQN3weXvrCKFBt6ElPWi7qHx5eLAktVxRyy5J4kIKMD6i/fV75C+BH8x/fewMuQYxT
 9gLw8Z+gxUNSiJVm0ZjaH59EM7L5g56Jq85i69icBcFM/3oKM/27xz6d9na5rbEoJni1
 54lcCw+e8tFXQT+VypEaJDEQahJthdRcpLUwzMx2C7cRSTNQF8PVs4RgcveNc4ePFGdr
 Sk71s/3EFhlaDw3ebOM0iDG/9QKM5YqjiuDbOVtqpCTASOVfduwaAxHcdsZgaXGDsZJq
 +VzuwDzqK6kj/HbSULbzVM2IRor06S2ONLJ9BMp5OEAOvdG0d9i3yTJE3uKCPaEX/HiK +w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38979e8ums-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 01 May 2021 09:56:04 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 141DXxci047260;
 Sat, 1 May 2021 09:56:03 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38979e8um9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 01 May 2021 09:56:03 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 141DrPv9012695;
 Sat, 1 May 2021 13:56:01 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 388xm882f0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 01 May 2021 13:56:01 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 141DtwQI53412284
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 1 May 2021 13:55:58 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A670A405F;
 Sat,  1 May 2021 13:55:58 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 45A05A4054;
 Sat,  1 May 2021 13:55:53 +0000 (GMT)
Received: from [9.85.73.140] (unknown [9.85.73.140])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat,  1 May 2021 13:55:53 +0000 (GMT)
Subject: Re: [PATCH v4 0/3] nvdimm: Enable sync-dax property for nvdimm
To: Dan Williams <dan.j.williams@intel.com>,
 Shivaprasad G Bhat <sbhat@linux.ibm.com>
References: <161966810162.652.13723419108625443430.stgit@17be908f7c1c>
 <CAPcyv4gwkyDBG7EZOth-kcZR8Fb+RgGXY=Y9vbuHXAz3PAnLVw@mail.gmail.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <5d70bf0e-290f-405a-f525-7b4710408332@linux.ibm.com>
Date: Sat, 1 May 2021 19:25:52 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAPcyv4gwkyDBG7EZOth-kcZR8Fb+RgGXY=Y9vbuHXAz3PAnLVw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9Gawgb4RCDulWYDsGhHOAhxANDP54XpS
X-Proofpoint-GUID: uxCnoSiDh3NYfGBrFgcCF0DOw-3ZgAqh
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-01_07:2021-04-30,
 2021-05-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 mlxlogscore=999 impostorscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105010096
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=aneesh.kumar@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Qemu Developers <qemu-devel@nongnu.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 Markus Armbruster <armbru@redhat.com>, bharata@linux.vnet.ibm.com,
 Haozhong Zhang <haozhong.zhang@intel.com>,
 Eduardo Habkost <ehabkost@redhat.com>, richard.henderson@linaro.org,
 Greg Kurz <groug@kaod.org>, kvm-ppc@vger.kernel.org, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 kwangwoo.lee@sk.com, David Gibson <david@gibson.dropbear.id.au>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 shameerali.kolothum.thodi@huawei.com, shivaprasadbhat@gmail.com,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/1/21 12:44 AM, Dan Williams wrote:
> Some corrections to terminology confusion below...

.......

> 
>> file on the host in case of file backed v-nvdimms. This is addressed by
>> virtio-pmem in case of x86_64 by making explicit flushes translating to
>> fsync at qemu.
> 
> Note that virtio-pmem was a proposal for a specific optimization of
> allowing guests to share page cache. The virtio-pmem approach is not
> to be confused with actual persistent memory.
> 

.....

>>
>> A new device property sync-dax is added to the nvdimm device. When the
>> sync-dax is 'writeback'(default for PPC), device property
>> "hcall-flush-required" is set, and the guest makes hcall H_SCM_FLUSH
>> requesting for an explicit flush.
> 
> I'm not sure "sync-dax" is a suitable name for the property of the
> guest persistent memory. There is no requirement that the
> memory-backend file for a guest be a dax-capable file. It's also
> implementation specific what hypercall needs to be invoked for a given
> occurrence of "sync-dax". What does that map to on non-PPC platforms
> for example? It seems to me that an "nvdimm" device presents the
> synchronous usage model and a whole other device type implements an
> async-hypercall setup that the guest happens to service with its
> nvdimm stack, but it's not an "nvdimm" anymore at that point.
> 

What is attempted here is to use the same guest driver papr_scm.ko 
support the usecase of sharing page cache from the host instead of 
depending on a new guest driver virtio-pmem. This also try to correctly 
indicate to the guest that an usage like

-object memory-backend-file,id=memnvdimm1,mem-path=file_name
-device nvdimm,memdev=memnvdimm1

correctly indicate to the guest that we are indeed sharing page cache 
and not really emulating a persistent memory.

W.r.t non ppc platforms, it was discussed earlier and one of the 
suggestion there was to mark that as "unsafe".

Any suggestion for an alternate property name than "sync-dax"?

>> sync-dax is "unsafe" on all other platforms(x86, ARM) and old pseries machines
>> prior to 5.2 on PPC. sync-dax="writeback" on ARM and x86_64 is prevented
>> now as the flush semantics are unimplemented.
> 
> "sync-dax" has no meaning on its own, I think this needs an explicit
> mechanism to convey both the "not-sync" property *and* the callback
> method, it shouldn't be inferred by arch type.

Won't a non-sync property imply that guest needs to do a callback to 
ensure persistence? Hence they are related?


-aneesh


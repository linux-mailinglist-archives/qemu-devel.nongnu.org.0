Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7407432436D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 18:58:41 +0100 (CET)
Received: from localhost ([::1]:54718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEyQq-00020n-Gb
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 12:58:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1lEyNX-0000qB-OZ
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 12:55:15 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:56456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1lEyNV-0000Yn-M7
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 12:55:15 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11OHYg2q045198; Wed, 24 Feb 2021 12:55:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=kqwYiGuVc00zpL5/ERbncxDukdh3zs2Yvdv+6X58gck=;
 b=VBQpqkwDkbOqA4lusod5eLHOj+T5OX8S9U5fvowxSvg/ABM48N+qcEC1YCj/sU5aMtgj
 6PXw+gkDNtrtK8TC5T1QK+jfFbKaayJmhcui1WLfcYuYg86i3dOi9xRelJ6D8QynqCtV
 GT0+9HRFXQ/9wb0UxJez6PLuPiloWDihvN3Dopp9kAC569Corigvdj7yO3FaXKyQnjyS
 45rBl+DhlOjCglTCP0wc7QMh8LQIjkLCE6MYP7AdbGND3vUmlWth3mFoaVI23tprJapp
 0wTzfYqIdRrm4LNskJbrIU8YdmNVxL0sJV9B/wxP7BzHURSMmQ6ADxZB0PWj5rqGGXmo wA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36wgu6f36m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Feb 2021 12:55:09 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 11OHZcZp055606;
 Wed, 24 Feb 2021 12:55:09 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36wgu6f359-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Feb 2021 12:55:09 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11OHq5xj001299;
 Wed, 24 Feb 2021 17:55:06 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03wdc.us.ibm.com with ESMTP id 36tt298hfp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Feb 2021 17:55:06 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11OHt5S318743754
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Feb 2021 17:55:05 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B52F6A04D;
 Wed, 24 Feb 2021 17:55:05 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD5266A057;
 Wed, 24 Feb 2021 17:55:04 +0000 (GMT)
Received: from [9.163.12.145] (unknown [9.163.12.145])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 24 Feb 2021 17:55:04 +0000 (GMT)
Subject: Re: [PATCH 2/2] gitlab-ci.yml: Add jobs to test CFI flags
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210222230106.7030-1-dbuono@linux.vnet.ibm.com>
 <20210222230106.7030-3-dbuono@linux.vnet.ibm.com>
 <e9973878-6181-41c6-5e65-afd07db7c476@redhat.com>
From: Daniele Buono <dbuono@linux.vnet.ibm.com>
Message-ID: <b8a6d3be-727e-9006-e6f8-c80c918d8caa@linux.vnet.ibm.com>
Date: Wed, 24 Feb 2021 12:55:03 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <e9973878-6181-41c6-5e65-afd07db7c476@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-24_08:2021-02-24,
 2021-02-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102240137
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=dbuono@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/23/2021 3:11 AM, Paolo Bonzini wrote:
> On 23/02/21 00:01, Daniele Buono wrote:
>> +# Set JOBS=1 because this requires LTO and ld consumes a large amount 
>> of memory.
>> +# On gitlab runners, default JOBS of 2 sometimes end up calling 2 lds 
>> concurrently
>> +# and triggers an Out-Of-Memory error
> 
> Does it make sense to test only one target instead?

I'd prefer grouping multiple targets per job so that the number of jobs 
doesn't explode, and stopping ninja from linking in parallel does solve 
the issue.

There's also the issue that tests are also compiled here so you may end
up with two linkers anyway. However the chance that this will end up in
an out-of-memory error is quite smaller (possibly zero) since tests
don't link that many object files together.

> 
>> +# Because of how slirp is used in QEMU, we need to have CFI also on 
>> libslirp.
>> +# System-wide version in fedora is not compiled with CFI so we 
>> recompile it using
>> +# -enable-slirp=git
> 
> Can you explain what you mean, and perhaps add a check or warning for 
> incompatible settings?

Certainly. The issue here is that there is a function in libslirp that
is used as callbacks for QEMU Timers: ra_timer_handler
(There may be others, but of this one I'm sure because I traced it).

This is not an issue when you compile slirp with qemu, since the whole
library now has CFI informations and is statically linked in the QEMU
binary. It becomes an issue if you are dynamically linking a system-wide
libslirp, as it happens on Fedora.

I'd be happy to add a check on configure/meson that ends the configure
step with an error when this happens, but that would technically be an
independent patch that I'd work on in parallel to this one.
I would prefer to not automatically select the git-based libslirp
because that may go unnoticed when configuring.

> 
> Paolo
> 


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A35032D630F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 18:09:38 +0100 (CET)
Received: from localhost ([::1]:35352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knPRh-0002jV-IW
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 12:09:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liam.merwick@oracle.com>)
 id 1knP9t-0005AR-2t
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:51:13 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:41576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liam.merwick@oracle.com>)
 id 1knP9q-00066M-TQ
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:51:12 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BAGoAm7120020;
 Thu, 10 Dec 2020 16:51:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=nRUr6tLvvj1PS9yIAEioUCiYk6Yf/pRu+tp4QyQra34=;
 b=WSxl4L2JouX59u37eOGwQVyHsmDIteS/xeBCD+8RF4j/ggJOFi3SZ8zPkka9wAa+aEp3
 wEyaw2FfaclFWKjXAzHYt13JHrjlxJFH/YwBR/MtMPKSREMOdRsgLNv82f0VOOy16Dgx
 HnvaONVxiK8D/08qw3CmlzG3e99V8bEfaCaeaisDnqbaM7G6wxVaXZMvGh4QKufYxAqZ
 GJqcxAqFrsFwJ2nEgEypEVBZAXLS328QZLrEdDKcgi0NufEnyoow/9qt1Vqy3j9Y+ocP
 JhoC3kTxuwRNcbREkSdv752omA48UcuWusyqwPDBWFydiEGuTeZ64nu83J+YdwFXV5lL TA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 3581mr6cyu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 10 Dec 2020 16:51:04 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BAGkc1Z007234;
 Thu, 10 Dec 2020 16:49:04 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 358m41wsfg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Dec 2020 16:49:04 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BAGn19j027470;
 Thu, 10 Dec 2020 16:49:01 GMT
Received: from [10.175.204.97] (/10.175.204.97)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 10 Dec 2020 08:49:00 -0800
Subject: Re: [PATCH v2 0/3] nvdimm: read-only file support
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20200916095150.755714-1-stefanha@redhat.com>
From: Liam Merwick <liam.merwick@oracle.com>
Message-ID: <fe1dca5a-a373-7634-7e11-5dee6019036e@oracle.com>
Date: Thu, 10 Dec 2020 16:48:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200916095150.755714-1-stefanha@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9830
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012100106
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9830
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999
 clxscore=1011 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012100106
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=liam.merwick@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Julio Montes <julio.montes@intel.com>,
 eric.g.ernst@gmail.com, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/09/2020 10:51, Stefan Hajnoczi wrote:
> v2:
>   * s/the the/the/ in documentation [Philippe]
>   * Assign nvdimm->unarmed earlier [Philippe]
> 
> There is currently no way to back an NVDIMM with a read-only file so it can be
> safely shared between untrusted guests.
> 
> Introduce an -object memory-backend-file,readonly=on|off option.
> 
> Julio Montes sent an earlier patch here:
> https://patchew.org/QEMU/20190708211936.8037-1-julio.montes@intel.com/
> 
> Eric Ernst requested this feature again for Kata Containers so I gave it a try.
> 
> Stefan Hajnoczi (3):
>    memory: add readonly support to memory_region_init_ram_from_file()
>    hostmem-file: add readonly=on|off option
>    nvdimm: honor -object memory-backend-file,readonly=on option
> 


Reviewed-by: Liam Merwick <liam.merwick@oracle.com>
Tested-by: Liam Merwick <liam.merwick@oracle.com>

(I just quickly modified kata-runtime to unconditionally pass 
readonly=on and verified that the root filesystem couldn't be remounted 
as rw)

Is this a candidate for 6.0?

Regards,
Liam


>   docs/nvdimm.txt           |  8 +++++++-
>   include/exec/memory.h     |  2 ++
>   include/exec/ram_addr.h   |  5 +++--
>   include/qemu/mmap-alloc.h |  2 ++
>   backends/hostmem-file.c   | 26 +++++++++++++++++++++++++-
>   exec.c                    | 18 +++++++++++-------
>   hw/mem/nvdimm.c           |  4 ++++
>   softmmu/memory.c          |  7 +++++--
>   util/mmap-alloc.c         | 10 ++++++----
>   util/oslib-posix.c        |  2 +-
>   qemu-options.hx           |  5 ++++-
>   11 files changed, 70 insertions(+), 19 deletions(-)
> 



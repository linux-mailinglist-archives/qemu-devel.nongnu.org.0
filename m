Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 692622EC150
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 17:38:54 +0100 (CET)
Received: from localhost ([::1]:59290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxBpl-0007nm-Ge
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 11:38:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kxBnz-0006g8-L9
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 11:37:04 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:53680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kxBnw-0001AG-9O
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 11:37:02 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 106GJ1Y4070187;
 Wed, 6 Jan 2021 16:36:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=/VQ+WQyrZl19WZrqeFvpqTiC9ndstNf/VINDNbQ4wa0=;
 b=VARobWaa70s/UVg3H+ZwipI549oVk6nGcQHJf7E2t+ZCHACmhiJrhOs+SdtRjXNOaB8M
 GDxsJVa8aguBQpqc1oFUZeIiq1UxtzhcQ7lWQDskoo2a+EQz0R0WWg82hQkzv0WclFBU
 OkB3sXta7pwjuCcFFI8Ui7H2yTBDnRDwX0wS23RgJWylpj3x0eKBoSpZHi0rl+WlvHxY
 ey2qrek1lgH7FCEUT7vknI79OdeJJOG+hWcpJ69uq/eQw20XNnLiIvoaQnRVIG3Q8NjK
 NVS2FGre8+h9QGcWuMXa9GWCYcyI1Dhopy1O2ks6Am6ybi5U+YeLlCfjsES3QQuokfo9 XA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 35wcuxs54g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 06 Jan 2021 16:36:54 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 106GKTVL088234;
 Wed, 6 Jan 2021 16:36:53 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 35v4rcvuva-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Jan 2021 16:36:53 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 106GaqNo020586;
 Wed, 6 Jan 2021 16:36:52 GMT
Received: from [10.39.251.70] (/10.39.251.70)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 06 Jan 2021 08:36:52 -0800
Subject: Re: [PATCH V2 05/22] vl: memfd-alloc option
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <1609861330-129855-1-git-send-email-steven.sistare@oracle.com>
 <1609861330-129855-6-git-send-email-steven.sistare@oracle.com>
 <20210105162708.GH724458@redhat.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <d6c1b91e-9c49-3356-554d-39da53a11e16@oracle.com>
Date: Wed, 6 Jan 2021 11:36:51 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210105162708.GH724458@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101060099
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0
 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 adultscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101060099
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=steven.sistare@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.249, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/5/2021 11:27 AM, Daniel P. Berrangé wrote:
> On Tue, Jan 05, 2021 at 07:41:53AM -0800, Steve Sistare wrote:
>> Allocate anonymous memory using memfd_create if the memfd-alloc option is
>> set.
>>
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>> ---
>>  exec.c                  | 38 ++++++++++++++++++++++++++++++--------
>>  include/sysemu/sysemu.h |  1 +
>>  qemu-options.hx         | 11 +++++++++++
>>  softmmu/vl.c            |  4 ++++
>>  trace-events            |  1 +
>>  5 files changed, 47 insertions(+), 8 deletions(-)
> 
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index 708583b..455b43b7 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -4094,6 +4094,17 @@ SRST
>>      an unmigratable state.
>>  ERST
>>  
>> +#ifdef __linux__
>> +DEF("memfd-alloc", 0,  QEMU_OPTION_memfd_alloc, \
>> +    "-memfd-alloc         allocate anonymous memory using memfd_create\n",
>> +    QEMU_ARCH_ALL)
>> +#endif
>> +
>> +SRST
>> +``-memfd-alloc``
>> +    Allocate anonymous memory using memfd_create (Linux only).
>> +ERST
> 
> Do we really need a new arg for this ? It is already possible to request
> use of memfd for the guest RAM using
> 
>   -object memory-backend-memfd,id=ram-node0,size=NNNN
> 
> this memory backend object framework was intended to remove the need to
> add new ad-hoc CLI args for controlling memory allocation.

Yes, I considered that, but there are other memory regions that cannot be controlled
by the command line but which must be preserved, such as vram, bios, and rom.  If vram
is not preserved, parts of the screen will be blank until the user performs some action
which refreshes the display.  bios and rom should be preserved rather than re-recreated
with potentially different contents from the firmware images in the updated qemu package.

However, your comment reminds me that I must add a few lines of code to preserve the 
memory-backend-memfd.

- Steve


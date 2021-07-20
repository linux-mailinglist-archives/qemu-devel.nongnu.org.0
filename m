Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A25C43CFAD3
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 15:38:56 +0200 (CEST)
Received: from localhost ([::1]:36642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5pxX-0001Oh-6w
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 09:38:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1m5pwA-0008P9-LE
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:37:30 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:52078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1m5pw8-0003Eo-UL
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:37:30 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16KDYPS4018504; Tue, 20 Jul 2021 09:37:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=NckgDdC8/8R4fz6KarAaiiTyk0uwI1DGEGuSCKeT0Vw=;
 b=bvx3w9iIRV4bylE7Hs6h86LcrJm7liY9p/FAGApANauV7F5+1vznZLGPwFhqCdYDJhco
 iwYGGlFiLSAFgE+h0JDMtFElPkrI9QAlognXexENj8S8DPiU7uY4uvrd7n2XuWuEBDJg
 moICOG5j0rfOEag6L3J3TpBptTyXPC8WUIaYBQvlTuSiKmXlNglN6PmVJNxDluCNm4U4
 /jJjvVIoTObRzYsQ+mbIJRxYX1mUZsMhZtU3v2o/UkW8rBolrMNGj0jNpiUabVOelF4/
 JKeRtXLmEPOvrqNxTMg+frbxdw8Nl51jtoUhU2ikI22FOx91QG7LIoPkxOJNemb+xuIf iA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39wy71gq1m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 09:37:26 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16KDYVvS018969;
 Tue, 20 Jul 2021 09:37:26 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39wy71gq0p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 09:37:26 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16KDRVgR017153;
 Tue, 20 Jul 2021 13:37:25 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03wdc.us.ibm.com with ESMTP id 39vqdu9mq1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 13:37:24 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16KDbOXL14549392
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Jul 2021 13:37:24 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A25FAE06B;
 Tue, 20 Jul 2021 13:37:24 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 538D3AE05C;
 Tue, 20 Jul 2021 13:37:24 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 20 Jul 2021 13:37:24 +0000 (GMT)
Subject: Re: [PATCH resend v2 2/5] softmmu/memory_mapping: reuse
 qemu_get_guest_simple_memory_mapping()
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210720130304.26323-1-david@redhat.com>
 <20210720130304.26323-3-david@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <d06fe923-2223-df86-ada8-aadf002a39cf@linux.ibm.com>
Date: Tue, 20 Jul 2021 09:37:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720130304.26323-3-david@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lVKID6qqL2bhUGbmdHFfXPS9d03BYkeW
X-Proofpoint-ORIG-GUID: oE8n7tp3nCBGhSeuQ4HKd0okaANER0_j
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-20_07:2021-07-19,
 2021-07-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 suspectscore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 malwarescore=0 adultscore=0 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2107200087
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 7/20/21 9:03 AM, David Hildenbrand wrote:
> Let's reuse qemu_get_guest_simple_memory_mapping(), which does exactly
> what we want.
>
> Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Claudio Fontana <cfontana@suse.de>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: "Alex Bennée" <alex.bennee@linaro.org>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Laurent Vivier <lvivier@redhat.com>
> Cc: Stefan Berger <stefanb@linux.ibm.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   softmmu/memory_mapping.c | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/softmmu/memory_mapping.c b/softmmu/memory_mapping.c
> index e7af276546..d63f896b30 100644
> --- a/softmmu/memory_mapping.c
> +++ b/softmmu/memory_mapping.c
> @@ -288,8 +288,6 @@ void qemu_get_guest_memory_mapping(MemoryMappingList *list,
>                                      Error **errp)
>   {
>       CPUState *cpu, *first_paging_enabled_cpu;
> -    GuestPhysBlock *block;
> -    ram_addr_t offset, length;
>   
>       first_paging_enabled_cpu = find_paging_enabled_cpu(first_cpu);
>       if (first_paging_enabled_cpu) {
> @@ -309,11 +307,7 @@ void qemu_get_guest_memory_mapping(MemoryMappingList *list,
>        * If the guest doesn't use paging, the virtual address is equal to physical
>        * address.
>        */
> -    QTAILQ_FOREACH(block, &guest_phys_blocks->head, next) {
> -        offset = block->target_start;
> -        length = block->target_end - block->target_start;
> -        create_new_memory_mapping(list, offset, offset, length);
> -    }
> +    qemu_get_guest_simple_memory_mapping(list, guest_phys_blocks);
>   }

I thought I'd find a 1:1 replacement for the above here:

void qemu_get_guest_simple_memory_mapping(MemoryMappingList *list,
                                    const GuestPhysBlockList 
*guest_phys_blocks)
{
     GuestPhysBlock *block;

     QTAILQ_FOREACH(block, &guest_phys_blocks->head, next) {
         create_new_memory_mapping(list, block->target_start, 0,
                                   block->target_end - block->target_start);
     }
}

But this is calling create_new_memory_mapping() with a different 3rd 
parameter:   0 vs. offset.


>   
>   void qemu_get_guest_simple_memory_mapping(MemoryMappingList *list,


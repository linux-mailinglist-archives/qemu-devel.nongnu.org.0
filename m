Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9315231AE93
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 01:41:06 +0100 (CET)
Received: from localhost ([::1]:59564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lB5TF-0007PC-1w
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 19:41:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1lB5Qv-0006xx-It
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 19:38:42 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:36120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1lB5Qs-0000ym-Sn
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 19:38:41 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11E0WI47142877; Sat, 13 Feb 2021 19:38:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=oBkGAt5x/H9o1q02f9dDu2m7IfRYf22RK9/RtJUW/Kk=;
 b=UrPl0crEAdPnrMoJvIU5fUWl7aOJdjp6oZ5uozV6dGSB0vP/DVlTGoRJYvqZBfANMWv6
 xFwYvKgpCzXVU+IXkRKRvEEzn0EB+lLVRAqphIdUEgrDpNzyzErbdFSUJHIxRypMhoZR
 gl8bT2mZD7tzSudA/7I1NlmZD3EpE/CeJLweBCgLsVdFdZ4ONvoHBbyccVcI44Wu/56Y
 zE/jGfsP4WSZyoaOtq7M57iwtmMauINlovAp4LknF8UMERQwCfjBHS251+cS9wEnwW2m
 F6LRxnt/zFOq19aK8ge35Ew0GEmArS+S4VbB9Vf/BvuSH/70+rGhmAiWN1fXutW3rv4f zQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36prw98k9u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 13 Feb 2021 19:38:36 -0500
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 11E0Y1nR146788;
 Sat, 13 Feb 2021 19:38:36 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36prw98k9m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 13 Feb 2021 19:38:36 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11E0RWFH011997;
 Sun, 14 Feb 2021 00:38:35 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03wdc.us.ibm.com with ESMTP id 36p6d8dguj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 14 Feb 2021 00:38:35 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11E0cZBx23003526
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 14 Feb 2021 00:38:35 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2FB8B124052;
 Sun, 14 Feb 2021 00:38:35 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A29C124054;
 Sun, 14 Feb 2021 00:38:35 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Sun, 14 Feb 2021 00:38:35 +0000 (GMT)
Subject: Re: [PATCH v1 1/5] tpm: mark correct memory region range dirty when
 clearing RAM
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210210171537.32932-1-david@redhat.com>
 <20210210171537.32932-2-david@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <c27d2ad2-7209-9d99-8311-a8907822903b@linux.ibm.com>
Date: Sat, 13 Feb 2021 19:38:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210210171537.32932-2-david@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-13_02:2021-02-12,
 2021-02-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1011
 mlxscore=0 phishscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102130221
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/21 12:15 PM, David Hildenbrand wrote:
> We might not start at the beginning of the memory region. We could also
> calculate via the difference in the host address; however,
> memory_region_set_dirty() also relies on memory_region_get_ram_addr()
> internally, so let's just use that.
>
> Fixes: ffab1be70692 ("tpm: clear RAM when "memory overwrite" requested")
> Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Claudio Fontana <cfontana@suse.de>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: "Alex Bennée" <alex.bennee@linaro.org>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Laurent Vivier <lvivier@redhat.com>
> Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   hw/tpm/tpm_ppi.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/hw/tpm/tpm_ppi.c b/hw/tpm/tpm_ppi.c
> index 72d7a3d926..e0e2d2c8e1 100644
> --- a/hw/tpm/tpm_ppi.c
> +++ b/hw/tpm/tpm_ppi.c
> @@ -30,11 +30,13 @@ void tpm_ppi_reset(TPMPPI *tpmppi)
>           guest_phys_blocks_init(&guest_phys_blocks);
>           guest_phys_blocks_append(&guest_phys_blocks);
>           QTAILQ_FOREACH(block, &guest_phys_blocks.head, next) {
> +            ram_addr_t mr_start = memory_region_get_ram_addr(block->mr);
> +
>               trace_tpm_ppi_memset(block->host_addr,
>                                    block->target_end - block->target_start);
>               memset(block->host_addr, 0,
>                      block->target_end - block->target_start);
> -            memory_region_set_dirty(block->mr, 0,
> +            memory_region_set_dirty(block->mr, block->target_start - mr_start,
>                                       block->target_end - block->target_start);
>           }
>           guest_phys_blocks_free(&guest_phys_blocks);

Acked-by: Stefan Berger <stefanb@linux.ibm.com>




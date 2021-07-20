Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F523CFA85
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 15:29:10 +0200 (CEST)
Received: from localhost ([::1]:52162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5po5-00010P-UL
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 09:29:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1m5pkY-0002kJ-HL
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:25:30 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:11388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1m5pkW-0007hd-Hl
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:25:30 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16KD3DsA070850; Tue, 20 Jul 2021 09:25:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=BijSR6keP31/m/Lyik9f0RGeKDIaukgKNFleRpEBdVo=;
 b=Z9X3g09dpTIog6B8QdmuWKc732wW7hcfIzUW8BZ486juKPnf9vhgwdmdasT5sKBNZkoD
 9bYKk27G8gN835WrCfywS9kACchKCghcqRA+ciKEfJLSGGxNaX9o6DDOXYNjkOeHUuyx
 DL2g3Qfmz6XYOBYPs4AflwQsh8RslQQad9ovLn8uv/fmH7fkSkC8qehTmSGezbhMsSns
 ZrEBZ38Ky4H3ZhnW4MvTJ1AWEXPtpdf8Wtf3h5SJlT6fGm9HQAj9Ip4UIqVpcx5SR+wc
 l5tQa1lL5yKgiuE3jM2X3RKwSDnG+/rbyGZGk6HAzZlBewozE2iAmOU+4vTWUL1Ch76C gA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39wsn92gsg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 09:25:25 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16KD3Gh1071156;
 Tue, 20 Jul 2021 09:25:25 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39wsn92grw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 09:25:25 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16KDBQiR031559;
 Tue, 20 Jul 2021 13:25:24 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02dal.us.ibm.com with ESMTP id 39vuk5171w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 13:25:24 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16KDPNtB14287356
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Jul 2021 13:25:23 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20B7FAC05B;
 Tue, 20 Jul 2021 13:25:23 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE581AC06A;
 Tue, 20 Jul 2021 13:25:22 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 20 Jul 2021 13:25:22 +0000 (GMT)
Subject: Re: [PATCH resend v2 4/5] softmmu/memory_mapping: factor out adding
 physical memory ranges
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210720130304.26323-1-david@redhat.com>
 <20210720130304.26323-5-david@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <2262b1ae-2577-37dd-111f-bc32f8567de0@linux.ibm.com>
Date: Tue, 20 Jul 2021 09:25:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720130304.26323-5-david@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: X2__TJU5MrVoDsD4mEJm1R9ayItToJUJ
X-Proofpoint-ORIG-GUID: wNX54jj1gGxCm-0aTpUCG14cxF9hnVd2
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-20_07:2021-07-19,
 2021-07-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011
 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 phishscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107200085
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
> Let's factor out adding a MemoryRegionSection to the list, to be reused in
> RamDiscardManager context next.
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
>   softmmu/memory_mapping.c | 41 ++++++++++++++++++++--------------------
>   1 file changed, 20 insertions(+), 21 deletions(-)
>
> diff --git a/softmmu/memory_mapping.c b/softmmu/memory_mapping.c
> index c149bad44a..b7e4f3f788 100644
> --- a/softmmu/memory_mapping.c
> +++ b/softmmu/memory_mapping.c
> @@ -193,29 +193,14 @@ typedef struct GuestPhysListener {
>       MemoryListener listener;
>   } GuestPhysListener;
>   
> -static void guest_phys_blocks_region_add(MemoryListener *listener,
> +static void guest_phys_block_add_section(GuestPhysListener *g,
>                                            MemoryRegionSection *section)
>   {
> -    GuestPhysListener *g;
> -    uint64_t section_size;
> -    hwaddr target_start, target_end;
> -    uint8_t *host_addr;
> -    GuestPhysBlock *predecessor;
> -
> -    /* we only care about RAM */
> -    if (!memory_region_is_ram(section->mr) ||
> -        memory_region_is_ram_device(section->mr) ||
> -        memory_region_is_nonvolatile(section->mr)) {
> -        return;
> -    }
> -
> -    g            = container_of(listener, GuestPhysListener, listener);
> -    section_size = int128_get64(section->size);
> -    target_start = section->offset_within_address_space;
> -    target_end   = target_start + section_size;
> -    host_addr    = memory_region_get_ram_ptr(section->mr) +
> -                   section->offset_within_region;
> -    predecessor  = NULL;
> +    const hwaddr target_start = section->offset_within_address_space;
> +    const hwaddr target_end = target_start + int128_get64(section->size);
> +    uint8_t *host_addr = memory_region_get_ram_ptr(section->mr) +
> +                         section->offset_within_region;
> +    GuestPhysBlock *predecessor = NULL;
>   
>       /* find continuity in guest physical address space */
>       if (!QTAILQ_EMPTY(&g->list->head)) {
> @@ -261,6 +246,20 @@ static void guest_phys_blocks_region_add(MemoryListener *listener,
>   #endif
>   }
>   
> +static void guest_phys_blocks_region_add(MemoryListener *listener,
> +                                         MemoryRegionSection *section)
> +{
> +    GuestPhysListener *g = container_of(listener, GuestPhysListener, listener);
> +
> +    /* we only care about RAM */
> +    if (!memory_region_is_ram(section->mr) ||
> +        memory_region_is_ram_device(section->mr) ||
> +        memory_region_is_nonvolatile(section->mr)) {
> +        return;
> +    }
> +    guest_phys_block_add_section(g, section);
> +}
> +
>   void guest_phys_blocks_append(GuestPhysBlockList *list)
>   {
>       GuestPhysListener g = { 0 };


Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>




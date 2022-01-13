Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D74C48DBA6
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 17:23:47 +0100 (CET)
Received: from localhost ([::1]:50820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n82t8-00008d-PQ
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 11:23:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1n82qv-0006ev-2z
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 11:21:29 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:54916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1n82qt-00080u-5r
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 11:21:28 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20DFwWAb030559; 
 Thu, 13 Jan 2022 16:21:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=rOeRP1+aXoUZd89CbZXr1Nto4heVX97fbYgOcnhUX+c=;
 b=HIfQgVBSJgaF5MxxeRwMm5UD6Xedd1LsbhOCZkMWybOITdI99IEDt80pFCh0YjELui6H
 7k0/h0ra9mheIWN43nc+X4BhbUTUP7pqGAjYNhHmifZqnvS6S13S3h7EyqlJ/fzfbBP7
 t+R4Je7CXJWSSHYoGHXrEvpRcKLntGj/Ipdm/10w6xb9fknvEozaJtk6/9hR/gjcEpLs
 SjOgLPvHuPcgR5TSSEMp8JTCDw5smjan+7qiZ49X/77agKf8GKrBuW5rNdfh16k9Iwv1
 fWJbEukHV/E2cyHgN2sSsHD+WN+WiudOIQPVETeV+N6ezQA6lNjAaUcQArS3WGjWT48Z PA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3djq6sghu2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jan 2022 16:21:22 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20DGGWU9014258;
 Thu, 13 Jan 2022 16:21:21 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3djq6sghte-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jan 2022 16:21:21 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20DGHqZF028504;
 Thu, 13 Jan 2022 16:21:20 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02wdc.us.ibm.com with ESMTP id 3df28bw4ve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jan 2022 16:21:20 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20DGLJtU13762890
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Jan 2022 16:21:19 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 021C22806F;
 Thu, 13 Jan 2022 16:21:19 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A5F192805C;
 Thu, 13 Jan 2022 16:21:18 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 13 Jan 2022 16:21:18 +0000 (GMT)
Message-ID: <123a075e-ee83-76ab-6e90-a253bd01e53e@linux.ibm.com>
Date: Thu, 13 Jan 2022 11:21:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 2/2] hw/vfio/common: Silence ram device offset alignment
 error traces
Content-Language: en-US
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 stefanb@linux.vnet.ibm.com, qemu-devel@nongnu.org,
 alex.williamson@redhat.com
References: <20220113103757.2801389-1-eric.auger@redhat.com>
 <20220113103757.2801389-3-eric.auger@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20220113103757.2801389-3-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: gtYJrcMqfhRAr4dMqrYm7IvQsilEDaiw
X-Proofpoint-GUID: 09zm0eEl7afLPF929dD2tNcSZYQ42VMm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-13_08,2022-01-13_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201130099
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: cohuck@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 1/13/22 05:37, Eric Auger wrote:
> Failing to DMA MAP a ram_device should not cause an error message.
> This is currently happening with the TPM CRB command region and
> this is causing confusion.
>
> We may want to keep the trace for debug purpose though.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Tested-by: Stefan Berger <stefanb@linux.ibm.com>


>
> ---
>
> I am not totally clear why we do not fail on the non RAM device case
> though.
> ---
>   hw/vfio/common.c     | 15 ++++++++++++++-
>   hw/vfio/trace-events |  1 +
>   2 files changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 080046e3f5..9caa560b07 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -884,7 +884,20 @@ static void vfio_listener_region_add(MemoryListener *listener,
>       if (unlikely((section->offset_within_address_space &
>                     ~qemu_real_host_page_mask) !=
>                    (section->offset_within_region & ~qemu_real_host_page_mask))) {
> -        error_report("%s received unaligned region", __func__);
> +        if (memory_region_is_ram_device(section->mr)) { /* just debug purpose */
> +            trace_vfio_listener_region_add_bad_offset_alignment(
> +                memory_region_name(section->mr),
> +                section->offset_within_address_space,
> +                section->offset_within_region, qemu_real_host_page_size);
> +        } else { /* error case we don't want to be fatal */
> +            error_report("%s received unaligned region %s iova=0x%"PRIx64
> +                         " offset_within_region=0x%"PRIx64
> +                         " qemu_real_host_page_mask=0x%"PRIx64,
> +                         __func__, memory_region_name(section->mr),
> +                         section->offset_within_address_space,
> +                         section->offset_within_region,
> +                         qemu_real_host_page_mask);
> +        }
>           return;
>       }
>
> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> index 0ef1b5f4a6..ccd9d7610d 100644
> --- a/hw/vfio/trace-events
> +++ b/hw/vfio/trace-events
> @@ -100,6 +100,7 @@ vfio_listener_region_add_skip(uint64_t start, uint64_t end) "SKIPPING region_add
>   vfio_spapr_group_attach(int groupfd, int tablefd) "Attached groupfd %d to liobn fd %d"
>   vfio_listener_region_add_iommu(uint64_t start, uint64_t end) "region_add [iommu] 0x%"PRIx64" - 0x%"PRIx64
>   vfio_listener_region_add_ram(uint64_t iova_start, uint64_t iova_end, void *vaddr) "region_add [ram] 0x%"PRIx64" - 0x%"PRIx64" [%p]"
> +vfio_listener_region_add_bad_offset_alignment(const char *name, uint64_t iova, uint64_t offset_within_region, uint64_t page_size) "Region \"%s\" @0x%"PRIx64", offset_within_region=0x%"PRIx64", qemu_real_host_page_mask=0x%"PRIx64 " cannot be mapped for DMA"
>   vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova, uint64_t size, uint64_t page_size) "Region \"%s\" 0x%"PRIx64" size=0x%"PRIx64" is not aligned to 0x%"PRIx64" and cannot be mapped for DMA"
>   vfio_listener_region_del_skip(uint64_t start, uint64_t end) "SKIPPING region_del 0x%"PRIx64" - 0x%"PRIx64
>   vfio_listener_region_del(uint64_t start, uint64_t end) "region_del 0x%"PRIx64" - 0x%"PRIx64


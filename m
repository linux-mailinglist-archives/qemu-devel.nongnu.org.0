Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A98705AF5AF
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 22:19:55 +0200 (CEST)
Received: from localhost ([::1]:60374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVf34-0002YH-BC
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 16:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1oVez7-0000Pr-HN
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 16:15:56 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:27072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1oVez5-0004RZ-Aq
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 16:15:49 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 286In0pm001873;
 Tue, 6 Sep 2022 20:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=IQ08GFoM2eqEE553rmWHGerD4jyrUThe9Fnu1dux4JU=;
 b=elLzitOmrdtGOwGXdjV44DMpUKDX7qcXwZnOucQrrunE/ZE5HIEM9aXX1L8fUW5gdJvl
 619GTCG2g13t19NdB7maTr3EZx9z4zxjHIzGUEeNjPjf10KtUBiaHBQ5iX8YF9LFXmF+
 V0g6SmBXXBzb3Mry2fSZLd3o1iAwWeMP38G6FzwlcLLM5ocRj+WFywRn7QtgzUayxQZM
 mTIP9SBzjlQQmFRtAdB5VYmhyYMZxGXORzDyLdttZwPEBUADik3qx03dC4tH5XqLpgAB
 aT/RJ3gyPZHCkzY0GOGViRcgMg3qn1DiMaKBdnt3O2/JLyEQ45XL3gl3DYJJHcg5nCab kw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jebtha7dx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Sep 2022 20:11:42 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 286Jkjjc025835;
 Tue, 6 Sep 2022 20:11:42 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jebtha7dj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Sep 2022 20:11:42 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 286K5bU2028333;
 Tue, 6 Sep 2022 20:11:40 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04wdc.us.ibm.com with ESMTP id 3jbxj9nmam-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Sep 2022 20:11:40 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 286KBdi633686028
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Sep 2022 20:11:39 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 708C47805C;
 Tue,  6 Sep 2022 20:21:24 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 05E0E7805F;
 Tue,  6 Sep 2022 20:21:23 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  6 Sep 2022 20:21:23 +0000 (GMT)
Message-ID: <9b1510ce-bac0-e3f7-8efa-db5ce0452ccb@linux.ibm.com>
Date: Tue, 6 Sep 2022 16:11:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/2] dump: fix kdump to work over non-aligned blocks
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qiaonuohan@cn.fujitsu.com,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 David Hildenbrand <david@redhat.com>
References: <20220905125741.95516-1-marcandre.lureau@redhat.com>
 <20220905125741.95516-3-marcandre.lureau@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20220905125741.95516-3-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JOEVUaAFZrS8fkXG-DpAjaus83vIXMV9
X-Proofpoint-GUID: NxgIbfpi1b39wXLck1dB7bWFbBFQh2Rw
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-06_09,2022-09-06_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 spamscore=0
 mlxscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2209060093
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.752,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/5/22 08:57, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Rewrite get_next_page() to work over non-aligned blocks. When it
> encounters non aligned addresses, it will try to fill a page provided by
> the caller.
> 
> This solves a kdump crash with "tpm-crb-cmd" RAM memory region,
> qemu-kvm: ../dump/dump.c:1162: _Bool get_next_page(GuestPhysBlock **,
> uint64_t *, uint8_t **, DumpState *): Assertion `(block->target_start &
> ~target_page_mask) == 0' failed.
> 
> because:
> guest_phys_block_add_section: target_start=00000000fed40080 target_end=00000000fed41000: added (count: 4)
> 
> Fixes:
> https://bugzilla.redhat.com/show_bug.cgi?id=2120480
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   dump/dump.c | 79 +++++++++++++++++++++++++++++++++++++----------------
>   1 file changed, 56 insertions(+), 23 deletions(-)
> 
> diff --git a/dump/dump.c b/dump/dump.c
> index f465830371..500357bafe 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -1094,50 +1094,81 @@ static uint64_t dump_pfn_to_paddr(DumpState *s, uint64_t pfn)
>   }
> 
>   /*
> - * exam every page and return the page frame number and the address of the page.
> - * bufptr can be NULL. note: the blocks here is supposed to reflect guest-phys
> - * blocks, so block->target_start and block->target_end should be interal
> - * multiples of the target page size.
> + * Return the page frame number and the page content in *bufptr. bufptr can be
> + * NULL. If not NULL, *bufptr must contains a target page size of pre-allocated

contains->contain

Otherwise I don't have much to say about it...


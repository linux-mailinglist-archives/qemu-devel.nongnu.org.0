Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EC22C8F99
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 22:04:30 +0100 (CET)
Received: from localhost ([::1]:57370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjqLU-0001my-M9
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 16:04:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1kjqKO-0001Dl-Ka; Mon, 30 Nov 2020 16:03:20 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:57876
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1kjqKM-0005nK-S9; Mon, 30 Nov 2020 16:03:20 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AUKXvXf160716; Mon, 30 Nov 2020 16:02:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=OEhi2au9UWj48l82T4RiagljofJBK/g+glB8dbN3w7Y=;
 b=M+aMcZajLCJZ3/EpZKEI6PoR3I7OGj8bdenXMC9Z97NJJOLrqjvPGNnxlbD+7z7QbHm1
 Ut0LkrHOLXwfiZQ2mBnQKr4TVi0MH0TPObTXpB2eQxak4x/UjL73eoff8hUE1t6iXs4R
 Qqn69zvlgZsDc0nL3/XVdDajbIyJhjtX4YCX9OLgeG4BRxpfX/onIFBy+noIoket7Ija
 LaMYJ984OTDdHGb2xxalgfT0EX8hJlHuLoZI4kYmijEYC3Fp9dpB2QKF0hFRxiDHNVUU
 mKxoB4LsUYU2MMIgvw135J09FF2KB/MAwxYWX+hbHxbuyaiNkXo69zdDzYEsteVh/JSL NQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3557b1hpq6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Nov 2020 16:02:09 -0500
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AUKumcj062202;
 Mon, 30 Nov 2020 16:02:09 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3557b1hppj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Nov 2020 16:02:09 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AUKgegn002685;
 Mon, 30 Nov 2020 21:02:08 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04dal.us.ibm.com with ESMTP id 353e68yb5y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Nov 2020 21:02:08 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AUL27SU27328786
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Nov 2020 21:02:07 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A2C6AE05F;
 Mon, 30 Nov 2020 21:02:07 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B771AE075;
 Mon, 30 Nov 2020 21:02:07 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 30 Nov 2020 21:02:07 +0000 (GMT)
Subject: Re: [PATCH v2 07/12] tpm: put some tpm devices into the correct
 category
To: Gan Qixin <ganqixin@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20201130083630.2520597-1-ganqixin@huawei.com>
 <20201130083630.2520597-8-ganqixin@huawei.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <aed0f467-623b-ef99-8deb-bfe25c0100fa@linux.ibm.com>
Date: Mon, 30 Nov 2020 16:02:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201130083630.2520597-8-ganqixin@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-30_11:2020-11-30,
 2020-11-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 bulkscore=0 adultscore=0 clxscore=1011 lowpriorityscore=0 mlxlogscore=999
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011300132
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kuhn.chenqun@huawei.com, thuth@redhat.com, zhang.zhanghailiang@huawei.com,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/30/20 3:36 AM, Gan Qixin wrote:
> Some tpm devices have no category, put them into the correct category.
>
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> ---
> Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>
> ---
>   hw/tpm/tpm_tis_isa.c    | 1 +
>   hw/tpm/tpm_tis_sysbus.c | 1 +
>   2 files changed, 2 insertions(+)
>
> diff --git a/hw/tpm/tpm_tis_isa.c b/hw/tpm/tpm_tis_isa.c
> index 6fd876eebf..10d8a14f19 100644
> --- a/hw/tpm/tpm_tis_isa.c
> +++ b/hw/tpm/tpm_tis_isa.c
> @@ -150,6 +150,7 @@ static void tpm_tis_isa_class_init(ObjectClass *klass, void *data)
>       dc->reset = tpm_tis_isa_reset;
>       tc->request_completed = tpm_tis_isa_request_completed;
>       tc->get_version = tpm_tis_isa_get_tpm_version;
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>   }
>
>   static const TypeInfo tpm_tis_isa_info = {
> diff --git a/hw/tpm/tpm_tis_sysbus.c b/hw/tpm/tpm_tis_sysbus.c
> index 2c32aa7099..45e63efd63 100644
> --- a/hw/tpm/tpm_tis_sysbus.c
> +++ b/hw/tpm/tpm_tis_sysbus.c
> @@ -139,6 +139,7 @@ static void tpm_tis_sysbus_class_init(ObjectClass *klass, void *data)
>       dc->reset = tpm_tis_sysbus_reset;
>       tc->request_completed = tpm_tis_sysbus_request_completed;
>       tc->get_version = tpm_tis_sysbus_get_tpm_version;
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>   }
>
>   static const TypeInfo tpm_tis_sysbus_info = {

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>




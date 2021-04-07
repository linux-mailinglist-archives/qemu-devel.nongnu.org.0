Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B67357501
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 21:35:06 +0200 (CEST)
Received: from localhost ([::1]:40994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUDxB-0002OP-Hq
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 15:35:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <klaus@linux.vnet.ibm.com>)
 id 1lUDuG-0001mC-UW; Wed, 07 Apr 2021 15:32:05 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:28130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <klaus@linux.vnet.ibm.com>)
 id 1lUDuF-0007Oy-04; Wed, 07 Apr 2021 15:32:04 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 137J3mKR092756; Wed, 7 Apr 2021 15:31:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=zNTIttk2xGHCuePy7WiKHk6JiF9M6JQIQQyRF4Al1Gk=;
 b=ngith+4/QZugVv6/dOND3TS6vM07ANsJhStl5MIsusqQHNRpSiJHFp1peDWZB2K7KXUu
 Scjp0C5l4418lDzwXH84ep9pRroMN+pFddslwZ7aO6hFlWkxQg/pKmZJ7BvJMDyNq9eo
 IeHgzt7rFKC9vNnAfASsqNuvZXGRSriCA4oJY5N0hfMPjUTyB58g7dANtuWiq6Y0039z
 iXlYqZAaq9IEDyME5UkGQUY5tWgJADj9eryEUaTb/TgZzR0NKLNuAl6SN7F0Ere8Edpq
 0QhA62Bu4kLUb+JJHCW/eRpDmp1wsbZyMyEoWbTeyMow8nDKOnInWHq2Zwn5a4TpL5zr 3Q== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37rvpgkh9x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 15:31:49 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 137JQZc3018163;
 Wed, 7 Apr 2021 19:31:49 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03dal.us.ibm.com with ESMTP id 37rvc2hrg7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 19:31:49 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 137JVmRD19595614
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Apr 2021 19:31:48 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DCFE27805E;
 Wed,  7 Apr 2021 19:31:47 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F4F77805F;
 Wed,  7 Apr 2021 19:31:46 +0000 (GMT)
Received: from [9.80.221.20] (unknown [9.80.221.20])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  7 Apr 2021 19:31:45 +0000 (GMT)
Subject: Re: [PATCH 06/24] hw: Model ASPEED's Hash and Crypto Engine
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210407171637.777743-1-clg@kaod.org>
 <20210407171637.777743-7-clg@kaod.org>
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Message-ID: <1058cef1-a1b2-e544-60ec-d3d0164442a4@linux.vnet.ibm.com>
Date: Wed, 7 Apr 2021 16:31:44 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210407171637.777743-7-clg@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: VKF0YUPQvyVtvrmr9sMSCTN8veKo8vhe
X-Proofpoint-GUID: VKF0YUPQvyVtvrmr9sMSCTN8veKo8vhe
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-07_10:2021-04-07,
 2021-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 malwarescore=0
 suspectscore=0 bulkscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104070130
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=klaus@linux.vnet.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/7/2021 2:16 PM, Cédric Le Goater wrote:
> From: Joel Stanley <joel@jms.id.au>
> 
> The HACE (Hash and Crypto Engine) is a device that offloads MD5, SHA1,
> SHA2, RSA and other cryptographic algorithms.
> 
> This initial model implements a subset of the device's functionality;
> currently only direct access (non-scatter gather) hashing.

> +
> +static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
> +                              unsigned int size)
> +{
> +    AspeedHACEState *s = ASPEED_HACE(opaque);
> +    AspeedHACEClass *ahc = ASPEED_HACE_GET_CLASS(s);
> +
> +    addr >>= 2;
> +
> +    if (addr >= ASPEED_HACE_NR_REGS) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Out-of-bounds write at offset 0x%" HWADDR_PRIx "\n",
> +                      __func__, addr << 2);
> +        return;
> +    }
> +
> +    switch (addr) {
> +    case R_STATUS:
> +        if (data & HASH_IRQ) {
> +            data &= ~HASH_IRQ;
> +
> +            if (s->regs[addr] & HASH_IRQ) {
> +                qemu_irq_lower(s->irq);
> +            }
> +        }
> +        break;
> +    case R_HASH_SRC:
> +        data &= ahc->src_mask;
> +        break;
> +    case R_HASH_DEST:
> +        data &= ahc->dest_mask;
> +        break;
> +    case R_HASH_SRC_LEN:
> +        data &= 0x0FFFFFFF;
> +        break;
> +    case R_HASH_CMD: {
> +        int algo = -1;
> +        if ((data & HASH_HMAC_MASK)) {
> +            qemu_log_mask(LOG_UNIMP,
> +                          "%s: HMAC engine command mode %"PRIx64" not implemented",
> +                          __func__, (data & HASH_HMAC_MASK) >> 8);
> +        }
> +        if (data & HASH_SG_EN) {
> +            qemu_log_mask(LOG_UNIMP,
> +                          "%s: Hash scatter gather mode not implemented",
> +                          __func__);
> +        }
> +        if (data & BIT(1)) {
> +            qemu_log_mask(LOG_UNIMP,
> +                          "%s: Cascaded mode not implemented",
> +                          __func__);
> +       if the guest is requesting a command that is not implemented, wouldn't it be safer to bail out
and return instead of just logging and continue?


  -Klaus

-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD3A52B375
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 09:38:00 +0200 (CEST)
Received: from localhost ([::1]:34772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrEFr-0005SU-8p
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 03:37:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rashmica@linux.ibm.com>)
 id 1nrE9Z-0003Sy-5d; Wed, 18 May 2022 03:31:29 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rashmica@linux.ibm.com>)
 id 1nrE9X-00076d-El; Wed, 18 May 2022 03:31:28 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24I7FOBk006079;
 Wed, 18 May 2022 07:31:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=nG4yATrqnYqilm8hyRGpGI8AKiQ9P9la4p2SFy4Q9Go=;
 b=iSbI9j9F6UB7y0gKDYFxhEi8WajN0CtD2jRoYMMeUQln869dOFJ9VFxUvPXGGx+BwOCv
 bfhM9G5Hrj8jFLDmGBvylny1IVSZ9twqPQIr3Z5Fv8cJE/GUrgOzZYI4d1L+1eucFKYP
 EQe2M+yPWN9/hBsHvDV+kcxq9qU3ShZQ+by1RGlBnP5dQFJJOBUI+r6RYhm/Au6H94MX
 T2S6nwicr+/7QhTJ83RiX5p5vZutALOhIgEpwD5nNOm89LFt6uVZG47rCHYyjpgZ7N/E
 kn4pJH9U4eZHIxyJ/T36jIJ3Eqyf3k76wgxIpOImAk0RejFa7QHcnGs2MuZxwfE74q/J 1w== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g4v8j89pb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 May 2022 07:31:18 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24I7IMZr003113;
 Wed, 18 May 2022 07:31:17 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma05fra.de.ibm.com with ESMTP id 3g4j3ggg54-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 May 2022 07:31:16 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24I7VElY42140014
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 May 2022 07:31:14 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8439EA4060;
 Wed, 18 May 2022 07:31:14 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2BAC3A4054;
 Wed, 18 May 2022 07:31:14 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 18 May 2022 07:31:14 +0000 (GMT)
Received: from [9.43.194.236] (unknown [9.43.194.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8830C60306;
 Wed, 18 May 2022 17:31:08 +1000 (AEST)
Message-ID: <09776fe6d855338ace01e57dc780c107b8f635bf.camel@linux.ibm.com>
Subject: Re: [PATCH] hw/gpio/aspeed_gpio: Fix QOM pin property
From: Rashmica Gupta <rashmica@linux.ibm.com>
To: Peter Delevoryas <pdel@fb.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, clg@kaod.org, andrew@aj.id.au
Date: Wed, 18 May 2022 17:31:05 +1000
In-Reply-To: <20220502080827.244815-1-pdel@fb.com>
References: <20220502080827.244815-1-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: R27sTud5ZmKu7pKE7M85kK8QJJWHIVzE
X-Proofpoint-ORIG-GUID: R27sTud5ZmKu7pKE7M85kK8QJJWHIVzE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-18_02,2022-05-17_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 priorityscore=1501 spamscore=0 adultscore=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 mlxlogscore=640 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2205180036
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=rashmica@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, 2022-05-02 at 01:08 -0700, Peter Delevoryas wrote:
> I was setting gpioV4-7 to "1110" using the QOM pin property handler
> and
> noticed that lowering gpioV7 was inadvertently lowering gpioV4-6 too.
> 
>     (qemu) qom-set /machine/soc/gpio gpioV4 true
>     (qemu) qom-set /machine/soc/gpio gpioV5 true
>     (qemu) qom-set /machine/soc/gpio gpioV6 true
>     (qemu) qom-get /machine/soc/gpio gpioV4
>     true
>     (qemu) qom-set /machine/soc/gpio gpioV7 false
>     (qemu) qom-get /machine/soc/gpio gpioV4
>     false
> 
> An expression in aspeed_gpio_set_pin_level was using a logical NOT
> operator instead of a bitwise NOT operator:
> 
>     value &= !pin_mask;
> 
> The original author probably intended to make a bitwise NOT
> expression
> "~", but mistakenly used a logical NOT operator "!" instead. Some
> programming languages like Rust use "!" for both purposes.
> 
> Fixes: 4b7f956862dc ("hw/gpio: Add basic Aspeed GPIO model for
> AST2400 and
> AST2500")
> Signed-off-by: Peter Delevoryas <pdel@fb.com>


Oops! Thanks for catching this. The tests look good.




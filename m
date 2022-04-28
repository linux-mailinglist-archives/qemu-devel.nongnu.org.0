Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A10FC512DD5
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 10:10:55 +0200 (CEST)
Received: from localhost ([::1]:38844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njzEi-0005U1-G9
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 04:10:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1njz8S-0003Vb-9l; Thu, 28 Apr 2022 04:04:31 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:30662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1njz8Q-0007nD-4t; Thu, 28 Apr 2022 04:04:23 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23S5DkRk002677;
 Thu, 28 Apr 2022 08:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=DE8ekAX0/fxuAwgFq88lV6pobnenIp7njsmUzan0kZg=;
 b=BHgy1JoojjUE7xnWdwJZUW+AaCZm95kCZszyDszPuIF8arskUyPbUBn/32/Urxjzh/Z3
 chbXhX05H4ZF5gFDR0CrkSRV8Ec25b1g1tczhTTrZhMELYs1EdgPjjdR0GqUMj91JvSR
 o/scwd31fpf9nI3vLnJ57vNuk+GDrSpiH0lK5EMQLrvDU1GOqkgsJbKskWhfMoPbMjXI
 fEGmrb2yTUAgicwd6LwFXcxabpsxUAZkQVXovSYTiZ2DUJSaEnoee+8cCvFnPpbb53I2
 fFzMrfcnNvUxyYWHjaBO9yDGZF4lXbis6x/+K7wDTcGMj6MH4RYpkbfTRj1tSzUkSotO +g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fqmk7u1tg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Apr 2022 08:04:12 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23S6QjnE001461;
 Thu, 28 Apr 2022 08:04:12 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fqmk7u1sw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Apr 2022 08:04:11 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23S7wb1x017561;
 Thu, 28 Apr 2022 08:04:10 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma05fra.de.ibm.com with ESMTP id 3fm938wn3q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Apr 2022 08:04:10 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23S847uw36307434
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Apr 2022 08:04:07 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C61C0A4051;
 Thu, 28 Apr 2022 08:04:07 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 799F9A4053;
 Thu, 28 Apr 2022 08:04:07 +0000 (GMT)
Received: from [9.145.47.141] (unknown [9.145.47.141])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 28 Apr 2022 08:04:07 +0000 (GMT)
Message-ID: <250ad629-3d90-0b39-db22-a844bb0437f8@linux.ibm.com>
Date: Thu, 28 Apr 2022 10:04:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] ppc/xive: Save/restore state of the External interrupt
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, danielhb413@gmail.com,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
References: <20220426101125.297064-1-fbarrat@linux.ibm.com>
 <c3277f60-a64e-44a8-fb13-529bdb12cc41@kaod.org>
 <572f1365-7767-41cf-b8b2-3f17d1eaab7e@linux.ibm.com>
 <a033e970-a226-3d13-3c55-b443e43a1d06@kaod.org>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <a033e970-a226-3d13-3c55-b443e43a1d06@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zvidzgRXwdwo5H_cmQd0VAGA0a_zXVKY
X-Proofpoint-ORIG-GUID: CBmfVuyK8s6ZNgT8J_m_0oZvXSyGNj_P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-27_04,2022-04-27_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2204280049
Received-SPF: pass client-ip=148.163.158.5; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: npiggin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 26/04/2022 17:24, Cédric Le Goater wrote:
> 
> I would be interested to know if you can start an emulated QEMU PowerNV
> system (2cpus) with a KVM guest (1 vcpu) and sustain some network load
> host<->guest with a ping -f for instance.


We're not there yet unfortunately. It runs for a while until the powernv 
host hard lockups. Something else to debug...

   Fred



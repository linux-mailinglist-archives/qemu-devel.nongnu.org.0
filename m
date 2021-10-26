Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 623B243BA06
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 20:57:19 +0200 (CEST)
Received: from localhost ([::1]:58190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfRdO-0000vB-GA
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 14:57:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pc@us.ibm.com>)
 id 1mfRSS-00040h-Lc; Tue, 26 Oct 2021 14:46:04 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:33156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pc@us.ibm.com>)
 id 1mfRSO-00064W-QK; Tue, 26 Oct 2021 14:45:59 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19QIK5vd022407; 
 Tue, 26 Oct 2021 18:45:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=sh868/WrOYO5HvTdxMOj6j4JTUqdsM7/rcGJVsqoyyo=;
 b=OxHo48EgUeUEYbnBW+Gf/ySQOO6+81dhhqvVMauK8SuubtNXwD9+fD9tj2VEnBKugcMS
 tReZrBSRcKdTVXQyZibSurp1M28+EEk9ZOgDai4jMOnrMHLenRiiix+30vATU2sv/zkQ
 5GBwN2joiog3ysopcqJcXlsKS4I1RPPCKw/FYTMVxdMFRfjyMoQUQLbATdPlHewq3lb/
 v/4t2Bu95LV6YoEDRdj4x0xRuWuR9MLUnu2q0N8k3daV4re+WRJ7dHLviRm65vlAoVlI
 dsATmTorLtWi7Fjr1BNBE6JB7LMsKjE7F/VNS/y5OanuMcVXlOl++wbE2vuyVsWYKr9Z 2w== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bx4ygrwby-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Oct 2021 18:45:32 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19QIcrhH026857;
 Tue, 26 Oct 2021 18:45:31 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03wdc.us.ibm.com with ESMTP id 3bx4f02jb5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Oct 2021 18:45:31 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19QIjUX836831576
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Oct 2021 18:45:30 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 50D82AE05C;
 Tue, 26 Oct 2021 18:45:30 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EDD7BAE060;
 Tue, 26 Oct 2021 18:45:28 +0000 (GMT)
Received: from li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com (unknown
 [9.77.153.132]) by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 26 Oct 2021 18:45:28 +0000 (GMT)
Date: Tue, 26 Oct 2021 13:45:26 -0500
From: "Paul A. Clarke" <pc@us.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 16/33] target/ppc: Implement Vector Insert Word from GPR
 using Immediate insns
Message-ID: <20211026184526.GB645383@li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com>
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-17-matheus.ferst@eldorado.org.br>
 <4a9f95b2-3f9e-f835-0315-7632a5e6996a@linaro.org>
 <2f6cca6e-6a3e-7341-7d92-4b1b4708ee1e@eldorado.org.br>
 <f41b24cd-9ce5-4836-9c77-ea4edaacb021@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f41b24cd-9ce5-4836-9c77-ea4edaacb021@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VTvIpMbzjZh4THvA0Qjdm3Jjq7ZD8tyl
X-Proofpoint-ORIG-GUID: VTvIpMbzjZh4THvA0Qjdm3Jjq7ZD8tyl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-26_05,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 adultscore=0 clxscore=1011
 mlxlogscore=906 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2110260103
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pc@us.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lucas.castro@eldorado.org.br, qemu-devel@nongnu.org, groug@kaod.org,
 luis.pires@eldorado.org.br, qemu-ppc@nongnu.org,
 "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 26, 2021 at 09:58:15AM -0700, Richard Henderson wrote:
> On 10/26/21 7:33 AM, Matheus K. Ferst wrote:
> > It says that "if UIM is greater than N, the result is undefined." My
> > first read was also that the outcome is "boundedly undefined," but I
> > guess it can be understood as "the resulting value in VRT will be
> > undefined" (like when the pseudo-code uses "VRT <- 0xUUUU_..._UUUU"), in
> > which case this patch and Mambo are correct.
> 
> If the reference simulator is fine with it, I am too.

FYI, it appears that the hardware does a partial insert, per an experiment:
```
1: x/i $pc
=> 0x100006d4 <foo+4>:  vinsw   v2,r3,14
(gdb) p $v2.v4_int32
$1 = {0x1, 0x1, 0x1, 0x1}
(gdb) p $r3
$2 = 0x12345678
(gdb) nexti
(gdb) p $v2.v4_int32
$3 = {0x1234, 0x1, 0x1, 0x1}
````

> I'm just a bit disappointed with the laxness of the pseudocode -- they've
> got that 0xuuuu syntax elsewhere, but not here.

PC


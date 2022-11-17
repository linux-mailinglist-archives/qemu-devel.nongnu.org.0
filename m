Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EFE62D819
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 11:37:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovcF1-00082d-Ak; Thu, 17 Nov 2022 05:35:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vaibhav@linux.ibm.com>)
 id 1ovcEz-00080a-1y; Thu, 17 Nov 2022 05:35:29 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vaibhav@linux.ibm.com>)
 id 1ovcEx-0003j2-19; Thu, 17 Nov 2022 05:35:28 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AHAPJOt006071; Thu, 17 Nov 2022 10:35:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Mh7B/GLVJzz7ce9/KyQO6V9f7iCaTwGGJzdJENpRCHo=;
 b=PrhujNlbu+wsnTv04PUx9P4czLiqUKp/PxrqjDmSj1Li/juIZ9ZqyLiCiIdVasNgH4Z0
 VQGFHlZL/6EbPaCtKEnyaRgQQ1ymlN2bXeYwXf/o+uVaSI3bvo7KVd9o+u9zmn5qj3a2
 VGCxDiSAnA2UgVHIcQS44yGvY898TooxpM70xhoINJjXVJc3+bc67GOSl7gghOMNncFw
 mjGpC7351TZoIEba8PVQWZWhzJR55PSiAc7hJsbEwSQanrNiUYojqwCqNE9iZeJIlFI+
 1gXv8APl0AuYOKF3LcxUPagohUSP6fniugMZfeqg5kDEoL8FhCZ9/lVRgY+5UG9xzfW7 gw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kwk6j8ae2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Nov 2022 10:35:18 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AHAR2Cb010808;
 Thu, 17 Nov 2022 10:35:18 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kwk6j8abp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Nov 2022 10:35:17 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AHAKdb4022138;
 Thu, 17 Nov 2022 10:35:14 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3kt2rjfcs3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Nov 2022 10:35:14 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2AHAZqS545744512
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Nov 2022 10:35:52 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 60DE742045;
 Thu, 17 Nov 2022 10:35:12 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE9EF4203F;
 Thu, 17 Nov 2022 10:35:09 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.43.37.31])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 17 Nov 2022 10:35:09 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Thu, 17 Nov 2022 16:05:08 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: david@gibson.dropbear.id.au, clg@kaod.org, groug@kaod.org, Kowshik Jois
 B S <kowsjois@linux.ibm.com>
Subject: Re: [PATCH] target/ppc: Fix build warnings when building with
 'disable-tcg'
In-Reply-To: <9b92deef-e0ef-101d-8f7e-2b4634bde6de@gmail.com>
References: <20221116131743.658708-1-vaibhav@linux.ibm.com>
 <9b92deef-e0ef-101d-8f7e-2b4634bde6de@gmail.com>
Date: Thu, 17 Nov 2022 16:05:08 +0530
Message-ID: <87k03tx40z.fsf@vajain21.in.ibm.com>
Content-Type: text/plain; charset=utf-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: eL4Wj7zywgWhPlgdtItn1t32Mp1d5O0d
X-Proofpoint-GUID: kJSOjI138Zgac3Fy3witsSRgVx9mwW94
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-17_06,2022-11-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=711 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211170077
Received-SPF: pass client-ip=148.163.156.1; envelope-from=vaibhav@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Hi Daniel,

Thanks for quick turnaround on this,

Minor correction to the commit tags below:

Daniel Henrique Barboza <danielhb413@gmail.com> writes:

> Queued in gitlab.com/danielhb/qemu/tree/ppc-next with the following tags:
>
>
>      Reported-by: Kowshik Jois B S <kowsjois@linux.ibm.com>
>      Fixes: 61bd1d2942 ("target/ppc: Convert to tcg_ops restore_state_to_=
opc")
>      Fixes: 670f1da374 ("target/ppc: Implement hashst and hashchk")
>      Resolves: https://gitlab.com/qemu-project/qemu/-/issues/377
This should be

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1319

>      Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
>      Reviewed-by: Greg Kurz <groug@kaod.org>
>      Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>      Tested-by: Kowshik Jois B S <kowsjois@linux.vnet.ibm.com>
>

--=20
Cheers
~ Vaibhav


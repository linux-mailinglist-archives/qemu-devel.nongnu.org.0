Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 719C85B5BA0
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 15:52:10 +0200 (CEST)
Received: from localhost ([::1]:52756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXjr6-0005xC-BB
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 09:52:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oXjne-0002ZV-JV; Mon, 12 Sep 2022 09:48:34 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:6344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oXjnc-00037c-Rs; Mon, 12 Sep 2022 09:48:34 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28CDNhQe018217;
 Mon, 12 Sep 2022 13:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=nUEjAhTeAWa1dYc2rgevzz7yeYuFIBnuhqBemiU7Vx8=;
 b=o8L5cx6Ss14OFYtYt89BfDPsueaiNpv8r1EzDCVBA2RJy0mVxj77iR+yCf+hYvNahtqw
 54ouhD71fguz/6GHpmO8OR/KqK7h0PrEsPAaS6fO7b3mo1akGy8D5qi/XCfLk3d9fojI
 QpQ/dOJSAmBsjs5FZml1dyoSzpaXerRqqJNrZ3zXcI2FTW1Ir0BT2XjisB5Mg+a+B9ch
 m6dfnRTzQUOT8oB1IvpZ9U/gtHFXdpcziEqLtlgNYUKs2X8KEYVB3rXcvuPbghvQt2pY
 4SijHfnnmWTfYT8C/hpGIeJ6MnsUTaB1/NTIn030DB1xaPBzcE4xnY7+kUtNkYYBrlH7 Ig== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jj5m78nnx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Sep 2022 13:48:28 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28CDO8eV020136;
 Mon, 12 Sep 2022 13:48:28 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jj5m78nmx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Sep 2022 13:48:27 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28CDcsd5026120;
 Mon, 12 Sep 2022 13:48:25 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 3jgj78stq3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Sep 2022 13:48:25 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 28CDie6q17957210
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Sep 2022 13:44:40 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A507A4090;
 Mon, 12 Sep 2022 13:48:22 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F786A4075;
 Mon, 12 Sep 2022 13:48:21 +0000 (GMT)
Received: from li-7e0de7cc-2d9d-11b2-a85c-de26c016e5ad.ibm.com (unknown
 [9.171.22.70])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 12 Sep 2022 13:48:21 +0000 (GMT)
Message-ID: <ac3a9ee7df2e2c47b83a1bff01fd357ca83c2f5d.camel@linux.ibm.com>
Subject: Re: [PATCH v9 10/10] docs/s390x: document s390x cpu topology
From: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com
Date: Mon, 12 Sep 2022 15:48:21 +0200
In-Reply-To: <20220902075531.188916-11-pmorel@linux.ibm.com>
References: <20220902075531.188916-1-pmorel@linux.ibm.com>
 <20220902075531.188916-11-pmorel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: N_r310c33U5FxnGv6k5Y3_KiKubtVEq1
X-Proofpoint-ORIG-GUID: FoFBXWcXP5lLJS32Zi4DzWaELSDDK29L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_09,2022-09-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 phishscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
 suspectscore=0 mlxscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209120044
Received-SPF: pass client-ip=148.163.156.1; envelope-from=scgl@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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

On Fri, 2022-09-02 at 09:55 +0200, Pierre Morel wrote:
> Add some basic examples for the definition of cpu topology
> in s390x.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>  docs/system/s390x/cpu_topology.rst | 88 ++++++++++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
>  create mode 100644 docs/system/s390x/cpu_topology.rst
> 
> diff --git a/docs/system/s390x/cpu_topology.rst b/docs/system/s390x/cpu_topology.rst
> new file mode 100644
> index 0000000000..00977d4319
> --- /dev/null
> +++ b/docs/system/s390x/cpu_topology.rst
> @@ -0,0 +1,88 @@

[...]

> +Indicating the CPU topology to the Virtual Machine
> +--------------------------------------------------
> +
> +The CPU Topology, number of drawers, number of books per drawers, number of
> +sockets per book and number of cores per sockets is specified with the
> +``-smp`` qemu command arguments.
> +
> +Like in :
> +
> +.. code-block:: sh
> +    -smp cpus=1,drawers=3,books=4,sockets=2,cores=8,maxcpus=192
> +
> +If drawers or books are not specified, their default to 1.

Forgot this:
s/their default/they default/


[...]


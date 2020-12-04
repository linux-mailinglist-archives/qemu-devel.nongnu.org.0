Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A25102CE936
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 09:08:41 +0100 (CET)
Received: from localhost ([::1]:42010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl68u-0004d8-Nw
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 03:08:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1kl67b-00045C-SV; Fri, 04 Dec 2020 03:07:21 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:26354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1kl67W-0004yz-Eu; Fri, 04 Dec 2020 03:07:19 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B486FB6035734; Fri, 4 Dec 2020 03:07:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=OrQsb4G3Mo6zPoHe7oS4IScRnebpdka+gnTXfO5aVEM=;
 b=Ckd8QqNf9o7QGG3Rq0o9BtjcwnYr4pT1F156RwMx1I07PskW5neLQjtw0m/6d7i1htBV
 CArH2xvTV6CwMMwFTXl9e3K8fF5VhLZu+QJPXbH+u6DdoZ+pcQoC7oE7Xp3jcQV4omdk
 E4EbSRf8LgVw2kyI2KVOPWVeI+MOJPhgNl0K1rInJPaUIzbuDyEk7b6PtVRsHQl5bXMk
 m4kU+OW/jRWpAJSchTuXEz+/392m3zyXC2WeTpwhenXxKSr4IqMI3cRzpCXRVyz3UPrl
 TLsiIXYFnpIUkDno4WPhs46wUdttXlkroJD93rW62wNEUrgRqAG5BGngMKvEWeVK/ppU Og== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35789ax7cv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 03:07:02 -0500
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B486PjI036689;
 Fri, 4 Dec 2020 03:07:01 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35789ax79a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 03:07:01 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B47wMk4026881;
 Fri, 4 Dec 2020 08:06:58 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 35693xj1k3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 08:06:58 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B486tSW30212432
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Dec 2020 08:06:55 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A5CB5204E;
 Fri,  4 Dec 2020 08:06:55 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.4.55])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id D12665204F;
 Fri,  4 Dec 2020 08:06:51 +0000 (GMT)
Subject: Re: [for-6.0 v5 00/13] Generalize memory encryption models
To: David Gibson <david@gibson.dropbear.id.au>, pair@us.ibm.com,
 pbonzini@redhat.com, frankja@linux.ibm.com, brijesh.singh@amd.com,
 dgilbert@redhat.com, qemu-devel@nongnu.org
References: <20201204054415.579042-1-david@gibson.dropbear.id.au>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <f2419585-4e39-1f3d-9e38-9095e26a6410@de.ibm.com>
Date: Fri, 4 Dec 2020 09:06:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201204054415.579042-1-david@gibson.dropbear.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-04_02:2020-12-04,
 2020-12-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 spamscore=0 clxscore=1011 adultscore=0 priorityscore=1501 mlxlogscore=946
 lowpriorityscore=0 bulkscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012040046
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: thuth@redhat.com, cohuck@redhat.com, berrange@redhat.com,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, david@redhat.com,
 mdroth@linux.vnet.ibm.com, pasic@linux.ibm.com, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 04.12.20 06:44, David Gibson wrote:
> A number of hardware platforms are implementing mechanisms whereby the
> hypervisor does not have unfettered access to guest memory, in order
> to mitigate the security impact of a compromised hypervisor.
> 
> AMD's SEV implements this with in-cpu memory encryption, and Intel has
> its own memory encryption mechanism.  POWER has an upcoming mechanism
> to accomplish this in a different way, using a new memory protection
> level plus a small trusted ultravisor.  s390 also has a protected
> execution environment.
> 
> The current code (committed or draft) for these features has each
> platform's version configured entirely differently.  That doesn't seem
> ideal for users, or particularly for management layers.
> 
> AMD SEV introduces a notionally generic machine option
> "machine-encryption", but it doesn't actually cover any cases other
> than SEV.
> 
> This series is a proposal to at least partially unify configuration
> for these mechanisms, by renaming and generalizing AMD's
> "memory-encryption" property.  It is replaced by a
> "securable-guest-memory" property pointing to a platform specific

Can we do "securable-guest" ?
s390x also protects registers and integrity. memory is only one piece
of the puzzle and what we protect might differ from platform to 
platform.


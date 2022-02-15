Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 500F54B74B5
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 20:34:09 +0100 (CET)
Received: from localhost ([::1]:47008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK3aR-0003wx-UC
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 14:34:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nK3N2-0006qG-TO; Tue, 15 Feb 2022 14:20:16 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:29722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nK3N0-0005II-MC; Tue, 15 Feb 2022 14:20:16 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21FIZbXr035219; 
 Tue, 15 Feb 2022 19:20:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=vN9vvBnLnxNKZjjJgnj/PqzprbSj0oLOm9F/gLj5Da0=;
 b=phMC5/DeT3lqRxd4N//YNz6Oq5Q86gSAlicWpEzHBGQZ22RwwI91Qpq5mgviz6xezki2
 3zLxC/OX6lTMMPCLll9gXr/zJfqJIlGUo2pAd6d/yVZ8K3weHdHmyHHi1rFVb5GyV5+W
 3nQwYxZgBDC4UoyOlCqmbJIQ9tWU2vIkyZ7ev08EpwsN2qbKV7BW+LUgoFeAHslmFwH8
 d6AfLaYCbQOUP1JnQrT+E1/aRVoxYaH+31sDkC5S8743GqFazFlePsB0DAfv58gols/0
 v5KNab8u37uPSccnkCgT+Q+ZpU9LyLOZh6t7avDDNUom+Jl30Sd3Xh2lFTtqyIZ9Mexz ZQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8e8c6jmq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 19:20:10 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21FIh8q7036374;
 Tue, 15 Feb 2022 19:20:09 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8e8c6jmc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 19:20:09 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21FJDou6023448;
 Tue, 15 Feb 2022 19:20:09 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04dal.us.ibm.com with ESMTP id 3e64hbymty-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 19:20:09 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21FJK7YA36438502
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 19:20:07 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE2BB78076;
 Tue, 15 Feb 2022 19:20:07 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0FA5778066;
 Tue, 15 Feb 2022 19:20:07 +0000 (GMT)
Received: from localhost (unknown [9.211.143.123])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 15 Feb 2022 19:20:06 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>, =?utf-8?Q?C=C3=A9dric?=
 Le Goater <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
Subject: Re: [PATCH 0/9] ppc: nested KVM HV for spapr virtual hypervisor
In-Reply-To: <a7025097-79c9-cb23-71bb-b38b21c9d809@gmail.com>
References: <20220215031642.1691873-1-npiggin@gmail.com>
 <459593cb-6ab7-1998-687d-7b4b96f8cb97@kaod.org>
 <a7025097-79c9-cb23-71bb-b38b21c9d809@gmail.com>
Date: Tue, 15 Feb 2022 16:20:04 -0300
Message-ID: <87iltgx7h7.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: X_iFKFyHQ2w1NCmY6z1z0qgAXzpaezAX
X-Proofpoint-GUID: edB87-q-cjL5xA1RMIRfzF9Ek-1wtVce
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_05,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 mlxscore=0 spamscore=0
 mlxlogscore=879 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202150111
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel Henrique Barboza <danielhb413@gmail.com> writes:

> On 2/15/22 15:33, C=C3=A9dric Le Goater wrote:
>> On 2/15/22 04:16, Nicholas Piggin wrote:
>>> Here is the rollup of patches in much better shape since the RFC.
>>> I include the 2 first ones unchanged from independent submission
>>> just to be clear that this series requires them.
>>>
>>> Thanks Cedric and Fabiano for wading through my poor quality RFC
>>> code, very good changes suggested and I hope I got most of them
>>> and this one is easier to follow.
>>=20
>> This is in good shape and functional. I will try to propose a small
>> buildroot environment for it, so that we don't have to start a full
>> distro to test.
>>=20
>> I would like to talk about the naming. KVM-HV is I think "reserved"
>> to the PowerNV platform (baremetal). We also have KVM-PR which runs
>> KVM guests on various platforms, including pseries.
>>=20
>> How can we call this yet another KVM PPC implementation ?
>
> Do we need a new name? I believe Nick uses the stock kvm_hv kernel module=
 in this
> implementation.
>
> If we want a name to differ between the different KVM-HV usages, well, I'=
d suggest
> KVM-EHV (Emulated HV) or KVM-NHV (Nested HV) or KVM-VHV (Virtual HV) or a=
nything
> that suggests that this is a different flavor of using KVM-HV.

I'd say it's imperative to have a clear indication that this is
TCG. Otherwise we'll have people trying to weird stuff with it and
complaining that Nested KVM is bugged.

Some ideas:

Emulated Nested KVM
Emulated Nested HV
Nested TCG

The first one is perhaps more accurate, but we'd end up having "kvm"
mentioned in TCG code and that is super confusing.




Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6FE64E1DE
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 20:37:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5u25-0002SO-SA; Thu, 15 Dec 2022 14:36:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1p5u21-0002PZ-9D
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 14:36:37 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1p5u1p-0001qT-8t
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 14:36:37 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BFJMBVv022020
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 19:36:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=wj4qtaVQlfPYPVL+QLDQqa0gPpW6rVRsPef/OvL5n1Q=;
 b=hkWwu8djI6ZHvkOYycDl97SSoSzEhiXD630jZvhQFdBUsuxN8KvSYvWM3jcAbXx1I1do
 iVJWoGCVQuBk1PWStD7F5AAtWIDgescI/Ef5e/XCqLwxGssP6HwZ990LuqDdbI86B74M
 rbj+5nG+QqUt5KpeTejnIwwhVrAdi707eXRTtcYGyw5LnU6fZLNSRErpCJcqaFz/44zz
 tO1RVzVJUldli/xqsmKBaL9Kdil0Ske5f8OiPE2PYlH5zduLoaLYepPdtnmz0+LgzFdL
 mY70dMa7FQ8q57V2n51RU7dIjIaVFn+neFrj191mE2ZGIgkn1zPoX6Ks00zatyjwVGZc zQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mg7vnb49w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 19:36:01 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BFJLNxK028241
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 19:36:01 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mg7vnb498-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Dec 2022 19:36:01 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BFGvUSk007162;
 Thu, 15 Dec 2022 19:35:59 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([9.208.130.102])
 by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3mf08ew1jv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Dec 2022 19:35:59 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com
 [10.39.53.230])
 by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BFJZwRw63439254
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Dec 2022 19:35:59 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB53E5805A;
 Thu, 15 Dec 2022 19:35:58 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 325A658058;
 Thu, 15 Dec 2022 19:35:58 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 15 Dec 2022 19:35:58 +0000 (GMT)
Message-ID: <e77a3a76-c874-d279-52bf-18a4e3a36ba2@linux.ibm.com>
Date: Thu, 15 Dec 2022 14:35:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 2/2] tpm: add backend for mssim
Content-Language: en-US
To: jejb@linux.ibm.com, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20221215180125.24632-1-jejb@linux.ibm.com>
 <20221215180125.24632-3-jejb@linux.ibm.com>
 <b5cafbd3-d529-3a84-0604-c49aa30bf916@linux.ibm.com>
 <6fd1144d09777ddcdb7a1a1ba58cbbec345da9ef.camel@linux.ibm.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <6fd1144d09777ddcdb7a1a1ba58cbbec345da9ef.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3bCrIBbXRn_fFIKBBBpAc8gfNNLznKLr
X-Proofpoint-ORIG-GUID: rG0lSpv3EEpuJGBu8yWrdIJZj361U0Tc
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-15_11,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212150164
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 12/15/22 14:22, James Bottomley wrote:
> On Thu, 2022-12-15 at 13:46 -0500, Stefan Berger wrote:
>>
>>
>> On 12/15/22 13:01, James Bottomley wrote:
>>> From: James Bottomley <James.Bottomley@HansenPartnership.com>
>>>
>>> The Microsoft Simulator (mssim) is the reference emulation platform
>>> for the TCG TPM 2.0 specification.
>>>
>>> https://github.com/Microsoft/ms-tpm-20-ref.git
>>>
>>> It exports a fairly simple network socket baset protocol on two
>>> sockets, one for command (default 2321) and one for control
>>> (default
>>> 2322).  This patch adds a simple backend that can speak the mssim
>>> protocol over the network.  It also allows the host, and two ports
>>> to
>>> be specified on the qemu command line.  The benefits are twofold:
>>> firstly it gives us a backend that actually speaks a standard TPM
>>> emulation protocol instead of the linux specific TPM driver format
>>> of
>>> the current emulated TPM backend and secondly, using the microsoft
>>> protocol, the end point of the emulator can be anywhere on the
>>> network, facilitating the cloud use case where a central TPM
>>> service
>>> can be used over a control network.
>>>
>>> The implementation does basic control commands like power off/on,
>>> but
>>> doesn't implement cancellation or startup.  The former because
>>> cancellation is pretty much useless on a fast operating TPM
>>> emulator
>>> and the latter because this emulator is designed to be used with
>>> OVMF
>>> which itself does TPM startup and I wanted to validate that.
>>>
>>> To run this, simply download an emulator based on the MS
>>> specification
>>> (package ibmswtpm2 on openSUSE) and run it, then add these two
>>> lines
>>> to the qemu command and it will use the emulator.
>>>
>>>       -tpmdev mssim,id=tpm0 \
>>>       -device tpm-crb,tpmdev=tpm0 \
>>>
>>> to use a remote emulator replace the first line with
>>>
>>>       -tpmdev
>>> "{'type':'mssim','id':'tpm0','command':{'type':inet,'host':'remote'
>>> ,'port':'2321'}}"
>>>
>>> tpm-tis also works as the backend.
>>
>> Since this device does not properly support migration you have to
>> register a migration blocker.
> 
> Actually it seems to support migration just fine.  Currently the PCR's
> get zero'd which is my fault for doing a TPM power off/on, but
> switching that based on state should be an easy fix.

How do you handle virsh save  -> host reboot -> virsh restore?

You should also add a description to docs/specs/tpm.rst.

     Stefan

> 
> James
> 


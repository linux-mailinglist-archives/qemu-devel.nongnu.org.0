Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F5E45DBCA
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 15:00:18 +0100 (CET)
Received: from localhost ([::1]:47218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqFIP-00054y-0d
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 09:00:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mqFEI-00074N-JI
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 08:56:06 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:55466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mqFEG-0000wZ-Nr
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 08:56:02 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1APDaVoA004735
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 13:55:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=pbKEjwcg4wM+uxpWIvPqbXmNelqq/Szt6MM8lo3/wrA=;
 b=KOgfQXAlKsSrWbDlhAy+HdLq8na8PwKQMFA2kfeGsXJ+JI1CjMbPo1A2jh6okhjGrICi
 ubIy31TDqEx/qZh9Le85/3mB7NLmUe/GvAi12MXENLOUiY9TpJl7FtzDI0OTkWch1F1b
 6ejD8r4IoCfQuKsnxxekTdaBD1ewfIXestpjHqCOX2h8Tn0g50J5VcrPtCywfJjYx1lS
 +tUCg5TXAOBC+ACi02aE9PIKcFL/yc9m4JEQvPUEQLcjBG4p7FLSYx870Dn23HyoTy9W
 67Nt2ZeahpSRqJfs0ln8QLzojbBvVioihRKAbPFtdV2xby0Jq2Km7Xx4i7gWzbctoeWy Ig== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cj2vqjyv8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 13:55:58 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1APDoTsD012630
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 13:55:58 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cj2vqjyuw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Nov 2021 13:55:58 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1APDr5R9003232;
 Thu, 25 Nov 2021 13:55:57 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04wdc.us.ibm.com with ESMTP id 3cernc6k6q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Nov 2021 13:55:57 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1APDttiI19596014
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Nov 2021 13:55:55 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D68AB28065;
 Thu, 25 Nov 2021 13:55:55 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 54C8428064;
 Thu, 25 Nov 2021 13:55:51 +0000 (GMT)
Received: from [9.65.80.116] (unknown [9.65.80.116])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 25 Nov 2021 13:55:50 +0000 (GMT)
Message-ID: <7094b418-356f-5cb4-c4d8-745dbe0ca97c@linux.ibm.com>
Date: Thu, 25 Nov 2021 15:55:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: SEV guest attestation
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Sergio Lopez <slp@redhat.com>
References: <YZ58+T04uVXaO2Ab@redhat.com> <YZ6Ec0yG82nhbN+B@work-vm>
 <20211125071428.dpnavgxd3w4bzktr@mhamilton> <YZ+VAotzIOwUjMc8@redhat.com>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <YZ+VAotzIOwUjMc8@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fGVL9R3IuoxH2o3rkvSfGxo27bQTlJwj
X-Proofpoint-ORIG-GUID: yldm0pcPn7s7F6PgIeD6NUFd1HUh793T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-25_05,2021-11-25_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 mlxscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111250074
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.1,
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
Cc: afrosi@redhat.com, James Bottomley <jejb@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Dov Murik <dovmurik@linux.ibm.com>, Tyler Fanelli <tfanelli@redhat.com>,
 dinechin@redhat.com, John Ferlan <jferlan@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 25/11/2021 15:52, Daniel P. Berrangé wrote:
> On Thu, Nov 25, 2021 at 08:14:28AM +0100, Sergio Lopez wrote:
>> For SEV-SNP, this is pretty much the end of the story, because the
>> attestation exchange is driven by an agent inside the guest. Well,
>> there's also the need to have in the VM a well-known vNIC bridged to a
>> network that's routed to the Attestation Server, that everyone seems
>> to consider a given, but to me, from a CSP perspective, looks like
>> quite a headache. In fact, I'd go as far as to suggest this
>> communication should happen through an alternative channel, such as
>> vsock, having a proxy on the Host, but I guess that depends on the CSP
>> infrastructure.
> 
> Allowing network connections from inside the VM, to any kind
> of host side mgmt LAN services is a big no for some cloud hosts.
> 
> They usually desire for any guest network connectivity to be
> associated with a VLAN/network segment that is strictly isolated
> from any host mgmt LAN.
> 
> OpenStack provides a virtual CCDROM for injecting cloud-init
> metadata as an alternative to the network based metadata REST
> service, since they latter often isn't deployed.
> 
> Similarly for virtual filesystems, we've designed virtiofs,
> rather than relying on a 2nd NIC combined with NFS.
> 
> We cannot assume availability of a real network device for the
> attestation. If one does exist fine, but there needs to be an
> alternative option that can be used.
> 
> 
> On a slightly different topic - if the attestation is driven
> from an agent inside the guest, this seems to imply we let the
> guest vCPUs start beforre attestation is done. Contrary to
> the SEV/SEV-ES where we seem to be wanting vCPUs to remain
> in the stopped state until attestation is complete & secrets
> provided.  If the vCPUs are started, is there some mechanism
> to restrict what can be done  before attestation is complete?

The only mechanism is to design the workload in the Guest in a way that
it can't do anything meaningful until the secret is injected, and the
Attestation Server will release the secret only if a proper attestation
report is presented.

James (cc'd) wants to move this attestation check as early as possible
--> "to restrict what can be done before attestation is complete".


-Dov


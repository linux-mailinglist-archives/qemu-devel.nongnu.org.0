Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 916FA3F6B83
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 00:03:04 +0200 (CEST)
Received: from localhost ([::1]:40410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIeVb-0004ab-6B
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 18:03:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobin@linux.ibm.com>)
 id 1mIeTp-0003O3-Ix
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 18:01:14 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:44680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobin@linux.ibm.com>)
 id 1mIeTi-0003Gi-Jg
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 18:01:13 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17OLZcHT128489; Tue, 24 Aug 2021 18:00:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : subject : to : cc
 : message-id : date : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=II37AGyoTqYl1RM2pq4+IkYzWq0/yoTZqOEp89zr4gs=;
 b=fyVSq3x/CH9u3ZqpHm+MvckuoLmVQDd3Wkb8HRE4RfBQ8VKRF8dNJOFmz6QcoXrpkHc4
 CH0hZzqL5NXzDJB3kjtIDXW145UweVeNFiKjPLJ5pCtYLNPdIthIVeVUfDeugcvLf1hH
 OQTebVE7CdhwM2v4P7+osuNSOombUHd02InYZ8eWHC1A206869IhDPsqZvxRIQn7tvXH
 uL0lxY9HxAgF4qpFZCJWI4yukTKGZRqa0/fUdL0CN3WstKkTnhIxWOkynFDKsZhcb1tl
 +65HHwXy3q4oSfd0Zf9fJKo1GA32aH0AOykjU8qaH0sToZZPoujz3qrWlnRQxvZT2OSL ew== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3an3wn13et-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Aug 2021 18:00:55 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17OLZfET128711;
 Tue, 24 Aug 2021 18:00:55 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3an3wn13e9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Aug 2021 18:00:55 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17OLxWiW010171;
 Tue, 24 Aug 2021 22:00:53 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma05wdc.us.ibm.com with ESMTP id 3ajs4ck1w6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Aug 2021 22:00:53 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17OM0q9U25887014
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Aug 2021 22:00:52 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A082E2805A;
 Tue, 24 Aug 2021 22:00:52 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D5B828068;
 Tue, 24 Aug 2021 22:00:52 +0000 (GMT)
Received: from Tobins-MacBook-Pro-2.local (unknown [9.65.80.64])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 24 Aug 2021 22:00:52 +0000 (GMT)
From: Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
Subject: Re: Fw: [EXTERNAL] Re: [RFC PATCH 00/13] Add support for Mirror VM.
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6213e737-66ec-f8f0-925b-eeb847b7b790@linux.ibm.com>
Date: Tue, 24 Aug 2021 18:00:51 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: weIC-8CrKeGkeJtRqB0EKUGbtFxsBjC-
X-Proofpoint-ORIG-GUID: jc8ZCyAUh1KLGF-Qy60Ii-tB29ayTfVO
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-24_06:2021-08-24,
 2021-08-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 adultscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 phishscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108240134
Received-SPF: pass client-ip=148.163.156.1; envelope-from=tobin@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 15
X-Spam_score: 1.5
X-Spam_bar: +
X-Spam_report: (1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FAKE_REPLY_A1=3.453, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, "Habkost,
 Eduardo" <ehabkost@redhat.com>, kvm <kvm@vger.kernel.org>, "S. Tsirkin,
 Michael" <mst@redhat.com>, Tobin Feldman-Fitzthum <tobin@ibm.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hubertus Franke <frankeh@us.ibm.com>, Dov Murik <dovmurik@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 16, 2021 at 04:15:46PM +0200, Paolo Bonzini wrote:

> Hi,
>
> first of all, thanks for posting this work and starting the discussion.
>
> However, I am not sure if the in-guest migration helper vCPUs should use
> the existing KVM support code.  For example, they probably can just
> always work with host CPUID (copied directly from
> KVM_GET_SUPPORTED_CPUID), and they do not need to interface with QEMU's
> MMIO logic.  They would just sit on a "HLT" instruction and communicate
> with the main migration loop using some kind of standardized ring buffer
> protocol; the migration loop then executes KVM_RUN in order to start the
> processing of pages, and expects a KVM_EXIT_HLT when the VM has nothing
> to do or requires processing on the host.
> The migration helper can then also use its own address space, for
> example operating directly on ram_addr_t values with the helper running
> at very high virtual addresses.  Migration code can use a
> RAMBlockNotifier to invoke KVM_SET_USER_MEMORY_REGION on the mirror VM
> (and never enable dirty memory logging on the mirror VM, too, which has
> better performance).
>
> With this implementation, the number of mirror vCPUs does not even have
> to be indicated on the command line.  The VM and its vCPUs can simply be
> created when migration starts.  In the SEV-ES case, the guest can even
> provide the VMSA that starts the migration helper.

It might make sense to tweak the mirror support code so that it is more
closely tied to migration and the migration handler. On the other hand,
the usage of a mirror VM might be more general than just migration. In
some ways the mirror offers similar functionality to the VMPL in SNP,
providing a way to run non-workload code inside the enclave. This
potentially has uses beyond migration. If this is the case, do maybe we
want to keep the mirror more general.

It's also worth noting that the SMP interface that Ashish is using to
specify the mirror might come in handy if we ever want to have more than
one vCPU in the mirror. For instance we might want to use multiple MH
vCPUs to increase throughput.

-Tobin

> The disadvantage is that, as you point out, in the future some of the
> infrastructure you introduce might be useful for VMPL0 operation on
> SEV-SNP.  My proposal above might require some code duplication.
> However, it might even be that VMPL0 operation works best with a model
> more similar to my sketch of the migration helper; it's really too early
> to say.
>
> Paolo


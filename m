Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 887E445DBB2
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 14:52:18 +0100 (CET)
Received: from localhost ([::1]:55460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqFAf-0001DD-09
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 08:52:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mqF9R-0000Wb-2B
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 08:51:01 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:12918
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mqF9O-0007bq-4o
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 08:51:00 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1APAkJLS006454
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 13:50:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=8ZbCr8e5TuuQ4NbIj3DHIkwooh0yXD0iLlyH1eNsZW8=;
 b=ACPjwiu7LR10mzXIEBjfghUISVVK7/U97fjksuuo9bwm8LnwyHl+3ZqE1S1UIEcQC6vn
 QQ+zoe+rzD8ISPfBQTkvoi6VlHmoVsGoegitKR9srT3L6cqRMG4moy6YAKB7KR1ZEKyo
 v4dExCFhAv0f91NC0WPyqRXfRArEg34IEHzG4k8dSmsEmizfW/pwsAi0DA2yWekLiUV2
 l3Hx7/Sj/YOT8vXnPriR6JwI9QU27NNWbdO16Xy2CmigdClWv4YYE5soXuSu+6voNKYO
 ECKHf/UujTv7eXD6MuZuwB/LIedAcZueDZbOUSdnt/JdVdnhwfZzhmXtBUms0CUmKHoJ lg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cj91e3k46-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 13:50:56 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1APDahbP006588
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 13:50:56 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cj91e3k3t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Nov 2021 13:50:56 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1APDlRc6012042;
 Thu, 25 Nov 2021 13:50:55 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03wdc.us.ibm.com with ESMTP id 3cernbxj3m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Nov 2021 13:50:55 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1APDosKV25756090
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Nov 2021 13:50:55 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E36AC2806D;
 Thu, 25 Nov 2021 13:50:54 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E849228066;
 Thu, 25 Nov 2021 13:50:48 +0000 (GMT)
Received: from [9.65.80.116] (unknown [9.65.80.116])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 25 Nov 2021 13:50:48 +0000 (GMT)
Message-ID: <9c4fe1fe-cdb5-d991-439f-393e9a6f66bd@linux.ibm.com>
Date: Thu, 25 Nov 2021 15:50:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: SEV guest attestation
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <YZ58+T04uVXaO2Ab@redhat.com> <YZ6Ec0yG82nhbN+B@work-vm>
 <YZ+PNJRcyPGX4KAM@redhat.com>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <YZ+PNJRcyPGX4KAM@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hr0i375pTqrE3MaG3Xh2uldnDh4KvZIQ
X-Proofpoint-ORIG-GUID: GzTpH3of7CpUX-GAPawbqYt8o13qJDDa
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-25_05,2021-11-25_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 mlxscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111250074
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.1,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: slp@redhat.com, afrosi@redhat.com, qemu-devel@nongnu.org,
 Dov Murik <dovmurik@linux.ibm.com>, Tyler Fanelli <tfanelli@redhat.com>,
 dinechin@redhat.com, John Ferlan <jferlan@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 25/11/2021 15:27, Daniel P. Berrangé wrote:
> On Wed, Nov 24, 2021 at 06:29:07PM +0000, Dr. David Alan Gilbert wrote:
>> * Daniel P. Berrangé (berrange@redhat.com) wrote:
>>> On Wed, Nov 24, 2021 at 11:34:16AM -0500, Tyler Fanelli wrote:
>>>> Hi,
>>>>
>>>> We recently discussed a way for remote SEV guest attestation through QEMU.
>>>> My initial approach was to get data needed for attestation through different
>>>> QMP commands (all of which are already available, so no changes required
>>>> there), deriving hashes and certificate data; and collecting all of this
>>>> into a new QMP struct (SevLaunchStart, which would include the VM's policy,
>>>> secret, and GPA) which would need to be upstreamed into QEMU. Once this is
>>>> provided, QEMU would then need to have support for attestation before a VM
>>>> is started. Upon speaking to Dave about this proposal, he mentioned that
>>>> this may not be the best approach, as some situations would render the
>>>> attestation unavailable, such as the instance where a VM is running in a
>>>> cloud, and a guest owner would like to perform attestation via QMP (a likely
>>>> scenario), yet a cloud provider cannot simply let anyone pass arbitrary QMP
>>>> commands, as this could be an issue.
>>>
>>> As a general point, QMP is a low level QEMU implementation detail,
>>> which is generally expected to be consumed exclusively on the host
>>> by a privileged mgmt layer, which will in turn expose its own higher
>>> level APIs to users or other apps. I would not expect to see QMP
>>> exposed to anything outside of the privileged host layer.
>>>
>>> We also use the QAPI protocol for QEMU guest agent commmunication,
>>> however, that is a distinct service from QMP on the host. It shares
>>> most infra with QMP but has a completely diffent command set. On the
>>> host it is not consumed inside QEMU, but instead consumed by a
>>> mgmt app like libvirt. 
>>>
>>>> So I ask, does anyone involved in QEMU's SEV implementation have any input
>>>> on a quality way to perform guest attestation? If so, I'd be interested.
>>>
>>> I think what's missing is some clearer illustrations of how this
>>> feature is expected to be consumed in some real world application
>>> and the use cases we're trying to solve.
>>>
>>> I'd like to understand how it should fit in with common libvirt
>>> applications across the different virtualization management
>>> scenarios - eg virsh (command line),  virt-manger (local desktop
>>> GUI), cockpit (single host web mgmt), OpenStack (cloud mgmt), etc.
>>> And of course any non-traditional virt use cases that might be
>>> relevant such as Kata.
>>
>> That's still not that clear; I know Alice and Sergio have some ideas
>> (cc'd).
>> There's also some standardisation efforts (e.g. https://www.potaroo.net/ietf/html/ids-wg-rats.html 
>> and https://www.ietf.org/archive/id/draft-ietf-rats-architecture-00.html
>> ) - that I can't claim to fully understand.
>> However, there are some themes that are emerging:
>>
>>   a) One use is to only allow a VM to access some private data once we
>> prove it's the VM we expect running in a secure/confidential system
>>   b) (a) normally involves requesting some proof from the VM and then
>> providing it some confidential data/a key if it's OK
> 
> I guess I'm wondering what the threat we're protecting against is,
> and / or which pieces of the stack we can trust ?
> 
> eg, if the host has 2 VMs running, we verify the 1st and provide
> its confidental data back to the host, what stops the host giving
> that dat to the 2nd non-verified VM ? 

The host can't read the injected secret: It is encrypted with a key that
is available only to the PSP.  The PSP receives it and writes it in a
guest-encrypted memory (which the host also cannot read; for the guest
it's a simple memory access with C-bit=1).  So it's a per-vm-invocation
secret.


> 
> Presumably the data has to be encrypted with a key that is uniquely
> tied to this specific boot attempt of the verified VM, and not
> accessible to any other VM, or to future boots of this VM ?

Yes, launch blob, which (if I recall correctly) the Guest Owner should
generate and give to the Cloud Provider so it can start a VM with it
(this is one of the options on the sev-guest object).

-Dov


> 
> 
>>   c) RATs splits the problem up:
>>     https://www.ietf.org/archive/id/draft-ietf-rats-architecture-00.html#name-architectural-overview
>>     I don't fully understand the split yet, but in principal there are
>> at least a few different things:
>>
>>   d) The comms layer
>>   e) Something that validates the attestation message (i.e. the
>> signatures are valid, the hashes all add up etc)
>>   f) Something that knows what hashes to expect (i.e. oh that's a RHEL
>> 8.4 kernel, or that's a valid kernel command line)
>>   g) Something that holds some secrets that can be handed out if e & f
>> are happy.
>>
>>   There have also been proposals (e.g. Intel HTTPA) for an attestable
>> connection after a VM is running; that's probably quite different from
>> (g) but still involves (e) & (f).
>>
>> In the simpler setups d,e,f,g probably live in one place; but it's not
>> clear where they live - for example one scenario says that your cloud
>> management layer holds some of them, another says you don't trust your
>> cloud management layer and you keep them separate.
> 
> Yep, again I'm wondering what the specific threats are that we're
> trying to mitigate. Whether we trust the cloud mgmt APIs, but don't
> trust the compute hosts, or whether we trust neither the cloud
> mgmt APIs or the compute hosts.
> 
> If we don't trust the compute hosts, does that include the part
> of the cloud mgmt API that is  running on the compute host, or
> does that just mean the execution environment of the VM, or something
> else?
> 
>> So I think all we're actually interested in at the moment, is (d) and
>> (e) and the way for (g) to get the secret back to the guest.
>>
>> Unfortunately the comms and the contents of them varies heavily with
>> technology; in some you're talking to the qemu/hypervisor (SEV/SEV-ES)
>> while in some you're talking to the guest after boot (SEV-SNP/TDX maybe
>> SEV-ES in some cases).
>>
>> So my expectation at the moment is libvirt needs to provide a transport
>> layer for the comms, to enable an external validator to retrieve the
>> measurements from the guest/hypervisor and provide data back if
>> necessary.  Once this shakes out a bit, we might want libvirt to be
>> able to invoke the validator; however I expect (f) and (g) to be much
>> more complex things that don't feel like they belong in libvirt.
> 
> Yep, I don't think (f) & (g) belong in libvirt, since libvirt is
> deployed per compute host, while (f) / (g) are something that is
> likely to be deployed in a separate trusted host, at least for
> data center / cloud deployments. May be there's a case where they
> can all be same-host for more specialized use cases.
> 
> Regards,
> Daniel
> 


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BA14616DD
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 14:43:26 +0100 (CET)
Received: from localhost ([::1]:55218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrgwH-00040v-Nh
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 08:43:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mrgn9-0002Va-M7
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:33:59 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:21264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mrgn5-0000CH-SI
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:33:59 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1ATDKQNn004742
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 13:33:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=h305TjHCyNr/2vhW79x3jlGCq46ZlzFmZaykXFsGbEE=;
 b=GWZKq9Rs14oLJR02bxJcqsSfzZ+kkqa3MgDwcT7i3ddoksCRbSalieEsNPUCZw7/0cHC
 JKvOjiJ6jCNH6r6Xr1nVStW/W1tnYdrQf+umgOS5y02M/jvwkXhOAlkEcHtSkp9oB/AE
 45PCo7X3eD5hr2rCLznN0IEyBCEQcZA+1Q+vI/W9jdjskbLD+Ean8/coMftmI8Q98fT1
 i9LlhE4cfJMEAJXnUn5cR5mLnfkqIE3eXA2TS9AGBX7NDHph85+4dv9vI3pv8+hpjU5r
 Vps6gIYWL67eQtP/hUqRFkeshqWSUKvUyslQ0Nu9/hMIuU1lTIp5fLsh8AvfRjjoFFrw TQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cmynhgahd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 13:33:53 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1ATDKhuS009232
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 13:33:52 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cmynhgagy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 13:33:52 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1ATDVths030713;
 Mon, 29 Nov 2021 13:33:51 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01wdc.us.ibm.com with ESMTP id 3ckcaa1shb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 13:33:51 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1ATDXl6w4326116
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Nov 2021 13:33:47 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C6EE124069;
 Mon, 29 Nov 2021 13:33:47 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A3D24124072;
 Mon, 29 Nov 2021 13:33:43 +0000 (GMT)
Received: from [9.77.147.174] (unknown [9.77.147.174])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 29 Nov 2021 13:33:43 +0000 (GMT)
Message-ID: <693d76a7-a173-4d7e-0255-b97d6a3d5cd8@linux.ibm.com>
Date: Mon, 29 Nov 2021 15:33:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: SEV guest attestation
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <YZ58+T04uVXaO2Ab@redhat.com> <YZ6Ec0yG82nhbN+B@work-vm>
 <20211125071428.dpnavgxd3w4bzktr@mhamilton>
 <53dc2a76-a6bb-dc8d-1a47-faf7577e59e8@linux.ibm.com>
 <20211125151107.nhh7jfofk7qhkujd@mhamilton> <YZ+udETWZvkZP9ug@work-vm>
 <YZ+yO0vNVgh/KeJi@redhat.com> <YZ+1EOvL7/6Usk0z@work-vm>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <YZ+1EOvL7/6Usk0z@work-vm>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: WencqSn2E55RTYXXkc63peefBFySehOE
X-Proofpoint-GUID: iYnsxS9a2RYqMvQcdaavcFks1rUP0ALg
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-29_08,2021-11-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111290068
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.317,
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
Cc: Dov Murik <dovmurik@linux.ibm.com>, Sergio Lopez <slp@redhat.com>,
 afrosi@redhat.com, James Bottomley <jejb@linux.ibm.com>, qemu-devel@nongnu.org,
 Hubertus Franke <frankeh@us.ibm.com>, Tyler Fanelli <tfanelli@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 dinechin@redhat.com, John Ferlan <jferlan@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 25/11/2021 18:08, Dr. David Alan Gilbert wrote:
> * Daniel P. Berrangé (berrange@redhat.com) wrote:
>> On Thu, Nov 25, 2021 at 03:40:36PM +0000, Dr. David Alan Gilbert wrote:
>>> * Sergio Lopez (slp@redhat.com) wrote:
>>>> On Thu, Nov 25, 2021 at 02:44:51PM +0200, Dov Murik wrote:
>>>>>
>>>>> SEV-ES has pre-launch measurement and secret injection, just like SEV
>>>>> (except that the measurement includes the initial states of all vcpus,
>>>>> that is, their VMSAs.  BTW that means that in order to calculate the
>>>>> measurement the Attestation Server must know exactly how many vcpus are
>>>>> in the VM).
>>>>
>>>> You need the number of vCPUs and an idea of what their initial state
>>>> is going to be, to be able to reproduce the same VMSA struct in the
>>>> Attestation Server.
>>>>
>>>> This may tie the Attestation Server with a particular version of both
>>>> QEMU and KVM. I haven't checked if configuration changes in QEMU may
>>>> also have an impact on it.
>>>
>>> That's all OK; I'm expecting the attestation server to be given a whole
>>> pile of information about the apparent environment to check.
>>
>> Generally though we try not to let a VM to tied to a specific
>> version of software. eg use machine types to ensure that the
>> guest can run on any QEMU version, and get the same environment.
>> This lets host admin upgrade the host software for bug/security
>> fixes without negatively impacting users. It'd be nice not to
>> loose that feature with SEV if possible.
>>
>> IOW, if there are aspects of the vCPU initial state that might
>> vary over time with different QEMU versions, should we be looking
>> to tie that variance into the machine type version.
> 
> It's not tied to a particular version; but you may need to let the
> attesting server know what version it's using so that it can check
> everything adds up.


To further complicate things, note that in SEV-ES the reset vector
address (CS:IP) for all APs is not set by QEMU, but taken from GUIDed
tables in OVMF (towards the end of the image); QEMU parses the table and
takes the reset address from there.  So a benign-looking change in OVMF
(changing the AP reset vector address) might cause a change in the
VMSAs, and therefore a change in the measurement.

Of course the OVMF binary itself is part of the measurement as well.

-Dov



> 
> Dave
> 
>> For KVM changes, this might again come back to the idea fo a
>> "host type version".
>>
>> Regards,
>> Daniel
>> -- 
>> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
>> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
>> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
>>


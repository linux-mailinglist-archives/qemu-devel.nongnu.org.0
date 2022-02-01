Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F594A6A5B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 03:55:05 +0100 (CET)
Received: from localhost ([::1]:48478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF5nT-00077Y-Ue
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 21:55:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobin@linux.ibm.com>)
 id 1nF0wT-0000yO-HQ
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 16:44:01 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:27018
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobin@linux.ibm.com>)
 id 1nF0wR-0005d4-Gl
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 16:44:01 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 211L1njn006004; 
 Tue, 1 Feb 2022 21:43:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=0Ra7FMwp0ATPoE7O4aVDUnRZNS+TtwUdwEhD7W6OVbo=;
 b=sUCoc70nNmARbfWPXh8sSquUGNJjcVx8Fc96bNZds0akPL/kaoS7N/kLnanlAC/Eq2fm
 IU+/ymRrbOEvaYeymZyycKD1cIxJx15kHmR/kvLjjHrLxarIMyH3Wgyqws+cD03UaGCx
 rrxNzBWsdDf3yL8oSQVP9ccjIy1WWI7LaoVKi/dPZuL2yqJJlrzaghwVpzMVv2TgZBnC
 nDeQuANBctH4VqE1/j7iht0t8aG5GYQd3cmDCSVMMfY15AR+9eNlHgAvdzwgixPzS6fe
 SZ0Pw5GW/smoChkFMafkOKMaVMmj28+P9N6dU15Ky7Em8w5rYoSTDACxwzzcJMK40zL8 2g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dya3hkcb2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Feb 2022 21:43:55 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 211Lc48e030914;
 Tue, 1 Feb 2022 21:43:54 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dya3hkcah-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Feb 2022 21:43:54 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 211LcbYW015759;
 Tue, 1 Feb 2022 21:43:54 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 3dvw7b09qq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Feb 2022 21:43:54 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 211LhqCG17498420
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Feb 2022 21:43:52 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 425A4C6057;
 Tue,  1 Feb 2022 21:43:52 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D02FC6055;
 Tue,  1 Feb 2022 21:43:50 +0000 (GMT)
Received: from [9.160.65.161] (unknown [9.160.65.161])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  1 Feb 2022 21:43:50 +0000 (GMT)
Message-ID: <9377cd87-ef7e-384f-929b-84e133fc3ad1@linux.ibm.com>
Date: Tue, 1 Feb 2022 16:43:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH] qapi, i386/sev: Add debug-launch-digest to launch-measure
 response
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>
References: <20220131111539.3091765-1-dovmurik@linux.ibm.com>
 <YffLgx48+mM2SiIX@redhat.com>
 <5f08d6d3-0279-50ed-5223-a9f3217e555d@linux.ibm.com>
 <YffxpK99EibxdXG4@redhat.com>
From: Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
In-Reply-To: <YffxpK99EibxdXG4@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 10NSikj5h_VrAC5k5-ieTLCf3VXQpP21
X-Proofpoint-ORIG-GUID: loWrHALmRj-GZ0sgYohh0woNyfGbEzOX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-01_10,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 malwarescore=0 spamscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 clxscore=1011 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202010118
Received-SPF: pass client-ip=148.163.158.5; envelope-from=tobin@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Markus Armbruster <armbru@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/31/22 9:26 AM, Daniel P. Berrangé wrote:

> 
> Ok, so the usage scenario is that the platform owner is deciding 
> which OVMF build in use, not the guest owner. That guest owner just
> knows that it is an OVMF build from a set of builds published by the
> platform owner. Good enough if you trust the cloud owner in general,
> but want confidence that their compute host isn't compromised. Would
> need  an independantly reproducible build, if you don't trust the
> cloud owner at all.
> 
> 
> Assuming we've got 5 possible OVMF builds, currently we would need
> to calculate 5 HMACs over the inpuot data.
> 
> With this extra piece of info, we only need to calculate 1 HMAC.
> 
> So this is enabling a performance optimization, that could indeed
> be used in a production deployment.  The HMAC ops are not exactly
> performance intensive though until we get to the point of choosing
> between a huge number of possible OVMFs.
> 
> If we can't get the VMSA info included, then the guest owner still
> needs a local copy of every possible OVMF binary that is valid. IOW
> this digest is essentially no more than a filename to identify which
> OVMF binary to calc the HMAC over.

For us the guest owner isn't monolithic. The guest owner will rely on a
Key Broker Service (KBS) running in some trusted domain to process
individual measurements and secret requests. The guest owner must
provision the KBS at the start of the day. I mention this because while
the guest owner will definitely need to build their own version of OVMF
and the components accounted for in the hashes table, ideally the
binaries won't need to be uploaded to the KBS.

If we forget about SEV-ES, the flow is pretty easy. At the start of the
day the guest owner builds the firmware, kernel, etc that they expect
the VM to be started with. They use a script to hash all the components,
formulate the hashes table, and ultimately produce the launch digest.
The guest owner uploads the launch digest to the KBS. If multiple
configurations are supported, they upload multiple digests.

We could do something very similar for SEV-ES, but there are some drawbacks.
> 
> IOW, I think there's only two scenarios that make sense
> 
> 1. The combined launch digest over firmware, kernel hashes
>    and VMSA state.
> 
> 2. Individual hashes for each of firmware, kernel hashes table and
>    VMSA state
> 
> I think we should assume that anyone who has access to SEV-ES hardware
> is likely to run in SEV-ES policy, not SEV policy. So without VMSA
> state I think that (1) is of quite limited usefulness. (2) would
> be nicer to allow optimization of picking which OVMF blob to use,
> as you wouldn't need to figure out the cross-product of very valid
> OVMF and every valid kernel hashes table - the latter probably isn't
> even a finite bounded set.
> 
I see something very similar. We could support -ES by doing the same
thing described above for SEV. The catch is that the guest owner would
have to calculate a firmware digest for every possible VMSA. That said,
if we assume that the VMSAs aren't going to change much, this just comes
down to a different VMSA and launch digest for each allowed cpu count.

Generating these digests could probably be automatically handled by the
same script that generates the secret table and calculates the launch
digest. No matter what we do, the guest owner will need to come up with
an expected VMSA. We would probably have to extend QEMU to include the
VMSA in the debug hash field for approach this to work.

>> More generally: within space/network constraints, give the Guest Owner
>> all the information it needs to compute the launch measurement.  There's
>> a problem with OVMF there (we don't want to send the whole 4 MB over the
>> QMP response, but given its hash we can't "extend" it to include the
>> kernel-hashes struct).
> 
> Yeah its a shame we aren't just measuring the digest of each piece
> of information in  GCTX.LD, instead of measuring the raw information
> directly.
Exactly. This is annoying because it complicates the other option, which
is to have the guest owner upload hashes of each individual component to
the KBS, which would generate the final hash when checking a launch
measurement. Unfortunately the launch digest is the hash of the firmware
binary itself, not the hash of the hash of the firmware. This means that
the guest owner would have to upload the firmware binary to the KBS. If
we took this approach the guest owner wouldn't have to generate a bunch
of launch digests, although they might need to provide the KBS with
complex instructions about which components can be used together.

Anyway, I think either of these options is fine. The first is more work
for the guest owner at configuration time and the second is more work
for the KBS at runtime. Like I said, the guest owner will need to know
an expected VMSA either way so maybe we should think of that as a
separate issue.
> 
> 
> I wonder if we're thinking of this at the wrong level though. Does
> it actually need to be QEMU providing this info to the guest owner ?
> 
The CSP could generate the hash that it expects to boot without the help
of QEMU, although it might be more complicated for SEV-ES. Even so, it
would be convenient if the CSP could ask QEMU/libvirt for the expected
hashes via the same interface that it gets the measurement. The CSP will
have to report the real launch measurement to the KBS. It would be handy
if the debug measurement were available at the same time with no extra
bookkeeping.

-Tobin


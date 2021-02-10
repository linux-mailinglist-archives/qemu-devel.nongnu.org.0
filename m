Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E9E316FBB
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 20:11:20 +0100 (CET)
Received: from localhost ([::1]:56178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9utT-0008Dc-Rm
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 14:11:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1l9uqB-0007A9-F2
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 14:07:55 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:18988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1l9uq9-0005lt-6w
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 14:07:55 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11AJ2hkB093666
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 14:07:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=FQY6Fy5D2G8Lw48p3KYJbAIBsWJOde8hm6IkDK4AwPA=;
 b=qyyvSUGaT9NDXZvgc+e6LylCTT+6ikTbxqbROsa0MAi5KQZQJczkOwPs8cpl6N7EXkX3
 g5x1oZIjkDzzbUckeBSBHXwbNRHXPYschdIjwiF2hyA0gEubxgAprDSMrWHwaF4bsj64
 QALLqd4eF6V5tBXVfbU0F5dggYzNIpHFt89fNO4ekvD23zhMHJEaH/L723QWgaeEon+L
 RglFAZdCavOPfbYR1VwYyX+eX91QGK8S2ptGpRhnxigqfR0y3wToypNorZQjLDJbYn0I
 9QunnGOKcRJxV8w5nzZpysqTQr9kfQxs3UY01TAFwgJ/qPjsVXsWAIoL9tL63D7LTx8G Rw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36mmjx9pq1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 14:07:49 -0500
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 11AJ2wvT095511
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 14:07:18 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36mmjx9nj2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Feb 2021 14:07:17 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11AIlGNA010440;
 Wed, 10 Feb 2021 19:06:52 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03wdc.us.ibm.com with ESMTP id 36hjr9g7n5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Feb 2021 19:06:52 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11AJ6phQ33554934
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Feb 2021 19:06:51 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4CD9B78060;
 Wed, 10 Feb 2021 19:06:51 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 569027805C;
 Wed, 10 Feb 2021 19:06:50 +0000 (GMT)
Received: from jarvis.int.hansenpartnership.com (unknown [9.80.218.10])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 10 Feb 2021 19:06:50 +0000 (GMT)
Message-ID: <f46a24d33185b808801531da7d9ca6457d9a790e.camel@linux.ibm.com>
Subject: Re: Interactive launch over QMP socket?
From: James Bottomley <jejb@linux.ibm.com>
To: Connor Kuehl <ckuehl@redhat.com>, qemu-devel@nongnu.org
Date: Wed, 10 Feb 2021 11:06:49 -0800
In-Reply-To: <ef2db65a-f9bd-5cf7-7c1a-9ba07dd4bda0@redhat.com>
References: <47b15088-514a-8174-029d-8d9c4571960a@redhat.com>
 <ac1a5075878d86b0a46db20cb6e579b5fec74d87.camel@linux.ibm.com>
 <ef2db65a-f9bd-5cf7-7c1a-9ba07dd4bda0@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-10_08:2021-02-10,
 2021-02-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102100169
Received-SPF: pass client-ip=148.163.156.1; envelope-from=jejb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: jejb@linux.ibm.com
Cc: npmccallum@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2021-02-10 at 12:46 -0600, Connor Kuehl wrote:
> On 2/10/21 12:14 PM, James Bottomley wrote:
> > > I would like to add a message type to QMP which allows guest
> > > owners to supply this data over a socket and _not_ require these
> > > components a priori via command line arguments. In doing so, this
> > > would allow for a 100% remote attestation process over the
> > > socket. However, I'm not sure how to express this interactive
> > > "waiting" for this data to become available with internal APIs
> > > (assuming it's not supplied as a command  line argument).
> > 
> > Well, I never understood why qemu can't deduce the value of cbitpos
> > ... it even errors out if you get it wrong.  However, other things
> > like the policy and the session file have to be present at start of
> > day. They're not things that can be passed in after qemu starts
> > building the machine image because they need to be present to begin
> > building it.
> 
> Right, I didn't mean to include cbitpos in consideration for this.
> I'm only interested in supplying the session, policy, and certificate
> info over the socket.
> 
> Shouldn't the session, policy, and certificate information only be 
> required in time for the KVM_SEV_LAUNCH_START ioctl call? This is
> the place I'm interested in waiting for the relevant data.

Well, it could, but I see the session information as being the same as
the image file, which is also a command line argument, so if you can do
the image file on the command line, why not the session info as well?

The other problem is the session info is exchanged for a launch handle
in kvm_init, which is machine_init in qemu terms.  That's called
phenomenally early, so there's not much of kvm to pause before you do
that.  So either qemu has to be rewritten to pause before processing
command line arguments, and then any argument can be added over QMP, or
the handle exchange has to occur later.

James




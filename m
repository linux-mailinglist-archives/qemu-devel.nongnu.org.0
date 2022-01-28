Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A54B49F8C6
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 12:53:43 +0100 (CET)
Received: from localhost ([::1]:59780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDPoy-0006Qz-Gz
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 06:53:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nDPkj-0003Uw-PT; Fri, 28 Jan 2022 06:49:17 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:10134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nDPkh-0002yf-S7; Fri, 28 Jan 2022 06:49:17 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20SBHSpd025773; 
 Fri, 28 Jan 2022 11:49:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=wb0j/keZFpEkB20WLZfQCiFUeBNfx11UV3PQQfkqpEw=;
 b=DngPP8XNe5cJRrQzYUutYBXEnB8NNFMosTnCmC9oi7nNKwP3LuvISXqLBRLoDQoro2mk
 T9575EOx+zTNPwqA+5ghiyA1OJdUXGy6XE8HBb9OicB2aNs3LHDYMYVZ7eo8fcftmuCd
 U+OXhnBaTLxBpaBt14EGpF3lkCfAncWuazMhp3otKu+KO8Wheh2r+B9YyeUQG8X8Objw
 lwdkYpegeWLdT9PGb54QwHw4vO9/ds12WMyTk5LYh2Eg8PGZAgmojuZDEa0Uxjj9MXQp
 Mwcu0X5y8BhTDQyWLuQ8JWbLPxWgWVuhi1ldE81JeujnAFUkb08QfBhVv/XcDaJxm044 2Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dvfg08pn8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 11:49:12 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20SBIXZj028300;
 Fri, 28 Jan 2022 11:49:12 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dvfg08pmn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 11:49:12 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20SBmjbG020464;
 Fri, 28 Jan 2022 11:49:10 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06fra.de.ibm.com with ESMTP id 3dr96k6a7v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 11:49:10 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20SBn4ro40567160
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jan 2022 11:49:04 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C7A28AE059;
 Fri, 28 Jan 2022 11:49:04 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 49B6BAE04D;
 Fri, 28 Jan 2022 11:49:04 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.3.175])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 28 Jan 2022 11:49:04 +0000 (GMT)
Date: Fri, 28 Jan 2022 12:48:33 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2 1/1] virtio: fix the condition for iommu_platform not
 supported
Message-ID: <20220128124833.0ceb0789.pasic@linux.ibm.com>
In-Reply-To: <cbac9c93-0d4a-1914-3c9d-203b1472056c@gmail.com>
References: <20220117120238.2519239-1-pasic@linux.ibm.com>
 <20220125112112.44957075.pasic@linux.ibm.com>
 <20220127142800.11d8f1be.pasic@linux.ibm.com>
 <be34f50a-9664-7411-1e9b-2bac4735311d@gmail.com>
 <20220128032911.440323f1.pasic@linux.ibm.com>
 <cbac9c93-0d4a-1914-3c9d-203b1472056c@gmail.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jC1DyLXWUJtUQFLhIdy_s8SnlfmYhND8
X-Proofpoint-GUID: 77W80QOq0i-3xHHqfPBJXwXV5NL_oC62
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-28_02,2022-01-27_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 mlxscore=0 phishscore=0
 bulkscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201280072
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Jakob Naucke <Jakob.Naucke@ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 28 Jan 2022 08:02:39 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> > We may be able to differentiate between the two using ->dma_as, but for
> > that it needs to be set up correctly: whenever you require translation
> > it should be something different than address_space_memory. The question
> > is why do you require translation but don't have your ->dma_as set up
> > properly? It can be a guest thing, i.e. guest just assumes it has to do
> > bus addresses, while it actually does not have to, or we indeed do have
> > an IOMMU which polices the devices access to the guest memory, but for
> > some strange reason we failed to set up ->dma_as to reflect that.  
> 
> 
> I have 2 suggestions. First is to separate how we interpret iommu_platform. I find it
> hard to do this properly without creating a new flag/command line option.
> 

A new command line option looks problematic to me because of the
existing setups. We could tie that to a compat machine, but it looks
ugly and also a little wrong from where I stand.
> 
> My second suggestion is, well .... I think it's proved that s390x-PV and AMD SEV are
> being impacted (and probably Power secure guests as well), so why not check for
> confidential guest support to skip that check entirely? Something like this patch:
> 

This is not acceptable for s390x and it should not be acceptable for SEV
or Power secure guests, because s390x Secure Execution ()support predates
the confidential guest support patches and "->cgs", and thus you don't
have to turn on CGS to use SE. Just providing the iommu_platform=on
manually on each device is perfectly fine! Should be the same for SEV

[..]
> +    if (!machine->cgs && has_iommu &&
> +        !virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
>           error_setg(errp, "iommu_platform=true is not supported by the device");
>           return;
>       }
[..]

> This will not break anything for non-secure guests and, granted that machine->cgs is already
> set at this point, this will fix the problem for s390x-PV and AMD SEV. And we won't have to
> dive deep into a virtio-bus feature negotiation saga because of something that can be easily
> handled for machine->cgs guests only.

Your assumption does not hold. See above. Unfortunately my assumption of 
->dma_as == & address_space_memory implies does not need translation
does not hold either. But IMHO we should really get to the bottom of
that, because it just does not make sense.

> 
> If this patch works for you and Brijesh I believe this is a good option.

I don't believe it is a good option. @Brijesh can you confirm that SEV
has the same problem with this approach s390x has, and that it would
break existing setups?

I have another idea, but my problem is that I don't understand enough of
the Power and PCI stuff. Anyway if for your plattform iommu_platform=on
devices can not work in a VM that does not have an IOMMU you could
error out on that. You could express that via a machine property, and
then make sure your dma address space is not address_space_memory, if
that machine property is set.

Regards,
Halil


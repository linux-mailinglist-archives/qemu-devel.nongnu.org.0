Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 818CE4CD316
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 12:10:15 +0100 (CET)
Received: from localhost ([::1]:51948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ5p8-0000wc-Jr
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 06:10:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nQ5ni-00086H-JE
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 06:08:47 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:4258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nQ5ng-0006Br-E6
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 06:08:46 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 224AIjkX030759; 
 Fri, 4 Mar 2022 11:08:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=z+Ve2ct7VwuVDQC4v7eauD5aRkNpjN7NkfPxcq6lQt8=;
 b=ArZGlj6gi0I+Zhd1KF7tIlqty9penEYnIjGOnCj5MkXgRRfmxiEbnrQxT19UePBkamgd
 4MYGIPVPNaTt9GOKCGcuZ1mO7ZqBYiXCxCX4OBMFjtmzhOXt2Jmg+h/3E+2tICkSQb1E
 xnD57XUQWBFOLPi0MEIqmZ+FkX4K7NgQzJxm3v+bzcEbkQya0KTGBbE3U6kGwVOSMupY
 A4Ng8D84XY1jUZt4pNDvtyR1BPqywyerIZkZVpPkWYoRvFsruLoYfFfoXfax8Q7MRMgD
 7bsinfKR8AsEsgpeJXQoh3bbAH5uPTbC5YNTzajnwL6F69jhN7dKfaYZvOAuFmX2NIMs 2g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ekgwgrvgg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Mar 2022 11:08:39 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 224B8cnN020778;
 Fri, 4 Mar 2022 11:08:38 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ekgwgrvg0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Mar 2022 11:08:38 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 224B797b017267;
 Fri, 4 Mar 2022 11:08:36 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04fra.de.ibm.com with ESMTP id 3ek4k5hafv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Mar 2022 11:08:36 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 224B8YLo52166912
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Mar 2022 11:08:34 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EEC6BA405F;
 Fri,  4 Mar 2022 11:08:33 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7873EA4065;
 Fri,  4 Mar 2022 11:08:33 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.94.215])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri,  4 Mar 2022 11:08:33 +0000 (GMT)
Date: Fri, 4 Mar 2022 12:08:09 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 1/1] virtio: fix feature negotiation for ACCESS_PLATFORM
Message-ID: <20220304120809.062a741b.pasic@linux.ibm.com>
In-Reply-To: <20220304031142-mutt-send-email-mst@kernel.org>
References: <20220209124534.1206993-1-pasic@linux.ibm.com>
 <87leykt0k7.fsf@redhat.com>
 <20220209212750.25ddcebe.pasic@linux.ibm.com>
 <87fsort5a6.fsf@redhat.com>
 <20220210113258.1e90af05.pasic@linux.ibm.com>
 <877da3t1du.fsf@redhat.com>
 <20220210142929.668a1f3d.pasic@linux.ibm.com>
 <20220304031142-mutt-send-email-mst@kernel.org>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jbqs2ag0ouWHyTRCYBpCJ6BR0qeyIEG5
X-Proofpoint-ORIG-GUID: fSIbJVRUkheNGaC2TxhcPjjXuvYe_aHV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-04_02,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203040059
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pasic@linux.ibm.com;
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
Cc: Cornelia Huck <cohuck@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Jason Wang <jasowang@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Mar 2022 03:12:03 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Thu, Feb 10, 2022 at 02:29:29PM +0100, Halil Pasic wrote:
> > On Thu, 10 Feb 2022 12:19:25 +0100
> > Cornelia Huck <cohuck@redhat.com> wrote:
> > 
> > [..]  
> > > 
> > > Nope, that's not my problem. We make sure that the bit is persistent, we
> > > fail realization if the bit got removed by the callback when required,
> > > and we fail feature validation if the driver removes the bit, which is
> > > in a different code path. We should not talk about FEATURES_OK in this
> > > code.  
> > 
> > I agree. I changed my mind. Expanation follows...
> >   
> > > 
> > > We force-add the bit, and then still might fail realization. The
> > > important condition is the has_iommu one, not the checks later on. I
> > > find it very confusing to talk about what a potential driver might do in
> > > that context.
> > >   
> > 
> > I assumed stuff like virtiofs+SE regressed with commit 04ceb61a40
> > ("virtio: Fail if iommu_platform is requested, but unsupported") but I
> > think, I was wrong. It didn't work before that, because we did not
> > present ACCESS_PLATFORM to the guest. I operated under the assumption
> > that virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM)
> > does not impact the set of features offered to the driver by the device,
> > but it does.
> > 
> > So we need both this patch and "[PATCH v5 1/1] virtio: fix the condition
> > for iommu_platform not supported" to get virtiofs to work with SE/SEV/Secure VM.
> > 
> > I have to admit I only tested for the error message, and not with a full
> > SE setup.
> > 
> > I agree my comment was inadequate. Can we use
> > 
> > /* make sure that the device did not drop a required IOMMU_PLATFORM */
> > 
> > I will think some more though. This is again about the dual nature
> > of ACCESS_PLATFORM...  
> 
> Were you going to post a new version of this patch?
> 

Sorry I got sidetracked. I will spin a new version today!

Regards,
Halil


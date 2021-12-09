Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D2946E93B
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 14:36:45 +0100 (CET)
Received: from localhost ([::1]:44200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvJbH-0006th-ON
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 08:36:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mvJUR-0001x1-Gz; Thu, 09 Dec 2021 08:29:39 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:8480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mvJUP-00009U-Hp; Thu, 09 Dec 2021 08:29:39 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B9CvkWt035276; 
 Thu, 9 Dec 2021 13:29:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=bCgmoXqFSH1VJSuPBLEbDqGTvkivJS8y2R38310hxnU=;
 b=VGFQA754nGaas5QKLQQY4KM8DeGlDg/pxoDVTdhSYLg3Zxk2F9ZnA3plNnU6n389Gwoy
 ZrzGo0qjkjEPfYFERcNVykvtuB7qvpXdT+yOuUMDqfVDboCmX4RQ24xKNbDZXpbnHPLO
 NIiTcJd6z2K7zYLAdL6GPV+pvS+l0g+PirvpnuaYDtnBL/P6lsu0qTWXp1ggofbF7i/4
 D9ogqWhckbjn2C5+S8qJtgBIHnUq9BPEZUpbY4Uu/DWEjFMh/Wm/+0ig77Kpd95TCvAi
 Qo3sX9suhXGZ3JFuDFHEZz5GtNKgk7fAYPLXq/vMSgk+RPzam+cMewGnuAbwRVU3BFVw TA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cuj918mxe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Dec 2021 13:29:33 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B9Cwvhs037066;
 Thu, 9 Dec 2021 13:29:32 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cuj918mwu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Dec 2021 13:29:32 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B9DH0JB016008;
 Thu, 9 Dec 2021 13:29:31 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3cqykjsvac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Dec 2021 13:29:30 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1B9DTRLD22282658
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Dec 2021 13:29:27 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D5EB211C050;
 Thu,  9 Dec 2021 13:29:27 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53D3311C052;
 Thu,  9 Dec 2021 13:29:27 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.8.227])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu,  9 Dec 2021 13:29:27 +0000 (GMT)
Date: Thu, 9 Dec 2021 14:29:25 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC PATCH v2 0/5] virtio: early detect 'modern' virtio
Message-ID: <20211209142925.0decf425.pasic@linux.ibm.com>
In-Reply-To: <20211208135456-mutt-send-email-mst@kernel.org>
References: <20211112145749.618157-1-pasic@linux.ibm.com>
 <20211208135456-mutt-send-email-mst@kernel.org>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: EEkLrmYo9NqYEVHnu6N48Z47vqNmN6et
X-Proofpoint-GUID: 7w6Nd4UY79uSPLpo789u9Vvi0l6NLJUx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-09_04,2021-12-08_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 adultscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112090073
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 8 Dec 2021 13:56:19 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Fri, Nov 12, 2021 at 03:57:44PM +0100, Halil Pasic wrote:
> > This is an early RFC for a transport specific early detecton of
> > modern virtio, which is most relevant for transitional devices on big
> > endian platforms, when drivers access the config space before
> > FEATURES_OK is set.
> > 
> > The most important part that is missing here is fixing all the problems
> > that arise in the situation described in the previous paragraph, when
> > the config is managed by a vhost device (and thus outside QEMU. This
> > series tackles this problem only for virtio_net+vhost as an example. If
> > this approach is deemed good, we need to do something very similar for
> > every single affected device.
> > 
> > This series was only lightly tested. The vhost stuff is entirely
> > untested, unfortunately I don't have a working setup where this
> > handling would be needed (because the config space is handled in the
> > device). DPDK is not supported on s390x so at the moment I can't test
> > DPDK based setups.   
> 
> So this looks sane to me. Cornelia requested some name tweaks and we
> need to add vhost-user things and more devices, but otherwise we are
> good.

Thanks for your feedback! There were several points where I could
not reach agreement with Cornelia. From your response I recon that:

1) I should rename virtio_force_modern() to virtio_indicate_modern()
(per maintainer request).
2) Keep the call to virtio_set_features()?

Is that right?

Regards,
Halil



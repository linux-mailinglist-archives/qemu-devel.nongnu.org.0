Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 979E5421F6D
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 09:27:59 +0200 (CEST)
Received: from localhost ([::1]:59858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXerm-0000Y3-EU
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 03:27:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mXeqI-00078t-QA
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 03:26:26 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:14530
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mXeqG-0004WF-Kx
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 03:26:26 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1956ai5K006023; 
 Tue, 5 Oct 2021 03:26:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=PRP3XC71ks3K/eXBA18uRQOABwYCF7SJb1De18qjsI0=;
 b=B0zQGKwYXq/xvgHfidZgWFo4IinBnF1pcAonlgvF5Rf/S5J0EldeFfKYYpHTIsLddsID
 E97ajKbpUwSI0gSLsLNIZjsVqowHkJEEM/BgiQa8G4cPt3w3UJ5fQVayTmiR17kxiq0w
 PkgcNiY3mZKKi7fE7RhWYLtZ5jiAiXM4vZnY1C8nj798U08aGKqjW9AMhOodBz42n50G
 fGKmvrP+W2jFjEhzLGVi8CuwQLqDet2QRZppPy6kwOkqPPZuMUqk3IoX+TquTy/I38cd
 p+9HBJjBbQTF4FjmF8bV7mrnFwbWX9yO8yFUq68QjUskJwL88i3qOo9z+gdQX2Jjf8pE UA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bggbcten4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 03:26:19 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1956uC8E006135;
 Tue, 5 Oct 2021 03:26:19 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bggbctemm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 03:26:19 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1957DFGn009790;
 Tue, 5 Oct 2021 07:26:17 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma01fra.de.ibm.com with ESMTP id 3bef29n7ca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 07:26:16 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1957KnR646334430
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 Oct 2021 07:20:49 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB77DA4060;
 Tue,  5 Oct 2021 07:26:05 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3EC9DA4066;
 Tue,  5 Oct 2021 07:26:01 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.45.119])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  5 Oct 2021 07:26:00 +0000 (GMT)
Date: Tue, 5 Oct 2021 09:25:39 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC PATCH 1/1] virtio: write back features before verify
Message-ID: <20211005092539.145c9cc4.pasic@linux.ibm.com>
In-Reply-To: <20211004090018-mutt-send-email-mst@kernel.org>
References: <20210930012049.3780865-1-pasic@linux.ibm.com>
 <20210930070444-mutt-send-email-mst@kernel.org>
 <20211001092125.64fef348.pasic@linux.ibm.com>
 <20211002055605-mutt-send-email-mst@kernel.org>
 <87bl452d90.fsf@redhat.com>
 <20211004090018-mutt-send-email-mst@kernel.org>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -F2P042FRLjgFARHmllaFsm-zqvz094d
X-Proofpoint-ORIG-GUID: xxy95EbSVU-JOjLT_dASGOoXfDN5fZVl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-04_05,2021-10-04_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110050040
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: linux-s390@vger.kernel.org, markver@us.ibm.com,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Halil Pasic <pasic@linux.ibm.com>, Xie Yongji <xieyongji@bytedance.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 4 Oct 2021 09:11:04 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> > >> static inline bool virtio_access_is_big_endian(VirtIODevice *vdev)
> > >> {
> > >> #if defined(LEGACY_VIRTIO_IS_BIENDIAN)
> > >>     return virtio_is_big_endian(vdev);
> > >> #elif defined(TARGET_WORDS_BIGENDIAN)
> > >>     if (virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
> > >>         /* Devices conforming to VIRTIO 1.0 or later are always LE. */
> > >>         return false;
> > >>     }
> > >>     return true;
> > >> #else
> > >>     return false;
> > >> #endif
> > >> }
> > >>   
> > >
> > > ok so that's a QEMU bug. Any virtio 1.0 and up
> > > compatible device must use LE.
> > > It can also present a legacy config space where the
> > > endian depends on the guest.  
> > 
> > So, how is the virtio core supposed to determine this? A
> > transport-specific callback?  
> 
> I'd say a field in VirtIODevice is easiest.

Wouldn't a call from transport code into virtio core
be more handy? What I have in mind is stuff like vhost-user and vdpa. My
understanding is, that for vhost setups where the config is outside qemu,
we probably need a new  command that tells the vhost backend what
endiannes to use for config. I don't think we can use
VHOST_USER_SET_VRING_ENDIAN because  that one is on a virtqueue basis
according to the doc. So for vhost-user and similar we would fire that
command and probably also set the filed, while for devices for which
control plane is handled by QEMU we would just set the field.

Does that sound about right?




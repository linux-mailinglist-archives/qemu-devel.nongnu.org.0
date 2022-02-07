Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEBE4ABC6C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 12:48:01 +0100 (CET)
Received: from localhost ([::1]:41442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH2Uy-0001pQ-Ij
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 06:48:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nH2E7-0006XV-4w; Mon, 07 Feb 2022 06:30:35 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:41254
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nH2E1-0001Ci-IA; Mon, 07 Feb 2022 06:30:31 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 217B3nhn019964; 
 Mon, 7 Feb 2022 11:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=MvVZ4appO3O810CUERBkyHHiK8/0W6rIvOfUZah+V20=;
 b=mjZbTB1aj9SOsSx1MZt4rLb1zkNOGVSV1ZYHt0gJnm4JQJMri7+tSxIWU9yzumQt9gn5
 8VqzFlVDrFpxNLwLl8e39KFK7Q1bA5DxDexuwsVl3SyTTaLgi83C5EwtDHVnWCc5OYHg
 UnG+ose9LBzh436IBqJWBoyg7zvB1abq25fIFt3/yxD9Ccdrl64CvahJyCJ6aomOOKb8
 MLhPLALBNoxfO2A1H9xy4zjgEwXEYgqT2ydWlQixSgB7eFkfcciFIgmC6dsZnIiXUiMQ
 Ka4vANLWBbHMA4lO8OHyeqJbbbQoiN+SzfJ0GLt2wXeld0zzzSPKXdYSYiSv/1kD7LEh aA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e22kpsxj9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 11:30:25 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 217AGVbH026912;
 Mon, 7 Feb 2022 11:30:25 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e22kpsxhe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 11:30:25 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 217BIFdj030690;
 Mon, 7 Feb 2022 11:30:23 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06fra.de.ibm.com with ESMTP id 3e1gghtumk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 11:30:23 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 217BUKjD39387576
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Feb 2022 11:30:20 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C353C52050;
 Mon,  7 Feb 2022 11:30:20 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.70.169])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 492BF52052;
 Mon,  7 Feb 2022 11:30:20 +0000 (GMT)
Date: Mon, 7 Feb 2022 12:30:17 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v4 1/1] virtio: fix the condition for iommu_platform not
 supported
Message-ID: <20220207123017.3d8a2ca8.pasic@linux.ibm.com>
In-Reply-To: <20220204201506-mutt-send-email-mst@kernel.org>
References: <20220202195438.379753-1-pasic@linux.ibm.com>
 <20220203170635.1dd2b98d.pasic@linux.ibm.com>
 <20220204080404-mutt-send-email-mst@kernel.org>
 <20220205010205.17e1de76.pasic@linux.ibm.com>
 <20220204201506-mutt-send-email-mst@kernel.org>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4iGhCvoJ6EsJXNXyRVTuFC7NKq-a1Z22
X-Proofpoint-ORIG-GUID: UYnM8vbMXZ_ivTsFyoYisk_1d1XhqPxo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_03,2022-02-07_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 suspectscore=0
 mlxlogscore=989 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202070072
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Jason Wang <jasowang@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Jakob Naucke <Jakob.Naucke@ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Feb 2022 20:15:27 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Sat, Feb 05, 2022 at 01:02:05AM +0100, Halil Pasic wrote:
> > On Fri, 4 Feb 2022 08:05:25 -0500
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >   
> > > On Thu, Feb 03, 2022 at 05:06:35PM +0100, Halil Pasic wrote:  
> > > > On Wed,  2 Feb 2022 20:54:38 +0100
> > > > Halil Pasic <pasic@linux.ibm.com> wrote:
> > > >     
> > > > >      }
> > > > > @@ -82,9 +78,14 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
> > > > >          return;
> > > > >      }
> > > > >  
> > > > > +    vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> > > > >      if (klass->get_dma_as != NULL && has_iommu) {
> > > > >          virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
> > > > >          vdev->dma_as = klass->get_dma_as(qbus->parent);
> > > > > +        if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
> > > > > +            error_setg(errp,
> > > > > +                       "iommu_platform=true is not supported by the device");
> > > > > +        }    
> > > > 
> > > > I'm wondering, would it be wise to change the message? Since this is now
> > > > dependent on the VM/bus the device is plugged into the message might be a
> > > > little misleading: i.e. the very same device could work perfectly fine
> > > > with iommu_platform=true if the "surroundings" are different.
> > > > 
> > > > Maybe "the device has no IOMMU support (iommu_platform=true)" would be a
> > > > better option. On the other hand changing the message has its downsides
> > > > as well.    
> > > 
> > > I personally don't care much frankly.
> > >   
> > > > Also I realized that keeping the return after error_setg() might have
> > > > been a good idea for the case more logic is added at the end of the
> > > > function.    
> > > 
> > > OK so you are sending v5 with this change then?  
> > 
> > As stated below, I would prefer to get this merged. If I change the
> > message, I guess I have to drop the r-b's and the I'm sure the if
> > somebody decides to add logic to the end of the function that person
> > will be careful enough.  
> 
> yes but you wrote about return after error_setg above.
> 

I've sent a v5 with the extra return. Please pick v5 or v4 whichever you
prefer :D

Cheers,
Halil


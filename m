Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6662248EE04
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 17:22:34 +0100 (CET)
Received: from localhost ([::1]:48428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8PLV-0005dM-HL
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 11:22:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1n8P65-0003FH-Qj; Fri, 14 Jan 2022 11:06:48 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48854
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1n8P5j-0005CT-Cm; Fri, 14 Jan 2022 11:06:17 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20EG16Q7018995; 
 Fri, 14 Jan 2022 16:06:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=Pd/D5dsKHkE98u+WDFPtCg+ApHQW5zPfUfWz7UCnag4=;
 b=SBQkWqTOYy5WFHDEYkxqjftn+H6XJTFoxBwGggl6A/CylnNqVkb4OMxpcx2GCc8QApWg
 lAxtjauCXIrAQiGwawBkRfw6tEjb2t9hFOwA1x7znBumeskHkrNZpq37uvo8OVYbLCOS
 OyV9f3h3dCaha7Q9V6NAF/P8u2o3V5kyQywSdEUoT0ssfp7cXvGBJsNxxc1Zgo8CyWk9
 4Fibl936HqrG1x317lXtKccNY3f+Ch1EexxnGXXEkMVMczGx4WCSqNiCdoMz9J3FM74C
 A72ZIb4xNStMg+QnnSbDBfTRzbz3H7B3hbEnFMNG+x+GNuvlpAWxrkP/7cdWc3eF87h5 Zw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dkahttna2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jan 2022 16:06:04 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20EG18NV019160;
 Fri, 14 Jan 2022 16:06:04 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dkahttn9j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jan 2022 16:06:04 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20EFwtpK015775;
 Fri, 14 Jan 2022 16:06:02 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 3df1vjyr7t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jan 2022 16:06:02 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20EG60WT47120782
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jan 2022 16:06:00 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00802A405B;
 Fri, 14 Jan 2022 16:06:00 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D586A4064;
 Fri, 14 Jan 2022 16:05:59 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.76.77])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 14 Jan 2022 16:05:59 +0000 (GMT)
Date: Fri, 14 Jan 2022 17:05:56 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 1/1] virtio: fix the condition for iommu_platform not
 supported
Message-ID: <20220114170556.3859488d.pasic@linux.ibm.com>
In-Reply-To: <20220113205452.4443ee4e.pasic@linux.ibm.com>
References: <20220113165131.1057714-1-pasic@linux.ibm.com>
 <20220113115617-mutt-send-email-mst@kernel.org>
 <20220113205452.4443ee4e.pasic@linux.ibm.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: W691alH31wjZRwL2gkGUAu_9qsUKFWCV
X-Proofpoint-ORIG-GUID: JOSpuUepCCYBKK-CUAo7lgkY2w3UyyVI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-14_06,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 adultscore=0 suspectscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=958
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201140107
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Jakob Naucke <Jakob.Naucke@ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 13 Jan 2022 20:54:52 +0100
Halil Pasic <pasic@linux.ibm.com> wrote:

> > > This is the very reason for which commit 7ef7e6e3b ("vhost: correctly
> > > turn on VIRTIO_F_IOMMU_PLATFORM") for, which fences _F_ACCESS_PLATFORM
> > > form the vhost device that does not need it, because on the vhost
> > > interface it only means "I/O address translation is needed".
> > > 
> > > This patch takes inspiration from 7ef7e6e3b ("vhost: correctly turn on
> > > VIRTIO_F_IOMMU_PLATFORM"),    
> > 
> > Strange, I could not find this commit. Did you mean f7ef7e6e3b?
> >   
> 
> Right! Copy-paste error.
> 
> 

Should I spin a v2 to correct this?


Sorry for the hunk below. I wanted to post the  whole patch in question,
then deleted it, but left some leftovers. Another copy-paste error. Grrr

>  
>  static void *vhost_memory_map(struct vhost_dev *dev, hwaddr addr,
> @@ -765,6 +772,9 @@ static int vhost_dev_set_features(struct vhost_dev *dev,
>      if (enable_log) {
>          features |= 0x1ULL << VHOST_F_LOG_ALL;
>      }
> +    if (!vhost_dev_has_iommu(dev)) {
> +        features &= ~(0x1ULL << VIRTIO_F_IOMMU_PLATFORM);
> +    }
>      r = dev->vhost_ops->vhost_set_features(dev, features);
>      if (r < 0) {
>          VHOST_OPS_DEBUG("vhost_set_features failed");
> 
> > > and uses the same condition for detecting the


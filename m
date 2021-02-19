Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8974831F6AF
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 10:45:36 +0100 (CET)
Received: from localhost ([::1]:56424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD2Lv-0001T1-Fx
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 04:45:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lD2Jf-0000c9-HY; Fri, 19 Feb 2021 04:43:15 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:54058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lD2JW-0006Nl-Qt; Fri, 19 Feb 2021 04:43:13 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11J9X9KO004202; Fri, 19 Feb 2021 04:43:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=XOalQFU+Uh9HXxT1LRHF5JdlDG6D69yiRwIKIIGF374=;
 b=TeJW5WhDAnx9VYO/WZp0VJBPOJQslreS1wZ50GMaSgelkNry1vSoDCMAaNd5GiKDummx
 08PJzYvDPrMqLokTLE2uCfM7b84wDDhbTRXOXX+PecYtDQiEsWwNWe3DfTYCBVDVXYbp
 r0l5fUIAV8MHqZLr6IWz55Y8WNgqHaEODHmUhcPey6a9c+2WVhid0HETEij6l6DVfGdj
 L31HvdxBPMCIzQIFgPcbIS3jdbGiT+0lAjpBXcS3kj4V3HemVntV/OL2Ovef6SH76YBT
 72i6VVz77I3ok5z1BVkGtyXbwA9zeVrxexu9KiH6pYztN9fk2ZdU4Xo3f1JOT6QNfu1G Mw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36ta2t9u2r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Feb 2021 04:43:02 -0500
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 11J9b0Qs020326;
 Fri, 19 Feb 2021 04:43:02 -0500
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36ta2t9u1r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Feb 2021 04:43:02 -0500
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11J9gcOj008732;
 Fri, 19 Feb 2021 09:42:59 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma05fra.de.ibm.com with ESMTP id 36p6d8juer-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Feb 2021 09:42:59 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11J9gu9459638264
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Feb 2021 09:42:56 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 71AE6A4051;
 Fri, 19 Feb 2021 09:42:56 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A88B2A4040;
 Fri, 19 Feb 2021 09:42:55 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.71.158])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 19 Feb 2021 09:42:55 +0000 (GMT)
Date: Fri, 19 Feb 2021 10:42:52 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 1/1] hw/s390x: modularize virtio-gpu-ccw
Message-ID: <20210219104252.38feac7c.pasic@linux.ibm.com>
In-Reply-To: <20210219084545.stb4wjn6ggwent4g@sirius.home.kraxel.org>
References: <20210218022227.979741-1-pasic@linux.ibm.com>
 <6c0f5acf-9ebb-ba04-1389-c6690796a6ad@redhat.com>
 <20210218113438.3fe80078.pasic@linux.ibm.com>
 <20210218135618.06532573.cohuck@redhat.com>
 <20210218133820.cflf455nj44mxzja@sirius.home.kraxel.org>
 <20210219035206.730f145e.pasic@linux.ibm.com>
 <20210219084545.stb4wjn6ggwent4g@sirius.home.kraxel.org>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-19_04:2021-02-18,
 2021-02-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102190073
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Boris Fiuczynski <fiuczy@linux.ibm.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Bruce Rogers <brogers@suse.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 19 Feb 2021 09:45:45 +0100
Gerd Hoffmann <kraxel@redhat.com> wrote:

> > but that "fixes" s390x at the expense
> > of breaking all the other targets. For example:
> > ./qemu-system-x86_64 -device help
> > Type 'virtio-gpu-ccw' is missing its parent 'virtio-ccw-device'
> > Aborted  
> 
> Hmm, this is a new failure variant.  In the PCI case (see other mail)
> the module doesn't load in the first place due to missing symbols.
> 
> Maybe we need a type_register_mayfail() variant which doesn't abort in
> case the parent isn't found (see also commit
> 501093207eb1ed4845e0a65ee1ce7db7b9676e0b).

I was also thinking along the same lines last night, and came up with
this workaround:

diff --git a/hw/s390x/virtio-ccw-gpu.c b/hw/s390x/virtio-ccw-gpu.c
index c301e2586b..bbe591cd62 100644
--- a/hw/s390x/virtio-ccw-gpu.c
+++ b/hw/s390x/virtio-ccw-gpu.c
@@ -62,7 +62,16 @@ static const TypeInfo virtio_ccw_gpu = {
 
 static void virtio_ccw_gpu_register(void)
 {
+#ifdef CONFIG_MODULES
+    /*
+     * Ugly hack: Avoid targets that don't have it aborting when this module
+     * is loaded.
+    if (object_class_by_name(TYPE_VIRTIO_CCW_DEVICE)) {
+        type_register_static(&virtio_ccw_gpu);
+    }
+#else
     type_register_static(&virtio_ccw_gpu);
+#endif
 }
 
 type_init(virtio_ccw_gpu_register)

but then I decided it is too ugly to post. Something like
type_register_mayfail() would be certainly nicer, although I would still
prefer the failing type register if the device ain't built as a module.

Today I'm on a vacation so I will pick this up again next week. I will
also think some more of how the situation with virtio-ccw compares to pci
with respect to modularization.

Regards,
Halil


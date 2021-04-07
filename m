Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D1C35737B
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 19:49:06 +0200 (CEST)
Received: from localhost ([::1]:49704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUCIb-0001FP-Nw
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 13:49:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lUCGz-0007wl-BO; Wed, 07 Apr 2021 13:47:25 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:6924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lUCGw-00028m-J5; Wed, 07 Apr 2021 13:47:25 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 137HXLiG010665; Wed, 7 Apr 2021 13:47:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=eHRfPDd4g7MtMgDTUJmmHQPbHSpFJnO2G9F3Y8wu6TM=;
 b=qAGlKKXM+GsBFsO4Ml90JuePEAF1F3nxGfG85JJxxU6egdtaylaHyfNuyO4KRdLoSZR3
 H5CsruJd3paLa9ocGbKSpJBvRxwQwG020pEYQYoMutVVNSP9GvlMOSlTIQMSgAwgQxrT
 cCTzfs5VxFb6QGgDlAhybZrbfB9qr9alPYhmvEFKL4Og9KN7JhS7yk4Y6qAiBgRSTkTG
 z3/us41zErsKljgHaHHmHlDj92tx+3dFkrkMZylWoaAZn95XLKcC9wQc3v35nRjNvxBd
 DIQZEX+s13H0A+ZEtfcz9y/51SKc1dDqBZn4FT8epaDB23SS4FgaG+WjbtUeeDhBEKGL Bw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37rw6khcv6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 13:47:19 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 137HXcVv011216;
 Wed, 7 Apr 2021 13:47:19 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37rw6khcud-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 13:47:19 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 137HlGeM007580;
 Wed, 7 Apr 2021 17:47:17 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 37rvbw8wpx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 17:47:16 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 137HlEZr38797812
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Apr 2021 17:47:14 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1D90252059;
 Wed,  7 Apr 2021 17:47:14 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.56.50])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 1C7E452052; 
 Wed,  7 Apr 2021 17:47:13 +0000 (GMT)
Date: Wed, 7 Apr 2021 19:47:11 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Pierre Morel <pmorel@linux.ibm.com>
Subject: Re: [PATCH v1 1/1] s390x: css: report errors from
 ccw_dstream_read/write
Message-ID: <20210407194711.459176c3.pasic@linux.ibm.com>
In-Reply-To: <1617695053-7328-2-git-send-email-pmorel@linux.ibm.com>
References: <1617695053-7328-1-git-send-email-pmorel@linux.ibm.com>
 <1617695053-7328-2-git-send-email-pmorel@linux.ibm.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uyZk2lLG4k85uzbhcEeZJoCknhlxCOEv
X-Proofpoint-ORIG-GUID: x_OiCVar_TH6aUe-I-bOS9MSl4-4lDWj
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-07_09:2021-04-07,
 2021-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 mlxlogscore=999
 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104070120
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pasic@linux.ibm.com;
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
Cc: thuth@redhat.com, frankja@linux.ibm.com, david@redhat.com,
 cohuck@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, mst@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, imbrenda@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue,  6 Apr 2021 09:44:13 +0200
Pierre Morel <pmorel@linux.ibm.com> wrote:

> ccw_dstream_read/write functions returned values are sometime
> not taking into account and reported back to the upper level
> of interpretation of CCW instructions.


The return values of ccw_dstream_write/read were intentionally ignored
in commit f57ba05823 ("virtio-ccw: use ccw data stream") to avoid
changes in behavior that wound not contribute to the objective of the
patch-set, like silently doing more error checking and handling.

If we consider the first hunk:


--- a/hw/s390x/virtio-ccw.c
+++ b/hw/s390x/virtio-ccw.c
@@ -289,49 +289,19 @@ static int virtio_ccw_handle_set_vq(SubchDev *sch, CCW1 ccw, bool check_len,
         return -EFAULT;
     }
     if (is_legacy) {
-        linfo.queue = address_space_ldq_be(&address_space_memory, ccw.cda,
-                                           MEMTXATTRS_UNSPECIFIED, NULL);
-        linfo.align = address_space_ldl_be(&address_space_memory,
-                                           ccw.cda + sizeof(linfo.queue),
-                                           MEMTXATTRS_UNSPECIFIED,
-                                           NULL);
-        linfo.index = address_space_lduw_be(&address_space_memory,
-                                            ccw.cda + sizeof(linfo.queue)
-                                            + sizeof(linfo.align),
-                                            MEMTXATTRS_UNSPECIFIED,
-                                            NULL);
-        linfo.num = address_space_lduw_be(&address_space_memory,
-                                          ccw.cda + sizeof(linfo.queue)
-                                          + sizeof(linfo.align)
-                                          + sizeof(linfo.index),
-                                          MEMTXATTRS_UNSPECIFIED,
-                                          NULL);
+        ccw_dstream_read(&sch->cds, linfo);
+        be64_to_cpus(&linfo.queue);
+        be32_to_cpus(&linfo.align);
+        be16_to_cpus(&linfo.index);
+        be16_to_cpus(&linfo.num);

we can see, that the original code did not contain any error checking regarding
the invalidity of the guest physical address.

What was the behavior there? The last argument of address_space_* where we pass
the NULL is actually an optional pointer to the MemTxResult, which would tell
us if the operation succeeded or failed. Passing NULL there means, we don't care.

My guess is that when those loads fail (or the read fails) we will just carry on
with the garbage we found on the stack.

So this begs the question, do we need this fixed for old releases as well?

My answer is yes we do. Conny what do you think?

Regards,
Halil



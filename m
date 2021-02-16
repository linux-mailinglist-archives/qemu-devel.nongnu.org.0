Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A193C31CEEF
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 18:24:37 +0100 (CET)
Received: from localhost ([::1]:58956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC45U-0000Ay-Mf
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 12:24:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lC3tH-0003No-5p; Tue, 16 Feb 2021 12:11:59 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:4326
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lC3tE-0003qI-5b; Tue, 16 Feb 2021 12:11:58 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11GH3AeE036571; Tue, 16 Feb 2021 12:11:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=Qly56iPF/VO1qx4llxSo4EsJmlB5FJpb6/wLjI6aFGc=;
 b=OC+6UZvqzaKrpI1M6aREMJ1aqvEwQmi2S8aVGcKtx9OPt/1eSZvHzJCNiJtY5MjdUJIX
 /k6hcHhr4CKTaYHfF1oKAjxc7kCfV5hWf1YGZ9XN+DKbCT8mzfwxcwVpMS3L7ysjsOFG
 B6lqWeKVyctsSoKzZ11QAtGF6lDoBLVu/+afCCxnA9obhpLegKYMsVV7LzhQqvhDoVLr
 ioWyqd3e/ez/bpLGjRENFvwkYKfJSmdV2HNP2MwZB6+F5tTnzJMM1i7CbVWq5xVa6Kat
 1f1OSGiTpVCeEfpqExd0Pr3LWReZvGX4pRieTStl5NGu5AjlQb+VfePb1oU1JJkI2/Ov Ow== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36rhf19um2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Feb 2021 12:11:54 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 11GHB7jb078089;
 Tue, 16 Feb 2021 12:11:53 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36rhf19uk4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Feb 2021 12:11:53 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11GH3hFR031372;
 Tue, 16 Feb 2021 17:11:52 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 36p6d8ay3g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Feb 2021 17:11:52 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11GHBnnO63242662
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Feb 2021 17:11:50 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C62F2A405B;
 Tue, 16 Feb 2021 17:11:49 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 668EDA4054;
 Tue, 16 Feb 2021 17:11:49 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.71.158])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 16 Feb 2021 17:11:49 +0000 (GMT)
Date: Tue, 16 Feb 2021 18:11:46 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] pc-bios/s390-ccw: Use memory barriers in virtio code
Message-ID: <20210216181146.54370a29.pasic@linux.ibm.com>
In-Reply-To: <72e9a5b3-dd88-85de-e4a8-88a6a9c45099@redhat.com>
References: <20210216110056.1228582-1-thuth@redhat.com>
 <20210216154010.3691880f.pasic@linux.ibm.com>
 <72e9a5b3-dd88-85de-e4a8-88a6a9c45099@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-16_07:2021-02-16,
 2021-02-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 spamscore=0 clxscore=1015 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102160146
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Feb 2021 17:15:19 +0100
Thomas Huth <thuth@redhat.com> wrote:

> >> (Note: The virtio spec also talks about using a memory barrier
> >> *after* incrementing the idx field, but if I understood correctly
> >> this is only required when using notification suppression - which
> >> we don't use in the s390-ccw bios here)  
> > 
> > I suggest to the barrier after incrementing the idx field for two
> > reasons. First: If the device were to see the notification, but
> > not see the incremented idx field, it would effectively loose
> > initiative. That is pretty straight forward, because the
> > notification just says 'check out that queue', and if we don't
> > see the incremented index, miss the buffer that was made available
> > by incrementing idx.  
> 
> I was just about to reply that this is certainly not necessary, since
> the DIAGNOSE instruction that we use for the notification hypercall
> should be serializing anyway ... but after looking at the PoP, it
> actually is not marked as a serializing instruction! (while e.g.
> SVC - supervisor call - is explicitly marked as serializing)

I was talking about whether a suitable barrier is needed, from
virtio perspective. How the suitable barrier is put in place is a
different issue.

Regards,
Halil


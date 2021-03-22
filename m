Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D4F344533
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 14:15:17 +0100 (CET)
Received: from localhost ([::1]:44458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOKOp-0003S4-K2
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 09:15:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lOKMf-0002Jq-0O; Mon, 22 Mar 2021 09:13:01 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:61556
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lOKMd-0000cr-9d; Mon, 22 Mar 2021 09:13:00 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12MD3XjA160451; Mon, 22 Mar 2021 09:12:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=etKoyiVBUsYhYlaJyU2TOcAeBun97LCqc3RETgyOxjc=;
 b=rvD8EHKd5/UsvH9zMSqbk+qXIPw3/iqV390r9GFg16RZUn1Gj7vdu6W2flExVyofELAd
 Q3laarkjbx1L+3H//qnsvQZ+aqmfzZJd+av1qJGIYDcP6e2KMnKJqB4xPCfNYMzhvRck
 CSe6nD+2v3dk6+ahdH70ua5DVUZFqV7fW6wJcaJCk5kgWjDXO8eb6FEAUb38gttzUM1z
 ZZ6i7sEkOh3ZsIgKJ45hALUImlM5Sy911FUW1y90039OF+u4NHgev1urQky1DDQ9jLOO
 NGgD0+upl4VH9RbbwQKs3W1+n9JWKYIYJcbsB/HoDS7V9Ti7Wr1+VT+Ti+2znC10SAkr cw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37eb1pcqvj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Mar 2021 09:12:56 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12MD3iKY161374;
 Mon, 22 Mar 2021 09:12:55 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37eb1pcqum-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Mar 2021 09:12:55 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12MD7NgB013363;
 Mon, 22 Mar 2021 13:12:53 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma01fra.de.ibm.com with ESMTP id 37d99xh7pb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Mar 2021 13:12:53 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12MDCpN318874824
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Mar 2021 13:12:51 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EC1F311C064;
 Mon, 22 Mar 2021 13:12:50 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4035111C054;
 Mon, 22 Mar 2021 13:12:50 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.57.111])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 22 Mar 2021 13:12:50 +0000 (GMT)
Date: Mon, 22 Mar 2021 14:12:48 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 0/3] s390x: modularize virtio-gpu-ccw
Message-ID: <20210322141248.031f7538.pasic@linux.ibm.com>
In-Reply-To: <20210317095622.2839895-1-kraxel@redhat.com>
References: <20210317095622.2839895-1-kraxel@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-22_07:2021-03-22,
 2021-03-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103220093
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 17 Mar 2021 10:56:19 +0100
Gerd Hoffmann <kraxel@redhat.com> wrote:

> Maybe not the most elegant but rather simple approach to the "parent
> object missing" problem: Use a symbol reference to make sure ccw modules
> load only in case ccw support is present.

[..]

Hi Gerd! I've tested this and I think mostly does what it should. The
only thing that I'm inclined to consider a little quirky is the first
message:

$ ./qemu-system-x86_64 -device virtio-gpu-ccw
Failed to open module: /home/pasic/build/qemu/hw-s390x-virtio-gpu-ccw.so: undefined symbol: have_virtio_ccw
qemu-system-x86_64: -device virtio-gpu-ccw: 'virtio-gpu-ccw' is not a valid device model name

But with something like --help we don't see it, and I assume neither do
we when probing, because there the modules are loaded with mayfail. So
for me this is acceptable, because it happens only if one tries to use a
device that ain't advertised.

Compared to Daniels suggestion, I find that one conceptually clearer,
and even more flexible. Implementation-wise I find this patch-set
simpler. I don't know how would it scale to modules depending on modules
(and it feels a little hackish), but we can address such problems as they
emerge if they emerge, so I did not think too hard.

Let me also note, that you took authorship of all three patches, which
I'm fine with. All I really care about at this stage is getting this
fixed in a remotely sane way, and this is definitely one. I'm also
willing to invest more work in that symlink based approach, if that is
what the community wants, but I would prefer this fixed as soon as
possible.

If you keep the authorship for all the patches, I would like to offer:
Reviewed-by: Halil Pasic <pasic@linux.ibm.com>
Tested-by: Halil Pasic <pasic@linux.ibm.com>
for all three patches. (If I'm going to be the author of some of the
patches, those tags don't make sense for those).

Thanks for your work!

Regards,
Halil


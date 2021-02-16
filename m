Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3A931CC36
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 15:42:15 +0100 (CET)
Received: from localhost ([::1]:52060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC1YM-00085S-GK
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 09:42:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lC1Wa-000737-HH; Tue, 16 Feb 2021 09:40:24 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lC1WY-0003WJ-Ec; Tue, 16 Feb 2021 09:40:24 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11GEY8XV104148; Tue, 16 Feb 2021 09:40:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=+Jev2TFzbfp8s4vupt5NanNGQVYYQwLjM0yWsh5F42M=;
 b=U1z/WYiNTyeBoj/kK/MYC5ZftZ4I1tcdF49B2qFJAN/eEZLmMFNMXc0awAqH7rd+6jdZ
 bfaPKZv9/ZOyeylrvKHnLEMU9UO3sx/mv+0txsZDSrVokJXoByPbL56K4idtXAfYyY+O
 3fK7JVGzT2yu1gneTK9AfFclBdW4HlP4OZxBLsXzFfXdaRUuwOKNQuZqawRt5HVN3MvV
 piLt4C12mtxy/Le24/EPw8os/9sOrgKCcsUcXp7nI2J7o2+2jAAQp4kLBvgJSh4afEuH
 8Ssnwv26gs6PP33xB/5bTWGU5eeybI+3O5tyXYnCsNvt284K1EnwOxepdalMmfX18wEQ dg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36rfuw0crn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Feb 2021 09:40:19 -0500
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 11GEYAWF104228;
 Tue, 16 Feb 2021 09:40:18 -0500
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36rfuw0cqc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Feb 2021 09:40:18 -0500
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11GEclUe026860;
 Tue, 16 Feb 2021 14:40:16 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma01fra.de.ibm.com with ESMTP id 36p6d89fkn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Feb 2021 14:40:16 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11GEeEQu20578694
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Feb 2021 14:40:14 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE4B752076;
 Tue, 16 Feb 2021 14:40:13 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.71.158])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 7C90652069;
 Tue, 16 Feb 2021 14:40:13 +0000 (GMT)
Date: Tue, 16 Feb 2021 15:40:10 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] pc-bios/s390-ccw: Use memory barriers in virtio code
Message-ID: <20210216154010.3691880f.pasic@linux.ibm.com>
In-Reply-To: <20210216110056.1228582-1-thuth@redhat.com>
References: <20210216110056.1228582-1-thuth@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-16_04:2021-02-16,
 2021-02-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 clxscore=1015 bulkscore=0 mlxscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102160134
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Feb 2021 12:00:56 +0100
Thomas Huth <thuth@redhat.com> wrote:

> According to the virtio specification, a memory barrier should be
> used before incrementing the idx field in the "available" ring.
> So far, we did not do this in the s390-ccw bios yet, but recently
> Peter Maydell saw problems with the s390-ccw bios when running
> the qtests on an aarch64 host (the bios panic'ed with the message:
> "SCSI cannot report LUNs: response VS RESP=09"), which could
> maybe be related to the missing memory barriers. Thus let's add
> those barriers now. Since we've only seen the problem on TCG so far,
> a "bcr 14,0" should be sufficient here to trigger the tcg_gen_mb()
> in the TCG translate code.
> 
> (Note: The virtio spec also talks about using a memory barrier
> *after* incrementing the idx field, but if I understood correctly
> this is only required when using notification suppression - which
> we don't use in the s390-ccw bios here)

I suggest to the barrier after incrementing the idx field for two
reasons. First: If the device were to see the notification, but
not see the incremented idx field, it would effectively loose
initiative. That is pretty straight forward, because the
notification just says 'check out that queue', and if we don't
see the incremented index, miss the buffer that was made available
by incrementing idx.

Second: We are in the bios, and I hope even an unnecessary barrier
would not hurt us significantly.

Conny, what do you think?

Regards,
Halil


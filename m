Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF0D4F1479
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 14:11:08 +0200 (CEST)
Received: from localhost ([::1]:33498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbLXz-0005us-VI
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 08:11:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1nbLWP-0005Cl-KZ; Mon, 04 Apr 2022 08:09:25 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:40278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1nbLWN-0003Mq-FD; Mon, 04 Apr 2022 08:09:25 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 234AA8l5004672; 
 Mon, 4 Apr 2022 12:09:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=yGuNroklm73JOuwXkhCuQatRkUm7efJqjjFIejZCfgA=;
 b=p6bn/X8Cb6jgPm58gLuJBmJzmlW3MVzHHrqIGIfpjsjFvm4mDA3y0asqjwKhYadfUSyy
 rPm3q1wtYsk/em0nbJBdtGRpp55zajNYoIaJ+VoGdbHvMaSWwbXEy5RrLe1oHOdp9O0O
 8sDU8wPhznPJMu/DFcj2WHQUofoUFKqaL4t2VlU/gL0a33xMRBQfXwWxNWZJ5SowWvJB
 mX4QKdvbohPxL8870MyC4OgTfVwzhU0DFYL2yy7o7l9mIPrM8KrDk8sjvfmC0m1d/JpK
 RDs+psS87aDmKTcaOwCsOwM/EnQy0qyzUt9IED6bj34P+5DmfskF/+tKJHeYkySgtUAx HQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f701s1gdy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Apr 2022 12:09:16 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 234Bie2V022042;
 Mon, 4 Apr 2022 12:09:16 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f701s1gav-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Apr 2022 12:09:15 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 234C21Mh011931;
 Mon, 4 Apr 2022 12:09:09 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 3f6drhkkk7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Apr 2022 12:09:08 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 234C96Oi54526274
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 Apr 2022 12:09:06 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A87EAE053;
 Mon,  4 Apr 2022 12:09:06 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83EA0AE04D;
 Mon,  4 Apr 2022 12:09:05 +0000 (GMT)
Received: from [9.171.47.144] (unknown [9.171.47.144])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  4 Apr 2022 12:09:05 +0000 (GMT)
Message-ID: <76fd645d423ab0e835ef9de37aaeb9d857eae4e8.camel@linux.ibm.com>
Subject: Re: [PATCH] multifd: Copy pages before compressing them with zlib
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Date: Mon, 04 Apr 2022 14:09:05 +0200
In-Reply-To: <YkrUbt8Z+N5uenDT@work-vm>
References: <20220329152123.493731-1-iii@linux.ibm.com>
 <YkrUbt8Z+N5uenDT@work-vm>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: IcurR81Tnv17JKDcnlWJbmOCK_APuZvy
X-Proofpoint-GUID: dO2NtZZ0Y8bfi00ReR_xkg-BOFhox4ev
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-04_05,2022-03-31_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 spamscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204040069
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, thuth@redhat.com,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "Daniel P . =?ISO-8859-1?Q?Berrang=E9?=" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, jinpu.wang@ionos.com,
 s.reiter@proxmox.com, Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 peterx@redhat.com, qemu-s390x@nongnu.org,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philippe.mathieu.daude@gmail.com>,
 hreitz@redhat.com, f.ebner@proxmox.com,
 Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2022-04-04 at 12:20 +0100, Dr. David Alan Gilbert wrote:
> * Ilya Leoshkevich (iii@linux.ibm.com) wrote:
> > zlib_send_prepare() compresses pages of a running VM. zlib does not
> > make any thread-safety guarantees with respect to changing
> > deflate()
> > input concurrently with deflate() [1].
> > 
> > One can observe problems due to this with the IBM zEnterprise Data
> > Compression accelerator capable zlib [2]. When the hardware
> > acceleration is enabled, migration/multifd/tcp/zlib test fails
> > intermittently [3] due to sliding window corruption.
> > 
> > At the moment this problem occurs only with this accelerator, since
> > its architecture explicitly discourages concurrent accesses [4]:
> > 
> >     Page 26-57, "Other Conditions":
> > 
> >     As observed by this CPU, other CPUs, and channel
> >     programs, references to the parameter block, first,
> >     second, and third operands may be multiple-access
> >     references, accesses to these storage locations are
> >     not necessarily block-concurrent, and the sequence
> >     of these accesses or references is undefined.
> > 
> > Still, it might affect other platforms due to a future zlib update.
> > Therefore, copy the page being compressed into a private buffer
> > before
> > passing it to zlib.
> 
> While this might work around the problem; your explanation doesn't
> quite
> fit with the symptoms; or if they do, then you have a separate
> problem.
> 
> The live migration code relies on the fact that the source is running
> and changing it's memory as the data is transmitted; however it also
> relies on the fact that if this happens the 'dirty' flag is set
> _after_
> those changes causing another round of migration and retransmission
> of
> the (now stable) data.
> 
> We don't expect the load of the data for the first page write to be
> correct, consistent etc - we just rely on the retransmission to be
> correct when the page is stable.
> 
> If your compressor hardware is doing something undefined during the
> first case that's fine; as long as it works fine in the stable case
> where the data isn't changing.
> 
> Adding the extra copy is going to slow everyone else dowmn; and since
> there's plenty of pthread lockingin those multifd I'm expecting them
> to get reasonably defined ordering and thus be safe from multi
> threading
> problems (please correct us if we've actually done something wrong in
> the locking there).
> 
> IMHO your accelerator when called from a zlib call needs to behave
> the same as if it was the software implementation; i.e. if we've got
> pthread calls in there that are enforcing ordering then that should
> be
> fine; your accelerator implementation needs to add a barrier of some
> type or an internal copy, not penalise everyone else.
> 
> Dave

The problem with the accelerator is that during the first case the
internal state might end up being corrupted (in particular: what goes
into the deflate stream differs from what goes into the sliding
window). This may affect the data integrity in the second case later
on.

I've been trying to think what to do with that, and of course doing an
internal copy is one option (a barrier won't suffice). However, I
realized that zlib API as documented doesn't guarantee that it's safe
to change input data concurrently with compression. On the other hand,
today's zlib is implemented in a way that tolerates this.

So the open question for me is, whether we should honor zlib
documentation (in which case, I would argue, QEMU needs to be changed)
or say that the behavior of today's zlib implementation is more
important (in which case accelerator code needs to change). I went with
the former for now, but the latter is of course doable as well.


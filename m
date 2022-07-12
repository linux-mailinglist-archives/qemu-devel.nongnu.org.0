Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE1D571787
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 12:47:05 +0200 (CEST)
Received: from localhost ([::1]:44732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBDQ0-0004TQ-2B
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 06:47:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oBD9l-0007Ct-4F; Tue, 12 Jul 2022 06:30:19 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:6636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oBD9i-00081Q-P8; Tue, 12 Jul 2022 06:30:16 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26C9gIPj022936;
 Tue, 12 Jul 2022 10:30:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=LaGaCq66NuQ2zNCT7fATPTrCZ/3Qc5W+IieKr7aB8bA=;
 b=JCfy9kQGraGWMYJwJx3Gst0bmUB1IdbZqWSm+m4Q3B+scy6smPRtQXc0OYheKeDuNbqz
 3mDsybyS2AyfOxUpgTlHik4pKFskmz9L3RqHN+L9mm5rd/On3bIIUpHyVDIEdo/L9aEd
 oRf+2cupCXf0pgq6GdWVEE7lwTULKEgLtXqdZRlJDBcJqhwJUD+3u2gYRGC/Nwlr7Bls
 IvPWjkk+f1v5etXXq6V9Fr4K1/1yc7INTXGBONVvw8n4E64aQGRy5SFlJaTpt9gwCt1o
 RM+8bWgSGQlECrLxZyMgE1IzwaWPI0DMcACi37+Z7B7QQY3d0XdtaGeixffdnEdRbDxI 9A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h96j414yw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jul 2022 10:30:11 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26C9gjLN024048;
 Tue, 12 Jul 2022 10:30:10 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h96j414xv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jul 2022 10:30:10 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26CALfUQ031242;
 Tue, 12 Jul 2022 10:30:08 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06fra.de.ibm.com with ESMTP id 3h8ncngbhr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jul 2022 10:30:08 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 26CASa7o21234138
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Jul 2022 10:28:36 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F196AE056;
 Tue, 12 Jul 2022 10:30:05 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC242AE04D;
 Tue, 12 Jul 2022 10:30:04 +0000 (GMT)
Received: from [9.171.48.196] (unknown [9.171.48.196])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 12 Jul 2022 10:30:04 +0000 (GMT)
Message-ID: <555fadfa834be75e117e69f2d3892dab9d937f5d.camel@linux.ibm.com>
Subject: Re: [PATCH 2/3] hw/misc: Add mmio-debug-exit device
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org
Date: Tue, 12 Jul 2022 12:30:04 +0200
In-Reply-To: <2dfdce60-6c8b-4874-a901-01e1ea37d976@redhat.com>
References: <20220711185640.3558813-1-iii@linux.ibm.com>
 <20220711185640.3558813-3-iii@linux.ibm.com>
 <dd9d7b97-88c2-f1c3-8b0a-bb090059b180@linaro.org>
 <832533a5b27c9aee11fea7633ed401e655491d5b.camel@linux.ibm.com>
 <2dfdce60-6c8b-4874-a901-01e1ea37d976@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dQuZj5SNibLOoPGtZQ0bwqourzEtfIPc
X-Proofpoint-ORIG-GUID: Y-8nm9hqeoZmrHi-oAyqBfDamag1sDm9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-12_05,2022-07-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 adultscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207120038
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2022-07-12 at 12:08 +0200, David Hildenbrand wrote:
> On 12.07.22 11:52, Ilya Leoshkevich wrote:
> > On Tue, 2022-07-12 at 10:42 +0530, Richard Henderson wrote:
> > > On 7/12/22 00:26, Ilya Leoshkevich wrote:
> > > > System tests on x86 use isa-debug-exit device in order to
> > > > signal
> > > > success or failure to the test runner. Unfortunately it's not
> > > > easily
> > > > usable on other architectures, since a guest needs to access
> > > > address_space_io, which may not be as straightforward as on
> > > > x86.
> > > > Also, it requires adding ISA bus, which an architecture might
> > > > not
> > > > otherwise need.
> > > > 
> > > > Introduce mmio-debug-exit device, which has the same semantics,
> > > > but
> > > > is
> > > > triggered by writes to memory.
> > > > 
> > > > Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> > > 
> > > You shouldn't need this for s390x, as there are already (at
> > > least)
> > > two other paths to 
> > > qemu_system_shutdown_request.
> > > 
> > > E.g. SIGP, which has a stop option.
> > > 
> > > 
> > > r~
> > > 
> > 
> > I would normally use lpswe + disabled wait, but this always gives
> > me
> > exit status code 0, which doesn't allow easily distinguishing
> > between
> > success and failure.
> > 
> > Code-wise SIGP seems to do roughly the same thing, and a quick
> > experiment with:
> > 
> >     lgfi %r4,-1
> >     lgfi %r5,-1
> >     larl %r6,_cpuaddr
> >     stap 0(%r6)
> >     lh %r6,0(%r6)
> >     nilh %r6,0
> >     sigp %r4,%r6,5
> > _cpuaddr: .short 0
> > 
> > confirmed that we get exit status code 0 as well.
> 
> disabled wait should trigger a qemu_system_guest_panicked().
> 
> But "panic_action == PANIC_ACTION_SHUTDOWN" seems to only make
> qemu_main_loop() return with main_loop_should_exit() == true.
> 
> main/qemu_main will always return 0.
> 
> We could return != 0 on guest panic, but not sure if that could break
> existing scripts. We'd need a new QEMU toggle for that most probably
> ...
> 

I wonder if a device is a cleaner way to solve this? It may be used on
all architectures, so there is no need to invent per-architecture way
to exit with a specific code. Maybe we can even replace Intel's
debugexit with it.


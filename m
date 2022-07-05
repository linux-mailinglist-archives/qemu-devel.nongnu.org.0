Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD0C56788F
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 22:44:16 +0200 (CEST)
Received: from localhost ([::1]:59192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8pP5-0007S0-7O
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 16:44:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1o8pN8-0006SH-GX; Tue, 05 Jul 2022 16:42:14 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:37224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1o8pMy-0005LF-2z; Tue, 05 Jul 2022 16:42:12 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 265KLjRH021869;
 Tue, 5 Jul 2022 20:41:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=T1G3BbbhhDDk2YVwPQoCPdbIZ+cEqo98za2AqV9ULYA=;
 b=Moev2PE0p7uCInBa/Sg6au6sMelZD7rskRwP+7KTWE8qW5CpikrnpQLhAxbJqGGX8Z6x
 zkHGTdyY9lO688eNtCjIxxXo0vwKTneWEuroYKlDQPKfsMHeAFxZV8Uf0M+0wBgU+rpZ
 fXm6Ny7kWcZgq3NBu8dIKvabAUHQE5nrAsxbfW8TTAp7gospjMWYylKZLh25rO19FENv
 CuVEhO/9EP0/iGjDwTDYPjjLMcX5Yhz3YEfgR74BqeMwV4MDtc3Ch+1EHdBu3Ucjdlkh
 a0uq2JkwmaZ3Ik4vd/DUaQ8p468h5tjrMqjP9JM0SbuQefIpCuRUpXwKROCmWpJu4OR5 eQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h4v948c76-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Jul 2022 20:41:57 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 265KLekk021754;
 Tue, 5 Jul 2022 20:41:57 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h4v948c6f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Jul 2022 20:41:56 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 265Kb1YB004470;
 Tue, 5 Jul 2022 20:41:54 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04fra.de.ibm.com with ESMTP id 3h4v6580bt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Jul 2022 20:41:54 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 265KfpMJ24052142
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 Jul 2022 20:41:51 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 383E9A4054;
 Tue,  5 Jul 2022 20:41:51 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D3E2A405B;
 Tue,  5 Jul 2022 20:41:50 +0000 (GMT)
Received: from [9.171.47.233] (unknown [9.171.47.233])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  5 Jul 2022 20:41:50 +0000 (GMT)
Message-ID: <ad7a0620ca3279ab857050b2850f3e1e330539c7.camel@linux.ibm.com>
Subject: Re: [RFC] gitlab: introduce s390x wasmtime job
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "Daniel P." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, Alex
 =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, Thomas Huth
 <thuth@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org, Christian Borntraeger
 <borntraeger@de.ibm.com>, Ulrich Weigand <ulrich.weigand@de.ibm.com>
Date: Tue, 05 Jul 2022 22:41:50 +0200
In-Reply-To: <CAFEAcA_Twju4rnn0f97nEshorwbaDK2n0vcdMXDWcwuuguikzQ@mail.gmail.com>
References: <20220704224844.2903473-1-iii@linux.ibm.com>
 <YsQ1fuMRPpA+9AzX@redhat.com>
 <CAFEAcA-4=A6NWrpCo5=cBO=v2-GVwK+b5RcgFiJcZN6e-Kb=GQ@mail.gmail.com>
 <9dc00e0032b3d753a18f2e9bbec4554402dc6aa4.camel@linux.ibm.com>
 <CAFEAcA_Twju4rnn0f97nEshorwbaDK2n0vcdMXDWcwuuguikzQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2Fr_d3Vk1ViqJ7Bnmp2ipAzyNNHlTd20
X-Proofpoint-GUID: lw6PRfbIFskB_SkjZlW1-67YE9VxLcWa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-05_18,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 clxscore=1015 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207050088
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

On Tue, 2022-07-05 at 15:40 +0100, Peter Maydell wrote:
> On Tue, 5 Jul 2022 at 15:37, Ilya Leoshkevich <iii@linux.ibm.com>
> wrote:
> > 
> > On Tue, 2022-07-05 at 14:57 +0100, Peter Maydell wrote:
> > > On Tue, 5 Jul 2022 at 14:04, Daniel P. Berrangé
> > > <berrange@redhat.com>
> > > wrote:
> > > > If we put this job in QEMU CI someone will have to be able to
> > > > interpret the results when it fails.
> > > 
> > > In particular since this is qemu-user, the answer is probably
> > > at least some of the time going to be "oh, well, qemu-user isn't
> > > reliable
> > > if you do complicated things in the guest". I'd be pretty wary of
> > > our
> > > having
> > > a "pass a big complicated guest code test suite under linux-user
> > > mode"
> > > in the CI path.
> 
> > Actually exercising qemu-user is one of the goals here: just as an
> > example, one of the things that the test suite found was commit
> > 9a12adc704f9 ("linux-user/s390x: Fix unwinding from signal
> > handlers"),
> > so it's not only about the ISA.
> > 
> > At least for s390x, we've noticed that various projects use
> > qemu-user-based setups in their CI (either calling it explicitly,
> > or
> > via binfmt-misc), and we would like these workflows to be reliable,
> > even if they try complicated (within reason) things there.
> 
> I also would like them to be reliable. But I don't think
> *testing* these things is the difficulty: it is having
> people who are willing to spend time on the often quite
> difficult tasks of identifying why something intermittently
> fails and doing the necessary design and implementation work
> to correct the problem. Sometimes this is easy (as in the
> s390 regression above) but quite often it is not (eg when
> multiple threads are in use, or the guest wants to do
> something complicated with clone(), etc).
> 
> thanks
> -- PMM
> 

For what it's worth, we can help analyzing and fixing failures detected
by the s390x wasmtime job. If something breaks, we will have to look at
it anyway, and it's better to do this sooner than later.

Best regards,
Ilya


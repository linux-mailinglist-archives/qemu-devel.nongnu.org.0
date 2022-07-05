Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B742E56714D
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 16:38:58 +0200 (CEST)
Received: from localhost ([::1]:33326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8jhZ-0003XD-QP
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 10:38:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1o8jgB-0002p0-K9; Tue, 05 Jul 2022 10:37:31 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:6530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1o8jfy-0005Nn-FI; Tue, 05 Jul 2022 10:37:31 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 265ELRZq011625;
 Tue, 5 Jul 2022 14:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=OewpMydOnbu9zzV3hwySuEZf/zaN0snpJiVwLVPj7g0=;
 b=hJEK7DXSAjuDKH/YEKwCjIs0/SCw2roW+78VL6ZP0Ix0aSv0g97vss2bMEQ9Is7jz53P
 Hof+rR63hNiLQhBYPtuKyYUBjQz56hVRrWir7iw7CC4BT/vy8Qq4ZFOQTdh4kZfXsSOo
 qnttokmFtI6mvlUzSmSfL0xmKTnqVTeAx4EMxlTf+uDdNXLeqW5GfP6JV2eBYnevaWgl
 QystFLUh7xyLinXlj66SDhT996GWY1fSQk4GJ+KaId4PQLKktDaU3zZQFwC4op8fiBSF
 ke3btJZMSFdiSfuzgS7j7HhReE0AdiA6nlWpIeK7hLAtZUTOrOgRMxa3c93dinWx/CN4 sg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h4q08rde8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Jul 2022 14:37:09 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 265ELYDJ011767;
 Tue, 5 Jul 2022 14:37:09 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h4q08rddg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Jul 2022 14:37:08 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 265EaaTh001143;
 Tue, 5 Jul 2022 14:37:07 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 3h2dn8u3x2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Jul 2022 14:37:06 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 265Eb3jZ19333424
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 Jul 2022 14:37:03 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5711FAE045;
 Tue,  5 Jul 2022 14:37:03 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C00FBAE053;
 Tue,  5 Jul 2022 14:37:02 +0000 (GMT)
Received: from [9.171.47.233] (unknown [9.171.47.233])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  5 Jul 2022 14:37:02 +0000 (GMT)
Message-ID: <9dc00e0032b3d753a18f2e9bbec4554402dc6aa4.camel@linux.ibm.com>
Subject: Re: [RFC] gitlab: introduce s390x wasmtime job
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Peter Maydell <peter.maydell@linaro.org>, "Daniel P."
 =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>
Cc: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, Thomas Huth
 <thuth@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org, Christian Borntraeger
 <borntraeger@de.ibm.com>, Ulrich Weigand <ulrich.weigand@de.ibm.com>
Date: Tue, 05 Jul 2022 16:37:02 +0200
In-Reply-To: <CAFEAcA-4=A6NWrpCo5=cBO=v2-GVwK+b5RcgFiJcZN6e-Kb=GQ@mail.gmail.com>
References: <20220704224844.2903473-1-iii@linux.ibm.com>
 <YsQ1fuMRPpA+9AzX@redhat.com>
 <CAFEAcA-4=A6NWrpCo5=cBO=v2-GVwK+b5RcgFiJcZN6e-Kb=GQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0fnVP96E5Ubuec8WP7o26LUgNYUuqbjN
X-Proofpoint-GUID: q8c78kTHecvu6buMJFUjiTTTUGf7LW6V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-05_10,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 mlxscore=0 spamscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 adultscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2207050061
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, 2022-07-05 at 14:57 +0100, Peter Maydell wrote:
> On Tue, 5 Jul 2022 at 14:04, Daniel P. Berrangé <berrange@redhat.com>
> wrote:
> > If we put this job in QEMU CI someone will have to be able to
> > interpret the results when it fails.
> 
> In particular since this is qemu-user, the answer is probably
> at least some of the time going to be "oh, well, qemu-user isn't
> reliable
> if you do complicated things in the guest". I'd be pretty wary of our
> having
> a "pass a big complicated guest code test suite under linux-user
> mode"
> in the CI path.
> 
> -- PMM

Actually exercising qemu-user is one of the goals here: just as an
example, one of the things that the test suite found was commit
9a12adc704f9 ("linux-user/s390x: Fix unwinding from signal handlers"),
so it's not only about the ISA.

At least for s390x, we've noticed that various projects use
qemu-user-based setups in their CI (either calling it explicitly, or
via binfmt-misc), and we would like these workflows to be reliable,
even if they try complicated (within reason) things there.

Best regards,
Ilya


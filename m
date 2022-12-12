Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADF864A421
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 16:29:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4kjF-0005Dz-GO; Mon, 12 Dec 2022 10:28:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p4kjB-0005Dh-Rt
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 10:28:26 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p4kj9-0000Db-Fz
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 10:28:25 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BCE22Lv015507
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 15:28:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=eQ1K/Pau2Vskau6e23DxBKyg4ev4qbTuKkBfoFrtGRM=;
 b=b+gxNN7QjyLjsgKerswUAJ6aud4Q+RW0/t3r7TwNv1GpRvS+8RqZCsKz3iw9dY6j8lqM
 7xNJFT4irIW5Y7xqbfMwRXhkbAvtLyYLKZ3V8vWV0A5MeEQeaNqK5ItR5XGVmsbd1SFR
 Glfi6oDeQh0a4UTpnkm40MYGW9IiGEddK2FuVh4/qkuUNgknxK0VRWMhAsa03EZUC8vh
 hmbLIxvQA09GAD7S9cz8H1mrszsSmd6gpedEbhpWh5HFmVviwW02ZR7Jq1VycM4z/q8Q
 qKdRUiuU3BPRIfb5i6BhDWld1M91CPdDRJlMo0k+7I1ThaE/P3sQoXFKBatQbyV+X66N lw== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3me5q5ta9n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 15:28:21 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.17.1.19/8.16.1.2) with ESMTP id 2BCEBoIV004327
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 15:28:21 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
 by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3mchr6dsca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 15:28:21 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
 by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BCFSJG840043044
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Dec 2022 15:28:19 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 541347805E;
 Mon, 12 Dec 2022 16:45:15 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C16077805C;
 Mon, 12 Dec 2022 16:45:14 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.163.25.229])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 12 Dec 2022 16:45:14 +0000 (GMT)
Message-ID: <4f719a60a82c1d3d335ff8a35fe65ffb3cf23be7.camel@linux.ibm.com>
Subject: Re: [PATCH] tpm: add backend for mssim
From: James Bottomley <jejb@linux.ibm.com>
To: Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org
Date: Mon, 12 Dec 2022 10:28:17 -0500
In-Reply-To: <d7529c39-8236-5490-a1c0-59249ca61e46@linux.ibm.com>
References: <4780481659602f92fffacac66e7dca41ad2787c4.camel@linux.ibm.com>
 <b81db56b-9044-d569-7de2-5388f6958461@linux.ibm.com>
 <b7c4c45c2bcbcf5c2b111a978297c5bb07b49498.camel@linux.ibm.com>
 <b1cf9866-d28a-05c3-1f10-8745f9e43c44@linux.ibm.com>
 <4dae1219d816277085fcb82979cf6cded6a1bd6b.camel@linux.ibm.com>
 <9cc63b28-6700-59b3-1d4d-b89a4744a09b@linux.ibm.com>
 <43465b20acc0b120ed49330d2f985534d0b2fc60.camel@linux.ibm.com>
 <d7529c39-8236-5490-a1c0-59249ca61e46@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bxeAa6KrSqlpceChLrsUD4eO6D0CdCnb
X-Proofpoint-ORIG-GUID: bxeAa6KrSqlpceChLrsUD4eO6D0CdCnb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 mlxlogscore=689 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212120138
Received-SPF: pass client-ip=148.163.158.5; envelope-from=jejb@linux.ibm.com;
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
Reply-To: jejb@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 2022-12-12 at 10:20 -0500, Stefan Berger wrote:
> On 12/12/22 09:47, James Bottomley wrote:
[...]
> > I don't actually use virsh in my harness.  I'm mostly interested in
> > the running the kernel TPM selftests against the reference model. 
> > But I anticipate it wouldn't currently work because I don't believe
> > virsh triggers a S3 event which is why snapshot and migration
> > doesn't always work with PCI passthrough.
> 
> Then I think you should at least add a blocker to your model so that
> suspend/resume/snapshotting/migration are all disabled because the
> mssim reference implementation doesn't support permanent & volatile
> state suspend/resume (and upgrading!) without significant work on it
> as can be seen in libtpms.

Actually, I would think adding support, if that's what people wanted,
would be pretty simple.  Since the network end point is the identifier,
the protocol would be not to power down the TPM on suspend/resume and
simply to send TPM_STOP to close down the sockets gracefully.  Then the
next connection picks up the state where the previous one left off.

> Why would we support another model for the backend that provides no
> advantages over what is there right now?

The advantages were what was stated: ability to connect to the MS
reference model directly and no dependence on the Linux VTPM_PROXY
protocol.

James



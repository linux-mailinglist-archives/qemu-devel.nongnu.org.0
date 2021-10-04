Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE59C42151E
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 19:24:57 +0200 (CEST)
Received: from localhost ([::1]:57074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXRhv-0000lg-Hq
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 13:24:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mXRgQ-00087X-Rm
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 13:23:23 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:20530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mXRgO-0003zt-Bi
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 13:23:22 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 194H9Qor018732; 
 Mon, 4 Oct 2021 13:23:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=j9dM7LABjNR4pyb6YNjnkB1o0tJDu4oqg2La6JfndHY=;
 b=kIuuSY+ELYP6AfGnGZRXRdH3wq/hYAdKAK/7W/1+p26c5Og5stAONu93YtOxREODGlbt
 7GzptmScfD9yZPhytcs4fa7T162AAFcRtNOc81sT4aByzX48TDk4KSdAd+qan1EV1Hca
 3fhdHlcj6odrR2SYUfv8cKmkQ0ZpJ8xwQ/dxmUb63F8lEorlIhyWvc42ctteXn0km7/J
 kVoV9wwL0+Fy8RSOyyH7NnvCOSc7M+pdJdfN1evfO31UyxUQpL61NOrAg8dxZNVAeQ47
 TR2Z3A6bKHlhZXmLrcF0UNBJrLfOrJwua+YRALH1MlBUWdYkilcdvm5Tbbba5o7RtiMI PQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bg5rm0772-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Oct 2021 13:23:12 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 194H9E88018047;
 Mon, 4 Oct 2021 13:23:12 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bg5rm076q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Oct 2021 13:23:12 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 194HGZ1N014065;
 Mon, 4 Oct 2021 17:23:11 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 3bef2au16g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Oct 2021 17:23:11 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 194HN85e20054726
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 Oct 2021 17:23:08 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32B646A04F;
 Mon,  4 Oct 2021 17:23:08 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 136266A051;
 Mon,  4 Oct 2021 17:23:03 +0000 (GMT)
Received: from [9.160.137.57] (unknown [9.160.137.57])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  4 Oct 2021 17:23:03 +0000 (GMT)
Subject: Re: [PATCH v4 0/2] x86/sev: Measured Linux SEV guest with
 kernel/initrd/cmdline
To: Paolo Bonzini <pbonzini@redhat.com>
References: <20210930054915.13252-1-dovmurik@linux.ibm.com>
 <CABgObfb3VOSav+pdwC5_xrCeM5S32B2XV02L7H7DWx+9Gi8u_g@mail.gmail.com>
From: Dov Murik <dovmurik@linux.ibm.com>
Message-ID: <05c6d1ca-85a3-31e0-14dd-04c848a89c19@linux.ibm.com>
Date: Mon, 4 Oct 2021 20:23:02 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CABgObfb3VOSav+pdwC5_xrCeM5S32B2XV02L7H7DWx+9Gi8u_g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: NQt-C2KWxx-1_6ouf-034x34rwhb1jIR
X-Proofpoint-GUID: hGSnRwhYedM4LO2GCnOoll1OjSxX9lPf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-04_05,2021-10-04_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 adultscore=0 phishscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
 spamscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110040113
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Hubertus Franke <frankeh@us.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Brijesh Singh <brijesh.singh@amd.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 04/10/2021 11:03, Paolo Bonzini wrote:
> Queued, thanks.  However, it would be nice to have a documentation of
> all our SEV firmware interfaces somewhere in docs/specs/.

Thanks Paolo.

I'll try to arrange a skeleton for such document.  So far I think we
have the following interfaces:

1. SEV_SECRET_GUID - Secret injection target page
2. SEV_INFO_BLOCK_GUID - Used (currently) for the SEV-ES AP reset vector
3. SEV_HASH_TABLE_RV_GUID - For hashes of kernel/initrd/cmdline


-Dov


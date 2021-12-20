Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BB247B0CD
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 17:02:03 +0100 (CET)
Received: from localhost ([::1]:42156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzL6w-0004qi-Nq
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 11:02:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mzJuj-0002F9-5Z; Mon, 20 Dec 2021 09:45:25 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:44348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mzJuP-00041m-0L; Mon, 20 Dec 2021 09:45:13 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BK9D6wf005406; 
 Mon, 20 Dec 2021 12:12:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=tTAmuF0E3dcp2e0ChhTVID9+P7KS0zRn3hOWNz/SdFo=;
 b=tXTHZ/B5etAJFHFV5nAIEkKV6NkhDICp+KXDRgyQcpp8qrPnNebvyGwRl6QCo2XS09rS
 EQSMyL87sqI99Pc4eFm5h85WBOVUPPGsQdYNuBC+Yc4Fr7o64oClKyjeLl04vuuwwaO3
 sL7ohInRM5ienvvJUVWxicp+V3tu6aVwHvQTPn2dSvu6FhU9Kjcs6ihSD5hf6wCehsK/
 KgYx1YGQPD+LoId/mk5I+YLHsfDECLJAhzOZDfMP1Meiac4WVPfJGeLRsFFbz8X7kFpf
 XwsPdOhW+kAbKIpdPk98O/uozxTlDY9TnRRFmQ1nvEmYTfkvNHJdCV23+eK3vypojE95 XA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d2q0jk7dx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 12:12:13 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BKC6lXD025220;
 Mon, 20 Dec 2021 12:12:13 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d2q0jk7d9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 12:12:13 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BKBqjBA002278;
 Mon, 20 Dec 2021 12:12:11 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3d16wjce79-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 12:12:10 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1BKCBvPu47120756
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Dec 2021 12:11:57 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EC5BBA406B;
 Mon, 20 Dec 2021 12:11:56 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 836C6A4064;
 Mon, 20 Dec 2021 12:11:56 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.26.145])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 20 Dec 2021 12:11:56 +0000 (GMT)
Date: Mon, 20 Dec 2021 13:11:54 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Pierre Morel <pmorel@linux.ibm.com>
Subject: Re: [PATCH qemu] s390x/css: fix PMCW invalid mask
Message-ID: <20211220131154.57562cd2.pasic@linux.ibm.com>
In-Reply-To: <d7459eec-c760-1441-ce40-550b0897e1ba@linux.ibm.com>
References: <20211216131657.1057978-1-nrb@linux.ibm.com>
 <20211217145811.71dd0a70.pasic@linux.ibm.com>
 <7143886b-ffa2-e5f7-e7fe-b06212522824@linux.ibm.com>
 <20211217202818.7e843a1d.pasic@linux.ibm.com>
 <d7459eec-c760-1441-ce40-550b0897e1ba@linux.ibm.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: S8qsjO9KTg-3OGfmy2deVvgWQNBe37qA
X-Proofpoint-ORIG-GUID: A35Gi4_5zV3sZ4tqacF0X-dmOgytQmdz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-20_06,2021-12-20_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 mlxlogscore=683 phishscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112200070
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pasic@linux.ibm.com;
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
Cc: thuth@redhat.com, Nico Boehr <nrb@linux.ibm.com>, frankja@linux.ibm.com,
 cohuck@redhat.com, qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 20 Dec 2021 11:44:44 +0100
Pierre Morel <pmorel@linux.ibm.com> wrote:

> > 
> > The PoP says that the machine shall ignore other fields
> > of the PMCW when an MSCH is performed. I.e. we should not update
> > "our" pmcw.flags bit 5 from 0 to 1 even if 1 was supplied, and
> > thus STSCH should keep storing the bit 5 as 0 even if there was
> > a MSCH with bit 5 set.  
> 
> So I do understand that there is no problem, we do not keep track
> of this bit in our pmcw.flags and stsch keep storing this bit as 0. right?

Right! False alarm by me -- sorry.

Regards,
Halil


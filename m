Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E71D415E6F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 14:32:02 +0200 (CEST)
Received: from localhost ([::1]:47518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTNtR-0006Dg-LN
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 08:32:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mTNbU-0001Ku-Us; Thu, 23 Sep 2021 08:13:28 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:30778
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mTNbS-0001DN-Vd; Thu, 23 Sep 2021 08:13:28 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18NBUZjK019088; 
 Thu, 23 Sep 2021 08:13:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=iGaJcK7YZWYnXEW6OrwmWuH08E8OIj77vNYI/KxKn/k=;
 b=hojDevJRQzDRZRaoQBW0gyCXQHwbCWCcYymh9+e0FR8pOgbi8huJc9kbnSnX7kkP120V
 m1NEN8mubcrGbVgxsR+ADMM9GtSt+ah+DGKhdmW8F6vS4Ss6H/Y0XuG9kIl0fNwgFz5y
 JNN+ARihpVHvQJ7JPbuGtjR6tE4big00+i+CUJrPNbVhGzHAt9N/S7fpmkUkyjR/MBzS
 TJtFyjObQld62kVeqaTVvAC/vPYSiLTN51X693acHvZtWQwN7o0F2LEJM20PxFGo0eE+
 L/IsDW6IJrGT1XIdhInIco5cFZlao7X7V9/ro9Mn5P0IHok05bB8zEb4q0ExjlVvDnub pQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3b8p4gmxn4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Sep 2021 08:13:24 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18NBERLh012260;
 Thu, 23 Sep 2021 08:13:23 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3b8p4gmxmm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Sep 2021 08:13:23 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18NCC5cR014703;
 Thu, 23 Sep 2021 12:13:21 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 3b7q6ra0rh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Sep 2021 12:13:21 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18NCDHvv64422250
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Sep 2021 12:13:17 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6293442047;
 Thu, 23 Sep 2021 12:13:17 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9570A4204B;
 Thu, 23 Sep 2021 12:13:16 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.13.138])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 23 Sep 2021 12:13:16 +0000 (GMT)
Date: Thu, 23 Sep 2021 14:13:14 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 18/28] file-posix: try BLKSECTGET on block devices too,
 do not round to power of 2
Message-ID: <20210923141314.352fbf75.pasic@linux.ibm.com>
In-Reply-To: <ba39ff70-9f0a-1e90-a626-c001e6f7f741@redhat.com>
References: <20210625141822.1368639-1-pbonzini@redhat.com>
 <20210625141822.1368639-19-pbonzini@redhat.com>
 <20210906162420.5af35eb9.pasic@linux.ibm.com>
 <20210922215143.7f289016.pasic@linux.ibm.com>
 <ba39ff70-9f0a-1e90-a626-c001e6f7f741@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Imi0f2AlZgd7l9KmkpxHdKLEtqtDQRnD
X-Proofpoint-GUID: dECsrERLvJMewso5GX7FVIuvsI5-fo6Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-23_04,2021-09-23_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 impostorscore=0 mlxscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109200000 definitions=main-2109230076
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, "open list:AIO" <linux-aio@kvack.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Benjamin LaHaise <bcrl@kvack.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jan Hoeppner <Jan.Hoeppner@de.ibm.com>, Stefan Haberland <sth@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 23 Sep 2021 12:57:38 +0200
Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 22/09/21 21:51, Halil Pasic wrote:
> > We have figured out what is going on here. The problem seems to be
> > specific to linux aio, which seems to limit the size of the iovec to
> > 1024 (UIO_MAXIOV).  
> 
> Hi Halil,
> 
> I'll send a patch shortly to fix this issue.  Sorry about the delay as I 
> was busy with KVM Forum and all that. :(

Hi Paolo!

With some guidance I could cook up a patch myself. But if you prefer to
do it yourself, I will be glad to test the fix (please put me on cc).
Thanks!

Regards,
Halil



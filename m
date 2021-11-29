Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EDA461473
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 13:02:24 +0100 (CET)
Received: from localhost ([::1]:46986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrfMV-0003WI-7v
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 07:02:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mrfK2-0002OY-HG; Mon, 29 Nov 2021 06:59:50 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:52740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mrfK0-0007zs-JR; Mon, 29 Nov 2021 06:59:50 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1ATBm6Qh011551; 
 Mon, 29 Nov 2021 11:59:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=dP/vO4KmzlPPAPIDi0LBIWuN4oHsxGL94P7jw+OWBTk=;
 b=kGJJdInQOGhEXTDi8YIWJVC+LGUKNU7RV3oupjxAZj1rXQlSbWBR03A1mhj0Mz+mCr7r
 /kGz6x2UCtRwvdaUT0bcGL5RTOhN1Mbu2nnLHhO2kFzgRC49UxhmDRM2nw/vSZar4OOP
 /t3j1196KB+8nrPC8zc8WsYNucNKVNknqCpGuL48A9YZsLkgZ3flJXGZrg0JzUiWZLf8
 gTsLU3zZe9qOaKjcyjCMEUuRw+ykYJBZ8tvDeoxqdiSP5s61FmJj0LF7fuwKAca7z6O+
 /w49GdmkNJq0yNgD6lkEXB6NspiQ0+qfoZI9wr0P/+0WvOabqe/ySGicByzp8SfbFOmi YA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cmxa1g80g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 11:59:44 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1ATBo4Te016125;
 Mon, 29 Nov 2021 11:59:44 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cmxa1g7yn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 11:59:44 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1ATBqaHv003125;
 Mon, 29 Nov 2021 11:59:41 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06fra.de.ibm.com with ESMTP id 3ckbxjbhjx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 11:59:41 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1ATBqCEc61276660
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Nov 2021 11:52:13 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A713A4055;
 Mon, 29 Nov 2021 11:59:38 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A18EA405B;
 Mon, 29 Nov 2021 11:59:37 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.58.198])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 29 Nov 2021 11:59:37 +0000 (GMT)
Date: Mon, 29 Nov 2021 12:59:26 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v2 0/5] virtio: early detect 'modern' virtio
Message-ID: <20211129125926.0a3db6a5.pasic@linux.ibm.com>
In-Reply-To: <20211123141340.3def6ccb.pasic@linux.ibm.com>
References: <20211112145749.618157-1-pasic@linux.ibm.com>
 <20211123141340.3def6ccb.pasic@linux.ibm.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1LE7tMzge5aUXfCZoZYp96Yb7--Qo4xf
X-Proofpoint-GUID: IMXToNUUQGY11d3L8gQUPCKF2C27DGRy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-29_07,2021-11-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 adultscore=0 clxscore=1015 mlxscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111290058
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Nov 2021 14:13:40 +0100
Halil Pasic <pasic@linux.ibm.com> wrote:

> On Fri, 12 Nov 2021 15:57:44 +0100
> Halil Pasic <pasic@linux.ibm.com> wrote:
> 
> > This is an early RFC for a transport specific early detecton of
> > modern virtio, which is most relevant for transitional devices on big
> > endian platforms, when drivers access the config space before
> > FEATURES_OK is set.  
> 
> [..]
> 
> Ping!
> 
> @Michael: Can you have a look at this, please?

Ping^2


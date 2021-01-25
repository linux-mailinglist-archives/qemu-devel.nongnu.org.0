Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C81C9302F6F
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 23:52:06 +0100 (CET)
Received: from localhost ([::1]:53640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4AiG-0008Fd-4F
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 17:52:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1l4Ag4-00070k-BH; Mon, 25 Jan 2021 17:49:44 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:16478
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1l4Ag1-0004NN-VJ; Mon, 25 Jan 2021 17:49:43 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10PMfpRF173480; Mon, 25 Jan 2021 17:49:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=gXmeoyy+3o7RqhPZH7L8CjHHG2cU/geVf68CRKZfEEU=;
 b=ZpYpDdNAd4Anc6q2qeLu1GIEgCT3OxlbIYmtkD3WLU1w95UPKYitBpI+1PLHGZIHtZ0o
 UuuxEAQyzTX5BLWho6PX2Aca/ScSf6ANCuiJwssVKWhA5EgnbGSI0bUDvm7tRpDg4fCR
 VyrmEUJWIwXRmU5tPQNDi5Km3sFU33tc6NcIuhNIobuXuPLOGcuk1oU1DoQh3WUZqBnG
 3YgAyqObkW/g6qwD5tP/wzMLEgVu/zETAvy80mj4uxlYKWtTzi26Ubt8SA8TC21MVBRJ
 fYM4JP2oSlBswwTRRsKLDIvFm6D0yQHxR6/Pqr1T9YkqIR+bsr7Mw/zG2Lfk/HXo/ZRo IA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36a70j83u8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jan 2021 17:49:33 -0500
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10PMjk7h188170;
 Mon, 25 Jan 2021 17:49:32 -0500
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36a70j83tv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jan 2021 17:49:32 -0500
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10PMm5c4018770;
 Mon, 25 Jan 2021 22:49:31 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06fra.de.ibm.com with ESMTP id 368b2h95cq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jan 2021 22:49:30 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10PMnRPW43254046
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Jan 2021 22:49:28 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD98652051;
 Mon, 25 Jan 2021 22:49:27 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.12.187])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 4A7BA52050;
 Mon, 25 Jan 2021 22:49:27 +0000 (GMT)
Date: Mon, 25 Jan 2021 23:49:24 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [PATCH v3] s390x/cpu_model: disallow unpack for --only-migratable
Message-ID: <20210125234924.0da4aa9b.pasic@linux.ibm.com>
In-Reply-To: <20210125135332.181324-1-borntraeger@de.ibm.com>
References: <20210125135332.181324-1-borntraeger@de.ibm.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-25_09:2021-01-25,
 2021-01-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxlogscore=999 clxscore=1015 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101250110
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 "Daniel P . =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 25 Jan 2021 14:53:32 +0100
Christian Borntraeger <borntraeger@de.ibm.com> wrote:

> Secure execution (aka protected virtualization) guests cannot be
> migrated at the moment. If the unpack facility is provided in the cpu
> model, a guest may choose to transition to secure mode, making the
> guest unmigratable at that point in time. If the machine was explicitly
> started with --only-migratable, we would get a failure only when the
> guest actually tries to transition; instead, explicitly disallow the
> unpack facility if --only-migratable was specified to avoid late
> surprises.
> 
> Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Halil Pasic <pasic@linux.ibm.com>


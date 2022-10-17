Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 030DD600C90
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 12:37:42 +0200 (CEST)
Received: from localhost ([::1]:54810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okNV7-00023F-1b
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 06:37:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nrb@linux.ibm.com>)
 id 1okNKN-0006OX-UJ; Mon, 17 Oct 2022 06:26:35 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:17664
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nrb@linux.ibm.com>)
 id 1okNK7-0003YF-KZ; Mon, 17 Oct 2022 06:26:34 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29H92d9a032224;
 Mon, 17 Oct 2022 10:26:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : content-transfer-encoding : in-reply-to : references : from
 : subject : cc : to : message-id : date; s=pp1;
 bh=w+WlODz1nzheL94feq6QHg+jpNqcvzuhRoOAtgEQPEE=;
 b=e6Ao+gV5oupxJYRQautK8qArYrsmMQwC7TBN/LiAZF7PyIhX+9ZuRr6R96LcaUR0fZnl
 fFRc2JiVkt8I8870JXdiLbB6OW7c92Iwy6HL8VoYQeaAfHbWOSRHslwFvaWmOVph/GZ0
 PGQhXAaNiiew0UIqZrDkH23wwlHsU/5WYTX+aJe0HvR2FMc/DO9V8wM8RzrQ6/LZSZNw
 iW+zkZVLdS1eewrkg5A4gexmMNbVzk7Dz3sP+ujefzVgnI9ULumTObzX7sb3o2B6FFLt
 ezVArLmg7mXNf8ZwYkvEkUva2+BFGkL65rXH6tJhb34zqDv7ZiL/l+/bQ4QQw2MlNaDC fQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3k86x8cc70-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Oct 2022 10:26:03 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29HAKgDA019845;
 Mon, 17 Oct 2022 10:26:03 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3k86x8cc64-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Oct 2022 10:26:03 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29HAK8lw000899;
 Mon, 17 Oct 2022 10:26:01 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 3k7mg9a44r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Oct 2022 10:26:01 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29HAPwFG4981328
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Oct 2022 10:25:58 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EDE54A4051;
 Mon, 17 Oct 2022 10:25:57 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D0B59A4040;
 Mon, 17 Oct 2022 10:25:57 +0000 (GMT)
Received: from t14-nrb (unknown [9.171.13.28])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 17 Oct 2022 10:25:57 +0000 (GMT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <f2600526-0223-94df-08c2-847c7f2b2ec6@redhat.com>
References: <20221012123229.1196007-1-nrb@linux.ibm.com>
 <f2600526-0223-94df-08c2-847c7f2b2ec6@redhat.com>
From: Nico Boehr <nrb@linux.ibm.com>
Subject: Re: [PATCH v1] s390x/tod-kvm: don't save/restore the TOD in PV guests
Cc: pasic@linux.ibm.com, borntraeger@linux.ibm.com, qemu-devel@nongnu.org,
 frankja@linux.ibm.com, imbrenda@linux.ibm.com
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org
Message-ID: <166600235757.24320.13027492599004231821@t14-nrb>
User-Agent: alot/0.8.1
Date: Mon, 17 Oct 2022 12:25:57 +0200
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: gJbwyR8JmuHJl_XXJg6hxwhqjM95q2rO
X-Proofpoint-GUID: DzdWdyLVQSURseOv8YNN4B5gEm02TVsh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-17_07,2022-10-17_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=758
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210170058
Received-SPF: pass client-ip=148.163.158.5; envelope-from=nrb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Quoting Thomas Huth (2022-10-17 09:30:04)
[...]
> I know it's annoying when switching between kernel coding style and QEMU =

> coding style, but please use curly braces when doing QEMU patches. I wond=
er=20
> why checkpatch.pl does not print any warnings here...?

Ooops, sorry for the oversight. You are right, thanks for making me aware o=
f the
different coding styles.


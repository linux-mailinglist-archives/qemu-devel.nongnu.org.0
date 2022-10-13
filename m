Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 288F15FDB62
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 15:48:09 +0200 (CEST)
Received: from localhost ([::1]:45920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiyZD-0004hS-J4
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 09:48:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1oixVZ-0002zG-CC; Thu, 13 Oct 2022 08:40:17 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:5266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1oixVX-0004VY-Jh; Thu, 13 Oct 2022 08:40:17 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29DBmlV4023456;
 Thu, 13 Oct 2022 12:40:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=gsu0PhOYeKjKIFRzE1RmwsRD5nqD2hI9kgzqF+Bkg+g=;
 b=Us5y7XH2+dU2hCijpaUliUNESLSKaUpFfWaH9+6Gig9R3Fi0tev33/vvbmt0R0Y6Da3k
 EPhRsudahSSiK+GxEtCHd1o6tm/cR6I1CcxuUXSJw61ixCNi+kJLjSrTcJeyiKwdjkt0
 KysYHF0qQ9mmP4VHK03c603hv+/X5AaroFXQb4zwswJKgWurtb7CF15m7d6AgBcM8My6
 9hb8joiV6d1Zvk/++BKvJ7Z66fO5gBIgyR74C8Yma8X8i/zPZC63yEeUIbqSQMvjDnqd
 fMSgoMta9jv3XJrGdOjVQlYmZKC7XX+c7Taczno6InAbQshpDruHXs68co2FgfIagG+/ Jw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k6dc8t029-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Oct 2022 12:40:01 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29DBrMFN013945;
 Thu, 13 Oct 2022 12:40:00 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k6dc8t01m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Oct 2022 12:40:00 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29DCa2t7013257;
 Thu, 13 Oct 2022 12:39:59 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02dal.us.ibm.com with ESMTP id 3k30uafb5r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Oct 2022 12:39:59 +0000
Received: from smtpav04.dal12v.mail.ibm.com ([9.208.128.131])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29DCcgqw25559560
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Oct 2022 12:38:42 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6DA1E58063;
 Thu, 13 Oct 2022 12:38:43 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB9EA5805E;
 Thu, 13 Oct 2022 12:38:42 +0000 (GMT)
Received: from localhost (unknown [9.160.174.55])
 by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTPS;
 Thu, 13 Oct 2022 12:38:42 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org, Matheus
 Ferst <matheus.ferst@eldorado.org.br>
Subject: Re: [PATCH v3 03/29] target/ppc: split interrupt masking and
 delivery from ppc_hw_interrupt
In-Reply-To: <20221011204829.1641124-4-matheus.ferst@eldorado.org.br>
References: <20221011204829.1641124-1-matheus.ferst@eldorado.org.br>
 <20221011204829.1641124-4-matheus.ferst@eldorado.org.br>
Date: Thu, 13 Oct 2022 09:38:40 -0300
Message-ID: <87lepjew4v.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LK834fKgS3T9bM47d3ESrh_BkwxIM6-O
X-Proofpoint-ORIG-GUID: BApUN2wYWDXzpXVhDL2JsleBM0A2rW7l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-13_08,2022-10-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxlogscore=572 mlxscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210130074
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Matheus Ferst <matheus.ferst@eldorado.org.br> writes:

> Split ppc_hw_interrupt into an interrupt masking method,
> ppc_next_unmasked_interrupt, and an interrupt processing method,
> ppc_deliver_interrupt.
>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>



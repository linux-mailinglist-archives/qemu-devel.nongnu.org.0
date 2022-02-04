Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 704454A980F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 11:55:31 +0100 (CET)
Received: from localhost ([::1]:41334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFwFW-0007bN-2I
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 05:55:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nFwDZ-0006ey-67
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 05:53:29 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:7116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nFwDW-0001Uv-1V
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 05:53:28 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21499BI6029334; 
 Fri, 4 Feb 2022 10:53:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=GqY3VAC+fEkK1BDs4vRtt2jswd9C0yD+MrLvvp8vnYE=;
 b=IvkM7bfbSK6EXvnt+3kHqqAUDfwbfQpMgstLvS8YjE7Gil/Kpr8o3xaIFl6ERkBaXCJK
 yvUi8igtB+lM2r1EG9XUP26nvhQbo6HQHiouoBxY92RyHr4HZEszkAifBlXWl3wh3TnA
 wt6PGDKcCEEXXLfaXCw/WnogeP0dKSuyCab1+jHXfh7IKGHjrCkXdwakrYAYQ0A3q7zt
 iPNKnQJtaHrVcZtiqvUxKu6iiXdSyAjH80avOAMqyVdbiq40ljTOWQo2QCFlnW6X+Shz
 omPiDwjus0ohIBQPBcKe1eJNhSjeoGAIFPOJCA+HB9rp8kkdzc0ylDVtRiN2EfavUn/k tw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e0qx3ts3v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 10:53:11 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2149g5YU010386;
 Fri, 4 Feb 2022 10:53:10 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e0qx3ts3d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 10:53:10 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 214AhNbN024112;
 Fri, 4 Feb 2022 10:53:08 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3e0r0u3tpr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 10:53:08 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 214Ar6FL48496928
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Feb 2022 10:53:06 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 104DDAE078;
 Fri,  4 Feb 2022 10:53:06 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A4885AE074;
 Fri,  4 Feb 2022 10:53:05 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.17.67])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri,  4 Feb 2022 10:53:05 +0000 (GMT)
Date: Fri, 4 Feb 2022 11:53:03 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= via <qemu-devel@nongnu.org>
Subject: Re: [PATCH 03/10] hw/s390x/virtio: Add missing 'cpu.h' include
Message-ID: <20220204115303.080c88d4.pasic@linux.ibm.com>
In-Reply-To: <20220203193803.45671-4-f4bug@amsat.org>
References: <20220203193803.45671-1-f4bug@amsat.org>
 <20220203193803.45671-4-f4bug@amsat.org>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Qnu-r0lBoL0pGXHOLjzNdt1Grx1Lx2O1
X-Proofpoint-GUID: 7o2tpTLLrtFqa6WaZkuUJ1qt-sh4VymD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-04_03,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0
 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202040054
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Halil Pasic <pasic@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu,  3 Feb 2022 20:37:56 +0100
Philippe Mathieu-Daudé via <qemu-devel@nongnu.org> wrote:

> CPUS390XState is declared in "cpu.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

No objections :)

Acked-by: Halil Pasic <pasic@linux.ibm.com>


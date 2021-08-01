Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D83493DC91A
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Aug 2021 02:30:45 +0200 (CEST)
Received: from localhost ([::1]:38788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9zNL-0005hn-Jk
	for lists+qemu-devel@lfdr.de; Sat, 31 Jul 2021 20:30:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1m9zLl-00052f-PL
 for qemu-devel@nongnu.org; Sat, 31 Jul 2021 20:29:05 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:41856
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1m9zLk-0008LV-0w
 for qemu-devel@nongnu.org; Sat, 31 Jul 2021 20:29:05 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17104FUY070751; Sat, 31 Jul 2021 20:29:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=to : cc : from : subject
 : message-id : date : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=C3VRnbT/tOygbAYk7F0E7XkEBNfYM/lJ089iwxA68UU=;
 b=oWRfN1vSMio+9VCLOqc+6GMF4o3rDS6Pg4XjhV9twxLpzEB96Ad2TcKs+QFUz7bsXuO6
 1G69YR4Jl6s8sA5HHZqSnOPWJ38Irz+OrXFE3WhT+1cpcYrgxln+nT4IAgfX/toYCBe7
 mvzbslFNB7+kD7CifRQhInNC0eTp4fYnWm+zjCK7j5FVqP0ZDZAtS9jfcxaP2DRlo2c8
 IPl+b+FB5iDqM5JqtHeHI2+yfkYxfjUgk9GHQLqf+JZfhzUMf5+5hJFIM/0kMggwyN4w
 SUJJrh1e8PiZEz/AXGfb5mCJ2dg2rXkuWv6d52/KFJkulWsk2xbI2EbrFKAtT9ZdvZ7i xg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a5a4b6fcj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 31 Jul 2021 20:29:00 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1710LqVW118711;
 Sat, 31 Jul 2021 20:29:00 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a5a4b6fcb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 31 Jul 2021 20:29:00 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1710D9p9003319;
 Sun, 1 Aug 2021 00:28:59 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03dal.us.ibm.com with ESMTP id 3a4x5a75fe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 01 Aug 2021 00:28:59 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1710Swuw39321860
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 1 Aug 2021 00:28:58 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 93426C6057;
 Sun,  1 Aug 2021 00:28:58 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53F2FC6062;
 Sun,  1 Aug 2021 00:28:58 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sun,  1 Aug 2021 00:28:58 +0000 (GMT)
To: qemu-devel@nongnu.org
From: Stefan Berger <stefanb@linux.ibm.com>
Subject: Windows on ARM64 not able to use attached TPM 2
Message-ID: <f288d6fb-4286-252c-1e3c-f92076dbc51e@linux.ibm.com>
Date: Sat, 31 Jul 2021 20:28:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: LDcJRCle24HGOg0_ZDc0Ce7y0V1fGmpB
X-Proofpoint-GUID: rfw0haXf2uVYRur88f5laUzxBIXWmTyr
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-31_05:2021-07-30,
 2021-07-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=711 bulkscore=0
 impostorscore=0 clxscore=1011 priorityscore=1501 suspectscore=0
 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107310140
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: eric.auger@redhat.com, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello!

  I maintain the TPM support in QEMU and the TPM emulator (swtpm). I 
have a report from a user who would like to use QEMU on ARM64 (aarch64) 
with EDK2 and use an attached TPM 2 but it doesn't seem to work for him. 
We know that Windows on x86_64 works with EDK2 and can use an attached 
TPM 2 (using swtpm). I don't have an aarch64 host myself nor a Microsoft 
account to be able to access the Windows ARM64 version, so maybe someone 
here has the necessary background, credentials, and hardware to run QEMU 
on using kvm to investigate what the problems may be due to on that 
platform.

https://github.com/stefanberger/swtpm/issues/493

On Linux it seems to access the TPM emulator with the normal tpm_tis driver.

Regards,

    Stefan




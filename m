Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8B2664C33
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 20:18:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFJw0-000227-KU; Tue, 10 Jan 2023 14:05:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1pFJvu-000211-BR
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 14:05:15 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1pFJvq-00048k-NI
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 14:05:14 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30AIvc8U030869; Tue, 10 Jan 2023 19:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=7bmQHm/jZEDTX/Srflc17HjQZA8P6vtFZUvSlUnNAIo=;
 b=MTCxMgRt46KY93EaBgwzl9WLCnPvCkXsqDMUzDY9VQm2fdEIUuKLRdjTd6TfKJ4WswDg
 FwhG8sXj6p5PuF0+HIXyAd+HLSZNhPL3OBbOtjeJEe3N0VLj7xFtoe2DJ81VD4TbhCV7
 myk4GN82UI1jLTInIpsVzP/VGrsOXk60yqy32Zq2Kb38iXnPfXZ8rinbp5ATReJovY39
 bnJH1ZWD9nJiD7gaRND3maaHiYKyOcrrGpLpdNtYvvtLxJVbCCzBcMhJysZcHQ8j2U54
 KFhFKfXH+RcJ2FrSACtRFmFbukhQLVCNAUs1vDTOCBgtMdIY0t5rZpqKy5ZAaCTGNt8r 3Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n1drpr4st-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Jan 2023 19:05:04 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30AJ2vgS017003;
 Tue, 10 Jan 2023 19:05:04 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n1drpr4rv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Jan 2023 19:05:04 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30AHcXKD013339;
 Tue, 10 Jan 2023 19:05:02 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3my00fnbun-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Jan 2023 19:05:02 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30AJ4xE117302228
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Jan 2023 19:04:59 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD31B2004B;
 Tue, 10 Jan 2023 19:04:59 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5BA0F2004D;
 Tue, 10 Jan 2023 19:04:59 +0000 (GMT)
Received: from [9.171.9.121] (unknown [9.171.9.121])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 10 Jan 2023 19:04:59 +0000 (GMT)
Message-ID: <fec1b798-2170-79b1-3bec-435777ca5afe@linux.ibm.com>
Date: Tue, 10 Jan 2023 20:04:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] Makefile: allow 'make uninstall'
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230110151318.24462-1-peter.maydell@linaro.org>
Content-Language: en-US
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <20230110151318.24462-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _B2-eik10bT5JTrDT4YXP70Jhzy3RrnA
X-Proofpoint-GUID: 6WxlCVogYIJ5mwYQ4Jc52z4DSAnMFmZI
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-10_08,2023-01-10_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 clxscore=1011 malwarescore=0 phishscore=0 spamscore=0
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=809 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301100124
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 10.01.23 um 16:13 schrieb Peter Maydell:
> Meson supports an "uninstall", so we can easily allow it to work by
> not suppressing the forwarding of it from Make to meson.
> 
> We originally suppressed this because Meson's 'uninstall' has a hole
> in it: it will remove everything that is installed by a mechanism
> meson knows about, but not things installed by "custom install
> scripts", and there is no "custom uninstall script" mechanism.
> 
> For QEMU, though, the only thing that was being installed by a custom
> install script was the LC_MESSAGES files handled by Meson's i18n
> module, and that code was fixed in Meson commit 487d45c1e5bfff0fbdb4,
> which is present in Meson 0.60.0 and later.  Since we already require
> a Meson version newer than that, we're now safe to enable
> 'uninstall', as it will now correctly uninstall everything that was
> installed.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/109
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Always missed that functionality. Thanks.



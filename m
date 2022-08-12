Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A23C5912CF
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 17:16:05 +0200 (CEST)
Received: from localhost ([::1]:38136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMWOK-0008Sn-0x
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 11:16:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oMWBq-0006Ty-Sn; Fri, 12 Aug 2022 11:03:10 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:2484
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oMWBp-0003F5-6i; Fri, 12 Aug 2022 11:03:10 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27CEkNwx008071;
 Fri, 12 Aug 2022 15:02:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=NPbmEH90aj2j56JFE8JtFm/4c+NNqp0XS7AUBV/jjd8=;
 b=YmKAmkxoAFaPHneElZSjs/Ac8U3AVxGIqFXd5Uorl5ET6zhVe/zgHnxkfzAyNFgCtSee
 0ez5wKPnNqob8XTyXvMCmu1xUccQ/stM6EqK/bwJ9UfRFlM/6MagVOPdJlFKCDhIGEWO
 tvBZ3CI6V5p27qPqQgSc4yasR+6ULN5T7Uj/gmS0OQ3QhFdWI5PpE2qAhApR6iJ7orxf
 piAYVz4r5GCFPQad/pIT/YJ8LYKIo+man4dLvMfi9Ta6WBsHMWg2m89D54QcV3+ApWYl
 zzrwpgvsz+ABkI6/FGbmZI45UqLfGNGrRIeOs7vULKTxU14Erq7hDtUQTiL+uH65DgF6 Vw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hwrwn8j1s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Aug 2022 15:02:47 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27CEkjCZ009379;
 Fri, 12 Aug 2022 15:02:47 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hwrwn8j0h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Aug 2022 15:02:47 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27CEqPS4017937;
 Fri, 12 Aug 2022 15:02:45 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 3huww0tr4y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Aug 2022 15:02:45 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 27CF30Tt35193114
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Aug 2022 15:03:00 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE11B5204F;
 Fri, 12 Aug 2022 15:02:42 +0000 (GMT)
Received: from [9.171.65.88] (unknown [9.171.65.88])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 23B495204E;
 Fri, 12 Aug 2022 15:02:42 +0000 (GMT)
Message-ID: <7f42b244079087f3a2e53e67871dde377d8402cf.camel@linux.ibm.com>
Subject: Re: [PATCH v3 1/4] accel/tcg: Invalidate translations when clearing
 PAGE_EXEC
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, Laurent Vivier
 <laurent@vivier.eu>, Eduardo Habkost <eduardo@habkost.net>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, Yanan Wang
 <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, David
 Hildenbrand <david@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org, Christian Borntraeger
 <borntraeger@linux.ibm.com>
Date: Fri, 12 Aug 2022 17:02:41 +0200
In-Reply-To: <0070ac70-9c86-b360-e877-3d7e01d176ea@linaro.org>
References: <20220808171022.49439-1-iii@linux.ibm.com>
 <20220808171022.49439-2-iii@linux.ibm.com>
 <6e3e5974-15eb-05e8-a005-942884732fef@linaro.org>
 <23d43d7cda9293eca9afbba91c50f613d004a407.camel@linux.ibm.com>
 <0070ac70-9c86-b360-e877-3d7e01d176ea@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dAJz9tAEJGjENpSVFjjTyA4cJmvhjmLq
X-Proofpoint-ORIG-GUID: jTmAn1WYpp71kjEedEb8YEltW3vvuG0a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-12_09,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=381
 mlxscore=0 priorityscore=1501 impostorscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208120039
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2022-08-11 at 08:42 -0700, Richard Henderson wrote:
> On 8/11/22 02:28, Ilya Leoshkevich wrote:
> > How is qemu-user's get_page_addr_code() involved here?
> > 
> > I tried to experiment with it, and while I agree that it looks
> > buggy,
> > it's called only from translation code paths. If we already have a
> > translation block, these code paths are not used.
> 
> It's called from tb_lookup too, when we're trying to find an existing
> TB.
> 
> 
> r~
> 

Oh, I see. I was first worried about direct block chaining with
goto_tb, but it turned out that translator_use_goto_tb() prevented it.

tb_lookup() skips get_page_addr_code() if tb is found in tb_jmp_cache.
I assume it's a bug?


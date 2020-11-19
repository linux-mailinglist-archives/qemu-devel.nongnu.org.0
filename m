Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDF62B9D6B
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 23:12:49 +0100 (CET)
Received: from localhost ([::1]:34190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfsAa-00045D-IS
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 17:12:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1kfrwX-0002NK-76
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:58:18 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:33046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1kfrwT-0004gR-JI
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:58:16 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AJLY2Z6064297; Thu, 19 Nov 2020 16:58:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=K4VNZor7g3CMmgHOFxWIRDBvVjrM8ZTy8fQSy+2WMF0=;
 b=sJSOVUpi5rLn2uC/wVgPdgAJ1Qs+k0U2egUiqmXPAhHcOeds36YuvIyh4WjzeYs0f3Fs
 MdkmsDzLKcjCLGijLjVdMWf1nlC5RGtXKvyO9RivJoYDsyBxil8mpq7z7OIBkhmK3gDN
 wt9mrhNVHKj8AV0FgpybV8Sie/9huZ8mLKdAGTc5P1YT+ZLyQO312vTosheYKDTwsaMP
 OBKQULHWcKo3QJwfMa6kS+F0OgJmA3v7sPF5IMtApGffbQhNxT/M8YLI6GSTvWxgESDR
 CnXzr3QjrF1gPAA34dVk5vzLn23eRsyrYEJoXqufFBOgTxTXg7dAf7T8Go0tNBZPArle rQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34x0kb0qbf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 16:58:11 -0500
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AJLwBDh041230;
 Thu, 19 Nov 2020 16:58:11 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34x0kb0qb4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 16:58:11 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AJLuqtF017144;
 Thu, 19 Nov 2020 21:58:10 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02dal.us.ibm.com with ESMTP id 34vgjmxh8c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 21:58:10 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AJLw0JJ27066694
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Nov 2020 21:58:00 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 096FA6A04D;
 Thu, 19 Nov 2020 21:58:09 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 758B36A04F;
 Thu, 19 Nov 2020 21:58:08 +0000 (GMT)
Received: from [9.65.247.165] (unknown [9.65.247.165])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 19 Nov 2020 21:58:08 +0000 (GMT)
Subject: Re: [PATCH v3 0/9] Add support for Control-Flow Integrity
To: Alexander Bulekov <alxndr@bu.edu>
References: <20201105221905.1350-1-dbuono@linux.vnet.ibm.com>
 <20201106134747.7c9a5050.cohuck@redhat.com>
 <e2e27a18-a0d0-77c2-5e5d-b4c210fec177@linux.vnet.ibm.com>
 <20201106145841.pijovw2xkieikgrg@mozz.bu.edu>
From: Daniele Buono <dbuono@linux.vnet.ibm.com>
Message-ID: <fb262d2b-2766-4718-1d89-9c271ad52743@linux.vnet.ibm.com>
Date: Thu, 19 Nov 2020 16:58:07 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20201106145841.pijovw2xkieikgrg@mozz.bu.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-19_12:2020-11-19,
 2020-11-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999
 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011190146
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=dbuono@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

Yeah I assumed it was an older version because the errors triggered by
clang11 stop the compilation.

I checked again and for oss-fuzz, you disable failing on warnings.
So again, these patches are not directly connected to CFI and therefore 
could land independently.

On 11/6/2020 9:58 AM, Alexander Bulekov wrote:
> I think oss-fuzz is using a bleeding edge version of Clang, so that
> might not be a problem.
> Here is the oss-fuzz build-log from earlier today:
> https://oss-fuzz-build-logs.storage.googleapis.com/log-1747e14f-6b87-43e0-96aa-07ea159e7eb2.txt
> 
> ...
> Step #4: C compiler for the host machine: clang (clang 12.0.0 "clang version 12.0.0 (https://github.com/llvm/llvm-project.git  c9f69ee7f94cfefc373c3c6cae08e51b11e6d3c2)")
> Step #4: C linker for the host machine: clang ld.bfd 2.26.1
> Step #4: Host machine cpu family: x86_64
> ...

Yeah I assumed it was an older version because the errors triggered by
clang11 stop the compilation.

I checked again and for oss-fuzz, you disable failing on warnings.
So again, these patches are not directly connected to CFI and therefore 
could land independently.


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F28013281C2
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 16:05:52 +0100 (CET)
Received: from localhost ([::1]:45658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGk7L-0004yb-Dc
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 10:05:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1lGk65-0004H4-BP
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 10:04:33 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:5440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1lGk63-0006Zg-7k
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 10:04:33 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 121EYWVE138068
 for <qemu-devel@nongnu.org>; Mon, 1 Mar 2021 09:59:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=YCc8ubzS+JZ24eqgbDU6q3IKaABj42IPb+AXy7zMkZ8=;
 b=k9fN3jEa7JgtsQxhqC2JUX4zZnea1zFB6p+24oMP7/J3EIcAfOgDRus3pcAmgXUoOw5T
 NY00Ir3Wsupb+uaaL7+6bV54bmC8Vt9YYNn8c0yrHOYDSu0b7XIWXODUa7dY69DCvsJm
 zYTbRxU/aK4Iw9CJbT8rbpxg1cdqs7KEplZ4fO/TqFgQ6ldj+ScAb0lTclYKy3yHGrdK
 NXoOL+Ms3AkG6g/R2lhAyJnHG4BNbHCQNv46rhu/OJW0mVbbKJSH5ooFkAKMdECNHjph
 Pa1jME88fgQ+xGbsyf6xZRsbdZF8iplaUpfkMNSsmrSgW5D/RTzLxzDqe9wydpvQxPSF 6A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 370sg4jmqs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 09:59:26 -0500
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 121EYp3A139466
 for <qemu-devel@nongnu.org>; Mon, 1 Mar 2021 09:59:25 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 370sg4jmqj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Mar 2021 09:59:25 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 121EwJbR007644;
 Mon, 1 Mar 2021 14:59:25 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04dal.us.ibm.com with ESMTP id 36ydq8uuwu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Mar 2021 14:59:25 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 121ExOh737487000
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 1 Mar 2021 14:59:24 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 07F5A6A047;
 Mon,  1 Mar 2021 14:59:24 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 95ED86A051;
 Mon,  1 Mar 2021 14:59:23 +0000 (GMT)
Received: from [9.211.86.147] (unknown [9.211.86.147])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  1 Mar 2021 14:59:23 +0000 (GMT)
Subject: Re: [PATCH v2 0/2] gitlab-ci.yml: Add jobs to test CFI
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210226152108.7848-1-dbuono@linux.vnet.ibm.com>
 <YDy8qsRRR3FmWr1D@redhat.com>
From: Daniele Buono <dbuono@linux.vnet.ibm.com>
Message-ID: <56d3d1a6-00af-1cc9-e980-748548191202@linux.vnet.ibm.com>
Date: Mon, 1 Mar 2021 09:59:22 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YDy8qsRRR3FmWr1D@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-01_08:2021-03-01,
 2021-03-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103010123
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=dbuono@linux.vnet.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Daniel,

On 3/1/2021 5:06 AM, Daniel P. Berrangé wrote:
> On Fri, Feb 26, 2021 at 10:21:06AM -0500, Daniele Buono wrote:
>> Build jobs are on the longer side (about 2h and 20m), but I thought it
>> would be better to just have 6 large jobs than tens of smaller ones.
> 
> IMHO that is a not viable.
> 
> Our longest job today is approx 60 minutes, and that is already
> painfully long when developers are repeatedly testing their
> patch series to find and fix bugs before posting them for review.
> I can perhaps get through 5-6 test cycles in a day. If we have a
> 2 hour 20 min job, then I'll get 2-3 test cycles a day.
> 
> I don't want to see any new jobs added which increase the longest
> job execution time. We want to reduce our max job time if anything.
> 
> 

I totally understand the argument.

We could build two targets per job. That would create build jobs that
take 40 to 60-ish minutes. If that's the case, however, I would not
recommend testing all the possible targets but limit them to what
is considered a set of most common targets. I have an example of the
resulting pipeline here:

https://gitlab.com/dbuono/qemu/-/pipelines/258983262

I selected intel, power, arm and s390 as "common" targets. Would
something like this be a viable alternative? Perhaps after
due thinking of what targets should be tested?

> Regards,
> Daniel
> 


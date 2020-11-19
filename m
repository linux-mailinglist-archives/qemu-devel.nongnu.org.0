Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1112B9882
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 17:49:33 +0100 (CET)
Received: from localhost ([::1]:52894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfn7k-0003AU-EF
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 11:49:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1kfn2i-0007Ck-Ng
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:44:21 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:8038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1kfn2g-00081S-OO
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:44:20 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AJGWarB034488; Thu, 19 Nov 2020 11:44:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=LiqfshhO3ObGGv+rTsSMhujrrPXO2ECwEsueD0Twkpg=;
 b=EGbfYhTFbHZ1eZVoAtIXYxZiJK4bxAmGW19a+5cIezmFiLjXISz41Hjm1Cwo+qXqQnsP
 LlXPJ2Wg9Jcb3SrsDxNYgxUnMn+JPTUF8LtgJHJwhOpfWJkjsrADqkpRyNJQA5P+cWps
 R34y15J7OSjLX8sjqYPmNTapsNXo44LBw6D9a+LUp7GrCv183DDnuI+xLWUDwL8AE8m0
 IAAWiPWyLhggUPhzkvoPVlDXLQJIMSb0UIOD3zqBmXIMFBDFAnr7xOGcC7LJZlA3lTgS
 TAodCMLq4zPBvGabpN85vZTVAmRVLmo4LyzPYlkMPhXERYPcx1m8KkPN8r/zW6fsMGj4 5Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34wv14s718-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 11:44:06 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AJGWkrc035477;
 Thu, 19 Nov 2020 11:44:06 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34wv14s70u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 11:44:06 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AJGfZYf020349;
 Thu, 19 Nov 2020 16:44:05 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 34w2634gkb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 16:44:05 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AJGhs8562783800
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Nov 2020 16:43:54 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AC9746A047;
 Thu, 19 Nov 2020 16:44:03 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 177776A04D;
 Thu, 19 Nov 2020 16:44:02 +0000 (GMT)
Received: from [9.65.247.165] (unknown [9.65.247.165])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 19 Nov 2020 16:44:02 +0000 (GMT)
Subject: Re: [PATCH-for-5.2? v3 5/9] scsi: fix overflow in
 scsi_disk_new_request_dump
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201105221905.1350-1-dbuono@linux.vnet.ibm.com>
 <20201105221905.1350-6-dbuono@linux.vnet.ibm.com>
 <ad3594d4-3541-32fd-ad61-9b57f2d08e5b@redhat.com>
 <b6dcbbe3-294f-dcf4-72a6-c29314ec0d8d@redhat.com>
 <2382c0b4-6fe2-3e0b-e349-1ac12b47fbb5@redhat.com>
From: Daniele Buono <dbuono@linux.vnet.ibm.com>
Message-ID: <b313b29e-ecba-f113-2c8e-f7d4466ae219@linux.vnet.ibm.com>
Date: Thu, 19 Nov 2020 11:44:01 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <2382c0b4-6fe2-3e0b-e349-1ac12b47fbb5@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-19_09:2020-11-19,
 2020-11-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 phishscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=958 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011190118
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=dbuono@linux.vnet.ibm.com; helo=mx0b-001b2d01.pphosted.com
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,
Since you have a patch upcoming, may I drop this patch
from this set?

Daniele

On 11/9/2020 8:26 AM, Philippe Mathieu-Daudé wrote:
> I did it. Will post later as this is 6.0 material.


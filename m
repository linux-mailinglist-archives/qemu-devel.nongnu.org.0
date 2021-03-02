Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D0E32A613
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 17:33:23 +0100 (CET)
Received: from localhost ([::1]:48352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH7xa-0006kz-Br
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 11:33:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1lH7wO-00069L-PM
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 11:32:08 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:51446
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1lH7wH-00023d-DK
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 11:32:08 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 122G3qEa087133
 for <qemu-devel@nongnu.org>; Tue, 2 Mar 2021 11:31:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=NI8W298TWQH6Sliq/2cp11Qt+rK5Rg6rgWUR2veL+Og=;
 b=MnILS1lHQOt3E52eVPtfkfILP3u1+ehOSkI5vCky/o5cXGGPNLAZn1IX6MMGqwhc9G6F
 I3Blagg+wD8tOvcjFaVhGXsg/EN8+EgxeXP1ihUmfaqk9/5RRoDb6MK/dC+epHzYwKwn
 YrNxKpWRx01WNGQz+S7wt8XAHpV218SO88l7cLadyemeeG8IQhKFCUe0HnwJWPZ+GgOr
 LF9DR7M2wHVOdV90FZgmL1RMp2AYSkLS/3Ve/BlgocoLP1SmbKdA6g6yGLV/fWo3bEY4
 9KgPiwmcdXagn9CXvb4gqPX0SE0/LOiCMWE7NBZNQNt8KZEIPxKiaNFfhUrqgV3/R9+U TQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 371pgcx797-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 11:31:58 -0500
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 122G4FwR089882
 for <qemu-devel@nongnu.org>; Tue, 2 Mar 2021 11:31:58 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 371pgcx78s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 11:31:57 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 122GQpAw022704;
 Tue, 2 Mar 2021 16:31:57 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01dal.us.ibm.com with ESMTP id 371qmu8qus-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 16:31:57 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 122GVujD50528556
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Mar 2021 16:31:56 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 18F766A054;
 Tue,  2 Mar 2021 16:31:56 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF2C96A047;
 Tue,  2 Mar 2021 16:31:55 +0000 (GMT)
Received: from [9.211.86.147] (unknown [9.211.86.147])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  2 Mar 2021 16:31:55 +0000 (GMT)
Subject: Re: [PATCH v2 0/2] gitlab-ci.yml: Add jobs to test CFI
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210226152108.7848-1-dbuono@linux.vnet.ibm.com>
 <YDy8qsRRR3FmWr1D@redhat.com>
 <56d3d1a6-00af-1cc9-e980-748548191202@linux.vnet.ibm.com>
 <YD0Day/wGawuWdpi@redhat.com>
 <950b36a4-ec19-84df-9292-c88c390ce5fc@linux.vnet.ibm.com>
 <YD4T1nVIEdL7/IoG@redhat.com>
 <50a8e650-841f-cac4-8a14-8c659ef274ca@linux.vnet.ibm.com>
 <YD5b74uynDvWUySy@redhat.com>
From: Daniele Buono <dbuono@linux.vnet.ibm.com>
Message-ID: <a4f78c9c-3a42-13dc-f095-16144d09ca6b@linux.vnet.ibm.com>
Date: Tue, 2 Mar 2021 11:31:54 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YD5b74uynDvWUySy@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-02_06:2021-03-01,
 2021-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 spamscore=0 mlxscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2103020127
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=dbuono@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
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


On 3/2/2021 10:38 AM, Daniel P. Berrangé wrote:
> Is this scenario going to upset  CFI, or is it happy that 'void *'
> is compatible with 'mytype *', and ok with the intermediate casts
> to/from GCallback ?

This is a valid scenario. LLVM does offer the ability of considering all 
pointer types compatible, and it is being enabled in QEMU. So void* is 
compatible to any type* and that would not be considered a fault.

Intermediate casts are also fine since you are just passing the pointer 
but not using it. The check will happen only when the function is 
called, at which point it was cast back to something compatible.


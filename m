Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D149C4C1474
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 14:44:14 +0100 (CET)
Received: from localhost ([::1]:41318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMrwD-0007c3-LV
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 08:44:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1nMrsg-00064B-86; Wed, 23 Feb 2022 08:40:35 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:23070
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1nMrsX-0003Dt-GU; Wed, 23 Feb 2022 08:40:27 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21NBklx0005481; 
 Wed, 23 Feb 2022 13:40:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=XxF2VZloN8B/d2q0QlWm/kC0XaPTUbMuq6BoxH9WTYE=;
 b=ahX0qAeqWhgSaHvJZpqWR48iyOwcD+YQxp5VlS7kEjXRg5YibeD00TKXeFTWOIq5/YoR
 sT8QtC/jcHW4Ex4SiNgEhudDgJglpVZCFUTdi90wsp+KbQCJkt3OcF2peYv+CN/TXKaD
 UomQcML6oFb3nqwaySlhZ2gLbf91tpvwP+u3LKFbmC+2Wlsq8r9I4TE+H43yNjaIfZib
 PEUn35yDzuwupTvRLxj257QGGCo0VChRpe5srbBiARMEiNAr+3ZGg06Nstpy/jdEfeTq
 4ni+3NtD617q6j0C7pOm5JJ9W0guQSy31RmK4dyMrM6S2ISbSMoZEo5Y49qwy5zJGvQW Kg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3edmbracp7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Feb 2022 13:40:22 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21NDabE1028218;
 Wed, 23 Feb 2022 13:40:21 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3edmbracnr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Feb 2022 13:40:21 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21NDWUKj030319;
 Wed, 23 Feb 2022 13:40:19 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 3eaqtjac8w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Feb 2022 13:40:19 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21NDeG5S49217870
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Feb 2022 13:40:16 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 82BCC4C044;
 Wed, 23 Feb 2022 13:40:16 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1726D4C040;
 Wed, 23 Feb 2022 13:40:16 +0000 (GMT)
Received: from [9.171.70.253] (unknown [9.171.70.253])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 23 Feb 2022 13:40:16 +0000 (GMT)
Message-ID: <3db47aeb-a57e-55e3-92f2-620845fe00df@linux.ibm.com>
Date: Wed, 23 Feb 2022 14:40:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 1/4] s390x/tcg: Implement
 Miscellaneous-Instruction-Extensions Facility 3 for the s390x
Content-Language: en-US
To: David Miller <dmiller423@gmail.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20220217231728.13932-1-dmiller423@gmail.com>
 <20220217231728.13932-2-dmiller423@gmail.com>
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <20220217231728.13932-2-dmiller423@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: p0clgdjUKkkiJY--zT6k1NGAw9PKXPYc
X-Proofpoint-GUID: vLw1cnuIsvjKaFdfxYfGppmF9_Adibsz
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-23_06,2022-02-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 mlxlogscore=911 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202230077
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, farman@linux.ibm.com, pasic@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Am 18.02.22 um 00:17 schrieb David Miller:
> resolves: https://gitlab.com/qemu-project/qemu/-/issues/737
> implements:
> AND WITH COMPLEMENT   (NCRK, NCGRK)
> NAND                  (NNRK, NNGRK)
> NOT EXCLUSIVE OR      (NXRK, NXGRK)
> NOR                   (NORK, NOGRK)
> OR WITH COMPLEMENT    (OCRK, OCGRK)
> SELECT                (SELR, SELGR)
> SELECT HIGH           (SELFHR)
> MOVE RIGHT TO LEFT    (MVCRL)
> POPULATION COUNT      (POPCNT)
> 
> Signed-off-by: David Miller <dmiller423@gmail.com>

For your next patches, feel free to add previous Reviewed-by: tags so that others
can see what review has already happened.


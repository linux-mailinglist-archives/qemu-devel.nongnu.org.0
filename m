Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6C947F9D0
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Dec 2021 03:59:42 +0100 (CET)
Received: from localhost ([::1]:57894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1gEf-0003FV-Ab
	for lists+qemu-devel@lfdr.de; Sun, 26 Dec 2021 21:59:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1n1gDE-0002WH-Uf
 for qemu-devel@nongnu.org; Sun, 26 Dec 2021 21:58:13 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:2940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1n1gDC-0003Ag-Sv
 for qemu-devel@nongnu.org; Sun, 26 Dec 2021 21:58:12 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BR2gQCP027036; 
 Mon, 27 Dec 2021 02:58:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : from : to : references : cc : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=xj0w9EXIEdOxevdyaLcw1e6PLrIsdfM68XIr/ydEPf8=;
 b=YV4GeEs3OVELXIe0vRUkK8F6EoQEkP3gbEg5cHz/hYOFl1HsTU3ixzLNCbmwCK+PvRDk
 5jhZ53dux/hg+Sp6Bkxd5+mrp5g5i0JNhkd2bosL1vj4wbmsLodLEzJSwXEj5fvZhwRx
 ZYA5hw9aAnCbqLxOCb8BggE2YvwK/s352o3tieK1TTDnJjyobIoh3lqtIFAXF832d/uM
 qb6gqTOE/4/lzQBAfFWgCCgCBK6h+gg/LgKVSub+tt5oPX4AD6N9HGVtn7SIUEU7ofl7
 KIY6+XdmtR0rjFwIBIy0a22CVFxl37oDRaK0pTC8jrbO9gtKkETuqpQfrf3KdN1hLJ2N QA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d74x5g58g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 02:58:05 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BR2tEfE025309;
 Mon, 27 Dec 2021 02:58:05 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d74x5g58a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 02:58:05 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BR2r8cP026830;
 Mon, 27 Dec 2021 02:58:04 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01dal.us.ibm.com with ESMTP id 3d5txafmux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 02:58:04 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BR2w39628246362
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Dec 2021 02:58:03 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9F262AE05F;
 Mon, 27 Dec 2021 02:58:03 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 821BEAE05C;
 Mon, 27 Dec 2021 02:58:03 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 27 Dec 2021 02:58:03 +0000 (GMT)
Message-ID: <763f7863-1a14-4d94-7d0b-aa894f8986bf@linux.ibm.com>
Date: Sun, 26 Dec 2021 21:58:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] tpm: fixed be_buffer_size size in in tpm_crb
Content-Language: en-US
From: Stefan Berger <stefanb@linux.ibm.com>
To: Yuri Konotopov <ykonotopov@gnome.org>, qemu-devel@nongnu.org
References: <20211225123806.113368-1-ykonotopov@gnome.org>
 <c212e049-0f1a-dc81-e785-2ae02097187d@linux.ibm.com>
In-Reply-To: <c212e049-0f1a-dc81-e785-2ae02097187d@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4uU4aPssAOn8UEHJyy0uEh8xeb-JovQl
X-Proofpoint-GUID: Z1vldJuT_-5rPe824SeQP1fU1TOrJyZD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-26_11,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 suspectscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112270012
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.063,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 12/26/21 21:24, Stefan Berger wrote:
>
> On 12/25/21 07:38, Yuri Konotopov wrote:
>> Trying to boot VM with TPM 2.0 CRB in passthrough mode without this 
>> change
>> I got "Requested buffer size of 3968 is smaller than host TPM's fixed
>> buffer size of 4096".
>
> I suppose the host has a TIS interface.
>
> The reason it gives this message is that the response this TPM may 
> send back could be 4096 bytes in size but the CRB of the VM can only 
> catch 3968 bytes, so there's a mismatch. You may not be able to use 
> the CRB in passthrough mode. I would try to have the VM use the TIS.


For TPM passthrough the host TPM's buffer size basically has to match 
the VM's buffer size so that

- apps inside the VM cannot create longer commands than what the host 
device can accept

- apps inside the VM cannot create commands that cause the TPM to return 
responses that are bigger than what the VM's TPM buffer can accept

   Stefan




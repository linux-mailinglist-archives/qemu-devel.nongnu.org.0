Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1764C65D2
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 10:42:44 +0100 (CET)
Received: from localhost ([::1]:32974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOcYE-00059L-BR
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 04:42:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1nOcVk-0004HS-8T
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 04:40:08 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:32484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1nOcVi-0002D4-8A
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 04:40:07 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21S8i2jP027412; 
 Mon, 28 Feb 2022 09:40:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=XiPL9MQP5llScqSXk7BGe+Q3nsSCHMxZ1bNta8sKPEE=;
 b=QBnUwcpqZrRQz3Yp0T8QQTTOXSPHpniJDL+MXfOVuyDXQqMt13ltgVo4Wb+ehOY63BXV
 xc8UTwPMKgM99snMQaca0DpYB5ibf7RCv4oSHujqTUCfWHQhkh+5ek5+V/JmOYzQNQVr
 evBCjwlO1KTsuiVAEyodcrxWLyXcH/UQGXNKIEo93VljoK3AZDDIOBPtCL/8IjqvVTyl
 ZzS8N1gdpGsMeZdwmV2830e3pKZ8W6yDSog3idPakt6jmMymW/I8hxtsKfYs6DuoRweE
 NbES0MIvIzy8uK+VX24rvuDC5j3AUj9EbzeXX6fd9ELWG+u/kfNPf0EGRLX4vf+hy69/ HQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3egu53s86h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 09:40:01 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21S8jaIE002302;
 Mon, 28 Feb 2022 09:40:01 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3egu53s85v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 09:40:01 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21S9XIsV008326;
 Mon, 28 Feb 2022 09:40:00 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01dal.us.ibm.com with ESMTP id 3efbu9yefm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 09:40:00 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21S9dwuv33882622
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 09:39:58 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 834EB7806A;
 Mon, 28 Feb 2022 09:39:58 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B6147806D;
 Mon, 28 Feb 2022 09:39:56 +0000 (GMT)
Received: from [9.148.12.169] (unknown [9.148.12.169])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 28 Feb 2022 09:39:55 +0000 (GMT)
Message-ID: <982bd5bf-a3a8-f75c-73bd-2722f72cc476@linux.ibm.com>
Date: Mon, 28 Feb 2022 11:39:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3] qapi, target/i386/sev: Add cpu0-id to
 query-sev-capabilities
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220228093014.882288-1-dovmurik@linux.ibm.com>
 <YhyWg1UaOPMIkODz@redhat.com>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <YhyWg1UaOPMIkODz@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: c0rUXSNiQU6U_KLyahQyEJ6U2kWjZNMV
X-Proofpoint-GUID: IiyxQnRImK0U7pUadtWl5-Bfx5IMhbcX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-28_03,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202280053
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Markus Armbruster <armbru@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 28/02/2022 11:31, Daniel P. Berrangé wrote:
> On Mon, Feb 28, 2022 at 09:30:14AM +0000, Dov Murik wrote:
>> Add a new field 'cpu0-id' to the response of query-sev-capabilities QMP
>> command.  The value of the field is the base64-encoded unique ID of CPU0
>> (socket 0), which can be used to retrieve the signed CEK of the CPU from
>> AMD's Key Distribution Service (KDS).
>>
>> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> 

Thanks Daniel for reviewing.

Next: libvirt patch to add this field to response of virNodeGetSEVInfo().

-Dov


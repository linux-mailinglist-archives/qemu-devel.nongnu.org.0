Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6534967A61C
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 23:44:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKS1V-00060x-N8; Tue, 24 Jan 2023 17:44:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pKS1R-00060M-BU; Tue, 24 Jan 2023 17:44:09 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pKS1P-0004hC-S9; Tue, 24 Jan 2023 17:44:09 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30OLJ3RB000981; Tue, 24 Jan 2023 22:43:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=O+6XlrNNAlnt/xtrZJsAfNuxhU0XmwMNoEHmLMBYDYo=;
 b=WENW+7JDlVQyJDuXC3uRuGpcOZCVZMU5dAVZEaQg4/tdW5yeRKjds8E6lUC7vLMQJcjc
 n9frIOKqPeEmugCNyksLpf6SDXu3pTgQEqsITXRfX86OivHlpecYTQV0o8+s0f/M9xJX
 +vIm/nuLaAfqsh2fy/srQEIu/VLDGGzhEZekxndqEqDQO4+e6uvtGrc04fs1NTO/9PgP
 NgvSkkbs8B0jihfKVoIqe49PrRlIcr/EtWnCWLM2vUwFwBzprKnUqYV6EuEgjtdCavib
 Z4vMOCUhS5PaobW8lmIdLvYRx8FrxGPylqKvASA8qZEp5lXNxZX3hLhYfRnzlGlZ5eHP dQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nacg132ex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Jan 2023 22:43:56 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30OMNijY026631;
 Tue, 24 Jan 2023 22:43:55 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nacg132e9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Jan 2023 22:43:55 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30OMWWW6004500;
 Tue, 24 Jan 2023 22:43:54 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
 by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3n87p81ub6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Jan 2023 22:43:53 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com
 [10.39.53.233])
 by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30OMhqaM64356702
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Jan 2023 22:43:52 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 94E065803F;
 Tue, 24 Jan 2023 22:43:52 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1EA425804E;
 Tue, 24 Jan 2023 22:43:50 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 24 Jan 2023 22:43:50 +0000 (GMT)
Message-ID: <e7238a54-8620-5e2a-8650-47b6df32f062@linux.ibm.com>
Date: Tue, 24 Jan 2023 17:43:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 01/32] monitor: Drop unnecessary includes
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, kraxel@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, marcandre.lureau@redhat.com, dgilbert@redhat.com,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, jasowang@redhat.com, jiri@resnulli.us,
 berrange@redhat.com, thuth@redhat.com, quintela@redhat.com,
 stefanb@linux.vnet.ibm.com, stefanha@redhat.com, kvm@vger.kernel.org,
 qemu-block@nongnu.org
References: <20230124121946.1139465-1-armbru@redhat.com>
 <20230124121946.1139465-2-armbru@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20230124121946.1139465-2-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Qd8hUhSK-0Kk_ahMUSEVKEjUcbZrM6ud
X-Proofpoint-GUID: 68k0hrKXCX2BjMMX8nuQJC0p94sbXNsp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-24_16,2023-01-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=832
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301240209
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148, SPF_HELO_NONE=0.001,
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



On 1/24/23 07:19, Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>



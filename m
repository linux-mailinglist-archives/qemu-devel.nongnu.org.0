Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F85565B874
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 01:51:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCVUs-0007U0-IJ; Mon, 02 Jan 2023 19:49:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pCVUo-0007Th-Ek
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 19:49:38 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pCVUm-0000xc-Ef
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 19:49:37 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 302K00Sn017415
 for <qemu-devel@nongnu.org>; Tue, 3 Jan 2023 00:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=kFoFzDUtfd6lpUx8+0jo3FKaYIZfE2pj5d6Od9J8Q2c=;
 b=rAI6PsI38rI6USZaJw/PCuvId/LmRX5il3S95p3/QesRlSFLyDpv9Oczapr2SzE8v9TE
 DolwJ2gwQ4zwy34P9I69aQ7LvODxeZ27w11GIQn9jcGKZsuH+RZ/J8SaOp5d9YV/8Lag
 epx74JYs4YL+oKExfflCrCQSe3NbacWPl4kJW2u0jA7YLmsoPliGIkEbq5BSVKHMJXBR
 U4s7tsyTx08aDz7z39j/XQxLnE5IfX6Yg47uowETG5aVrO0z4uWJGOnJPmF2BE0M5Kv3
 PSlMnRAoA8oby2CAJR513u9qDfg0RgTyQ0si/AT5kijMCFaKyxy4JblOJ24gVPNdgHYp WQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mv5wu3m9y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 00:49:32 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3030nWIv016341
 for <qemu-devel@nongnu.org>; Tue, 3 Jan 2023 00:49:32 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mv5wu3m9u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Jan 2023 00:49:32 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30303PHg026039;
 Tue, 3 Jan 2023 00:49:31 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([9.208.129.118])
 by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3mtcq7amue-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Jan 2023 00:49:31 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com
 [10.241.53.101])
 by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3030nTpJ6423086
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Jan 2023 00:49:29 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 68EF958051;
 Tue,  3 Jan 2023 00:49:29 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F07F45805A;
 Tue,  3 Jan 2023 00:49:28 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Tue,  3 Jan 2023 00:49:28 +0000 (GMT)
Message-ID: <16b3436f-5872-10f5-c79e-996c2b6910ce@linux.ibm.com>
Date: Mon, 2 Jan 2023 19:49:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v4 1/2] tpm: convert tpmdev options processing to new
 visitor format
Content-Language: en-US
To: jejb@linux.ibm.com, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20221230152415.27375-1-jejb@linux.ibm.com>
 <20221230152415.27375-2-jejb@linux.ibm.com>
 <a36be6a2-38c0-4b65-20a8-5a9cacca7d71@linux.ibm.com>
 <d64f8077dbe7ecddc225df62d746883ebc54928e.camel@linux.ibm.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <d64f8077dbe7ecddc225df62d746883ebc54928e.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dE73R3Lhh84TKdu1kOGjLajxgHe8-DxT
X-Proofpoint-GUID: rdFn4WOqHo03sDfLwjnA8__OWQW0hdlr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-02_14,2022-12-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 mlxscore=0 adultscore=0 impostorscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301030003
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.142, SPF_HELO_NONE=0.001,
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



On 12/30/22 22:40, James Bottomley wrote:
> On Fri, 2022-12-30 at 12:01 -0500, Stefan Berger wrote:
>> On 12/30/22 10:24, James Bottomley wrote:
> [...]
>>> @@ -2906,9 +2893,7 @@ void qemu_init(int argc, char **argv)
>>>                    break;
>>>    #ifdef CONFIG_TPM
>>>                case QEMU_OPTION_tpmdev:
>>> -                if (tpm_config_parse(qemu_find_opts("tpmdev"),
>>> optarg) < 0) {
>>> -                    exit(1);
>>> -                }
>>> +                tpm_config_parse(optarg);
>>
>> The patches don't apply to upstream's master.
> 
> I think it depends how you apply them.  If you use git, they do except
> a minor merge conflict in tpm_passthrough.c

It has changed quite a bit there, so I let you rebase the series.

    Stefan


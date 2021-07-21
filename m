Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6923D140B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 18:24:55 +0200 (CEST)
Received: from localhost ([::1]:49254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6F1i-0002Qe-DK
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 12:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1m6Ex4-0004Zn-89
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 12:20:06 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:8874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1m6Ex0-000740-U5
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 12:20:05 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16LGCjWq018132; Wed, 21 Jul 2021 16:19:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=kvBALPn3aXneL0uIJFO8QRi+3xT6M1XNGhd81aFHnO4=;
 b=wPUT4U8Jpf3ZYLA7CwplxefSwFRYxjS98Qw+K7ntiWfNGwIfX+Q8rhG+V6VyTX5qwnSn
 Oz0MBYHAO4uU2Gaz0HHU6iVmSGKurnjNVAuHVuGtY6YIadoD1tUBwViZimh8uc86oGD/
 srsTPWv56hyIsDaWf+inp2CMf1TKMdFfTU80oWyVfkwN7iv4e+2FqGASW942VbCXCJHk
 4NDSJPRBO6Rcem1SVR17GcxoEjcX/cibP1XeAVGy0Q+n5t/Mm7ma5z6d04VtUPU+1m3b
 xS9KgzYPdHLc413Vx0hzNx6chJUfnSrg48jXDqcD0SR9Q9ThwaolJQE+ZDjv4JbJZU7x Hw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=kvBALPn3aXneL0uIJFO8QRi+3xT6M1XNGhd81aFHnO4=;
 b=hcJQ26+OgRcYVbcCVIr3+Wy7YJAHhb+17O4AUO04HrXgmHwdYl5BIy+n2lvzD1khfg1m
 Hb1WjKom9OLhQPepw9q4szEElvh5vqTN5Y6afK1fdz5TYCGZ9ZLInLNM8dKjmsdubK50
 uDYyts1vIDs8mzmcARD6jjQEl4uGNvp7Okw6u6OliRTWm+dnZA+sddCyoRDcUK57vHUR
 jE4au5H9BBPEqQgayJzsSf0Zwp1ZIfMrfodENeM2oT4AYyJb+RUnoG6tLuTJ+1QLdtJa
 L9kbsradMuGC+9U54w7K93TBQCGvSD5tcTHsENTXkMuquGbX09/kM7W5hYWKCIzQ9EZJ sg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39wvr8b9vq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Jul 2021 16:19:58 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16LGFLQl028733;
 Wed, 21 Jul 2021 16:19:57 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2175.outbound.protection.outlook.com [104.47.73.175])
 by aserp3030.oracle.com with ESMTP id 39wunm8bju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Jul 2021 16:19:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kG3zZPIGRddNNvoPwj9sDHgeLG95rpOC9LEo0aDVkGVtcD5SQi/n3AaO1NHRfSIM7dCPFBi2EFCHpWY8uWllw5B4cBRTeRIgvD1H36qCaLdW6yvSoSGol0L56MUIpoFdymmwBNjqBeOnagYYmT3LHLtJs1vxGh9T9sFJLu5836VvpA6I/h+CAuahp+b6yZXqqWpwbjcJqELgi6magkP2QvEM/XBQISUX2avyAJSoZR64mWhNmnHB0SjUjLloFWnW5JvmtUYKOJoT+weUAhGer8P5tc+tKBB/MxUUjUv1VHb5NCWIMsOH4osDE9gskV21dn3flr67dEul71so5a4UBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kvBALPn3aXneL0uIJFO8QRi+3xT6M1XNGhd81aFHnO4=;
 b=UoF2TvzxaQx2SEfs4G314K4ePJvY+cNdQB+P9k4Ol5Pt69H8vmudAfe5y5vwKsSHhEr/ZW2qJeQgejDNm2j+ViYvEX7Yg2C4DLfLENYcrZS1xoWe7/h30QEhXUEKebUs6p6LI932ea3JPyk+Hntjm+HH2PEThlDnnWvHcV1lCCVCkASH6rErQDNOKkSzKvSS9aFL4dgwEOPwz4bYgclqKntyICghlN+A+QwjnU/+CUO9HUB9VcR0iW6HT7ez0l+oz5pRjETVmN3S1GJ3CBFkk7eb1a+eUaBRLbV1ctjllljlREGnGPI0lGNZB1aRnok08/MmtxPsDSDBV0h1WwEWIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kvBALPn3aXneL0uIJFO8QRi+3xT6M1XNGhd81aFHnO4=;
 b=lq2KTmCqnAeJ6K4G3y/1ulRtdB84jCRhSQmS4ooIyEfOAaWGVCfGKotNt+4M4OhfqwLkkzGIG+mO8T/h1ZvjA/MM568REqqhvEX//b3DosjMs7ja3KJVs0k8+xqbM50Bt2pTTEM/jROXoXT6cXGWbNfP5Z1Kb4Ce6e605ERhE8A=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com (2603:10b6:a03:2da::19)
 by BYAPR10MB3173.namprd10.prod.outlook.com (2603:10b6:a03:153::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Wed, 21 Jul
 2021 16:19:54 +0000
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::d1ad:b140:4d55:67a5]) by SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::d1ad:b140:4d55:67a5%9]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 16:19:54 +0000
Subject: Re: [PATCH v5 10/10] ACPI ERST: step 6 of bios-tables-test.c
To: Igor Mammedov <imammedo@redhat.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
 <1625080041-29010-11-git-send-email-eric.devolder@oracle.com>
 <20210720152459.050b229d@redhat.com>
From: Eric DeVolder <eric.devolder@oracle.com>
Message-ID: <70da4306-876c-7ac9-eb91-949acff4b8ca@oracle.com>
Date: Wed, 21 Jul 2021 11:19:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210720152459.050b229d@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0030.namprd08.prod.outlook.com
 (2603:10b6:a03:100::43) To SJ0PR10MB4542.namprd10.prod.outlook.com
 (2603:10b6:a03:2da::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2606:b400:414:8061:221:28ff:fea5:27c8]
 (2606:b400:8024:1010::112a) by BYAPR08CA0030.namprd08.prod.outlook.com
 (2603:10b6:a03:100::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24 via Frontend
 Transport; Wed, 21 Jul 2021 16:19:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a878687-6f6b-411f-5023-08d94c63600e
X-MS-TrafficTypeDiagnostic: BYAPR10MB3173:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB317376313976D0A1EE9A266297E39@BYAPR10MB3173.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:489;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iwa4z9UmGXBbuAgdcDV0Z9CI1PiYGZmZ0nKSdms+UsednC2cqLyyirCdUh+Bw2h4961It1pFy9LyxxKU26KbQ744lmRwstKtbXNQMe8VHQsn8nr4riyVfVN8F6yiREYDcdfRCNEGQ8Q03P7Xl0RlpR/8RLV5RwjoWeFebQLqYoMZ3QokYnNiJglQoV2M79CSM+4cozNFEFmEHgD4dwYDkPBM7ocMuhbIQIWKFeRtlX0CZfdQohbh7rSc5qVzi17OX2XCDMWR/2w785f9Bh2hQh8VAtXzIWJ53UjwEImyU9opoYJy0docfmuyEGgCwa10/CqRJbLzlNTjiyKFTnmaSvIcDb5TPvqJNxLqIbPbyu3frpwVky4amPUv8ysHlk8hq7BXfsYtFAbLPhnz/sUIExCsDLZqe5ggD2B4HabWGHpkBtGWaC9+PhS1A1f7BZyKhS3OTYnVOJySxW6HBIbwK/wIgY3R4zUnX1gVncsVI76370uGozTKpKC5XBwbFf+z3VNxT0BxYVGqPEVAySXHGV71WXU0Zx1dp1m4xZjUtrxq/P8M7xkqxT0KYR8aYTnhVZjP7gWuZWsmX1XiEbGGx2NOJ5P42Aa8Vy29ljBx/Ow9I09RQfNBmIbXktz9ogSjSijgL5GqLqNIV+c9v5ysAFXz+qBaVytgUcJskyPi6rCWepI4O2FJPChBMozPMQikLExTYLQAxGGWxNH98MB7JsSbA9Rey8xpcvhpeF7GtIg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4542.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(39860400002)(346002)(396003)(136003)(53546011)(31686004)(6916009)(86362001)(186003)(8936002)(8676002)(6486002)(4326008)(478600001)(2616005)(31696002)(107886003)(316002)(66946007)(36756003)(66556008)(66476007)(38100700002)(83380400001)(2906002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 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
 =?utf-8?B?eWE1SSt3eXJ0U0lXazlUZz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a878687-6f6b-411f-5023-08d94c63600e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4542.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 16:19:54.8282 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U3Q3Rg5eeZBwhivSOAi3Q4qQh2P+J+14eOeNrrt4EL3O65FWVo+PHoREYVq69hyCtby6F82MtiAkPGZQoLMt/3XUTB0HbPI7V5FOU4kjSpE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3173
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10052
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107210095
X-Proofpoint-GUID: ukpgQc55HmGxoO2f6oX2nWEK9_y5gdl6
X-Proofpoint-ORIG-GUID: ukpgQc55HmGxoO2f6oX2nWEK9_y5gdl6
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.117, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/20/21 8:24 AM, Igor Mammedov wrote:
> On Wed, 30 Jun 2021 15:07:21 -0400
> Eric DeVolder <eric.devolder@oracle.com> wrote:
> 
>> Following the guidelines in tests/qtest/bios-tables-test.c, this
>> is step 6, the re-generated ACPI tables binary blobs.
> 
> looks like test case itself got lost somewhere along the way.
I now understand that this means the test cases in bios-tables-test.c.
I've tests in there now, though still working through a microvm fail.


>   
>>
>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>> ---
>>   tests/data/acpi/microvm/ERST                | Bin 0 -> 976 bytes
>>   tests/data/acpi/pc/ERST                     | Bin 0 -> 976 bytes
>>   tests/data/acpi/q35/ERST                    | Bin 0 -> 976 bytes
>>   tests/qtest/bios-tables-test-allowed-diff.h |   4 ----
>>   4 files changed, 4 deletions(-)
>>
>> diff --git a/tests/data/acpi/microvm/ERST b/tests/data/acpi/microvm/ERST
>> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..db2adaa8d9b45e295f9976d6bb5a07a813214f52 100644
>> GIT binary patch
>> literal 976
>> zcmaKqTMmLS5Jd+l50TdfOjv?(1qNf{pGN#}aW2XoVQ=kJawAMa;r8^<4tl<ik9Q&x
>> z9fs@aGWNsscIs_KB7$e!_x3{VFxa)yyAdhW<ewtq@KMTR;_(*;o)AYwsc#_I{R=ny
>> z8zx&whJ53fsGoYS{%e8zX-SD^^!|)F8lIhx`_IYG$#;3?dmQ>N$k#r!KbMbUbUyg_
>> zK(;pcerufGzoGM$#7pML|ITms2HKLp#iT7ge?`3d;=pU-HFM;Z{u=Td@?Bo=v9u+>
>> bCEw+h{yXwJ@?BooAHQFxe`xQi@1uMGuJKX<
>>
>> literal 0
>> HcmV?d00001
>>
>> diff --git a/tests/data/acpi/pc/ERST b/tests/data/acpi/pc/ERST
>> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..7236018951f9d111d8cacaa93ee07a8dc3294f18 100644
>> GIT binary patch
>> literal 976
>> zcmaKqSq_3Q6h#Y^dE9^rOK=GWV&b1h{BUvZ#VzQD#NN_}<VJW2!{zj}Jj(Gp++KlF
>> z-m^RRr=jicm%cUSDW!0a>)srw9ZqJfYH@yl5T!<U;}M6C67CcCCp`0jI3h}X4Z*CR
>> z@cQFuhiLM(wSRu-xcHA1F8zhXBbq;Aj)oWS$Nk6T$K>0*@ExA}PsmTmxA~y7^f&wF
>> z`=C;Mzb#Jlr!;>?JY$ah@BPi%Ksot29-5N<Er=Hro_R^UWRASiUqyaJzRfE>hSucQ
>> c<lDT_e?xvlzRfG^WB(fYq22#4zMDpU0r#ed0RR91
>>
>> literal 0
>> HcmV?d00001
>>
>> diff --git a/tests/data/acpi/q35/ERST b/tests/data/acpi/q35/ERST
>> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..7236018951f9d111d8cacaa93ee07a8dc3294f18 100644
>> GIT binary patch
>> literal 976
>> zcmaKqSq_3Q6h#Y^dE9^rOK=GWV&b1h{BUvZ#VzQD#NN_}<VJW2!{zj}Jj(Gp++KlF
>> z-m^RRr=jicm%cUSDW!0a>)srw9ZqJfYH@yl5T!<U;}M6C67CcCCp`0jI3h}X4Z*CR
>> z@cQFuhiLM(wSRu-xcHA1F8zhXBbq;Aj)oWS$Nk6T$K>0*@ExA}PsmTmxA~y7^f&wF
>> z`=C;Mzb#Jlr!;>?JY$ah@BPi%Ksot29-5N<Er=Hro_R^UWRASiUqyaJzRfE>hSucQ
>> c<lDT_e?xvlzRfG^WB(fYq22#4zMDpU0r#ed0RR91
>>
>> literal 0
>> HcmV?d00001
>>
>> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
>> index e004c71..dfb8523 100644
>> --- a/tests/qtest/bios-tables-test-allowed-diff.h
>> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
>> @@ -1,5 +1 @@
>>   /* List of comma-separated changed AML files to ignore */
>> -"tests/data/acpi/pc/ERST",
>> -"tests/data/acpi/q35/ERST",
>> -"tests/data/acpi/microvm/ERST",
>> -
> 


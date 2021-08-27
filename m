Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED643FA142
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 23:48:11 +0200 (CEST)
Received: from localhost ([::1]:45990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJjhp-0005IW-R6
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 17:48:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mJjfN-0002y6-6j
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 17:45:37 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:54776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mJjfJ-0003kQ-KA
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 17:45:36 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17RKcrxW002221; 
 Fri, 27 Aug 2021 21:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : from : to :
 cc : references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=1lzLwXnFxBcKP6LZMKnIu1yK0CcyBXoIgi1Xz4HV2QE=;
 b=k7oX3CN8+fEghlahrywSOtQPshcfB4teucnFHHpg2UuqRJ08AQ3/62vzlvMWqPVBXTIx
 1b8A7KGnjBFZudad/LtcX7sLArKdc8bVIy2V6SVfiWshLhJTD2bSxm076CG3PRKf2LJH
 UqFpAI50mpgh2z86h6sr0B1awIbxeRYnSt3apEmi1uUpHnQdDbHyYYBSbbeLFmrRGIu5
 vVYj6YsLHCVlYaWC8ofwKD4DYiZuE/vLhtTYyVbS2v4bAeN2dSX81qhW373jHHqcim61
 Q8tyNdGpwaxk5HEDQtzpKEGy19auFLD4Rek67AY4dPsqtxvdYn1YFaxXvG4RmrlQyOTo QQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : from : to :
 cc : references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=1lzLwXnFxBcKP6LZMKnIu1yK0CcyBXoIgi1Xz4HV2QE=;
 b=BeGvb8dgqJz85fV5jikOvTWfmK9O20nf/lm5nHsOWXcRbK2USh1wqshoGnNZ7E+Oiis2
 HR60aM3CzcfcT6itpRbtO6d0Lx7eC2loD4/JqPF820KxnaD4mCQiMGSKuHQVyiwD9d3e
 xv5kOGJ/T/jrU+4LxU78XUFmJiGx7Kwh72cBzhS/KRjhcCVGs4gYtlmRKUpQHE0mv5FJ
 90GGOB04BPQqNPYGpaJnz4b/rQkTFjDjwjetWHa4BhhJsCSMCjESWkEIlr5b0zjQa6uF
 g1gNUq8naoKloRzAwp3Zlo+Uz9y3ZWgCZAHGYgF+Ai7juV39KORTdXdvRIr9WPaGwqNz 9g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3apvjr1p3a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Aug 2021 21:45:28 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17RLjPfn098230;
 Fri, 27 Aug 2021 21:45:27 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
 by aserp3020.oracle.com with ESMTP id 3aq5yy5wr7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Aug 2021 21:45:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TvXuhgH/N+vvLXvJGiasbsQtHuMTqDUdM0VMWf0ewMqn+4ukYYxhf4LDgz/B8p6KjMGj3NQejwTHh4MrOnpNe7kannG/Ro5huGFeZWzfrg8NjSIkA6ybR1DfCEe84oyWvJ88MgBR2Ffk7pUhHg7HVZV3t2ZuibDCvw6HYZpfui3JJsADdvqE6laeE3GnW6sGcxM0D/eHWolSVQTBxZ953pszw/LOo76WMxuzVF6IHQwvwfxKq692dE8focs1olup1NzFBdT540dVYd3gRwGkxuZn1DHCxZhmBowYrwsrE6pwRPwYqfqOqruHJdBc6e6fUBwHFySfj2PbuHC+D+fYMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1lzLwXnFxBcKP6LZMKnIu1yK0CcyBXoIgi1Xz4HV2QE=;
 b=ZTPYba4FlgSNRWm/RmH1AnuRuqhX0hYmxdoFC0HG5yTetTrfcOlxYa1XhmSCbSw2C2BzxLJea76lOAIDxyTBps+AC494DlPn9Al41+XDqoBdS7gJghqG0ALwbxeaUae57i47xtS9djAE4AvWNRGNRNlw2HtYNHhDce7eUL9adRAKE7JrzxY2cNSPqTkHkw211TwDbX5GsFSSENdmR+43J3Rur73qMQfpVMBrfJHhLHVq36GJjd+AcuAe2B9eIk0sjL/C7/T/GnuSMMPdpbGxYkCyDE/CQeE23Y+iKbkiDzxG327FMPXoAMzRZgFOKk/pTnrrf/IH6JCIaDFEPSBuBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1lzLwXnFxBcKP6LZMKnIu1yK0CcyBXoIgi1Xz4HV2QE=;
 b=m9P0+umxnnEpxe7twTy0EWMHw47wFaMO/X8/CDYhPnayNMAvDtLrwSC61UO40mrz1VINoD0i0td2CXnvdqk5ed1wJyEBBatSJqSZLNBYsJwYd2ki7DW7o8XqU5XlaZUInzTifjQ8T/TduLnqpm87LE9qkzhB1ocksa6PUnnTr0g=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1856.namprd10.prod.outlook.com (2603:10b6:300:10e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Fri, 27 Aug
 2021 21:45:19 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::b973:d9fd:3883:2efc]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::b973:d9fd:3883:2efc%6]) with mapi id 15.20.4436.024; Fri, 27 Aug 2021
 21:45:19 +0000
Subject: Re: [PATCH v6 10/10] ACPI ERST: step 6 of bios-tables-test
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org, imammedo@redhat.com
References: <1628202639-16361-1-git-send-email-eric.devolder@oracle.com>
 <1628202639-16361-11-git-send-email-eric.devolder@oracle.com>
 <ee0dd71d-1583-120c-b5cc-be209c01b47c@oracle.com>
Message-ID: <3e25aaf1-6ce1-58d9-4095-8d684a29cfd4@oracle.com>
Date: Fri, 27 Aug 2021 16:45:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <ee0dd71d-1583-120c-b5cc-be209c01b47c@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0022.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::35) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2606:b400:414:8061:221:28ff:fea5:27c8]
 (2606:b400:8024:1010::112a) by BYAPR07CA0022.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18 via Frontend
 Transport; Fri, 27 Aug 2021 21:45:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 173781b0-2dc2-4b34-85a3-08d969a3f6aa
X-MS-TrafficTypeDiagnostic: MWHPR10MB1856:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB18565DEA52977403E224C87697C89@MWHPR10MB1856.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e5oJDXNcVA9IfwIUi05xcvk466rsP0oOHBzq+fGcePNW6tfM9PEOgzfhWNdI+XQZkcqZQe9q5OyFUuWOhnrZgHU085EQU+5oGQa7my0kNCTh4N9SOwcJQH42DRx3ZNmolezLLak4LXd9EmPe4fwjjkdzj/Gv+S7pEh/POb7dv6V4o43TyXCQHHLoOSGGNFtiJdmyTW0FRTMDmYm95rW5wkhlN6gRkJbR+tE51gaABnpELORq1fks7299n5iVT7SjARw9xrEM/unxRFxVpoVL280Tg7wMy8dBfcCkibeHz/39tq5egTE5jomu9Z2OY7VDIc9iFp+MFfuai1DODHP8RAn7gZZ8HqQ5x2g+eJqVenR4FL1sjAejQ7n5RvPdv27NdjSb6tLdcjZPhq8WpcBYh+8sca9goq1KxlkAfFfxVLkCeyDe4pI6WQR4tbG3hm1iCy8QF+igoNR+jXvF50SSDZl04F/BxYL3ndfZBSQjgVd2ukOLYHmjY7gF9zFTJlkucdyj5ktgmnpSFFZTJaGLq6o3Zbae0HAJAcwaePHMw9s6l54zGPb7CpLBoE+IDPGDQVA5N3Dq3klakjIEKJWRs+t4WqoNjLUioDdNBU/yRg2v0iv7mL9HqVtmBZhAzPTJj9mREZwIxi5ojCIPTlINhsbu2m+ahqQrj3fmrbrgQ0uFuXGNyhofH49gjJF1usqWGV5ElLciecOi7JtFk8q7Vb0OfKNuMkHpgEgzVdrIs6c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8676002)(31696002)(53546011)(66946007)(2616005)(8936002)(4326008)(5660300002)(186003)(86362001)(6486002)(31686004)(316002)(107886003)(38100700002)(66556008)(66476007)(2906002)(36756003)(508600001)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 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
 =?utf-8?B?ZnVoZjQ2Q213ZkEySXF4dz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 173781b0-2dc2-4b34-85a3-08d969a3f6aa
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 21:45:19.0712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s29VVctRHa5uZD7Ujj2Lhn2RIfqOidzZa8Blkg6KwL0Cb9NzKOjq5ZOMf6ab6SCTXJJwxM2ipBsYHI2w3s3X8ob8uv5m9m8hp15Hij/yh8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1856
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10089
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108270128
X-Proofpoint-GUID: awI5nVPniDJtiFC5HWn9TIoBXLViRZA0
X-Proofpoint-ORIG-GUID: awI5nVPniDJtiFC5HWn9TIoBXLViRZA0
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.437, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: ehabkost@redhat.com, konrad.wilk@oracle.com, mst@redhat.com,
 pbonzini@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Igor,
I'm not sure if I should post v7 with the correction to the tables,
or await your guidance/feedback on v6.
Thanks,
eric


On 8/6/21 12:16 PM, Eric DeVolder wrote:
> Well, I discovered today that running "make check" again resulted in
> bios table mismatches. In looking into this further, I think I might
> finally have an understanding as to how this is all to work. My
> bios-tables-test-allowed-diff for step 1 now looks like:
> 
> "tests/data/acpi/pc/DSDT.acpierst",
> "tests/data/acpi/pc/ERST",
> "tests/data/acpi/q35/DSDT.acpierst",
> "tests/data/acpi/q35/ERST",
> "tests/data/acpi/microvm/ERST.pcie",
> 
> and with the corresponding empty files and by using the
>   .variant = ".acpierst"
> in bios-tables-test, I am able to run "make check" multiple times
> now without failures.
> 
> So, that means patch 01/10 and 10/10 are wrong. I'm assuming there
> will be other items to address, so I'll plan for these fixes in
> v7.
> 
> My apologies,
> eric
> 
> 
> On 8/5/21 5:30 PM, Eric DeVolder wrote:
>> Following the guidelines in tests/qtest/bios-tables-test.c, this
>> is step 6, the re-generated ACPI tables binary blobs.
>>
>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>> ---
>>   tests/data/acpi/microvm/ERST.pcie           | Bin 0 -> 912 bytes
>>   tests/data/acpi/pc/DSDT                     | Bin 6002 -> 6009 bytes
>>   tests/data/acpi/pc/ERST                     | Bin 0 -> 912 bytes
>>   tests/data/acpi/q35/DSDT                    | Bin 8289 -> 8306 bytes
>>   tests/data/acpi/q35/ERST                    | Bin 0 -> 912 bytes
>>   tests/qtest/bios-tables-test-allowed-diff.h |   6 ------
>>   6 files changed, 6 deletions(-)
>>   create mode 100644 tests/data/acpi/microvm/ERST.pcie
>>
>> diff --git a/tests/data/acpi/microvm/ERST.pcie b/tests/data/acpi/microvm/ERST.pcie
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..d9a2b3211ab5893a50751ad52be3782579e367f2
>> GIT binary patch
>> literal 912
>> zcmaKpO%8%E5QPUQ|KVrvh9h_c12J)@5f?5!k_Ygv*jGA8UW7?#`}+D#XXyDpKHiZ?
>> z@anI_W$gOrZRl(SB7!yMqx}#E4EC&a5=}m^g_!0^0`kEl)DOuIXM6D@@*xq*8vyqH
>> z)b0KTlmlgmH~xt7vG<k#Z1~z=OnyT76ZX;Ysy^;NC0^^$`kY?zKK;^vMtny1JAD$P
>> zc^BR{l;i*H`IJAW`~~?1`_TXD_wQ2@UlL!DU$GCpQ-4i-O}x_^JdQTRH^e)=(_c$`
>> LOT5z?_v4Aa+v(5&
>>
>> literal 0
>> HcmV?d00001
>>
>> diff --git a/tests/data/acpi/pc/DSDT b/tests/data/acpi/pc/DSDT
>> index cc1223773e9c459a8d2f20666c051a74338d40b7..bff625a25602fa954b5b395fea53e3c7dfaca485 100644
>> GIT binary patch
>> delta 85
>> zcmeyQ_fwC{CD<jTQk;Q-F=QiG057Ni!kGAAr+5MP$;rGe;+`zQh8FQ0@s2J*JPZuX
>> l3>=QZp?+M<lN)&@ggD~CY!RV&S1$v`0B2XP&5C@1oB+Xc6m$Rp
>>
>> delta 65
>> zcmeyV_eqb-CD<jTNSuLzao$F*0A5ayg)#BLPVoW`laqN{#GF`y4K3n1;)6r|xR^QO
>> V9bJNW7#Nr*U*I#`Y|7`t2>@&@5ljF8
>>
>> diff --git a/tests/data/acpi/pc/ERST b/tests/data/acpi/pc/ERST
>> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..f24fadd345c798ee5c17cdb66e0e1703bd1b2f26 100644
>> GIT binary patch
>> literal 912
>> zcmaKpOAdlC6h#XZC=fn#CoF*_7>J28jW}>wF2KFG3zs9lTPTnl;U#=7r>E_sr(1u2
>> z21<FK_R^jEx_w-`TFO&O;T_LLF4O@x8LMi!H}5Z^t6_Tah{H!Y?i2S%JoA7!BFgz1
>> zf~;?N{b8^}H2K=viyuzh`L7M``U{CiG=Ib#4X^gc{m10T<lDURCp`CW$T#HMd{o-?
>> zH~aE`PznCu9;f*enm;9;GDrTme_0zSBR|7ODR;g(@qEM!N8Z_gL4HBL%^N<3mgJY@
>> R+q~0XMSexT%^U0Ee0~)`g#iEn
>>
>> literal 0
>> HcmV?d00001
>>
>> diff --git a/tests/data/acpi/q35/DSDT b/tests/data/acpi/q35/DSDT
>> index 842533f53e6db40935c3cdecd1d182edba6c17d4..950c286b4c751f3c116a11d8892779942375e16b 100644
>> GIT binary patch
>> delta 59
>> zcmaFp@X3M8CD<jTNP&TYv2`OCrvjHhYfOBwQ@nsX>ttC4TZ!l<{$N9cc#e2SmmnSn
>> O1||j(wg6|p5C#C(xDBxY
>>
>> delta 42
>> xcmez5@X&$FCD<h-QGtPh@##h`P6aMMmYDcpr+5K3mdUaTw(KHo0nUCQ3;+kH3ZMW0
>>
>> diff --git a/tests/data/acpi/q35/ERST b/tests/data/acpi/q35/ERST
>> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..f24fadd345c798ee5c17cdb66e0e1703bd1b2f26 100644
>> GIT binary patch
>> literal 912
>> zcmaKpOAdlC6h#XZC=fn#CoF*_7>J28jW}>wF2KFG3zs9lTPTnl;U#=7r>E_sr(1u2
>> z21<FK_R^jEx_w-`TFO&O;T_LLF4O@x8LMi!H}5Z^t6_Tah{H!Y?i2S%JoA7!BFgz1
>> zf~;?N{b8^}H2K=viyuzh`L7M``U{CiG=Ib#4X^gc{m10T<lDURCp`CW$T#HMd{o-?
>> zH~aE`PznCu9;f*enm;9;GDrTme_0zSBR|7ODR;g(@qEM!N8Z_gL4HBL%^N<3mgJY@
>> R+q~0XMSexT%^U0Ee0~)`g#iEn
>>
>> literal 0
>> HcmV?d00001
>>
>> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h 
>> b/tests/qtest/bios-tables-test-allowed-diff.h
>> index b3aaf76..dfb8523 100644
>> --- a/tests/qtest/bios-tables-test-allowed-diff.h
>> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
>> @@ -1,7 +1 @@
>>   /* List of comma-separated changed AML files to ignore */
>> -"tests/data/acpi/pc/ERST",
>> -"tests/data/acpi/q35/ERST",
>> -"tests/data/acpi/microvm/ERST",
>> -"tests/data/acpi/pc/DSDT",
>> -"tests/data/acpi/q35/DSDT",
>> -"tests/data/acpi/microvm/DSDT",
>>


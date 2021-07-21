Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCC13D12BA
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 17:45:05 +0200 (CEST)
Received: from localhost ([::1]:39608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6EPA-00069r-S9
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 11:45:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1m6ENP-0004UH-3y
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 11:43:15 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:12426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1m6ENG-0006TQ-Ql
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 11:43:13 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16LFghps030973; Wed, 21 Jul 2021 15:43:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=SDkXKIelJLR1BGomX3ls3lXcCd3C07CfU3Cu6H2v8Cw=;
 b=AYOGKmCCz8ddKdTG3pcHuOrvFYUoI6+oSgFaUFUfv+BKdak7lvNoTviDw/VRAzUGeuKn
 fIwvRfMSaorWsJJ5ednLAerWWSVeONPFHg5jBfTor0nvrMzrW1mE5I6GVMkiUx5BYhAi
 bY5cZYYqnfs29tLqTfxaSsuIRT9tlvEih7T4fxYudgxuSQNGK91nyFeR8W2vnmdS5/Do
 iAo1XQKf0TcLSsce1BCRREISz//qGssBNwYO0Q3/Yk4WyVn7WEtvfkXwaDWV6xSIUXMa
 mopRY/TMCteaNqbAp8bwRtqHv9Di7whYA9i4xtV+WhaYDmfGskfGkIvHBEwiSWseEnW+ ZQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=SDkXKIelJLR1BGomX3ls3lXcCd3C07CfU3Cu6H2v8Cw=;
 b=DCA0aME8d2ZTRFms9jmIs1apxvTey1/opqXNGXuw6euYAt1uuwPoT5OGby+9a3rOw3Yy
 Dp+PAd9BKGmsGYSGhjJ2JIf4d1yXXTl0nOfKdODdKFHkSubUWN4SHpfHLjYn1gWvz0VG
 rd1v6V7gNwh6n7xOU/AfAOPU3Jsiu0+gkKkSatrqfNo4FCXmemp89ky7Z36V5g+3pQgl
 9Dl2hbVf1utdvN5C9yTVfd57lvmQlBauRvEmKZjQ4Ed/K/T08orqeEOLc+iRC8CgH23D
 jac8tnQmNuezhTt4lveJFVs7rV1SL/Pbj4S+7ZEK9MTdn4q3XFG2V+eUyZ5WieTuxqKa Mg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39wvr8b6uk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Jul 2021 15:43:05 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16LFfBdl185463;
 Wed, 21 Jul 2021 15:43:04 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
 by aserp3020.oracle.com with ESMTP id 39uq19dtuj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Jul 2021 15:43:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OQqW2aFUdJvAVeIuDqqIy1LXBTk3BG6rhvjZFjDyNm/7pKx7ExL/C9T1tda1lAvg0s+tW5ATNaV/IgqeCh26mAzvF5OzS7MQf1RdwD0bpz47cDyA1uGKpGtjoGtaUqLmL/oxRTe/oT7k7Nkmj+O1lNxG3MTMZ3vrNZ0dIu7K+TNFnxwD4jPjdoXSnfMt9Gd/fc6Xg6A4jpDT9/zMrByC7QUmbqQDgi84tj4Eev/gXvrvI5bN/4+cFO4fqXZ9oifK+EgziBiSCmboeSBGM2GuoBReBaSzQyAdNvVIyiFrBZqKN5jmBZ5Ru0PndQzMRM/AVdBs6dnoMx3jDdbg13weQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SDkXKIelJLR1BGomX3ls3lXcCd3C07CfU3Cu6H2v8Cw=;
 b=SsOC5X8uiAxdbbFkARdfZzYf0gc7eRaXalB0akg6jjI8YbTQiLLeDumYhze2SddoWjed7nGmMy6OlafaemsrWjiH59olVhfDgi36CeAWLBQ5fFUzWdsbTY74ZwrAgn8vk1CBlyBTikkxUZ5CiDIP2tx4EhH5tmf8bainUDHAm6ODw3EbfmG2r/kKMdqQV7OmtktCwwY+wi2g/8uEq+p6Q2xv0waikzI8tso/GuzeVldTlZ7yJjiTXtq2IvmQ4LoCrKEA9jct4javwUha2ljjJtJh9z3kOLHhflmcwvRv/pnI8KwjUBgI0E8XzRYwEgDTiNSRWze/kv9t7StC4pOJeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SDkXKIelJLR1BGomX3ls3lXcCd3C07CfU3Cu6H2v8Cw=;
 b=a8YWP4khHFgByFWGBtwjs85eOx9JPDcdpjKGSW/79y8CiBYv13SCnLjBy/lQdSnsIADI/wJGxKXxK7njk3zB6dJGocfS+qZhKhP4b4gq/Jsv95melFx80JjYyOzlFqBNieTbXGP46hUVRFZ8CK5Z6nKbZ0WvGXz45gJMP6HBVE8=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com (2603:10b6:a03:2da::19)
 by BY5PR10MB4018.namprd10.prod.outlook.com (2603:10b6:a03:1b1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Wed, 21 Jul
 2021 15:43:02 +0000
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::d1ad:b140:4d55:67a5]) by SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::d1ad:b140:4d55:67a5%9]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 15:43:02 +0000
Subject: Re: [PATCH v5 03/10] ACPI ERST: PCI device_id for ERST
To: Igor Mammedov <imammedo@redhat.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
 <1625080041-29010-4-git-send-email-eric.devolder@oracle.com>
 <20210719170610.6ff8dfb0@redhat.com>
From: Eric DeVolder <eric.devolder@oracle.com>
Message-ID: <c46dc46c-ac99-e726-b6e4-375a743af7b0@oracle.com>
Date: Wed, 21 Jul 2021 10:42:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210719170610.6ff8dfb0@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY4PR2201CA0012.namprd22.prod.outlook.com
 (2603:10b6:910:5f::22) To SJ0PR10MB4542.namprd10.prod.outlook.com
 (2603:10b6:a03:2da::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2606:b400:414:8061:221:28ff:fea5:27c8]
 (2606:b400:8024:1010::112a) by CY4PR2201CA0012.namprd22.prod.outlook.com
 (2603:10b6:910:5f::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend
 Transport; Wed, 21 Jul 2021 15:43:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d97cc8a-800a-44a8-6edd-08d94c5e3924
X-MS-TrafficTypeDiagnostic: BY5PR10MB4018:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB40181344316E925A8BEB93C897E39@BY5PR10MB4018.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:983;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ca1M8fvabR/co21h0yYfp+Mj1RXOyCLSD/0x3iNV6AmCraJH7LwSjNXYz/w38GvvX6aLvMvfsGlWCNqbjNdi7yhrOz1u4p7cpKQ7Z/PbqFCgnB2LDc1GgvXRmBEKURHL168T8Z+cU7Q2qqxEiEzQouImWfOUFGbPhkXJM9NRf9UO46wcoeqtg3Qo5sGyz5/rhooXX+KNZnjpzOZJlBEBWqvSUVrUmdxgF0ITsrLRIAI4cqhMUfcTFmAKZx3CWu/GXXhE32sNRMjfBkFDoclZ6MdZxl79kk8gj/tcfv9CoNhWW3Zsswsqew2Ap3/VFiNJAD9oozAdA/H1k4iiDY+O2TACONrDnHCR+bVaa3xRMuN9exL8BN7zDbmhALDkuuaq/UbJ8iAvaOMzAGwa+oYPNFpGe1xNn21TTON5lIqTaxuZfuh3Ex7ZO98cdS+pRATotMIoQC1q9k8bkSC04vcSKHFPoYHAIEIy5GDyRQ/Ui6sq/S+N2vRkoJwGJd6q/bWmbRkXsxvGgIVuMo1Uld2n9Psn6w1nMoBYMZfOw91KUSzFdUfBI5EoSXhhDMyNpJNfxXoSJ/TOkqJU+GSNL4x+kTsc40949bb+fZ/V1LIpm2uFFtNaQTqJbZTL0HadiXxSikkLX7nyrFgI7/s8UudPaxSbMaKhNzoSVOX7p5ED4oIW0LZfJFWYB2XT3KNzxcK+xeh3ynbCRnToSHe1UMFLo08k909YddmjYG6Qo4tJLJ0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4542.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(136003)(376002)(39860400002)(396003)(366004)(31696002)(2616005)(86362001)(4326008)(478600001)(2906002)(316002)(38100700002)(107886003)(8676002)(6916009)(5660300002)(31686004)(66946007)(6486002)(66556008)(186003)(66476007)(36756003)(4744005)(53546011)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2xFSmpMK0RCSXp1YnFTUVIyRy84djF3WGZuZ1ZNNWpZZkNOTk1XbXJTenZK?=
 =?utf-8?B?cU05eTZ6SGVRRi9BeG5MS3hkR2lzZHhxUzlvRUd1NTV3UTBJakl6SDJKUmhy?=
 =?utf-8?B?a1Y0dG80ZGhtWnlveTlIUnY4NjUwTFNtOVI0M1lJakNRWnNNREoyUlBJZ1g3?=
 =?utf-8?B?UVYycG1XQXkxMDU3TDk3UFlNakJrVGpWVElSZGtuVVBrTkpSeDNTVVNXUW1M?=
 =?utf-8?B?aGl0czE2V3NtRVFXWXNlaHBxS2o5ZEo4WEdzdVRFbEN6OUhIeGVVenFDZDRL?=
 =?utf-8?B?aVJGb2wxc1R0WUNOQlVoQ2hjaStoL1BUQnIxb0ZVeENoVXpsYnV6UkdqUDVw?=
 =?utf-8?B?cmY1dVJMd1ZEWGp0aWtIejRnK0xhd28rSHBNeUxFUE1ESC9yVUo5Q05JYy9h?=
 =?utf-8?B?Qi90QXoxQy96MFh4UThhK1FRNHl2ZXNjS0lhMHdVYUlIRyt6cHorWW8yQksx?=
 =?utf-8?B?alMzR09jWjBXMTVWdWRzTnhuT20zNDZTS3VkdStJRkVlYWlONXNzcEhIZGlW?=
 =?utf-8?B?VVlzVGozeXNTRkxJS1Z6bWxVWWdZM0doTjRQNFBEUUhKU21DL0Ezdzl4NDRz?=
 =?utf-8?B?b1hNMVNwUVBlVEZRU2xQVFVEaXRlNEFHSkREUVA4U2VjOHpsb2ErR1ZYdWFM?=
 =?utf-8?B?RU9xNllsM2hMZTdzQnU3UEp3T3E1OWorR0daZFhQU29NZkVYY3N5VUFxRkha?=
 =?utf-8?B?NmRrWDBKbXpJY0tHTklkd2tXV1NVajJyL0NkaUE4MlpUWFcrUkI2SUFIV1VC?=
 =?utf-8?B?VFpLVlZFc0NzUDFFRVo4MUJvNVluVFF1aDQ2ZlBkUU1RVHVxRnRqems3dWdx?=
 =?utf-8?B?UVpUWEsrbVhGNkhjQlFNaWpjNDFhRGYyK2tzRXJ4ZlIvbStWaUpSVWpDV0ph?=
 =?utf-8?B?WCs2bDVMZkZFazhZaDBYdit5OTJlT3lhWmN0QmlHNkljUHE3OGZFOXYvM09w?=
 =?utf-8?B?eUpPTHFaUUc2MVpRUHFnZllGZEpQSGVQbFNpYzBQUE5ETFF4Ym1mTmRocThl?=
 =?utf-8?B?MmYrTTRuTXdDU0dGc29FaG5aQWhvQXNkZm9pOG52VDZlU2VOdU1QWXVWTzVN?=
 =?utf-8?B?V2xhc2xKQWZXbnZxVzdUNSswZkxJYUdwV0R6L2RMTi9JbzJFWDlIMGdRekNv?=
 =?utf-8?B?TnJyMlM2TlduVDlibE5COHR3YnlnbExma3l5a29XSjg0eVVicUFLSDBCKy83?=
 =?utf-8?B?dHRUanZJYjBld0JYK2Z0bmxkV2dwS0tBcjU4Q0NJTWRpT2NnOHRLZ2p1dFFU?=
 =?utf-8?B?Q1I0QjNPYXZ5blg0WlI2bjhIWnlMd21WOElLYnBsbVI3emtnLzJMRTdLb0w4?=
 =?utf-8?B?Y2tpL2UyUE0wdUQ3ak5QaGxCVGxEdnl1MFprVmQ5ZXFQM1JCbGxWTVFnY2tl?=
 =?utf-8?B?N2pONTBROW41WmwzR1ZRRmg3WG05UlFaRW90UHRhbUQ1Ui9ZcFdVNTF3Wi95?=
 =?utf-8?B?VEhUa3hRZHJwZElDTDJRUWVUUk4zZGdpSEhhL3BuM0RoYTZ2cEw2Qy9rUjhy?=
 =?utf-8?B?M1JFaXAwTjByY2hUaVBIT2xNNG1vUDI1UUt1SGZGaXU4U0JkaVpiZ1pidUxV?=
 =?utf-8?B?bFNZYkljSnp0NTA5ay8wd241NDhla2VjOWUyTzZOMDNaTXhZQ3dudkNtcXZp?=
 =?utf-8?B?Rk0zeDc5Y1hIMXFOdzZnMFJ0RmhoSWhyTzM1SC9XN1FLWkNjNytsenBCRDB2?=
 =?utf-8?B?blFMcXczemN0ZHREcEhZSmJjbVNBRTJrY2JWNjBkaGNGQ1g1b01QaGdyRTRp?=
 =?utf-8?B?VFk3NUdDcXVCT1RUNjBFNHZHV2t6dWdWbE54dW1oYkxBSjQraTRVOEMvUXls?=
 =?utf-8?B?TUZIZ2RJQUdWYlBUeWJvQT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d97cc8a-800a-44a8-6edd-08d94c5e3924
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4542.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 15:43:02.0514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4h/FDNqUE9l7WTthIf2+/sgwWxeKmfxdjNfGLdL47qokTntKZb+YG9O+D1OOMaYc5P7VlZIAysnZ1j0De8LRe6c80hAR704VKvrLCQ9LV7s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4018
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10052
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107210091
X-Proofpoint-GUID: Ozr69VRKVi-CXOBET_QQx1-IO_7sj9Bz
X-Proofpoint-ORIG-GUID: Ozr69VRKVi-CXOBET_QQx1-IO_7sj9Bz
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



On 7/19/21 10:06 AM, Igor Mammedov wrote:
> On Wed, 30 Jun 2021 15:07:14 -0400
> Eric DeVolder <eric.devolder@oracle.com> wrote:
> 
>> This change declares the PCI device_id for the new ACPI ERST
> 
> s/This change declares/Reserve/
Corrected

> 
>> device.
>>
>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>> ---
>>   include/hw/pci/pci.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
>> index 6be4e0c..eef3ef4 100644
>> --- a/include/hw/pci/pci.h
>> +++ b/include/hw/pci/pci.h
>> @@ -108,6 +108,7 @@ extern bool pci_available;
>>   #define PCI_DEVICE_ID_REDHAT_MDPY        0x000f
>>   #define PCI_DEVICE_ID_REDHAT_NVME        0x0010
>>   #define PCI_DEVICE_ID_REDHAT_PVPANIC     0x0011
>> +#define PCI_DEVICE_ID_REDHAT_ACPI_ERST   0x0012
>>   #define PCI_DEVICE_ID_REDHAT_QXL         0x0100
>>   
>>   #define FMT_PCIBUS                      PRIx64
> 


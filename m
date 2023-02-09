Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E305690B2A
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 14:59:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ7S3-0004gh-Oq; Thu, 09 Feb 2023 08:59:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQ7S1-0004gE-BN
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 08:59:01 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQ7Ry-0006Sz-UJ
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 08:59:00 -0500
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 319DIjSZ031177; Thu, 9 Feb 2023 05:58:57 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=khSEodTmFXt5dag3j7MtFqIi0B2DX/VfznPPrv7Ab54=;
 b=aEQqyVY1Gs8zCshkc+dv5dQQjaQbL3jU38PcVjyZLA0vpWxytdgTn1iqcE7D+JvA0yKi
 i5h9RRAU18UZHf+xEliWV5KDX3rGINseQVnPr4mNfU9W1V2I6Vf1iwei+dE/kExSTX6a
 LtCiPe5dJUCIqENfZArdvnUjwRfg0O1ympbaL7gZVE1F4QyTHCFzAmsShyGo+O62TEB0
 610akiBKziL/dTLoMMLHqoEu+IgbenLIsUJvr0oQgkMXFex5MMs5gjHh56XrTNIozF/f
 GaPYgutqkeDeF0E8sG4Ku7SPnF8I5lgI0pEkIZNoqi7W+YllFxSmy9AW5hNxaK7xTd2Y 9Q== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3nhmk1fy1e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Feb 2023 05:58:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b7dDIn88VaKCxgAw/dN8N3b7u02SFGMG6t8V6KT5wv0OmaQ5ETALhzrpKU5FxGcCxT90F1ROxRovX5cOqdkhlVdG3WaJwqLZbn6AJQ5/heG/0/gLPVKKda7phKeDsHRkuMEFPrMnH7l+rqp6y9k5YA5pJuiSb2tGM3J3f8/IWyBzQzjh7FC9KdB+1RLnrBy6sW5zjXU5m7hw3W9lV0aIMYrzmCaocf0slXcgmuwNOhGza0Pjy4y3UvrJ0aYeb2TATQRNaGx7Tap7EHsc+9kNgJ2pGS3Rc8eRgTTYR929b7dhZryXQTvZNbsWVE+4DV2a2rhfuvFqY4exwZX3I/llQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=khSEodTmFXt5dag3j7MtFqIi0B2DX/VfznPPrv7Ab54=;
 b=eNf519y94xGuMoaEKACywrfo0XZrKhPnkcutuqfalon5/4+Jc3mIKLqihULNhj8+RNOFaWWLiMd4bFUMMNBrAsaRQWtdj3cf28uayvq/avWTvdnYz04b3rPukCyvfFlazRZkCFC05k4sQ65vcLKGiBByxY3/LK8tAnhQ2/F/WW2zoCDOue7MbSoYpSsXA1r1ERCIBMt5/Kg3vNY/GxJ4L6jSFYh2LwXS6BXrSJnYSDgrE+6r+KVFlWKpC0/GSRT1MMtCcezPJsDtzC1L/NsDcEpYMWbVgl0QOC9p1mpOKVuKmVnUIbUfOc92y87G/l/u6N5o95lBpn5robyJVYTJuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=khSEodTmFXt5dag3j7MtFqIi0B2DX/VfznPPrv7Ab54=;
 b=bM4XZqdWhtD75Gue1yJaCvtSqobTkfd0wOgwIvPxFax5LMLA1AdyVi3RqLc2fuOEk7fmLyfMV7+Ylm9cj07xiHc8HBeLPS3K0wfrl4LRD2XeBAkvg9c0n0jESDmNZKnDnqBLt7AAqjSi9d6YHYWTS+5hHKIz4BzBoEFz4Z2vzWIh+pux3vIEeD41Pm9DRV1hN31dAzLaQaI/tHU3EHpV5LyyS/woOiq2KUwV0QRRnzRZlwPs8x+U3+37YP+qk7kgxKo333EpXOlpWwXzylPS7HegjN/+Ek0xdhonsy9nbMl+qN4jGq1FZRWZ8k21dj13q5hIO5UXVX3dIHE6RfIGNg==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by PH0PR02MB7527.namprd02.prod.outlook.com (2603:10b6:510:4e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Thu, 9 Feb
 2023 13:58:52 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac%3]) with mapi id 15.20.6064.036; Thu, 9 Feb 2023
 13:58:52 +0000
Message-ID: <0922e38b-dde7-3a80-c663-ca01af72aafa@nutanix.com>
Date: Thu, 9 Feb 2023 19:28:40 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/6] migration: moved hmp_split_at_commma() helper func
 to qapi-util.c file
To: quintela@redhat.com, Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, eblake@redhat.com,
 manish.mishra@nutanix.com, aravind.retnakaran@nutanix.com
References: <20230208093600.242665-1-het.gala@nutanix.com>
 <20230208093600.242665-2-het.gala@nutanix.com> <87y1p73v6u.fsf@pond.sub.org>
 <87sfff597q.fsf@secure.mitica>
From: Het Gala <het.gala@nutanix.com>
In-Reply-To: <87sfff597q.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::17) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|PH0PR02MB7527:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e96fe1f-66eb-47f9-61cf-08db0aa5c6b2
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JGmJB+kHWwBEPkDsjpvwGB36PsRWf695WTRpWIU03wUiUYzuu9uzdEKRFA/kOkhUoYfKOCdI/9vMCJ8YAidlzThOQDEt4kG3BcgDEvSukij8nM6Kbz0RUp+HooeN6t04qA7hIJjksd12UpW/L2mgznjbQfjusXarqmZbQiuKTr6kUtUSxoCdPKuGCtDivRJhoKCnhqreVPnbV/1Pcu4Wt3vkwiJEgJFATdo+/gbl2g+7O9HJ4kFNjWU5NH75V2O93mUud2S9NgqU/r0Xz99cz7ghxzelfE4UI+ImQnKxkvppezIvweCjgj+dhkWDdcPpHeBZ9Htm6bUM82hE37azkxlOq9co2aag/DJFMugz4UICG9403Mb0oBE5U1RYdiVzCwxIZaP5kL4kQqMH/ecIhu7x1SqKefwE1NS0AmpX8DGeTwLHYGLMklilyQZ44kgfJlSlr0iDj+7z0Cxrb0HreAThWPSKTK02b/vYrD5kbf7UCfy2wRFj0G4k5ZfDFdAlmfm++NlmLeqqBY3kIq+BbjKtsIZa7BNlrtQBXl87LvgH1U/wD1TY68DFmHDl/LEgKaTiFpx1ZCfONNW3WhRWyf4ZkvATfuIVemnA1LhnlsdVqHD28HQnmGngz6k4YUtXkE7ZEN7yzHszSr6wQhcdxk/MCdFX53ryawR/bzoN+4wq9uL21iyxHhX/asSQAJYmw4vWjQx4LhLBKudvDuvJjKVCWt8Wlo5Ov4oWfcXSf2YlpSgfkkmAkjXP7lMgoAwQJOH0xg+YqbxiUdMqtpQKyQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(376002)(396003)(136003)(366004)(346002)(451199018)(66556008)(2906002)(4326008)(66946007)(6916009)(66476007)(86362001)(53546011)(6486002)(36756003)(478600001)(2616005)(31696002)(186003)(316002)(38100700002)(6512007)(26005)(966005)(6506007)(8676002)(107886003)(8936002)(83380400001)(66899018)(5660300002)(6666004)(31686004)(41300700001)(44832011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djdNcHQxR1BuYWoyZFRLUmxnQWIvK09VM3RjaytLdWJpYlFPTjUweTk3QVh0?=
 =?utf-8?B?ZzJFWm51Znl6K2VRWlR5Q1oyM1QrNVFaeW1KQ0hJVGZ1T0tPcnhXczE3M2gv?=
 =?utf-8?B?V09tdFlXTDdjV1JuWGVsTTNyUTJEVnFiZWN6ZmZwSnNiYkNnRzdUeEVMeUl4?=
 =?utf-8?B?L29leDhNcVFuYzJQNG0wNTlsaENYWGg3Mlg5TUgwbG43Y0RZZVdNVmU5YkNT?=
 =?utf-8?B?LzVVblNudzhJYUlzSEQzaWZ1QitRRnF0ZzE5MXFNZEJoQjJKR3l2MHY2Z1Mx?=
 =?utf-8?B?c3lYRmRGdFUwRVZwN0kzMzNSQlVQTWF1MkZQZ3VaV2s5dDlJR1Viek9GM2xN?=
 =?utf-8?B?bkxZcEU0NzRWVE5KaTBYdmVLMUxsTnhtOHV2eDQrT0FTRlFWOUsrbkNCL0VK?=
 =?utf-8?B?MXU5VnJMckZwNUw4cmVVdjJTWDdkMGZTcGU2cUVNL1JOSCtKVlJjY0oxRkV5?=
 =?utf-8?B?L3JtK0Iyb2twd1o4c2JDWTNsRis2T0owVnc2d2JZU05zcXI0c2hNczNIaHJJ?=
 =?utf-8?B?ZmYwUTNpTTRSLzIvWFNtWWJSMU5TR3NKN1M5TWltQ2d0bllLenRmMHJMZjdh?=
 =?utf-8?B?ajR1MW1mQXFQdDRqQURwcUg3V3NwVUl3dG9HZStJbVZPMUxmVTRkVTl0RmJt?=
 =?utf-8?B?eHVBMmhKalJVUmlNRkV4NHpvWjVKc1dPazc2VWVGZUVKK1c5aUtUSTJEcjRt?=
 =?utf-8?B?VjY3R3JzMzFhQW1ody9KZE9CZVZjUjhkN2FKbnBtK0YwRG53UmpjeGNldldD?=
 =?utf-8?B?U3E4MFAwOWZRdUoxNGllQ2JWUUQzZ0VJQ3JYZHc1VGtpbm1uQmExZDgyZ2Za?=
 =?utf-8?B?TDVPdW1qcjhlSVUvUlBLWXBpU0FCay9pejlHNkJqalpuL0IvdW5jc3VuUE5T?=
 =?utf-8?B?UVRhbFRhWkpsSVlZK0NVV1pocDNZNEJrWEhhZUxGdkE5a213L1oxUTdJYTI3?=
 =?utf-8?B?eUdUK3BzWkRnaE5QUmdGSE9RNGZtMEZleFprOTFnalk2VHVwL0pNejJNNWVM?=
 =?utf-8?B?Wkc3SnhCYXhXdU1GQTFzbmxaOGNZRXBOWTViaHpIVXBIN011TXYwRnhaVS91?=
 =?utf-8?B?TGlVWUZPRE9rZXpSejlkU1ZnQnZMZHpWUXpQMUZCMDJSbi95eVdYSHhMQjZn?=
 =?utf-8?B?WjIwOVpQU0NTZ1Z4MjhmbEdCbHl4TXE0eFVEZTY5RGY3eFhLdVlWNVZkV2Fy?=
 =?utf-8?B?WERTcFBwcEZQbkdjU1o1NjkvY29RU3BjMzgzUmU3V1ZDVGkzdjZwd0lhSDNw?=
 =?utf-8?B?ZENwSnNKUTVlUXhCbEVhcE4wa2tnamVCek1Td04yM2ZCVGNqMHdkSjJkSXd6?=
 =?utf-8?B?NVFXSXhKelNpemxHc2RldXI5eEpyWFpPZkl1NGJydUp3V2JFUkIyeTBNbk4w?=
 =?utf-8?B?SzFtN29hQlZKb0VzSWRSOW9IdDdtK2MxMnM4SzVBVHhWekFmRUxmT3JuRmNG?=
 =?utf-8?B?enZpbDgvczhhWVB1cEduWDIraEoxd21JOUlWTU4zNFBNbFM5TU10RXJCeWdH?=
 =?utf-8?B?WCtiWDJpYXA4c0cyVm1sQWROcmFTek5nYWpzYjB2L2xSNlV1WFpLVTN4TVJC?=
 =?utf-8?B?NzNqTklLcS9QZFRpNDBsOTJzVHRsR0RObEZYdUhqTTE2cU1GVHdtMTdjZXNM?=
 =?utf-8?B?UmIrK2dYSVF6cGJyTDBKL0x6RjBncTEvemVLcWxNckpQanNQenBDaDlRWkpJ?=
 =?utf-8?B?dWVkTE9RbU5GWUtXT3l2cFoyRHF4cUY5bDJ3N1dsazZ3RXhYT1VwQ1pNVlRW?=
 =?utf-8?B?ZEx0OTBaYnVyVWJJQ3RIaWdnS1YzRzhQQisrWXJLbFRzakl4V3I0OG55bzY2?=
 =?utf-8?B?dUdiZURETXdpQy94cjlFTUQ3WmZLUDR6Ky9UdXFycTJBQXZiaVVuWS9KdnFR?=
 =?utf-8?B?TzFhWDdsaHZLektkOUF2cjRDZ24rQkg1VkR4U1hoWkxQbVh5QXRGdWVMU1RS?=
 =?utf-8?B?aFQ3WERTREROZEtTSXlMYVpwT0NPK1pMSVQvWHB0V3V4RitYdGV5ckh4a0NE?=
 =?utf-8?B?MnFscCtuMWNGT0dDZjArNGtTU2taZ1MrdlVwU0Mxd21POEd2d1BNN0VDSVI0?=
 =?utf-8?B?RGpnV3QzYS8ydWpwdWpPK08vRkpEcXVER1o0eVpQRUlnSjd0ZklzSXo5U0xT?=
 =?utf-8?B?amRMWmE0VXNzUzNKL1BmdDBsNW5SaFQwT2RYWXRkVUpIQzhJYVloWjZySzd3?=
 =?utf-8?B?cXc9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e96fe1f-66eb-47f9-61cf-08db0aa5c6b2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 13:58:52.6580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HNKvAOwgOCKcwjAgN+pqtIZWTfnm8jhREdqX6pFlJUp5JFK5JFox/B4BkAzEMaN1wDi96lLKWmpRNMUdb/VVSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7527
X-Proofpoint-GUID: b9fveSWAkwDw0j10WButr8FIDnsBqGBL
X-Proofpoint-ORIG-GUID: b9fveSWAkwDw0j10WButr8FIDnsBqGBL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-09_10,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68; envelope-from=het.gala@nutanix.com;
 helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, SPF_HELO_NONE=0.001,
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


On 09/02/23 5:42 pm, Juan Quintela wrote:
> Markus Armbruster <armbru@redhat.com> wrote:
>> Het Gala <het.gala@nutanix.com> writes:
>>
>>> renamed hmp_split_at_comma() --> str_split_at_comma()
>>> Shifted helper function to qapi-util.c file.
>> Not an appropriate home.
> I don't have an opinion here.
>
>> If we have to split up a string in QAPI/QMP, we screwed up.  Let me
>> explain.
>>
>> In QAPI/QMP, data is not to be encoded in strings, it is to be
>> represented directly in JSON.  Thus, ["a", "b", "c"], *not* "a,b,c".
> In this case, we are already screwed up O:-)
>
> the uri value in migration has to be split.
> What this series does is creating a new way to express the command
> (something on the lines that you describe), but we still have to
> maintain the old way of doing it for some time, so we need this
> function.
>
>> When you find yourself parsing QAPI/QMP string values, you're dealing
>> with a case where we violated this interface design principle.  Happens,
>> but the proper home for code helping to deal with this is *not* qapi/.
>> Simply because QAPI is not about parsing strings.
> Ok, I drop my review-by.
>
> See why I was asking for reviews from QAPI libvirt folks for this code O:-)
>
>>>                                               Give external linkage, as
>>> this function will be handy in coming commit for migration.
>> It already has external linkage.
>>
>>> Minor correction:
>>> g_strsplit(str ?: "", ",", -1) --> g_strsplit(str ? str : "", ",", -1)
>> This is not actually a correction :)
>>
>> Omitting the second operand of a conditional expression like x ?: y is
>> equivalent to x ? x : y, except it evaluates x only once.
> You are (way) more C layer than me.
>
> Once told that, I think that what he wanted to do is making this c
> standard, no gcc standard.
>
> Once told that, I think that every C compiler worth its salt has this
> extension.
>
>> https://urldefense.proofpoint.com/v2/url?u=https-3A__gcc.gnu.org_onlinedocs_gcc_Conditionals.html&d=DwIBAg&c=s883GpUCOChKOHiocYtGcg&r=-qwZZzrw4EKSsq0BK7MBd3wW1WEpXmJeng3ZUT5uBCg&m=b-y7IKTlkPluPqpf6lI-BKMLDSrV5JJRRzU39eSq6CpslAITuH5Cxi6l_XugJfkM&s=Z1FND19C0lNnL8v7t_pifjUxyCxbHC8OL2fX-euPRb4&e=
>>
>> Besides, please don't mix code motion with code changes.
> Agreed.
Thankyou for your comments Juan. After discussing on the same with 
Daniel, this patch will be dropped in the next patchset version as the 
str_split func. it would not be necessary in the first place.
> Later, Juan.
Regards,
Het Gala


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C506348AC
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 21:47:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxa9O-0002oX-R0; Tue, 22 Nov 2022 15:45:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oxa93-0002nw-Og
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 15:45:30 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oxa8n-0004pa-If
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 15:45:28 -0500
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AMH5YRB032618; Tue, 22 Nov 2022 12:45:08 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=kEWG82Yq2VnTi5DU/NFBTYdThDbEb0VUnB6op0RIPy8=;
 b=H/gQ4xlV/mZJAxo151FIrYVEXGGIe+qto3kN5kGp4JZk5AtJjFOGiKJDvTaWRRTK+Uji
 yEywR2HWM6WDREsL9S1EckBKV4BGtZotjwV0wKQBmr1YfGG5kqq4ygGa8inKaiPrfP1T
 pD3Pl1MD54MfoRdJB+/RaEVrtykQ4vEEz7oF2nPJgAXf4SsBbGmDxspdEnUA8P8HWPpB
 jhRbPL9kZOV5BhV07aBJITiqcFeIuNMYL0eg1LY2rSCJajB/MDb1CQuoNdku+2pEEBWl
 jWHDKs98E/CwZyuNCHhSsWuogebuX2/yR5BeaDlNSPtbQDJp7EH2/9ydUCWtLE58wc7K LQ== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3kxvbxrnfn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Nov 2022 12:45:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WELNQ67hibr51JpJDLSDR1RLM/nfSxdr8aBE/2rYpp1xitw/AZ7IfN3A1pylG7ZYpGN71vKgS9mzO4EfpOK+CoUAijorQoPvRmitJBHAbvrGbJliDpgThLo8V4StPKQ7PSbUuflzfwpVoFtTUF6G4u9FflcGCAjw3TyiBTd4tlUzb7xFrykpvCAiS1JFcEbXLP4iaw5Uetz2BR2E5DectflCCiP2nd884+UK+aAlmpuYeB88x6Da/L9lyEWjdNYxKtPVwojx1PoSqrFvamwaDW6a13jmgurCAGydDhF7jAlVA9yeQxO6stOLpmKE01aErUdNcHhn57A+qt/H2J9/XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kEWG82Yq2VnTi5DU/NFBTYdThDbEb0VUnB6op0RIPy8=;
 b=fJ05XP0gRgKkqfJpQ0FdqG23UAf9NIRvz4nt2qK1oESrsNYlStR+D1c7bUgWHsS/6/Zq2NuJe+50ANPEq2hE1GDP66U+xVai3NVMIauP16uL/cvX67Yf0PNrbYpTQ2yuLokavfwQk7TOBz3KTjdEs59kahuD90mVqMurM861gCIaonPciFUgAOBX6XC94xPfJzFYurRIt3OUgCJ4VILbrYHSfqbaSE9OPaOziTVSAA4YkwkcAPtP/UBMytIjiivs5ZECTDUZcEICTfglvS/mjyFcgDsBIr0/5vxclqx4p6gsUr1qszntJOvKX9xB+NBdQwkQz0y123pj2jMar0y/iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kEWG82Yq2VnTi5DU/NFBTYdThDbEb0VUnB6op0RIPy8=;
 b=iRfNylfJG01MqCsUbrFpHlGMJ1SV94yVaoF9qTD8w82RIgTeFU/WQKcC95YHdCGVlsk+IJ+xh1k9SFWBIJPncvl1GUJ7jz2twMEw7Y+l0uO7h7qgq509BKbL2FqB/YyPlu5P+AchDv+qCEcMpTJkD7Egiye6M1rs2mJUVRp2Is6sh3A6h7AJAT/qNMn2H0BrLAg62KhrrIAUyx77QQTULRjlWk/VtdafF3M2tszJRPI2mlbVQ5H8qWKvbRSqz6P94H3FVVnRaYFT0nrfL8CgXdlhWO4Pj1U8lr1rnsSOxtbMKfrHAvN46b39gE/0ITfgOTBJXzrxvz9Drwwj5J1iGA==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by SJ0PR02MB7248.namprd02.prod.outlook.com (2603:10b6:a03:293::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 20:45:06 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::43a8:c20d:67d0:74c6]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::43a8:c20d:67d0:74c6%4]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 20:45:06 +0000
Message-ID: <047df7db-1601-31ae-c8b3-702e8300d117@nutanix.com>
Date: Wed, 23 Nov 2022 02:14:54 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH] multifd: Updated QAPI format for 'migrate' qemu monitor
 command
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, dgilbert@redhat.com,
 pbonzini@redhat.com, armbru@redhat.com, eblake@redhat.com,
 Aravind Retnakaran <aravind.retnakaran@nutanix.com>,
 Manish Mishra <manish.mishra@nutanix.com>
References: <20221121110427.198431-1-het.gala@nutanix.com>
 <87pmdgtr9g.fsf@secure.mitica> <Y3yVHpH2080Dm9eM@redhat.com>
From: Het Gala <het.gala@nutanix.com>
In-Reply-To: <Y3yVHpH2080Dm9eM@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0058.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::16) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|SJ0PR02MB7248:EE_
X-MS-Office365-Filtering-Correlation-Id: 55657b7d-ab26-484c-a213-08daccca7016
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FbJCaBfMzRMptmnrJAlJuW0lU3FPGrIlYYX55Uet1Mk6ZX+oNeHLpolm6NTwEPAzapyfcazGHMt4l+RYc9OhVzO4BG5xxZ+T5hlMDJ0phvZx8pMdDh1Z2zEZBuc0FV8KzhmPlbtZuqRQpAah8PFLX1ZxyAZlXrrkUtcpg0MHMZzEgvKgeYcWUtlxVLTk5tD6Ahx8vpkjn/BidaPgDKcnF/sr2pRZbame2dhEoVgILFl6CR+KxX0Pz7YEq1AhjTD/W9XUII4dO4qqYTMvzhMA7BGeI8kpEmt5A/ecSLbBiEQQ6RR0tpg5gqcY4zPGtmk6K68LuJxcJky18fIkUxtCvMk6tXGKx2JbnIgFnqPEF8R91uknCZufej+izchHPDRR38TnGzZatQWC/rBrukwv4A3kv3JbA3ZO5l5g0feEcOwNMPcIpy031+/hR2aL0yhUnsZVGe7XyqG/aN9RWJh/O6JPGP9zWfvTRwH3Cex+C1VTPDpFBfnKu4FLJqkoV6FFWNVuz23CMEUxHAhsv1GE9vol+eqaxvMQul4/tS0OK5N+193TvhuZK8PULQ/pxr5QUOauoViJZVyFjFFf8NK5E6QLeFJPhvz4klVySyNAqvavfCetzCoGxPjczldVCLvlpPor/ykw3N4EfRjARDzkpK942vddqxJDex+I15QV775AAHU1z39p/uQxmH/HcrLto2kLeU0NN8hCKx664G33qHPgMOZUIbqknPEoOC7gnB5Tg1WbUSpnGT/XfOdefTJb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(376002)(39860400002)(366004)(396003)(346002)(451199015)(6506007)(54906003)(53546011)(52116002)(110136005)(6666004)(107886003)(2906002)(41300700001)(186003)(4326008)(8676002)(8936002)(5660300002)(2616005)(44832011)(478600001)(66946007)(36756003)(6486002)(316002)(66476007)(66556008)(86362001)(31686004)(31696002)(38100700002)(26005)(38350700002)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlRRWElZcmh1aG1IendKcSt0VEtnWnR0bGNIUTA4Mm9ialRyZFBjYnVuMW9h?=
 =?utf-8?B?OHplQnZ0bjFKNDY4Q2ViTTBkb3gxMkJMM0xHZkp1MEIwVEJEWXNvRUZ1QTVF?=
 =?utf-8?B?aHNnQ0UycFBjR0k3YkFxZmk4UTdxeEVsc2NwTHZLdE9Ua2E3Y3hrSzdBTk83?=
 =?utf-8?B?VGFJOUhrUHl4U3BFT2RROXpBMngxSTc3ZkNVSUYyeHVzWE4wNGRnSFphWDh0?=
 =?utf-8?B?cVNzVGdHdkNPK21ienBnZ1JMUWdFUlhrSkVCU0l5OUJMQ3pLTE0vd29VWEdC?=
 =?utf-8?B?RnNpVkV2T21odkYvYUVhbHJld1lkV2RYWXR5N0xrOUIxNHNORjR0eFBsdGNn?=
 =?utf-8?B?RzVLU1BzcEYzeW4wWjNKOGhvWEFISmVveDZXMTdxNkJKS3UrZ0JCNVZBRUlZ?=
 =?utf-8?B?dmJFMC9CSGdmOTVXMkVvVmR4RFVjL1k4R29qREpHZThCYTc0R3UxSFQ0dFB2?=
 =?utf-8?B?TGdodGVteDF0Yjg5bCtMaTZmR0UvQzBvam15TlYya2RBc1dML1lhdGhvdy9z?=
 =?utf-8?B?MjlwblNuei9QRGpnT2lPa05lelFDLzJ3MWRYK0tKb0tiZG9rR3Uyby96TW9m?=
 =?utf-8?B?OHZrSGt1UDNJaG9Va1dhU3k0OFFWVVU5cXY0L0VJTHBXNUVYUU5qRjUvZ2dS?=
 =?utf-8?B?eW96T2RDQ3FISVMxeWNGaFZXcmpmcHFDQnh5V1p5Zm5tWDFMaFR3NG1tS1R2?=
 =?utf-8?B?bU9OTHlRYjFDNEU3ZFBwbUkxbHZmVG9wYVdRMis4cWF4ZkJhYldscENKLzNU?=
 =?utf-8?B?ZUdUTzdpdk0yMUMvMnozckQra3E3V3pJK3F5OGVHcERTRTF3amk5ZnlpbVRo?=
 =?utf-8?B?eWg2TE11WGhLN0RsamQ5OFpZYjhZM3U5ZnhGeVJtdzdZWXlTYVpXUlR0d1lj?=
 =?utf-8?B?d21vTzkxejNMeVJBWHhTM0VLbGRXK1o4WVFBY0V5cWdYQWtEUU8xejNFZWMx?=
 =?utf-8?B?Z0pHZCswZ1ZoNEg4L3hjWlBJa1N3UW5FbmxvbDhXMzVOb1BuN09qRHQ0YUhY?=
 =?utf-8?B?bTdFS0Zzandta2lGYiswU2xTRzlCRmIyS1dSSlBlM1UyZlJEMlFnNGNIYmFW?=
 =?utf-8?B?dFJrVEhMbGFZYXo4QWZ2c0MvSFhjYzJiU3VCbFhxMWtQLzJaUitwN3VvZ3Vy?=
 =?utf-8?B?b0cwdlR6RVdobldtL2hjT2ZscFlwZnV0SWVoeFBVZmM0MkZzMThQSjZhT29j?=
 =?utf-8?B?WjFrczdMU3pEdGxUSHZ1WDdWaUtyNUdBT3RsZVlsQXYwQ2M4TjVmdGhlUG1J?=
 =?utf-8?B?WW8wQlBQenpNdVZkNHRxNU9yeGRWNm1sT1dCQWFjTjBHNWNBZytUZ05peDd5?=
 =?utf-8?B?RzBiOEZnRCtlOVc3QW5KNnN0WEVPR2lZQTFoclJBbEg2aVF6VXJWcDRTWWll?=
 =?utf-8?B?SGlpOS9yTDNLOTRZT2VqTFVtK0pPTkFQUGZXTWZLaGYySGhKUkJrQ3dyZWxh?=
 =?utf-8?B?RUxMVjU2VmlKaTJwdGlwR1EycjNENGxKcHQ3c1owNXFIRDZIT1NWUHhXY0N5?=
 =?utf-8?B?Ny92RFZsdzBQb0NRREJhRWtxUFJ4Qk80a3lEV0tpM0NFYmUrR1l6b3pHVkdn?=
 =?utf-8?B?TU9xTXdKYkREVnU5MVVETUZ6U29pRzBJYVU5alp5U1U4S3FDdW1OY1lZdUlz?=
 =?utf-8?B?V1VDQS9pUUEwa1k2SGZyVGxLSnhlRC94cVNSd2Uvc3pOR1hlS3R3QjJTalJl?=
 =?utf-8?B?dWNvQm5ZTGlWUHZKM3doaFYwZGxzRlVmRm0zck0vTFVyTy9rdSthNkltd1Bp?=
 =?utf-8?B?R016WlZaTm5XbW1DZ1d2MnhINDdaMjliTEZMbmlKMHg0eXgyNTVidTNFWFR3?=
 =?utf-8?B?SzZsUjlmVTVoenRHcDJCVE5pRkxsekRYUjRudE5LUGtBUXgrdURjNkxZeVFV?=
 =?utf-8?B?SHBVM3duYmhCUThMejVKU05TTzlQQVpGRHJlYjNCTkppOGJ3M01hcTNvNVpa?=
 =?utf-8?B?YUp5U0N3eXBJalN0V0JXUzdEcjE3aEdOMENoZHNKd3RkNFl6d2ZIdHZPaDV6?=
 =?utf-8?B?VFhScHhtUnMzeXFNVDNXTHAwZStHS3puZ0pyVnZJenhyV0RNa29paHdvaTVr?=
 =?utf-8?B?YmlvWjl3UXJYK1RWWnROL0pXUkhRUC9nSmx5TWpzSExCT0VwY0xNSXN0c29i?=
 =?utf-8?Q?sCi5Mg+P/Gly5HrvsP+YtC0ZH?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55657b7d-ab26-484c-a213-08daccca7016
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 20:45:06.3431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iPJTGjvefa9udLUK2C7VcGNEzMbg4QutJBBy0GibISUeY5R6ASOmZz5RN/mobiUh7d1hlDnTM+Zsv27wE6GaRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7248
X-Proofpoint-GUID: 0cPXG-K5SwDrqbiCQE8MOhM-qN7w98aU
X-Proofpoint-ORIG-GUID: 0cPXG-K5SwDrqbiCQE8MOhM-qN7w98aU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-22_11,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68; envelope-from=het.gala@nutanix.com;
 helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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


On 22/11/22 2:53 pm, Daniel P. Berrangé wrote:
> On Mon, Nov 21, 2022 at 01:40:27PM +0100, Juan Quintela wrote:
>> Het Gala <het.gala@nutanix.com> wrote:
>>> To prevent double data encoding of uris, instead of passing transport
>>> mechanisms, host address and port all together in form of a single string
>>> and writing different parsing functions, we intend the user to explicitly
>>> mention most of the parameters through the medium of qmp command itself.
>>> +{ 'struct': 'MigrateChannel',
>>> +  'data' : {
>>> +    'channeltype' : 'MigrateChannelType',
>>> +    '*src-addr' : 'MigrateAddress',
>>> +    'dest-addr' : 'MigrateAddress',
>> Why do we want *both* addresses?
> This is part of their goal to have source based routing, so that
> traffic exits the src host via a particular NIC.
>
> I think this patch would be better if we split it into two parts.
>
> First introduce "MigrateChannel" struct with *only* the 'dest-addr'
> field, and only allow one element in the list, making 'uri' optional.
>
> Basically the first patch would *only* be about switching the
> 'migrate' command from using a plain string to a MigrateAddress
> structure.
>
> A second patch would then extend it to allow multiple MigrateChannel
> elements, to support different destinations for each channel.
>
> A third patch would then  extend it to add src-addr to attain the
> source based routing.
>
> A fourth patch can then deprecate the existing 'uri' field.
 > Thanks Daniel. This is a nice idea. I will break this patch into 4 
different patches, so it would be clear to see how the QAPI design is 
evolving.
>>> +    '*multifd-count' : 'int' } }
>> And if we are passing a list, why do we want to pass the real number?
> Yeah, technically I think this field is redundant, as you can just
> add many entires to the 'channels' list, using the same addresses.
> All this field does is allow a more compact JSON arg list. I'm
> not sure this is neccessary, unless we're expecting huge numbers
> of 'channels', and even then this isn't likely to be a performance
> issue.
 > I have tried to explain this to Juan. The main purpose is, if we want 
to add 3 channels to one pair of interface and 4 pair of channels to 
another pair of interface, instead of writing the same interface 3 or 4 
times, this field saves that redundancy, and I personally feel, it gives 
one clear representation of multifd capability.
>>> +# -> { "execute": "migrate",
>>> +#      "arguments": {
>>> +#          "channels": [ { 'channeltype': 'control',
>>> +#                          'dest-addr': {'transport': 'socket',
>>> +#                                        'type': 'inet',
>>> +#                                        'host': '10.12.34.9', 'port': '1050'}},
>>> +#                        { 'channeltype': 'data',
>>> +#                          'src-addr': {'transport': 'socket',
>>> +#                                        'type': 'inet',
>>> +#                                        'host': '10.12.34.9',
>>> +#                                        'port': '4000', 'ipv4': 'true'},
>>> +#                          'dest-addr': { 'transport': 'socket',
>>> +#                                          'type': 'inet',
>>> +#                                          'host': '10.12.34.92',
>>> +#                                          'port': '1234', 'ipv4': 'true'},
>>> +#                          'multifd-count': 5 },
>>> +#                        { 'channeltype': 'data',
>>> +#                          'src-addr': {'transport': 'socket',
>>> +#                                        'type': 'inet',
>>> +#                                        'host': '10.2.3.4', 'port': '1000'},
>>> +#                          'dest-addr': {'transport': 'socket',
>>> +#                                         'type': 'inet',
>>> +#                                         'host': '0.0.0.4', 'port': '3000'},
>>> +#                          'multifd-count': 3 } ] } }
>>> +# <- { "return": {} }
>>> +#
>>>   ##
>>>   { 'command': 'migrate',
>>> -  'data': {'uri': 'str', '*blk': 'bool', '*inc': 'bool',
>>> -           '*detach': 'bool', '*resume': 'bool' } }
>>> +  'data': {'*uri': 'str', '*channels': ['MigrateChannel'], '*blk': 'bool',
>>>
>> - I would not care at all about the "exec" protocol, just leave that
>>    alone in the deprecated command.  Right now:
>>    * we can't move it to multifd without a lot of PAIN
>>    * there are patches on the list suggesting that what we really want is
>>      to create a file that is the size of RAM and just write all the RAM
>>      at the right place.
>>    * that would make the way to create snapshots (I don't know if anyones
>>      still wants them, much easier).
>>    * I think that the only real use of exec migration was to create
>>      snapshots, for real migration, using a socket is much, much saner.
>>    * I.e. what I mean here is that for exec migration, we need to think
>>      if we want to continue supporting it for normal migration, or only
>>      as a way to create snapshots.
>
> With regards,
> Daniel

Thanks and regards,

Het Gala



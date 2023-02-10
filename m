Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E936919F7
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 09:26:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQOhv-0003m2-Pf; Fri, 10 Feb 2023 03:24:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQOhq-0003la-QQ
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 03:24:30 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQOho-0002kA-7i
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 03:24:30 -0500
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31A8JvFm013051; Fri, 10 Feb 2023 00:24:25 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=xlRo5RWbhT/yufXPvca5O6bfa6603syTZQUXuvRjFdk=;
 b=KYlNGf0MYCiTK4FcdLYqHPqtIyuYSzr6hmHM9GTn1DZSa595SVXH6hCpB/qbMVMwiB9N
 4Ug7kwfeljp2JHyRKdwA5NCHopEl/c3zGAY+Q4La/ZShN5rkbL8TYIFYXB5skkN/qWKT
 WDyAqSlnDUyfiWLv8dLWZWoFlgsBnsc4qBYT0xJF4w8t5mxpR1kP8wX365Lh65mjd1Mp
 HXAf+/Put7BvaNZ27Sp0vzKrLEhBmurqNpkO8AmXqHD2hkAJ6HUnlzQHHOeG/r8hh4DF
 0d9DhdhNvm5LhCteQ0OtssO/yfvTRvRFDGYAHxX/gHAju8LFUIBNZdcsbBGUsry7xzEx 3A== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3nhqjp38cq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Feb 2023 00:24:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PeQ9IFtKBkBbI2ij72Lz3ZYBOZJZp+oEa+zB5Xz34IHf+moRAWZddLQutx7NiyZKkWUOasa99KGMqdcdphea/ySK1unxoC9JqKeD6kvQi5qNP44PfftZkYqjLIDQZlJBsCgK8jo2H5E3hYRdN191hE0hvRVRagT9EJjdQwWBMFDjYWyhbeQr7tE81T6NJMT80RNxkwWIhXQMqoEIOjyxZyU7nGYoB3a/8eMWyV0u2QHGlMUxr+jJ85+obF8UZUK5gAfiEXxAbDY3Jb/iXDBe4kWHuJSM2gJNsK5Mpq54zhEi8QOrbVlYbHQlJSURToxSr8Q8Yp6i4z+eDfbkQsiR9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xlRo5RWbhT/yufXPvca5O6bfa6603syTZQUXuvRjFdk=;
 b=X4s8aBPKlcnW6MK4dCqAMWEkNV+Z+BNPPwLlDdFWrpYzWC2/OGB+7IwcQzr6iFFpCfdtW46K+WuOr5FzbNSh3kzf6xuhFY3A2h8QmC8V/5c8pFrchHFqBpv7bHSYqJohNFJLDGfssjMMb2pQrxn4oPLLj4vhVdYQJe3YtXui6Moe8Vb8ZlBFlx4/reC3Rnl0QBgE3h1dqCqwNWxjeXlDND9tCIGoFJ4St+hCB8c61yX1/ijBDz80fdFfbdc5bCbUh4ZoCUvE2xXQdQL5fitQStMyQcV6QquMEfRsjOlbzJRuDJxo5DdQRJvRX5zyIJ7Rs4wprrj1v3IfR0GdIu9mnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xlRo5RWbhT/yufXPvca5O6bfa6603syTZQUXuvRjFdk=;
 b=O4txxRrzhn3TrUM8UnQ7im7sE6n8QpwawwZdxY6Do4BmmcM5p+ePJbkC6pE4sl5wPNkmTlJ6ZsqnsGAZTz01IfcKk+6gs3kFHXEbLLCXId3hz6jbRWkRJ6kd74MmiZtQDAFpx4EpVRekUND0xe+oOWYSZckrUNK6Phj02c00rT1ExfBiBA+/hSmsRtdyoIiCagggX5mUsxc1oxdLVKbCfuG8FbkqP2PEVOAsOxhBXCo3uRgOx+XPLMpL1JVgDSYa2GwepgnbOpQglFtufpnvGSTR13TFVCluykuhrgW1iePhaGSTvMW7pbui+MVIwTf6Ag7hKbd3yWGMI2R7FRhV0A==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by SJ0PR02MB8673.namprd02.prod.outlook.com (2603:10b6:a03:3fe::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.21; Fri, 10 Feb
 2023 08:24:22 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac%3]) with mapi id 15.20.6064.036; Fri, 10 Feb 2023
 08:24:22 +0000
Message-ID: <0f09a13b-be65-be2b-35a1-935ddbc6b306@nutanix.com>
Date: Fri, 10 Feb 2023 13:54:11 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/6] migration: Updated QAPI format for 'migrate' qemu
 monitor command
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
References: <20230208093600.242665-1-het.gala@nutanix.com>
 <20230208093600.242665-3-het.gala@nutanix.com> <Y+TLJ9Ui790bIR3b@redhat.com>
 <ce476f1c-a2ec-9dd5-c36a-d60bb2a29286@nutanix.com>
 <Y+TzljkiS2JS0Uhw@redhat.com>
From: Het Gala <het.gala@nutanix.com>
In-Reply-To: <Y+TzljkiS2JS0Uhw@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0027.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::20) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|SJ0PR02MB8673:EE_
X-MS-Office365-Filtering-Correlation-Id: a4f0f32e-ecac-46bb-1a43-08db0b40366d
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xvJ2QmOQB8fWg7A2eCAf3mEBD1rKqJbJpSSkkaFg/mpeUjD+HDKJBN81jPsNmxZXyFpUh4mSpEDFUf6cXYm3mQzhkvAnVt7LBX+UiQG630ovl3kFDQMXFPGSuLt5HgTyKruZ50yRGafwtwXkLvOaeKAxwCkWtHLrqC+CX65zef6M2jOTigJ80/H/0G/mlIQh+rXnclyGs29MeDyTr983U/fSRcW5UXs6X7VZysv/cgcraEKRbXs0vuji1t421KZd6DKjpj2zLtlSfiSM6T4H3K+R7KOT6X0DKrK3ECVSYAkkK0GomfoYFtE4OOp9gKgO2FLRw75xnl9J9XayzcvOhsR+5ZNWK9MOFF7aDU39Yi/Kwna1TN1S782TjdM7o70HnwioJ0sJMVyShi0V9l3ZvhFjiltaXvUDSLv2dimAmG3qoZevgdanZdJNSp41khE6DX7/NdFqklQiFDfV6o96ZHCUbQilUWvW6rQCCNN6a53YpddbU47WPnHeUCpKQXmHL1QaX2ptHLxxKr6ybTK2TN/h7UwOB4JZ5TWy8vj8VLUwAm7rf4mrLu/qp+hOwXs2ZBnxkc5jAU4AOjE0CQqR5TPeU4WGtBdTtC91hXI7BWKE4WLXOnGxp7EVELwEezRv0SIsM3PVbHLLV+G6fTHu1B3dPkQ0FzCIff2bjrofz64eNFg+ZTaoo8niyNKteH0I+EJWpppuLrW+ZA6EwNM3MmbDw+g4EZ+K8x0T06G7mNY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(346002)(136003)(366004)(39860400002)(451199018)(8936002)(4326008)(316002)(8676002)(41300700001)(66946007)(6916009)(66476007)(66556008)(31696002)(86362001)(36756003)(38100700002)(186003)(53546011)(6506007)(26005)(6512007)(31686004)(66899018)(6486002)(478600001)(2616005)(6666004)(107886003)(5660300002)(44832011)(2906002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVZrU2RTUWkwT2Z6elQxZlJRSmMzRElsQ0JjYkVTYm02NDdMZnVDZjNpNEJU?=
 =?utf-8?B?QnJlQ0lWaEhVWGhxMytjOUlvRUlIcENyUDF6dEhkM1hPREExSzA5ZStpbEh5?=
 =?utf-8?B?RkQzMnA5bVpWQnBGQVVHOVhlYjQ1UnlBSmloSVNvZytCandxWnd2Y1hyMlVM?=
 =?utf-8?B?RDMxS091aFptMjVOcUZxbHkrWUYrcUJmZktzTS9hVDJ4SzNocGE0ZTk1ZGx4?=
 =?utf-8?B?UWNVUmRDMUJrUWRseXRxMGt0eUZLTzdnaXlVNHNUUHc0YWlHZWR2eFZTZXBr?=
 =?utf-8?B?Nk5wQmIyNUtUYUk2OTJlbXNMTkx4b0c3VEtLVnlWd3A0V3FpZ3Y4dm4zVDZr?=
 =?utf-8?B?ZWZ2YTd1YnFLTlRUNzFTOUdmU3IwQzgybUhKQmQ2b0xSVlJ6cktFUEQwVkZQ?=
 =?utf-8?B?UkJQU1dndjhJc3haaTBFQ3p4VWRIZ3htbFRqdnZVNVVQbTRUTFE4K0lTNVh5?=
 =?utf-8?B?Sy9mNVVqMVM4ZDZ5UWdpQlFDdUlUTTZzdWZVMlpjVEJOaElTaUd6WW9xbWVa?=
 =?utf-8?B?NG5abGhEdTIxQ3FMODdva0FVNkxNUWdkU0pHRmpjZEhlTENiUjl0Ny9pQndr?=
 =?utf-8?B?czBxY2hObkNDcGtjQVZjcHIrQU9RTFd5Qmp2dWdyZEpGcUpFS3BTelhENGF2?=
 =?utf-8?B?RmxrSjYxR1VabW40NTllMkZmVkZVbHkxWlArdTNZeWE4WnErQmQwUitCSDNY?=
 =?utf-8?B?a1FhVysycmdIVWphVkZvdGZZRndlV2RrZ0pQQ1BvYW40blkyWkl1cWwvVXJr?=
 =?utf-8?B?cnVYR012RUxzUEdxTVh0RlpQSlVnTlRjMWMxa3ZSRnE4MWtUekc1NlNtazVU?=
 =?utf-8?B?Qzh6UW9xQ241bE01VUJNLy9qV29JWW5XV2lPQlpYTmNObmdzV3hJdzgwSE9t?=
 =?utf-8?B?K3E3U3FmMzB6UUdWblVqSWthTWd3S2JiMkVEMEwyLytsay8xRWkzem0wVzRp?=
 =?utf-8?B?Q01NWEl1WXkvdVRKWFRiSWZKVnpXdE54UHZKcFk1VDlBMXdlTGh4UTA0MXh6?=
 =?utf-8?B?YmNmZHBYOW1vaXhianBSZzU2b3RGeHplTU1CY2RJaFdXT2JuNXRWQyszdHEr?=
 =?utf-8?B?WDkxWFFMaWtSWlh0UllKM1o2VkY0R1RDZjk1TEV0L250NmtVQm1ZZjJvb0J5?=
 =?utf-8?B?VDJoYVpWdDJwcGhzVGNxUGNOMUdiamN4Yld5WlJaMzE4TmM2MWloSzdDeURY?=
 =?utf-8?B?SkVGVjFNR3RiQkVNVDh2MXA3WktkbUpnUnBhTmVSQ0pFa2gvT1I0L3hqeDZz?=
 =?utf-8?B?YXQ2VkdIa0pLeTd5YzYweFN1K3pkeVU1ZTNPZGRST3pPYnpSQ01SU3Q0TWJ6?=
 =?utf-8?B?MWpwTEhMR1RvL1piRlBpRStwbmRlWWNlUlpWeStZMVF3ZGkyWWRwQnVxd1JM?=
 =?utf-8?B?eTduYkxGYVFyeGc1bVdhbTB4ZURTdzVRanNHYWJmN1BLdnJnV3Jac1VpZ0xF?=
 =?utf-8?B?aktxeVgzMFVMa1g2WWErVUgyZXhwR05xNElybXRYaUhZczRCOEM5cUwyRnlF?=
 =?utf-8?B?RGxDaUc0V0Q1TmRHd0N3eGlPSmExMUtaNzZ0SU4zZ21HajN1aWE5VVc3TkRR?=
 =?utf-8?B?QjRKVXkwMFZyNDFXSkxCL2djZ1loZ2hWS0s2WHNHK1Y5ZDFvTG44S1dsZjRp?=
 =?utf-8?B?KzZ6dnFIK3hiRE9ET3R5OGtwYlR4MEJUbGIreFZ1SG9XRXRIQ3FZMnl4R2Y1?=
 =?utf-8?B?Mk9udGVhbnFtek1oVk16WDRMS3FXUUh5clloM0kzUVVLZmRkcG5IMFl0eVBo?=
 =?utf-8?B?Nll0cWdNaEFMTWxJakQwMWQ5RXN2OFRoZHgwTzNsSzB1TWZ3RXp2VnU2TERu?=
 =?utf-8?B?RWQzZ2VsVlFNU0FuMUJtUCswaUF6RDNOeXh3TElQcDVFZ2RKWjM1UzBjSjhW?=
 =?utf-8?B?U2dsK2pTdE9wS0V1UWExYVhjL1hxZDRDZ2lEdnNJaFo3bWNybTRTZlcxbmFu?=
 =?utf-8?B?MzlsUkl1bVVWYm95bFNPZXhPKzhsNVJCMEc3MEoyQllVNnZaOFVxY0RUOGls?=
 =?utf-8?B?OUR6MlpUbXBwZmJ0RjROb0E1UzR5NVBlZ1lNREpnQ3J5NEhERlBkUnBnYkpm?=
 =?utf-8?B?eDJsV2prMm1QSVZreFVDUUp2aG1GSTRmUDhMR0FPMlNmbHcxVklPQ1NqZHFE?=
 =?utf-8?B?ZDJ6T2lUWlZIWk5wZG5SNmszdmxkMVprcjJzV2tqdXNUdXI5ZjBINThYdDdx?=
 =?utf-8?B?NVE9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4f0f32e-ecac-46bb-1a43-08db0b40366d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 08:24:22.5739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AuXCDLr9ISHhgp1BrsmB4d++MSPJBeHfDLeu69lSfGwn8SqkOrk6+nMVesEbvnB+TUmzv8wVyubU7Y1klCQFow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB8673
X-Proofpoint-GUID: DAEzPDOzQea23GTDXyD2MtsaU1IYRYXJ
X-Proofpoint-ORIG-GUID: DAEzPDOzQea23GTDXyD2MtsaU1IYRYXJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-10_03,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12; envelope-from=het.gala@nutanix.com;
 helo=mx0b-002c1b01.pphosted.com
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


On 09/02/23 6:52 pm, Daniel P. Berrangé wrote:
> On Thu, Feb 09, 2023 at 06:41:41PM +0530, Het Gala wrote:
>> On 09/02/23 3:59 pm, Daniel P. Berrangé wrote:
>>> On Wed, Feb 08, 2023 at 09:35:56AM +0000, Het Gala wrote:
>>>> Existing 'migrate' QAPI design enforces transport mechanism, ip address
>>>> of destination interface and corresponding port number in the form
>>>> of a unified string 'uri' parameter for initiating a migration stream.
>>>> This scheme has a significant flaw in it - double encoding of existing
>>>> URIs to extract migration info.
>>>>
>>>> The current patch maps QAPI uri design onto well defined MigrateChannel
>>>> struct. This modified QAPI helps in preventing multi-level uri
>>>> encodings ('uri' parameter is kept for backward compatibility).
>>>>
>>>> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
>>>> Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
>>>> Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
>>>> Signed-off-by: Het Gala <het.gala@nutanix.com>
>>>> ---
>>>>    qapi/migration.json | 131 +++++++++++++++++++++++++++++++++++++++++++-
>>>>    1 file changed, 129 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/qapi/migration.json b/qapi/migration.json
>>>> index c84fa10e86..79acfcfe4e 100644
>>>> --- a/qapi/migration.json
>>>> +++ b/qapi/migration.json
>>>> @@ -1449,12 +1449,108 @@
>>>>    ##
>>>>    { 'command': 'migrate-continue', 'data': {'state': 'MigrationStatus'} }
>>>> +
>>>> +##
>>>> +# @MigrateSocketAddr:
>>>> +#
>>>> +# To support different type of socket.
>>>> +#
>>>> +# @socket-type: Different type of socket connections.
>>>> +#
>>>> +# Since 8.0
>>>> +##
>>>> +{ 'struct': 'MigrateSocketAddr',
>>>> +  'data': {'socket-type': 'SocketAddress' } }
>>> I'd really like this struct to go away, but if it must exist,
>>> then call this field 'addr', as I think 'socket-type' is overly
>>> verbose.
>> In v3 patchset, I have already changed from 'socket-type' to 'data'.
>
>
>>>> +
>>>> +##
>>>> +# @MigrateExecAddr:
>>>> + #
>>>> + # Since 8.0
>>>> + ##
>>>> +{ 'struct': 'MigrateExecAddr',
>>>> +   'data' : {'data': ['str'] } }
>>> Instead of having the field called 'data' lets me more
>>> descriptive, and perhaps rename the struct too:
>>>
>>>    { 'struct': 'MigrateCommand',
>>>       'data' : {'args': ['str'] } }
>>>
>>> Any thoughts on whether we should allow for setting env varibles
>>> too ?
>> Daniel, won't 'MigrateCommand' be too generic ? I am of the opinion that, if
>> its related to 'exec' transport, the struct name should reflect that ?
> Mostly I'm indicating that it is not really an address that
> we're providing, it is a command argv,  so felt the struct
> could reflect that. We could do  MigrateExecCommand.
Yes. 'MigrateExecCommand' seems more appropriate.
>> I did not get your question allowing setting environment variables. Could
>> you explain it in more detail ?
> When spawning processes, execvp() lets use provide argv + env. If
> env is not provided, we inherit from QEMU. Currently we're only
> providing argv, so I was wondering if we should allow env too.
> Probably overkill, but at least having the 'MigrateCommand'
> struct lets us add it later.
Okay, now I get your point. Thanks for the explanation Daniel.
>>>> +##
>>>> +# @MigrateRdmaAddr:
>>>> +#
>>>> +# Since 8.0
>>>> +##
>>>> +{ 'struct': 'MigrateRdmaAddr',
>>>> +   'data' : {'data': 'InetSocketAddress' } }
>>> InetSocketAddress is a plain struct, so I think we can use
>>> that directly, no ?
>> Yes, we can use it directly. Just to keep consistency with other transport
>> mechanisms, I made a separate struct even for rdma.
>>>> +
>>>> +##
>>>> +# @MigrateAddress:
>>>> +#
>>>> +# The options available for communication transport mechanisms for migration
>>>> +#
>>>> +# Since 8.0
>>>> +##
>>>> +{ 'union' : 'MigrateAddress',
>>>> +  'base' : { 'transport' : 'MigrateTransport'},
>>>> +  'discriminator' : 'transport',
>>>> +  'data' : {
>>>> +    'socket' : 'MigrateSocketAddr',
>>>> +    'exec' : 'MigrateExecAddr',
>>>> +    'rdma': 'MigrateRdmaAddr' } }
>>> Ideally this would be
>>>
>>>      'data' : {
>>>        'socket' : 'SocketAddress',
>>>        'exec' : 'MigrateCommand',
>>>        'rdma': 'InetSocketAddress' } }
>>>
>>> though the first SocketAddress isn't possible unless it is easy to
>>> lift the QAPI limitation.
>> Yes, I agree with you Daniel. If we can fix the first one - SocketAddress
>> one, can we also allow ['str'] to also be directly represented by modifying
>> QAPI ?
>>
>> ex: 'exec': ['str'] ... something like this ?
> No, I think it is important to use a struct for 'exec' to allow
> future expansion of parameters.
Yes, got your point of exec paramter expansion idea from env variable 
concept.
>>>> +# -> { "execute": "migrate",
>>>> +#      "arguments": {
>>>> +#          "channel": { "channeltype": "main",
>>>> +#                        "addr": { "transport": "socket",
>>>> +#                                  "socket-type": { "type': "inet',
>>>> +#                                                   "host": "10.12.34.9",
>>>> +#                                                   "port": "1050" } } } } }
>>>> +# <- { "return": {} }
>>>> +#
>>>> +# -> { "execute": "migrate",
>>>> +#      "arguments": {
>>>> +#          "channel": { "channeltype": "main",
>>>> +#                       "addr": { "transport": "exec",
>>>> +#                                 "exec": ["/bin/nc", "-U",
>>>> +#                                          "/some/sock" ] } } } }
>>>> +# <- { "return": {} }
>>>> +#
>>>> +# -> { "execute": "migrate",
>>>> +#      "arguments": {
>>>> +#          "channel": { "channeltype": "main",
>>>> +#                       "addr": { "transport": "rdma",
>>>> +#                                 "rdma": { "host": "10.12.34.9",
>>>> +#                                           "port": "1050" } } } } }
>>>> +# <- { "return": {} }
>>>> +#
>>>>    ##
>>>>    { 'command': 'migrate',
>>>> -  'data': {'uri': 'str', '*blk': 'bool', '*inc': 'bool',
>>>> -           '*detach': 'bool', '*resume': 'bool' } }
>>>> +  'data': {'*uri': 'str', '*channel': 'MigrateChannel', '*blk': 'bool',
>>>> +           '*inc': 'bool', '*detach': 'bool', '*resume': 'bool' } }
>>> IIRC, the intention was to allow multiple channels to be set in a
>>> follow up to this series. If so that would require adding yet another
>>> field as an array of MigrateChannel.  Should we just go for the
>>> array straight away, and just limit it to 1 element  as a runtime
>>> check ? eg
>>>
>>>     'data': {'*uri': 'str', '*channels': ['MigrateChannel'], '*blk': 'bool',
>>>              '*inc': 'bool', '*detach': 'bool', '*resume': 'bool' } }
>> Yes, I got your point Daniel. But I feel it is better to introduce it in
>> follow up series along with introducing different channel types (main, data,
>> postcopy). It would then also make sense to introduce a list of
>> 'MigrateChannel'.
> Right, that means if we release QEMU 8.0.0 with the 'channel' parameter,
> and your next series doesn't get merged until 8.1.0, we're stuck
> supporting both 'channel' and 'channels'.
Okay, understood. It might become messy. If we implement 'channels' 
right from start, we would just need to remove the check in the later 
series but still supporting 'channels' and unecessary does not need to 
include anything intermediate.
> With regards,
> Daniel
Regards,
Het Gala


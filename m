Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CABE691893
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 07:38:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQN2p-0002Rv-MH; Fri, 10 Feb 2023 01:38:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQN2j-00022E-F7
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 01:38:00 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQN2g-0000BN-Vo
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 01:37:57 -0500
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31A3ccs5008616; Thu, 9 Feb 2023 22:37:53 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=809jlqUTAq2yrRTLJGRyPx+b3XksDrICcilfyHx8fJE=;
 b=HoiEfBeLPEQJt1q/dQ5quEMxEKvhQ8NbWQYetgIUQj3f4kYrwXQuS3IHPhu/i3zEeaIm
 E4woDeBN4WQUrrtaMH6Z7F1KMaBGSDAnzx3ayOa/AsH/J3eeLld9SdA4a8aaCZECkDIe
 cIVDa0Fyw62KjzvUflucogGR3uJ+9cwoLjFHV39UhoezZ6ygLAL77Hx9tJr9lsyi2TW9
 LquhSy9zMlk03B0EwFvPhOOh6H55l7dYT3kQGJaVYLj0o6w/lAKtlR6e11oYd7RVSzsR
 igznZXtlNjnOXL3SzIpZySZwAxtTYegyjIRATXFgqIc0ps54M3zPn53tKpKk8VEGV1YY uQ== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3nhqjp351g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Feb 2023 22:37:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LeCuF9HB5eLy5LNE+RuO0pJb3hvsrOR1NIJ0cAMVI+HuvEzvhJ7/wFvvQ4ee5TRO6yVzIdIlK/VW1WP3MnQKTXY1/E1hrQUwxIjL7fcv2SqXqBDzMgpG1oqymYOZfrWIjtRALG3+XOc61PL+NQnHIhFAlVPAJ5+jkZNUZHirdxP+L5NAyDcb7mjowHBZgwxHtG/5R7xfa+WoXFM2rMXdQdeyp7cc9yZu+yRA4OFLQ5vONamDFCzwi14rBSKrTabTP/sVzwzoa+RxxpXj+V5l1ZYPanUd0sN0kog1ozyczbkmVxN8aafFdTbeUuG28X3pl6weYenWpgaPdVFoz79ynQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=809jlqUTAq2yrRTLJGRyPx+b3XksDrICcilfyHx8fJE=;
 b=oYHTKlnx08y9a3QGstHvgupLWlKPZdVKUK+oN88q+DOu+S5+jMt6tNoYngUtKGz6oOeqJsZ+3/7vUucyAS9526IFaiB5Whg6iqV5lzxNu5McxOne3znh5wgC3L6QRaYdFYCurSKnabGM/VuLsaD0T9AYVybF+RB+NO+rlYZMo+iiBd//CvEOXLF7D37I9wGEYSNSzIa6KavTf13S9SxqbOJ/Ak2pLbtSkhuGv/1BVly7ANlyfDDdDRs6d1Mhwa4+WmE6iF+MEZk1159D5FXjKJyxstq1/F/EBTXS/Ql+Gusop7+yJjai/1poSQg774+KHb4JtRRppWYeGNcd1LFAFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=809jlqUTAq2yrRTLJGRyPx+b3XksDrICcilfyHx8fJE=;
 b=IxYKRD7pZGU/Jt1abVVAehHvwOaCcZppYERUAozM1MPTCHRbNKYBy6ipc+WSvIZyW8RkBKecCwrHgxXbTGLTWy5wMQjXqoXBajX0+EiNZc7rKWaX/zITRBsBHkCvX/Sf/cfCxIkPZTNogB2fGKye0IwN9L1ruvuc6tYYoS0pXMrEo5he9Egq6QDWyzCIHH2h9JvJVXCKGcfDP1lxe+dkchYNWdU43l6Vh/6W8p7KTw9H8kE8PHA/QTMgP5wvIBnQI75gWpJSfjHvKsS8m03ueJ165v7BHL+TxmDWO5fajKRrucvicTTXEj5UeBp0Mc4hnB92hRwVF8lr7DT63XUq/w==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by SA1PR02MB8573.namprd02.prod.outlook.com (2603:10b6:806:1f9::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Fri, 10 Feb
 2023 06:37:51 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac%3]) with mapi id 15.20.6064.036; Fri, 10 Feb 2023
 06:37:51 +0000
Message-ID: <395ba953-d67b-e0cd-25e8-9324c4345cd7@nutanix.com>
Date: Fri, 10 Feb 2023 12:07:38 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/6] migration: Updated QAPI format for 'migrate' qemu
 monitor command
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 prerna.saxena@nutanix.com, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, armbru@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
References: <20230208093600.242665-1-het.gala@nutanix.com>
 <20230208093600.242665-3-het.gala@nutanix.com>
 <20230208201712.b3a5xtufscrvncqt@redhat.com> <Y+TJr7An261VcVJ/@redhat.com>
 <Y+T3apJYMdQ3nxu2@redhat.com>
From: Het Gala <het.gala@nutanix.com>
In-Reply-To: <Y+T3apJYMdQ3nxu2@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1P287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::22) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|SA1PR02MB8573:EE_
X-MS-Office365-Filtering-Correlation-Id: aecb5ac4-0b29-4693-53ed-08db0b3154db
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R1OjYLTQwcmmac7eFY8AbUQs9lrH25kunn6u+VjgH1Nk9hwBxDINhJrgYIc6oZMUtpu8QTet1VmydUs232mg0oV5kE4PsY+lMe2gLV+r8OWiIaL8i6xQg767/g7822mq5kriOTQgMk7XWOTUUKCIuKGJNcJOcrsSqcBtD6Y9WM9Lvp7/AZhuasH+XqFZ/HJWbcW+ZAM+4UC6nupaoJ6XceJLZ2rlX4pPVFU3NPoX6JazEpyqEA6GFI45+tX8+CFCDKGtl8ahPwzf8x7FqEs9gWU69BbvyeklbZMZkltlDFjpGAgLAZWDAaZER4VQp0PpIlFGG0AY0rxluGKw40+No2+yB5VfFFs2ZnLRmgTwhgFIByRhlK6aRzhpu7YoyUfrZELUUqppuI9lO1tXEFgWLXX5TGxMMFNQDZJvR+xMEQZtCAfrDFyk0WOiQYB6KdA9cEoaQGm9Zo1m4z246/lWTcNp1QU99CfxejtzRoZ9vdhCRUIM/ZM46AJFymRIMHV7o2hFmoqvPn8l1eurWJ8vDsZurlT47loMrCo3z4UMjrqO0CV27hwgwnO/j1QcnGIQb9pgVdwKUH2Fz4zKwaYoWJ7i3Wg644Abg2ZmdBpNFln0nEELNBYSjv6Ox/ysMGYI8Zd/jlJD//pxPFloA2JhGYQM5deZP/iuepp1SLAViZrEy9zOX/X0v+IqA9DWiO7GLHGsKbMZw8NGx+2zK0Xq/g0y/iFtSHyiQQcr3v2IZIzLAqEa4HqaCcgc2g4CVm2k
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(136003)(396003)(39860400002)(346002)(376002)(451199018)(36756003)(2906002)(6486002)(478600001)(2616005)(53546011)(26005)(6506007)(186003)(6512007)(83380400001)(66476007)(66946007)(41300700001)(66556008)(6666004)(31696002)(44832011)(8676002)(5660300002)(38100700002)(86362001)(8936002)(921005)(6636002)(316002)(110136005)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnVDNDNFY0dydVNDWUtpWmQveGxuRWpPSjlMRmNHYmpMZ2VDQmhqRnNoU1R5?=
 =?utf-8?B?QjBZWFBJSTl6eWhrcXgyTG9PUDN3YXd1M2E0bTFmTjFlcTRJa3RiRGJHNXUv?=
 =?utf-8?B?UnpBTkxsTVI5R3IwUTdjUXV0alRRaThIRTdrNWpkaG5sclZEZFZiTlp3THlz?=
 =?utf-8?B?eHk5NnVyUW1vRnROSzN5ZWVvYThKTWVRSkJSRm5tTmRiZHNGcjd2eUZFM0Z3?=
 =?utf-8?B?YTRXVlpON3AwMDQ5SXhiaWJwaExvdVB2eTMvVmJrUlpNR2F4L3EvdHI1VTFy?=
 =?utf-8?B?QnFreDZnbGNQU05jSE85eERYUGFodUl2T1Z6YnE4bi8vQVd4MEN0TDJPMEQr?=
 =?utf-8?B?OXF3aVpSdXR3MCt4NUExcGEvbEEvTzhNTmc5eXpSbEFGbS9ZVGF2Z3ZVQmJF?=
 =?utf-8?B?bHVBNDlNNGdsYTFPbndud250dXJ5cVNoTm54TFJmK3hTbkJiTEdXWkFQZlUw?=
 =?utf-8?B?VklWRjVYUDU3b2lOcDlUdW1veVFMR0lORW5vT05sbUNEN0xSelhYTjlaK1E3?=
 =?utf-8?B?Z3V1Ry9jbENSTVFSRkdRb21DQStDeHNvQjM4UjNBR1BWcHFSZllMTHBXUGVk?=
 =?utf-8?B?Q1JsS0NPbmNLKys4SUoyWjhyVTF0T3dnS0VVUytXNC9aUGZaQVRpRkNsNjJY?=
 =?utf-8?B?MGtBNTVRZ1l5MVVTT3NxR0J5OC9MQ1VMaXB4d053NFlnNG5UWHhlOGIwVHpP?=
 =?utf-8?B?djMyRmxLK0xoMG5JbzAwMmxsSmxzWDhTYkpvdmV0Y281S0pYRnlhRjZQOVp5?=
 =?utf-8?B?a2p2YzcxcE01N2VOZ0VxRGd4MlBScTlUNUF2MXplOGNyRWowU3pZbFY1bHdM?=
 =?utf-8?B?SHZacjVUUjNOQWlSOHJZdEs2ODAxRlpOM0ZEZHJHRDB2L09DenNkSStqR2xm?=
 =?utf-8?B?RU9Gb0JIcVppdnpsY3RweFJ0WlhiYWplN2pJZFJaOFdKbWZJYnQ3c2IrbmpV?=
 =?utf-8?B?a3ROYnRESm9LYS9aTXIxSERJTFVBYUUwSE9DTElxSzZZR290cDJZblNQTmlt?=
 =?utf-8?B?TUFpYWZ4MWJ5aTdIMHlFYUxBUTJCUXdTZzFOSXF0ZllBTVZDY05tTDluRkFk?=
 =?utf-8?B?U1dNZ0RKSHNFRnhOSW40Z2FaU1Y0by92MklvR0RYRjM2UXJYNGZ6WEFxZkd0?=
 =?utf-8?B?Z0V4R2ZmaWVIb3dxOG02Z3RlVWFYOWJKWStZRkZsenNrSnBjZnJWcEVmazRq?=
 =?utf-8?B?MGR2SHM0L3hodWsxR1UrdzZRVm0yOUVHZFFUV3NOb0tmTDdPa1RiSWpXS0FO?=
 =?utf-8?B?aGkrMm1xMmtVTGc2ZUs0SmFQVVZnNEFLR2NLNnBLUk41TFhaemhYUlNsQiti?=
 =?utf-8?B?eXhHRmNsUnJxa09zdDlTV08yVm1HVUVHTjJQdFp5YjR1b1hWUHYrMnlhZ2VU?=
 =?utf-8?B?UVJsSFIvWXRvMG5RZ2cwcGQ2ZUtWbGdCZ0lnbkIyV0hNSC9saHY5WTViZ0l3?=
 =?utf-8?B?T2pGODdzWjZFeWU2WW81Q1lKamYxN1pVZlByQXljMjY0d25kOWU2UmFTR0tr?=
 =?utf-8?B?bGJtQXI1aytDa3E1b0FoK0lPN0NsZUJIdkJ0Y013dWJaQVArZVZ5bWVXN2R6?=
 =?utf-8?B?UjFlNFl1cmxOQ2RjRTQ3Skl1ak5hS0RLRklpVmFwdGZmMjQ5Yk0wek5yNU1E?=
 =?utf-8?B?cWdxTzByM1UvKzdlN2NwcG9pZFg2R1dEZllTaDMxV1lCRkhGZzd3bWRNZi9P?=
 =?utf-8?B?Vnd3Q1cvcUlMOWZsSmNSY1FUSU9BYWQyZE4wS2Z2VktSWnh2Y2NzVXhwQk5r?=
 =?utf-8?B?YlAycEUrZ2orMTVMTkQ4eUlESVRqb0ViaFpmQVJ4elhEWkYyb0tpUDFDL0Ir?=
 =?utf-8?B?T0hlbmlkSFdmN1BUWkpVK21JaHZETktmejVnZjN0eTBUSUtnOGJjaGtrSmNF?=
 =?utf-8?B?ZmNBbXFCNStBOVlWSC9TL2xPN280d0NVMkN1aTdRS0M0MGRJZWo3enFKTGtY?=
 =?utf-8?B?ZjF6eVVFV2pPOFkrVitrZ1hnUE1PSWJQcHc0Wmtyb0lkWGZpSHdqSWFVWnpC?=
 =?utf-8?B?QjdkRFk1OFlTWHlWTnp3UHJYeU1LSW9BbGppMEQ5dkQyQ3Iwd2E2bDZtTHdQ?=
 =?utf-8?B?NERqQm1kRURtdldJR0hER0s0Uk1XVjE0OXJWZFlXNWNDaVF5SVJuSjI3Q1h2?=
 =?utf-8?B?T3hzcDcybW1GSS9GWGFhVjh3NW9rRm42NzdOTlJhbXM2OTlhN0hlWVAreXFW?=
 =?utf-8?B?WUE9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aecb5ac4-0b29-4693-53ed-08db0b3154db
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 06:37:51.1926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SvmNMCQWA4gXm9+aV09h9eM338D/J6tn6fc+SiXrqSgYlb/3XbyD3EIZUem8CPR9ojLLwMjIvZxrikRQNHEaHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR02MB8573
X-Proofpoint-GUID: AtpsRwy0HKY50AE1CrwwZW_2zFxwzz4k
X-Proofpoint-ORIG-GUID: AtpsRwy0HKY50AE1CrwwZW_2zFxwzz4k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-10_02,2023-02-09_03,2023-02-09_01
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


On 09/02/23 7:08 pm, Daniel P. Berrangé wrote:
> On Thu, Feb 09, 2023 at 10:23:43AM +0000, Daniel P. Berrangé wrote:
>> On Wed, Feb 08, 2023 at 02:17:12PM -0600, Eric Blake wrote:
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
>>>>   qapi/migration.json | 131 +++++++++++++++++++++++++++++++++++++++++++-
>>>>   1 file changed, 129 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/qapi/migration.json b/qapi/migration.json
>>>> index c84fa10e86..79acfcfe4e 100644
>>>> --- a/qapi/migration.json
>>>> +++ b/qapi/migration.json
>>>> @@ -1449,12 +1449,108 @@
>>>>   ##
>>>>   { 'command': 'migrate-continue', 'data': {'state': 'MigrationStatus'} }
>>>>   
>>>> +##
>>>> +# @MigrateTransport:
>>>> +#
>>>> +# The supported communication transport mechanisms for migration
>>>> +#
>>>> +# @socket: Supported communication type between two devices for migration.
>>>> +#          Socket is able to cover all of 'tcp', 'unix', 'vsock' and
>>>> +#          'fd' already
>>>> +#
>>>> +# @exec: Supported communication type to redirect migration stream into file.
>>>> +#
>>>> +# @rdma: Supported communication type to redirect rdma type migration stream.
>>>> +#
>>>> +# Since 8.0
>>>> +##
>>>> +{ 'enum': 'MigrateTransport',
>>>> +  'data': ['socket', 'exec', 'rdma'] }
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
>>> Here, you use 'socket-type',...
>>>
>>>> +
>>>> +##
>>>> +# @MigrateExecAddr:
>>>> + #
>>>> + # Since 8.0
>>>> + ##
>>>> +{ 'struct': 'MigrateExecAddr',
>>>> +   'data' : {'data': ['str'] } }
>>> Inconsistent on whether you have a space before :.  Most of our qapi
>>> files prefer the layout:
>>>
>>> 'key': 'value'
>>>
>>> that is, no space before, one space after.  It doesn't affect
>>> correctness, but a consistent visual style is worth striving for.
>>>
>>>> +
>>>> +##
>>>> +# @MigrateRdmaAddr:
>>>> +#
>>>> +# Since 8.0
>>>> +##
>>>> +{ 'struct': 'MigrateRdmaAddr',
>>>> +   'data' : {'data': 'InetSocketAddress' } }
>>> ...while these branches supply everything else under 'data'. Also,
>>> while you documented @socket-type above, you did not document @data in
>>> either of these two types.  [1]
>>>
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
>>> Another example of inconsistent spacing around :.
>>>
>>> I'm guessing the reason you didn't go with 'socket': 'SocketAddress'
>>> is that SocketAddress is itself a discriminated union, and Markus does
>>> not yet have the QAPI generator wired up to support one union as a
>>> branch of another larger union?  It leads to extra nesting on the wire
>>> [2]
>> I don't know the backstory on this limitation. Is it something that
>> is very difficult to resolve ? I think it is highly desirable to have
>> 'socket': 'SocketAddress' here. It would be a shame to introduce this
>> better migration API design and then have it complicated by a possibly
>> short term limitation of QAPI.
> So to understand this better I did this change on top of Het's
> patch:
>
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 79acfcfe4e..bbc3e66ad6 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1467,18 +1467,6 @@
>   { 'enum': 'MigrateTransport',
>     'data': ['socket', 'exec', 'rdma'] }
>   
> -##
> -# @MigrateSocketAddr:
> -#
> -# To support different type of socket.
> -#
> -# @socket-type: Different type of socket connections.
> -#
> -# Since 8.0
> -##
> -{ 'struct': 'MigrateSocketAddr',
> -  'data': {'socket-type': 'SocketAddress' } }
> -
>   ##
>   # @MigrateExecAddr:
>    #
> @@ -1487,14 +1475,6 @@
>   { 'struct': 'MigrateExecAddr',
>      'data' : {'data': ['str'] } }
>   
> -##
> -# @MigrateRdmaAddr:
> -#
> -# Since 8.0
> -##
> -{ 'struct': 'MigrateRdmaAddr',
> -   'data' : {'data': 'InetSocketAddress' } }
> -
>   ##
>   # @MigrateAddress:
>   #
> @@ -1506,9 +1486,9 @@
>     'base' : { 'transport' : 'MigrateTransport'},
>     'discriminator' : 'transport',
>     'data' : {
> -    'socket' : 'MigrateSocketAddr',
> +    'socket' : 'SocketAddress',
>       'exec' : 'MigrateExecAddr',
> -    'rdma': 'MigrateRdmaAddr' } }
> +    'rdma': 'InetSocketAddress' } }
>   
>   ##
>   # @MigrateChannelType:
>
>
> That results in a build error
>
>    /home/berrange/src/virt/qemu/scripts/qapi-gen.py: In file included from ../qapi/qapi-schema.json:79:
>    ../qapi/migration.json: In union 'MigrateAddress':
>    ../qapi/migration.json:1505: branch 'socket' cannot use union type 'SocketAddress'
>
> To understand what the limitation of QAPI generation is, I blindly
> disabled this check
>
> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> index cd8661125c..cb5c0385bd 100644
> --- a/scripts/qapi/schema.py
> +++ b/scripts/qapi/schema.py
> @@ -653,7 +653,7 @@ def check(self, schema, seen):
>                           "branch '%s' is not a value of %s"
>                           % (v.name, self.tag_member.type.describe()))
>                   if (not isinstance(v.type, QAPISchemaObjectType)
> -                        or v.type.variants):
> +                        or v.type.variants) and False:
>                       raise QAPISemError(
>                           self.info,
>                           "%s cannot use %s"
> @@ -664,7 +664,8 @@ def check_clash(self, info, seen):
>           for v in self.variants:
>               # Reset seen map for each variant, since qapi names from one
>               # branch do not affect another branch
> -            v.type.check_clash(info, dict(seen))
> +            #v.type.check_clash(info, dict(seen))
> +            pass
>   
>   
>   class QAPISchemaMember:
>
>
> After doing that, the QAPI code generated handled the union-inside-union
> case without any problems that I can see. The generated code looks sane
> and it compiles correctly.
>
> So is this actually just a case of overly strict input validation  in
> the QAPI schema parser ?  If so, what's the correct way to adapt the
> checks to permit this usage.
Could we take advice of Markus and other QAPI maintainers here and 
improve QAPI language here.
> With regards,
> Daniel
Regards,
Het Gala


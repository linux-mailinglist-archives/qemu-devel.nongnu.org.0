Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C17F2615086
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 18:22:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1optWL-00084E-RF; Tue, 01 Nov 2022 11:49:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1optWJ-00083j-OU
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 11:49:43 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1optWG-0007x6-JQ
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 11:49:42 -0400
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A1967Ar021966; Tue, 1 Nov 2022 08:49:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=ESL10rdmFaM9lUNhpvOv6ykW1lHaL0wRVswRZA0xYKQ=;
 b=MwKRirrqxLRWnlfjMsnbe/CtkAu621PM3NimDveSAS0cxaEJ9Cpn08xZR/yB6Gw2M7mL
 RtE25JIH1JLxno0tUOeXXXqQwkGaTUS7+ozuZI0FAfxsta7BFt8evdMO0MPKVAglF8E6
 ZU78+L7FSHCMbYwYrpZl8o8yaeWhEGFD6o9KyvpvdbNKbFeqfRlG8MvXTVq1/mhR0Y9/
 8dVKhC54/863Ctmurzdb2h4ofbu4WSPVXXqT91gD9ZikU+fVUykuPw6R9k78chvgULJZ
 V8Kt7lfEwqa3kvGY1qiBLzSqbpuRNrgIXY+CdffcNSAUzLGjnHL4vEk9v0akNrseZ6E7 Og== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3kjmjfae0b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Nov 2022 08:49:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O/hwCQlfjrSs8kOQe9ZBH5ihATQ6mR7VAtqtw0X0p3FR/S4F+pUdUkzjvW6yAevQgLWmnWcPAuwKVCRU4fD8UzjN9OyY0uddbE+GNjlHkhRBeF88DktIP4JxNfOPHR1qMm9zqS1xUm/y7DoIFcqP7Zula0ABJjf0XpggLtB0P/Q/jL4HI7/TEYrl+EfiWwfdhFq54Oj4uByO24lJnhzDze8Hc9Ut1wXHOtmyOkRcNJbzzrU5G9fKWiYlQIePSD+4+/mx3uWibW70J5EAY9dLjLfDiLVzUZe75xnNXfp+Yobp4vcrnP5ZmqdUctaxY4fbwJzBRKV7XU3/kA5gVVWQWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ESL10rdmFaM9lUNhpvOv6ykW1lHaL0wRVswRZA0xYKQ=;
 b=FokXT0cx5hHsqbbpZrg7xQDiAPbrZ+jOVm8iL34SxeO8zbfFg2yjT8InFpyczMEkcLKmXRTZu7I2mTVBvvt8T6ZDgSBJ0ds7knWu7kMy2pKzCh4tSf9NOr5n902SiPdFl9S5Vyxz3Wcr4MXCFiGSaUlqivWfkKL6YQLzbIzpvx8i7iqpRmhnaDtyOqemKeLNuvgbg2/jn/u69y11rPtkIJ1VxfVD/JaYaU4wAx8GE1yEtcA0Fv+vB1bf8vNPdA7ObFR+ktgYX48KeMoli+2gPpdba3RflC4rdw5SxmvIfIpLZv3SM2KhWASRfxB94mNDNywBiCGcaUOCjo+cSj85Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESL10rdmFaM9lUNhpvOv6ykW1lHaL0wRVswRZA0xYKQ=;
 b=2/4uIULQpOgnZwtjisoe/CdhpBKUkUtpmvG/y+S28bUxvxQ20K49qOlE+k9ooWkIw61SGi76aeDpHHkMQC679PHdDEDD3uy9Ep5pnET0Wp7RhhmNn4hllSA80/VVMKYOUI1/lknEQqnu3WVLZyo2yADVqVY4NVlMd/2TadfUhZOTASXW+COFsxQrpnBL5s5OKkeILlKFhYnCXRC3rYZBZv1PnlEkSYgapV6V3Tb+vzSEBtDx8eB/Ombb4BzjPi11I/UqdGfFpCTi+yd09s9o+SPTP2B3dd1dVRQBxL8XAJuekhtVWIcbMWkc/W1GJpvXRPvSYzRYon/Th6OHmts5RA==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by PH0PR02MB7335.namprd02.prod.outlook.com (2603:10b6:510:1b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Tue, 1 Nov
 2022 15:49:34 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::c63:8c2:93a6:8f82]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::c63:8c2:93a6:8f82%5]) with mapi id 15.20.5769.021; Tue, 1 Nov 2022
 15:49:32 +0000
Message-ID: <eb0dfd24-50f0-6398-63b7-91dd1c50d994@nutanix.com>
Date: Tue, 1 Nov 2022 21:19:22 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH] migration: check magic value for deciding the mapping of
 channels
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, peterx@redhat.com
References: <20221101143029.14246-1-manish.mishra@nutanix.com>
 <Y2EyVkdLMln7CX15@redhat.com>
 <9faf2604-f0b9-f3c3-5ac8-e4deeeebc424@nutanix.com>
 <Y2E+/WZgWXQQgdY5@redhat.com>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <Y2E+/WZgWXQQgdY5@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::27) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|PH0PR02MB7335:EE_
X-MS-Office365-Filtering-Correlation-Id: 036891f3-a11a-4f9f-0bba-08dabc20ab26
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +IFxiyqyYQGtOODrZEn0ADtjw5bvVMB7llVuiMTbHTD0cUxsPCUogppM0yqg2t4quqXo/bZVAVuHW1ZEp2yQvj1JxORzpW+8M4QLQ06ze9KfXXO0FY4b28Z6P8AYdn0HCtSRNm72tR2q7ojm/6TyJO19YXx9P8GNEYUpAvpq+/Lgk+dZZqcKmcYbWp35nX+6sYeMQxtOPngtoBl5xtu/WuKAD97+oRh6GW0tEVzwLooLHEE52X5r8L2Fc5IwXuKn8V4HequTJqNzqdLswOQc1RFivR9UjuoO6wU5k2Y170O/fUve8xX07c8Q0d8Ph11Ecu8o/d0LdBOu8EADp96IMfsX3KqYH7QQUi5iBNwRA4sKdMeQDekOtQuwVl+pGrlDMIFsBRWKwMwYvCVC32Py2e7GRP4lUs3Z5MjfgHOPCTfJpE+YMIDFlhPa5iifYVfQaZZmviWJZEUvPKn4glU8Kv/+ITd7aZfCPqBXUlKhuZ7atkMRXdYb2bEUIvRId4NX4BeLfSdqo5oWAko53xlRUB++fAhGRgSt/WqL63GPgN5DiK84IBpNKSUA6Vo/3XSYZdbTJ48M5Q1HIIP9bI8DtlrC88o+MV6DHt24uUyF990nzn4TVFsD2kIPQZ3lb5jdxnPdk+kHS/sCEWJ1wVZBUdqpO0ZGUK++4CLNpPjkeWVvndvxlKxJfuJl3VASHXyadOHVt5M2e6x44IAXylsFTtlWWQ8cD0+1Xis7k9tmjGWBW9iumDz9q98nGVgIOLi0b2Xqw2tUr6Py0SNvUubdQVAROYe7zPdMXDtkFVDIkME=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(396003)(136003)(39860400002)(376002)(366004)(451199015)(6916009)(41300700001)(8936002)(5660300002)(36756003)(316002)(6486002)(478600001)(86362001)(31696002)(2906002)(6666004)(38100700002)(53546011)(6506007)(26005)(6512007)(83380400001)(55236004)(2616005)(4326008)(31686004)(186003)(66946007)(66476007)(66556008)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDB0MEM2ZjY3ZnZSck8yQWNvNHp5RHE2UzhmQWh4QTBySnoxRkdVc0dyR3RO?=
 =?utf-8?B?ZUhPTU9tb3UvQklwQkRvUWZmVUF4cjh6Y21INUJqdkkzSmluRlg4QmpIbFZq?=
 =?utf-8?B?c3lvc2tFajB0c3BzOFJpd2g5NUp0M1FkUWhPN0hxMUNLbjBmT1crLzMvRmxW?=
 =?utf-8?B?cE41VUVXbUR6aWQySDc0Z1hTTmFacHdjWTNBWlZZUmxoMlpReG82ZEtCZWVr?=
 =?utf-8?B?ZXpJcHVYK1hPZ3RDSSsxdVoyajg3dnZUY0l2SVR1MGpoWGo0dVlMWHMvcVlT?=
 =?utf-8?B?WmoveFpOZURFeDV0OUthc1pEYnI3TmdMeXpxNWNyUG5aa3hGNDJZdU1pK1NF?=
 =?utf-8?B?bWZFOUlQR05JV2UxNlZRUDR1U1dIczd6ZzVYakVnK1BHbytIRTFwZVZFUXlp?=
 =?utf-8?B?U0FsTjZ4Qjh6eEU2STJBQjVTQ3luNnFteW9jKzlQbmI0WUhsWkd0ejdjRS8x?=
 =?utf-8?B?ZWhuU2dmeU1RdnFycWxyY211OGdEekh3RmVwT1BxTG9lazAvMndMVDVPMWR4?=
 =?utf-8?B?UTNWSkJ6YTAycDN6UXQ5MS9GVDhjN0FjcW9odG5XTlZpaGx4c0lHL09SV1NZ?=
 =?utf-8?B?THJZQWkzYVBWSHpqeS9nMEdodkNTMHlCbVZtV1Z3SVh4NnBDNkJrS2twQ0sz?=
 =?utf-8?B?TFhRVVhPM2hPTkxQNHFiOEVlbXkwd2IzUmNJU3J1NzNIQldMSExvT0lYckIz?=
 =?utf-8?B?QzcyaHNsQlFjd0JFYW8zRWpYM1hQWHJCWHB4dG5Ed1VROWE5cWZJem9ianF3?=
 =?utf-8?B?WDZ4RDBWOWFiYTRXNU9RRnFYTG1kWXFuVWxQK2Q2VU00Y0U2MVpiemFEdmhQ?=
 =?utf-8?B?L2crcEFacDFTd20vR2t5djRtNWkzanpjK1ZaV2h3WlJQT25CZ1JFSStWYXZR?=
 =?utf-8?B?WUxsYjloQ25KUmxScDNLSFJEUjJoMzQwSUFXeXpQVEFhODRJWHVjc29vZk1Q?=
 =?utf-8?B?MjVCbkI2dG9JSk5EQlNqbjdMTlV3WlBMUGRHOGVUMGRQQUxVcWEvMC8wY3dm?=
 =?utf-8?B?RGU5N2REZkpkelBJVW82aTd1VTJ6NnJkOCtnL2tLVWVsalkwQlZsdlFnR0l1?=
 =?utf-8?B?ZzEzK3YzNmtkbWZHZU5rYWc1UmVHUis0cWUwc1NuODhLQjBlc3pEWXFTZmlY?=
 =?utf-8?B?bXFCMHdSUFpTMGQvSXBRY2VOcXJ6UkJYcnZiTlY5STE0RzhRNmhqUmZiUUhL?=
 =?utf-8?B?Y1JWVzNhazJ4Y0FUcEpYV0VMdXhvelRacE9vWVpYeE50OFI2UWk4WldLc3kv?=
 =?utf-8?B?NHRkSGxvdW9QVzlMYjRPNktFdlRrenpMSXV6UFhOSG5SaURKTGxrcWVZMlY2?=
 =?utf-8?B?SzhlMUt2UVVqVUZPekZIQ0hINVpCYlRNQkV1dHlPT2piazNYMHcwaGxOSXFo?=
 =?utf-8?B?ZHoyaHg3bU9hQzJ1ZWNkemRWU1I2UjFROVg0Y0tvbWV1NU1hUXFDdHhZeDQw?=
 =?utf-8?B?RVBRdURMNWRKWXV4L09oSllWSEtzQlZRVnZORFovUlRWU0ltakZPYVZPc2Rx?=
 =?utf-8?B?VmhvUjg2aUdOK1ZDTy9raDdoVWZGaDBXWHQzaTZGdkliaWRFNkhRVSt0MVF2?=
 =?utf-8?B?N0hpbHFKNkR3UkxWNGtiU2ZTdG1ERDdpeHkxT2lLbHJUMXhHMUYyYTdXdTls?=
 =?utf-8?B?anB2SnpKYjYyRk5Ka2VycGZOVG5oQnNXMkIzNVhFeDV2SWVaOGM3OHZKeE5n?=
 =?utf-8?B?ZnQxQWNHU3VPVFQxSW9TOUw3aVZzYVJIU3RRblJaOVFxS2tqU1ZmK1lad3d0?=
 =?utf-8?B?elk0RExLemhITTBSNlo3amVYUTNmTk40RGd0ZnZMRXAyL1pmL0hhdHFVVktr?=
 =?utf-8?B?WUFzNk5meGZoK2k4U1FTbDlwN1BhK0FIL0g1ZlkwL04rbEV0c1A5anc2d20x?=
 =?utf-8?B?cHFvaFdrUVJjTTJSTldsWFQzb3lXcWNVak9XNXNta3BGc28ybmRweE9aRkhw?=
 =?utf-8?B?am14aktyZTRDdjd2RzNmekpCdzh3cU9NTW9HMm9qaGxITGpmbWtCZm5YSTRu?=
 =?utf-8?B?Z3RBdTc2S0wzKzNtelViODZ4U1JMWFhYeUVyV1p4RjgwZlphVC9jdkhHZ2Ix?=
 =?utf-8?B?YTJtaHJkUStzYTlPZUtlajVPTng3UWZVenVJS2VNbEYyb1F6VEovTytNQmdM?=
 =?utf-8?B?aFpXQ2ZPZzYvdndqc0FFK3U1UytVaVl5OTQ0Rk5rYUNpU2hPL0IwcGtyZmJa?=
 =?utf-8?B?NWc9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 036891f3-a11a-4f9f-0bba-08dabc20ab26
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 15:49:32.8982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fMT+Xl3GQiUVkKYiOR0Rg+NcCJ+f4OlHj3jNjUkslaqCXv3wTP6F5fxGsGSPlRAZ5qFCnyToH+DWI/ZQP/bZ1TlZ4sqDhpk7K3Z9jYR1C04=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7335
X-Proofpoint-ORIG-GUID: NILUd1IFesO-kt2-MX2aT8aXf8ei-P8s
X-Proofpoint-GUID: NILUd1IFesO-kt2-MX2aT8aXf8ei-P8s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-01_07,2022-11-01_02,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=manish.mishra@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.051,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 01/11/22 9:15 pm, Daniel P. Berrangé wrote:
> On Tue, Nov 01, 2022 at 09:10:14PM +0530, manish.mishra wrote:
>> On 01/11/22 8:21 pm, Daniel P. Berrangé wrote:
>>> On Tue, Nov 01, 2022 at 02:30:29PM +0000, manish.mishra wrote:
>>>> Current logic assumes that channel connections on the destination side are
>>>> always established in the same order as the source and the first one will
>>>> always be the default channel followed by the multifid or post-copy
>>>> preemption channel. This may not be always true, as even if a channel has a
>>>> connection established on the source side it can be in the pending state on
>>>> the destination side and a newer connection can be established first.
>>>> Basically causing out of order mapping of channels on the destination side.
>>>> Currently, all channels except post-copy preempt send a magic number, this
>>>> patch uses that magic number to decide the type of channel. This logic is
>>>> applicable only for precopy(multifd) live migration, as mentioned, the
>>>> post-copy preempt channel does not send any magic number. Also, this patch
>>>> uses MSG_PEEK to check the magic number of channels so that current
>>>> data/control stream management remains un-effected.
>>>>
>>>> Signed-off-by: manish.mishra <manish.mishra@nutanix.com>
>>>> ---
>>>>    include/io/channel.h     | 25 +++++++++++++++++++++++++
>>>>    io/channel-socket.c      | 27 +++++++++++++++++++++++++++
>>>>    io/channel.c             | 39 +++++++++++++++++++++++++++++++++++++++
>>>>    migration/migration.c    | 33 +++++++++++++++++++++------------
>>>>    migration/multifd.c      | 12 ++++--------
>>>>    migration/multifd.h      |  2 +-
>>>>    migration/postcopy-ram.c |  5 +----
>>>>    migration/postcopy-ram.h |  2 +-
>>>>    8 files changed, 119 insertions(+), 26 deletions(-)
>>>>
>>>> diff --git a/include/io/channel.h b/include/io/channel.h
>>>> index c680ee7480..74177aeeea 100644
>>>> --- a/include/io/channel.h
>>>> +++ b/include/io/channel.h
>>>> @@ -115,6 +115,10 @@ struct QIOChannelClass {
>>>>                            int **fds,
>>>>                            size_t *nfds,
>>>>                            Error **errp);
>>>> +    ssize_t (*io_read_peek)(QIOChannel *ioc,
>>>> +                            void *buf,
>>>> +                            size_t nbytes,
>>>> +                            Error **errp);
>>>>        int (*io_close)(QIOChannel *ioc,
>>>>                        Error **errp);
>>>>        GSource * (*io_create_watch)(QIOChannel *ioc,
>>>> @@ -475,6 +479,27 @@ int qio_channel_write_all(QIOChannel *ioc,
>>>>                              size_t buflen,
>>>>                              Error **errp);
>>>> +/**
>>>> + * qio_channel_read_peek_all:
>>>> + * @ioc: the channel object
>>>> + * @buf: the memory region to read in data
>>>> + * @nbytes: the number of bytes to read
>>>> + * @errp: pointer to a NULL-initialized error object
>>>> + *
>>>> + * Read given @nbytes data from peek of channel into
>>>> + * memory region @buf.
>>>> + *
>>>> + * The function will be blocked until read size is
>>>> + * equal to requested size.
>>>> + *
>>>> + * Returns: 1 if all bytes were read, 0 if end-of-file
>>>> + *          occurs without data, or -1 on error
>>>> + */
>>>> +int qio_channel_read_peek_all(QIOChannel *ioc,
>>>> +                              void* buf,
>>>> +                              size_t nbytes,
>>>> +                              Error **errp);
>>>> +
>>>>    /**
>>>>     * qio_channel_set_blocking:
>>>>     * @ioc: the channel object
>>>> diff --git a/io/channel-socket.c b/io/channel-socket.c
>>>> index b76dca9cc1..b99f5dfda6 100644
>>>> --- a/io/channel-socket.c
>>>> +++ b/io/channel-socket.c
>>>> @@ -705,6 +705,32 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
>>>>    }
>>>>    #endif /* WIN32 */
>>>> +static ssize_t qio_channel_socket_read_peek(QIOChannel *ioc,
>>>> +                                            void *buf,
>>>> +                                            size_t nbytes,
>>>> +                                            Error **errp)
>>>> +{
>>>> +    QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
>>>> +    ssize_t bytes = 0;
>>>> +
>>>> +retry:
>>>> +    bytes = recv(sioc->fd, buf, nbytes, MSG_PEEK);
>>>> +
>>>> +    if (bytes < 0) {
>>>> +        if (errno == EINTR) {
>>>> +            goto retry;
>>>> +        }
>>>> +        if (errno == EAGAIN) {
>>>> +            return QIO_CHANNEL_ERR_BLOCK;
>>>> +        }
>>>> +
>>>> +        error_setg_errno(errp, errno,
>>>> +                         "Unable to read from peek of socket");
>>>> +        return -1;
>>>> +    }
>>>> +
>>>> +    return bytes;
>>>> +}
>>>>    #ifdef QEMU_MSG_ZEROCOPY
>>>>    static int qio_channel_socket_flush(QIOChannel *ioc,
>>>> @@ -902,6 +928,7 @@ static void qio_channel_socket_class_init(ObjectClass *klass,
>>>>        ioc_klass->io_writev = qio_channel_socket_writev;
>>>>        ioc_klass->io_readv = qio_channel_socket_readv;
>>>> +    ioc_klass->io_read_peek = qio_channel_socket_read_peek;
>>>>        ioc_klass->io_set_blocking = qio_channel_socket_set_blocking;
>>>>        ioc_klass->io_close = qio_channel_socket_close;
>>>>        ioc_klass->io_shutdown = qio_channel_socket_shutdown;
>>>> diff --git a/io/channel.c b/io/channel.c
>>>> index 0640941ac5..a2d9b96f3f 100644
>>>> --- a/io/channel.c
>>>> +++ b/io/channel.c
>>>> @@ -346,6 +346,45 @@ int qio_channel_write_all(QIOChannel *ioc,
>>>>        return qio_channel_writev_all(ioc, &iov, 1, errp);
>>>>    }
>>>> +int qio_channel_read_peek_all(QIOChannel *ioc,
>>>> +                              void* buf,
>>>> +                              size_t nbytes,
>>>> +                              Error **errp)
>>>> +{
>>>> +   QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
>>>> +   ssize_t bytes = 0;
>>>> +
>>>> +   if (!klass->io_read_peek) {
>>>> +       error_setg(errp, "Channel does not support read peek");
>>>> +       return -1;
>>>> +   }
>>> There's no io_read_peek for  QIOChannelTLS, so we'll hit this
>>> error...
>>>
>>>
>>>> diff --git a/migration/migration.c b/migration/migration.c
>>>> index 739bb683f3..f4b6f278a9 100644
>>>> --- a/migration/migration.c
>>>> +++ b/migration/migration.c
>>>> @@ -733,31 +733,40 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
>>>>    {
>>>>        MigrationIncomingState *mis = migration_incoming_get_current();
>>>>        Error *local_err = NULL;
>>>> -    bool start_migration;
>>>>        QEMUFile *f;
>>>> +    bool default_channel = true;
>>>> +    uint32_t channel_magic = 0;
>>>> +    int ret = 0;
>>>> -    if (!mis->from_src_file) {
>>>> -        /* The first connection (multifd may have multiple) */
>>>> +    if (migrate_use_multifd() && !migration_in_postcopy()) {
>>>> +        ret = qio_channel_read_peek_all(ioc, (void *)&channel_magic,
>>>> +                                        sizeof(channel_magic), &local_err);
>>>> +
>>>> +        if (ret != 1) {
>>>> +            error_propagate(errp, local_err);
>>>> +            return;
>>>> +        }
>>> ....and thus this will fail for TLS channels AFAICT.
>> Yes, thanks for quick review Daniel. You pointed this earlier too, sorry missed it, will put another check !migrate_use_tls() in V2.
> But we need this problem fixed with TLS too, so just excluding it
> isn't right. IMHO we need to modify the migration code so we can
> read the magic earlier, instead of peeking.
>
>
> With regards,
> Daniel
oh ok got it, sure will make that change instead of using message peek.


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF6D68649C
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 11:44:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNAa9-0007dy-IA; Wed, 01 Feb 2023 05:43:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1pNAa5-0007bo-F8
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 05:43:09 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1pNAa2-0005fs-PZ
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 05:43:09 -0500
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 311860ua028008; Wed, 1 Feb 2023 02:43:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=content-type :
 message-id : date : subject : from : to : cc : references : in-reply-to :
 mime-version; s=proofpoint20171006;
 bh=sqYBLci4Nrm6+aGJdkx0BYrjy+lMjyLWKXDrKBi9f9o=;
 b=RvulAGBN9yU2kr4qIUO2jAOfwITEfY2qJShkTvw2e23WqMRl3lVd3FD2BdZDzuoVigpo
 DPSVZIM2L5N9Vq4o/s8YLUJgA+RcVhb04GS8sCP09CFtuiOTYCXT7fZOuFxzLkVnmmWS
 bs/u3RFQ9TF7A5kbLeUXnNtseCfgoKlLboOvLKMXzky8qgD/kePRLkM2pMdCoKGxw0OZ
 +PCIRnHkt2F7W+/krl2Lkf2jC1fChe/u9/EnlLZn+a/VCFRAb4YOi/8JlWOQKqPINA43
 81eI9vnUm0TcXR4P2howKQm80wj+2lIYrDy/Bs1+uBQH0EgBamvinMWgOegPc48pv1yl vg== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3nfm9987mj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Feb 2023 02:43:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uo6jCjdCtk4yVrSw0qw5paItDmd/2fCptQi1WOMlSO7/KqWgMI2PS7L2bz8ESouoN4SQ7X5JZ6ocE3UfRdg5tJ4zA52sjg8fAWM3hth6g6FR/DZE/dTlIjRrm3Y3nzvHAYDp09EfgnHWE05I7yE42WrbmIq2jdPM2EekvFoEQSxnxYq+ePpXC1/18/HS+X8TPyq0WHWu4co+JqF+wNgPT7UNOhZSwtIkqoGB72tvlXXt8PTk7SsYewDCoHfiHzm+3f4tfNqDLasOy6aAhJmsD1j8g8bFTBus+AtUQ9gygod7mv4pSBXNEprtRrUqv/xB45v+q0XvTZ4VyzaU7UxfHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sqYBLci4Nrm6+aGJdkx0BYrjy+lMjyLWKXDrKBi9f9o=;
 b=fAnwJtM5sukCe1FldWBLBbLu8dx2mc1v6nOq4kXY4R62FKXy4KzJPXhtMTEZSTIK/QwzPbOju5g98AUmAvxvcuarG6FeU0RnAifJAJQxNHyYxWZpBI7BHP7XOLceQS+7OLfK8LsTp2U3O116+IldEZ8DPvjxm+RpDoRRefbaLV6I7mKeXy+IQ7rLX+QuYkwUE+H50pSfXdd49llsfNcoQ+nqrebSdNJgh4XhQrkwhlOD8a8xVll2bfCcURwOfqQQc6Y8dUk+hb5+uogr/BSabB5OSnvJEyqB9XGv7apkJJZnaB7yIdFWuOY1iUUlBP0NZiQPqWOaBASUWWrK5kRmeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sqYBLci4Nrm6+aGJdkx0BYrjy+lMjyLWKXDrKBi9f9o=;
 b=OUUS6HoJMtu3OS6Q71k2LPvfUVMBL032DquCFEjCN7r2NYOOA35CGDv+O3KUsik2GBrzSbYS4mZ3GWzUFEyarQn3uqE4J6ocr9myMpuyaCSqrlYxuTrZukPCMaUp99h4hD8E76rGTdkzkVf9622EGbkv13/qrK0xJY/8worU1dUUS2LPPiiFdgWVE+yijYXXLFxtVhRclyFh6BLt3MgUwXuqRllc2rYTP9zr5rbnSZKd12CLtddfQ9aze3Vb7sQzVN5lq7jO5NJ25w/PbafbKRxxWXTlvjZkE5ZrLRRZNXnYLbsk4rsx62kvHYohJKDfKIKgYb/L1oVa4EUUP+LHLQ==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by BL3PR02MB7860.namprd02.prod.outlook.com (2603:10b6:208:33f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25; Wed, 1 Feb
 2023 10:43:01 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66%3]) with mapi id 15.20.6064.025; Wed, 1 Feb 2023
 10:43:01 +0000
Content-Type: multipart/alternative;
 boundary="------------gr0H9NkB0aNpXuqdqp8z0lrL"
Message-ID: <9a6287af-7926-729f-5bee-3f60b526037e@nutanix.com>
Date: Wed, 1 Feb 2023 16:12:48 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: Expose support for HyperV features via QMP
From: "manish.mishra" <manish.mishra@nutanix.com>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: John Levon <john.levon@nutanix.com>, Florian Schmidt <flosch@nutanix.com>,
 carl.waldspurger@nutanix.com, Prerna Saxena <prerna.saxena@nutanix.com>,
 Aravind Retnakaran <aravind.retnakaran@nutanix.com>,
 rohit.kumar3@nutanix.com, "Daniel P . Berrange" <berrange@redhat.com>
References: <cfa1e51f-c74b-c1d1-d6ea-a25a5a5f6c4b@nutanix.com>
In-Reply-To: <cfa1e51f-c74b-c1d1-d6ea-a25a5a5f6c4b@nutanix.com>
X-ClientProxiedBy: MAXPR01CA0115.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::33) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|BL3PR02MB7860:EE_
X-MS-Office365-Filtering-Correlation-Id: 14affb15-6897-465b-e18d-08db04411737
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tH6lckVwSzwnMAaf/JET/GuJ249cMyLPavEvAFayMCM614Yh9jrnMNmO6Op5uD4YXCZEHtWYSuinrWpgQQewfgi2P0Aj+S3JJqO9TMghUeqa9xY9gxkTwalQb4Biy8fUqE9yfs6K6IvdT8z4HzGBUu4Mh9yPx/l1+qKmyRe66+8ZWB2F9n1sFKtUnISEmqzcfqAHZ0jK8crs1lZqfpLQ2zcTEW2kOQSi094pOPDkXX/OZ/0EPEM0K5FIjnKDCT8++TGGUGTq/i0z00cSLSTijW3dM5BGaBJs7vSOyUG5qnrKB64IorT9V4MIutkiRkHkNGj+ik1vMA4ANZn3HtmkqHXYgnWIqAGaGuAe9J004su1bbhdwPZNYfMOjUBJRYmPOgYXPvtgCewOUg588AARBa1Ph0O6Ym90IKv6Sne2n3zCiUkjLjr4P5/v0UBiR7Crgk8loW4qalhlQmCXeljXTihAG1Xy/Gr6P4zNzeQtUZ2ph9wtM0Q0s3x0ltnkd/uqfq9vMFLjqQiHeilpSYjvZraiN8PyJrabZcniEBxGj8SZN7wT4NLvBES6LQvDZhPiRZ1b5cthSgWnsroqLc43FrpVZxW/NUBkHMxhSUEeOeK5OfUYygwiI41gYr27H45+yO9RqmE+Ub4LUAieKxeeacktgP07Gm5r9PNLUjxLa5rHFX2qkS/pgNNHfWtdw98Tx6InpTEvaS+2j7G9L9aRCbkRRizsnEOp7QjFedXpAR0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(136003)(396003)(376002)(366004)(39860400002)(451199018)(5660300002)(31686004)(41300700001)(8936002)(66556008)(66476007)(6916009)(4326008)(66946007)(31696002)(8676002)(478600001)(6666004)(33964004)(6512007)(26005)(36756003)(53546011)(6506007)(186003)(2616005)(2906002)(38100700002)(86362001)(54906003)(316002)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2ZiZ01BTTZ2VU9XczZBRkhOemhnZGw1bWRGY3ZOaEZDbHBvbzRzZnV2aTJn?=
 =?utf-8?B?UFFRZkFQVnNKdnptUlREeDh2ZUEyQnRqVllhN25NY3NmbWxSUGhuMmUveDUx?=
 =?utf-8?B?TFBKUDIzNDJvcnVIYVJ0R1g5aDRTSUJKdE1Cd0VoeGg3eXNCR2FDVUhMNjN0?=
 =?utf-8?B?WTk4R2doR2NiclFoT0xYVThIZ1k3eVhJdkhYWnhQTDNXSjlFV2hYNkN6YkVJ?=
 =?utf-8?B?c1Z2YTlrUk5oSzNTaGorUXZCc0ZtTTZack84UlBXNFlrdTN6Um5waENaMDhm?=
 =?utf-8?B?NnlXNzlPaDRNOVJ0bkl2TVIwV3FNQzV4K1dWaGIybmE3ZmtzcHA5RkwwdlZW?=
 =?utf-8?B?WXIrZDk1YmN2SG1oUThmcnE4YU5qYklsb1NvQkdYTk9FMlRFUVpFL2Q2NytI?=
 =?utf-8?B?RS9Rc2laWmtKbW1kdVkyVG8rdTZjU3doeXlva2htVkxMNzluM1dHY3cvT0lH?=
 =?utf-8?B?bDg0MVRDa3ltT3ZhMzg2eUkxTlRuUlB6RG50RHhiZUhUUVU3MmR3TlJtRGdB?=
 =?utf-8?B?TzFrUDYrK2tlR0dMeXRFcHNiN0RVU1dhQnVQWDlmRFlDb0p4VDNjL3piY3Iw?=
 =?utf-8?B?V1pFSy9VSHVLc200clJPZ1YvZERodWppVTFvLzRVNjlxSTc5VEtDUjdzR0xK?=
 =?utf-8?B?TCtsakNUeGR2by9BVmlNUVRXZHJTcCtVSzV6OEs1d1FrSUFRSktsazNDdm1U?=
 =?utf-8?B?QVZIcVRwTDNjdFh5cVYyUDJLMVQzMVJJZi9xSUlDZjBQN3hiWDg1M0ZzR0x1?=
 =?utf-8?B?THA3TnNkVUkxUEdML3IxKzFlem5vSG1sbTFWdVZ3R3Q1c3hyODl0UFFFRmJ0?=
 =?utf-8?B?dW8yODlJU3pMaHd2MExkU1gzdEQ2T1hyWW5va3hYS1N4M3gvaTFyQ0JGM3M3?=
 =?utf-8?B?dkx0ejJkUkxOdTN6MGIrKzl0MUtuSmhsSTI4MlVvQnZuRlYrcExaRTlxbW9r?=
 =?utf-8?B?NG9UblhwNUt1b3BXeUQ4Nm56QWVpQWs1cjdtb1NLMEtUU3g3T2lteXdqd0Uz?=
 =?utf-8?B?WVBac3hQVW1sSEw0RGJsaTZjTUlnOGR5SlZ6c0NnWFVqeERuWUhJZ0Y1aXZU?=
 =?utf-8?B?STlaZFljdngrTGNqMElEM2dZL3RGTGZFTkZmUXpudFJOREdPeXl1S1NYSWZN?=
 =?utf-8?B?Uis5K0FBUTZocHhFNjlJeUhQd3JnVVBKWHYrZG5EdWN6QW0zT0k5RXdZcWlP?=
 =?utf-8?B?eWZrbXo1TXNwS09NeFc0eEVGd01USUhqUlQrQzIzZjZKSGFoV0Y2aEF1QU90?=
 =?utf-8?B?Y1gyNTdvM2Y1c1JkY04zOWtRQUVxb1F3a2NhSk1ONUhkdk55NkwvQ05aK2Yy?=
 =?utf-8?B?ejhJb3dSUXZKamRoWG1jQzFMcGk1cHNzV0EwMEJRV3JJQzRNeXNsbFQ5b0Rm?=
 =?utf-8?B?cVdrcjZHZTJnTlRXQ2J6NXgxcDlhMlArcVFkSkY0ZUQxSW9DdXI3NGF2NVJV?=
 =?utf-8?B?OThXUy9tazdYOWJ1UWpaRmdEKzRYWE5nNk9xZ3ZUMjlYSTYvOXloMWhHVkpy?=
 =?utf-8?B?aWVPLzRUSFdCT3hqd1JoN1owejErWk0yRHJ0MFRVcDRQME5qMUc0WVhrbTd1?=
 =?utf-8?B?OVJNSGFJS1hCeUNLRzVuOTA5Sjc1YWRvaGtwclpuUi84Z3lrS0dMalVyQ2c4?=
 =?utf-8?B?L1N5TzA1aDJrcnA5N21XYmtLc3cxLytGaDIxVDZyelNzUTVhMFV0Q1UrcjZW?=
 =?utf-8?B?RDk2L0Q1ODNaWmg4bWY5TWRUZ2MvTHpDQk5ndUFFWk5pTmg1bkdLQStNYWdI?=
 =?utf-8?B?TzBVajIzTDVnK3ArbXpPRzU3eHhhNGlIWlluaU5NcGRmM2lGNWMxUkFzY0ZP?=
 =?utf-8?B?bHF1YWl3aDc3OGhOQ2JyMUh6dTNmaWdURmNwMit5NjA3OVBFT05kemhwWlFO?=
 =?utf-8?B?L2RzZnh4WG14cGtnYWVvREZHeFFDcGNuU3RtNGNTZ05CRGk5anZyelBpUUhG?=
 =?utf-8?B?T0xPelY0R3ZOU2VxL3VnOUdUOVhpMXVKejQ0aFk5OW5mclZvU1lUa29yYVdX?=
 =?utf-8?B?ZjFSUVRidHlxZHhWZ2hWYWdJMHJBVzVBRkVDOU91eXJNN3cyOTlrUmcyd285?=
 =?utf-8?B?RnRVOU42UERqUTNrTFpiOE54OE1XNWo4aUMyU1JsZW9zRjVXcHRHaEtxd3dY?=
 =?utf-8?B?b0FRUFNiSGRZS3BETmZzTW5scHJxWnZtQUdTdU5FSGxqV2VHYi8rd0xxTVR1?=
 =?utf-8?B?OGc9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14affb15-6897-465b-e18d-08db04411737
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 10:43:01.5729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v4oftM6/yOA1rZlhIjL40X8Z/eKIOmKnS4MxtTi7b8cBIOqMdEr5x0bwGyrOcTcrqLXdiTNPntf+IMd6vamgdG3NTopZEjLYX/fNh1ZwXT0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB7860
X-Proofpoint-GUID: xvlSsqlz_TgNEaxl_T1zWgJ7YFA6V9GY
X-Proofpoint-ORIG-GUID: xvlSsqlz_TgNEaxl_T1zWgJ7YFA6V9GY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_04,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=manish.mishra@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-0.09, SPF_HELO_NONE=0.001,
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

--------------gr0H9NkB0aNpXuqdqp8z0lrL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 31/01/23 8:17 pm, manish.mishra wrote:
>
> Hi Everyone,
> I hope everyone is doing great. We wanted to check why we do not expose support for HyperV features in Qemu similar to what we do for normal CPU features via query-cpu-defs or cpu-model-expansion QMP commands. This support is required for live migration with HyperV features as hyperv passthrough is not an option. If users had knowledge of what features are supported by source and destination, VM can be started with an intersection of features supported by both source and destination.
> If there is no specific reason for not doing this, does it make sense to add a new QMP which expose support (internally also validating with KVM or KVM_GET_SUPPORTED_HV_CPUID ioctl) for HyperV features.
> Apologies in advance if i misunderstood something.
>
> Thanks
>
> Manish Mishra
>

Hi Everyone,

Checking if there is any feedback on this.

Thanks

Manish Mishra

--------------gr0H9NkB0aNpXuqdqp8z0lrL
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 31/01/23 8:17 pm, manish.mishra
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:cfa1e51f-c74b-c1d1-d6ea-a25a5a5f6c4b@nutanix.com">
      
      <p><font size="2">Hi Everyone,<br>
          I hope everyone is doing great. We wanted to check why we do
          not expose support for HyperV features in Qemu similar to what
          we do for normal CPU features via query-cpu-defs or
          cpu-model-expansion QMP commands. This support is required for
          live migration with HyperV features as hyperv passthrough is
          not an option. If users had knowledge of what features are
          supported by source and destination, VM can be started with an
          intersection of features supported by both source and
          destination.<br>
          If there is no specific reason for not doing this, does it
          make sense to add a new QMP which expose support (internally
          also validating with KVM or KVM_GET_SUPPORTED_HV_CPUID ioctl)
          for HyperV features.<br>
          Apologies in advance if i misunderstood something.</font></p>
      <p><font size="2">Thanks</font></p>
      <p><font size="2">Manish Mishra</font><br>
      </p>
    </blockquote>
    <p><br>
    </p>
    <p>Hi Everyone,</p>
    <p>Checking if there is any feedback on this.</p>
    <p>Thanks</p>
    <p>Manish Mishra<br>
    </p>
  </body>
</html>

--------------gr0H9NkB0aNpXuqdqp8z0lrL--


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BD24C4251
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 11:30:26 +0100 (CET)
Received: from localhost ([::1]:49838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNXrk-0007y3-SH
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 05:30:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nNX0q-0007Oz-2Z
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 04:35:44 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:17508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nNX0m-0005T3-8k
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 04:35:43 -0500
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21P7KVpi008908;
 Fri, 25 Feb 2022 01:35:38 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=AVqxu8XtnvlEY5NEmpYgo2Fr0NlqFXLXPofnyVRcrCY=;
 b=sss3olSJMhRG8+JKzMP13u9DDdz2kPc+ipUUugVmfLdGypu5PfFygEhneUEyV+eUXXQd
 +fbHiLfgqF7F4Vf9Qk+GwNduhqEl6B3PFf0DaodJG50e0FoDxyrq/iAu1VHmsjO/xQXE
 HieNheZdPVPP696rQdTttYVTX6YBG0q7O54qPGEKr//b3A1XOWPVKw/Op37J4NL7Nq7Z
 tOt8wH+EUdnbjloyGQ+j+K+bLzmIvwq/ww5Yu96BIN8f3NWj/n2cKp5slToXUdWHe4E2
 s1NXqhS95VQiOPjt3zf5USPBYbwTXvPp7X9YiM3D5OUi1QLcd37J4Q5thbNi+47NIu4d 2Q== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3eegktsnyw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Feb 2022 01:35:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BrMqX+jEBqj7KmuCq8eRYsZVqnyTOV3xVEV3DVM/+V0LbmDFRNTz/MlnlCgGaX44HbrmTGSBC3EKU82FQWzhRo1+OFLmHlEnH69h6vHDVaFh0U1BhaQh1uzz1hBknef/+3tm1PmGWfcCFwarpnxqhggyH2CSHyNHLu0fFaWevnw4KfeM/aS7Y1rP3s/0aau56IncumSKrLyNta++keHNF61AEgWp+3/AcwPT6FTj0Jb3GsntxWo5sLKVTnFB31XRuqLIiMucw/PuEmcA5BBbQ0Nv74Oj9csV9CXtDRqCQHHJLMgfQKfeZC61cgDuyAluOwVd6kpHtN1Q4G3YHWihzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AVqxu8XtnvlEY5NEmpYgo2Fr0NlqFXLXPofnyVRcrCY=;
 b=JNW/F0OVUiGiJD+ekPdMiO8A2p6uw8H4rhmBI7cI2Wq0kMr5Dcg019txa5sB7cHwQs1zQzfqAdazSPtjHXr68EaZ7kJ0vaBT3u41JHb0FxB6Gg1vBxsiHLQmdQd+P0Hl3/nXUBZamMMhh/WhEUQmKb/aHj2Zonchr9TZNm54jKvkLRivvx6of6QW+TqJiw/DszQvI0ozSr+326SF1zW1nmBCzJ6P9KGLkeGLmIL0iQJeWwZ2yzQ5Efu4mfxGs5iqVQS/qePYODxOrnAKcCeh1RVOr7JrRoFAP2t3Nu8ZUiSMPbI78fSeoRNbQEOF0xHO6lysYPVS9k8CvqsFZ/av1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by DM5PR0201MB3605.namprd02.prod.outlook.com (2603:10b6:4:7b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.26; Fri, 25 Feb
 2022 09:35:36 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::ade5:1204:b102:bfab]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::ade5:1204:b102:bfab%5]) with mapi id 15.20.5017.022; Fri, 25 Feb 2022
 09:35:35 +0000
Message-ID: <923fb142-0161-f1f2-8c18-2cae2054db80@nutanix.com>
Date: Fri, 25 Feb 2022 15:05:24 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2] Added parameter to take screenshot with screendump as
 PNG
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220224115908.102285-1-kshitij.suri@nutanix.com>
 <YhevxnLUi5BHWJ9G@redhat.com>
 <8dad1e54-1118-54c2-baea-7a8c6daee286@nutanix.com>
 <Yhic9rkSKDfg6f3P@redhat.com>
From: Kshitij Suri <kshitij.suri@nutanix.com>
In-Reply-To: <Yhic9rkSKDfg6f3P@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0113.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::29) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 825103f9-221e-4819-b474-08d9f8422cea
X-MS-TrafficTypeDiagnostic: DM5PR0201MB3605:EE_
X-Microsoft-Antispam-PRVS: <DM5PR0201MB3605684FEE63F8B9DB7FF6B0993E9@DM5PR0201MB3605.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3SR5sD7ddImkkkvoM5C5tajo3tq/sUdg5R9pHyvZtvcqZ8T5SEfLj89AyTB5DvWLVtz4dprQV3fQHLek7Oh3c4u3RnrOZU0eP3DNGFCfx5/PjbDXa9/d8KLZMPGGqLpP7EsnahfSdt5ztqwWmr4uDTaHQRHQ8QBooC+sYMumhstqOQ6HgAYEN9PJtK71SAbhMwZ2UoKbaplE3FMbVRWlR7i+D2hVNR4Yn6vw9teBSkC5n3NoNig5c/9zmvBo5iS2H+LJpePUBESwH48WTUABtOauBTHAFJNPDDzB3hwdo/Tlj7nrghLpuy80NqxgQ2Den06nXrobmqETPIkI0+vQ45Rdit3rJV2b0f2xB1ybBZVxSEnnXqaVB/ldKivvFb7oR7yxi6/FtW2H8U8Zha1JfPVgWkbZvadYAAK6/Y2zAcydz3Pgf6jWF+q8efA2w7YTruLdksm9jh0TG8JmJGJI+URJASNYVoJSKkWCtUW3bAGtx91aSooqYobuvqUaHq0MP4G5TPTp/lSgX7uBCR1lA3vpXkg/mxAm6wT/216rVUOSVElNAYxKk5ZVv7RAOclKVohmaJiVkjlNZfxDfh+Lbt/IR9q6AwYdTygZaxcKpGvXy3LJfGYYiQcSQFwEgNsmSoISZXzEMhygWzWhc+es0Iawth8nmzToHkW8nN14qlgN/O4LmlE+EC9w3kL1xIBXq51pihoPeKUihD9CJyQchpFcAbstnWdUHcelZSdCMzNOFkpwrbFZ9XL0jnAAzlps7bIzac2bMf1fXw8YgiRdv1dkINr131ehTzODubThfVBU3jGb+x6xxcunq8Avf4oX4rAXsOHTzmC/01lIRgKn9tqd7dna/0O2nbh70hBsBT4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(6512007)(5660300002)(26005)(36756003)(4326008)(2616005)(6486002)(83380400001)(66476007)(66946007)(66556008)(31686004)(186003)(6506007)(8676002)(44832011)(8936002)(316002)(6666004)(2906002)(38350700002)(38100700002)(86362001)(6916009)(52116002)(31696002)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wkw4SnQ3NmFPWGNZUlZiUVhzNTlHaFNIT0Q0ekQwMk9SVDhZSHY5NTR3V0o5?=
 =?utf-8?B?RkNCM3pmSThpV3lRRnBJcXpRcW45dmppeVFKWFBldmpLRE9aUTVvd3pnTGFp?=
 =?utf-8?B?T1RzSE8xSTczbVFIYmN1eUVkMXNleGdyeXF2YlZIQjhPV3U1VmpXMWZJcHg2?=
 =?utf-8?B?TU1rcW43alloRnRRdlAwemc2NnhLSFRsNERLWUlmNGs0Y3p0Q3ZMSGFXMWw0?=
 =?utf-8?B?R3ZFNTd3Szdhd3h1cVpPQm1tWmZlc29HNTltOTNPTGFkVGxieTUrSkpnZEtx?=
 =?utf-8?B?UDhsRXpCdVowKytUUGx3b093dmhBOXhvYXNDTFNacUYzN05ReHNnWEJxcSt0?=
 =?utf-8?B?bkRWQTVSdndXZnVRQi9uREltMVBtVHd1NDZHZlFJQ09LUWh6TUFDYjc3QUhJ?=
 =?utf-8?B?L0lHZ3hUazFqNkNCdFNBVmNCcExEdVFiYzIyVVJjZk1uN2RmL1VPMW5FVWJ0?=
 =?utf-8?B?TitKZEx1VHArd1JNRzYwc1JhbWxuY2tCVjBuZFdqTTFtdnlWSWdQM2FGaThx?=
 =?utf-8?B?V0FmaTBOcGNrWFpVZS94WmlXc1pNTFhrbVdLN2RlVTA5VGo0dlNyekw4dDdK?=
 =?utf-8?B?bUE2QlFYSXBGRmRMWlRYVlBnYk9FbnVoaXJvY0d3U09jcXZ1d3QxMk4xbk5s?=
 =?utf-8?B?MVJYUDNqOFVoa2N5M0t5RW9Qa2MzNnBsd3AxOE5sdlZpaCtXUWRvb2g5UDVk?=
 =?utf-8?B?RGhsaW8rU0twdFlndmw0cTFjL3lTRUlqdkJmR3NWNk1KeUdvaHNtdm94L2hK?=
 =?utf-8?B?UUFJcFRhcjNTS1N3dTArZGhmajA1aFQwTi9hWk8xWk81MzkzUytpa2U2V3F1?=
 =?utf-8?B?S29HQXM5RDBIMlJnSTJ6eFZON3ZRYVJjVDFKaElMeXBBenZCcFRKbDIwcHMz?=
 =?utf-8?B?QU1YcmY0bkE3UWw4UUdmVVN3NXpZNmRuVk52WVc3NlhFREs2MTRQamNBUVhZ?=
 =?utf-8?B?RHNOS1VSOXBGM3prcG5KNzRzVWY1MnQ0ZFduZWNZWVd3aHc0Nk93c3BJbFB1?=
 =?utf-8?B?MHVxbWhZTXM0c1ZrdXQ4NEhMcjZvN1lobHpEMjJOZnUxRGNrRlBEckM0L2hF?=
 =?utf-8?B?cnJXTDB3RUVsSnRXOWp6c2ZxS3p2eUZkbExXb0RTeVZCUmFITG5uQ0svdXRM?=
 =?utf-8?B?S0xocUdaZmFjMlFMWW1CWlNYR1lEWGhRNHpuT2hxcHNZRmYvZjVUNzJVK0l4?=
 =?utf-8?B?djRKd0tKUGwzZHdNcld4TGh6SndJaWg5Z1ZveVVEanZaWG1CWXhGMlVlSExM?=
 =?utf-8?B?TEhmRkdvNFNYdGdpWVM0V0VZZktMZGt0Q3lQVFp2RWlHbnp0YUdxRlB4Wlhn?=
 =?utf-8?B?Q3BSV2dRbDFNd2s3UStsOGdYUzBROGRPOUJHOEMydFFycGZXbnl6SE5meml3?=
 =?utf-8?B?RE1sTlZ3VS9qREF6MUFZeUpKODE4KzJCTFN2VVYxZVVHL0M0QUg4RW1MUTgw?=
 =?utf-8?B?b3huRjI0Q0RtaFRZeFhJL1o0RGxWNHFsMHpyQy90VXc3TnBEK3EvbnRsU3Fp?=
 =?utf-8?B?d0lJZDVWSklCZy9RZDZPR2M4RFJxV3RVQXZSWlpLM3p6WXRDT1ZCRjZudExG?=
 =?utf-8?B?QVZQQlp6UW5pSjhpVmN0NFdSQ3dlaGNyQWprUitrR0xwdzB6RHczU3ZOVmFn?=
 =?utf-8?B?WWt4OTF5VkJJL1U5ZHNyNkhTVWJraElGWXBFUThwZnU1dFI1ay9VbHZPTlpn?=
 =?utf-8?B?Yjd1TnIxbFhiNjZDOStsQ2x1RXhrZUdtOFlBbGtzbU4xTkJVbGNnYWMrMzZZ?=
 =?utf-8?B?dWhWa3JScHYzMkpianBHWHVmL2MwMWRPTUR2QS94a2g2UUVJMWwzQzJkcjlh?=
 =?utf-8?B?MlRDUGtSQmVTciszYnlabVRUSDBCWkphL3kxTHdmSC9QZ1dWaWlOT1FldUNr?=
 =?utf-8?B?ZTYrQW5jZjZGeUZKQkxOcG9FZHA2dmdqeTE5bk1OZHc5SENFQW0zSWFiejBY?=
 =?utf-8?B?d3FhVnBjdEt5S3RMb0xpQnBGSEdqUFI4eWhPVWlzN2dCdTN1c2pieUFrdnpL?=
 =?utf-8?B?TGJPSXhITkcwdUhlZFdZVHZiVEZUUmxOb05zMUlsbkRRY1NlYmVNTTNQOHli?=
 =?utf-8?B?SjJVQXdseHJEdGw0YW1aWk5odko0Vm5OOU5yNzNvK09uSFZoK1hiYklNSVJx?=
 =?utf-8?B?NVA5WTNwV1A3WlpFcnRpcTl1WDJuUDducVZXdS9ObGl3aVhMWDFlTTR4NzZa?=
 =?utf-8?B?MTBCQkpxN1Y0RWN0TnNVSC92VTlWL3I4a2tWeUJyU2dkT00zNUlueU5zZmha?=
 =?utf-8?B?RjFkdVhidldaU1pmNVV3WSt6Zkh3PT0=?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 825103f9-221e-4819-b474-08d9f8422cea
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 09:35:35.7713 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SEXTXHcZU9DH3AQBsloWwGvwGEsZOXJvrmeNXzOL7VWxx6l8SeH4DbyPuf7+/5kynAALJBK15i8qkZu03rgUxoQWUOWPMxYgMhF4JFxX0Cg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0201MB3605
X-Proofpoint-GUID: kkcNnIH8ThM8cInIy7QCnpiKaxHlJmYi
X-Proofpoint-ORIG-GUID: kkcNnIH8ThM8cInIy7QCnpiKaxHlJmYi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-25_06,2022-02-24_01,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=kshitij.suri@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: soham.ghosh@nutanix.com, thuth@redhat.com, prerna.saxena@nutanix.com,
 armbru@redhat.com, qemu-devel@nongnu.org, kraxel@redhat.com,
 prachatos.mitra@nutanix.com, eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 25/02/22 2:40 pm, Daniel P. Berrangé wrote:
> On Fri, Feb 25, 2022 at 11:26:20AM +0530, Kshitij Suri wrote:
>> On 24/02/22 9:48 pm, Daniel P. Berrangé wrote:
>>> On Thu, Feb 24, 2022 at 11:59:08AM +0000, Kshitij Suri wrote:
>>>> Currently screendump only supports PPM format, which is un-compressed and not
>>>> standard. Added a "format" parameter to qemu monitor screendump capabilites
>>>> to support PNG image capture using libpng. The param was added in QAPI schema
>>>> of screendump present in ui.json along with png_save() function which converts
>>>> pixman_image to PNG. HMP command equivalent was also modified to support the
>>>> feature.
>>>>
>>>> Example usage:
>>>> { "execute": "screendump", "arguments": { "filename": "/tmp/image", "format":"png" } }
>>>>
>>>> Resolves:https://urldefense.proofpoint.com/v2/url?u=https-3A__gitlab.com_qemu-2Dproject_qemu_-2D_issues_718&d=DwIBaQ&c=s883GpUCOChKOHiocYtGcg&r=utjv19Ej9Fb0TB7_DX0o3faQ-OAm2ypPniPyqVSoj_w&m=Hu1QTP-aSF7FeXYQcdODcxg2wW1sBEpxaD4jWHYF5kxD2Z6ihhXkxRFOkovubo-f&s=YwpDKYWnYlYBM7aE1jNrISGXxP9nKm5f9Kfotxm5rZ4&e=
>>>>
>>>> Signed-off-by: Kshitij Suri<kshitij.suri@nutanix.com>
>>>> ---
>>>> diff to v1:
>>>>     - Removed repeated alpha conversion operation.
>>>>     - Modified logic to mirror png conversion in vnc-enc-tight.c file.
>>>>     - Added a new CONFIG_PNG parameter for libpng support.
>>>>     - Changed input format to enum instead of string.
>>>>
>>>>    hmp-commands.hx    | 11 +++---
>>>>    meson.build        | 13 +++++--
>>>>    meson_options.txt  |  2 +
>>>>    monitor/hmp-cmds.c |  8 +++-
>>>>    qapi/ui.json       | 24 ++++++++++--
>>>>    ui/console.c       | 97 ++++++++++++++++++++++++++++++++++++++++++++--
>>>>    6 files changed, 139 insertions(+), 16 deletions(-)
>>>>
>>>> diff --git a/hmp-commands.hx b/hmp-commands.hx
>>>> index 70a9136ac2..e43c9954b5 100644
>>>> --- a/hmp-commands.hx
>>>> +++ b/hmp-commands.hx
>>>> @@ -244,17 +244,18 @@ ERST
>>>>        {
>>>>            .name       = "screendump",
>>>> -        .args_type  = "filename:F,device:s?,head:i?",
>>>> -        .params     = "filename [device [head]]",
>>>> -        .help       = "save screen from head 'head' of display device 'device' "
>>>> -                      "into PPM image 'filename'",
>>>> +        .args_type  = "filename:F,device:s?,head:i?,format:f?",
>>>> +        .params     = "filename [device [head]] [format]",
>>>> +        .help       = "save screen from head 'head' of display device 'device'"
>>>> +                      "in specified format 'format' as image 'filename'."
>>>> +                      "Currently only 'png' and 'ppm' formats are supported.",
>>>>            .cmd        = hmp_screendump,
>>>>            .coroutine  = true,
>>>>        },
>>>>    SRST
>>>>    ``screendump`` *filename*
>>>> -  Save screen into PPM image *filename*.
>>>> +  Save screen as an image *filename*.
>>>>    ERST
>>>>        {
>>>> diff --git a/meson.build b/meson.build
>>>> index 8df40bfac4..fd550c01ec 100644
>>>> --- a/meson.build
>>>> +++ b/meson.build
>>>> @@ -1112,13 +1112,16 @@ if gtkx11.found()
>>>>      x11 = dependency('x11', method: 'pkg-config', required: gtkx11.found(),
>>>>                       kwargs: static_kwargs)
>>>>    endif
>>>> -vnc = not_found
>>>>    png = not_found
>>>> +png = dependency('libpng', required: get_option('png'),
>>>> +                   method: 'pkg-config', kwargs: static_kwargs)
>>>> +vnc = not_found
>>>> +vnc_png = not_found
>>>>    jpeg = not_found
>>>>    sasl = not_found
>>>>    if get_option('vnc').allowed() and have_system
>>>>      vnc = declare_dependency() # dummy dependency
>>>> -  png = dependency('libpng', required: get_option('vnc_png'),
>>>> +  vnc_png = dependency('libpng', required: get_option('vnc_png'),
>>>>                       method: 'pkg-config', kwargs: static_kwargs)
>>>>      jpeg = dependency('libjpeg', required: get_option('vnc_jpeg'),
>>>>                        method: 'pkg-config', kwargs: static_kwargs)
>>>> @@ -1537,9 +1540,10 @@ config_host_data.set('CONFIG_TPM', have_tpm)
>>>>    config_host_data.set('CONFIG_USB_LIBUSB', libusb.found())
>>>>    config_host_data.set('CONFIG_VDE', vde.found())
>>>>    config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
>>>> +config_host_data.set('CONFIG_PNG', png.found())
>>>>    config_host_data.set('CONFIG_VNC', vnc.found())
>>>>    config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
>>>> -config_host_data.set('CONFIG_VNC_PNG', png.found())
>>>> +config_host_data.set('CONFIG_VNC_PNG', vnc_png.found())
>>> I think we should be removing  CONFIG_VNC_PNG entirely - the VNC
>>> code should just use  CONFIG_PNG.
>>>
>>> I'd suggest splitting ths into two patches.  The first patch
>>> updates meson.build to look for libpng unconditionally and
>>> rename to CONFIG_PNG.  The second patch introduces the PNG
>>> support for screendump.
>> Yes can remove entirely with a combination of CONFIG_VNC and CONFIG_PNG as
>> follows
>>
>> #ifdef CONFIG_VNC_PNG -> #if defined(CONFIG_VNC) && defined(CONFIG_PNG)
>>
>> But won't removing the vnc_png option cause problems in the build scripts of
>> users with the current
>> version? Instead, can we use the new png meson-option to denote PNG format
>> for VNC as well while maintaining backward compatibility? The change would
>> look like
> Configure arguments / meson options are not a stable interface
> from QEMU. We can change them at any time.
Okay thank you for the clarification! Will send an updated two patch 
series ASAP.
>
> Regards,
> Daniel
>
>
Regards,

Kshitij



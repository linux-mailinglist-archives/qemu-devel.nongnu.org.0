Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CA061864B
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 18:37:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqe99-0004XQ-0U; Thu, 03 Nov 2022 13:36:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oqe8y-0004X1-KL
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 13:36:44 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oqe8v-0004su-53
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 13:36:44 -0400
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A3CdiXN015780; Thu, 3 Nov 2022 10:36:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=uz4h9JetellUy/klL7vmkwLLEOKbkLG61/SRSf5TWtw=;
 b=Y4+J/hgnUB8USdIS+TUZiYJc4WIhGEKb4HA45O0TbHlvjyzhMa24Ijm5LC/1G7S2awsV
 bumiVQ0DuY+YrQL/IVAAr5xmGVYZ2M/DmXgTCMvGld1wNa9/PDbn1qAh9smlDjEDUg0q
 dZ6bOieW9M4Rq8uL61IA42FEj1SdWZpRyZskk3R1jZ48j9YBx0duBEtMgRGUUt42Q4vl
 t66EipKCobJbb8kCFH8dWVHVdN1jJkH6w75L1Djf+sZHiEOvUd3t965qPZoJ9HYkVxt2
 2Ca+Si0Eyw6GxoAyAi1EmM6ZtSBPNBTkQ0fEGQageolMeL+zp5IHCfVzz/apcou2E7k1 FA== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3kjpth7st7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Nov 2022 10:36:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mV4of2BEX5873DXMuQsOGtBg0ea6pGIVAPCqT+mm1hDdGpCFLKJuifkmxneDx85JPLFa/fCE8CdIBO5C5IaCgN7Sat+zs8Xw0ubVmlVA9AsL5OugaPbdg2OjeltzfQ1aPw1HZgohmS/Gs/vowVKQoBwHrjrZSMJx7YOyRYz1xH/yqIlz3/cdFb2GlVs1W6hHfBkMHpdjmMmc753gTMwQO1aggdfvfRUtaxBeZxc1wcYcSrUKHleQvMoe3mMmkfmcZLqNd0oOQSJj3kpmGrCAFWBgLPDNN/wZl/9ES55wHAsk7B0FbxqMUBNm6wzxzq5IXmkanDVJUqbtzv0ltnd8Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uz4h9JetellUy/klL7vmkwLLEOKbkLG61/SRSf5TWtw=;
 b=UJ4H3yqx2p9UXFzHPk3j9DF8/H5gnJKV8rDz8cZuL4/hYeGYIT+kkTO/L/RieX6QKPtu9YOKBd5dQ2oqef82KXDc7sCnCPJPAOG6ikfs4IReQhncgg3Hvljaaye1jNNVypVXQxiJWfQl6RGYUXuq9yBAnCMf58KI3x1qHC+a0CZ9w785HD/1YmE2iESkPt7W68yOfBnCQvwb4pFk+K9DB2kVFPBxRmKH5blybKm4gVLxv09W1+ZB6Fm5MY9tEEI+rBMTWUACkALt4ZGaplPvNKjUaB5Q4mF/HPAIhcOZPIIX4oktyd3AsGHOpvbspW3XrUhf8X8MQeCVavI4JgJ/Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uz4h9JetellUy/klL7vmkwLLEOKbkLG61/SRSf5TWtw=;
 b=3gBHs79zq0H1Z2ZJMDUHih1gKDMrm9e78smYk4NwQ+hwP+vkWLsCJqtJ5Ayr2S0N2OwP9/38NOithuPi3N2STfyxzL10rfrLO6LcwRE6JP2jTk3va+cFATCu9cEAAtsA2vw2x0Qc27RcRiNY22+QDeyIR6aYw4IAx9/G6DINIPHHaANkH8TUvAsPcy4NIka3pqbUCID+zBVoPZgAOLL4k94A+Wi1ywbR5ke4X70aOK55O6QCuW9E80TSyNuFUGqpPNO++cgN2FWaom2LeTl1mkvOWFg2NxMrvwQCIpfwvxacDwmdYi/uB5NmVWHh6nu8Rb/aOktrHl5g8vMBsaowbw==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by DS0PR02MB9023.namprd02.prod.outlook.com (2603:10b6:8:c5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Thu, 3 Nov
 2022 17:36:34 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::c63:8c2:93a6:8f82]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::c63:8c2:93a6:8f82%5]) with mapi id 15.20.5791.022; Thu, 3 Nov 2022
 17:36:34 +0000
Message-ID: <0ad51209-817e-4f7b-3f93-e0ee231aade4@nutanix.com>
Date: Thu, 3 Nov 2022 23:06:23 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH] migration: check magic value for deciding the mapping of
 channels
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, peterx@redhat.com,
 Prerna Saxena <prerna.saxena@nutanix.com>
References: <20221101143029.14246-1-manish.mishra@nutanix.com>
 <Y2EyVkdLMln7CX15@redhat.com>
 <9faf2604-f0b9-f3c3-5ac8-e4deeeebc424@nutanix.com>
 <Y2E+/WZgWXQQgdY5@redhat.com>
 <e5f69a86-f625-3cdb-4a25-065a0612548e@nutanix.com>
 <Y2OKCel2FlMQw+bI@redhat.com>
 <cf399da1-8558-06f9-2865-98abe45ddcda@nutanix.com>
 <Y2P6FMs42GLzkKl/@redhat.com>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <Y2P6FMs42GLzkKl/@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0174.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::12) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|DS0PR02MB9023:EE_
X-MS-Office365-Filtering-Correlation-Id: f5fdaa88-3ed3-4a9e-063a-08dabdc1f3a1
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pgYAoOCFuLleKbmd9Qz9cK5YUwWLjpYaNyCc4olCFkOuMWCla5rdijscr2mCHej5I6tknnojMGGYNLI717KPwlnMI7iWpoL0ATSG2x3PmXSYg9uRH76jBxurZn9nlSCSILCz7UGJfi94Yt/k9Ligf/4Hy3EXPqgkGxccdhFpWt0SjsEUhQVSvoE/kc7j3xrvzZa1Dh8gdzZjVofV7iEnCTPPJj/Rah/VZtHb1bbYc7sxatuJUjN6CkDC+5pU9/820FZOIcKuGVIDIgswQcsPPJe7f6T1Thrw6KmhsDUaX5nEP0DMPYH/sW6vFagxaATF5lEUBIh4FFjUP3ajsSad/yGE0IqRiaYEfg+PR54KQZeODwJ3VLpNc8iHNMKBeZeFhQLbwFELVZQ3OS38IvvF18XhZGSpRRMaCu3dv6Bo+kuzjURYtZUd9TYi1VXNqTEPQukkeqAu8cgnc4WI/slhtbBANzBb1quSdDljEnAWCGyFM7S+4VvVoYRi547x5FgZpTlmsQYcGMya3Y1T4Saok+I3f25K3hgYto/pSeFqgsM3TMrlMalXb6YJLvsi5qn27qVSVQYlUx/rHJxwdjez9mdSwXzLs7ozTejWOORZ3KtbhD22v/QkWoZpU46Z2adHCMdTUOOFrq9nytfXQylMT489gX7d3CYMPjNLdhZpiuhnb09g1D94XC4/sNsosP1I3WfsMxYHkjmWiA5vOuBPhVce+mL++5r7aT6DHhZr9GnTr3EeuT+MHSYhm6MDB/At+6kTZgh3J1i4dWbW8ydURxxsd/eWt6kZKwP4aCsxUmc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(366004)(396003)(376002)(346002)(136003)(451199015)(8936002)(2906002)(31686004)(38100700002)(4326008)(6916009)(316002)(6506007)(66946007)(41300700001)(26005)(186003)(6486002)(8676002)(2616005)(86362001)(31696002)(478600001)(55236004)(6512007)(53546011)(6666004)(107886003)(5660300002)(66476007)(83380400001)(66899015)(36756003)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGlsdExLRG9TZ1Iycnc0WmpSYW1lU2ZpSXFPbmRkMWF4Zy9zdXJqd2pvMmJR?=
 =?utf-8?B?NUI5bVRSclFLcEtIYWhLdzN6OHplYkUzQytNRXFtakcyKzZGRXlEOVpCRk9X?=
 =?utf-8?B?elR4OFphUnJHR3IrZXhQV1ZsWkZ5c1pRc0lYTTB6K1plaWp6ZVJxTFFMTk42?=
 =?utf-8?B?U2o1NlFuQmx1U1BnNmFZSDFEVUJGb0Y4aFJzSFJSUFZGMG5RQmNkSWpzcmsx?=
 =?utf-8?B?MFhoNkZQSEM5b1Y4SThkMmZwTzlickxnYVI5MXFOOUVSWS9UWEN4dFEyTWR0?=
 =?utf-8?B?VG9HdXlTejM0WWZlLzRkU1I2Slp5cHcwUkwrdEJjeHdOZHJCOUJQR3lkdEx6?=
 =?utf-8?B?SlFpZXI4SXVJOElDcnAxYUtzekRpOERwL1RjeTY4VkpuY05XMGdmOEE0eXpG?=
 =?utf-8?B?ZXl1VnUvdkNsazd3YUZGVjIvamNnVldQMWFrdHUxdzBIbExPTTNDWHFjOHJN?=
 =?utf-8?B?S1ZHYWVhMU1HcjBMRDBPd3o3WjZzYUpLU040NXU2bWpZenc2OGxEMi9Na1RT?=
 =?utf-8?B?bmhJeFFXR3NIMmRMYXFScUxhVUdEV0RBNXExcC93MUUzdXVGbis4WHBxWGFG?=
 =?utf-8?B?SkREcm9xYkJJWGVFZkJqbHcwUFNMb2tQclM4d3VOMHZzdWZlS2hOYm55SVBF?=
 =?utf-8?B?akczQllEa2VCRG40YjkxY24wWXY2TnRUTmw1K0J3TEJPWVgrbXhXVktVbDlJ?=
 =?utf-8?B?Z1FIWlNhSUpzZ2cwc1ViZEdvWSt6RjR3VGVPVVBybnd3MTFDeFNNb0tpazg2?=
 =?utf-8?B?eEI3SEtQenl6VlhYc1hNbTVZSTVwRG13ZDA5UEp4VlphRXlWRXZ1SFFJL2hJ?=
 =?utf-8?B?MDlRWXQ0QXhJcTFjK0tyN0paSU9TSWNOem5lZVRMcXdVdDFlbitlK1Bxbm5H?=
 =?utf-8?B?OU8yMFp6bGUrejFyUUFxRk1VVVJHeUNYeFhJakdoQzJjT1RiSGZ2VE1KVVFx?=
 =?utf-8?B?NG9DWXpXdy9DcmM5MW8yamhzVFVMUCtaY0FPdHZYZU1ZT1RmVWtUMDZKTUtZ?=
 =?utf-8?B?TkpGZDlpSytIN1ViM3ljenl4Q1BCQThGSU5Namx0Vjd0MDRPK0lRMEl1TjJS?=
 =?utf-8?B?d3VteFowRW16aXJsSDBmY3luRFdWemptUktEeEx3bk1zZDlFOEIvWGRqU09k?=
 =?utf-8?B?ck9MWkZjaGJQdE0rYW51NlBpL3o4MXhOK3F4ZjNlcURxMnBuRXlXKzBWRlRU?=
 =?utf-8?B?cVd6RU85dVhRVkdSWEpPQ29CRnR4YUFRQlhJc0RvUjNnUXRjWVJxdDNJaWo3?=
 =?utf-8?B?Y0VURWVBbDNtNzgyNVgyZnVUL1UzeWpoOVNHRWhTNGZBaEVPVEdHd0V5YUdl?=
 =?utf-8?B?REdOeks2ZFpwaTRxbk1Oa3dpcXEzMXU2bDAxR1BBSVFzM2tmbExGbStuNFRr?=
 =?utf-8?B?NEZoYUZZWnJMSTExR0JaV2prZ3JtVTV6T3c2eEtRZlMzZ3FJNXlwaldTOU9u?=
 =?utf-8?B?aHJJTWxlZTR5L1VSZ0Jka3VuT1NmK2YraTFZR1QycnFxMWVSUzc0dlNvQjBP?=
 =?utf-8?B?MjdKcmVSbTlQL2hVbENBWmJLbEJkbnBUQ0JPSW5zdGV4LzZKUCs1RHh2MEN6?=
 =?utf-8?B?K0dkQ0JmZmVKcmllTFVpb0s4QklNWWluc1pwZlRwK3BEVUJnSktZRUhNd2x3?=
 =?utf-8?B?R0pDVFB0UnFHYWw5OW1WV05walE3ZHBvd1V4QkNvczEyamlleWlSUjVpNERT?=
 =?utf-8?B?WExNMjVQY0lnWEhTUDVqcWlsdS9XTnJLL3hQVzBKVHFGRHJTTlhvdlJEOHBz?=
 =?utf-8?B?ajVHRTNOM0hzMno5SU1LSlJrdXlkZFFNWHBDdzN3MGNWL0IzSnltb1FWSmdZ?=
 =?utf-8?B?Qno3MjRRQVNTVndZMFBKVmhkSDd6MndHQzBoRlN6OXZnSVVRaVMrdTJCS0h1?=
 =?utf-8?B?eUUvZXZRL2o0bVJYMU5TUm1xeHUyV3JPY1JWY0hBOGtXMXgwWi95ZHFDZzJq?=
 =?utf-8?B?QTl5NXRyTk1pNGlYZFd3cE9abEZUR1V6MTBOZVFleEJORkRNQS9jNm1LQS9G?=
 =?utf-8?B?YkppVDR6K09yWi9qZWdCMjlYTnBSYnZGQjA3cXhINFY2OGsxNE1Mam5tWVJm?=
 =?utf-8?B?U3MyR20vYVR1ZzZReThBK1VNQlh1RzFiVTUrRm90RFRVYWduaVJZZVlJUkFt?=
 =?utf-8?B?TzdPN0NmMjFxdXdPaW9jdFFyRVNmbHJIVGNkdUY1YjVxdUwrNi9ZWFZQTitz?=
 =?utf-8?B?dlE9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5fdaa88-3ed3-4a9e-063a-08dabdc1f3a1
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 17:36:34.3849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YGgdVNkGaAoUbXbnM2ooWJAg7KFSb1rznnBe61d6XRfRfS8N0ODEmGP9SWpaBa/6lpuVe5t2DXMcF/qqXE4OeSrVPLs4LmXecXDGyVsC7/4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR02MB9023
X-Proofpoint-ORIG-GUID: YCoNnBUgVDCirp3BEcneztCd7dO_n6pK
X-Proofpoint-GUID: YCoNnBUgVDCirp3BEcneztCd7dO_n6pK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-03_04,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=manish.mishra@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
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


On 03/11/22 10:57 pm, Daniel P. Berrangé wrote:
> On Thu, Nov 03, 2022 at 10:04:54PM +0530, manish.mishra wrote:
>> On 03/11/22 2:59 pm, Daniel P. Berrangé wrote:
>>> On Thu, Nov 03, 2022 at 02:50:25PM +0530, manish.mishra wrote:
>>>> On 01/11/22 9:15 pm, Daniel P. Berrangé wrote:
>>>>> On Tue, Nov 01, 2022 at 09:10:14PM +0530, manish.mishra wrote:
>>>>>> On 01/11/22 8:21 pm, Daniel P. Berrangé wrote:
>>>>>>> On Tue, Nov 01, 2022 at 02:30:29PM +0000, manish.mishra wrote:
>>>>>>>> diff --git a/migration/migration.c b/migration/migration.c
>>>>>>>> index 739bb683f3..f4b6f278a9 100644
>>>>>>>> --- a/migration/migration.c
>>>>>>>> +++ b/migration/migration.c
>>>>>>>> @@ -733,31 +733,40 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
>>>>>>>>      {
>>>>>>>>          MigrationIncomingState *mis = migration_incoming_get_current();
>>>>>>>>          Error *local_err = NULL;
>>>>>>>> -    bool start_migration;
>>>>>>>>          QEMUFile *f;
>>>>>>>> +    bool default_channel = true;
>>>>>>>> +    uint32_t channel_magic = 0;
>>>>>>>> +    int ret = 0;
>>>>>>>> -    if (!mis->from_src_file) {
>>>>>>>> -        /* The first connection (multifd may have multiple) */
>>>>>>>> +    if (migrate_use_multifd() && !migration_in_postcopy()) {
>>>>>>>> +        ret = qio_channel_read_peek_all(ioc, (void *)&channel_magic,
>>>>>>>> +                                        sizeof(channel_magic), &local_err);
>>>>>>>> +
>>>>>>>> +        if (ret != 1) {
>>>>>>>> +            error_propagate(errp, local_err);
>>>>>>>> +            return;
>>>>>>>> +        }
>>>>>>> ....and thus this will fail for TLS channels AFAICT.
>>>>>> Yes, thanks for quick review Daniel. You pointed this earlier too, sorry missed it, will put another check !migrate_use_tls() in V2.
>>>>> But we need this problem fixed with TLS too, so just excluding it
>>>>> isn't right. IMHO we need to modify the migration code so we can
>>>>> read the magic earlier, instead of peeking.
>>>>>
>>>>>
>>>>> With regards,
>>>>> Daniel
>>>> Hi Daniel, I was trying tls migrations. What i see is that tls session
>>>> creation does handshake. So if we read ahead in ioc_process_incoming
>>>> for default channel. Because client sends magic only after multiFD
>>>> channels are setup, which too requires tls handshake.
>>> By the time we get to migrate_ioc_process_incoming, the TLS handshake
>>> has already been performed.
>>>
>>> migration_channel_process_incoming
>>>       -> migration_ioc_process_incoming
>>>
>>> vs
>>>
>>> migration_channel_process_incoming
>>>       -> migration_tls_channel_process_incoming
>>>           -> migration_tls_incoming_handshake
>>> 	     -> migration_channel_process_incoming
>>> 	         ->  migration_ioc_process_incoming
>>>
>> Yes sorry i thought we block on source side till handshake is done but that is not true. I checked then why that deadlock is happening. So this where the dealock is happening.
>>
>> static int ram_save_setup(QEMUFile *f, void *opaque) {
>> +
>> +
>>      ram_control_before_iterate(f, RAM_CONTROL_SETUP);
>>      ram_control_after_iterate(f, RAM_CONTROL_SETUP);
>>
>>      ret =  multifd_send_sync_main(f);
>>      if (ret < 0) {
>>          return ret;
>>      }
>>
>>      qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
>>      qemu_fflush(f);
>>
>>      return 0;
>> }
>>
>> Now if we block in migration_ioc_process_incoming for reading magic
>> value from channel, which is actually sent by client when this
>> qemu_fflush is done. Before this qemu_fflush we wait for
>> multifd_send_sync_main which actually requires that tls handshake is
>> done for multiFD channels as it blocks on sem_sync which posted by
>> multifd_send_thread which is called after handshake||. But then on
>> destination side we are blocked in migration_ioc_process_incoming()
>> waiting to read something from default channel hence handshake for
>> multiFD channels can not happen. This to me looks unresolvable
>> whatever way we try to manipulate stream until we do some changes
>> on source side.
> The TLS handshake is already complete when migration_ioc_process_incoming
> is blocking on read.
>
> Regardless of which channel we're talking about, thue TLS handshake is
> always performed & finished before we try to either send or recv any
> data.
>
> With regards,
> Daniel

Yes Daniel, agree on that, in this case tls handshake is done for default channel so we went in migration_ioc_process_incoming for default channel. But if we try to read some data there, it does not get because data on default channel is not yet flushed by source.  From source side data in flushed in above function i pointed. Which blocks for multiFD channels to be setup with handshake, before flushing data. I mean data is sent only when buffer is full or explicitly flushed, till then it is just in buffer. But multiFD handshake can not complete until we return from migration_ioc_process_incoming for default channel which infintely waits because nothing is sent yet on channel.

Thanks

Manish Mishra



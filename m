Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF27F34AB8C
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 16:31:02 +0100 (CET)
Received: from localhost ([::1]:56006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPoQP-0003LK-6p
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 11:31:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPoPD-0002nR-9X
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 11:29:47 -0400
Received: from mail-eopbgr10115.outbound.protection.outlook.com
 ([40.107.1.115]:18082 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPoPA-0006R1-4o
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 11:29:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KFOGX3/Bz9CbotDIo5TMIhkW4pBtqCn85yepkYDE5z23bq5zE74jcWzhHOLMLsPk9aBZHfLcMB/oPOPJHGpmT5rQWZF/KAmVQua2inJ/arRJDlLn9SPRf3jqli8dm/a/0RSej6szwRRy2NoGgDfizGCf3JSW092+7IvXBGVszs3L3ukyPWEhoi/+G0qpwuyUIBwpJIhXvK6mDjBTheDHop3rzyAp0JurG4C/qIPXxTb1ZBwjbhhI5Qs7Vu5uB8PPzNmbkKhDpCeubbADkhKbmo/iTJFBKPGoyA0zkAM5r+3y+ibsXcLmvYru3Cnbepyu/bd4BfRZP+eT++L0Qg2GnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BcRLstQitwWqEXziBrPME3QjCFazxHWk3QDUjw+zKyw=;
 b=lVUx9PtWXYLbCIt0BY5HKAuf8cFbwYvmmF7KI1ruEU59xZMf/FQfRUOtyKWLPrlCYuZ+3ASWN7lRwvdfgVQBLGJ5sA9/DkHgbc1w54ckylQ+M0PXLFiGKRYRg096EhJCWIYG/DRiY7mppdu8mfNkekpZ5NgbDzyL4GycxXjnQQd0eN+peACwhzmQirG0iJ0c7RGHZ2fJfTy5yFnqWh6uf0jz3kKbM1derwzDIUaQzsfFlhwLyC3ZNL1jmzOrGiOG3xQkNDMYqODLLqaIf/N5ZQGMtKhzYh0IEBGI/mUkAwcWzId4+BYc/NleXb6I5xkBOmVOnuW2qApN4aSIL1o6dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BcRLstQitwWqEXziBrPME3QjCFazxHWk3QDUjw+zKyw=;
 b=AEUB4E+2yb+GtfnWsE8P563QWTURNi0wriOoAL9KqsiNO2rH3z34QGrXjUHhQYayn6pacIUABEyakpgBx8Xykxl5o4W6eKiT6NlrlumC/gKVoH8cnZqXEbntBXVLq/TSkDFDk5w+/BgREUeoFWZD7jJu7KVo5l/23o4vEqvKFvA=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5446.eurprd08.prod.outlook.com (2603:10a6:20b:107::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Fri, 26 Mar
 2021 15:29:39 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%6]) with mapi id 15.20.3977.029; Fri, 26 Mar 2021
 15:29:39 +0000
Subject: Re: [PATCH v2] qapi: introduce 'query-cpu-model-cpuid' action
To: Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Denis Lunev <den@openvz.org>
References: <20210325165705.2342-1-valeriy.vdovin@virtuozzo.com>
 <c990804e-3180-5575-3a30-06fa6d3e7630@virtuozzo.com>
 <20210326151808.GC97643@dhcp-172-16-24-191.sw.ru>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <8f71d585-fc25-0301-620a-20c4e621d009@virtuozzo.com>
Date: Fri, 26 Mar 2021 18:29:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210326151808.GC97643@dhcp-172-16-24-191.sw.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0P190CA0019.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::29) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM0P190CA0019.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Fri, 26 Mar 2021 15:29:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dddb3c17-2b90-415c-2718-08d8f06bf85e
X-MS-TrafficTypeDiagnostic: AM7PR08MB5446:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5446011CBD92F5180DE092DAC1619@AM7PR08MB5446.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wxePqwsStSa3LRw9/AoT/f0+Kbmgyl8EFI+yEbohEvYcdRcxXTNvL6oOO2BAaZJpkaRgFy2i9vpEuz6RgWobb/x8tZBe+uXvRw27Jfs6UMR2sL0Svtd2b2aeBZBclgZnP2SL4R575RwG90GMJCUcXzSsFBOu5sE6OGb7obyI93BBVwx8oKHuFNxToGroQaww0KsGvTFUUwh2xCE13wYHoi/VCIWjlRT+xButAC+YLVYdvCUOEyVQo5Fz0u0cl77ChG3K5DO8q97xjCoVUsO8gR/e2ubMaHgntxQ/l+GQ6rMM1HYCXjfy9we53lTa2UtIRnDEF4KSUwOMyDy3XZ9ixE5Lgfn2lRdedzrZiykuwIsYLN6p7ZXPORE8XZN0kcrL8G/2MIBO7vIxm6og3AZVgUMDKfnjujXyLKgZshXKvuT+JrIFZvxHby270Jr0F8YXHLIiiYUrTe8gklCsef6HK8ZefAuGSEO+lracN/PaPVwKuREKdHGTX+7iwOCi4+wXrsQ/OqLS6QcEcLbIEViVcjjbgAiOWLcHtjkYyGa1oq+qKS4Nx7LRmwWHNI2jzxbYIcL4ooqt3FS49KoBdmKUiesQ4ML9nHw+GO15T016kl/FgxnYKzFkq//EuoDbY6bz/L+GVpjgHjbwf4aveVc3S06hrkGLJMQTY51kjIMnnUeClCFPykO1ua47orD//AFvd+vRiZAUTmRNB2kuiP9+0w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39840400004)(376002)(346002)(366004)(31686004)(6486002)(2906002)(478600001)(31696002)(16526019)(186003)(26005)(8936002)(8676002)(107886003)(6862004)(956004)(66476007)(66946007)(66556008)(52116002)(86362001)(83380400001)(37006003)(4744005)(54906003)(16576012)(316002)(6636002)(2616005)(38100700001)(5660300002)(4326008)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VXlnYkgyOC9nMW5TQzduOHAwUXBvWmlDWGt3NitBMFZBcVNuUDlSVXNTbTQ5?=
 =?utf-8?B?dlUxTGUzbGZmQ2k4MzY4ZlhwVjJGaE1uRlJUYzdBTWw0NnY3NVp4RnJLeGNE?=
 =?utf-8?B?TW9DZ01xanJYZW9hWUpDZzVBdDF4T1IrMW8ybU1XN1VvSkVicGNwcXp0WVFG?=
 =?utf-8?B?YzZyKzhBV1IyZ2JlMktMSENKZWVMdDN5Qm41cERIQVNLbTJ6elRHeURZS0F6?=
 =?utf-8?B?eEViK3VFM2FJU1g3bzhhZmVFU1hwbkFJRGc0aTNqejF1VmZrYlhYaGlrVC9F?=
 =?utf-8?B?MnlWR3lISkpnVjRTMU9aLyt4RnRkbG0zOVJNMlVJdWJ2VVZYM2E4Y1R2Qkxj?=
 =?utf-8?B?K0pVaHN0SWM0bi9FbnRURWxRNFBZZWVrYVNaVzhVdGgwUVNaS0U0V1oyNXNW?=
 =?utf-8?B?SHFKRXFwTHFsbXJYcWxLdFJwU3gwR2hvaFgwZGVhVFpzam9wRmxwbGlzZm52?=
 =?utf-8?B?ZEpXRFRQVXRTMlJQdC9CRS9KRWZkeUNjcGhZdjNMS3NOYXYwZUlpRitvMHBG?=
 =?utf-8?B?azhJeG1YZ0lTWHA0emFTOElpMFJXUTFXRFFrSlFXdThLK1paTnppRGJyaCtz?=
 =?utf-8?B?UkNHL2xTUmhwZWpKRnZLZEJJVThwSHhtbTRRb0xXR0ZuY0xGay9UdjFscGMr?=
 =?utf-8?B?cG55Vi81Ymg5OFFjcVNzdFZjaVk3K01rSCs2YzFZT2ljQXpwUmhFanorNmNs?=
 =?utf-8?B?ak0zK1N6UEQzc2IzcHJCL1dHQTBDL0NScDMwZzY0aldCOVJvZHdIMlluSU05?=
 =?utf-8?B?ZkpGT3BmQmVBRlVYMTRzZnhGRmNmQmg1dWl0NFpqZFZMT3g2VFdQb08zQzFM?=
 =?utf-8?B?YTNheWRxSlk3VXhEcE9OQ2FzbUZUMzd4am92emMzdkMwWXNxZFlsMURJSktS?=
 =?utf-8?B?dGNlbmo5YmRHeUFFN2tHa0RtTFlBOUFwOU5iTlEreS9VaEc4WFZFTzQyK2dz?=
 =?utf-8?B?VFp0OGJvWVp1Umd6TkJoM1oyemVIM3ZMM0RyNlBJcCtxd2J6dHlFN2gvKzB0?=
 =?utf-8?B?QW5iOWJkcnJoblVQdkw4NXY1c3ZmRUtWbGJ1eEtsOXFNYnFkNnM4V1Z0dFJG?=
 =?utf-8?B?TkorRVdTaFV2UXF2VldxOHlZeXA2b3U1cjNxNHA4Zjc0bXIvUmxSaVd0TXNK?=
 =?utf-8?B?Q252cHhWWTh6WEZlUWgzRm1adDhNcVpxWWFyVEpzMG1Mbm1KRFVOWWhCYysz?=
 =?utf-8?B?OHZBUDNtaVlvRVlkU2ZnbmkwTXNPOHBIMnhFSlFmVCt2NmJuS2J4dk1lUktu?=
 =?utf-8?B?ZHRCckpGQmt4U2FMVy90UjVSeDZSME9oNFpkSWpnOUNlU3YvYjNzcFQvNUx5?=
 =?utf-8?B?TG43bEwrWWFUdHhLSkVCcVNienR4eGFrRnhSY08xekxhM2FHeGg1RTBOT3hW?=
 =?utf-8?B?WVNqSUY3ckwwbUhtMC9TaGtvVGlWYlBvR1k4SUNKSlJyNEFyMU1kamNFRWNZ?=
 =?utf-8?B?MzFiR3NLUFo5UmZEaXZKd0F6dmYyRFVwc1AyN09KRzdZMWZlM1FTU20rSWFl?=
 =?utf-8?B?cGdOcUkrdy9XVlFtdzFpNjV5VWx1Z3BXSE9hYTZOV05VdmIxWEdGdExaQlFN?=
 =?utf-8?B?dXZMZFREcmJiS21QUmNOSnBMRFA4UjlRUms2S3diMFhtbUZ0V3J4SU5ieGhT?=
 =?utf-8?B?L2ZMVHNOQm1BVWYwZVhDOGh1eS9FTzBwemc0NXdnN1VsVHdFVURKMmZPTDBK?=
 =?utf-8?B?MzBpV2NiT2dNay8xWno3SUR0ai95Y295L3dTS0JaR3J5RzBEcTBhdFErN2Vy?=
 =?utf-8?Q?J2PX5IXwjhbPqcxzn38w6GH/WHuhzjKP+vH1XWx?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dddb3c17-2b90-415c-2718-08d8f06bf85e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 15:29:39.3196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qdc3DjZPTzYrrlGLTVnru8FDoWgvc/uwVXV941OYvFIKyuC6mokPsfuVAHo7zBPrtWQD0NS1kgMDK95YMdwYx2+aY+/pJXsZdZQtC3H6LUA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5446
Received-SPF: pass client-ip=40.107.1.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

26.03.2021 18:18, Valeriy Vdovin wrote:
>> Also, we have implementation of qmp_query_cpu_* commands in different architectures.. Probably we'll need add some stubs for the new command as well.
>>
> Currently I do not have a clear idea of how we could do this, because cpuid is very specific to x86. Other cpu architectures also have cpu
> identification means that could be close to x86 cpuid, but not as close to easily generalize this method. But I'm willing to hear out a
> good advice on this topic.
> 

I mean, that I'm afraid, that after your patch QEMU will not compile for other architectures, as it will say "no such qmp_query_model_cpuid function". Probably I'm wrong. If I'm right, we'll need a stub implementation for other architectures, like

qmp_query_model_cpuid(Error **errp)
{
   error_setg(errp, "Not implemented");
}


-- 
Best regards,
Vladimir


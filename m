Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C273003F8
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 14:18:41 +0100 (CET)
Received: from localhost ([::1]:55000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2wKm-0006KY-2z
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 08:18:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2wJD-0005bx-Ho; Fri, 22 Jan 2021 08:17:03 -0500
Received: from mail-eopbgr60112.outbound.protection.outlook.com
 ([40.107.6.112]:48866 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2wJ9-0007bD-QM; Fri, 22 Jan 2021 08:17:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l6eNBKaBmlprFmiwcw1kpEc2PFq2afDBViIASE2JjaqtGljUFnQzHEVOT8wpWJoPfPaqVckSCHqjdjGgzrqVyfLsfB4UvbtX+IpaDnRJ3ZJ7ZL/WNPX0yxsltCnjaaCutjywdwGA8gfZ09BXkI/htZGL0CamEqqk00MMdv8424iXavh5vX5BCA22x7Y0wcShoF4Q3olSWHBSxZxQ4ta2PwDKR01LT1TNHBEiPubO9Yul18/RBCRd6y/2z98ZoEFT8IqLS3YWC+7EHIDKM7nZ+YIkK+b8CjYzfHwH0OFuaPjqons5sFDehipSixaaRpdh8AK9ZxrlO2IK2MHFXoB+ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOOS8g2f9YUfyEuXzW45DembUGU2+blVQPAX51x6Jx4=;
 b=VLtqRiyH/HlNDCsx85tuxF/2SeQ5+vv4yAZufe4/P7wrZK8L1YTe/X6Q9t5cQFcjWCfQihbZNSGLpgr6+cZDY5UZNWVlWSAnM0tXUkn8nSVV+YCN/LiHKqxA/dYkkUHvI84Bx5xsPoKDfO2mQQPsHUAXLidGyDkhLV1sGtg5yMt3pbyITqqOtVWWDCXEwFrRrtIb8+x8n1Qgvca2nqMCt9dazYNHghILvV3Tc9VKVXGzBM2khuFJdFUgrLVImt22hpdV0qPS/tWgjRzw7NRm+MgBrraDMjVEKudy76eDjb76Emzt4M+dKjkDtIVC6YDWI9f35L7Cv8k1swC7c+jMuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOOS8g2f9YUfyEuXzW45DembUGU2+blVQPAX51x6Jx4=;
 b=kFtYkCTG1ANKvv3PKe5MS3m72QMuLy/alc5MsRWKgMjWcV7uhQzRQEV16TxDK8/Am12j3jJu31Fh04G2tl/I4jPHgHE1xrb2LyndK3AdfwUnw3OGgGZq28iiV3AKTnSHqo0IO5kCmbHDW1CJO3TXHPXBET8NWj6BMUTcj0xAuh0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VE1PR08MB4703.eurprd08.prod.outlook.com (2603:10a6:802:b1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Fri, 22 Jan
 2021 13:16:48 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::44c9:5ac7:5302:7179]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::44c9:5ac7:5302:7179%5]) with mapi id 15.20.3784.013; Fri, 22 Jan 2021
 13:16:48 +0000
Subject: Re: [PATCH v7 07/11] iotests: add findtests.py
To: Kevin Wolf <kwolf@redhat.com>
References: <20210116134424.82867-1-vsementsov@virtuozzo.com>
 <20210116134424.82867-8-vsementsov@virtuozzo.com>
 <20210122114815.GC15866@merkur.fritz.box>
 <bc7e60f2-11b2-255d-2d69-cbd1563a0e19@virtuozzo.com>
 <20210122124541.GE15866@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <f2db3922-6832-25a5-7bb9-ac24dbb32286@virtuozzo.com>
Date: Fri, 22 Jan 2021 16:16:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210122124541.GE15866@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.101]
X-ClientProxiedBy: AM4PR05CA0016.eurprd05.prod.outlook.com (2603:10a6:205::29)
 To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.101) by
 AM4PR05CA0016.eurprd05.prod.outlook.com (2603:10a6:205::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.12 via Frontend Transport; Fri, 22 Jan 2021 13:16:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78f99213-5626-415f-2769-08d8bed7f92a
X-MS-TrafficTypeDiagnostic: VE1PR08MB4703:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB4703A973B963771908F5A665C1A00@VE1PR08MB4703.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hg2cos9ppnartWyjMYiJiSGfwj8Zwxco9Pmi7TjYgsKay7gWWxWYsswV2705j4zauYnJF7SShfGmq1AY7ZxeNaPHhkNTc00WxSgD/Nl8++DvjUExkJMNmU3l5Q2w09HS7MY+vISYZPUq1Ig4F+JAD7YLLIsXC/ayQFfnou2zRFbfI0rouXyD5tWSDkUq5PIoeijJ27vhSX1Zy3D205k6dMqm2krs5vgoV/J71tgU05sxKYYrkEN6vyM4a2oUfWjoC7aJnLbcxIBqYSK68rcQHVFS9/WVZUsLUh45Q69I+JrC720Ffcbd5UEzHP9gVczvZvbqfrQq4juEhv/w/bN9KGvUig8fszwDqf+YS7ukovqfeT4geSiXqG6RBX1+Nj7GnERN8FHy24KPAPfTbqY97O9xjxS+qFNzOdMAqWvJ/LoYzEunpvUoeZwff4WikpEOtIZf/vuLfVk3P9fOfhcG6h1t0u54z83VxMA/zPl5XFs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(136003)(396003)(376002)(366004)(346002)(8676002)(478600001)(186003)(6666004)(66946007)(31696002)(316002)(16526019)(956004)(6486002)(86362001)(36756003)(2906002)(66476007)(16576012)(4326008)(66556008)(52116002)(5660300002)(83380400001)(26005)(2616005)(6916009)(8936002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?S21SNTBxdWJIWjlkRGtxd1N6cUFBUGd2ZnoxdWRUMnlVRXRCUW9QMGJINHdD?=
 =?utf-8?B?NzJHb0tOK0hPdkdyVUF4ODE3VWw1M2JHaFc0WVdScCtDMFNsYklWTnM0OGZJ?=
 =?utf-8?B?MVJkT2RQd2M3SlVNTzNlRmhjSkpLWDIvMGtWZVlFNFhjUXZZOEI4N3ZtU0c3?=
 =?utf-8?B?SSs1WThpZ0k1aDRVSVdQSlE0cldRVlQwN1laVC95a25LazF3eFNFUnBkWGFm?=
 =?utf-8?B?VXpFTnRIZXBKYURTZzdVb3ltMmtBNWlDR3N6bVNpRmxvT3ZwWmVzMGpZd2ZS?=
 =?utf-8?B?alRtWmMxd2cyckpMbWlML0FzNHZla09qdWlGTnZCZkcvOTdmb2duYWxFUkVN?=
 =?utf-8?B?am5VbmxxZTYxUVFRSVBwOW4ybUFDSmZ0VHA5ZnljVjMvTGJXUnJnd2RjS3Zh?=
 =?utf-8?B?U01KUE5yaWM5bEtpUHBXVXkzekRZZEd4VDlOYVFjaXlKSHo0WTN2ZllpQVRo?=
 =?utf-8?B?d1hxckE1YkE1a2NTa3JqUkJMNHVVL1VuRjBqTEV2UmRDUXloZTU2VFYyb1d1?=
 =?utf-8?B?MytWaEp5VmRCUnlTUVdlVjZLdzZvOHArczBqNWxWU0lVTTY5Z2RhejFsaEcw?=
 =?utf-8?B?SzJ3OVBLbXlXem9JTnNhQmtRcVRRdjNXNTRmQTZ5Z2REOUh2Yk04K0gyWktz?=
 =?utf-8?B?RWtRckpjN0NFM1U3U3lqUHc2VEhiK0ZhMTI2eEVrQk84dXVJODRhclBZc3Fx?=
 =?utf-8?B?SlBNT0RjaElWdzJQTEt5Y2lrNkkrNU9DajZ5RXJNQnkwcmlzN21oZzEzaUYv?=
 =?utf-8?B?Q0JoUGkyalZGa2NuSWxkTHZ0MHVrVXhWY2NNbVAwTjhLL3FRNXVsTEQwMFhL?=
 =?utf-8?B?L0ZkL1FWNVNuYTIxeEpQTGtyUGFBOGh2TkRCTWtmY0RXaVZvL0xVMVlzSzVF?=
 =?utf-8?B?dFFaWlE3aE5tU2dDdjl4citQN2UxUkJEb0pYVFpBVzczaEFCcHBJYjNweEJQ?=
 =?utf-8?B?Qk1CWFhRNmEvYkt4R2swUk9GS3E4RGQzZUc3QS9yVEN2eVNjZ0FVVDFvcHVi?=
 =?utf-8?B?Q0RnNGZlVWw5V2tZamZSVEJrNWplODBqMGlQbWNNYVVjUHVLR09LQWFzMkNw?=
 =?utf-8?B?WGVEOHR0UkdWMW5zSlpJTWVlQUdHUTdWRXZReFdDRS9PYVpUMitjL0lCc29t?=
 =?utf-8?B?VitGekxDSy80Z3pMQ05jQWw3WnJEZ1hFcThnUklzK29qaXZIWDJzd283V2Zi?=
 =?utf-8?B?V3F5VWVJSEM2VXhlSEtlZDNjMXA1QmxiMGdldVpxbG8zZXdsdUViUlJ3S3pk?=
 =?utf-8?B?Zjl0Y0JnOGVNa1l2LzhuNnczZmFkSjJIdCt0TkV3QTc2M3Z6Z2lEZnlxcjRH?=
 =?utf-8?B?MFVpcmFXN1lTZ1NQTDZVcmE0aTF3WXRKL3BXK1psTTMyM3d4L3NYcDlOTy9R?=
 =?utf-8?B?Ri90cTM3L2NqN2JtVEM4RnNXS0FxK0FzdGtSN08vSHducWNKRlk5YmpoOS9B?=
 =?utf-8?B?WTdqR2U0aFJwN1U0UXpLdUV1RTNmVTNXVkNHUWd3PT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78f99213-5626-415f-2769-08d8bed7f92a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 13:16:48.4482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GCSXCY7nwGiyYrZg9o7XVJeXsbF568jUjOu1sB3ujAOIG6LLbsVGS8hEYhICSlZL7FvgawlrTrf1OnaxsT6viIFnag6UNp1Zk9o8r600CXI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4703
Received-SPF: pass client-ip=40.107.6.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.221, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

22.01.2021 15:45, Kevin Wolf wrote:
> Am 22.01.2021 um 12:57 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> 22.01.2021 14:48, Kevin Wolf wrote:
>>> Am 16.01.2021 um 14:44 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>> +    def add_group_file(self, fname: str) -> None:
>>>> +        with open(fname) as f:
>>>> +            for line in f:
>>>> +                line = line.strip()
>>>> +
>>>> +                if (not line) or line[0] == '#':
>>>> +                    continue
>>>> +
>>>> +                words = line.split()
>>>> +                test_file = self.parse_test_name(words[0])
>>>> +                groups = words[1:]
>>>
>>> The previous version still had this:
>>>
>>> +                if test_file not in self.all_tests:
>>> +                    print(f'Warning: {fname}: "{test_file}" test is not found.'
>>> +                          ' Skip.')
>>> +                    continue
>>>
>>> Why did you remove it? I found this useful when I had a wrong test name
>>> in my group.local. Now it's silently ignored.
>>
>>
>> Because now we use parse_test_name which will raise ValueError, so we
>> will not go to this if anyway.
>>
>> So, wrong name will not be silently ignored, check will fail, and
>> you'll have to fix group file.. It is suitable?
> 
> It doesn't, though.
> 
> Oh, wait... Is it possible that you lost support for group.local
> altogether? grep for "group.local" comes up empty, and add_group_file()
> is only defined, but never called.
> 
> So the reason for the behaviour seems to be that it doesn't even try to
> parse the group file.
> 

Ooops, you are right :( I've dropped an extra layer of indirection to make things simpler and group.local was lost. It's the reason to send v8, I'll do it now.

In a mean time, reverting 06 for now is OK for me.



-- 
Best regards,
Vladimir


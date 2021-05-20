Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AB238B77A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 21:24:36 +0200 (CEST)
Received: from localhost ([::1]:42066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljoHb-0007bU-Oe
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 15:24:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljoGH-0006jH-96; Thu, 20 May 2021 15:23:13 -0400
Received: from mail-eopbgr50104.outbound.protection.outlook.com
 ([40.107.5.104]:6332 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljoGE-0000A6-Gi; Thu, 20 May 2021 15:23:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ln5KP964UdCFF/R9uSMkZykn9ke5Usns3TaCgQB/HOpmPzHozDqPxM8zIYVIaBxgIXWpxO0LUwFEOSAXw+dS8OIfhuUN99mcDlJp/0YzgNYpnIFVWomPrJbULqjEU9nzblSKrjQ8MD8aAnokexlnICfO7cpiJj4vE9VEatw/8v1IPX2KpHvwDq53lCFXrcSZIv/YCuJasR9QMBGaeKaf4G1izv5qD9v6qbaExsmeuFcDHUZjD2FbGC9BCkDPRiJAaSWitigyvTbUyAfsfRd+BP4f7edjMOjEJ0sBAgYTuksNOVVjinW6ydVvqBDUgnyPsBiDWUDnPsSpSCpFxAdOiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZTImjyhKa85yaRGxT8o8RAU3EhiiiZCMoCOSFh2Ljnk=;
 b=e318qXhf8EZO0GZPd5Q/ZybrKttYY9jkmGDcdNPR6+mCzre9s7nqCXRliO6eWJeiFOR1QeV0JDFqgLUGXjQ0vEt2Ymolhklj74W1VfP10MyPu9BQ1Q0Es9JomKxPC4e+Q7ZJ6sc/rGwohwSGGLJ4fm+DA3MOtig+442iVLPd/5Ih9rq9Z9O2nl0Kt0d1tCKzTzzjc7NDbwBzW5w0QGO3db6y5LgHpL4dDngC1z6cOJDX+Ck+gFvS2Mn0TaKJ8ZWYb3MgHkhl2RsumfMJTbaR2NQIN7hLKxdkBCptpP1yCukTmEuCFcAcT+OGPPsobIBn7lLWRGyER2S9Q4CN+t7K7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZTImjyhKa85yaRGxT8o8RAU3EhiiiZCMoCOSFh2Ljnk=;
 b=lmQsgHV/YFNst4Ui6/qwyL67v8eh+lVmUpoSBragh9od82nLLUdH0/LykUvTb5u2JZLH0DU7B729XzIrftR9ZwvKQvyteuiBdIokRPmJ6ENu+dHMwO/3jyS12UCezVruJfateMzmb3UDS8lwnlssmU9NIHyFGS1g1FmqEpqQf6A=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6995.eurprd08.prod.outlook.com (2603:10a6:20b:34d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Thu, 20 May
 2021 19:23:05 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 19:23:05 +0000
Subject: Re: [PULL 0/9] scripts/simplebench patches
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Qemu-block <qemu-block@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
References: <20210504090113.21311-1-vsementsov@virtuozzo.com>
 <CAFEAcA_Zi3sYZ15R7szGd+Gghm=X2Qg3DwT486_deqsM8os5xQ@mail.gmail.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <1f018929-aeb5-5b3f-a886-4fd76106eb1e@virtuozzo.com>
Date: Thu, 20 May 2021 22:23:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <CAFEAcA_Zi3sYZ15R7szGd+Gghm=X2Qg3DwT486_deqsM8os5xQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: FR3P281CA0035.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::8) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.197) by
 FR3P281CA0035.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.11 via Frontend Transport; Thu, 20 May 2021 19:23:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13273131-96d0-4580-ff6a-08d91bc4b128
X-MS-TrafficTypeDiagnostic: AS8PR08MB6995:
X-Microsoft-Antispam-PRVS: <AS8PR08MB69950A19E8713D7FC2CF2122C12A9@AS8PR08MB6995.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2vikUnwBvPhVKgkqTMqG5JxMgh1d38SaBnYlGzDU44DIxC+QynaMAnX9my0mWnOB2WRHCH6s8unaoIE72ZsZtbj6bLWTluRZMNGO4drx6K64C4BI9FdejiDiHlDE9aYMgFyTm0Sh48aO0Ila0egf6YWitmBgwLG7NToIV4+l1AfmzwdTwSTJi0511lO/mIqB8qyVk0XTD39i29pAESgqagAvJd7/vkje+vM6ThQs96+ULU504+tyFJmeVZkRXoHDujhWhI/+zTH983DHOvczG20zxL9tc70tDNeQ70gwo/ZY2KhqzDcVmpmiqD0nY54TX19/bgnIg1qhS+vxjhE7PabhSrxVPMddsbr1QjV9qXbtFuEr4RaYR8x60cCritP0p1cjhknFxtkQ4+tXontSxM5V+dVfSQkcDc1mteuu4OKReeQn9s4elC/G5OI7rlAUKQEvGmrBrJqNc9aUW6a739g8eG2Pf/+ZBbXBsoCtXkAvRJoAHh6I7EQbYfgXF7qhk3uFlSfcsngS7ZOId+BTljSUsYtEJgHS9vAW7ZMgt3h4iN/CX0S3KgKUXXfEL4nuwtpB0o2OrXh/H0+sweVfjtwEucvjT2+mH0g1//7NcmK7cVXLWl9cVXVMsO1f3mAqugRZX+d4f92RgoZbSmCGDsfOhZfM/L1P7hafrbV1l0PsCfZDBrJIZvF+0p3pKnDpmjWUo2fbYyW1mpemJKVJaVMZv7qxnGEMWeerlmSXgxkEanSqbFpHc0sF3R43m13cXwbkIgk6otJCqKAgyG5iGx0uhAwaDeVte1xuS0zUvuk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(376002)(39840400004)(136003)(2906002)(8936002)(8676002)(6916009)(31696002)(66946007)(66556008)(6486002)(66476007)(966005)(26005)(83380400001)(186003)(16576012)(54906003)(316002)(52116002)(38100700002)(86362001)(16526019)(38350700002)(31686004)(2616005)(478600001)(956004)(4326008)(36756003)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WjgzbEFBZk1LcWZnbEo5NjhuYmh3RldacW12T0haMVBtVWhnNjUvcEZsSWxK?=
 =?utf-8?B?a3Q2V3NuY0cwWXJrWCtyTjhLdjNqWFVUaG1kSVN1ZXEwelVpbE1UMG4ydHBy?=
 =?utf-8?B?Q3FNL3IyMnY5cU5CbFppY1hoendIM2NwbVhEUWJnekwraitsVkF0ODQvemJv?=
 =?utf-8?B?NmFzRzVGdGpTOVJTcThScXZzVmJIU3BJV3dzTldKR1R3SWc5eDk3TVpuNXph?=
 =?utf-8?B?bm1BSEkzV0hZMjIzY2lmKzRiZ3BYQUU5YTRLTnhnUFNvZ2Q1WHZFeE1JRU9y?=
 =?utf-8?B?eDMzTHdDNStUbXRwTU9Wams1akphUnYwTUtuWGVjSmdiQW5pQzdsVm5VcDFl?=
 =?utf-8?B?aFVxM1h5bEhvOWVmcU1OZTBnbVd2eVUyRUU4TzRhbUR6K0dZRVhXNTdrK3Mx?=
 =?utf-8?B?WklXb28ybW4zYkVtZnJUQ0RJdmVrVkRBcCtKRlBqMGplV1lkcVIzQWJBL1dX?=
 =?utf-8?B?ekpWeHZPeHVkYUxQVkYwcncxdnB5TkFIMXUvcjZtSHdremNVSzRjbnFFMzc1?=
 =?utf-8?B?UmlFQjdvdythclBGWjloaVpvcjRiV0R4R1o2dUs0NjZHNlZheXJWN0FDb1p0?=
 =?utf-8?B?MHNaMG9GbG9GZjZQZDVjZ0FhQzR5WHpVL3lWSFdwUUFweThCV2YweG5naGY5?=
 =?utf-8?B?SlJ0YnNDSFdFUWhJd2wxVHQxNTFqZHZEQ0tOUFFscEVtV3JJRUxkaWMydUZv?=
 =?utf-8?B?VTduam5aK1JOU0ZaN05ydVB2NnVCSmZRZmpXMHJ5bzFWSHF6YTV3L0dORU5R?=
 =?utf-8?B?MFQ2NUhBd1Q3dGczM0lMbWw0bmtRQ0JDVXBRNnhNZzU5OXlOQVpJWTNXbXMw?=
 =?utf-8?B?c1EwNGEwaWlpMXJwd3pjc2dtOGptVllEbVJRNzFWNnI2eUl4djVzcEd1TTNB?=
 =?utf-8?B?dkJ4WWFpMThWOElCVWtlYnhMR3grd1kxNFR1T1MyWjM2aWJZL2hYZUJLTWo4?=
 =?utf-8?B?eHJUVkhic2ZKSnR3NHk5cjAybnZQRVNBUnUyTUFNazU5Z2NzSGU2bDBnaVhr?=
 =?utf-8?B?L3hvMEMwS0N3L0lydzRZYzRaM2dhTk5jdEo0UVBhYS92YTJLNEQzTjJkb1pw?=
 =?utf-8?B?YzhiQnB4MHNyOFRVM3RBeGhrbzU5NUJrUW81OFgyRVU0eHdNR1gwNjIyQ21N?=
 =?utf-8?B?RzM5N0ZwaHZrQkN0RXVQb2I5c1FvK28zbDFJMWdERkpzTVd2VXNCYmdMSXdH?=
 =?utf-8?B?UHM2Yk1jNXRlclVXMWpmQWhrcXJ5YjhCY3FFbS9WdWxYVFdsM0xnUHJhNjV3?=
 =?utf-8?B?RnFuL0RmU3duYnp5VG55TTBXYzlDTFZsR0dCeUxqNE5peE9ncytyUGZlWnN0?=
 =?utf-8?B?VjA2clk0RTZiUGtUbEdlL29mOXhuVW1aWldnRkJ3YWZwaFlRdFlMRUlIYWRo?=
 =?utf-8?B?cEpVTFpIYXNVN291bFM0MDlLSTAxREE3UDg5VHV3ZmxYVVFkYzJUMG9pdTNq?=
 =?utf-8?B?RHR4T2p4ODZFTEdmalpRUjYvMjhjOVpSa1p1Z1ZjUHhWUmdBeGNlNHRIOEo3?=
 =?utf-8?B?eDFxQTl6SGtJUnFLZ2M2ait5RkJUSHE2RVNjZ2VFV2hENGM0MWcrbmhCbzR3?=
 =?utf-8?B?eVlNbFNTVkJJblB5OFdTZFRmZXFLRHo5NWgwQlJFNSs5aFlSdHE1Z2NnQ1pP?=
 =?utf-8?B?L1UydEZQNHhHaTg1MXhBMlVTU2lMTDdEdENEVHczcGliNnI3KytxcEx6RjM4?=
 =?utf-8?B?TkVnYUFsdzZ0SlhDcURsR0IwTFFsSW9sY2xlSjRyOEdDcTQrb2I3QlFhWEN1?=
 =?utf-8?Q?CykQ94kqN5M2SibOGa+mHPY/LezJe8lKJWs2AXg?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13273131-96d0-4580-ff6a-08d91bc4b128
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 19:23:05.1341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5RI9USozFkfCw70tgP86v9dDWEMBfCNZhbFhTdBJoskdX/nzTRQucFaOGxt95zMGQKbWLbloQcbNQH04VCts+/HXZnuniYpPMuDLGBHvy7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6995
Received-SPF: pass client-ip=40.107.5.104;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

20.05.2021 22:17, Peter Maydell wrote:
> On Tue, 4 May 2021 at 10:01, Vladimir Sementsov-Ogievskiy
> <vsementsov@virtuozzo.com> wrote:
>>
>> The following changes since commit 53c5433e84e8935abed8e91d4a2eb813168a0ecf:
>>
>>    Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210501' into staging (2021-05-02 12:02:46 +0100)
>>
>> are available in the Git repository at:
>>
>>    https://src.openvz.org/scm/~vsementsov/qemu.git tags/pull-simplebench-2021-05-04
>>
>> for you to fetch changes up to e34bd02694026722410b80cee02ab7f33f893e9b:
>>
>>    MAINTAINERS: update Benchmark util: add git tree (2021-05-04 11:37:26 +0300)
>>
>> ----------------------------------------------------------------
>> scripts/simplebench improvements for 2021-05-04
>>
> 
> I couldn't find the gpg key you signed this with on the public
> keyserver. Could you point me at where you uploaded it, please?
> 

Here it is: http://keys.gnupg.net/pks/lookup?op=vindex&fingerprint=on&search=0x561F24C1F19F79FB


-- 
Best regards,
Vladimir


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A393F62AA
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 18:27:29 +0200 (CEST)
Received: from localhost ([::1]:43174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIZGq-0002Q2-Eq
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 12:27:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIZDm-0003es-8z; Tue, 24 Aug 2021 12:24:18 -0400
Received: from mail-am6eur05on2130.outbound.protection.outlook.com
 ([40.107.22.130]:21120 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIZDh-0003nB-LP; Tue, 24 Aug 2021 12:24:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G7eRoVab9F9vu8nqrBQphz9A9y2i/sIFjyNDoH5rQXgwxEqLUyJcMHI0oXABl7Zhz5tDe4Ekw6lFfpAaWI+oa5rmPORLJ6kF0pL+LVOJfr2xoqj/Pv+T/27x43oeHjVGv2/hHvnVDlAUHsiRnSNx+1G9yIFRy6otSxITdpVlBjIFCmqVdMY1FSFTJmmm6uzOzGY8lBq82qjGdFCPAJXRwUErQu2YpcCi9mXp2lPFNEz3JbscVdzr7Iaz4Xn+JXYwUBHGCJLW/esjJiTdRzVAMroak6hSIeU9PEkcyLmyvZ7y6FQUkPAu6HO6dKfnM9rsEkPIBDgDTj/TBu/BQfZA0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0Y7G0FAGbGUnav4PeoALvdBy9PU/vWUodO6g1MsBsU=;
 b=Fb2+fuucTYZWt/RzBMS5FT6WI/IPLUXdrsggPxt1AGbTnMBJiqU2fKnJUhJXIGSOkWQfEsqSUlLjSCGl5Bi/RtKCIvjxbAQkTJvaUNe5JF9gvxXlHf7MJA2jgIvcjos0JXLVW7nDxQBgatbVKlncvcpxw5BkwmT7/4g3UPT6PUXatfJMiUfeacZF/GDN8Fkux3o1cosL9tmjkpVuHIJH/gOYRhKdnqqcH6wHupztkx9LgYb3A1LjwPAqbSP3Ex/0vDskimHQUN5xBvy6MpYz9CPotguSyQVYvvi4oxSp00UXVJB26+x/Q4gc76bLlJLSwQEHmrXGJd+io5qCyOIKww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0Y7G0FAGbGUnav4PeoALvdBy9PU/vWUodO6g1MsBsU=;
 b=sjbGWZI0mSAfkrHBBPVuSDteWw9I+d28MnFWsxk9MPvY89DZOIMSFDmlfQML+gFI6hca0G7VpnuJF2MZ4cmFnh+DWiKExOgM/64vWtnFKzTw4nMB0CgBpJj1C63Nk6DD1XD5Z4L7k0ic5/81YbQyEGzALojSuhWTJTxD4JRKmww=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6808.eurprd08.prod.outlook.com (2603:10a6:20b:39c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 16:24:07 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 16:24:07 +0000
Subject: Re: [PATCH v8 00/34] block: publish backup-top filter
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, jsnow@redhat.com, kwolf@redhat.com
References: <20210824083856.17408-1-vsementsov@virtuozzo.com>
 <82985ebb-91a3-895e-7e0b-ab4fad506338@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <94d0acf3-9f82-aefb-572b-d193da4d61fd@virtuozzo.com>
Date: Tue, 24 Aug 2021 19:24:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <82985ebb-91a3-895e-7e0b-ab4fad506338@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR1PR01CA0004.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::17) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.249) by
 PR1PR01CA0004.eurprd01.prod.exchangelabs.com (2603:10a6:102::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Tue, 24 Aug 2021 16:24:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8bc67f53-6b40-4b1c-1706-08d9671b98d7
X-MS-TrafficTypeDiagnostic: AS8PR08MB6808:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6808556937FCC6AD9226525AC1C59@AS8PR08MB6808.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zGNXgllj6ToaRDbDPCbbB17ptCfKWmI/DlBrL/lB943QXoxq+qRqHPINYvPlviZL8ni6qgmVLUNUA9wTjG8jlnxDSLrg6TQIXfjX41VAX+K0nAFiqj1SFyGAOGaudiS6YHqGiEPOCyFnafeknntrQhYUUps8ey0pqyiesJv7bBzArFZ4DiuBp+5C78r5i07mCRVvvOWmyYO1eV5auEZM81/fMObvcBLFPeFBOiKf+UhKWNLElocUt3vmN5Kj5k1rpGte0rJgR5/vgoMbxxSIDQgEGE3iGK6tOSrMogALieY6ZbgXAPlE3+D2ylrb6ITTN0GLnrs0v3Naexn5OCjDPmlFG+Z720XIa43zeGVvZKcC3AkSHfFSGLw/3zXNZ4OOaZ9jDfnVINs2Ijh2mB/Gd2JhWPzyOnc88BH0qWSJTgYC7w6nVo6WeSOFwVGZ335N4GiqadyRsAWpM2fp7j1dXJ/zVZkaNPOEDxr0ZHyiWhDOTZDeQtZ22Y2oGxzXv/3mGryCkHKl85rkbMIqVYk4FfkLhBD4gs3zbpc9TqwCTJQTgHupPAic8EqDqCNIKqNY/VfitfLVhy16SNd31pTWWbTeKifcHDUo7EPKwFu/XAtAFEp8jONAlC60TJKoezoFUlh2bjr5nBL+yTab9mBlP0gdxjzdMeje6zeAcdsnSnaouDpYLfSs4BqC3HpJfIU9rB2XILyajC2PtP23+yON1wOb+lMwAPNiC2Qns4kZV/kvrGgC1kpKq5ndt16igaa9l0PxXL/H6lOvo5RrIzI7OHkPmo/E7N3OlmFDtIWeaDF+WkOgVGx6BN+HaGsoMY8C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(346002)(376002)(396003)(136003)(186003)(52116002)(5660300002)(8936002)(2906002)(36756003)(8676002)(53546011)(26005)(4744005)(4326008)(31686004)(316002)(956004)(16576012)(31696002)(86362001)(38100700002)(38350700002)(7416002)(66946007)(66556008)(966005)(478600001)(66476007)(6486002)(83380400001)(2616005)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXQ4SFAybVNQeUR2ZmR2NzBWbFVxQTdQM1dvaTNzcFhvMFR1TDJWNGtrS0NI?=
 =?utf-8?B?MFAzbXBHRHN6NVd3ZFk4d2s3ZUtkdUp6c1FUQVZTVDhQSWtCbmd6OFoyZ2hN?=
 =?utf-8?B?a0NHRjdoQjdaTXgzeUhOTm8zVnBZVUIvWVpHZDZ0VmlORDc1Wm83ekhXTDMw?=
 =?utf-8?B?ZVIzSTV0SDdaN1Z0eHd3dEtONUJNTVFRN3kvTHR2Wmt5OUhyTmlmVkswRW1H?=
 =?utf-8?B?aGtsOElvd21UZUI2YjhKMjVwK0w4MGFNTXV0aDZGUHpMckhVQnV2THh1cGRr?=
 =?utf-8?B?V3J0M21scTdBbVdRVDBERW41UDgraWdDUE1zT3RteWlOdnJsMlBiNFRJWjY1?=
 =?utf-8?B?K29SK3E3OFVRamFBYVJKTHY0ZEFiV0swYk1HSmJNWmF4L1JkN2NWTEZQcGR5?=
 =?utf-8?B?Sy92YU5SdytDTG9JcUFNU0dOSWxBR2RyYkhybEtneGF3T1I4anE5a0xrcEha?=
 =?utf-8?B?S0dNdmtxOFVrUVBVZm5OVDBmN3VRdkloL243QndMcUZncVZIZWdObytIOXkx?=
 =?utf-8?B?THA4UnNjbk4zclREczJ0bWlobFU4UkliMEpnOWVyMUdxcWlxcllaa240Tk40?=
 =?utf-8?B?bzZIVElUOE4vSktlVE0zWXByWTlUTXJmLzBnSnJFQUtJWUx3dWZTY2J0U2R2?=
 =?utf-8?B?RnkySUd1OE0zM0lWZlZWSnpCcFd0dDk1YVFZcloyNjlqN0tKdndoRWpvL2RO?=
 =?utf-8?B?ZWdURSthcitneWp5dExrTXJ0TWh1WHUzOVEzZnpvNDJNWk1EWGhBRTM2K2dD?=
 =?utf-8?B?QTVEU3ROMkZ4ck10L2VHOFN4VjFJeUN2UG5wRnBzYnV3NmdydHliYjhCelVK?=
 =?utf-8?B?MUZDM2dsSVB4SENCa000cGdVQzYzVzY4a1hLb2pZaDdGZmVoUlMrMk4vUm9C?=
 =?utf-8?B?L2xzUFVZMjNBZFRvN01jOWVmck0vc1lkckd5NlZuYncrall1MUJRNmk4SlZk?=
 =?utf-8?B?SkNSVG1tQzE0NlMyMXFqa3hzT0l0Zk9ZaTNzNUtpd1FWZHpGRGpWV0Y3TEl2?=
 =?utf-8?B?RW9KaTB1OGVIODh3Z1Z0cDZtQVRkQW9ZTVZPTmFFNVk2dytqOE5Mc1owMERM?=
 =?utf-8?B?bU4wOEZoNjcvM0NrSzFoMzg2eTdsVlVMaDU2bzRhUVhXaTVFQUVJL09LYWhh?=
 =?utf-8?B?eE1LSkFWRFhpdzVrbnNjUkRubU8wUUU0cWtsWU1JTUZMWjMyTGovdTh4Ukxn?=
 =?utf-8?B?WEJmZEZMbzFXSERWMm51RFpqRDVSaTFydkVHR3k0Z1Q3WGRnbnU5aW9MUlhs?=
 =?utf-8?B?K2xBNTlNT1lDUFZpaTNRZWRQVzJPMGRac1RWSENvb21WdHpmSjhkVzBEajZ3?=
 =?utf-8?B?S0M3Y2sxdFgwZDhwQ2dUcnJraGpzQ3o1aXJIOFJ0YjJUVlhVbUxEQ1VxWjFm?=
 =?utf-8?B?aXl2NFZaSjlFM0lKZC9VRncwOU5GS2d6Tm5SSVdWR1JRU09KMTFnMVVlMTZP?=
 =?utf-8?B?ZGhKSTFsMnllMUoxN0YvK3BqSHNxZDJ3djR5YlowQXhtV3Fmc1lqV0F2UW1X?=
 =?utf-8?B?dkhUZ3lKdE5oVFovME5SVFpQRTdoSG9lTkdrK3BpTFdmemNLUk1nUDRrNzJx?=
 =?utf-8?B?a3BFSzZ2OW9rK2VXQ3MyNmtPMTl3OHMwKy9UQlFkWG8wcXcrQk9STXRwdGFh?=
 =?utf-8?B?cXVIZWo1b1YrSU9hZFhMeTlZSzFYeU1LWVZpemRqNDZ4c2p2bEtNU3k1R2k3?=
 =?utf-8?B?aHJJemtvMTRVd09wNmRCTUxTQ3dVQnVBSUxKb3F5N2lIZXQydHVVL2hXUEVN?=
 =?utf-8?Q?0VNKFVHvCvI1AtNJoCyqD5qRa4i614fA1dYrpgX?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bc67f53-6b40-4b1c-1706-08d9671b98d7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 16:24:07.7010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qeIdYMUWzRoCGxqosF1Iz6h1XfAB7m8en9g8v93h4JzAeSIT3JCfXKu0eb2Bpg9CZHwuf335YoM/gW3fU06CYI3oee3cBj0FOAfem/VH6dY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6808
Received-SPF: pass client-ip=40.107.22.130;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.305, RCVD_IN_DNSWL_NONE=-0.0001,
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

24.08.2021 18:51, Hanna Reitz wrote:
> On 24.08.21 10:38, Vladimir Sementsov-Ogievskiy wrote:
>> Hi all!
>>
>> v8:
>>
>> 06: add Hanna's r-b
>> 07: keep is_fleecing detection in _new() function
>> 08,17,18: add Hanna's r-b
>> 19: wording, s/6.1/6.2/, add Markus's a-b
>> 25: new
>> 29: add John's r-b
>> 34: new
>>
>> Patches without r-b: 07, 25, 34
> 
> Thanks!  I’ve applied the series to my block-next branch:
> 
> https://github.com/XanClic/qemu/commits/block-next
> 
> Hanna
> 

Thanks for reviewing!

-- 
Best regards,
Vladimir


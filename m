Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFDB4176B3
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 16:17:54 +0200 (CEST)
Received: from localhost ([::1]:41428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTm1R-0001Cz-HR
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 10:17:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTlyJ-0007aA-I7; Fri, 24 Sep 2021 10:14:39 -0400
Received: from mail-db8eur05on2131.outbound.protection.outlook.com
 ([40.107.20.131]:61632 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTlyG-0000O7-V3; Fri, 24 Sep 2021 10:14:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lrc9PCZGNbWe5mv7QCUBuD11LZarZ6liWyt+/Thba4R1mCOBjLlmy703Y/IrVukoijnWmD/qAl0fxy07cr0PHLK2KcCiAL+wEhxlF0ahHD191i3vptzCTNj639kevSpDypIgbEL5/ybf2hiWmIwGbaUTt+YbVs2uujPUXoQft4JuxzxQn+rhwSxaFPuutMtnkMfjPBdVjPPN1Vum8LfGe9IJV4Y8MpqNbdft2OFjIUBO2in99Q61D4YP8MxNypbVgyowPRszX9hjzmFytyF38XRDpp9TQd4/JcWKv4wp0Q37pT8i2sBstHpmRONHJ7OSbW6l27WHzg/C5VoH2KPxiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=nVPm5rSF+lHbeh5Ou3gtmYyJ8SBfmsmvwznM7PdOvhQ=;
 b=mKu2A1CCE1gusw867VJIwz5+ZvoxC3SsrgBcPGFzGqkhPRxi0tc5LjYLEf+6GqO+Sa5ekIiuyP7YCYXTD0iWiWnIdDoFwBLQuJOOmzgVaHYv+2XVvKDURJ4b6dsqYIQrnz7W9MLFUenn7IqZ6gLVwYTNJUYZ+zmFsDhnu93+fiEFl0/6v3XZSvbxm39dsNXGitCFj7A6Dk56i4R3lHkYIYP3OqA2HEqTwz/VsqbNWYERZ70j5LupQLwthcXuPJE0DvuKMZBcyg1mjRoitl4x/ZF9oNJR7n8JmWwU1DMRaID0DxPonBM/2KKUW5FlTGQN0hLYu3LeuFLXmpI7GmT2Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVPm5rSF+lHbeh5Ou3gtmYyJ8SBfmsmvwznM7PdOvhQ=;
 b=NR0e65CuH91sRjpcBzFVY1NkXguoxoproiDLw+gyiTHPfmzXKIjSP++x68w8A6Jd3nXK/kVBXtNy5LDiYh7BViScGLaEFHoiBcAjhkBErRGbzANzjK35CC/hCAd0I1VgSDegNNxSw/4vyO5dTk5sRVyKVhU6z5UK4BJ2/uBxQkk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6904.eurprd08.prod.outlook.com (2603:10a6:20b:394::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 24 Sep
 2021 14:14:30 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 14:14:30 +0000
Subject: Re: [PATCH 07/11] qemu-option: Allow deleting opts during
 qemu_opts_foreach()
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Cc: pkrempa@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 qemu-block@nongnu.org, libvir-list@redhat.com, armbru@redhat.com,
 its@irrelevant.dk, pbonzini@redhat.com
References: <20210924090427.9218-1-kwolf@redhat.com>
 <20210924090427.9218-8-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <d2a208bc-45f0-e4ee-f545-0f35ed516450@virtuozzo.com>
Date: Fri, 24 Sep 2021 17:14:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210924090427.9218-8-kwolf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0105.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.5] (185.215.60.205) by
 PR0P264CA0105.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 14:14:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37bcd672-ff9d-478f-1b0b-08d97f65a021
X-MS-TrafficTypeDiagnostic: AS8PR08MB6904:
X-Microsoft-Antispam-PRVS: <AS8PR08MB69042D57A41636AC9A70751AC1A49@AS8PR08MB6904.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RgHtEaQrAQXxEbiVBPp76UPQgcoHXzwaj8PyzUxsmjJWoDQ/DR/+Uq2oBjD5ZPyfNzfKIgVyRkdb+esPZCOdLMXU7B9kiBar5gSBlxRVBNWARULnaGMwYNc97zMDBQyqb6VaBjzlMMVqvV9zzVIG47MH8wDbvpcCAPfNDKXaf7enzl0zCWB2v0KKRaK5C1S/SVUxPFkjWkNS5UcI6aFzz6aY7tLLF/c+fQXDVqZo8JHumX7Dyr5jpfPYKhAmBXulCpYbMsWT/EKPwOJ4xsgNWR5wpXTJtQKcb8mefHFKpptZJ+qGJc8z7sH4bJuOQ9Jop398jPLS60SJUTsM1hqUcw1WZcVRANvERLM3/Uie64LiHez7WYde1fNvNnjcfmlMFEnaZ7s8/6HnbNNWbOEieZzgt7PY9Fex/WoPCHeGmZ7r3Q1bfMmfeDHPwS3rVUIk5YraYmueYJiqbyx7Z/MfE8lJvpYNCzgha5qYXpydDmSV4+uFbpGJC0TEDu82MNxWLprDubyyVtWMn4oVTScFDND3WONSLbdFrkN/j2hmbLvvAUTa9I18GWl3Bme18A3yFi7QHF93MhmxT6OEyx6CFtb7oMh/U/oFNMRKBpr07Z0GdNn1r/8cLlDanhd8nXKB/ENZDX9VcLbBjWU9jTX0j98VXALSfVCNqIT5TgBYjsVK/G8vNcWgN+quojCjhbAWk7If2qqKp7avPMhU3E1vjJEeL4U3P2IN8Zz3L3V3Wv8E7d/3kHLG9BUG6fsG9MmQHgnP4/0JeA3XVLfphoAFAg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(36756003)(26005)(8936002)(86362001)(2906002)(38100700002)(83380400001)(38350700002)(558084003)(508600001)(16576012)(8676002)(5660300002)(186003)(6486002)(4326008)(66476007)(66556008)(956004)(2616005)(31686004)(31696002)(66946007)(316002)(7416002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0srdkZ3akJHU0FlREd6VHpsM2V4WnVtdnRqa05sb0VkbFZsbFpITnRiS2tK?=
 =?utf-8?B?NDRTbDZwWjlJcU1neGJNVzg0ZGpOWks4K0tDVjdzc0pyWDlOSkxMa1VVQ0pB?=
 =?utf-8?B?R0FvMElROGJtQXRYMUR5Z3RIaGx1aU1wQndFRHY0Yzl4VzQxYXJueUpOdURJ?=
 =?utf-8?B?dVhLRHlRK3VROXcvam1jc1E2WVExeVJjLy9MT0xzeWs5WFF1N09lbk9WWXIv?=
 =?utf-8?B?cTczQ0FUdG1vY3pjUGprTit2ci9JMlRsLzhJdG1KalJWVVdlcjRrNVN0UzZx?=
 =?utf-8?B?RnoraXcrZ1F3cllob0I4TWpoczFFZjhlMENCTVE3Y1RLM2JuV0RrTzJINEtE?=
 =?utf-8?B?K05mZGg2UGlwS2tTWUZyRjhpOFBkUmhsNHM1K2duL0kzTUdraE94c0NGQmkz?=
 =?utf-8?B?QmdVUVpEMGVpTHV4ZjVIMXNRNmNwWk56UUhiYy9HLzVlZkhiRmhHOWdNY0x4?=
 =?utf-8?B?VWt4am1odTdUY0ZUb0hhcy95TjZzUHpTeTY1L2hqY3JpUVdPV2prNEp6OTJm?=
 =?utf-8?B?Q1VtWmg1ZmNnZGRoZEdOK2dYWDdobUNESWZPY3AwTGdUMDVxdjRSc3VpY3Q4?=
 =?utf-8?B?cVhKd0szeE9WVU5PL3dObGpzeXBGVFBKQmRHVkZTQktCS3l4cVhOejNGYTRP?=
 =?utf-8?B?WGVoVkFrK0ZFbURRZ0p0Yk95U1FHVUNoYTdZR3pzMFpMNzRpVTZoNWU2Q0JP?=
 =?utf-8?B?QnZMREJOMHJNQmVDTXlPaTVWZmE0VjQ1VUtUY2l4bVpCV2lYYndYeUNFYWZj?=
 =?utf-8?B?a0x5cEEwR09MSmtJOG40WDRWbnRuUlBpeHRGSTluMm9NUVo4UFhic2dqM2E1?=
 =?utf-8?B?UW05N2l5UlZiVldIVnZLOEw2M0F1dVF1bVZUZDdZQUZsa2tzZHpQVk85MEx0?=
 =?utf-8?B?T3NuM0hmM2lMcElEN2dpUWFUN01FZzlRSWJlZEhSWXIrZnl0bmpDSWhnUStC?=
 =?utf-8?B?ZFI2UkFEMUhRMVRqWWl2QzVCMlB2bm84VVc1NEkxRzFibnZyeTlCaGMzcXVC?=
 =?utf-8?B?VHMvNTBqcW1MZXAya3hmUjcxaXp5MUh1TWFHcDdiVkJXT0p0by9mSzlKM2lU?=
 =?utf-8?B?RWtLY0NFV1dneEo4MGRaVHpZRzV6Q01ZK2d3a3ZncnpPdkJGK1hqdGRpdTlQ?=
 =?utf-8?B?cGxKV04va2tOTlcxWkRLY3JieEdUM2NqTmtWeGRrTzExaldrOHUvcERJaTVD?=
 =?utf-8?B?YkNaWDNQT0VERzlQbFdGdkRVUlRCZVRjZXUzbkg5UmNVM1E4TjE0OFRlMnhJ?=
 =?utf-8?B?SXNsWVAyVVJkUjB0M3FBM1hPbGU0dC9jSUtFeVN6VUJGa0lIUDRRa1N2cytq?=
 =?utf-8?B?Qm51c3hlcGNGd1VOWU5JZktXcUpRYUNybk9FRlAzQlpKOUVZUFUxY0U1dEFk?=
 =?utf-8?B?cC9kYzJUb2RqbzR6d2VsY2gveXlKSldKLzFFR2JsRE5laFBleUJNME9EbkZI?=
 =?utf-8?B?a3dSc3BxcEZKWXlaeXhzdG1GQXMzRklmTEtiUHF1d2g4TUJxdFEyemRqQlZi?=
 =?utf-8?B?QUY4MDBWVkJKc0hxaURPQ2k5WHBhVDE2Y1hhdVY4dzNMbE5TeHZHb2ZvT3hp?=
 =?utf-8?B?dERuMUtwOVd6dit4VXk5aTFKK1huaXhWOFYwcDFERGlhRkJoZmxmQmxqbGtS?=
 =?utf-8?B?dzNPSzFQc2pDNTYyT1N3NFJJZTlZeWtoSitrTVVNVWRzK0tUM3g1M0VTVngy?=
 =?utf-8?B?VjlMVWlGTXJWNmpicHNtRXovckVtaU83eW1hSTlObmJhdDBlS09nUkRFNUtT?=
 =?utf-8?Q?o/NJTcrggVFt7wCvPtDSPfZHy/AhhuM7aRwXeDN?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37bcd672-ff9d-478f-1b0b-08d97f65a021
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 14:14:30.5799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: unyzbjElGlZvkeUuTve72KGy3PAHlqyg/cnbKWb6TIX2OpEn54qvkMMzvJosC/4oHwvBW9bBbh4jy7EJm/uLoS2a5KuQ6+h6WECSKYxYRh4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6904
Received-SPF: pass client-ip=40.107.20.131;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

24.09.2021 12:04, Kevin Wolf wrote:
> Use QTAILQ_FOREACH_SAFE() so that the current QemuOpts can be deleted
> while iterating through the whole list.
> 
> Signed-off-by: Kevin Wolf<kwolf@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir


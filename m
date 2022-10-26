Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FA560E252
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 15:39:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ongUQ-0003LE-2W; Wed, 26 Oct 2022 09:30:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1ongUH-0003Hj-Kq
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 09:30:31 -0400
Received: from mail-he1eur04on0705.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::705]
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1ongUE-0007Uk-5G
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 09:30:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dfLSPzh0c3ugGmP18/F1U/sdwIdeYSvf9BkMLGNg/KXq+V2V6CD/9gOlCQQv/ogYPi/QPvJr9UnN9ZhCQVzJrq+xqY9XHU1xv+a+UMy0s1rMVPJbh8ttnVc+wnRzdfFBGJoRcv0hl9LDno6+T7Du08pLTm43R8KTCMe5/f6+e+Hk+yAXCO2gu9pLN0Jscz9tmqScLvgAh4jjITVF2OqZ5Ae3TZ3ynyM3E4nv9VE8fbLhWScL0JzoGe8aT/hnURcBJhTsmfqg94ZdvGZRzr2Gpn8V6FZeHAL/O1IDttghLf17QEzVbuvONuJeqU50Gm78ol68EP1rRK4dostwCIjiig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z9L+0nx2/GeulPAnUEE4e77XnCKSRslf4zpNstVOtso=;
 b=mNtLVN6HSDE9ZxT3a7W4/O2jwlTDopim4I0qn62RJLTh10Hy/y62FjYHZWxx+TOEu9ZxXZXznn9FX910f/jBiW6bPAl8E/DxRSH0CqX7VDPXkLz0saoMAHzCFJlUE345h9lNu8ZTk1ZX7ZzSMBRwtQF8er3CoGuQKBf0jCV4NbsOVRlV/CCVYY6RZ5BObJqfk3KBfzYrPWB+GyUZgggxwWb8Xvu+XZY3acRsjvlOweO34gpQNfLRAI9BcEtWhpl3eYWt6BeiI8+1pZja8GECHtLix1VyrkwAdwOGYzX7XGn8+0RTv2a4Mj2mpw0o+zPIi3FaJjh9/KuCJBHlZOzQww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z9L+0nx2/GeulPAnUEE4e77XnCKSRslf4zpNstVOtso=;
 b=t0vWV+U3Cm5nclleIxjuDzbkLTT0cNbq13aTfxXRuWIBNqYGWeZn+2Rbje/q2W2TowAG37GlPH4IGKQiknhjIDbMdbwuFwC4XQ718V7TTQBP6OfV6+SR5C4PPCG800v0QdYxOQK1eLqTStLPgB7Iy1G873L6PuccIcDd6Str0LJZi3xlKo/6nrmoavdAqyXqWW+OUBNB8kG4vcuZSmuTlpcXNf5dUpJaGrGfAI1kJinZTSSsQ4CeV8eI9zrE61doO7yxlqFRVOhVzMZS1lA6e1j0A1wKU7Mbd88a1MB57RDqZy2QXmWf1MaA/4+lhdr4udVhboJG0NhzqjupWLEwdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM9PR08MB6290.eurprd08.prod.outlook.com (2603:10a6:20b:2d5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Wed, 26 Oct
 2022 13:25:20 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5676.040; Wed, 26 Oct 2022
 13:25:19 +0000
Message-ID: <0e38476c-0066-e90e-c100-9c23412df108@virtuozzo.com>
Date: Wed, 26 Oct 2022 15:25:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v5 0/7] qga: Add FreeBSD support
Content-Language: en-US
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, michael.roth@amd.com, kkostiuk@redhat.com,
 marcandre.lureau@gmail.com
References: <20221017072825.72867-1-alexander.ivanov@virtuozzo.com>
In-Reply-To: <20221017072825.72867-1-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0466.eurprd06.prod.outlook.com
 (2603:10a6:20b:49a::26) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|AM9PR08MB6290:EE_
X-MS-Office365-Filtering-Correlation-Id: 7695f53a-dcb8-4008-6bb0-08dab7558758
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: voUg3BUGRIHSOmsNR25LSULgO6qAOMELqD4scVSKVhHLlW8KbbWwHPde5GUrKkD7vvrgAF8E2NrBTVoR9wvFjC7N/MTFO+p2pmBOPvcRsQwswF+cj9a0jM1fNMWnN/qsQ3sa21eJ5m0W3WkxlOIGCIr8CKF0K0+K8bsGoTgqCcAcqMIoR8cHoXZ198owuK5TmoU7/8zLA0lB96MTd35VJRJtIi8yimuIAgmrfVyvFGD8jUDzcYjRBp5SoqwvdJQCE92/NJcETXpkkUyR/VHR3fPHQjKbqDFvWVFyDUCuWXIB896Y0HEEJsLoO6nF5anrMEYmu1SdRVuZ55nm9kaqhm+8cm/DQza0nRuLjhb3Q0wuwcFe6A6gruB7s8XXVoN0zMnryJD3hBt4vWk0zu5CkDGM5Ko51/hQ8qzx5icYdkNn12Fm5zZV2DVpN4q7kDrkun8gAx+o5HDlXAOT1FwYNBzk67K8q6N2v7qFjFBp1JdSMXIlMWvw16r0MNp+TAyJMK1Z/y+48s9vjYwFu3LAP5AfDVgTnG3FyD/KloSx9m8aWpM7zS3laIFVoJRZ9TOdJIjDuliwLD/LlY+HpUBuLtrLycSOHiCLvSQ/stLje5hGW47RMALckUX8a5re81+6vD8ALAK7xNVitGp3hxB69Bmp4n33q3WI3lguNwefXDNFMiLpPeELdovZccvMRmf3w+5S/nntJVvtrKPijkE+uHVSh/GveFeagGXjsabeT4xYvpjP1FH7wLp+77O4LrtJbEid5T2VMx9Hn/9CNKsDa5ymLRlQDfDydN6NllQoXFaH9cdmup1kMRDRJxbYQg9d
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(346002)(376002)(39850400004)(366004)(451199015)(6512007)(31686004)(36756003)(38350700002)(44832011)(86362001)(41300700001)(53546011)(31696002)(66946007)(83380400001)(38100700002)(186003)(2906002)(2616005)(52116002)(6486002)(478600001)(26005)(6506007)(5660300002)(66556008)(8936002)(6916009)(316002)(8676002)(4326008)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEpYVkpXd2d0RHJ2eDNyRDJnOVJ5YVBvSjlCNWRFeWJHT2plVEJHN3c5Tmww?=
 =?utf-8?B?WXowQk0wbURwbW5RakI0b3lYZWdHMzhSRm9pa0RoQklxSzB5RS9jNUl0SFBi?=
 =?utf-8?B?UEdtSVZKM0FNZkptM1l0MFJiUEIvMUw3NlkzTGV5d2xIWDdYTnMyU1RmMUhx?=
 =?utf-8?B?RytLd29PMGx4MnJNUjZZdFlSNHRsei91djlUN3hLSDRXNFVUdWFkdTBlNEpC?=
 =?utf-8?B?bXM1d0VVbkVPMGRpN281cmtFWDNsT0x4RjRYNTRVTmRGeGMxbEtVLzZ4M1Br?=
 =?utf-8?B?RXpuU1VtYjRQWnoxdkRteFdSd1QxN3NjaXZGUUpab0hscFRFc2xwdVNGdjRH?=
 =?utf-8?B?Q1lKdFcwNmVzK202QlFYL2hSYTlkd3dMUXluM21UYW9iL2tKOVVsd3J6U3FT?=
 =?utf-8?B?V0pRcm5zRWlNZTY0VXYycXRYeFlaNHZ2Vm9wcGhsK254cEl4Q3VTWXAyUjRC?=
 =?utf-8?B?cjlja082cTZGUmdYS1dlNGJ5RWhhNTFpenJMWXB6bTNEdlFXTVRWSzMzOVNv?=
 =?utf-8?B?K09WcUtLb1BGeElRQkVPK2pNTFl1VStVQnV6ZW1vcFM1NDcxNk9jakJGS1V1?=
 =?utf-8?B?Mm1wYyt2cDhqZDFXYjliRHBTdjFLUXU1aldyeTdaU1dMWWNUazVwYlgxQ2hk?=
 =?utf-8?B?U3FVYWdKTkw0TllkOGFuc2VGeHFKams5OEtsVVFRc1dUSGdzUGplSVVtNStQ?=
 =?utf-8?B?bUxoWmhmakppeFR5MEd2cUJrSlRjY3gvclJpOUJCTzhDaDY1aHpuUFBXVnpa?=
 =?utf-8?B?Wlh5QmJXT2lERGl0aUdudzRZdGJXL09RMDh0eHFYRG9HTHRST2xnaEJqRmVz?=
 =?utf-8?B?UjFsUmloZkVmMmlxUFlPY2pSSTZzOHBQaFlQU285R0d2aytoNklNZnF2Uy9r?=
 =?utf-8?B?Tlc2bFA2c3FWYitGRGlDelZyNXdtTGJBM293Y2l4OHFhODMweXpRY285TGIz?=
 =?utf-8?B?dWNVcWswRXl5Vk9kd3ZWMmkyZ1FxSUd6M1d6VzVJUU9sTS8vSHhWRWtWdWw4?=
 =?utf-8?B?bmROYUxWL2VNYTc5b25QVWtlQ0hsbHpLdUZZM2ZnQnU4QTE5NzV2MnJhUmZM?=
 =?utf-8?B?TEorb3BOalhDdlVTMXAvYXpEbGpXSzJQV2dIN3NWQkgrQW11d1VRNXJKKzI4?=
 =?utf-8?B?RFJUelR5eVZxL0pQeThtMEM0bmJDbWtOM2c3cHdEckZrMytlc2s1clpjYnN6?=
 =?utf-8?B?ZmZGTjF6aHRZSkx3TzNCbVhKOURjNlFNTlI4eE1nYTl5bnNzLysrcmYxbEov?=
 =?utf-8?B?VDFkSXVhUFphMVBpOEZhMEVhMURMT0lYZVRzN2lrV0l3b0lMWUZmTmdvZWlP?=
 =?utf-8?B?aEJBTERCRjFtenVXQ0F1TmdpTTRhVTlJaXZFOVdpOWNFQ0poTGlPVHgxWi90?=
 =?utf-8?B?VFlpb2Z2RlZqaEc4MmxzQzZwRGpsT2sreGFJR1BuYkxaM1B1aDhVa2wzZGxZ?=
 =?utf-8?B?Z0tWWHBDSVlxWnk4VXJmQU41R1FBTWJTTmlha25oZk0wTE9idy9aU3NoT0Zk?=
 =?utf-8?B?cFZ6WlZML3gvWXZNSU81T1k2b28wZ08yWHNEQm5Edis4NlVuVVA1emdmaytp?=
 =?utf-8?B?R0hIckVoNk91UHV5ZXFTb0F0UXNPbTdXR0ZuV0NWajJUaWtBYjhyN0NHcUJL?=
 =?utf-8?B?aVl0NFhnS0J2RHp5SkpzMk83dS93dkRtdUFnK0RUQUF2QzZmb0d5bVFjam5u?=
 =?utf-8?B?VzNBNDJKeml3UmZKQUlPZEwwSlM1RjIyK0hRRTFuZjFxZ3hCTC9GZW8rUXNs?=
 =?utf-8?B?WkxHVGdlL3JzaUtyVENiNzd2UzkvSHQ0YmwwKys1TUVxclJqSERjdjI2MW9i?=
 =?utf-8?B?VnhnQlRhY1pqSDJFSlV1elM3dUdmczlNcUE5M2tYajRjY09uM1VMN2NleGNO?=
 =?utf-8?B?Y2Z4OWNiZUlOcS9RTzBucndjUjYrVVgwMzd1QjJNaldJVFRKdWx0NzBaRzhp?=
 =?utf-8?B?WThCV01PNTB4NjZqd1UzUWdKMk5PQ3hIVTFUbmhCQmVQU25jWWxHZ2lRSktU?=
 =?utf-8?B?amRPRmpKWFNiNjA1eEdCdEVVK05OODFiUzNaMlRQaEhTR013SVUwc01keXRG?=
 =?utf-8?B?ZGN6WjcvaTNpTGYxVnpVVDlYa21Da0ZqVmhLZ3BkbkxsT3lDVzFPYXYxektO?=
 =?utf-8?B?RVJ4YXNDalNncnVzL0phck5oWUF2WlBnS2Q5VVRkSWo0a2tuMU1hUW5zSDE4?=
 =?utf-8?B?Z3c9PQ==?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7695f53a-dcb8-4008-6bb0-08dab7558758
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 13:25:19.8590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mYrUk6q2z9paI78FPlIJyr2qKIQiFGrrk8DtStrRr8AzgXgt2Qec4AFxTcS95RyHEodEc9DADonxrL5x3oF+mPvMzZ0QJSeZ4rV/kFAsst8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6290
Received-SPF: pass client-ip=2a01:111:f400:fe0d::705;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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

Could you please clarify the status of the patchset?

Thank you.

On 17.10.2022 09:28, Alexander Ivanov wrote:
> Add freeze/thaw, shutdown/halt/reboot, password setting and
> guest-network-get-interfaces command support for FreeBSD.
>
> v5:
> 2: Left ga_wait_child() static in commands-posix.c.
>
> v4:
> 6,7: Return bool instead int in guest_get_hw_addr().
>
> v3:
> 1: Add a comment about echo suppressing.
> 5: Replace code moving by splitting the code into a few blocks under
>     architecture conditions.
> 5,6: Move actions with dumb qmp_guest_set_user_password() to
>       the appropriate patch.
> 6: Fix error/obtained return.
>
> v2:
> 1: Reject the idea to move all the Linux-specific code to a separate file.
>     First commit now adds initial support of FreeBSD. Fixed device paths
>     and fixed virtio device initialization (disable echo). Add comment why
>     we should disable the code under HAVE_GETIFADDRS in FreeBSD.
> 2: Replace the second commit (which now is the first) by moving
>     Linux-specific freeze/thaw code to a separate file commands-linux.c.
> 3: Add error raising if stat() returns error. Replaced strcmp() calls by
>     g_str_equal(). Add a comment explaining why UFSRESUME isn't necessary.
> 4: Replace #elifdef by #elif defined().
> 5: Now the code doesn't move from one file to aanother but still is
>     moving inside file so the patch doesn't become easier to review. =(
>     Fixed typos.
> 6,7: New patches. Add guest-network-get-interfaces command support.
>
> Alexander Ivanov (7):
>    qga: Add initial FreeBSD support
>    qga: Move Linux-specific FS freeze/thaw code to a separate file
>    qga: Add UFS freeze/thaw support for FreeBSD
>    qga: Add shutdown/halt/reboot support for FreeBSD
>    qga: Add support for user password setting in FreeBSD
>    qga: Move HW address getting to a separate function
>    qga: Add HW address getting for FreeBSD
>
>   meson.build           |   2 +-
>   qga/channel-posix.c   |  19 ++
>   qga/commands-bsd.c    | 200 +++++++++++++
>   qga/commands-common.h |  51 ++++
>   qga/commands-linux.c  | 286 +++++++++++++++++++
>   qga/commands-posix.c  | 639 ++++++++++++++----------------------------
>   qga/main.c            |  13 +-
>   qga/meson.build       |   6 +
>   8 files changed, 778 insertions(+), 438 deletions(-)
>   create mode 100644 qga/commands-bsd.c
>   create mode 100644 qga/commands-linux.c
>


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAB45FEA04
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 10:02:55 +0200 (CEST)
Received: from localhost ([::1]:43584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojFee-0004UJ-Pm
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 04:02:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1ojFYI-0000hi-C4
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 03:56:18 -0400
Received: from mail-vi1eur05on2139.outbound.protection.outlook.com
 ([40.107.21.139]:15593 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1ojFY8-0001HC-Ko
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 03:56:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LBs+qyQAiNLAu3cdl3EUIN1rhVkw43TJGQbAAVWtUaOk1nZKACGWIFBiM6X8Gcqft8MisaNoWDImBKmfMv3xnE0aSYPlO8kiaiCbeeABskviAbPFFMOD5jJaogtLs9K+WBGhe/AuvRTYYw4XXLrCGPr2LZyI1lFF2PicIfw1HELI1LJeMq6l6yDATceiccAZfZAcmUA0kPVs0nxSU3FDSwxfRSv/h22EdiRixzIBF3X09Y3xoLd4FH8eMxaeSMB1CoQO7m5CeF54RxVexyaULv4Wl9wtuFfKmCnStSRt1I/DNY3xWeMhjgPL6Ep9CIinMWsDUp2gTYF2D97gB0TOeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/lC9v/QbJb5MygfOTM/HI4aHUgCZkSIt+KpQjapgWPQ=;
 b=eqLMuBB4PMjrukov577jW62HchOnYQScitZyWNrZFV2EDzhF9+r0bwQxVa7HZEMwNA1Uk6Lgh53tT93KAsIs+xJwo8odHY1dllD1UeyJSyXSYVqWHMTw6gKCLAISO4S58dJX70GoeknLFhibwIPorZUoSZ+G1t4Xqa/8XwoLPhSlY+CDhmlQvm3ltTGma3Wc1jCymjx8ZOneYPyIkoUvEbA6o6MIVp6t6q4hAsGlkrI53oKcW/yotPafwOtsgFnrPtSNrTgVS/RcJWmQtw4VulWDmmFcqbrB1J1LRO1I5OB69zedGRrh7uJMA6jIsnUOlwd1WazSlaWpetWC+nguSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/lC9v/QbJb5MygfOTM/HI4aHUgCZkSIt+KpQjapgWPQ=;
 b=w1B8ag0Liyo9Qw+jkWQuKLeFzaYYoMX7xpRg3BkNCr0O5kAe178S408/B63xr1OK0XQ0MlibeKcafQqdMdNuuKnDetsqzawzorKlxvRkf/O20+AzzTPMKeTews/42ksAisz55m0borQVWOddPYIALn4DObC9T8JwPjKWv2Es2IrixCbwptuOaqI9yOjm9PIQMpv7BPx5xCkFpzfbfOHF8Vir5JOd17thvBofuOKs52CjsBsZUk7otXIRErkgAJX5ATFl0gXqXVaioqB8DgMc+f0gXHhFjV/3BobuGYRItNcuExV7MDtMT2sW6vtnwc4XpIwUHUeFO03+D2UQBndwTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DU0PR08MB9439.eurprd08.prod.outlook.com (2603:10a6:10:42d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Fri, 14 Oct
 2022 07:55:58 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5676.040; Fri, 14 Oct 2022
 07:55:59 +0000
Content-Type: multipart/alternative;
 boundary="------------kef9lTL3EXLHOaHuTjeN57kJ"
Message-ID: <9cf110ea-f144-6e1d-fa00-703004768eca@virtuozzo.com>
Date: Fri, 14 Oct 2022 09:55:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Subject: Re: [PATCH v4 2/7] qga: Move Linux-specific FS freeze/thaw code to a
 separate file
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, den@virtuozzo.com, michael.roth@amd.com,
 kkostiuk@redhat.com
References: <20221013092326.2194646-1-alexander.ivanov@virtuozzo.com>
 <20221013092326.2194646-3-alexander.ivanov@virtuozzo.com>
 <CAJ+F1CJsb666pem8Jqyj0sk26w9fyGzPhvUMQ3UH77+79eGe7w@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAJ+F1CJsb666pem8Jqyj0sk26w9fyGzPhvUMQ3UH77+79eGe7w@mail.gmail.com>
X-ClientProxiedBy: FR0P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::16) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DU0PR08MB9439:EE_
X-MS-Office365-Filtering-Correlation-Id: e70f37d8-eda4-4454-ac44-08daadb9881f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GQJDoii2eLvbs+Bcis3Vz5mopi8McU5vPpG38Yd4Y8hXgEDa86mD7Dg0HPAdUE7g0XQjjLypkwjXBasZw405TLR3h+rNNhu6Oy/obflt6qdbG/GoULOj9BJUrNDFNDNPJqEJLqeb+i/oq5Sv1hy5P4NrN0zLCfd6DU0bWvxuOVI1LcA9SEZJCwu4JExjUaXMDQpvWHAozs7nNNhyDbLzEMF+XT65yy8QzHM5OzbMdM+mdm4mk1QAGYBBs9I/QSqwDBQ4xKXoLJzeraLGhWTgH61C85p3EDefqW8uLgh83p8oU0f4NuIGuECQ7cQxGtX/PQls9Ceo0d9D6poeK7Edn/TfXbmo7E0TFIKF3jVYCBugXurX26xT6ILIugXtoe0xgZZuGXq27o5iW/NcHZF2NMoHXaT3ISAwVKzHDyFRYBrPlii4Co9P76W8Uvs3EdBg64OE7NZzFDTDe1e+D3pzoXwxG7gbehLvWVgHMYre0OKqvexObDc/6vmFGva9JG5SR6RBXPwsSxN4/XFap+bRI+xNKu/PBB0mHqtXDiP5vwid/wbcpOBrFaCF4Z0dDlI74Gfw1JEo75F7E+Al+0XfkolWc13JJkpE7IXpAh3wIS5MdgKZRrF8Y26gEk0l9IyTYE6BdhbETpkOxZRN7OLLG7YscWjEQaPVzY33joMuEHUfdoaX3jyyfO8sUt7q384i/biq91PYuff6QiRLeuOQOanh3mVYD+MHzZYHvaKNQpIA8EmoEcl9F5U1ZP22819qncT5Y3oQm0dWycAVsWFyAqWFzA5ycTOEd6SytiggK0AGIsLWaLdASC21o/r6ewilddDJqTjX5OeAXTgmSJniOw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39850400004)(366004)(136003)(396003)(346002)(376002)(451199015)(31686004)(41300700001)(83380400001)(26005)(8936002)(316002)(66476007)(31696002)(8676002)(66946007)(66556008)(6916009)(186003)(2616005)(36756003)(2906002)(33964004)(86362001)(6512007)(52116002)(4326008)(53546011)(44832011)(6486002)(30864003)(38350700002)(6506007)(6666004)(5660300002)(38100700002)(478600001)(43740500002)(45980500001)(559001)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2dsNWxqUXJHU3F3Wm1GdFpYUHhQM3RpbnBFdkJJczJUOW5UNXdwUThZWDkx?=
 =?utf-8?B?N3c5Zi9hK01TazFBL0VtdFc3MGZEVWFZa0s3ZWVHNHhzMkdVTHQ0UDZXcWJ6?=
 =?utf-8?B?Vm9qYzJvVUNXZmNiQk9lS0wrVGZib1I5bnBGZGt1WXFlWGxNUk40Vk8vQ3BH?=
 =?utf-8?B?emx6N3VMeDhzbnV0UXhQY0hQRThNdDZFMjBnK1ZsNkIwWFZiaHV3ZFVaSUxJ?=
 =?utf-8?B?blIwUmNTQ1gvMDJseTFwVmRsTnBVSWRqalNXK3dMMms5RzJ3M0pqRi9mUU8w?=
 =?utf-8?B?Qlk1bmFaMlc1TGJGeVB0d1IrVGtnTFpOc3NpZlIxZWIvdVVmYkZYU3FqRzNn?=
 =?utf-8?B?WmU5NmxRUEJqVXVDcjBWZCt0aVByK1pScVVEMmdEbnVNcU1tNUx4Rjd1bUVK?=
 =?utf-8?B?Z0xHZm1yY0ViWUFlYTBaVG96TjlZb2JtQ0lDT1pGMEMzMVZZMENQMENRWVFk?=
 =?utf-8?B?citGTXJrWUpYVWZKNEl3VnBNTVh0QnZjaytKNEZibnlCVCswUEJCVmpPY1Mv?=
 =?utf-8?B?cmZCc2NWbjREbm8vV1AvZHNvMlJySmhqWU8rUFNiVForR05BL1RGaG5QYWo4?=
 =?utf-8?B?emJIRTFsb1VvdUZlTGZmMkJoa0pNY3M5QTlRWW5mT3VCL2lxRUJnL0laSG1p?=
 =?utf-8?B?OWgwZFAxREMzSzk0M1ZhZDV3RGNaazhSWWJkQXJoNDZ1QUJYOFlLVHJhZ2Q5?=
 =?utf-8?B?RVgyQTAwL2ZiN08rSUFqaDhpMEZhRU9XUm0yWDh2ckU4SmNldzk3OTBZY1Bl?=
 =?utf-8?B?dis5WUs0OTR0eU03c01rNU5sYjExZXBrNU1ONmZwOC9YODZsekxncGxEdkND?=
 =?utf-8?B?dU5ZR3Y4bXdzT2xiQ25POUVGaERBNTJXTklIVjlaa2JNV1ZSd1o3dUpzMDMr?=
 =?utf-8?B?dGwrbFBTdElmQlQzeTF2UXUyMWl0RTZXWWZaWXB2MERiV2hIcG1hVC9GamI2?=
 =?utf-8?B?VmNrVUZvVXdFRE5DaVFmNTI1MzczVWg3dHo2OUlSS1dHRFFHeDlCNmZkT05z?=
 =?utf-8?B?NjhGKzRvNVg2OFJuNlQyNkUxbUQvdG8yV0FBSllEOE5UY1lYeCtoS0h4dTZp?=
 =?utf-8?B?TnMyeHRnelA1OVRYUVFyTDJNMXVxTlFXMUxROEo3NTdrbk9YZmJHMnQ2QVJD?=
 =?utf-8?B?d2Uvbk9icExWTWRjbGt5SXZsc1hqR21jLzBBdDk0dURNV1dIR0ZQT2tGMXN3?=
 =?utf-8?B?YW5aMk1VdFZqTWJRRm5iVDNkVnR1NUVxZUVhaGJhTFRvR0NwSEY4MDFNeDg2?=
 =?utf-8?B?VmNoNHZ5V1RleDN2dEdRVjlnajJRd2RHSmcwTXdTSlhlYzFuRlNsK3Z4bWlS?=
 =?utf-8?B?NGp4ankwZ05jc2ZmSU5DelgvY212K2JCK3UyMmZ1STAyVHVtaWt2UklRWmgx?=
 =?utf-8?B?bGVLSVloUlJUSUZLbUU2Q1psVjlXaHV0Z0FUTjRFTXdnYm9HQm1oNVR4c0py?=
 =?utf-8?B?V1psOXhvektUcERVdmRTSnRjTitWS0o3WnZsK0Jyalc5OWxQRngrUTZTeVJG?=
 =?utf-8?B?UUJYWWRnWnE2dXVjQVNHbzdUbWVEZUlCOFNPdWRKU3VTb1g2cjVBcjMrL200?=
 =?utf-8?B?aGV4M2J4ajRHdm1uUWVuRWpPdHlXcEdSTWFPT2xNeHhKNG0waTdTSXorY0dB?=
 =?utf-8?B?Q2tTTmhtQkdLREZXMDJFMUtvdTBxYThPc3RQVFBDanpMZmJMSnpJYnVKUnRO?=
 =?utf-8?B?TW9SakowY3JVZ0lEeUI3ZTFweVgzL2Z5emlVdEw5UC93Z0w1UDBDbEM5YkEw?=
 =?utf-8?B?aXBicHZEUTQ4Z1ZCRWkyZUZ1TW94cDBtNFdKTVBIeFhwMk5Hd3hTRzBhYmNr?=
 =?utf-8?B?M011aldkdTlGRkpMOFVRK3RwNVIwVHBmaXcrZWprdzloRnV1U3J5eXJHS2Fi?=
 =?utf-8?B?aUo0bEhVR0kyTmdjcEx6RFFQL2hEbStiK0xsdDFTdk0zREhuUVZMMTEvZ0pq?=
 =?utf-8?B?QXBaS05BcUNkL0tCOXhyRG5nL2RsRGZLeTlteFdHTnQrekRpOGJDaGsrMy82?=
 =?utf-8?B?UmdWWlBETEFLaUxPdUZMNVp3M3hqdFNvdkdwTEk1N0EvZlNjMUwxMG0yamVW?=
 =?utf-8?B?M2ZUVFJnc0JUWXRLcHltaDZqZTk4VHpYYmhiOEZiYmNiNlY5d2xPa0dkbXo2?=
 =?utf-8?B?NzM3MGFpcUxlY2xCWE11ZWpxa2pCWEROT0JXZXc0S1o4NldzMytWUlNzS1R0?=
 =?utf-8?B?Unc9PQ==?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e70f37d8-eda4-4454-ac44-08daadb9881f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 07:55:59.2397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5QdKFNbQgKhajYqGS9eNhCmMOiit1rDtoltPlJvvBy0Y6VhTiiTkMyK0vLEefHTRooD5vCoILXkNZJLcVEq17Q/R4VIfCIt2oKA3F+o5EKQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9439
Received-SPF: pass client-ip=40.107.21.139;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-1.25, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------kef9lTL3EXLHOaHuTjeN57kJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi

On 13.10.2022 14:10, Marc-André Lureau wrote:
> Hi
>
> On Thu, Oct 13, 2022 at 1:23 PM Alexander Ivanov 
> <alexander.ivanov@virtuozzo.com> wrote:
>
>     In the next patches we are going to add FreeBSD support for QEMU Guest
>     Agent. In the result, code in commands-posix.c will be too cumbersome.
>
>     Move Linux-specific FS freeze/thaw code to a separate file
>     commands-linux.c
>     keeping common POSIX code in commands-posix.c.
>
>     Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
>     Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>     Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>     ---
>      qga/commands-common.h |  35 +++++
>      qga/commands-linux.c  | 286 +++++++++++++++++++++++++++++++++++++++++
>      qga/commands-posix.c  | 289
>     +++---------------------------------------
>      qga/meson.build       |   3 +
>      4 files changed, 340 insertions(+), 273 deletions(-)
>      create mode 100644 qga/commands-linux.c
>
>     diff --git a/qga/commands-common.h b/qga/commands-common.h
>     index d0e4a9696f..181fc330aa 100644
>     --- a/qga/commands-common.h
>     +++ b/qga/commands-common.h
>     @@ -10,6 +10,40 @@
>      #define QGA_COMMANDS_COMMON_H
>
>      #include "qga-qapi-types.h"
>     +#include "guest-agent-core.h"
>     +#include "qemu/queue.h"
>     +
>     +#if defined(__linux__)
>     +#include <linux/fs.h>
>     +#ifdef FIFREEZE
>     +#define CONFIG_FSFREEZE
>     +#endif
>     +#ifdef FITRIM
>     +#define CONFIG_FSTRIM
>     +#endif
>     +#endif /* __linux__ */
>     +
>     +#if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
>     +typedef struct FsMount {
>     +    char *dirname;
>     +    char *devtype;
>     +    unsigned int devmajor, devminor;
>     +    QTAILQ_ENTRY(FsMount) next;
>     +} FsMount;
>     +
>     +typedef QTAILQ_HEAD(FsMountList, FsMount) FsMountList;
>     +
>     +bool build_fs_mount_list(FsMountList *mounts, Error **errp);
>     +void free_fs_mount_list(FsMountList *mounts);
>     +#endif /* CONFIG_FSFREEZE || CONFIG_FSTRIM */
>     +
>     +#if defined(CONFIG_FSFREEZE)
>     +int64_t qmp_guest_fsfreeze_do_freeze_list(bool has_mountpoints,
>     +                                          strList *mountpoints,
>     +                                          FsMountList mounts,
>     +                                          Error **errp);
>     +int qmp_guest_fsfreeze_do_thaw(Error **errp);
>     +#endif /* CONFIG_FSFREEZE */
>
>      typedef struct GuestFileHandle GuestFileHandle;
>
>     @@ -29,4 +63,5 @@ GuestFileRead
>     *guest_file_read_unsafe(GuestFileHandle *gfh,
>       */
>      char *qga_get_host_name(Error **errp);
>
>     +void ga_wait_child(pid_t pid, int *status, Error **errp);
>
>
> This doesn't belong here, afaict.

What do you mean, this patch or this place in the header file?

I moved this function to the global scope because it was used in 
commands-posix.c

and commands-linux.c in the first version of the patchset. But now we 
can leave

the function static in commands-posix.c. Should I do it?

>
>      #endif
>     diff --git a/qga/commands-linux.c b/qga/commands-linux.c
>     new file mode 100644
>     index 0000000000..214e408fcd
>     --- /dev/null
>     +++ b/qga/commands-linux.c
>     @@ -0,0 +1,286 @@
>     +/*
>     + * QEMU Guest Agent Linux-specific command implementations
>     + *
>     + * Copyright IBM Corp. 2011
>     + *
>     + * Authors:
>     + *  Michael Roth      <mdroth@linux.vnet.ibm.com>
>     + *  Michal Privoznik  <mprivozn@redhat.com>
>     + *
>     + * This work is licensed under the terms of the GNU GPL, version
>     2 or later.
>     + * See the COPYING file in the top-level directory.
>     + */
>     +
>     +#include "qemu/osdep.h"
>     +#include "qapi/error.h"
>     +#include "commands-common.h"
>     +#include "cutils.h"
>     +#include <mntent.h>
>     +#include <sys/ioctl.h>
>     +
>     +#if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
>     +static int dev_major_minor(const char *devpath,
>     +                           unsigned int *devmajor, unsigned int
>     *devminor)
>     +{
>     +    struct stat st;
>     +
>     +    *devmajor = 0;
>     +    *devminor = 0;
>     +
>     +    if (stat(devpath, &st) < 0) {
>     +        slog("failed to stat device file '%s': %s", devpath,
>     strerror(errno));
>     +        return -1;
>     +    }
>     +    if (S_ISDIR(st.st_mode)) {
>     +        /* It is bind mount */
>     +        return -2;
>     +    }
>     +    if (S_ISBLK(st.st_mode)) {
>     +        *devmajor = major(st.st_rdev);
>     +        *devminor = minor(st.st_rdev);
>     +        return 0;
>     +    }
>     +    return -1;
>     +}
>     +
>     +static bool build_fs_mount_list_from_mtab(FsMountList *mounts,
>     Error **errp)
>     +{
>     +    struct mntent *ment;
>     +    FsMount *mount;
>     +    char const *mtab = "/proc/self/mounts";
>     +    FILE *fp;
>     +    unsigned int devmajor, devminor;
>     +
>     +    fp = setmntent(mtab, "r");
>     +    if (!fp) {
>     +        error_setg(errp, "failed to open mtab file: '%s'", mtab);
>     +        return false;
>     +    }
>     +
>     +    while ((ment = getmntent(fp))) {
>     +        /*
>     +         * An entry which device name doesn't start with a '/' is
>     +         * either a dummy file system or a network file system.
>     +         * Add special handling for smbfs and cifs as is done by
>     +         * coreutils as well.
>     +         */
>     +        if ((ment->mnt_fsname[0] != '/') ||
>     +            (strcmp(ment->mnt_type, "smbfs") == 0) ||
>     +            (strcmp(ment->mnt_type, "cifs") == 0)) {
>     +            continue;
>     +        }
>     +        if (dev_major_minor(ment->mnt_fsname, &devmajor,
>     &devminor) == -2) {
>     +            /* Skip bind mounts */
>     +            continue;
>     +        }
>     +
>     +        mount = g_new0(FsMount, 1);
>     +        mount->dirname = g_strdup(ment->mnt_dir);
>     +        mount->devtype = g_strdup(ment->mnt_type);
>     +        mount->devmajor = devmajor;
>     +        mount->devminor = devminor;
>     +
>     +        QTAILQ_INSERT_TAIL(mounts, mount, next);
>     +    }
>     +
>     +    endmntent(fp);
>     +    return true;
>     +}
>     +
>     +static void decode_mntname(char *name, int len)
>     +{
>     +    int i, j = 0;
>     +    for (i = 0; i <= len; i++) {
>     +        if (name[i] != '\\') {
>     +            name[j++] = name[i];
>     +        } else if (name[i + 1] == '\\') {
>     +            name[j++] = '\\';
>     +            i++;
>     +        } else if (name[i + 1] >= '0' && name[i + 1] <= '3' &&
>     +                   name[i + 2] >= '0' && name[i + 2] <= '7' &&
>     +                   name[i + 3] >= '0' && name[i + 3] <= '7') {
>     +            name[j++] = (name[i + 1] - '0') * 64 +
>     +                        (name[i + 2] - '0') * 8 +
>     +                        (name[i + 3] - '0');
>     +            i += 3;
>     +        } else {
>     +            name[j++] = name[i];
>     +        }
>     +    }
>     +}
>     +
>     +/*
>     + * Walk the mount table and build a list of local file systems
>     + */
>     +bool build_fs_mount_list(FsMountList *mounts, Error **errp)
>     +{
>     +    FsMount *mount;
>     +    char const *mountinfo = "/proc/self/mountinfo";
>     +    FILE *fp;
>     +    char *line = NULL, *dash;
>     +    size_t n;
>     +    char check;
>     +    unsigned int devmajor, devminor;
>     +    int ret, dir_s, dir_e, type_s, type_e, dev_s, dev_e;
>     +
>     +    fp = fopen(mountinfo, "r");
>     +    if (!fp) {
>     +        return build_fs_mount_list_from_mtab(mounts, errp);
>     +    }
>     +
>     +    while (getline(&line, &n, fp) != -1) {
>     +        ret = sscanf(line, "%*u %*u %u:%u %*s %n%*s%n%c",
>     +                     &devmajor, &devminor, &dir_s, &dir_e, &check);
>     +        if (ret < 3) {
>     +            continue;
>     +        }
>     +        dash = strstr(line + dir_e, " - ");
>     +        if (!dash) {
>     +            continue;
>     +        }
>     +        ret = sscanf(dash, " - %n%*s%n %n%*s%n%c",
>     +                     &type_s, &type_e, &dev_s, &dev_e, &check);
>     +        if (ret < 1) {
>     +            continue;
>     +        }
>     +        line[dir_e] = 0;
>     +        dash[type_e] = 0;
>     +        dash[dev_e] = 0;
>     +        decode_mntname(line + dir_s, dir_e - dir_s);
>     +        decode_mntname(dash + dev_s, dev_e - dev_s);
>     +        if (devmajor == 0) {
>     +            /* btrfs reports major number = 0 */
>     +            if (strcmp("btrfs", dash + type_s) != 0 ||
>     +                dev_major_minor(dash + dev_s, &devmajor,
>     &devminor) < 0) {
>     +                continue;
>     +            }
>     +        }
>     +
>     +        mount = g_new0(FsMount, 1);
>     +        mount->dirname = g_strdup(line + dir_s);
>     +        mount->devtype = g_strdup(dash + type_s);
>     +        mount->devmajor = devmajor;
>     +        mount->devminor = devminor;
>     +
>     +        QTAILQ_INSERT_TAIL(mounts, mount, next);
>     +    }
>     +    free(line);
>     +
>     +    fclose(fp);
>     +    return true;
>     +}
>     +#endif /* CONFIG_FSFREEZE || CONFIG_FSTRIM */
>     +
>     +#ifdef CONFIG_FSFREEZE
>     +/*
>     + * Walk list of mounted file systems in the guest, and freeze the
>     ones which
>     + * are real local file systems.
>     + */
>     +int64_t qmp_guest_fsfreeze_do_freeze_list(bool has_mountpoints,
>     +                                          strList *mountpoints,
>     +                                          FsMountList mounts,
>     +                                          Error **errp)
>     +{
>     +    struct FsMount *mount;
>     +    strList *list;
>     +    int fd, ret, i = 0;
>     +
>     +    QTAILQ_FOREACH_REVERSE(mount, &mounts, next) {
>     +        /* To issue fsfreeze in the reverse order of mounts,
>     check if the
>     +         * mount is listed in the list here */
>     +        if (has_mountpoints) {
>     +            for (list = mountpoints; list; list = list->next) {
>     +                if (strcmp(list->value, mount->dirname) == 0) {
>     +                    break;
>     +                }
>     +            }
>     +            if (!list) {
>     +                continue;
>     +            }
>     +        }
>     +
>     +        fd = qga_open_cloexec(mount->dirname, O_RDONLY, 0);
>     +        if (fd == -1) {
>     +            error_setg_errno(errp, errno, "failed to open %s",
>     mount->dirname);
>     +            return -1;
>     +        }
>     +
>     +        /* we try to cull filesystems we know won't work in
>     advance, but other
>     +         * filesystems may not implement fsfreeze for less
>     obvious reasons.
>     +         * these will report EOPNOTSUPP. we simply ignore these
>     when tallying
>     +         * the number of frozen filesystems.
>     +         * if a filesystem is mounted more than once (aka bind
>     mount) a
>     +         * consecutive attempt to freeze an already frozen
>     filesystem will
>     +         * return EBUSY.
>     +         *
>     +         * any other error means a failure to freeze a filesystem we
>     +         * expect to be freezable, so return an error in those cases
>     +         * and return system to thawed state.
>     +         */
>     +        ret = ioctl(fd, FIFREEZE);
>     +        if (ret == -1) {
>     +            if (errno != EOPNOTSUPP && errno != EBUSY) {
>     +                error_setg_errno(errp, errno, "failed to freeze %s",
>     +                                 mount->dirname);
>     +                close(fd);
>     +                return -1;
>     +            }
>     +        } else {
>     +            i++;
>     +        }
>     +        close(fd);
>     +    }
>     +    return i;
>     +}
>     +
>     +int qmp_guest_fsfreeze_do_thaw(Error **errp)
>     +{
>     +    int ret;
>     +    FsMountList mounts;
>     +    FsMount *mount;
>     +    int fd, i = 0, logged;
>     +    Error *local_err = NULL;
>     +
>     +    QTAILQ_INIT(&mounts);
>     +    if (!build_fs_mount_list(&mounts, &local_err)) {
>     +        error_propagate(errp, local_err);
>     +        return -1;
>     +    }
>     +
>     +    QTAILQ_FOREACH(mount, &mounts, next) {
>     +        logged = false;
>     +        fd = qga_open_cloexec(mount->dirname, O_RDONLY, 0);
>     +        if (fd == -1) {
>     +            continue;
>     +        }
>     +        /* we have no way of knowing whether a filesystem was
>     actually unfrozen
>     +         * as a result of a successful call to FITHAW, only that
>     if an error
>     +         * was returned the filesystem was *not* unfrozen by that
>     particular
>     +         * call.
>     +         *
>     +         * since multiple preceding FIFREEZEs require multiple
>     calls to FITHAW
>     +         * to unfreeze, continuing issuing FITHAW until an error
>     is returned,
>     +         * in which case either the filesystem is in an
>     unfreezable state, or,
>     +         * more likely, it was thawed previously (and remains so
>     afterward).
>     +         *
>     +         * also, since the most recent successful call is the one
>     that did
>     +         * the actual unfreeze, we can use this to provide an
>     accurate count
>     +         * of the number of filesystems unfrozen by
>     guest-fsfreeze-thaw, which
>     +         * may * be useful for determining whether a filesystem
>     was unfrozen
>     +         * during the freeze/thaw phase by a process other than
>     qemu-ga.
>     +         */
>     +        do {
>     +            ret = ioctl(fd, FITHAW);
>     +            if (ret == 0 && !logged) {
>     +                i++;
>     +                logged = true;
>     +            }
>     +        } while (ret == 0);
>     +        close(fd);
>     +    }
>     +
>     +    free_fs_mount_list(&mounts);
>     +
>     +    return i;
>     +}
>     +#endif /* CONFIG_FSFREEZE */
>     diff --git a/qga/commands-posix.c b/qga/commands-posix.c
>     index 16d67e9f6d..9574b83c92 100644
>     --- a/qga/commands-posix.c
>     +++ b/qga/commands-posix.c
>     @@ -16,11 +16,9 @@
>      #include <sys/utsname.h>
>      #include <sys/wait.h>
>      #include <dirent.h>
>     -#include "guest-agent-core.h"
>      #include "qga-qapi-commands.h"
>      #include "qapi/error.h"
>      #include "qapi/qmp/qerror.h"
>     -#include "qemu/queue.h"
>      #include "qemu/host-utils.h"
>      #include "qemu/sockets.h"
>      #include "qemu/base64.h"
>     @@ -70,7 +68,7 @@
>      #endif
>      #endif
>
>     -static void ga_wait_child(pid_t pid, int *status, Error **errp)
>     +void ga_wait_child(pid_t pid, int *status, Error **errp)
>      {
>          pid_t rpid;
>
>     @@ -629,16 +627,7 @@ void qmp_guest_file_flush(int64_t handle,
>     Error **errp)
>      #if defined(__linux__)
>
>      #if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
>     -typedef struct FsMount {
>     -    char *dirname;
>     -    char *devtype;
>     -    unsigned int devmajor, devminor;
>     -    QTAILQ_ENTRY(FsMount) next;
>     -} FsMount;
>     -
>     -typedef QTAILQ_HEAD(FsMountList, FsMount) FsMountList;
>     -
>     -static void free_fs_mount_list(FsMountList *mounts)
>     +void free_fs_mount_list(FsMountList *mounts)
>      {
>           FsMount *mount, *temp;
>
>     @@ -653,157 +642,6 @@ static void free_fs_mount_list(FsMountList
>     *mounts)
>               g_free(mount);
>           }
>      }
>     -
>     -static int dev_major_minor(const char *devpath,
>     -                           unsigned int *devmajor, unsigned int
>     *devminor)
>     -{
>     -    struct stat st;
>     -
>     -    *devmajor = 0;
>     -    *devminor = 0;
>     -
>     -    if (stat(devpath, &st) < 0) {
>     -        slog("failed to stat device file '%s': %s", devpath,
>     strerror(errno));
>     -        return -1;
>     -    }
>     -    if (S_ISDIR(st.st_mode)) {
>     -        /* It is bind mount */
>     -        return -2;
>     -    }
>     -    if (S_ISBLK(st.st_mode)) {
>     -        *devmajor = major(st.st_rdev);
>     -        *devminor = minor(st.st_rdev);
>     -        return 0;
>     -    }
>     -    return -1;
>     -}
>     -
>     -/*
>     - * Walk the mount table and build a list of local file systems
>     - */
>     -static bool build_fs_mount_list_from_mtab(FsMountList *mounts,
>     Error **errp)
>     -{
>     -    struct mntent *ment;
>     -    FsMount *mount;
>     -    char const *mtab = "/proc/self/mounts";
>     -    FILE *fp;
>     -    unsigned int devmajor, devminor;
>     -
>     -    fp = setmntent(mtab, "r");
>     -    if (!fp) {
>     -        error_setg(errp, "failed to open mtab file: '%s'", mtab);
>     -        return false;
>     -    }
>     -
>     -    while ((ment = getmntent(fp))) {
>     -        /*
>     -         * An entry which device name doesn't start with a '/' is
>     -         * either a dummy file system or a network file system.
>     -         * Add special handling for smbfs and cifs as is done by
>     -         * coreutils as well.
>     -         */
>     -        if ((ment->mnt_fsname[0] != '/') ||
>     -            (strcmp(ment->mnt_type, "smbfs") == 0) ||
>     -            (strcmp(ment->mnt_type, "cifs") == 0)) {
>     -            continue;
>     -        }
>     -        if (dev_major_minor(ment->mnt_fsname, &devmajor,
>     &devminor) == -2) {
>     -            /* Skip bind mounts */
>     -            continue;
>     -        }
>     -
>     -        mount = g_new0(FsMount, 1);
>     -        mount->dirname = g_strdup(ment->mnt_dir);
>     -        mount->devtype = g_strdup(ment->mnt_type);
>     -        mount->devmajor = devmajor;
>     -        mount->devminor = devminor;
>     -
>     -        QTAILQ_INSERT_TAIL(mounts, mount, next);
>     -    }
>     -
>     -    endmntent(fp);
>     -    return true;
>     -}
>     -
>     -static void decode_mntname(char *name, int len)
>     -{
>     -    int i, j = 0;
>     -    for (i = 0; i <= len; i++) {
>     -        if (name[i] != '\\') {
>     -            name[j++] = name[i];
>     -        } else if (name[i + 1] == '\\') {
>     -            name[j++] = '\\';
>     -            i++;
>     -        } else if (name[i + 1] >= '0' && name[i + 1] <= '3' &&
>     -                   name[i + 2] >= '0' && name[i + 2] <= '7' &&
>     -                   name[i + 3] >= '0' && name[i + 3] <= '7') {
>     -            name[j++] = (name[i + 1] - '0') * 64 +
>     -                        (name[i + 2] - '0') * 8 +
>     -                        (name[i + 3] - '0');
>     -            i += 3;
>     -        } else {
>     -            name[j++] = name[i];
>     -        }
>     -    }
>     -}
>     -
>     -static bool build_fs_mount_list(FsMountList *mounts, Error **errp)
>     -{
>     -    FsMount *mount;
>     -    char const *mountinfo = "/proc/self/mountinfo";
>     -    FILE *fp;
>     -    char *line = NULL, *dash;
>     -    size_t n;
>     -    char check;
>     -    unsigned int devmajor, devminor;
>     -    int ret, dir_s, dir_e, type_s, type_e, dev_s, dev_e;
>     -
>     -    fp = fopen(mountinfo, "r");
>     -    if (!fp) {
>     -        return build_fs_mount_list_from_mtab(mounts, errp);
>     -    }
>     -
>     -    while (getline(&line, &n, fp) != -1) {
>     -        ret = sscanf(line, "%*u %*u %u:%u %*s %n%*s%n%c",
>     -                     &devmajor, &devminor, &dir_s, &dir_e, &check);
>     -        if (ret < 3) {
>     -            continue;
>     -        }
>     -        dash = strstr(line + dir_e, " - ");
>     -        if (!dash) {
>     -            continue;
>     -        }
>     -        ret = sscanf(dash, " - %n%*s%n %n%*s%n%c",
>     -                     &type_s, &type_e, &dev_s, &dev_e, &check);
>     -        if (ret < 1) {
>     -            continue;
>     -        }
>     -        line[dir_e] = 0;
>     -        dash[type_e] = 0;
>     -        dash[dev_e] = 0;
>     -        decode_mntname(line + dir_s, dir_e - dir_s);
>     -        decode_mntname(dash + dev_s, dev_e - dev_s);
>     -        if (devmajor == 0) {
>     -            /* btrfs reports major number = 0 */
>     -            if (strcmp("btrfs", dash + type_s) != 0 ||
>     -                dev_major_minor(dash + dev_s, &devmajor,
>     &devminor) < 0) {
>     -                continue;
>     -            }
>     -        }
>     -
>     -        mount = g_new0(FsMount, 1);
>     -        mount->dirname = g_strdup(line + dir_s);
>     -        mount->devtype = g_strdup(dash + type_s);
>     -        mount->devmajor = devmajor;
>     -        mount->devminor = devminor;
>     -
>     -        QTAILQ_INSERT_TAIL(mounts, mount, next);
>     -    }
>     -    free(line);
>     -
>     -    fclose(fp);
>     -    return true;
>     -}
>      #endif
>
>      #if defined(CONFIG_FSFREEZE)
>     @@ -1708,20 +1546,13 @@ int64_t qmp_guest_fsfreeze_freeze(Error
>     **errp)
>          return qmp_guest_fsfreeze_freeze_list(false, NULL, errp);
>      }
>
>     -/*
>     - * Walk list of mounted file systems in the guest, and freeze the
>     ones which
>     - * are real local file systems.
>     - */
>      int64_t qmp_guest_fsfreeze_freeze_list(bool has_mountpoints,
>                                             strList *mountpoints,
>                                             Error **errp)
>      {
>     -    int ret = 0, i = 0;
>     -    strList *list;
>     +    int ret;
>          FsMountList mounts;
>     -    struct FsMount *mount;
>          Error *local_err = NULL;
>     -    int fd;
>
>          slog("guest-fsfreeze called");
>
>     @@ -1740,122 +1571,34 @@ int64_t
>     qmp_guest_fsfreeze_freeze_list(bool has_mountpoints,
>          /* cannot risk guest agent blocking itself on a write in this
>     state */
>          ga_set_frozen(ga_state);
>
>     -    QTAILQ_FOREACH_REVERSE(mount, &mounts, next) {
>     -        /* To issue fsfreeze in the reverse order of mounts,
>     check if the
>     -         * mount is listed in the list here */
>     -        if (has_mountpoints) {
>     -            for (list = mountpoints; list; list = list->next) {
>     -                if (strcmp(list->value, mount->dirname) == 0) {
>     -                    break;
>     -                }
>     -            }
>     -            if (!list) {
>     -                continue;
>     -            }
>     -        }
>     -
>     -        fd = qga_open_cloexec(mount->dirname, O_RDONLY, 0);
>     -        if (fd == -1) {
>     -            error_setg_errno(errp, errno, "failed to open %s",
>     mount->dirname);
>     -            goto error;
>     -        }
>     -
>     -        /* we try to cull filesystems we know won't work in
>     advance, but other
>     -         * filesystems may not implement fsfreeze for less
>     obvious reasons.
>     -         * these will report EOPNOTSUPP. we simply ignore these
>     when tallying
>     -         * the number of frozen filesystems.
>     -         * if a filesystem is mounted more than once (aka bind
>     mount) a
>     -         * consecutive attempt to freeze an already frozen
>     filesystem will
>     -         * return EBUSY.
>     -         *
>     -         * any other error means a failure to freeze a filesystem we
>     -         * expect to be freezable, so return an error in those cases
>     -         * and return system to thawed state.
>     -         */
>     -        ret = ioctl(fd, FIFREEZE);
>     -        if (ret == -1) {
>     -            if (errno != EOPNOTSUPP && errno != EBUSY) {
>     -                error_setg_errno(errp, errno, "failed to freeze %s",
>     -                                 mount->dirname);
>     -                close(fd);
>     -                goto error;
>     -            }
>     -        } else {
>     -            i++;
>     -        }
>     -        close(fd);
>     -    }
>     +    ret = qmp_guest_fsfreeze_do_freeze_list(has_mountpoints,
>     mountpoints,
>     +                                            mounts, errp);
>
>          free_fs_mount_list(&mounts);
>          /* We may not issue any FIFREEZE here.
>           * Just unset ga_state here and ready for the next call.
>           */
>     -    if (i == 0) {
>     +    if (ret == 0) {
>              ga_unset_frozen(ga_state);
>     +    } else if (ret < 0) {
>     +        qmp_guest_fsfreeze_thaw(NULL);
>          }
>     -    return i;
>     -
>     -error:
>     -    free_fs_mount_list(&mounts);
>     -    qmp_guest_fsfreeze_thaw(NULL);
>     -    return 0;
>     +    return ret;
>      }
>
>     -/*
>     - * Walk list of frozen file systems in the guest, and thaw them.
>     - */
>      int64_t qmp_guest_fsfreeze_thaw(Error **errp)
>      {
>          int ret;
>     -    FsMountList mounts;
>     -    FsMount *mount;
>     -    int fd, i = 0, logged;
>     -    Error *local_err = NULL;
>
>     -    QTAILQ_INIT(&mounts);
>     -    if (!build_fs_mount_list(&mounts, &local_err)) {
>     -        error_propagate(errp, local_err);
>     -        return 0;
>     +    ret = qmp_guest_fsfreeze_do_thaw(errp);
>     +    if (ret >= 0) {
>     +        ga_unset_frozen(ga_state);
>     +        execute_fsfreeze_hook(FSFREEZE_HOOK_THAW, errp);
>     +    } else {
>     +        ret = 0;
>          }
>
>     -    QTAILQ_FOREACH(mount, &mounts, next) {
>     -        logged = false;
>     -        fd = qga_open_cloexec(mount->dirname, O_RDONLY, 0);
>     -        if (fd == -1) {
>     -            continue;
>     -        }
>     -        /* we have no way of knowing whether a filesystem was
>     actually unfrozen
>     -         * as a result of a successful call to FITHAW, only that
>     if an error
>     -         * was returned the filesystem was *not* unfrozen by that
>     particular
>     -         * call.
>     -         *
>     -         * since multiple preceding FIFREEZEs require multiple
>     calls to FITHAW
>     -         * to unfreeze, continuing issuing FITHAW until an error
>     is returned,
>     -         * in which case either the filesystem is in an
>     unfreezable state, or,
>     -         * more likely, it was thawed previously (and remains so
>     afterward).
>     -         *
>     -         * also, since the most recent successful call is the one
>     that did
>     -         * the actual unfreeze, we can use this to provide an
>     accurate count
>     -         * of the number of filesystems unfrozen by
>     guest-fsfreeze-thaw, which
>     -         * may * be useful for determining whether a filesystem
>     was unfrozen
>     -         * during the freeze/thaw phase by a process other than
>     qemu-ga.
>     -         */
>     -        do {
>     -            ret = ioctl(fd, FITHAW);
>     -            if (ret == 0 && !logged) {
>     -                i++;
>     -                logged = true;
>     -            }
>     -        } while (ret == 0);
>     -        close(fd);
>     -    }
>     -
>     -    ga_unset_frozen(ga_state);
>     -    free_fs_mount_list(&mounts);
>     -
>     -    execute_fsfreeze_hook(FSFREEZE_HOOK_THAW, errp);
>     -
>     -    return i;
>     +    return ret;
>      }
>
>      static void guest_fsfreeze_cleanup(void)
>     diff --git a/qga/meson.build b/qga/meson.build
>     index a0ffd6d268..932b4e7ca8 100644
>     --- a/qga/meson.build
>     +++ b/qga/meson.build
>     @@ -72,6 +72,9 @@ qga_ss.add(when: 'CONFIG_POSIX', if_true: files(
>        'commands-posix.c',
>        'commands-posix-ssh.c',
>      ))
>     +qga_ss.add(when: 'CONFIG_LINUX', if_true: files(
>     +  'commands-linux.c',
>     +))
>      qga_ss.add(when: 'CONFIG_WIN32', if_true: files(
>        'channel-win32.c',
>        'commands-win32.c',
>     -- 
>     2.34.1
>
>
>
> -- 
> Marc-André Lureau
--------------kef9lTL3EXLHOaHuTjeN57kJ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi<br>
    </p>
    <div class="moz-cite-prefix">On 13.10.2022 14:10, Marc-André Lureau
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CAJ+F1CJsb666pem8Jqyj0sk26w9fyGzPhvUMQ3UH77+79eGe7w@mail.gmail.com">
      
      <div dir="ltr">
        <div dir="ltr">Hi<br>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Thu, Oct 13, 2022 at 1:23
            PM Alexander Ivanov &lt;<a href="mailto:alexander.ivanov@virtuozzo.com" moz-do-not-send="true" class="moz-txt-link-freetext">alexander.ivanov@virtuozzo.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">In the next patches we
            are going to add FreeBSD support for QEMU Guest<br>
            Agent. In the result, code in commands-posix.c will be too
            cumbersome.<br>
            <br>
            Move Linux-specific FS freeze/thaw code to a separate file
            commands-linux.c<br>
            keeping common POSIX code in commands-posix.c.<br>
            <br>
            Reviewed-by: Konstantin Kostiuk &lt;<a href="mailto:kkostiuk@redhat.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">kkostiuk@redhat.com</a>&gt;<br>
            Reviewed-by: Marc-André Lureau &lt;<a href="mailto:marcandre.lureau@redhat.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">marcandre.lureau@redhat.com</a>&gt;<br>
            Signed-off-by: Alexander Ivanov &lt;<a href="mailto:alexander.ivanov@virtuozzo.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">alexander.ivanov@virtuozzo.com</a>&gt;<br>
            ---<br>
            &nbsp;qga/commands-common.h |&nbsp; 35 +++++<br>
            &nbsp;qga/commands-linux.c&nbsp; | 286
            +++++++++++++++++++++++++++++++++++++++++<br>
            &nbsp;qga/commands-posix.c&nbsp; | 289
            +++---------------------------------------<br>
            &nbsp;qga/meson.build&nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; &nbsp;3 +<br>
            &nbsp;4 files changed, 340 insertions(+), 273 deletions(-)<br>
            &nbsp;create mode 100644 qga/commands-linux.c<br>
            <br>
            diff --git a/qga/commands-common.h b/qga/commands-common.h<br>
            index d0e4a9696f..181fc330aa 100644<br>
            --- a/qga/commands-common.h<br>
            +++ b/qga/commands-common.h<br>
            @@ -10,6 +10,40 @@<br>
            &nbsp;#define QGA_COMMANDS_COMMON_H<br>
            <br>
            &nbsp;#include &quot;qga-qapi-types.h&quot;<br>
            +#include &quot;guest-agent-core.h&quot;<br>
            +#include &quot;qemu/queue.h&quot;<br>
            +<br>
            +#if defined(__linux__)<br>
            +#include &lt;linux/fs.h&gt;<br>
            +#ifdef FIFREEZE<br>
            +#define CONFIG_FSFREEZE<br>
            +#endif<br>
            +#ifdef FITRIM<br>
            +#define CONFIG_FSTRIM<br>
            +#endif<br>
            +#endif /* __linux__ */<br>
            +<br>
            +#if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)<br>
            +typedef struct FsMount {<br>
            +&nbsp; &nbsp; char *dirname;<br>
            +&nbsp; &nbsp; char *devtype;<br>
            +&nbsp; &nbsp; unsigned int devmajor, devminor;<br>
            +&nbsp; &nbsp; QTAILQ_ENTRY(FsMount) next;<br>
            +} FsMount;<br>
            +<br>
            +typedef QTAILQ_HEAD(FsMountList, FsMount) FsMountList;<br>
            +<br>
            +bool build_fs_mount_list(FsMountList *mounts, Error
            **errp);<br>
            +void free_fs_mount_list(FsMountList *mounts);<br>
            +#endif /* CONFIG_FSFREEZE || CONFIG_FSTRIM */<br>
            +<br>
            +#if defined(CONFIG_FSFREEZE)<br>
            +int64_t qmp_guest_fsfreeze_do_freeze_list(bool
            has_mountpoints,<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; strList
            *mountpoints,<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; FsMountList
            mounts,<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Error **errp);<br>
            +int qmp_guest_fsfreeze_do_thaw(Error **errp);<br>
            +#endif /* CONFIG_FSFREEZE */<br>
            <br>
            &nbsp;typedef struct GuestFileHandle GuestFileHandle;<br>
            <br>
            @@ -29,4 +63,5 @@ GuestFileRead
            *guest_file_read_unsafe(GuestFileHandle *gfh,<br>
            &nbsp; */<br>
            &nbsp;char *qga_get_host_name(Error **errp);<br>
            <br>
            +void ga_wait_child(pid_t pid, int *status, Error **errp);<br>
          </blockquote>
          <div><br>
          </div>
          <div>This doesn't belong here, afaict.</div>
        </div>
      </div>
    </blockquote>
    <p>What do you mean, this patch or this place in the header file?</p>
    <p>I moved this function to the global scope because it was used in
      commands-posix.c</p>
    <p>and commands-linux.c in the first version of the patchset. But
      now we can leave</p>
    <p>the function static in commands-posix.c. Should I do it?<br>
    </p>
    <blockquote type="cite" cite="mid:CAJ+F1CJsb666pem8Jqyj0sk26w9fyGzPhvUMQ3UH77+79eGe7w@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <div>&nbsp;</div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex"> &nbsp;#endif<br>
            diff --git a/qga/commands-linux.c b/qga/commands-linux.c<br>
            new file mode 100644<br>
            index 0000000000..214e408fcd<br>
            --- /dev/null<br>
            +++ b/qga/commands-linux.c<br>
            @@ -0,0 +1,286 @@<br>
            +/*<br>
            + * QEMU Guest Agent Linux-specific command implementations<br>
            + *<br>
            + * Copyright IBM Corp. 2011<br>
            + *<br>
            + * Authors:<br>
            + *&nbsp; Michael Roth&nbsp; &nbsp; &nbsp; &lt;<a href="mailto:mdroth@linux.vnet.ibm.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">mdroth@linux.vnet.ibm.com</a>&gt;<br>
            + *&nbsp; Michal Privoznik&nbsp; &lt;<a href="mailto:mprivozn@redhat.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">mprivozn@redhat.com</a>&gt;<br>
            + *<br>
            + * This work is licensed under the terms of the GNU GPL,
            version 2 or later.<br>
            + * See the COPYING file in the top-level directory.<br>
            + */<br>
            +<br>
            +#include &quot;qemu/osdep.h&quot;<br>
            +#include &quot;qapi/error.h&quot;<br>
            +#include &quot;commands-common.h&quot;<br>
            +#include &quot;cutils.h&quot;<br>
            +#include &lt;mntent.h&gt;<br>
            +#include &lt;sys/ioctl.h&gt;<br>
            +<br>
            +#if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)<br>
            +static int dev_major_minor(const char *devpath,<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsigned int *devmajor, unsigned
            int *devminor)<br>
            +{<br>
            +&nbsp; &nbsp; struct stat st;<br>
            +<br>
            +&nbsp; &nbsp; *devmajor = 0;<br>
            +&nbsp; &nbsp; *devminor = 0;<br>
            +<br>
            +&nbsp; &nbsp; if (stat(devpath, &amp;st) &lt; 0) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; slog(&quot;failed to stat device file '%s': %s&quot;,
            devpath, strerror(errno));<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; return -1;<br>
            +&nbsp; &nbsp; }<br>
            +&nbsp; &nbsp; if (S_ISDIR(st.st_mode)) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; /* It is bind mount */<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; return -2;<br>
            +&nbsp; &nbsp; }<br>
            +&nbsp; &nbsp; if (S_ISBLK(st.st_mode)) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; *devmajor = major(st.st_rdev);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; *devminor = minor(st.st_rdev);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; return 0;<br>
            +&nbsp; &nbsp; }<br>
            +&nbsp; &nbsp; return -1;<br>
            +}<br>
            +<br>
            +static bool build_fs_mount_list_from_mtab(FsMountList
            *mounts, Error **errp)<br>
            +{<br>
            +&nbsp; &nbsp; struct mntent *ment;<br>
            +&nbsp; &nbsp; FsMount *mount;<br>
            +&nbsp; &nbsp; char const *mtab = &quot;/proc/self/mounts&quot;;<br>
            +&nbsp; &nbsp; FILE *fp;<br>
            +&nbsp; &nbsp; unsigned int devmajor, devminor;<br>
            +<br>
            +&nbsp; &nbsp; fp = setmntent(mtab, &quot;r&quot;);<br>
            +&nbsp; &nbsp; if (!fp) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; error_setg(errp, &quot;failed to open mtab file: '%s'&quot;,
            mtab);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; return false;<br>
            +&nbsp; &nbsp; }<br>
            +<br>
            +&nbsp; &nbsp; while ((ment = getmntent(fp))) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; /*<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* An entry which device name doesn't start with a
            '/' is<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* either a dummy file system or a network file
            system.<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* Add special handling for smbfs and cifs as is
            done by<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* coreutils as well.<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*/<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; if ((ment-&gt;mnt_fsname[0] != '/') ||<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (strcmp(ment-&gt;mnt_type, &quot;smbfs&quot;) == 0) ||<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (strcmp(ment-&gt;mnt_type, &quot;cifs&quot;) == 0)) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; continue;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; }<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; if (dev_major_minor(ment-&gt;mnt_fsname,
            &amp;devmajor, &amp;devminor) == -2) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* Skip bind mounts */<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; continue;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; }<br>
            +<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; mount = g_new0(FsMount, 1);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; mount-&gt;dirname = g_strdup(ment-&gt;mnt_dir);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; mount-&gt;devtype = g_strdup(ment-&gt;mnt_type);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; mount-&gt;devmajor = devmajor;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; mount-&gt;devminor = devminor;<br>
            +<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; QTAILQ_INSERT_TAIL(mounts, mount, next);<br>
            +&nbsp; &nbsp; }<br>
            +<br>
            +&nbsp; &nbsp; endmntent(fp);<br>
            +&nbsp; &nbsp; return true;<br>
            +}<br>
            +<br>
            +static void decode_mntname(char *name, int len)<br>
            +{<br>
            +&nbsp; &nbsp; int i, j = 0;<br>
            +&nbsp; &nbsp; for (i = 0; i &lt;= len; i++) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; if (name[i] != '\\') {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; name[j++] = name[i];<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; } else if (name[i + 1] == '\\') {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; name[j++] = '\\';<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; i++;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; } else if (name[i + 1] &gt;= '0' &amp;&amp; name[i
            + 1] &lt;= '3' &amp;&amp;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;name[i + 2] &gt;= '0' &amp;&amp; name[i
            + 2] &lt;= '7' &amp;&amp;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;name[i + 3] &gt;= '0' &amp;&amp; name[i
            + 3] &lt;= '7') {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; name[j++] = (name[i + 1] - '0') * 64 +<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (name[i + 2] - '0') * 8 +<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (name[i + 3] - '0');<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; i += 3;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; } else {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; name[j++] = name[i];<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; }<br>
            +&nbsp; &nbsp; }<br>
            +}<br>
            +<br>
            +/*<br>
            + * Walk the mount table and build a list of local file
            systems<br>
            + */<br>
            +bool build_fs_mount_list(FsMountList *mounts, Error **errp)<br>
            +{<br>
            +&nbsp; &nbsp; FsMount *mount;<br>
            +&nbsp; &nbsp; char const *mountinfo = &quot;/proc/self/mountinfo&quot;;<br>
            +&nbsp; &nbsp; FILE *fp;<br>
            +&nbsp; &nbsp; char *line = NULL, *dash;<br>
            +&nbsp; &nbsp; size_t n;<br>
            +&nbsp; &nbsp; char check;<br>
            +&nbsp; &nbsp; unsigned int devmajor, devminor;<br>
            +&nbsp; &nbsp; int ret, dir_s, dir_e, type_s, type_e, dev_s, dev_e;<br>
            +<br>
            +&nbsp; &nbsp; fp = fopen(mountinfo, &quot;r&quot;);<br>
            +&nbsp; &nbsp; if (!fp) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; return build_fs_mount_list_from_mtab(mounts, errp);<br>
            +&nbsp; &nbsp; }<br>
            +<br>
            +&nbsp; &nbsp; while (getline(&amp;line, &amp;n, fp) != -1) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; ret = sscanf(line, &quot;%*u %*u %u:%u %*s %n%*s%n%c&quot;,<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;devmajor, &amp;devminor,
            &amp;dir_s, &amp;dir_e, &amp;check);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; if (ret &lt; 3) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; continue;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; }<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; dash = strstr(line + dir_e, &quot; - &quot;);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; if (!dash) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; continue;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; }<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; ret = sscanf(dash, &quot; - %n%*s%n %n%*s%n%c&quot;,<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;type_s, &amp;type_e, &amp;dev_s,
            &amp;dev_e, &amp;check);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; if (ret &lt; 1) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; continue;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; }<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; line[dir_e] = 0;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; dash[type_e] = 0;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; dash[dev_e] = 0;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; decode_mntname(line + dir_s, dir_e - dir_s);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; decode_mntname(dash + dev_s, dev_e - dev_s);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; if (devmajor == 0) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* btrfs reports major number = 0 */<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (strcmp(&quot;btrfs&quot;, dash + type_s) != 0 ||<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dev_major_minor(dash + dev_s,
            &amp;devmajor, &amp;devminor) &lt; 0) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; continue;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; }<br>
            +<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; mount = g_new0(FsMount, 1);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; mount-&gt;dirname = g_strdup(line + dir_s);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; mount-&gt;devtype = g_strdup(dash + type_s);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; mount-&gt;devmajor = devmajor;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; mount-&gt;devminor = devminor;<br>
            +<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; QTAILQ_INSERT_TAIL(mounts, mount, next);<br>
            +&nbsp; &nbsp; }<br>
            +&nbsp; &nbsp; free(line);<br>
            +<br>
            +&nbsp; &nbsp; fclose(fp);<br>
            +&nbsp; &nbsp; return true;<br>
            +}<br>
            +#endif /* CONFIG_FSFREEZE || CONFIG_FSTRIM */<br>
            +<br>
            +#ifdef CONFIG_FSFREEZE<br>
            +/*<br>
            + * Walk list of mounted file systems in the guest, and
            freeze the ones which<br>
            + * are real local file systems.<br>
            + */<br>
            +int64_t qmp_guest_fsfreeze_do_freeze_list(bool
            has_mountpoints,<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; strList
            *mountpoints,<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; FsMountList
            mounts,<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Error **errp)<br>
            +{<br>
            +&nbsp; &nbsp; struct FsMount *mount;<br>
            +&nbsp; &nbsp; strList *list;<br>
            +&nbsp; &nbsp; int fd, ret, i = 0;<br>
            +<br>
            +&nbsp; &nbsp; QTAILQ_FOREACH_REVERSE(mount, &amp;mounts, next) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; /* To issue fsfreeze in the reverse order of
            mounts, check if the<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* mount is listed in the list here */<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; if (has_mountpoints) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; for (list = mountpoints; list; list =
            list-&gt;next) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (strcmp(list-&gt;value,
            mount-&gt;dirname) == 0) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; break;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (!list) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; continue;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; }<br>
            +<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; fd = qga_open_cloexec(mount-&gt;dirname, O_RDONLY,
            0);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; if (fd == -1) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; error_setg_errno(errp, errno, &quot;failed to open
            %s&quot;, mount-&gt;dirname);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return -1;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; }<br>
            +<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; /* we try to cull filesystems we know won't work in
            advance, but other<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* filesystems may not implement fsfreeze for less
            obvious reasons.<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* these will report EOPNOTSUPP. we simply ignore
            these when tallying<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* the number of frozen filesystems.<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* if a filesystem is mounted more than once (aka
            bind mount) a<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* consecutive attempt to freeze an already frozen
            filesystem will<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* return EBUSY.<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* any other error means a failure to freeze a
            filesystem we<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* expect to be freezable, so return an error in
            those cases<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* and return system to thawed state.<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*/<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; ret = ioctl(fd, FIFREEZE);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; if (ret == -1) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (errno != EOPNOTSUPP &amp;&amp; errno !=
            EBUSY) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; error_setg_errno(errp, errno, &quot;failed to
            freeze %s&quot;,<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mount-&gt;dirname);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; close(fd);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return -1;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; } else {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; i++;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; }<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; close(fd);<br>
            +&nbsp; &nbsp; }<br>
            +&nbsp; &nbsp; return i;<br>
            +}<br>
            +<br>
            +int qmp_guest_fsfreeze_do_thaw(Error **errp)<br>
            +{<br>
            +&nbsp; &nbsp; int ret;<br>
            +&nbsp; &nbsp; FsMountList mounts;<br>
            +&nbsp; &nbsp; FsMount *mount;<br>
            +&nbsp; &nbsp; int fd, i = 0, logged;<br>
            +&nbsp; &nbsp; Error *local_err = NULL;<br>
            +<br>
            +&nbsp; &nbsp; QTAILQ_INIT(&amp;mounts);<br>
            +&nbsp; &nbsp; if (!build_fs_mount_list(&amp;mounts, &amp;local_err))
            {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; error_propagate(errp, local_err);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; return -1;<br>
            +&nbsp; &nbsp; }<br>
            +<br>
            +&nbsp; &nbsp; QTAILQ_FOREACH(mount, &amp;mounts, next) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; logged = false;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; fd = qga_open_cloexec(mount-&gt;dirname, O_RDONLY,
            0);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; if (fd == -1) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; continue;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; }<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; /* we have no way of knowing whether a filesystem
            was actually unfrozen<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* as a result of a successful call to FITHAW, only
            that if an error<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* was returned the filesystem was *not* unfrozen
            by that particular<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* call.<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* since multiple preceding FIFREEZEs require
            multiple calls to FITHAW<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* to unfreeze, continuing issuing FITHAW until an
            error is returned,<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* in which case either the filesystem is in an
            unfreezable state, or,<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* more likely, it was thawed previously (and
            remains so afterward).<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* also, since the most recent successful call is
            the one that did<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* the actual unfreeze, we can use this to provide
            an accurate count<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* of the number of filesystems unfrozen by
            guest-fsfreeze-thaw, which<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* may * be useful for determining whether a
            filesystem was unfrozen<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* during the freeze/thaw phase by a process other
            than qemu-ga.<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*/<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; do {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ret = ioctl(fd, FITHAW);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (ret == 0 &amp;&amp; !logged) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; i++;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; logged = true;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; } while (ret == 0);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; close(fd);<br>
            +&nbsp; &nbsp; }<br>
            +<br>
            +&nbsp; &nbsp; free_fs_mount_list(&amp;mounts);<br>
            +<br>
            +&nbsp; &nbsp; return i;<br>
            +}<br>
            +#endif /* CONFIG_FSFREEZE */<br>
            diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
            index 16d67e9f6d..9574b83c92 100644<br>
            --- a/qga/commands-posix.c<br>
            +++ b/qga/commands-posix.c<br>
            @@ -16,11 +16,9 @@<br>
            &nbsp;#include &lt;sys/utsname.h&gt;<br>
            &nbsp;#include &lt;sys/wait.h&gt;<br>
            &nbsp;#include &lt;dirent.h&gt;<br>
            -#include &quot;guest-agent-core.h&quot;<br>
            &nbsp;#include &quot;qga-qapi-commands.h&quot;<br>
            &nbsp;#include &quot;qapi/error.h&quot;<br>
            &nbsp;#include &quot;qapi/qmp/qerror.h&quot;<br>
            -#include &quot;qemu/queue.h&quot;<br>
            &nbsp;#include &quot;qemu/host-utils.h&quot;<br>
            &nbsp;#include &quot;qemu/sockets.h&quot;<br>
            &nbsp;#include &quot;qemu/base64.h&quot;<br>
            @@ -70,7 +68,7 @@<br>
            &nbsp;#endif<br>
            &nbsp;#endif<br>
            <br>
            -static void ga_wait_child(pid_t pid, int *status, Error
            **errp)<br>
            +void ga_wait_child(pid_t pid, int *status, Error **errp)<br>
            &nbsp;{<br>
            &nbsp; &nbsp; &nbsp;pid_t rpid;<br>
            <br>
            @@ -629,16 +627,7 @@ void qmp_guest_file_flush(int64_t
            handle, Error **errp)<br>
            &nbsp;#if defined(__linux__)<br>
            <br>
            &nbsp;#if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)<br>
            -typedef struct FsMount {<br>
            -&nbsp; &nbsp; char *dirname;<br>
            -&nbsp; &nbsp; char *devtype;<br>
            -&nbsp; &nbsp; unsigned int devmajor, devminor;<br>
            -&nbsp; &nbsp; QTAILQ_ENTRY(FsMount) next;<br>
            -} FsMount;<br>
            -<br>
            -typedef QTAILQ_HEAD(FsMountList, FsMount) FsMountList;<br>
            -<br>
            -static void free_fs_mount_list(FsMountList *mounts)<br>
            +void free_fs_mount_list(FsMountList *mounts)<br>
            &nbsp;{<br>
            &nbsp; &nbsp; &nbsp; FsMount *mount, *temp;<br>
            <br>
            @@ -653,157 +642,6 @@ static void
            free_fs_mount_list(FsMountList *mounts)<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; g_free(mount);<br>
            &nbsp; &nbsp; &nbsp; }<br>
            &nbsp;}<br>
            -<br>
            -static int dev_major_minor(const char *devpath,<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsigned int *devmajor, unsigned
            int *devminor)<br>
            -{<br>
            -&nbsp; &nbsp; struct stat st;<br>
            -<br>
            -&nbsp; &nbsp; *devmajor = 0;<br>
            -&nbsp; &nbsp; *devminor = 0;<br>
            -<br>
            -&nbsp; &nbsp; if (stat(devpath, &amp;st) &lt; 0) {<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; slog(&quot;failed to stat device file '%s': %s&quot;,
            devpath, strerror(errno));<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; return -1;<br>
            -&nbsp; &nbsp; }<br>
            -&nbsp; &nbsp; if (S_ISDIR(st.st_mode)) {<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; /* It is bind mount */<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; return -2;<br>
            -&nbsp; &nbsp; }<br>
            -&nbsp; &nbsp; if (S_ISBLK(st.st_mode)) {<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; *devmajor = major(st.st_rdev);<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; *devminor = minor(st.st_rdev);<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; return 0;<br>
            -&nbsp; &nbsp; }<br>
            -&nbsp; &nbsp; return -1;<br>
            -}<br>
            -<br>
            -/*<br>
            - * Walk the mount table and build a list of local file
            systems<br>
            - */<br>
            -static bool build_fs_mount_list_from_mtab(FsMountList
            *mounts, Error **errp)<br>
            -{<br>
            -&nbsp; &nbsp; struct mntent *ment;<br>
            -&nbsp; &nbsp; FsMount *mount;<br>
            -&nbsp; &nbsp; char const *mtab = &quot;/proc/self/mounts&quot;;<br>
            -&nbsp; &nbsp; FILE *fp;<br>
            -&nbsp; &nbsp; unsigned int devmajor, devminor;<br>
            -<br>
            -&nbsp; &nbsp; fp = setmntent(mtab, &quot;r&quot;);<br>
            -&nbsp; &nbsp; if (!fp) {<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; error_setg(errp, &quot;failed to open mtab file: '%s'&quot;,
            mtab);<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; return false;<br>
            -&nbsp; &nbsp; }<br>
            -<br>
            -&nbsp; &nbsp; while ((ment = getmntent(fp))) {<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; /*<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* An entry which device name doesn't start with a
            '/' is<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* either a dummy file system or a network file
            system.<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* Add special handling for smbfs and cifs as is
            done by<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* coreutils as well.<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*/<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; if ((ment-&gt;mnt_fsname[0] != '/') ||<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (strcmp(ment-&gt;mnt_type, &quot;smbfs&quot;) == 0) ||<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (strcmp(ment-&gt;mnt_type, &quot;cifs&quot;) == 0)) {<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; continue;<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; }<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; if (dev_major_minor(ment-&gt;mnt_fsname,
            &amp;devmajor, &amp;devminor) == -2) {<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* Skip bind mounts */<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; continue;<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; }<br>
            -<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; mount = g_new0(FsMount, 1);<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; mount-&gt;dirname = g_strdup(ment-&gt;mnt_dir);<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; mount-&gt;devtype = g_strdup(ment-&gt;mnt_type);<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; mount-&gt;devmajor = devmajor;<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; mount-&gt;devminor = devminor;<br>
            -<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; QTAILQ_INSERT_TAIL(mounts, mount, next);<br>
            -&nbsp; &nbsp; }<br>
            -<br>
            -&nbsp; &nbsp; endmntent(fp);<br>
            -&nbsp; &nbsp; return true;<br>
            -}<br>
            -<br>
            -static void decode_mntname(char *name, int len)<br>
            -{<br>
            -&nbsp; &nbsp; int i, j = 0;<br>
            -&nbsp; &nbsp; for (i = 0; i &lt;= len; i++) {<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; if (name[i] != '\\') {<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; name[j++] = name[i];<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; } else if (name[i + 1] == '\\') {<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; name[j++] = '\\';<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; i++;<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; } else if (name[i + 1] &gt;= '0' &amp;&amp; name[i
            + 1] &lt;= '3' &amp;&amp;<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;name[i + 2] &gt;= '0' &amp;&amp; name[i
            + 2] &lt;= '7' &amp;&amp;<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;name[i + 3] &gt;= '0' &amp;&amp; name[i
            + 3] &lt;= '7') {<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; name[j++] = (name[i + 1] - '0') * 64 +<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (name[i + 2] - '0') * 8 +<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (name[i + 3] - '0');<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; i += 3;<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; } else {<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; name[j++] = name[i];<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; }<br>
            -&nbsp; &nbsp; }<br>
            -}<br>
            -<br>
            -static bool build_fs_mount_list(FsMountList *mounts, Error
            **errp)<br>
            -{<br>
            -&nbsp; &nbsp; FsMount *mount;<br>
            -&nbsp; &nbsp; char const *mountinfo = &quot;/proc/self/mountinfo&quot;;<br>
            -&nbsp; &nbsp; FILE *fp;<br>
            -&nbsp; &nbsp; char *line = NULL, *dash;<br>
            -&nbsp; &nbsp; size_t n;<br>
            -&nbsp; &nbsp; char check;<br>
            -&nbsp; &nbsp; unsigned int devmajor, devminor;<br>
            -&nbsp; &nbsp; int ret, dir_s, dir_e, type_s, type_e, dev_s, dev_e;<br>
            -<br>
            -&nbsp; &nbsp; fp = fopen(mountinfo, &quot;r&quot;);<br>
            -&nbsp; &nbsp; if (!fp) {<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; return build_fs_mount_list_from_mtab(mounts, errp);<br>
            -&nbsp; &nbsp; }<br>
            -<br>
            -&nbsp; &nbsp; while (getline(&amp;line, &amp;n, fp) != -1) {<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; ret = sscanf(line, &quot;%*u %*u %u:%u %*s %n%*s%n%c&quot;,<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;devmajor, &amp;devminor,
            &amp;dir_s, &amp;dir_e, &amp;check);<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; if (ret &lt; 3) {<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; continue;<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; }<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; dash = strstr(line + dir_e, &quot; - &quot;);<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; if (!dash) {<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; continue;<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; }<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; ret = sscanf(dash, &quot; - %n%*s%n %n%*s%n%c&quot;,<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;type_s, &amp;type_e, &amp;dev_s,
            &amp;dev_e, &amp;check);<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; if (ret &lt; 1) {<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; continue;<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; }<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; line[dir_e] = 0;<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; dash[type_e] = 0;<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; dash[dev_e] = 0;<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; decode_mntname(line + dir_s, dir_e - dir_s);<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; decode_mntname(dash + dev_s, dev_e - dev_s);<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; if (devmajor == 0) {<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* btrfs reports major number = 0 */<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (strcmp(&quot;btrfs&quot;, dash + type_s) != 0 ||<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dev_major_minor(dash + dev_s,
            &amp;devmajor, &amp;devminor) &lt; 0) {<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; continue;<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; }<br>
            -<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; mount = g_new0(FsMount, 1);<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; mount-&gt;dirname = g_strdup(line + dir_s);<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; mount-&gt;devtype = g_strdup(dash + type_s);<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; mount-&gt;devmajor = devmajor;<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; mount-&gt;devminor = devminor;<br>
            -<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; QTAILQ_INSERT_TAIL(mounts, mount, next);<br>
            -&nbsp; &nbsp; }<br>
            -&nbsp; &nbsp; free(line);<br>
            -<br>
            -&nbsp; &nbsp; fclose(fp);<br>
            -&nbsp; &nbsp; return true;<br>
            -}<br>
            &nbsp;#endif<br>
            <br>
            &nbsp;#if defined(CONFIG_FSFREEZE)<br>
            @@ -1708,20 +1546,13 @@ int64_t
            qmp_guest_fsfreeze_freeze(Error **errp)<br>
            &nbsp; &nbsp; &nbsp;return qmp_guest_fsfreeze_freeze_list(false, NULL,
            errp);<br>
            &nbsp;}<br>
            <br>
            -/*<br>
            - * Walk list of mounted file systems in the guest, and
            freeze the ones which<br>
            - * are real local file systems.<br>
            - */<br>
            &nbsp;int64_t qmp_guest_fsfreeze_freeze_list(bool
            has_mountpoints,<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; strList
            *mountpoints,<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Error **errp)<br>
            &nbsp;{<br>
            -&nbsp; &nbsp; int ret = 0, i = 0;<br>
            -&nbsp; &nbsp; strList *list;<br>
            +&nbsp; &nbsp; int ret;<br>
            &nbsp; &nbsp; &nbsp;FsMountList mounts;<br>
            -&nbsp; &nbsp; struct FsMount *mount;<br>
            &nbsp; &nbsp; &nbsp;Error *local_err = NULL;<br>
            -&nbsp; &nbsp; int fd;<br>
            <br>
            &nbsp; &nbsp; &nbsp;slog(&quot;guest-fsfreeze called&quot;);<br>
            <br>
            @@ -1740,122 +1571,34 @@ int64_t
            qmp_guest_fsfreeze_freeze_list(bool has_mountpoints,<br>
            &nbsp; &nbsp; &nbsp;/* cannot risk guest agent blocking itself on a write
            in this state */<br>
            &nbsp; &nbsp; &nbsp;ga_set_frozen(ga_state);<br>
            <br>
            -&nbsp; &nbsp; QTAILQ_FOREACH_REVERSE(mount, &amp;mounts, next) {<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; /* To issue fsfreeze in the reverse order of
            mounts, check if the<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* mount is listed in the list here */<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; if (has_mountpoints) {<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; for (list = mountpoints; list; list =
            list-&gt;next) {<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (strcmp(list-&gt;value,
            mount-&gt;dirname) == 0) {<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; break;<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (!list) {<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; continue;<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; }<br>
            -<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; fd = qga_open_cloexec(mount-&gt;dirname, O_RDONLY,
            0);<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; if (fd == -1) {<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; error_setg_errno(errp, errno, &quot;failed to open
            %s&quot;, mount-&gt;dirname);<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto error;<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; }<br>
            -<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; /* we try to cull filesystems we know won't work in
            advance, but other<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* filesystems may not implement fsfreeze for less
            obvious reasons.<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* these will report EOPNOTSUPP. we simply ignore
            these when tallying<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* the number of frozen filesystems.<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* if a filesystem is mounted more than once (aka
            bind mount) a<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* consecutive attempt to freeze an already frozen
            filesystem will<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* return EBUSY.<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* any other error means a failure to freeze a
            filesystem we<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* expect to be freezable, so return an error in
            those cases<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* and return system to thawed state.<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*/<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; ret = ioctl(fd, FIFREEZE);<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; if (ret == -1) {<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (errno != EOPNOTSUPP &amp;&amp; errno !=
            EBUSY) {<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; error_setg_errno(errp, errno, &quot;failed to
            freeze %s&quot;,<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mount-&gt;dirname);<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; close(fd);<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto error;<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; } else {<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; i++;<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; }<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; close(fd);<br>
            -&nbsp; &nbsp; }<br>
            +&nbsp; &nbsp; ret =
            qmp_guest_fsfreeze_do_freeze_list(has_mountpoints,
            mountpoints,<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; mounts, errp);<br>
            <br>
            &nbsp; &nbsp; &nbsp;free_fs_mount_list(&amp;mounts);<br>
            &nbsp; &nbsp; &nbsp;/* We may not issue any FIFREEZE here.<br>
            &nbsp; &nbsp; &nbsp; * Just unset ga_state here and ready for the next
            call.<br>
            &nbsp; &nbsp; &nbsp; */<br>
            -&nbsp; &nbsp; if (i == 0) {<br>
            +&nbsp; &nbsp; if (ret == 0) {<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ga_unset_frozen(ga_state);<br>
            +&nbsp; &nbsp; } else if (ret &lt; 0) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; qmp_guest_fsfreeze_thaw(NULL);<br>
            &nbsp; &nbsp; &nbsp;}<br>
            -&nbsp; &nbsp; return i;<br>
            -<br>
            -error:<br>
            -&nbsp; &nbsp; free_fs_mount_list(&amp;mounts);<br>
            -&nbsp; &nbsp; qmp_guest_fsfreeze_thaw(NULL);<br>
            -&nbsp; &nbsp; return 0;<br>
            +&nbsp; &nbsp; return ret;<br>
            &nbsp;}<br>
            <br>
            -/*<br>
            - * Walk list of frozen file systems in the guest, and thaw
            them.<br>
            - */<br>
            &nbsp;int64_t qmp_guest_fsfreeze_thaw(Error **errp)<br>
            &nbsp;{<br>
            &nbsp; &nbsp; &nbsp;int ret;<br>
            -&nbsp; &nbsp; FsMountList mounts;<br>
            -&nbsp; &nbsp; FsMount *mount;<br>
            -&nbsp; &nbsp; int fd, i = 0, logged;<br>
            -&nbsp; &nbsp; Error *local_err = NULL;<br>
            <br>
            -&nbsp; &nbsp; QTAILQ_INIT(&amp;mounts);<br>
            -&nbsp; &nbsp; if (!build_fs_mount_list(&amp;mounts, &amp;local_err))
            {<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; error_propagate(errp, local_err);<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; return 0;<br>
            +&nbsp; &nbsp; ret = qmp_guest_fsfreeze_do_thaw(errp);<br>
            +&nbsp; &nbsp; if (ret &gt;= 0) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; ga_unset_frozen(ga_state);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; execute_fsfreeze_hook(FSFREEZE_HOOK_THAW, errp);<br>
            +&nbsp; &nbsp; } else {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; ret = 0;<br>
            &nbsp; &nbsp; &nbsp;}<br>
            <br>
            -&nbsp; &nbsp; QTAILQ_FOREACH(mount, &amp;mounts, next) {<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; logged = false;<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; fd = qga_open_cloexec(mount-&gt;dirname, O_RDONLY,
            0);<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; if (fd == -1) {<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; continue;<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; }<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; /* we have no way of knowing whether a filesystem
            was actually unfrozen<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* as a result of a successful call to FITHAW, only
            that if an error<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* was returned the filesystem was *not* unfrozen
            by that particular<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* call.<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* since multiple preceding FIFREEZEs require
            multiple calls to FITHAW<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* to unfreeze, continuing issuing FITHAW until an
            error is returned,<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* in which case either the filesystem is in an
            unfreezable state, or,<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* more likely, it was thawed previously (and
            remains so afterward).<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* also, since the most recent successful call is
            the one that did<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* the actual unfreeze, we can use this to provide
            an accurate count<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* of the number of filesystems unfrozen by
            guest-fsfreeze-thaw, which<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* may * be useful for determining whether a
            filesystem was unfrozen<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* during the freeze/thaw phase by a process other
            than qemu-ga.<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*/<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; do {<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ret = ioctl(fd, FITHAW);<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (ret == 0 &amp;&amp; !logged) {<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; i++;<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; logged = true;<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; } while (ret == 0);<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; close(fd);<br>
            -&nbsp; &nbsp; }<br>
            -<br>
            -&nbsp; &nbsp; ga_unset_frozen(ga_state);<br>
            -&nbsp; &nbsp; free_fs_mount_list(&amp;mounts);<br>
            -<br>
            -&nbsp; &nbsp; execute_fsfreeze_hook(FSFREEZE_HOOK_THAW, errp);<br>
            -<br>
            -&nbsp; &nbsp; return i;<br>
            +&nbsp; &nbsp; return ret;<br>
            &nbsp;}<br>
            <br>
            &nbsp;static void guest_fsfreeze_cleanup(void)<br>
            diff --git a/qga/meson.build b/qga/meson.build<br>
            index a0ffd6d268..932b4e7ca8 100644<br>
            --- a/qga/meson.build<br>
            +++ b/qga/meson.build<br>
            @@ -72,6 +72,9 @@ qga_ss.add(when: 'CONFIG_POSIX', if_true:
            files(<br>
            &nbsp; &nbsp;'commands-posix.c',<br>
            &nbsp; &nbsp;'commands-posix-ssh.c',<br>
            &nbsp;))<br>
            +qga_ss.add(when: 'CONFIG_LINUX', if_true: files(<br>
            +&nbsp; 'commands-linux.c',<br>
            +))<br>
            &nbsp;qga_ss.add(when: 'CONFIG_WIN32', if_true: files(<br>
            &nbsp; &nbsp;'channel-win32.c',<br>
            &nbsp; &nbsp;'commands-win32.c',<br>
            -- <br>
            2.34.1<br>
            <br>
          </blockquote>
        </div>
        <br clear="all">
        <br>
        -- <br>
        <div dir="ltr" class="gmail_signature">Marc-André Lureau<br>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------kef9lTL3EXLHOaHuTjeN57kJ--


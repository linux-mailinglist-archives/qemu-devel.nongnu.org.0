Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4E92DFDB5
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 16:51:46 +0100 (CET)
Received: from localhost ([::1]:50294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krNTN-0003hY-4o
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 10:51:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1krNEp-0002Rz-T7
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 10:36:44 -0500
Received: from mail-am6eur05on2131.outbound.protection.outlook.com
 ([40.107.22.131]:1209 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1krNEl-00089P-OU
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 10:36:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HzRIfrO60BQk/b4T2FBWlMidt3sXpEmkHgOSITAmYnAzCoxD4qRef/yLQrMdOK1jTfobZ2VgrZl6rqrlSyQ1ZI2aU7g9/bu3cSEGvEaR5ohHX3aVpxQdTziArTVQoKcwK1KKIndmFbTkmwKV7JdnXkPfrUolYHzpQDJQtpf+vEOODzjiJhn46+9Yy9aCN7+gfiY+5XvKbHZDIzczFHcrs2KBXXmJ8GrcoHP8sxAAdN6bG1EjOSG2MgbANWHlwFd4Ud6Rv6d52qg5bBMOq5EiynhmC/XBDmscFpAOgc8WwHuwmNeF/1nxJFAndVgfWJ1R2AxiY3+GDlwUSV1gVbG/wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bd7WnZHWv8CHKTCsGLP/7BdJ7PmU/ELsxTaeYzpdoGs=;
 b=PDE2lzxPHA69eEyB6QIHh7veH4SoNq3+H48E0r2VM5LGkbBDTLxdqFY/Lzq28w19BrU2+MjQAZzvPnPPc4j2Zgw5cU9cvgUWdL9O2ZRHrHNzT27Ul0g6asHsFuzf+KnumBYEj71GuahWH9V8chABXJImdCQrYjFtl25XX+NMgLfTB10XUOxTErIdDQEHenTAsQeN7+WrnN7Z2/RU8lUrYbS0wgWo9gXVtxMQ+YK6jxXMcKrHaAXJ42KfPb2dcKZwRCJe64rLyjOqcqJ67wPrcMR1IUH/5ctIpAvs55f97bh276+9ehXCgKnk0ODsSFZ+mgKnipdUSG283qwmbdECkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bd7WnZHWv8CHKTCsGLP/7BdJ7PmU/ELsxTaeYzpdoGs=;
 b=J9upkzF1nNPdVJO8nd9sGLixCNTRhYqu+v06YqiQoVAKLGSxCScf04ksEzjtkHuV+m+tB0vazmcXe2F2dX27eQMBM5IL/Ar2eSj/34YF3Co9pg5t30OQ6v9qVIU541cfpvxCdvFvpEcw/n5OD7YYnosZO2az3SLEDxypuj5pFsA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14) by VI1PR08MB4525.eurprd08.prod.outlook.com
 (2603:10a6:803:101::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.33; Mon, 21 Dec
 2020 15:36:35 +0000
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9]) by VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9%12]) with mapi id 15.20.3676.033; Mon, 21 Dec
 2020 15:36:35 +0000
Subject: Re: [PATCH v10 0/5] UFFD write-tracking migration/snapshots
To: Peter Xu <peterx@redhat.com>
References: <20201217165712.369061-1-andrey.gruzdev@virtuozzo.com>
 <594af923-f960-5e8c-ec14-ef43d8ede8c9@virtuozzo.com>
 <20201221151725.GA6640@xz-x1>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <5fd8a211-b1c4-fd9c-ad0c-5308f2700834@virtuozzo.com>
Date: Mon, 21 Dec 2020 18:36:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201221151725.GA6640@xz-x1>
Content-Type: multipart/alternative;
 boundary="------------200FD8568824553D79CACCFB"
Content-Language: en-US
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM0PR02CA0027.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::40) To VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM0PR02CA0027.eurprd02.prod.outlook.com (2603:10a6:208:3e::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.29 via Frontend Transport; Mon, 21 Dec 2020 15:36:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 569fc0c0-7046-4fbb-b125-08d8a5c6334c
X-MS-TrafficTypeDiagnostic: VI1PR08MB4525:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB452598281087F7869A2682AA9FC00@VI1PR08MB4525.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uEQ5Mpz79eO3tzaUVU8FtMqkBQ8WgZCSR/xvkSyRYWlHQu7RAP/h6VjI0LPfccJjImj29wVx0Ia1P7AgGLyt6Dabw3xI4oyMEg16dLCV7RzSML6xvGxPeNYF2AsTDi+3FtHzozuJWZVJMkgvbIjp559hOyhQS5LVMXvNaI3q8ti4s6Udvzj+8+dSIj4NC6hBhDwfg4u2jFOycKaOb3Fin+1JK5gDGSkNi8hIcpave6SBzDIgcij13QURz/cdr4/u4Da6IhCi9jR3uY7+lCEGLOHeVbhG5bDkv+1e8DTOnmdEzNwxjiSXL/ccXjWybKKJBbCgZv+elro2b5gVG5c0kY1oYUL/amNkqse3k+6n5Wl7yNe0oL0t7op+LptPC6DePg/yF2KHRzEUzRKevUw9hbKO4V+3eKjAr9lvDdKo5+wwxUuuwmObMzCnwr6Ty5j/cCofeDHcLNY9b6dsphoTbLrp1Ju8ToTOqGGuovpHcCXvVgLCV/P47sHg+n43fesfuaij/vx3rgBU6KhB7kNj1gR/Q+5QJ3LmGjlaW87ltCSJfozeoU39y5YiUVqAx1bl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0802MB2510.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(396003)(366004)(376002)(136003)(346002)(66476007)(66556008)(31696002)(478600001)(166002)(53546011)(86362001)(66946007)(26005)(33964004)(83380400001)(2616005)(956004)(44832011)(31686004)(316002)(6486002)(16576012)(5660300002)(52116002)(8676002)(966005)(8936002)(36756003)(4326008)(16526019)(186003)(6916009)(2906002)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZXhaK25DOXZXaG1Rd3VqY0h5SzZDcWZGVnVOLzlWNmEyV1BJUDV3cWw5SmhF?=
 =?utf-8?B?RkwrSDBOWGhZMGg2N0dob2NyZGQzV2JXZjJkZUJ5ZUFRWkRSdjFaY0VYb0hh?=
 =?utf-8?B?aWw1UTFFUjJMMEFaWFczM1lIaTJnN3lTY1ZiKzVxSHVKSlFGTkZ6VWhPSUdE?=
 =?utf-8?B?Tlk0TDhlU2xtaHAyaG03UCtWTDJGb2VCOHMvNG9mTURua0VscnF5cmdJMmFD?=
 =?utf-8?B?VGZGQ3Z5MnFXOU5wd2tud0dDUXJkMnA0QmdlNUlldEp6eUxjL1daNXl1VVRM?=
 =?utf-8?B?b0ZwckppaGhCU0pTMEI0YmlFa1E1Z3pOeGpscDRWOWZsMG0yaFQ0VlBtN3VK?=
 =?utf-8?B?M3dvRnQ5eUF6VTF3V1hSSE5xRnhYLzhIVEF5NUR6VXp2SUU3a1ZWY2xvVDZ1?=
 =?utf-8?B?UkZ4dCtYTnRHMzk0T29oTnMydUpJYUVhaTl4akl0emxhUUgyOTRJRHVnS0Jy?=
 =?utf-8?B?VGlCbnU4a3oyU3JzQ3p3WFE5UytLckcxdVhpQWpweHRTOHZpNFdRTHI2dXli?=
 =?utf-8?B?UFUyTVBlNm9ldWpYdEF6UzNGZUFSNWd1WHZzZUxGQ1JOdFhtaGZOVGFDNWM0?=
 =?utf-8?B?ZzMzcFRqSXhUUE9wWFRUMGZldWpwek93Q3dnVUVtZ0ErbHgxWWRNODM4TklV?=
 =?utf-8?B?NkJ4dGNoUGExTjJuUG1zVjVEcWxPODI2Wm80WVM3aDdvV3VBZ1ZEc0t2c2Rw?=
 =?utf-8?B?RkhwNkoyYTA3VFhwZ2pMam9iKzl2REJWYUZNZHhaWngrelhnbVZBOUtzQUIr?=
 =?utf-8?B?QmxPaHBIU1NsT0I3Rm5KTjAwckhjVmUxcEpHUmhFdEVQUDUxcEVCc2xPcnRx?=
 =?utf-8?B?RzJlbkJWZzl4TFRKa1JRTFBmQTZoUjJ1bGdjNzlET2NwQi9ZUENVdU9iMXRH?=
 =?utf-8?B?a3c1MTBzdExlVmZkZTFsdWxXUDZYV0ZWcnlZQlMxLzg5VzQ4RDZRa0FDQ0Jw?=
 =?utf-8?B?d1JmMldZQU5yWlNnNENCZk1FT2Nlb0UrWGJDTlB5S1A3MzZmMFpBZ0ZaRHYx?=
 =?utf-8?B?M2J6S2QzakswOUpYeFZCMWNJOUd4R3JzZ1drOFNIVG1uQnhMVi9SMGYxS1Ni?=
 =?utf-8?B?S0JKSVZockVvM2VKZnFmRHVJSzF1c1FlRjJoSXIrQmIrWWZ0VE9VRzI0R3hN?=
 =?utf-8?B?bkFYaWsvNkx1a01aNlhoSi9aWlBGMnBTMnVrM1JHc0xocFd2TWhQSU9scWJO?=
 =?utf-8?B?cVFMdm1Pc3pQTjFGWUpTWnRhcHExcnVKMzB4ZzVlMjJEY240Q2FQUktiTVhX?=
 =?utf-8?B?d0dmYjhpNytjcE11NG92WEZxdU1nUkFLUFpBalBWeE0yQW9PT0V1dHlEMHhX?=
 =?utf-8?Q?+juKtVS4jtQv0=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0802MB2510.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2020 15:36:35.5137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 569fc0c0-7046-4fbb-b125-08d8a5c6334c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2cyzRJoZMAgUWcfX8BxqR3FfvO1GHeThlNUpQfoUfK8akYQOoyuU4wdPRM5u9BZlasUn4MK98VZ3HCbTbqYdYdcu+tLIOx4jhAlItg4PApk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4525
Received-SPF: pass client-ip=40.107.22.131;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.233, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------200FD8568824553D79CACCFB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.12.2020 18:17, Peter Xu wrote:
> On Mon, Dec 21, 2020 at 03:44:38PM +0300, Andrey Gruzdev wrote:
>> Hi Peter,
>>
>> I have a question about the Wiki page you've created https://wiki.qemu.org/ToDo/LiveMigration#Features.
>> May we also add to that page/have access rights?
> Yes.  I'll send you another email soon for that.  Thanks,
>
Thanks, Peter!

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com


--------------200FD8568824553D79CACCFB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 21.12.2020 18:17, Peter Xu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201221151725.GA6640@xz-x1">
      <pre class="moz-quote-pre" wrap="">On Mon, Dec 21, 2020 at 03:44:38PM +0300, Andrey Gruzdev wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Hi Peter,

I have a question about the Wiki page you've created <a class="moz-txt-link-freetext" href="https://wiki.qemu.org/ToDo/LiveMigration#Features">https://wiki.qemu.org/ToDo/LiveMigration#Features</a>.
May we also add to that page/have access rights?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yes.  I'll send you another email soon for that.  Thanks,

</pre>
    </blockquote>
    <pre>Thanks, Peter!
</pre>
    <pre class="moz-signature" cols="72">-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                virtuzzo.com</pre>
  </body>
</html>

--------------200FD8568824553D79CACCFB--


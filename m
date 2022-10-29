Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF3D61209B
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 07:55:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooemk-0004S2-Ct; Sat, 29 Oct 2022 01:53:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1ooeX6-0004CY-El
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 01:37:26 -0400
Received: from mail-mw2nam10on2078.outbound.protection.outlook.com
 ([40.107.94.78] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1ooeWz-0000qr-JX
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 01:37:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h79VgrUk/yqhewfGbzHBByIp7dtZm31WydBCUufA304AYjEeg238lC8ra6a6sruGHYd/aact09nka1Y2k4CvOpv1Anq57slZXSvSsK3OcuH8VCKWpCVFzSln528rHMECjnWEPI6v+IRZLEKLlVUGRVkvnG0qHL7FQMDfB2t6z9KeqKxYTNjct8YcWQHH9sKjHRR/j5d+uEJVYjzFH3k4/h42lYbuvEUC7B9ekg1LsCwjkuHUUJtzxgD6A12+o6Au0iOwBxZLNZrrPIUM5VS729Rrc5nyb0pVZ8EJHBwAvV3up/0QTrXKUIJ7vo2ElPNnWlOe60zkVLtpuf1apjCxCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yAZfOlArbuKXJhaY3JUE9hUW9sR5OF62WoBXcVnF9QE=;
 b=ilyZnRkO80a/HM2S6kN7r2LKPSFgzbkOIZJpkFDrop3fUpxE9n99iWT1RZ8sdM8Zy12k2lbdR6LwdEfU3JUcjxfBeYwnMUjQfWuU9btszLp4lvLYEcBC+Wr0+LhW1Q+Ya0eMaXAAWs1mKwVoNA+ivvrEUv5qj0NY7XhLJMP8C4zWtFqUVOWZTxIJ7LOwj04NLIcOzTAPXvnCiYpEO98SxS5WXESbAsA7ADc0Bf3z2cpHWQdoXEy6QVq30nP75zXh65BVS4mxqFpMZ7DTq0QiB5g8SiKBWfL/igak1ZBwCLLQAP5FzuY7gE5h1QiTNGL7FZaP/kFyW1GZSMp3zpJfwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yAZfOlArbuKXJhaY3JUE9hUW9sR5OF62WoBXcVnF9QE=;
 b=df5uTL0QvUADzHe/a7RoZWXlbYAgCVAqUNZKoiftKLO8yPzd7CUDfyCAbGQcn44g4lfVQOaoq0o1N723QARHmmDq3Ojd/PNGyyhG1v34tbyax8Ck/ZpEA4Yctwj4uEhalxkG78Ccb9LNUJufIC/PiM9l9gYVCAaP38dPORGeuUE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by SA0PR12MB4589.namprd12.prod.outlook.com (2603:10b6:806:92::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Sat, 29 Oct
 2022 05:37:10 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::6d54:a77f:86e0:6814]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::6d54:a77f:86e0:6814%7]) with mapi id 15.20.5769.016; Sat, 29 Oct 2022
 05:37:10 +0000
Message-ID: <2d7b110f-5d14-9067-bc3c-99951d4bdcdc@amd.com>
Date: Fri, 28 Oct 2022 22:36:47 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v1 09/12] accel/xen/xen-all: export
 xenstore_record_dm_state
Content-Language: en-US
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, stefano.stabellini@amd.com
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 xen-devel@lists.xenproject.org
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-10-vikram.garhwal@amd.com> <87pmed1uww.fsf@linaro.org>
 <CAPD2p-=gTqAevPi8-Tq_wkbd+PeVgnLLergmJVLh_eE2HumbGA@mail.gmail.com>
From: Vikram Garhwal <vikram.garhwal@amd.com>
In-Reply-To: <CAPD2p-=gTqAevPi8-Tq_wkbd+PeVgnLLergmJVLh_eE2HumbGA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXPR01CA0075.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::15) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|SA0PR12MB4589:EE_
X-MS-Office365-Filtering-Correlation-Id: f5aa6df1-85b1-4897-9d65-08dab96f9fe8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U5xyl3rmg3oLy/gz9QD6RcpunKeCcK4+/pThJ1snMHOM7jjRHzugoUY2w6IZJcxKSepjtqtH/eThsqutRxWXeyRCFT3XVsVifK196BF+bHC0DEp3xese95OO7o1qc7aQKL4iq9k9UaNP1qHLnUutx10ThbQ3VfFrxI2mfnciQYJmjB3q7DfA5p81WVz/WRe+klxiwaLn1kG4mEFet8xOCglrQ+xaB6H32gXPJ1FuFGd4FOR5LGxz6MaOLOj/nhg2MSWpFptrUlhhcn9ePTCJi8yljhw2Qi+lUxhXx5nM4dmyhr1GUBn15FrXNz4KUW0Qe0KA/nK0wmEp+Bzbfs1SWqUeU82I6it5MoorAaG0TgTWZsziADhJsuu2+U/7nU3G2IzhfR02yr/HDu1WUEi1Zp+qw4FtXQZ83BnzdgkGLVRNBqVmiepyi7ct6agJRJvzoC/cnPEnQ9Lig4Yac3gf3m+lHzXIKmzt2JIVH+gDvj+2EkuIT1X8L70AjT/yFcITgZevmp0Jlb2B7Gk0wfSX9T3h+qIJAwHuiFGnKKQuqGd0+yOrjyXpguv0WkKJjSDSh2yjUrb/6U0Crnq7BeC0Nkf/Xm482scpV2LHJRgVgebY2hmbCRi2dJUl8sv1DVsL3C1MJhOl2IHibBKN/aAFFTA7O5OJ54FOOZReNz5hB+Uq0mhy7Wlb9T4NTbkLp4kfCV4129hKLTRkCPXtX/fk7cpgbrLeKIaqil4DOvfczSE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4409.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(136003)(39860400002)(376002)(346002)(451199015)(6512007)(26005)(6506007)(53546011)(186003)(2616005)(36756003)(6486002)(966005)(6666004)(316002)(6636002)(478600001)(54906003)(86362001)(31696002)(66574015)(83380400001)(38100700002)(31686004)(2906002)(66476007)(66556008)(8676002)(4326008)(41300700001)(66946007)(44832011)(5660300002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2NPcmgyVG9KR0hlRkR5OEhKUjc3Yk8zSkhvYTV4a1ZJUVRueUN0clRKUmc0?=
 =?utf-8?B?eEJUVXdGaHVKaW1aV2U5d0RWZDNVRlcvZEtTb3dsTVFMWTNjU1lDdlRub0s3?=
 =?utf-8?B?d2NhdVAweFR4NmZvT3RGQmhNNWlDTkVsczl3dGZES1NxKzRFRk5ITHI3Z1hq?=
 =?utf-8?B?M09yc0Z1RDlGczRZV2U5WHQ1dThUNElxclVZMkVuZDBpVTFJSFg1ai9kSWxU?=
 =?utf-8?B?Q25DcFV1aXJFWlMwUEJ2THFVQmZoY1E2amhvZkx2RElkSm85aXBqRmpYemNT?=
 =?utf-8?B?V1JyQlExeXlFMEwrdUd1RytzWXFua1ZPc28yRWVHZC83Ri9TRGVIUzI3VG5Q?=
 =?utf-8?B?Q2M5alJnNnlLWFlwNkdlVCs5d3hWYkNvWHQxeUVjVUNOdVhybkE2M0VOL3pw?=
 =?utf-8?B?WTFVdUEwbkdaY2VhZHJETUZ6bHJTMFk3M3pNUFlRS0RDR1o5QURsMDhZbUcv?=
 =?utf-8?B?TnpNWXdBRnFEMFRYR25wS3ZxYzR3a2RhZmhtc3czQ29la3krcmRjL29WeS9X?=
 =?utf-8?B?OGJ0MlUxbmJjNEgzMXV6Q050WHRJUm9YRjlreTZRR2JDaDlsZnAweXNrVVA5?=
 =?utf-8?B?bDNoWWYzc2ppUGhjaktwcUtTRWNVWnY2ekJYdjQzTFZBamM2Nld0RS90UlpY?=
 =?utf-8?B?UGNDZ0l5dHJkVk50RFdrUmJXWlBkWEIrZlhyNzRCejhCYVQ3TlFFRnpOUzgv?=
 =?utf-8?B?UHFRT0tScjlOTlFDWnNHNUxWdFVDMHhBTEVLQXR5ZzFKUkFRUXJtWjloZE11?=
 =?utf-8?B?eVV2Vkd6cUc3RDNGU3RKbjVRS0xMYU9iNlFPZXBEYVFrK0c0NnhyQTlkMFlD?=
 =?utf-8?B?RzBnSDdpWDNOSEtEN082SFo5MnBkOGtVa3diK0pXbEpXSU5nZGYzMnBScVA1?=
 =?utf-8?B?TnVGQXVMNXZNQVRGMW5WWUUrRHlHOFFIQnU2UERhdkZLNEhFZlI5Z282OVd5?=
 =?utf-8?B?dDdXbVc5UFhPNFNKcGZGb0YzNDFnbXowS094akhsWEN3VU1ERy85NVRzclVY?=
 =?utf-8?B?MmVTcnRERVBwZWFpSGwvSzRJbnBHakVKT0FuMXhHa0NwMzMxOTZ4YVZjMzh1?=
 =?utf-8?B?ak9NY1pzazd2UEdvWGg4RCtoUktPVGpwTVJMeFQ2K1Z6NC9jRUVwUVF3V3Ft?=
 =?utf-8?B?b0lMcElnVjNiZUtoNjg0K2sxd0gvaVM5ckNQNFpQVlVKT2FvUSswZENCUWxs?=
 =?utf-8?B?Q3BqL0FUcXVaQkk2UUVYc0d6MEdxUXNIY09MSWppN25TTFN3VXZ5U3FMV3cr?=
 =?utf-8?B?c1VCMEYrTkFLUnUzNlVyb2hRc2ZaWjFyU2tsWFlvci9zdzFTRVdYRk5nWmJW?=
 =?utf-8?B?QU02R3BkNkZsQmJ4MWtiSzdnOEJqOElzYWlkSzU1MVNtNGFLMGZvcitaQWpy?=
 =?utf-8?B?YmYxMExGWk9Jc1RwUWd3eWY0aHB3RXloekNhNEErbWhtRTVrWkp3M3QzYkNo?=
 =?utf-8?B?MVgvdGlIYm9HZlQwazZLMWxkYXhxQ1Zrc1A1akxobmllbHBjK0tDdFNPUjVU?=
 =?utf-8?B?TUdTQWg4VlpKdEVMMU1uc3JnNTNVS1BqZE43OXRvdG5vdFoxOURvSkVvcFo4?=
 =?utf-8?B?akQ3aEpmOWYycTdoVkF2dWNqUzRMVTZSbldCbkhtZjV5MU0zY1V4ZEswMUtx?=
 =?utf-8?B?Rmt0SjRhbmN4elVhUUc5VDBPVkwxdEQvNWplUWVuK0xDd1oyOTF2bkdIWExz?=
 =?utf-8?B?TFdvUzQ1eVVBbitRUndaUzFTSVY4S25GUy9TTmlHSzJ5d1BXRjRTdHFGZlZy?=
 =?utf-8?B?UnREejZKV0x4ZHNWSTRrdGcwdldFbGo2SzI4dlFMay9xNnlQZStDUE1TS0F6?=
 =?utf-8?B?ZUZXa3ZiL28xZkJidk1Ja0oveGFHQisvMjZOcDVKUWdkaW4rOHVZS1JVQitE?=
 =?utf-8?B?MGlWN1l5TW9pZkcrYmtheVhremJZcFl3RkhVSUFTZGs2QlVxV3VCRjFGTWh6?=
 =?utf-8?B?ZmprQ1JibmdPWmlvZ2lEVHRZYktqZFdHbGtnamc0VEFYTmNyMDVzUjJIOXpG?=
 =?utf-8?B?Sm95Y3lWSk5oaDRUbU9aRUVwMk9BMThhdS9aamx4eG4rblhiVlZWbkErOFlx?=
 =?utf-8?B?V3lrd0tkc2xWUWxwRVl2WkNHeTA4SmZtZUR6aGtGQ21rWXkrT1ByMUl0RXlI?=
 =?utf-8?Q?0LQwOj2OOMrboE98tnFraqz+t?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5aa6df1-85b1-4897-9d65-08dab96f9fe8
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2022 05:37:10.4800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: edjd0hM2e4ItAI+fZ4OIYph8wfRzJwMHU7SS9+l1MSc1Q4g2Kgjyet/FgejqdbLN5y2iv56sizkF1t0EQSFUXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4589
Received-SPF: softfail client-ip=40.107.94.78;
 envelope-from=vikram.garhwal@amd.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

Hi Oleksandr,

On 10/28/22 1:26 PM, Oleksandr Tyshchenko wrote:
>
>
> On Thu, Oct 27, 2022 at 12:24 PM Alex Bennée <alex.bennee@linaro.org> 
> wrote:
>
> Hello all
>
>
>
>     Vikram Garhwal <vikram.garhwal@amd.com> writes:
>
>     > xenstore_record_dm_state() will also be used in aarch64 xenpv
>     machine.
>     >
>     > Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>     > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>     > ---
>     >  accel/xen/xen-all.c  | 2 +-
>     >  include/hw/xen/xen.h | 2 ++
>     >  2 files changed, 3 insertions(+), 1 deletion(-)
>     >
>     > diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
>     > index 69aa7d018b..276625b78b 100644
>     > --- a/accel/xen/xen-all.c
>     > +++ b/accel/xen/xen-all.c
>     > @@ -100,7 +100,7 @@ void xenstore_store_pv_console_info(int i,
>     Chardev *chr)
>     >  }
>     >
>     >
>     > -static void xenstore_record_dm_state(struct xs_handle *xs,
>     const char *state)
>     > +void xenstore_record_dm_state(struct xs_handle *xs, const char
>     *state)
>     >  {
>     >      char path[50];
>     >
>     > diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
>     > index afdf9c436a..31e9538a5c 100644
>     > --- a/include/hw/xen/xen.h
>     > +++ b/include/hw/xen/xen.h
>     > @@ -9,6 +9,7 @@
>     >   */
>     >
>     >  #include "exec/cpu-common.h"
>     > +#include <xenstore.h>
>
>     This is breaking a bunch of the builds and generally we try and avoid
>     adding system includes in headers (apart from osdep.h) for this
>     reason.
>     In fact there is a comment just above to that fact.
>
>     I think you can just add struct xs_handle to typedefs.h (or maybe just
>     xen.h) and directly include xenstore.h in xen-all.c following the
>     usual
>     rules:
>
>     https://qemu.readthedocs.io/en/latest/devel/style.html#include-directives
>
>     It might be worth doing an audit to see what else is including xen.h
>     needlessly or should be using sysemu/xen.h.
>
>     >
>     >  /* xen-machine.c */
>     >  enum xen_mode {
>     > @@ -31,5 +32,6 @@ qemu_irq *xen_interrupt_controller_init(void);
>     >  void xenstore_store_pv_console_info(int i, Chardev *chr);
>     >
>     >  void xen_register_framebuffer(struct MemoryRegion *mr);
>     > +void xenstore_record_dm_state(struct xs_handle *xs, const char
>     *state);
>     >
>     >  #endif /* QEMU_HW_XEN_H */
>
>
>     -- 
>     Alex Bennée
>
>
>
> For considering:
> I think this patch and some other changes done in "[PATCH v1 10/12] 
> hw/arm: introduce xenpv machine" (the opening of Xen interfaces and 
> calling xenstore_record_dm_state() in hw/arm/xen_arm.c:xen_init_ioreq())
> could be avoided if we enable the Xen accelerator (either by passing 
> "-M xenpv,accel=xen" or by adding mc->default_machine_opts = 
> "accel=xen"; to hw/arm/xen_arm.c:xen_arm_machine_class_init() or by 
> some other method).
> These actions are already done in accel/xen/xen-all.c:xen_init(). 
> Please note, that I am not too familiar with that code, so there might 
> be nuances.
>
> Besides that, Xen accelerator will be needed for the xen-mapcache to 
> be in use (this is needed for mapping guest memory), there are a few 
> xen_enabled() checks spreading around that code to perform Xen 
> specific actions.
>
Unfortunately, I am not that familiar with xen as accelerator function. 
Let me check and get back to you.
> -- 
> Regards,
>
> Oleksandr Tyshchenko


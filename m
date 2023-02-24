Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A33856A2223
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 20:10:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVdS1-0003Bf-Ad; Fri, 24 Feb 2023 14:09:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fejes@inf.elte.hu>) id 1pVdRw-0003BU-LW
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 14:09:46 -0500
Received: from mail-he1eur04on2073.outbound.protection.outlook.com
 ([40.107.7.73] helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fejes@inf.elte.hu>) id 1pVdRu-0005cb-FI
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 14:09:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hGN7DZM+N05oUT5FCkCwduBql3kG+n/LZVtRtZdG8zpaGUL22szqLpbiUu0dclPuWbCtjnMnBNxIgaggGy1mfucxRxUgfC8SpJFH1C+F4HHgSp/MSKTeqq5MYr+s3enAh/M8M+2ot1Vbs44lW6uC3KUe5TlpMkCBDQPhL4DopvsotNsau0SSP/HU1SwuK/K3sJ/aYXGSPoFXmrjo1J5u5491caI3wuZ0iW0ai1lIt1tVMMnlbHQy+LDBqsV7hKz0KF+fFiGQq/zLVCc1Vb2AGpuqUM351YW/ylxVIL+oHP36f9XJH/QDWG8ZlIyComGZjxUcgqqleud35qsVNb3tOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9IPU4D47ZfRXPjkxjtCMVrkotKUKUOcRMjV5B1Ng500=;
 b=j2Gir6qWmziRkAABam0Mi38e9SUZTxEjZWsPqWgyeHgYJAhTZpUAbspwHFSCONT9Qd2zK//wRjKv2U56Os2t3eTctTvreGe7EWqqpxcJQyG/L4kFW4PraqoXlUlsDF4r712USt5p0eFPbj/A3hpbfvobO/b3jaLxDUl2RVvYYGt0poeuF6cPD3GGokPAIzgtGU6aV622LJ0enKBzy7rtJnoShvAbXpoQvkL5TkEM/5WNJv5LMmXKfcphRUnnv10Ni5tTwapnTUxdqFHCI+35SFuyiJUlklMa0WZFx35cEm/3YeBmHsFnDFnzzn3InGOmfbe3zNPTLYf64wKAYMjEFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inf.elte.hu; dmarc=pass action=none header.from=inf.elte.hu;
 dkim=pass header.d=inf.elte.hu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ikelte.onmicrosoft.com; s=selector2-ikelte-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9IPU4D47ZfRXPjkxjtCMVrkotKUKUOcRMjV5B1Ng500=;
 b=lGf1wtI8ze6VHycSI7NCLLFsZLuSXfdxy9u06/nAnsU4TcP1w1l6wrmaE0gY5Ft02s7ZnEKyZ28oe2zWQiIyrcjKPPktQydWsYmQZ4Pge1WDqjpoHGst1LsXdwDEnMNWJDEOnb7XbI1cvi1QLb9uD3vM9/pWzceaWhQ6CbC25kA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=inf.elte.hu;
Received: from DB8PR10MB2652.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:ab::20)
 by AS1PR10MB5579.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:477::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Fri, 24 Feb
 2023 19:04:35 +0000
Received: from DB8PR10MB2652.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ee4d:78bd:86a6:c624]) by DB8PR10MB2652.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ee4d:78bd:86a6:c624%7]) with mapi id 15.20.6134.024; Fri, 24 Feb 2023
 19:04:35 +0000
X-Gm-Message-State: AO0yUKUyHFKbFOsQi+gqd1JUESHpIzo2o1F/Ah7JsX4Lxbq6EvSmmsI3
 CDMZSet7F4S5Y4bBMcHhbBiKU/KvWZ8n3UPdl7w=
X-Google-Smtp-Source: AK7set8n3bFWPQS+pvCUYjPsVBcmJDw0BbgXw2Y+ihu06tiriJdOH0hV0uLmvm871arg7WblUMkmdaMQ77lJYC5CzYo=
X-Received: by 2002:a2e:b74a:0:b0:295:9a96:a5cc with SMTP id
 k10-20020a2eb74a000000b002959a96a5ccmr2884602ljo.9.1677265473391; Fri, 24 Feb
 2023 11:04:33 -0800 (PST)
References: <b155ad6fe6bb026377a8f75882e26078da10ab70.camel@inf.elte.hu>
 <CAJSP0QX3VTU+_wngw+8jHttKykJ-WzMgns+PASDaD91or+zp5A@mail.gmail.com>
In-Reply-To: <CAJSP0QX3VTU+_wngw+8jHttKykJ-WzMgns+PASDaD91or+zp5A@mail.gmail.com>
From: Ferenc Fejes <fejes@inf.elte.hu>
Date: Fri, 24 Feb 2023 20:04:21 +0100
X-Gmail-Original-Message-ID: <CAAej5NZBzbx6paJRH-UDxreiFCMdX60RohHb1VU6mcsnWbyJJQ@mail.gmail.com>
Message-ID: <CAAej5NZBzbx6paJRH-UDxreiFCMdX60RohHb1VU6mcsnWbyJJQ@mail.gmail.com>
Subject: Re: question: QEMU guest with Virtiofs but without virtiofsd
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: virtio-fs-list <virtio-fs@redhat.com>, qemu-devel@nongnu.org,
 stefanha@redhat.com, 
 =?UTF-8?B?UMOpdGVyIEFudGFs?= <peti.antal99@gmail.com>, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: GV3P280CA0065.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::23) To DB8PR10MB2652.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:ab::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR10MB2652:EE_|AS1PR10MB5579:EE_
X-MS-Office365-Filtering-Correlation-Id: d6b69633-89da-4222-6c17-08db1699f859
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0S4XW9QIELEHJzrOoW2w6snr4F6oqRybXsURDj27l2QFHrYEnQytKA51IaWWufohn8xsB83QzkC124yj3ER4Ab+B+ehnPDU4Ex9iGVGjVE7HNecHCy3+cnKg4HABhMUaQGPeOqSfKsBxW/JTnxiduKZyhHtYSh9SpqS6xMe2683l69xLzCc8QzzmGi6EZ9z8iP4Jh0l+3ja31ivm1zEuJdSiAqZU/KdRkR8OEe6nsgsnRowJwXMsEhSsJbFCOcMMd52RHEs42OWRBFt2LSh01tSX27j3Fj3dcx0c/mfcYtoR1+EkfjPMSJYo4+4Bp1jy4PdnRmcE5skfAX3jHgk+Eo5hnlh8FE6YRnE/lpmZNULvqCQSrU+zORtOOykBAbFz9Ht4ez76K/OEdS454k9Gr/8m1BZ6mVyz/oswIcWM9gu4XVDMiSPrs6MJYbEYFTaFCfWhJeKOpHNJxNo/5q03/4GjMCgRFamMnjB9fMHSHgTkG5B5ImU3wZSQHJvWGXEh1JnFGVYeew4/nEYG1rg5hMDYVfOgfe9Hk9a0K5kRRqWAr0UYj+LIMwkaHZR0qGjoZCkyxl8p2qmnZnV5dCekwcyj1JsGATURAt9B0wSUwN8mWCTto/AEhTG8G6TTPYGIAoKUONYrz1/6glPJxX1hwGLu3y3Fhc5oQOfo092FgJwwcYlBP4Bg/5etEP7zccPCEZpfjNl3bvKg9UlMVEN2Hw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR10MB2652.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(346002)(396003)(136003)(366004)(39850400004)(451199018)(41300700001)(8936002)(86362001)(6862004)(66946007)(5660300002)(4326008)(66556008)(8676002)(66476007)(83380400001)(316002)(2906002)(786003)(54906003)(6486002)(26005)(478600001)(107886003)(52116002)(55446002)(6666004)(53546011)(9686003)(186003)(6512007)(55236004)(6506007)(38350700002)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TG9PNzltSGhvMXdYVlFpMWlLSFNEZG9XQWtMMkpMYXVXczJrUXJaVlU5Ynd5?=
 =?utf-8?B?aGZXQnFxQ2VuVmJ1L0tqUlVLY21DWFQ2OTlRT0cxVWhGNml4Rlo5dk93MCtt?=
 =?utf-8?B?V0RLRTc0WHZ4alQ5YUlvbmF6NW9zVjB4d1BjaWN5REV1U0c2RlFDaGJJRnk3?=
 =?utf-8?B?ZTdqb2d0ajE5TGlrb0ZSVEhYUUVHdTZnNEJlaGJDdkFDZ1dqZ3pBbkF1aCsz?=
 =?utf-8?B?bGZNUGprNkF4UEE2WmM2WlE0ckpDNy9WZzNScDEwQk1wRStRMzV0eFJKYUFM?=
 =?utf-8?B?cXZDSkxhODNjR2Q4ZGRWd0hzSnVlaVBPWGtpc0R3Y0FwaE1DdUx5ckVSVTlR?=
 =?utf-8?B?cU1HVE1JQWM0Yng5TU54bU95TXkzRWxGZ1ZvK0w0KzUyajZFVzZxa0RMamJH?=
 =?utf-8?B?RUFuaHJjUHcvODRkbTh2SG42VFI3VVhpV0Z4cm93emVsbGVGOHpBdWFudUxr?=
 =?utf-8?B?aGc1VDh5RnZrSTh3aWtOU0VabThEcHloS3ZHU090eHNQd2hJaEJJOTBTN2cz?=
 =?utf-8?B?UDVWd0o0TDc4TE1FN2xrYXlnSHFQbURLcVpRSTBKd3d0TFhhYmVINEU4NUJD?=
 =?utf-8?B?RHVYZzB4T1dxanEvZ0FmenVHM2JBOGF2RUdOc3pQaHZaa0hiV1pqVm8zWHF2?=
 =?utf-8?B?TjZIVnVRNjJ4YzBLbm8zMUtnVjAxaFBaUDdCYUlseUZnWVdYUUtVZE85ZTlZ?=
 =?utf-8?B?VGdILzFqekcxRTY2TnhIYjM1b0w1WmNoMzE0V3lwOHlwbFd1cGdUOTRqMFJ3?=
 =?utf-8?B?ZXYxOG9PSHJZRDZiME9BeWkrK1d4NEl3SFFGSHViMkpLc3VoOGpqR2NjWk9o?=
 =?utf-8?B?S2hrQ0dwb0tMZHNmU013UTJtTWFOUHFtTDNsNmVlU3FrU2I5a1ZFSEQyeUdq?=
 =?utf-8?B?eEZRN210T2JhMlJRQzFVYmcrYlV5eDJpbXFnemxjU01TeGsrTHBIelduTjA3?=
 =?utf-8?B?aW5GVmt2NjVmcUtheHZWd3IzUkZTWUJheUdXRUMrYUcxVGhlV2pMTGhXekp0?=
 =?utf-8?B?UklMZk16UklhN0V5Z1dUazY2WDJaQ0hwMlpQZVZaY01VSkhPMHVuLzFZalZh?=
 =?utf-8?B?cGRNSm5RbWZZY05LR1l0dEJDWTFtdTZwQkRZc2tJTVJUQzVURFd6U21vSWZj?=
 =?utf-8?B?ZFoxNDNnWjdQNW4vS0s5Zy95anhrQ1dLN0J4K3loZnRWT1RIbDhXUTJMUjJx?=
 =?utf-8?B?eWZQRCtUZUhHRE9mUTkzWTlLUm9uMy9XRnJUNHVyc1JOU0tDemhKYVdUeHVi?=
 =?utf-8?B?eWJnVENWOWhZb21oMlpOdFlTSFdkbnVHckJtRy9oOFlYaW1ac2lnK093MkJ0?=
 =?utf-8?B?QStoRmliZTN6YzZrMmpWSU5LaDB1MTFvNUJ5Q0VXZzI1QWNFTDMyanFuak5C?=
 =?utf-8?B?em5DTGVNZlZEM2RoZU83aXRKU0d0M3ZKTDRTTGxmWVVjMTBRUjgrWHdickFZ?=
 =?utf-8?B?d1BHRjJ5cit0SXlhYjNJcWk0RVFuSWVFKzhSMkZYSjYrTlJveDd6WkU2ci9h?=
 =?utf-8?B?WWZoYzRJWm4xV1BkWDFVamMyK2xQcXVQMzd3R2FsbEJ5MkZjYUdCV0VLMFRG?=
 =?utf-8?B?ZGZDdVhkODFGazhqVUFTNUxjQ1BUVTlBajRwN04wK1pQeStzQkU4Q205VkRW?=
 =?utf-8?B?OGMrb0MwRHlnQ3RwZmF4dGVHZlVIQzdBOUNEZFFtZTVYblhXRHdvbll3dlhI?=
 =?utf-8?B?VU1XcGRNR294WEhxeUZKQVBFdFltaTBPY0R2eit2dWliNDdDNGJKT1dFQitB?=
 =?utf-8?B?QzlITlU5RUhLcEZBR2Mwd1RrRkNuLzNXcGVkejhzRExoWEtLSXNLNUxydlpN?=
 =?utf-8?B?TXJBa3ZWL0Vpd2FxYTMwL1F0Zzd6MmJHOTN0NVpYOXkvSk9ROGw3cnlNSWly?=
 =?utf-8?B?N2haaEs0NEROdXBwN25VVG1MMXBzVEdabDdDdnNKYzB1aGxvYmV3MjdqY3Na?=
 =?utf-8?B?N3UwWWtTUXpnZE8vSXVLUHVXUWM3TDBNZ1QxZFg3eTUxdFkzTXhxc1kyWEhG?=
 =?utf-8?B?c1RNdGFaVWE1amVmSkwrc2dGbXhhM0pqNXJOQ2VyYVlKZ1ZxYnpDY3IyVEF1?=
 =?utf-8?B?UXRpSkFMdHpVeHhKbExXNXBpaEgvNngrOEJNazI2bmNzN0VkQ3VTVmYrYkRy?=
 =?utf-8?Q?2tEe3ozNElMPhkvqbt1RAme6d?=
X-OriginatorOrg: inf.elte.hu
X-MS-Exchange-CrossTenant-Network-Message-Id: d6b69633-89da-4222-6c17-08db1699f859
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB2652.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 19:04:35.6877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0133bb48-f790-4560-a64d-ac46a472fbbc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hsw1TYUquyk/QHbjdJ9lY1olKBIKpEO0xSI5nrPi7S/ueulmjf8LmOW39bSKVY6JY1ZVipW46g1hv5nQ3JcvtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5579
Received-SPF: pass client-ip=40.107.7.73; envelope-from=fejes@inf.elte.hu;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Stefan!

On Fri, Feb 24, 2023 at 6:23 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> On Fri, 24 Feb 2023 at 11:47, Ferenc Fejes <fejes@inf.elte.hu> wrote:
> > I'm using a QEMU VM with a debootstrap rootfs, shared over virtiofs for
> > the guest. My best understanding is that virtiofsd must required even
> > if just using one guest.
>
> Yes, virtiofsd is required even if just one guest is accessing a
> shared directory using a virtiofs device. The virtiofsd daemon is
> responsible for emulating the virtiofs device (QEMU does not do the
> emulation), so that's why it's essential even with just a single
> guest.
>
> > Looking around in the QEMU manpages I got a little bit confused by
> > virtfs parameter. Is it something entirely connected with 9P or it is
> > possible to pass folders to the guest through virtiofs without
> > virtiofsd? Unfortunately none of my trial with the parameters
> > succeeded.
>
> There are two separate VIRTIO devices for sharing files/directories:
> virtiofs and virtio-9p (sometimes called virtfs). It's easy to confuse
> them because "virtiofs" and "virtfs" look similar. They have different
> features and are completely independent of each other. In terms of the
> file system protocol, virtiofs is based on Linux FUSE while virtio-9p
> is based on the 9P protocol.

Thank you for the clarification! No wonder that my commands failed to work.
As a very occasional user of QEMU I those two (and their parameters)
looked very similar to me.

>
> virtiofs uses the --device vhost-user-fs-pci syntax together with a
> virtiofsd process.
>
> virtio-9p uses either the full --device virtio-9p-pci and --fsdev
> syntax or the shortcut --virtfs syntax that combines both these
> options.
>
> > Could someone can give me a confirmation if virtiofsd is must or its
> > optional. Thanks in advance!
>
> If you want to use virtiofs then virtiofsd is required.
>
> If you use virtio-9p then virtiofsd is not needed.
>
> In terms of which one you should use, both are widely used today.
> Unless you have specific requirements, I think you can choose
> whichever one seems most convenient to you.

I think I stick with the virtiofs+virtiofsd. Most QEMU features I need
shipped with 1-2 years old distros and can be installed from repos, so
I dont need to bother with building it.

Thanks again for the detailed explanation!

>
> Stefan

Best,
Ferenc


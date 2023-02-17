Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CED69B32D
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 20:32:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT6S0-0004Go-5g; Fri, 17 Feb 2023 14:31:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregory.price@memverge.com>)
 id 1pT6Ry-0004G5-21
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 14:31:18 -0500
Received: from mail-bn1nam02on2062f.outbound.protection.outlook.com
 ([2a01:111:f400:7eb2::62f]
 helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregory.price@memverge.com>)
 id 1pT6Rv-0002pM-Tk
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 14:31:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTZXDsha+4XZhmJwUZo+FLaeV16OPFPFtnWq4M/JisHC1knJJ+OI45jgqS5cQFn1um6+ZICOhXID9vqL4fmbzpzO+wPTZU7O/5sKDB3YqiyXoNrqlfnP+OLZE5Z6wGACAvr7G/sOJjjtdHQSQmyRuOrYOCmL7D+gnIAcTRujdf3WrWP8UXbpaP55H7rehbulz0AkfZyTJuoqslE83tBQshZaFMijuD3H75nBVM0xe3oxcoQxNBLOKNYvK68x3/cYo5Y03hY9zwoDJQjIYZ1Tn1Okfrd/knVNi7mqkO6J3k6St/A+IFpt1MbfBpuP/EQc/t7Wg+4dth1QfU4ytWacFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5wnAMcqaE0UVCMxAsMIUviZBeMW+kPEvTwYIV9XiuQ=;
 b=a8AzDQo8RGAzC64YE3D/Tl5J/ULrOK1OBR/WdeuDRiz/shnEKODHuD+D5bl0byr1tIfogA6ttGK3+9jmYXupeiXXzuxX4CCIOUzaMUpUvibyXV1cXQPoVCrsW/jkD3mF6DjXPtTUF6KpIMNfvBH/3fHL7mSNOBc5aluDnU+CsVQsZ0E5BNSXoKrC7rW0jg8iGnGuLWHHGY8BS/Mwew9VJy3LobuKmcZ6OymmgLXnJ+0rMTDF1oSspN8+2gfkMUO1xKN+HlhBwCPq4/UsDQtwfBnWh+1xcSlIQkhohy19K1Oloprg9Ms3oDEPwJ8Ntj+oK3ND/9/f/xoiB1UOU5o1RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=memverge.com; dmarc=pass action=none header.from=memverge.com;
 dkim=pass header.d=memverge.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=memverge.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m5wnAMcqaE0UVCMxAsMIUviZBeMW+kPEvTwYIV9XiuQ=;
 b=Nha/s5N+6MM0dXbLxGiy4MC6z+PrNtteUiuMNBtE7D8TjyQqZvaWzTWkUTTtz8SXj4t8mytCLsEsZR1imiRAvLgXcGGQ97+JaK1req03f2W97hahAL1yC4pECyLkxBlnJw/39ovDiVAueUANZLviJ3AFghF44FuzBtjlg3AEgnU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=memverge.com;
Received: from BN6PR17MB3121.namprd17.prod.outlook.com (2603:10b6:405:7c::19)
 by PH0PR17MB5214.namprd17.prod.outlook.com (2603:10b6:510:ac::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Fri, 17 Feb
 2023 19:31:11 +0000
Received: from BN6PR17MB3121.namprd17.prod.outlook.com
 ([fe80::d253:1eb3:9347:c660]) by BN6PR17MB3121.namprd17.prod.outlook.com
 ([fe80::d253:1eb3:9347:c660%3]) with mapi id 15.20.6086.026; Fri, 17 Feb 2023
 19:31:11 +0000
Date: Fri, 17 Feb 2023 06:02:12 -0500
From: Gregory Price <gregory.price@memverge.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: zhiting zhu <zhitingz@cs.utexas.edu>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org,
 "Viacheslav A.Dubeyko" <viacheslav.dubeyko@bytedance.com>
Subject: Re: CXL 2.0 memory pooling emulation
Message-ID: <Y+9etH9Y3B0zfviT@memverge.com>
References: <CA+3q14z5pa1RPQuMB=6foVGcwgCHE+GME+zMES_adpVoDYCsvw@mail.gmail.com>
 <20230215151854.00003e34@Huawei.com>
 <Y+yhfFaQ4Kky93mc@memverge.com>
 <20230216180057.00006c49@huawei.com>
 <Y+6Xj39d2rxnowRx@memverge.com>
 <20230217111418.000014d2@Huawei.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230217111418.000014d2@Huawei.com>
X-ClientProxiedBy: BYAPR11CA0101.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::42) To BN6PR17MB3121.namprd17.prod.outlook.com
 (2603:10b6:405:7c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR17MB3121:EE_|PH0PR17MB5214:EE_
X-MS-Office365-Filtering-Correlation-Id: feb0ec5e-fc63-4119-7a94-08db111d86b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hwcZwXaAcoFIRY+0zNfVCInt+oP4erYNnf9jDb8JTkGiNN3Xbf5iRUzm8z3Weloswg4vmJMLT74/QaAZMUFBdRa+/saaJl6vO4kIHuE6Gc2PUNkhSYN6XWsQTT5dj3WIuZCng8k/5WP5CXNaV5dBBaUQBmsnMlf5zRd3iPXXj/3ukwJWToEO7MDMSgusOeXwc+F9yJfMT80TGwZRWUVyHd6x4gBJ/ReDzmx1f5yJ2hy8cOOcY4itelbDZG1NxZpXxTHJwr7Azr3qd+6suQpVojk6vIDzlPDXhqn1mzJ/Zfjg2eEgDRHhHEZMdvgWcdgzExi3BLetmI55c4gyrSbAn+7prhojF1Ydv9kTOqIoJS8Ho3BhJZpZ7a0rlYLB48waH7TnzXgy4lUlb6EHIoc1DxavkPN818RSKi2eZLeSHbRv5XzdD+MvwnN069KTu6pNG6TGV0Gre+Pv9QHTQb8hBg/Qe3ALlFEloxucne+KEb6jSyvgTPLR0CSfEx4opIa/2v8MzkrYqHlc4AnZgX3VaOXg73OnnPlm92TMyoP7/U2Gy0rVuO1qjTt0NU/Zsa5QEghgJFMjsoq40fRmNdx/bDTjjrcvne2QAsMrbVmTG6o9X73Lgdk9u7eK8CmOhhJXfAorQZcjElPnbYx27f8Dhh9ZFdfegS4TtTzmTZBwdXggzF+an3zPJi87nFfB/GuB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR17MB3121.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(136003)(366004)(39840400004)(396003)(376002)(451199018)(5660300002)(8936002)(44832011)(66556008)(2906002)(54906003)(4326008)(6916009)(8676002)(41300700001)(478600001)(66476007)(316002)(66946007)(36756003)(6506007)(38100700002)(83380400001)(2616005)(86362001)(186003)(6512007)(6486002)(26005)(67856001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8ktT8FMNuUT3cwlyO6hrNO8UqyjbmVfJfA81CFYCXzfYv8lKt1sXYecBLLI9?=
 =?us-ascii?Q?fwG12Zgd3uBbddDHtpdfFBfh8LxeS5n1VbyaCNupkukRNx+5EQjtYKGOjV47?=
 =?us-ascii?Q?AXXUg7DxFXQjuPUJefn0v9lgqxINKU0f9PibZwYkUj+wZRDF4fMEVM2gmMuq?=
 =?us-ascii?Q?SJ9y2NktgEe1crb/DTRbnQC7X8JDnYPrW81fRKVAJag1VIStiEeuuqaIQXk5?=
 =?us-ascii?Q?V6RtChz+9GCUu85GdNL5ObnQnQVBp6huvPnwgEW+wZ3R8/9/06yNQq6Z8jz9?=
 =?us-ascii?Q?3IIN+NVsqXv2AeZlDkykACQlasFIQNywILpsD9n4QuGaiLOJWlv9UkYRvJSe?=
 =?us-ascii?Q?l51wSdKoY+vKbiHAkxelMPu8T6/rAYcrLcVw0ZTwIuVJdfwNz5vemhQ4fe+T?=
 =?us-ascii?Q?v4QkWYaJWPfaaQ9NdhLF5GUmjFwI5YWBeUBaaCtD3p4O4TeFr41E1H0qMH+j?=
 =?us-ascii?Q?MyT2/0AzFSR+gBj1BqXt85e3da+rvNkF6KA2QcG+VU/Zm+drLwUDhm3+ZJff?=
 =?us-ascii?Q?ssIr3wjOe35i1bz1blRdULCde2JWzKPshlolVh6V2WibTc6onqTurJ1+A7zt?=
 =?us-ascii?Q?p6Hhpa8vetxXh8iXXS+nUJ3edkMq5kvzODFM6wKJRT/x/A5Q7BrILViCH3c3?=
 =?us-ascii?Q?Tg6+hCjE7e2ck9eDFrKT9h0wh41MA4C11ummQsgzQNQyaeM+Q2Z11tFeZG3x?=
 =?us-ascii?Q?2trhym1MGUj4keURLdWHirANtcGGexbebtAQl9J7L9rUT723FrwKHe1nYV/8?=
 =?us-ascii?Q?D033lQhHe4j3gC239CKsvBEaL+O2T9HrD4LN8YYLvKoI6j5o5kNsqgP3tp4e?=
 =?us-ascii?Q?U3RH693BSy4CV1s6NM69z+U/PcQ5MeKjW9ceNTUdxxgVsm/awvzOSU3FPhl5?=
 =?us-ascii?Q?Se+/WNZv4QmRjIm6vZ5PeL5zsLyE5BCRQ01JgcuUzcGXiEFKHRUgbDWuXqT9?=
 =?us-ascii?Q?Eh3ZwQwkTR8UrNltsGAO/cGKDg2VPJ+xxxeFhT7un9trBAfA25ffKoZ0Le8s?=
 =?us-ascii?Q?OQsHAeqksBCjugXN8UEavfhGTPLnib1NDy4P8qo6mwIHAJYXiSBw9tkvSSuz?=
 =?us-ascii?Q?5+RicqvsR5Q4rhhkOyW2PknxaSDduEgdEKt4DqmfzhgzeQMsYMIClqvv6/Nj?=
 =?us-ascii?Q?q1yvsWCTr55+RNweUFcnOQudgOp/cXwDYCU5BLiZJet5sDi+rk5DGgTQS3jl?=
 =?us-ascii?Q?UPz2uujRiI9rtz/00CZC98WOYXNozpr1rhDNmZ2Vs+4uVcVCi0vCPWykUjhF?=
 =?us-ascii?Q?mhIP9lkE0vYo95SPn6a0YqLL0nAS90hHUbohK3M1mZ+QZNM/IZHB9KypMvKn?=
 =?us-ascii?Q?lEks7cXgn9myKzax4xg5+sCYKDnR/dJyfUt3rvTo6ASWsTSp0OXwgQzKEhid?=
 =?us-ascii?Q?g2FJoZgEyhehJwKGKBSlzGkOwVuLKpRsJBIsQydIUlF1ZrERJys7vNRSxeIx?=
 =?us-ascii?Q?N0xTGitvf/HnT7cCl5uB2lAq8SnRzQMo/XFJRgrrcMNsFEjsI3jDvkMGhbM2?=
 =?us-ascii?Q?Q1eROzCnjcJ6FFFaz57s5lDDc/YvBQTkjUX6NXXYP2X3PNim6OhYN0GZIJ+m?=
 =?us-ascii?Q?FySx8WmfFlGMYbameCxuKIjfaveD0KvOTln2dFVgUuwrKfFkmegXAcnOIB6E?=
 =?us-ascii?Q?gw=3D=3D?=
X-OriginatorOrg: memverge.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feb0ec5e-fc63-4119-7a94-08db111d86b7
X-MS-Exchange-CrossTenant-AuthSource: BN6PR17MB3121.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 19:31:11.7452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5c90cb59-37e7-4c81-9c07-00473d5fb682
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xQd5V9p8yI7l4c4nBuirk2+9RIwtPTF/ias1/9WZReJ74AfmaAyCAW6g2wwYAmBnjprWWtkARrAItvy68Y3k/e4FjqB7ndcygxj6DcRcWw4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR17MB5214
Received-SPF: none client-ip=2a01:111:f400:7eb2::62f;
 envelope-from=gregory.price@memverge.com;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FORGED_SPF_HELO=1, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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

On Fri, Feb 17, 2023 at 11:14:18AM +0000, Jonathan Cameron wrote:
> On Thu, 16 Feb 2023 15:52:31 -0500
> Gregory Price <gregory.price@memverge.com> wrote:
> 
> > 
> > I agree, it's certainly "not pretty".
> > 
> > I'd go so far as to call the baby ugly :].  Like i said: "The Hackiest way"
> > 
> > My understanding from looking around at some road shows is that some
> > of these early multi-headed devices are basically just SLD's with multiple
> > heads. Most of these devices had to be developed well before DCD's and
> > therefore the FM-API were placed in the spec, and we haven't seen or
> > heard of any of these early devices having any form of switch yet.
> > 
> > I don't see how this type of device is feasible unless it's either statically
> > provisioned (change firmware settings from bios on reboot) or implements
> > custom firmware commands to implement some form of exclusivity controls over
> > memory regions.
> > 
> > The former makes it not really a useful pooling device, so I'm sorta guessing
> > we'll see most of these early devices implement custom commands.
> > 
> > I'm just not sure these early MHD's are going to have any real form of
> > FM-API, but it would still be nice to emulate them.
> > 
> Makes sense.  I'd be fine with adding any necessary hooks to allow that
> in the QEMU emulation, but probably not upstreaming the custom stuff.
> 
> Jonathan
> 

I'll have to give it some thought.  The "custom stuff" is mostly init
code, mailbox commands, and the fields those mailbox commands twiddle.

I guess we could create a wrapper-device that hooks raw commands?  Is
that what raw commands are intended for? Notably the kernel has to be
compiled with raw command support, which is disabled by default, but
that's fine.

Dunno, spitballing, but i'm a couple days away from a first pass at a
MHD, though I'll need to spend quite a bit of time cleaning it up before
i can push an RFC.

~Gregory


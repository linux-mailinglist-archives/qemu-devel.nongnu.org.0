Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A75EA5484CA
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 13:28:24 +0200 (CEST)
Received: from localhost ([::1]:51010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0iF5-0004lq-9P
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 07:28:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1o0iDS-00040u-OB
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 07:26:42 -0400
Received: from mail-bn8nam12on2051.outbound.protection.outlook.com
 ([40.107.237.51]:59162 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1o0iDP-0000ln-PK
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 07:26:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=arHzGxN6Ch5Q8U0dkw1fnuB8XGoqxXCepZOYrqJOClkeZ+Yx73f05vIzuwvc+HEkKj3VEPW785NaU0PUiNzKAxAzwZI5SHhkE/H6Iqp97Qb6W2718FMHIlr193VoMJiLU2f9HafUND/aV/kKTgaUL1/PI95KmLJOX+PGq/KEI2SHxtJ1Q3DALf0/tgzV//7V34lQJ9Do/bC/vUMX4U6lIJ12m1wPFdWnUWbF59RjiOereYE6hY1X7HvhVAF03aunLeJGzGdJC64/ofgxrIXTK3i2bRjCbd23teSf2pHtmDuauX4kUduMnxoLcnPXVVPfeXVDSxdb7SUBSCdQ2Sy6Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IPzMLrykwNuPFHOTHpUon/wOhoq4SaMWumc2hdgmNnU=;
 b=XOYrLAqzNyHlAOeQP18XGC724T1JGwNtNV19OTFGjiYLCo21nwql5v23/vh4KuBmGLZv3lA+KHJvCrfpc3a/29IZLZFADY2S3TM3Wo4Cm2EZ020e5WAFzM3OfLRbld4XWCvStM+Nli6ahlMMzg+DlIaYrrKlOew01OqCsLXbyS1CdPVf5lKaxVckBzltRreBTap6tlDuamkQpcu4nZjgwM+wYh7XHdVz3UdSnMGQG0Bk0XrRDdwa7YGDSajMObaziPvccbnWWyW7sUklY372jvoKppjdAeYUFeLZiO4/O7c2IGBGDAn8yoXBLPm4MweZFimKYMsiBPj4hs1oP1kKvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IPzMLrykwNuPFHOTHpUon/wOhoq4SaMWumc2hdgmNnU=;
 b=YJi2gqYBIWsXqxDYG12471c0G180MclWbkIjE1qy3X+GBrNqeyk/uZe70UGp4VijQDxOCSvr5RqLXBiRBWPK18RILYBxSf0Jpi3YN9pFonEAdgKszRS3MaO6WevWvPP9nZ9iof5kRSRUheDe19M+Gk/Q+BCYfyKZUSfut59Kw1OaVKOLZGVJqi67Cl1jCH04i6EqVniOSJ0d7JH95aBon7tIyuD/uR2mTeOCjsmY1QqQhNkCiIaFkRanh/i+aELBxZBw3rKJfN4UetliVOMFKy3wdJwChbNBj0bBqB1lpjrVBs+PCHVb23eW7Rl8oQzKzFWz/DUWV5TWhcGlbc6NYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by BY5PR12MB4276.namprd12.prod.outlook.com (2603:10b6:a03:20f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Mon, 13 Jun
 2022 11:21:34 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::bc8f:cb9f:6062:34ec]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::bc8f:cb9f:6062:34ec%8]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 11:21:34 +0000
Message-ID: <4973fad7-5e71-aa4c-dfbe-24da254f3cfa@nvidia.com>
Date: Mon, 13 Jun 2022 14:21:26 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 00/11] vfio/migration: Implement VFIO migration
 protocol v2
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Mark Bloch <mbloch@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>
References: <20220530170739.19072-1-avihaih@nvidia.com>
 <a3c0e7ca-4707-5154-d270-c1034881462a@nvidia.com>
 <20220607153239.386fbed4.alex.williamson@redhat.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <20220607153239.386fbed4.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0213.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::11) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89b2ab41-c68a-49f6-da4e-08da4d2edf9f
X-MS-TrafficTypeDiagnostic: BY5PR12MB4276:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB4276D17F50F7536E6B1E2F20DEAB9@BY5PR12MB4276.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WdO6Fs8hx1bhtQFgzb1nlRQLjp/ljyC/dlgVeenHQvv9vljEBXUukPHPJkcaH/pj4dgodkxIxtRXJ6P8cTktV7/jiNDpWpMYLUNLVg5TL8FgNCk18lOPhaAJ0euzElqkLRQ+coc0AOtrgxOkjWkm7pmz4oRdEqW9SnAGsGpbxuD1QVpItH/p8jCsfhD/muLTsMz7p1tMeZ2IFuiME0gtYzZUteR//afwBKKYNVSQBkivqwg4OFKtzql0qwBZo3SXiAu3WOI7HoK53NMW61MExtyxLrP0Ra2YGxjLlFW4vlnQDbGT3g2Qzku5lZCXauE+vl6XZEMqWfW+iS4yl3WxgyYqtXQx+3F4NcWob3260/KB2wYV8jaeteMV9hkEQAJe3YMCJJQKbP3WG6v0dEjl1aMuL9mmyCxoQIi1YFOsufIS6LUorSab4zksq7SEI5d1tNEfxVU+Fzys/jfILNEKtcY3oEmc/gLcqnwSR/HQUB3n0uqz5FeYNrRjiAkpSS2XTWFgBzYgh5rwEGTfWZIVEOBnBEW167As3hWrX3gS/GWx13vK1e7EZoOsvK68+aoh7vF9d35L235nfHCoKuoUxKcoLxCB66bUnxIfbJmIU3fb6wiNjfryNECnLQt/45c7jEuxTS25HuD91XYdlM4KFngCwvQfNvtqUJKUEJr/UPuNQXiG5ISXXG2OJ2erwovNIKTFMF4W5JpSy6hn0J5N/sj/LuzSF3Kdiu995AcYs2UTsXmWR3q1y+KCt7NXFqGcJAdjuuGLXrUuxmNfc8nXqLniA6NNTCNIg5RLI8ESV3GBguN4cR6FCNK698/yj1XaNH7uJL2SH+78rym+DMrkzehgyzSfn/htNTBerYAAF6o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(66476007)(4326008)(66946007)(5660300002)(86362001)(8676002)(66556008)(8936002)(107886003)(6506007)(6666004)(54906003)(508600001)(6512007)(31696002)(966005)(6486002)(53546011)(316002)(38100700002)(6916009)(26005)(186003)(36756003)(31686004)(2906002)(83380400001)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGVHaXQyeUJ0N2VkSkwyL0NyaTdRdG94Mk4vQ2lxQUpkYUdpSlQ5bFl2aTd5?=
 =?utf-8?B?YWk4ZXFCTEkxS2x0cGl2cDVrVVFSK2EzcVZFWXRDZkZLSktlNEZRdlRLVGtK?=
 =?utf-8?B?NU9GYmEyVk01SHNGY3ltZHNoNURZYmtPcTlnV3FaeTMwa1lPRXpzQlY1TzJt?=
 =?utf-8?B?KzJ0MHBaUmNHYy8ycVRHUnVJTVNMdUdYR2pMZG1tQ1dZdXVrZGJpVVNmV0l1?=
 =?utf-8?B?Y3dzT0N0UUltdDdCdFA0V2N2R0dNNGNGOXdOZXM1SGVQaTgwQlBUbDE4aGtx?=
 =?utf-8?B?bTEyRHIwT0R6KzNCVEJvQmh0ZjBHT3F0S2kwVEwwNGpOb0FvV2VKRXRvQ3p6?=
 =?utf-8?B?NDNGTjF3MTU0cVJjS21DZUtxZnh3N0FFK3gxcmozY0FYNlFWalZ0TmoyUXNV?=
 =?utf-8?B?OGtJKzQ3NDl0UVJNcTEvUEgxWjZ0RlhqTVFjd3BOV294Vy80UXo5WWdqQjgr?=
 =?utf-8?B?RUFwRThIbmdXQ1g3TUs0SmJaaTc1bWovb0E2Zll1QkhNVlNnUll5ZE9uUkZy?=
 =?utf-8?B?QUNyUjR6R1Y4bytJMmVlWDFIbUlzUE9iSHB1RnJXMzB4aTdwM1FkMDdDRlVT?=
 =?utf-8?B?WmVsa1V0cHNqaEFDcUdoenArUHF1VDVKWk9EeUxmMHBMU3Vjc3JvVXJyWFN6?=
 =?utf-8?B?bzRvaU4zOVdUVVVlRnREbkUwTkZtK0hnSmdWT2VhU2ZrcDNDZ2Rveks2a0dO?=
 =?utf-8?B?UDlWSnFkQXdTV0VFNzdwZm1EQlAzZGtRa0VETVhmVlJ5T1VXNUZWMGhwNk4w?=
 =?utf-8?B?MVJhNWNqTyt2UHRIcHhOdk1CSk5wOWlLNUNUb293QlB1MHl1YXFOa2FrMTc0?=
 =?utf-8?B?dUZUV0NxLzZiQ2dpVHpkV0dnLy9WU3liQW8vMFNrOWt6R0pSZzlQQWNMMFpE?=
 =?utf-8?B?MzZsajhoNmFramoxWlBhWWxxQkdrcDYvNG1hNWhpbkw1NUt1djREREtwMStB?=
 =?utf-8?B?aDhMVWxSUUE5VDRHWUdxeUtUWGlGVGxpQm84TGZJWXdnK0ZDVnBkMkRJbG45?=
 =?utf-8?B?Q1A2UUFoUHQ1OEJyeWR4eXlqa3B0ekdUUEtwcHhaeFlaL1BIZG95VUlxWE9t?=
 =?utf-8?B?WVAyTkNEbWxLeXpLSnB3ZmRYckFSMVBnaTJZN21XN2NaMys2cDlRdGIwTUlr?=
 =?utf-8?B?Y2ZYNEgrTFh0OUMrbng3bFcrL1p5SUZIWUNjamNZNTlMN3hzWjZWTm1idUky?=
 =?utf-8?B?ZmZhRkdZNDhoU2ZtaGZTaUVtS25JMCtOYlN1ekg2K29oVXpWVWJkMXh2Vm5h?=
 =?utf-8?B?WHpHeEZ3dmRFRUx1ejBwdWh5ak5EMFpqTkx2V3hRWDd1YmdtS2VscnZwd3Jh?=
 =?utf-8?B?SDRKTGkyeElFdUtJUmJpUGNFdUxEYXd5Y0NrOEp3clhodTN6KzFqVDhEcEtl?=
 =?utf-8?B?TkhxWEFtK1dqbkM0TERNMDNQY2U3dmVRazRLSWs3ZVJ1bDUrNkZJWGNTRE0w?=
 =?utf-8?B?WndjdnNzVHM1bTBIT0NSeXJLMlMrS1ljYzVnUkUrbC9IckcxcVJFelNQbjZL?=
 =?utf-8?B?WWFMNjh4bm5aQUlLZitwTHF6b2xiMHNZWlFLTXpKMHhxTy9RV2p2Y24rSDI3?=
 =?utf-8?B?aDFoTlRTY1c2anMvSVlDcUpqUEJLcEE2amhnbXB0aEVuMGJaeXRTd2RIR254?=
 =?utf-8?B?OU03RnhUcG5UY3VvbVhEdVNSbFQ4TW9iTUNBZlh5M1FkK0tCZjJDUGt6VDJY?=
 =?utf-8?B?TThGS0NObjN5a3RoZ2plSkI0ZnJtaDEwTC9kMUpGVVNNdUR6aGI3Q3NjVWFZ?=
 =?utf-8?B?STl5bnFkT05STVd3dWRTT0luOWREUURqS0paYUtXQVZnQy9MNnUvL0ExMWRp?=
 =?utf-8?B?T3RQUVYybE5jdGk5cTNIU2RzU3FuT2JwY2JzYmVJVGF2SzF3aHhZVHBYNURj?=
 =?utf-8?B?ZHp1NzlvS3ZqcjR2ZUhuaitrZ04xUUtjR1FqdnlkcUlhczBMVE5vb0lVYzJx?=
 =?utf-8?B?aU5iU0trdEJvYjVac3BZRkV6MmY2Q0ZhM21ZN2ZieGRhMHF3YW91NlNHVmlO?=
 =?utf-8?B?bWx5anY1cm9HMDJCUlp2ZlRKTmFGNWplZ2pwODdIZkd1Vy9KWVRuY01id0Zw?=
 =?utf-8?B?cG5JTHpqSnFRYUhvQ3ZDREpScHpMdGwwT21XMjVLVlpZb3RLM2JwSHJ4MlR5?=
 =?utf-8?B?b1VsZTRqV3BwbmpMSTFWbi9GcVJMRW55Vkx2cFJvVHJmYWRBcWZCVFhZdHJu?=
 =?utf-8?B?UzRpYUEreEpmdHNhbVFWQ2duSlZYeWFPL1ltZCtWblZlWU5jZ0JpLzRIVWx4?=
 =?utf-8?B?WE5vaFlJOVJOVHNDbzBFQkVUOElxSTYwWXpkNU9WQ0tqbGg5VkVWUURWdFFa?=
 =?utf-8?B?MzJSZzhoVFdCYXZwdjFkRTVzV3c0SnJLQUR1OGNtU3ROSldkNlNCZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89b2ab41-c68a-49f6-da4e-08da4d2edf9f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 11:21:34.4319 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 49I9xpqU1Ufw8EYb3dzhgj7a/0LSxQ4c1YfYTQilVWOd0IqekYC1peJaEv7j9xfOCJhQfjZ2EdihKHgyUzd4Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4276
Received-SPF: softfail client-ip=40.107.237.51;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


On 6/8/2022 12:32 AM, Alex Williamson wrote:
> External email: Use caution opening links or attachments
>
>
> On Tue, 7 Jun 2022 20:44:23 +0300
> Avihai Horon <avihaih@nvidia.com> wrote:
>
>> On 5/30/2022 8:07 PM, Avihai Horon wrote:
>>> Hello,
>>>
>>> Following VFIO migration protocol v2 acceptance in kernel, this series
>>> implements VFIO migration according to the new v2 protocol and replaces
>>> the now deprecated v1 implementation.
>>>
>>> The main differences between v1 and v2 migration protocols are:
>>> 1. VFIO device state is represented as a finite state machine instead of
>>>      a bitmap.
>>>
>>> 2. The migration interface with kernel is done using VFIO_DEVICE_FEATURE
>>>      ioctl and normal read() and write() instead of the migration region
>>>      used in v1.
>>>
>>> 3. Migration protocol v2 currently doesn't support the pre-copy phase of
>>>      migration.
>>>
>>> Full description of the v2 protocol and the differences from v1 can be
>>> found here [1].
>>>
>>> Patches 1-3 are prep patches fixing bugs and adding QEMUFile function
>>> that will be used later.
>>>
>>> Patches 4-6 refactor v1 protocol code to make it easier to add v2
>>> protocol.
>>>
>>> Patches 7-11 implement v2 protocol and remove v1 protocol.
>>>
>>> Thanks.
>>>
>>> [1]
>>> https://lore.kernel.org/all/20220224142024.147653-10-yishaih@nvidia.com/
>>>
>>> Changes from v1: https://lore.kernel.org/all/20220512154320.19697-1-avihaih@nvidia.com/
>>> - Split the big patch that replaced v1 with v2 into several patches as
>>>     suggested by Joao, to make review easier.
>>> - Change warn_report to warn_report_once when container doesn't support
>>>     dirty tracking.
>>> - Add Reviewed-by tag.
>>>
>>> Avihai Horon (11):
>>>     vfio/migration: Fix NULL pointer dereference bug
>>>     vfio/migration: Skip pre-copy if dirty page tracking is not supported
>>>     migration/qemu-file: Add qemu_file_get_to_fd()
>>>     vfio/common: Change vfio_devices_all_running_and_saving() logic to
>>>       equivalent one
>>>     vfio/migration: Move migration v1 logic to vfio_migration_init()
>>>     vfio/migration: Rename functions/structs related to v1 protocol
>>>     vfio/migration: Implement VFIO migration protocol v2
>>>     vfio/migration: Remove VFIO migration protocol v1
>>>     vfio/migration: Reset device if setting recover state fails
>>>     vfio: Alphabetize migration section of VFIO trace-events file
>>>     docs/devel: Align vfio-migration docs to VFIO migration v2
>>>
>>>    docs/devel/vfio-migration.rst |  77 ++--
>>>    hw/vfio/common.c              |  21 +-
>>>    hw/vfio/migration.c           | 640 ++++++++--------------------------
>>>    hw/vfio/trace-events          |  25 +-
>>>    include/hw/vfio/vfio-common.h |   8 +-
>>>    migration/migration.c         |   5 +
>>>    migration/migration.h         |   3 +
>>>    migration/qemu-file.c         |  34 ++
>>>    migration/qemu-file.h         |   1 +
>>>    9 files changed, 252 insertions(+), 562 deletions(-)
>>>
>> Ping.
> Based on the changelog, this seems like a mostly cosmetic spin and I
> don't see that all of the discussion threads from v1 were resolved to
> everyone's satisfaction.  I'm certainly still uncomfortable with the
> pre-copy behavior and I thought there were still some action items to
> figure out whether an SLA is present and vet the solution with
> management tools.  Thanks,

Yes.
OK, so let's clear things up and reach an agreement before I prepare the 
v3 series.

There are three topics that came up in previous discussion:

 1. [PATCH v2 01/11] vfio/migration: Fix NULL pointer dereference bug.
    Juan gave his Reviewed-by but he wasn't sure about qemu_file_* usage
    outside migration thread.
    This code existed before and I fixed a NULL pointer dereference that
    I encountered.
    I suggested that later we can refactor VMChangeStateHandler to
    return error.
    I prefer not to do this refactor right now because I am not sure
    it's as straightforward change as it might seem - if some notifier
    fails and we abort do_vm_stop/vm_prepare_start in the middle, can
    this leave the VM in some unstable state?
    We plan to leave it as is and not do the refactor as part of this
    series.
    Are you ok with this?

 2. [PATCH v2 02/11] vfio/migration: Skip pre-copy if dirty page
    tracking is not supported.
    As previously discussed, this patch doesn't consider the configured
    downtime limit.
    One way to fix it is to allow such migration only when "no SLA" (no
    downtime limit) is set. AFAIK today there is no way that one can set
    "no SLA".
    If we go with this option, we change normal flow of migration
    (skipping pre-copy) and might need to change management tools.

Instead, what about letting QEMU VFIO code mark all pages dirty (instead 
of kernel)?
This way we don’t skip pre-copy and we get the same behavior we have now 
of perpetual dirtying all RAM, which respects SLA.
If we go with this option, do we need to block migration when IOMMU is 
sPAPR TCE?
Until now migration would be blocked because sPAPR TCE doesn't report 
dirty_pages_supported cap, but going with this option we will allow 
migration even when dirty_pages_supported cap is not set (and let QEMU 
dirty all pages).

 3. [PATCH v2 03/11] migration/qemu-file: Add qemu_file_get_to_fd().
    Juan expressed his concern about the amount of data that will go
    through main migration thread.

This is already the case in v1 protocol - VFIO devices send all their 
data in the main migration thread. Note that like in v1 protocol, here 
as well the data is sent in small sized chunks, each with a header.
This patch just aims to eliminate an extra copy.

We plan to leave it as is. Is this ok?

Thanks.



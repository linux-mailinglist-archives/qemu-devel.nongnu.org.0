Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C1C5F51A8
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 11:18:22 +0200 (CEST)
Received: from localhost ([::1]:42096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og0Xk-0001RN-Cp
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 05:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.zhadchenko@virtuozzo.com>)
 id 1og0U7-00089Z-Em; Wed, 05 Oct 2022 05:14:36 -0400
Received: from mail-eopbgr60111.outbound.protection.outlook.com
 ([40.107.6.111]:57991 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.zhadchenko@virtuozzo.com>)
 id 1og0U2-0002TM-3j; Wed, 05 Oct 2022 05:14:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XvAm8pGnJAOr0tkzRU9yH7GHHWINLBm5fonKeXwGg3p4h4HjyXIJVIe1icyn2gOSqLni6Noa65K6UXdXDpNI67+FHeyG+TFqqZWOo3Y8psfmacQEMWKGJIHgvAleV/550HGAqi+wwQtXOZxo0re9uE8WJrV7SbgxV6zIw5ZAC+k0zAJEKOjvrorenF7jJdD+PLWB72hT00dCvRFiEDzMNoX94+5Ksf/MBVB3iSg1skJTTYofHWEuJb+z8JVl9kqA5NPhRB6D9ARHl7uqcUthWdsosltkLRdbdKtNAdcRtioqhz24UUqCoyrUtgX86BHC1kd+f+dGNU3d4DVfoGSwEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DpfSLsotsF2KvaXk27aY6rhADsuXzOR8wcwlY2nhpP4=;
 b=MBuf6McR1wXml1i55xnx6hvM2jQvUMEEdPpSttu0nUErVvSpiwxRwfYTL3mtAIknEx2CmEWQqFBvUoTNsudYwR+exu3BaBdE0ztvQT1ZZNgV7qZlaanc4OxC7W/jkdUy64jLEdgHeUYEIVOwW24jt/eZvv7C0qxkjlhs6xcX5bWNkQjs1rYLiJxCfWekSPPa5Y0wnVEjUb3Z0UQJERA50HtAcycCBu/7zrLVmu2p5DenvkCEPU5Picw4MSUeRqprv5nbcrZLiwyTU8uqMbyZ0HPFbuoZEnOcsMq2vTLkq5WkkONTRJQbr/+SQ+JS92POY37fYELCnmR9xwv/xpgufA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DpfSLsotsF2KvaXk27aY6rhADsuXzOR8wcwlY2nhpP4=;
 b=t1sZGweA+vWIQHlKqwTLgsNoccmPMdiSlbK7Oa+bf40WJs4suYhlWBRrb0kig3GDo4qYT/jdRdLql7IvQfyVXrZ9s8FcvpFBcTMndsGclK72s+JJ+hYBmeku+gwbiSscsHXIiKW6nP1dqXmkYTCToOJrSfdcEkOa2JIvvDmvWsCcPlzOD+Kq5a+jsC9HkAdllrWCGqjqPcb7/aCQTabxjKqfQeU7LOtIxUD/Ms8RnQxr7KgoxkNBGUYkJYrOX1IzIo3zBds7LJaJ8vawwBqVwBGpGTqF8JLYB0k+2xG2Bg2uPmeq7/OMcuUqaYIxd1hMeZXZO0avYNkzYG4Y0D1fPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM8PR08MB5732.eurprd08.prod.outlook.com (2603:10a6:20b:1d4::16)
 by VI1PR08MB5517.eurprd08.prod.outlook.com (2603:10a6:803:139::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Wed, 5 Oct
 2022 09:14:23 +0000
Received: from AM8PR08MB5732.eurprd08.prod.outlook.com
 ([fe80::f7fe:fb10:40ef:188d]) by AM8PR08MB5732.eurprd08.prod.outlook.com
 ([fe80::f7fe:fb10:40ef:188d%5]) with mapi id 15.20.5676.032; Wed, 5 Oct 2022
 09:14:23 +0000
Message-ID: <d8d660c2-9539-8afd-cbaf-683e8e25a61f@virtuozzo.com>
Date: Wed, 5 Oct 2022 12:14:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Subject: Re: [RFC patch 0/1] block: vhost-blk backend
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, kwolf@redhat.com,
 hreitz@redhat.com, mst@redhat.com, den@virtuozzo.com
References: <20220725205527.313973-1-andrey.zhadchenko@virtuozzo.com>
 <Yzx34Nu4h+3eMDne@fedora>
Content-Language: en-US
From: Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>
In-Reply-To: <Yzx34Nu4h+3eMDne@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::18) To AM8PR08MB5732.eurprd08.prod.outlook.com
 (2603:10a6:20b:1d4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR08MB5732:EE_|VI1PR08MB5517:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c514fbc-4e31-4306-b24c-08daa6b1fe31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TDh5EgVym8/gxyy/s4m/b6Kp5mz2xVBDoovsKMNk9jnINWGgQLo4uBU2wsMbYL44qUIgb919Teh2+gjVzFXOoRAJFUMRBuVWiWI8M8sL7dJXPJ1mLiCbNuwMnb2WldcXqnI3OtUyAb2n8wO21PD1qR3AwbGbNpXywkNp2eyt/MCB47pW/jDAYVZBPfmsKlXTtOD1Yz/FiFiUkplKjT8ECy5qHd1yRAXl4YKCgwrsIoNmtXEzHhUTUi8fbrfNxfiSoTJUkZtmby/+2r8i7wlbOaTg7vDFQh3Tgq9fl/8dvDSCpAD8BOr2lN9UhTN4qagNYHJ4Zm/HabB0S4+WiK9uCnBR20JDQ4vdzVXGyDqh2PUpCaeqZGZ7w9YH8FYsujyOIHwZIX5rmvQu/esfc9wFoMIzjeKSPi+cabTjEWBrtQc8wMuqCBTFx1+vJAgtuC1LmuL6k/UZQ1QrFtTEaraYsc7L2GUj0cRXUzMnkTy7AM1RBPz1kwkcYXH3G1ukeaXe6HUt3MktnkaMgTXgApnpP+rFeNEOo+zm0vmARLyvOxsdX7gN8AN6x3MP+pvWEB85O5cOxw8y8A7EsyO1R4RnDOvQISkxQZa1oTwgCtzbZg7llWE2BKMMnWwtfEdEdPnds6ftNwWFEMfgU0cnAQaXCYLHUMnuU5rn6cTbV5zXSFcmLbGrcvHQV7z22sNJp/HXMM/fUupFq+nb4JbKDuzy19uo9tHRnZb3dvTH5xUeBjtwL5/Z7ZSJJ7D8ej7KDE6PJGzEGM9ZP87P8nVIwOxk/LipSwHTpdKwMUBiBqutiWY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM8PR08MB5732.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(136003)(376002)(346002)(39840400004)(451199015)(6916009)(83380400001)(2616005)(186003)(38100700002)(5660300002)(44832011)(41300700001)(2906002)(8936002)(966005)(53546011)(478600001)(26005)(6512007)(6666004)(107886003)(6506007)(6486002)(66946007)(8676002)(4326008)(66476007)(316002)(66556008)(31686004)(36756003)(86362001)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3JqUDl6bSt5MElQam55VU5KZFNwM2NQZWhaS2pFYWd2WEpSSE5vSlpZZnFk?=
 =?utf-8?B?ZGtmV3JxOTBJV3h0cTYxQ1VyQUc5WEUzeFVlbDFVTVNDUlc3dFFIekhCbyt5?=
 =?utf-8?B?QzFCQWlXN0RSUVd4UDkxSDI5RHgrSFBMMSt2QytNUUlLbVFFTlo2eGM0dmhn?=
 =?utf-8?B?UElOT1M3aGc1SlVaTk0xbzZFdmplTDVmZlVHWFhQbGhxNVhJejRiVGk3dkNy?=
 =?utf-8?B?MTlCZHRZNVB2b3BSRVpkOWlzc2RTd1pNbW9nL1dkMmV3c2ptdm1XVUxIbTJM?=
 =?utf-8?B?TXN2ZllsRjE2akVnZ082MGZNUUMrY1g4cHFaVnE1cUFCOGMxWDNXTzBBVHpt?=
 =?utf-8?B?clZWZU9LbXdEeVpFMnJOenZmVGxiV3JKMmxUdktpM3czNEowZUt4TVRzMzBM?=
 =?utf-8?B?QjBHM3NGVU1ycnFzbFdSNVNXVmdYNTNXKy9RSDdqMG9iR1kvdFp3M09WQjZD?=
 =?utf-8?B?TUp1S05xMXBSd2hsdGgzUUNRalo0a0dYVklNSlJ6MS8zK2haWitjQUdVVUVD?=
 =?utf-8?B?dHozTmlLbmdDcEpqdkdwVGUzZWcrREhQOGdSUzRZVS9rem1Tc2tDK0NldVE4?=
 =?utf-8?B?MU52TGZtYThLbDdJOHV6U1FvcW9OQXZGUmFQNWNvVDlmZ2gyQnA1ZStmWm8v?=
 =?utf-8?B?VHVTUHNrZTJwT01SOVNIUnl0Z3RCZmpBM3YvV0tDbElYZVZTVkJOZ1I4azJn?=
 =?utf-8?B?dDJiL29UWGtxOWI3eW9hbmlUZ3ZlckoxbFUzYWxnTDcwdmhsTzBQM2llL3JJ?=
 =?utf-8?B?bTZuRTBjblk4MmNXaEp3MStZKzRSR3JFYVFsZUlXcHM1QVAxZm1YblpzSTRF?=
 =?utf-8?B?TzJ3OE54ci9kV3dleURqaWtCTWdNVk9mbHd0U2dHVklqRlMwNEJUd3N1Zk9q?=
 =?utf-8?B?Ty90eGRXOElNNG5EUHNuUVI1bUJqZCtvYXdiakpTWnE4Q2M1ZmowenZEZUFI?=
 =?utf-8?B?MzUxbXJZYlF6Q0EyYzdFMWI2MkdYSXljY0tPcnZMTURaMlVXY0IyRkgybHNN?=
 =?utf-8?B?cVhVQnpUdUFCSHhxeGE2aTdVWnU1M3h1NWUvK0RGTW1GN2xuS1JQMDc0U1NM?=
 =?utf-8?B?U1E2bi9kenE5Nk5hZjRyQmtQdk9tbmRUOTF4SDlxc1hYR1ArYzBpclR6YWtD?=
 =?utf-8?B?WEhvbFNqc01lcmVPWUN4dUxtYzFOeXBjYWZhMUVPUzhlQzk0Y2c0TFVVMkYy?=
 =?utf-8?B?Q2VsUDB5UGxPUDNsNVRXdk4zL0JPQzhFdEFYdWwzRzRwQWYyQW5JcERYU3JS?=
 =?utf-8?B?cWQrbVZQVjRYUHRZMEZzYTU4VS9uS0pvaEJ5NitzVDNJbmxsVkduUTJWa1V2?=
 =?utf-8?B?M3NOaGQ4c1FEeVVhV1JCa2gwRlVndGhKNk82YTcwYVV3R1BPNlp4cEVDVVpq?=
 =?utf-8?B?T1YrbmFqOSt5R003ODJGOG5UajkyQUZRK3lHQzBNZGNwdCtobXBFYjRSTnl1?=
 =?utf-8?B?WWxMZzVJKzhCQlhaeDI1S2V3N2Y1NDF2em95T0JNekorQk15UWhRdVN3Ny8r?=
 =?utf-8?B?aE9GUnIzYmZKTjZXQ09mM2ZKKzA0VmhoSXNobEVPR29CdjlaOWZLNXNiNEtl?=
 =?utf-8?B?Z3VkS0x4TkMxWnpyMkFjS2lMYkxkZWFoK3VnL2Y0dmJmOHVIeUhvWk4veWNG?=
 =?utf-8?B?K1o4bTVZYkg4Yk9ZWjhLS3B2aGNNbXR2TVN4WTQ2a0R0NzFzU3F3TjE5QkR3?=
 =?utf-8?B?aktaTWFlVzdCVXJCK2dUV3hsS2xPTnlsVXdETUVoRzhtQk9ZYjZZSGFqZ0Y2?=
 =?utf-8?B?SnBYZmZHbGNiektpQXVkWXhEQ0YvWndOeHB6YlRzRm1LVXZGcFJlOS82Uk81?=
 =?utf-8?B?aWNEaG1wUGdBWWdyNmI3V1F4MGk2Vk16ZFFab3pVU0tTQjFFUzlBTWtYQVA1?=
 =?utf-8?B?ZVNNZ1MxYTdZMEIzSGh0RTVOS2ZDeklheXZoZ1QrTkgwblRNM2xYZFB1K091?=
 =?utf-8?B?SkM4QTJlTkpyK0VpMDNPZEU2TWxOd01JMFlza1BzZCtsemFaU0NOaHdlQzNw?=
 =?utf-8?B?VkgyTTBGZG5RNXRYVnN4THN6SFBGNGZlNmIzVnVHNUZnK1FFdFRpUHFRMXVX?=
 =?utf-8?B?MExxYzR6UFVJckh6cmhKRGJyZ1F2ZmFjWVRhTUF0aWpJZnZDTnRsaU5JbzRT?=
 =?utf-8?B?V25CQkVjcmxDbzN0dFhTQVRDdnY2Q2FyckVwTkRySTZ3ZHgwSm5KR212Tk9V?=
 =?utf-8?Q?HmP16pgOuDwwsyKQorUpZ6M=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c514fbc-4e31-4306-b24c-08daa6b1fe31
X-MS-Exchange-CrossTenant-AuthSource: AM8PR08MB5732.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 09:14:23.2000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: txLhYmutFFK2u5ciG06BYOF0sUZRQTH1c3Ctv7cf5Jo/+F2jJb2ad4499nU2dzspm7u1XkDBjA5u4mjvRwLguuSJyZ83o7AQJaH81pYWi8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5517
Received-SPF: pass client-ip=40.107.6.111;
 envelope-from=andrey.zhadchenko@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.449,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/4/22 21:13, Stefan Hajnoczi wrote:
> On Mon, Jul 25, 2022 at 11:55:26PM +0300, Andrey Zhadchenko wrote:
>> Although QEMU virtio-blk is quite fast, there is still some room for
>> improvements. Disk latency can be reduced if we handle virito-blk requests
>> in host kernel so we avoid a lot of syscalls and context switches.
>>
>> The biggest disadvantage of this vhost-blk flavor is raw format.
>> Luckily Kirill Thai proposed device mapper driver for QCOW2 format to attach
>> files as block devices: https://www.spinics.net/lists/kernel/msg4292965.html
>>
>> Also by using kernel modules we can bypass iothread limitation and finaly scale
>> block requests with cpus for high-performance devices. This is planned to be
>> implemented in next version.
> 
> Hi Andrey,
> Do you have a new version of this patch series that uses multiple
> threads?
> 
> I have been playing with vq-IOThread mapping in QEMU and would like to
> benchmark vhost-blk vs QEMU virtio-blk mq IOThreads:
> https://gitlab.com/stefanha/qemu/-/tree/virtio-blk-mq-iothread-prototype
> 
> Thanks,
> Stefan

Hi Stefan
For now my multi-threaded version is only available for Red Hat 9 5.14.0 
kernel. If you really want you can grab it from here: 
https://lists.openvz.org/pipermail/devel/2022-September/079951.html (kernel)
For QEMU part all you need is adding to vhost_blk_start something like:

#define VHOST_SET_NWORKERS _IOW(VHOST_VIRTIO, 0x1F, int)
ioctl(s->vhostfd, VHOST_SET_NWORKERS, &nworkers);

Or you can wait a bit. I should be able to send second versions by the 
end of the week (Monday in worst case).

Thanks,
Andrey


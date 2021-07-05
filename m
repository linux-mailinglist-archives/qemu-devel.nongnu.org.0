Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4A63BB89C
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 10:08:56 +0200 (CEST)
Received: from localhost ([::1]:59848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Jex-0003Zt-VM
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 04:08:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0Jdd-0002EP-VF; Mon, 05 Jul 2021 04:07:34 -0400
Received: from mail-eopbgr40120.outbound.protection.outlook.com
 ([40.107.4.120]:57034 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0JdX-0006gN-Jg; Mon, 05 Jul 2021 04:07:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bqab2oM6cLZDw3ucyk28554+RFofTDW4Xx0wH31oYJXkj/kmXTCEOX9lJK1/Q8/jM2nYOcii1IEEhOUUiahavpylkzupBFHTY4GsV9MNHMrQUAXHJ0NtKWYB/FQ16hcfG1btNU8mW+fp4K6FSRH1BUEOcc3+TaM/Pf5j2ibpjZQbZ3oMitAYhqtpRTddwucClaHrSI6xlCIHt1fKESdbCK5+4hqohrDjAgyYPjvWK0n70CknhWbgz4g7nYraZPuAIbrSMZZq4p279FUEMtHNHxlmHM0Aa3CHrhPTdJUQu6UVyAgvjBRH/Ht0gQucNm90vSjlXzsazaAUmv4KP6xxtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rbVKZmDIKq1jno4fBNiCZs7MCU4U8kqrQeer98JTD7Q=;
 b=gxh1AI8X3Y+HOa7fAapEd/LVKs2umMtzhexitx35lG0QOZSVfiSHXRQZCVRiYI7YD8GCRh2N56UJxxWiNVMBxPGwx4i+EMSgqREffgn7EFBFxZMajnGK7sdWsFvCyLEj8jnZK4fBm1tXrRcoAeQRy7Kxi5dgur9dN+fe712nReP4GPf3USQYQ4R43cF1l8u/VRlOTFYpRHSzpbkGYYSSfsco/J+fPNFYhL+o/tlU6SRS1Xuwl+46sYBe9dgefAzYXGca1jfyBb10B1yeAgfBr1DaKkIRD0ZrTU9ng6zPjpliAX1qRVDqwGq4a8rUckCLM6KxIWg0W3oFgPUqZ3y8ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rbVKZmDIKq1jno4fBNiCZs7MCU4U8kqrQeer98JTD7Q=;
 b=QISZgksCmO3oTerwqzmPvAsz2TCfGh9hcqNpNy38JHpa6ZV6rOb4OF3Jvxo+woHJTyK8ZyCo5lq190r+Q56FMdukCYMKR7+EEptiyO3qmkKAjFmhIT1iI5VIHImh6UlU2oF3XFwYIXsFXIUkpBWPlGluA5F/axM7AWme7G9Og7k=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1716.eurprd08.prod.outlook.com (2603:10a6:203:39::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Mon, 5 Jul
 2021 08:07:24 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Mon, 5 Jul 2021
 08:07:24 +0000
Subject: Re: [PATCH] nbd: register yank function earlier
To: Lukas Straub <lukasstraub2@web.de>, qemu-devel <qemu-devel@nongnu.org>
Cc: qemu-block <qemu-block@nongnu.org>, Eric Blake <eblake@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>
References: <20210704000730.1befb596@gecko.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <ea2b50e6-0ad0-fe31-8445-2177780a8d9a@virtuozzo.com>
Date: Mon, 5 Jul 2021 11:07:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210704000730.1befb596@gecko.fritz.box>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: PR0P264CA0094.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 PR0P264CA0094.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 08:07:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 484d10dd-59b7-4bef-40ec-08d93f8bebde
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1716:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1716386581182A9613F1E58FC11C9@AM5PR0801MB1716.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SvXtnR7cRcbEbR4om0KRB19wEoX5FZ+I7jrVvegUXQpsv7hZF7l8DMUwxBEE6FxlrPekLcgxCVC1UjpO7ztdNKloZpLLZDgtHyJKflNnYEj2tg3rRvES1DR/GimJa79JfIdkSrwTm6yL+pQ1BkH4X4d3ZhiTo+3Dyod2+8ROvISs5SHjKAUwzUIO/o35s/cB6s4AayNVw/S9VvSiZ0jmHhLBOTrXMyX673oPChiNKVIriI+C+ygqZZp6XFhCLOLUpiqy0I+xhpn2vSN7T4SmaDGPCr7RBXE1VcQqRLdOeOwR1zw6/UxMTpqJROkf8pjy/jU2deJ8Mw4ZKiOuejAoAl9Dcwph/gWIEa03g4hqd1THHLUB8AaSr2zGUXYnyBZ30BGbG3QQgYnv97UZAckmW6bu96ZqHB7/2+2TYmgbRKebIH63H86Wy7wXhV3zUopd/MDioz4qTkUPPwcwul1pgzC3iHFEBYMt6LX73a1/zn3dmx0qVjbg7/Wj9TXVPku0QC2X3DcdJW7P8gLVZKl0SjbtPoRkwDMmh9pJqvwtyxK+O6E2BFtePRKk0VbXzAuXsLqehko5En1ezB2iyyACr9YZ9rRHYo7p9r4xq5lNeTLpJevMwvdWwBfzjy8elRUTV4UTNsxO0EIIj+4t8+ayYTOA75qQ/Mc87BtjqpX8937BUcaAupUPODqBTjG2zYDawoxp4Rn7X1NwdtgwpKrhZe0W3Y/VWr11g+77P/m+eeqDXD6YdEEkdSMFaeKC0BixHu06SoNY/lwDrHHa7csLOQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(396003)(376002)(136003)(346002)(366004)(16526019)(38100700002)(2906002)(83380400001)(6486002)(186003)(38350700002)(36756003)(956004)(2616005)(26005)(52116002)(8676002)(66556008)(8936002)(86362001)(4326008)(5660300002)(54906003)(16576012)(31696002)(31686004)(66946007)(478600001)(316002)(66476007)(110136005)(4744005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?iKXfO6jrcBT0HeKZGIoH2UWonqQQQyxqzXGc0RXUyyWGXj8gQeeeJ/P9?=
 =?Windows-1252?Q?P9MVVII+355Ls060Q52F/E5m1ILB+kf23edBl0M+VSPb2swN5ONTBJw6?=
 =?Windows-1252?Q?Cwutl4ALpwCQb0rkdpucsyewir2imkVxmikS9/Ubn+g3mY0PGJATyL4C?=
 =?Windows-1252?Q?TcAYI9j0bRZ0ai601kUh5P+A/WLE6AG+Rz9nAhz8AkcCoqcK9rH5vhas?=
 =?Windows-1252?Q?ar+MnFx4nGK47u3lL9Kw2RSTwxT68aA92MCp1gpGlPEW6fngBNcSaUp2?=
 =?Windows-1252?Q?CrDvPR1QNjGiXARFVecQ7hwAV3BmsdIIsmITP9kNLuMSexeeTX1gflG9?=
 =?Windows-1252?Q?CJY7QZUuVjxwWek4xlmfmuqe0BddNsHjkv2fAma3Xg2zTW2qmnPH1TTb?=
 =?Windows-1252?Q?98NfSDTf8nyKZut0lkBb1JLkRCTI0WCEDGQWTTBYDfngr6gO4njtgi0M?=
 =?Windows-1252?Q?4NQYVZSi6rxJMvZAhnNlqHrhAmV4oyu/7SqRf3Wa/uO+JxAsVXuERJll?=
 =?Windows-1252?Q?lnGaUw2a6lWfNiQOD5JkDTnVXiQ/ZII1YvQQ4nYwMBjXUkHQ4YNk5RjT?=
 =?Windows-1252?Q?RiAZVzgrAI5bQL6mkmiiwDRFAy4Qh5rTaWcy9pedhBSrNJVZuzCDX0Sc?=
 =?Windows-1252?Q?ZYAGk7Vijm2jZGky7dF6ImpCP8JPlvWqZpKW/M2CNBIgYhJb0XsvVv7O?=
 =?Windows-1252?Q?++9FPVJ/nZz5j2SiFpraFSgD/PYXnBxM/WFnJsm2ymWVfX+fmPisTMXA?=
 =?Windows-1252?Q?yCg8vIFwzph/J4dtAYh1MYSi0JuYGWy6+Nklav7Qph6MEm/L2C9tTs0e?=
 =?Windows-1252?Q?ypC3m645iNNzVkLlyh9+HC8ba0xdAXa3HZJRqVbdw15DupOnyt4YVQqi?=
 =?Windows-1252?Q?DpE56B+MoT+VCuE/hpUOKsTki87Gg8rJp7mwScMr9YgNZsSPy7zuxuRt?=
 =?Windows-1252?Q?mxDBSTJj22c/XTUCOLFl/Dtgq/IFID133gHNtQDcSVRPcZBpvkzZnH8G?=
 =?Windows-1252?Q?XTq+SvYMVTANRni5S/ymkcHOoQ8bnoMPWTQgoTlrr1aCyIBRoDaZFf7C?=
 =?Windows-1252?Q?+cYY7DDr8QB2OxN4y/myDxgTjxjYo8Td5Yu0pmi926zGvTIMrAZuA/O1?=
 =?Windows-1252?Q?hKCAmFKzDXUB2j9q996HgV969a3pt+cP6lJMIFlZdYPXN3GHt5lV/fec?=
 =?Windows-1252?Q?QuH5oTgNW43QwHJbahsbSIycN9I54Ap2v31bPaoY04hQsKsywccqfOSH?=
 =?Windows-1252?Q?vse0rIL1aUSzFNETAjvLuFIZ/D21VFf5sjreclrOrccKRfQgp8dW3wpb?=
 =?Windows-1252?Q?A4zkWtEsSk/FnQY+RyYMVhPZ2Q7LvdMZMYawqqynlk2ncRtmAEIaNc3E?=
 =?Windows-1252?Q?4ckc3bRDMwDrHA/37sxXWbsxJiXTZ2Vvg5u0O7W3hQSFwbDfLas1DCL7?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 484d10dd-59b7-4bef-40ec-08d93f8bebde
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 08:07:24.0797 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4VnSLGLcoDoPH4McePuf4lAQvz7r5hkz4JQRkLQPRC5UYj3dvVZHQzCO1v2S6XRVhGT3AY3zGvdtYbvtntDEQVhVo4GIFA8VixlaOM6RA0U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1716
Received-SPF: pass client-ip=40.107.4.120;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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

04.07.2021 01:07, Lukas Straub wrote:
> Although unlikely, qemu might hang in nbd_send_request().
> 
> Allow recovery in this case by registering the yank function before
> calling it.
> 
> Signed-off-by: Lukas Straub<lukasstraub2@web.de>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir


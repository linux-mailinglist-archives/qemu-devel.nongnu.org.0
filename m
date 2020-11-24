Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C53E2C25B4
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 13:30:37 +0100 (CET)
Received: from localhost ([::1]:38876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khXSu-0004Ud-EJ
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 07:30:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1khXRc-0003yZ-JF; Tue, 24 Nov 2020 07:29:16 -0500
Received: from mail-vi1eur05on2102.outbound.protection.outlook.com
 ([40.107.21.102]:8672 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1khXRY-00052P-VD; Tue, 24 Nov 2020 07:29:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NUeLBxpWphk/HEX5zEHlksMj0ackf5BwpuSo5EN7MePORScZZ7jm6Njb5TfVMT4iLhtktdX+cixu/dwoe+HCDYxobat+rSvjhcsheVX4BQ1p/XRNNNjcZxtynR7AAvZ49rr5SlmoPqtMauTqd9zNfqKs6ghfqebfBiF4eGzhR2TSGMiEole+rQmVepgGTbCgF3C/XCw2Ll24CDNWftWQaKVYMCff+4//WZE809U2n2cdT3OnxPqcAZvu9Y1D/M8vX8Dk42/Lpm7XdH6bqbaIbpH14BqUfJR5Y8rMHiHFYW1eAGodtvlQozTdtroOzlscKsXn1GoeZWK7z8rKZHYMVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FiEW/3eREhaEba8N12+uNfm4XoYPAuC09RM63dguuhA=;
 b=POF291xtOgQxdyrDUUBFYb8EdkVbKGIO8HcSLlkI0htOxmSvqjwkyggTyaSvQJcG5EC+yM9xi82eHqGLH9jjMHPtcdDggQXcu2n4zntDs/KkuKwUnFbH8hklKhrH+RNnofCc9SXARe57WDgWmRXRyBNB506k7QvMEXmvyxQRLXtR3JYapbkmwayq75nR5km2nHmMMxLPyAnOdNrMY7vZPS/ygxSgR9prHtoQz5RFcI9VGNyW+YI0mTN/2B786kEJCM9v3qRgS6vtThAy1YVcKpn2yqgEmvnd3Y7aakZNxgO0EoNGeWVgib5zzioRAui6lRnUDx6DFQrcoOhc6ly3RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FiEW/3eREhaEba8N12+uNfm4XoYPAuC09RM63dguuhA=;
 b=k5Osr0RaJRYiiFjW8GXWFTtP05SzxPe0b3dwrlcq06mHNuVez0BWsPe502K8Sl2DXE5aomvfzh/k3kFIBeiNnHQDx/XQHpSwexQH8QaDsns4KIsxv03b/T0mFuG8Ea3JUsk7qwJ+++/fsiqM7MISouhud2y1hKUYSIUIbBAqfFo=
Authentication-Results: virtuozzo.com; dkim=none (message not signed)
 header.d=none;virtuozzo.com; dmarc=none action=none
 header.from=virtuozzo.com;
Received: from HE1PR0801MB2124.eurprd08.prod.outlook.com (2603:10a6:3:89::22)
 by HE1PR0802MB2620.eurprd08.prod.outlook.com (2603:10a6:3:e2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.28; Tue, 24 Nov
 2020 12:29:08 +0000
Received: from HE1PR0801MB2124.eurprd08.prod.outlook.com
 ([fe80::c565:a7d7:a7ab:e9c4]) by HE1PR0801MB2124.eurprd08.prod.outlook.com
 ([fe80::c565:a7d7:a7ab:e9c4%10]) with mapi id 15.20.3589.030; Tue, 24 Nov
 2020 12:29:08 +0000
Subject: Re: [PATCH v2 1/2] iotests: add another bash sleep command to 247
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 kwolf@redhat.com, mreitz@redhat.com, armbru@redhat.com, dgilbert@redhat.com,
 den@openvz.org, vsementsov@virtuozzo.com
References: <1606146274-246154-1-git-send-email-andrey.shinkevich@virtuozzo.com>
 <1606146274-246154-2-git-send-email-andrey.shinkevich@virtuozzo.com>
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Message-ID: <07b186ea-092b-7148-3abd-1ef8095a2da2@virtuozzo.com>
Date: Tue, 24 Nov 2020 15:29:05 +0300
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
In-Reply-To: <1606146274-246154-2-git-send-email-andrey.shinkevich@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [109.252.36.39]
X-ClientProxiedBy: AM0PR03CA0037.eurprd03.prod.outlook.com (2603:10a6:208::14)
 To HE1PR0801MB2124.eurprd08.prod.outlook.com
 (2603:10a6:3:89::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Admins-MacBook-Pro.local (109.252.36.39) by
 AM0PR03CA0037.eurprd03.prod.outlook.com (2603:10a6:208::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Tue, 24 Nov 2020 12:29:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f65e0f8-8e8b-4e58-4bef-08d8907489f3
X-MS-TrafficTypeDiagnostic: HE1PR0802MB2620:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HE1PR0802MB262086E0ECFB9F31701155B0F4FB0@HE1PR0802MB2620.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B69BaGNc7hooP97Cg0kxnTMZrg0hSXOElOplWmZJ0nufFptKDVYbVM2SJ0jwSXDQ6UqraJL7mYvrR8cMvVfC9Eic3wDhA6f6pMhNqrr8KUSr6Q5kd5l0rGq7LisFJ6cxHgEvSIY/8SF4DvODC24+Y+UcC4QwAqA45v48fyvyaWBqu3BAHKov+Em2JVxl+ayt7kIGwr/hl+bcvsC3jhG1Q+8bjht/QMc6vIkzN/huQPDMEW9IPlGpAPW77KPhVfS690CaYDsr7iX11U/bwIt5s9r5sdxKHVg0PhzIeDxfrOWwGbcjjNIEjaczJj4D58PJH1ltXK29exIWmtzuP8zpRRprwtTJXyjHgYRmvtpJGaQeWKUSTlnFGtq6qnocUIjB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR0801MB2124.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(376002)(366004)(136003)(346002)(2906002)(86362001)(36756003)(66476007)(6916009)(26005)(107886003)(44832011)(6486002)(66556008)(31686004)(66946007)(8936002)(2616005)(478600001)(956004)(16526019)(6512007)(186003)(53546011)(4326008)(8676002)(316002)(31696002)(5660300002)(52116002)(6506007)(4744005)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: Tw/1HxQoO3/uYCWXDWtNkzucyLU9TtCGZ7AFP9Okx50DjatH+uFpJVmZN8VLQmP/qq4qG5gzVlAlsflCtWJgucdRzVLemS6mHbVStWHAeGIybTf7qXoL+QFPGH+sg8frGYjaMw5sihX9dgK5EXSSTWURG2cxSv6NG3nI7wZAJ8o4Etg9KZ5pa+aZyC0Q9TqNZKj8Nj6imgDIpBgb+hDoct5zVvMD3pLosBmuBNcLvrBJHJPXuE89bMV+d8U4Kxm1uUrtmNsNgLg3Z/qGm5JT1ShcD8V71x21baMSN7wXlfeHVMvLWPZmxY21em1hnK2PdssFXkP4H5NX5kabn+HepML3V5KuTBEbaqiLEU6RqHAdQJxIkgWVKT1uUrJQwuCCKs6fzw/iHy+VTdtfvWsgGwkdk2DbVzDi6KECKeYCkFNeyqTg8WwUOS1BpcC57mu+ewNHsM3hmix97O9LUNFTfkz+9CETNCin/PNf9OhhjC5GJz+/j61QeDHj83HWTx5HoQBtI386E5lgrn3nn90SY0zx7ylEoqwRVGyZ8lWIGHqf+ba0XN37OAue2lfNdrv6ww3nAwxPlS81+ogui5aNNrJM2hpPFHnQeZAYvcyL9PTVVYw28yFgu8XZVKnvgxE3JOPmiGK1XNa3udZGnlD78bfWHV8Gk1wHvUciQB5BAL20REBQ1X54VhLv67Us/8n0ylQC48v9O8IK+ql1twpNfpiYiWZ2fDpShY5D8XBzT+AlfVxio6yWAsadBe16wY1YCXa6JxHZyO/AIDHKqbxAP6HIGlawx3/V8HUTyHflFw1EGMzV3bAZF5azEZo5ryMncjAL9YSYT20u3+Y6lsd8MZJ+iGvqAwzRHK2ZnCtn3XfKSw9+5iSt7HYFTFsv/8KBL0FtDCqSmOUAd7WLCZNZgQ==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f65e0f8-8e8b-4e58-4bef-08d8907489f3
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0801MB2124.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 12:29:08.0233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eKwohDyJpao7hEehe6w4E6xqWaI/kykXWGvS08Vup5iIcY0LIvvk8Jc2x5/BjNla8QIUjceFpv9k+gZhzxNlaCqw/hLN4y8394uSyFSYS4Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2620
Received-SPF: pass client-ip=40.107.21.102;
 envelope-from=andrey.shinkevich@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

On 23.11.2020 18:44, Andrey Shinkevich wrote:
> This patch paves the way for the one that follows. The following patch
> makes the QMP monitor to read up to 4K from stdin at once. That results
> in running the bash 'sleep' command before the _qemu_proc_exec() starts
> in subshell. Another 'sleep' command with an unobtrusive 'query-status'
> plays as a workaround.
> 
> Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
> ---
>   tests/qemu-iotests/247     | 2 ++
>   tests/qemu-iotests/247.out | 1 +
>   2 files changed, 3 insertions(+)
> 

[...]

With the patch 2/2 of the current version 2, the test case #247 passes 
without this patch 1/2. So, it may be excluded from the series.
Thanks to Vladimir for the idea to check.

Andrey


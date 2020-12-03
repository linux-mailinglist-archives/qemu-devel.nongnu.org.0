Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFCF2CD625
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 13:56:02 +0100 (CET)
Received: from localhost ([::1]:42792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kko9R-0007FG-Tw
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 07:56:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kko77-0005NV-Og; Thu, 03 Dec 2020 07:53:37 -0500
Received: from mail-vi1eur05on2099.outbound.protection.outlook.com
 ([40.107.21.99]:65120 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kko71-00005J-EZ; Thu, 03 Dec 2020 07:53:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PyPsX52iBlisj9E1X+3PAMXNDnKKUfIVd2RWs4dg1mkGQ9d9ESTE0KX9i2VtZkkmvg5YOZVyHOogYXI9eTFa6aN3W+CIWETJxaePJEH4V/qBjHskriSa4g47ZoBCPF5nxruJybxTF5irXckJM45xvaVC2cbOoEgBGN4Y2K/SHapZNmNHLnXeXP4D3w7DnFdVulmis647A+f8uJ+Q8CyQ4wE5Ht6uSvkUWoX6AelnvUn0ZyhxPbhOS0Db8ykhGmDvkRkGupgdYdggiB8VtBlP7dD3XzrHQcfnQLFn1fCwezpZoDgIy5uzOC+TbKsxV35qq1YdtKvG9DVKnWAnURROmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VIR0/Jbzs+a4iK9VzMyjBY4GhFBebAvJ9AVnmrdW3Hc=;
 b=Z8D5KDdUGaJd+JGDBQzfvVXWvhflSdI669YP9eLdqli0enLYtA+YP5P7J+BW//izHq+SsLe25mARzJ5D0xpO9mN/zMz/lh6i+Wy2r8bqvGgKp3dKkK8YbltvA6QGBJExs043dacHO/k94Ejh30maRGFbFui8R5USbPECZqk6GTkUGkL8zrF4n1ga4U61BjPr/MFryoKks5zafMjCcAEj/5eFXayL57/2qrBPvNIo9dPck8MwyG+6WFNy6LmZRSBpnGGzMxxTvQmf6KzwDU3eV076fB6KnUlWG2HzSWXF1KvOc+My+3O8zXyUpnQikeyOjS738+ApDdYSX+UDuyn4kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VIR0/Jbzs+a4iK9VzMyjBY4GhFBebAvJ9AVnmrdW3Hc=;
 b=lBbHROnnI3rJ7m00Jsg4otgw2qY46FD71n3Upwn6C0rDMqIr5kdOFHslb9eYNWTwnXpuGTE9lO+Q7F7j0TfCRuc4iqglKfc14FxPYbdP/obdOLQhKd8QnBkPrWbz/gdNTX0QEjIxNTPFLWur4rEHp8GRp8UTIohTZqQT+dIPGsY=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3575.eurprd08.prod.outlook.com (2603:10a6:20b:48::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.31; Thu, 3 Dec
 2020 12:53:27 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3632.020; Thu, 3 Dec 2020
 12:53:27 +0000
Subject: Re: [PATCH v13 08/10] copy-on-read: skip non-guest reads if no copy
 needed
To: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 stefanha@redhat.com, fam@euphon.net, armbru@redhat.com, jsnow@redhat.com,
 eblake@redhat.com, den@openvz.org
References: <1606933861-297777-1-git-send-email-andrey.shinkevich@virtuozzo.com>
 <1606933861-297777-9-git-send-email-andrey.shinkevich@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <56a6e493-0f98-9aae-10b8-4406ca2656b0@virtuozzo.com>
Date: Thu, 3 Dec 2020 15:53:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <1606933861-297777-9-git-send-email-andrey.shinkevich@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM0PR01CA0168.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::37) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.91) by
 AM0PR01CA0168.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Thu, 3 Dec 2020 12:53:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f0cd6a0-7049-410d-5067-08d8978a6d31
X-MS-TrafficTypeDiagnostic: AM6PR08MB3575:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3575D37CB8B586AB8CA199E0C1F20@AM6PR08MB3575.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 87AUs8ce1zdK+kf0BwlWEqDxNjaS9weABPbLqX9i/ctdFCGUZ7WV4g6puiJD9AdKkMNAPaK3kDr28GDxexd5Gfakgzg9KO5pmO6jDXbQiQ2lgu/gqwa1MCoynbyCoj4YmxveUgIR6aFRMdTB1aMOJZbKtRXstxOph0EK5W5aOdwF7MONNWdb0TOJYoI6IfGoAMJmILw83zZ0ECllVzQRGfQyAyJRnbTY0hs4yTqWmUTz/HYapUCD6DH8Hi01wsrIPKQiJR56VYIcKfBz155+GH/vT8AbGuSaBMeF2mfdmGxNdRutLdX5++EMMP5/ZuKg0LWLO0SjtFD7+KjEH1C5yi3eaj1kgNGdNwwWh0Bm+RnO/qSlusFDgiNfZdEkb7op
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(366004)(396003)(376002)(346002)(136003)(31696002)(66476007)(8936002)(8676002)(186003)(4744005)(16526019)(66946007)(66556008)(52116002)(26005)(107886003)(6486002)(36756003)(2906002)(956004)(478600001)(16576012)(4326008)(31686004)(83380400001)(316002)(2616005)(86362001)(5660300002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UTZtd3VBaE9GaUVOMFM2djc4aTRqQ29BSUJQRWpiaXE3d1JsWWY2amc0SnNs?=
 =?utf-8?B?b1dqTDJ5NFZra1pwazJYTnJKU3JncFU2blhKMDNSQzg4SVo4VzV2cCtXZUxS?=
 =?utf-8?B?dGZwc29NNHRvV0RVdGp0M2Y2MEdEZnAveWxyY1JlRmhFVEJsK3hSNHk2a3pG?=
 =?utf-8?B?RjQ4dGtCRm1nNjgyN2F2TUZZY3hHK05mRDJETHo1d2lQU09WbWZyVVF4QjZO?=
 =?utf-8?B?T2NTYjFVN3RnUnlkQ2FHVXpuKzMrVGJiM3h6R1JkUnVtZklrWHlKYmRLRWtw?=
 =?utf-8?B?MDFESWxnMDJKemRCV2diLzY4dW5uSlptYkpDOWszV2RQQ2hOc0Y3VWJUZUxO?=
 =?utf-8?B?RzIxTG9UZjREUnQrZmYxeTE3Ukw3blFWV1VLM05QRWN1eUZKOVAvN3BjdHNz?=
 =?utf-8?B?T2d2T3AyN04zTE16V2xPMWx6NXNRUzBOc0MxcFBMMUpZWk5zSUJrQ1NJenBp?=
 =?utf-8?B?TjRpR3VXVlpSMUNYVXlkWkRMc3dTTitlUmNoUjExSCtoRHNVRFBMaWtLL3pR?=
 =?utf-8?B?ajFiMFl5Ukg4RUxWY0duU0tlL3NVOFVZRVZpaVdncE5EcjNyUnFtM2ZqUWtN?=
 =?utf-8?B?NFhUT2ZYSDlUbWUremE0VzZmckNxT1ZyYXlocitqTjliSSttNEpNQk9aTS9Y?=
 =?utf-8?B?WDZjYm91cVJVSEs3dXNBNXdIbFhxd2p0WHlzV2x3cUhBb1E4eWY3dXBTZVBO?=
 =?utf-8?B?ck1Qa1hRamJ5Umg2UDJ6SlVxMkM2amNPYlJLU0J5bnFLaEdBQ0lXRDhjRDdB?=
 =?utf-8?B?TFdJaVNMaVphTW9IK1RrZWRQd3ZYU2JCTDJZVlMyWTBCTncwT21uQmFVQVBY?=
 =?utf-8?B?eW5iMTY4bmFXSlVZQytSNDZmRlRtaHNQVmZQZDZBNFc2eFVkaDJMVkIvUFY5?=
 =?utf-8?B?NWk2cWt2VWhTOU41YzdpOVhLVHRGWkJxMDJzQUFPSGpVMzA3UEh1aDM3ZE5M?=
 =?utf-8?B?UllQQk5DU0JVczdvcUlNT0NMbi9iTDFVeDFIRmRHN2pLejNNRkJLeDdweFdN?=
 =?utf-8?B?SFV3WlIrbk5RNXJpS2FvV1BjRmNQVGl1Q3RMZTBJUUNFWnp0bWRnYzMyNGlY?=
 =?utf-8?B?cDRvTC9EV05xY2lpa2hNRkhlZDJqdUZhQjBmQXhDaDJuaG0yTFFRMkJYRWsx?=
 =?utf-8?B?ekRKSGFzelBmc3ZSWUhqeGh2eEIrVEtMZkpmc0VTN2pYaTB5UGFiMmRlRUJh?=
 =?utf-8?B?bHcvVUdmbE1TTkFjTWNYWXhjcklvTTlqa3lPY3dpVkZtWGg0Z05WaTU4dVA1?=
 =?utf-8?B?SUp5TlhJbjlmamxOeHMrT1FyaUJIWXBQS0lwU2xwYmtHcFJPWHFIMlJocmJy?=
 =?utf-8?Q?nNaS1w6QasJfRXaqwOU05r/dwYV/bTjHXl?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f0cd6a0-7049-410d-5067-08d8978a6d31
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 12:53:26.9081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JzkG4bOMISAsukNyjXPNolz5p4/U9Z62i1Hhh9Zn55aWYdOO3uFjQv4uEbFhQJlQ1FIEwXFrKWcvzZfInR0oBRFiu6A/aY1XgT7nHIXkAMM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3575
Received-SPF: pass client-ip=40.107.21.99;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

02.12.2020 21:30, Andrey Shinkevich wrote:
> If the flag BDRV_REQ_PREFETCH was set, skip idling read/write
> operations in COR-driver. It can be taken into account for the
> COR-algorithms optimization. That check is being made during the
> block stream job by the moment.
> 
> Add the BDRV_REQ_PREFETCH flag to the supported_read_flags of the
> COR-filter.
> 
> block: Modify the comment for the flag BDRV_REQ_PREFETCH as we are
> going to use it alone and pass it to the COR-filter driver for further
> processing.
> 
> Signed-off-by: Andrey Shinkevich<andrey.shinkevich@virtuozzo.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A20415BCD26
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 15:28:25 +0200 (CEST)
Received: from localhost ([::1]:47692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaGoy-0008Et-NZ
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 09:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>) id 1oaGgF-0002VH-Pk
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 09:19:30 -0400
Received: from mail-eopbgr60106.outbound.protection.outlook.com
 ([40.107.6.106]:10052 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>) id 1oaGgD-0006Gc-3d
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 09:19:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KnjFIYIIaCi5HSVXtrLlvPLyj3akBRbRjLMnTw3eG36Td7qYS4secg9jjTeVkUZ7TAKK1Hgojqt8CuQNJhtxF+BRfckerHcaBKfDkc9LgIg+pHWpnHXW1vRwNO2RgkTPzcbxKOqf7noOuljetUMkS3zYPokfdHtWlFBTUiCAeCZ1cGdJZLAQ4GTU0D6/mZ5h+Bly3SofhHfl2R4c3drF4cyCdpwolt3zZy5r7+dg1ibI073N1jztrOtNbRZLEsezgaoJ9Nunyrf4inviRc9/h8NuQxSxEzuemxk116b1w9KJEktyCqp9CeuFfB8akdATBsnomXWpO/2Rh7nBtSAvyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W4elM0wATProHJ8xpM6aHrf1GnJsda4obzOdvdCvaAg=;
 b=TwQ3K9rBsNVD7hV0OMG/wbc+PEEosTc1a90BU4h4EqDF71pAuJSZNerTHRjAHY8EkGyEQGECA/4UNJVqMPtL/33p2xIxO0E65tA9foNwULwzbZdbbudwBwpZqoX+fKaAd5EBqO4fccCoY6eQiC0C320CLJtREByRSQ++dtwJqrU5eJe+9TCX5PED5L9wqIlGXJxcbHLUSR5wv9cba7WNSHCREXXcqrBA74dlVmtYYuA5MPkKtWYbwJKDLsAcy7yLBIK+x09tbx/L4BI8JLomXV+nt/xl84uQoghqdFvS+tOVmJ0IZKnH5M4NczqcG7CgMMzqMBLfxVjX1cNUv/IxQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W4elM0wATProHJ8xpM6aHrf1GnJsda4obzOdvdCvaAg=;
 b=hOmip0WEglYyS7iFUx3b9wIVGW4j8gv+zgexhRToAneRWtKpI76mpPNxSu4KjC0fCbZkW6WCA62yu0xN4f8DzlQK2h/TNQUc715Zd7qWDjMM3R1TN0OXTJMMu+No5Xm2CGO+z8nMLepmafb8Y3fwzrcRiA5FTe1WPgF6HuZDCO73sa07Gz+N4Wis1+byW34AJnWKSVtJjtUhWG69erewoTUtRT3y3I5u5h3IwIakEjbbTF6pZO0sqH9wkHz9Gq1ZzyZMWEoHb9wHbbF78+mqcajUId7ubRz+7sz6Fg9rRE6aoAs2VZ9rLlIyr756qKUFtWWZ+AmiM6FfdBi5iPQUFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by DB9PR08MB8433.eurprd08.prod.outlook.com (2603:10a6:10:3d7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.19; Mon, 19 Sep
 2022 13:19:14 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::f173:be01:d26d:8d2a]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::f173:be01:d26d:8d2a%7]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 13:19:14 +0000
Message-ID: <5d92314f-9d63-08f3-e9ce-8739f926510f@virtuozzo.com>
Date: Mon, 19 Sep 2022 15:19:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 4/5] tests/x86: Add 'q35' machine type to hotplug
 hd-geo-test
Content-Language: en-US
To: Michael Labiuk <michael.labiuk@virtuozzo.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
References: <20220915131407.372485-1-michael.labiuk@virtuozzo.com>
 <20220915131407.372485-5-michael.labiuk@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220915131407.372485-5-michael.labiuk@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0902CA0038.eurprd09.prod.outlook.com
 (2603:10a6:802:1::27) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR08MB6956:EE_|DB9PR08MB8433:EE_
X-MS-Office365-Filtering-Correlation-Id: 332f39cd-6f69-4d22-a637-08da9a418c04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uKuHj3DTPMg7Rw37p3ICt/w9VlKUOl5bVWKVNxu6p4TzC3TpHOOogAHCQeScD9GMHQJEJMkLSKbKMGj9Ji+1Tc3AY9btAi8Nt+QUl8thoY7k26ukVl1iY5tMhYP8F/LswOKvk0SyaFAzjd84Ax6LNVjf1OX/0AHxOPCeg2yZ/w873QJxhcGyRfDEbpu1+FuxwYr/QS3NmKebpdS1F4UkOlQOaXaJYD5ujOmdUon+St/C6y+bkcCCiWGM3SGwofP2rvnN606yC4lQCbbHG2xbbOpClSLrVKqYYx2Tig9urXi4vUOgRD50k+VRfY1fDq6sXmu61/WL+N4GictHZw3PePkH6yy4EHqIzDLrcRgUBgJTMNCLX/7AuyvWpSDV/ANtRpIiPRIp0GNq8qCSlh4MBS0VtdBDOTWyYun4Jj5dvu4mF0V2aOTfehDZ94jjSp+Z+SljDhoSPBqGAdpUhyz0iCVPc7Ptivz+z9vRIt40SYeszywCpSxhrKr0EQmxRTWdIbq8pNQksqxb4pP/u3U0fBfJs3hJa6ZO1sMfIWUy9rF1VWb/kAj6oS8O6FH9f2cJptx3b4OfNknoqRRsV310nqcUjFU/YFVJSN8upuYqFrr4EzL9xYijg4I5KyuR5lcxz0p/Q4eiO6EgxdGzvtqjaa2oPxBv4iwA2Pd+R2D5StM4QaQ049Eme/jbGRDhr2aOnMeQG0YmT9n79QN1QLs9ZdWY9o5uyQSQpJaAcfx6ghiMup7YzvLpAJGras43vn/eXgm9UG9JI6SStWM8JbgWgGcFlZF/5S3mZCCDHxXnM/mt2UEdx3MmbBifziaIoBTJUaZhYMb0itC86f3E9VBfiw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39850400004)(396003)(136003)(346002)(376002)(366004)(451199015)(38350700002)(38100700002)(31696002)(36756003)(86362001)(31686004)(83380400001)(186003)(52116002)(2906002)(6506007)(6512007)(2616005)(478600001)(41300700001)(26005)(53546011)(8936002)(5660300002)(54906003)(6486002)(316002)(8676002)(4326008)(66556008)(66476007)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlpmWmlOM1VJZlppSE9JaWJHczhZaW8vS1JlditMTWMyaUhzNlVxVTExc3h6?=
 =?utf-8?B?TmFrcGJYR2Nub0laUVpHN0tDTEt2VFRqYTBLRTRoWkxhWmhGcUgzYzJJOWdo?=
 =?utf-8?B?OVJVc2duVk1JUXk2MnRHS2ZYSkQyNmhzcW16UFI2R0RzSHI3cFcwYzRMN3p0?=
 =?utf-8?B?eFhPQUFCc0Zja1RFTGRoazl0T1d2Yi8zVDZXS2xrOE8yWk14RnlrSTVxM0lI?=
 =?utf-8?B?ZU5ZYmpkK0IrY0JhRGpxYUNHZzhUZCtoa3RnVTkvWGl4OTUzaG1sRFNaUm9M?=
 =?utf-8?B?RUlnRnVLekkzVmpseUlSMGl5Q0FteE5uSEkvU1hXS0xrankraVhFZVFVaDlQ?=
 =?utf-8?B?c0dyOTJiMzhUMitlNVRFV1l2MERXaU1udGV5OEpkcU50WHdoaDM2ZW9uOWlN?=
 =?utf-8?B?U0JHdzY2Q3BEOW5ncDBRSHRHVVVTdE5ybzZ3dndtRmZvc2s3bS9DT1BEZkx5?=
 =?utf-8?B?anIwQVVuT1FqT2IzNCtyMDVFUXZ1dGNBMTBqUmEyQlRleitPL0JDTEJjckRQ?=
 =?utf-8?B?VXlBeWZaL3d1OFBINmxFK25iWGxUMVBtOG4zOVUvd0k4a1RJMHVwNm42bE8v?=
 =?utf-8?B?RWRpSWcxdUkrTjR4MnRtTk9WbndkVFIwbHIxMHhKWGZGYUJXWG1SejAyRmVH?=
 =?utf-8?B?ZWh3NEV5Nk53N0IySmRCYStYcmliTHhEejFhTlV6aVdRdjZMRzZ5UmpRRlBG?=
 =?utf-8?B?b0lNK3lnVWhLYVNJVXZML0ROZ09ZbzRiU0ZEbEo2SnBvNGtKMk5yZXZjVzA5?=
 =?utf-8?B?MXZBRjQ4NnJrVVA0cjd3N21YQ2JWdUhwZnJVa29aSll0UmVXRzlNdFFId0NF?=
 =?utf-8?B?ck9FT2VYN2N1TUpLdGFZcWVBVlNialgxU0c3ZjE3bVlSNnN0azZjcDFhdy81?=
 =?utf-8?B?SVlyaU5GcnQ2NUlaczI5b253NVZQTThiWjZBREVlWjBmcEFUY3o1K2JMenpl?=
 =?utf-8?B?L1pQSUhNRU9oSEhjMW9vMTJCNDBYRDZQUWRJcmsxb056eVB2L2UwelRCNW1k?=
 =?utf-8?B?Q2ZrNTAweE85aWJzWTFzK1YxUG9LQWlMTkNCY1R2ZnFVTzIxeVV1MHprYjhZ?=
 =?utf-8?B?UUw0ckdFWTc2NWxvaHpHSVFMaTdRanArWk1xV1pHb3o3bmJFSnNmbVZXUGNl?=
 =?utf-8?B?SFV3SUVVN3pNS0hmbzlZU3hKZFB6a2xsT3MyK0xTWWY3dVhPbStQaEN5OWE1?=
 =?utf-8?B?V0VZb0J4WGZBbTdqcVdrWFJ1QWxPR0p6YklWWlJldjF4ZDBMTUdTTjl5aWQr?=
 =?utf-8?B?eXFPbVZjUXg5ZEdzYXIrcEllUDh6bEVsMXVuY2J3OUNKMklCb2crV3pPZmE2?=
 =?utf-8?B?VlowejlYNVFTTGY2NURyQ2laZXoxR0IxWk5kMUh0WWUxZDFRVGk5NDNmMEZ0?=
 =?utf-8?B?eVA4K2tWckZGUVdVVmE5Z3lrNnUwNUxkT25VaU5sTThLNUpHdklvc3o1RktO?=
 =?utf-8?B?N21obzB2UjYzOFVvcXpKcEZ3bGt6MnFsSHZtSkhZanFmQlBvMTNlOG5iMFRC?=
 =?utf-8?B?RW55L2FZNGd4M0pLNEVXekxwWDAvT2xueCtCaTk3M0ZqVEJCVUh6VjdoVUZk?=
 =?utf-8?B?VXdnRmkvS3BCTFBuVkNHTEtGdWExTlF1OWpoR2tFWGRnU1JIMmVJdFNYQmNH?=
 =?utf-8?B?OWdyOVN6RUhJbGRoa1ZiMjhJYWxESTUreWZkclVhV2h2M0pJS0pWUlRqaEp1?=
 =?utf-8?B?WHZlVURwd3I2REF0RXd2YzJUanZSWGZIbElFVmhsSHVMZ3RmUk14STR4eEJx?=
 =?utf-8?B?UHA5dmpRN2M2SFBwZ1BBNWowRHlGU0tEMncwckNtQVBrZG5pRlNuMzdxbi9i?=
 =?utf-8?B?ZFVtSVZyVVJMUmIyUmJwb1VHV09mYUlPQTZCTkltc3B3OXRLMEhVTXIvcloz?=
 =?utf-8?B?aDRrQXE5UGxTYjRLdkREQ3FZbml1SXMzNmE4bTJrazVlN2tTMUlmM2hoZmtI?=
 =?utf-8?B?bkZBUXZ6b2dKZkE3S042bmkwVWpkOG14YnFtK3ZVdXR4RDNQRE5qSVlKR09q?=
 =?utf-8?B?a2xxc1IxaHdYOE52VHBsRnlJLzd2NDhjWEN1OG5lMFRyZ1FnWnpkNmpPWWJE?=
 =?utf-8?B?NXBtOXIyRjFNazBhYnNhWFVmNUNmd0JPUEVPWVFzblNoTXhQODErR1FPb0pF?=
 =?utf-8?Q?Nrz7ibDEfZ0sTjgWDZUDdGz7n?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 332f39cd-6f69-4d22-a637-08da9a418c04
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 13:19:13.9795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dw05GVSEBevfjG6DboGNNrfVhqImfzPV+52+d/i+Aov2K4stzqRQ0l0OWOTDkgZYxRhWIlXhVv9b5LDYeJSJzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8433
Received-SPF: pass client-ip=40.107.6.106; envelope-from=den@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.952,
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

On 9/15/22 15:14, Michael Labiuk wrote:
> Add pci bridge setting to test hotplug.
> Duplicate tests for plugging scsi and virtio devices for q35 machine type.
> Signed-off-by: Michael Labiuk <michael.labiuk@virtuozzo.com>
> ---
>   tests/qtest/hd-geo-test.c | 148 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 148 insertions(+)
>
> diff --git a/tests/qtest/hd-geo-test.c b/tests/qtest/hd-geo-test.c
> index 413cf964c0..19354690ae 100644
> --- a/tests/qtest/hd-geo-test.c
> +++ b/tests/qtest/hd-geo-test.c
> @@ -874,6 +874,78 @@ static void test_override_scsi_hot_unplug(void)
>       g_free(args);
>   }
>   
> +static void test_override_scsi_hot_unplug_q35(void)
> +{
> +    QTestState *qts;
> +    char *joined_args;
> +    QFWCFG *fw_cfg;
> +    QDict *response;
> +    int i;
> +    TestArgs *args = create_args();
> +    CHSResult expected[] = {
> +        {
> +            "/pci@i0cf8/pci-bridge@1/pci-bridge@0/scsi@2/channel@0/disk@0,0",
> +            {10000, 120, 30}
> +        },
> +        {
> +            "/pci@i0cf8/pci-bridge@1/pci-bridge@0/scsi@2/channel@0/disk@1,0",
> +            {20, 20, 20}
> +        },
> +        {NULL, {0, 0, 0} }
> +    };
> +    CHSResult expected2[] = {
> +        {
> +            "/pci@i0cf8/pci-bridge@1/pci-bridge@0/scsi@2/channel@0/disk@1,0",
> +            {20, 20, 20}
> +        },
> +        {NULL, {0, 0, 0} }
> +    };
> +    add_drive_with_mbr(args, empty_mbr, 1);
> +    add_drive_with_mbr(args, empty_mbr, 1);
> +    add_scsi_controller(args, "virtio-scsi-pci", "b1", 2);
> +    add_scsi_disk(args, 0, 0, 0, 0, 0, 10000, 120, 30);
> +    add_scsi_disk(args, 1, 0, 0, 1, 0, 20, 20, 20);
> +
> +    joined_args = g_strjoinv(" ", args->argv);
> +
> +    qts = qtest_initf("-device pcie-root-port,id=p0 "
> +                      "-device pcie-pci-bridge,bus=p0,id=b1 "
> +                      "-machine q35 %s", joined_args);
> +    fw_cfg = pc_fw_cfg_init(qts);
> +
> +    read_bootdevices(fw_cfg, expected);
> +
> +    /* unplug device an restart */
> +    response = qtest_qmp(qts,
> +                         "{ 'execute': 'device_del',"
> +                         "  'arguments': {'id': 'scsi-disk0' }}");
> +    g_assert(response);
> +    g_assert(!qdict_haskey(response, "error"));
> +    qobject_unref(response);
> +    response = qtest_qmp(qts,
> +                         "{ 'execute': 'system_reset', 'arguments': { }}");
> +    g_assert(response);
> +    g_assert(!qdict_haskey(response, "error"));
> +    qobject_unref(response);
> +
> +    qtest_qmp_eventwait(qts, "RESET");
> +
> +    read_bootdevices(fw_cfg, expected2);
> +
> +    g_free(joined_args);
> +    qtest_quit(qts);
> +
> +    g_free(fw_cfg);
> +
> +    for (i = 0; i < args->n_drives; i++) {
> +        unlink(args->drives[i]);
> +        free(args->drives[i]);
> +    }
> +    g_free(args->drives);
> +    g_strfreev(args->argv);
> +    g_free(args);
> +}
> +
>   static void test_override_virtio_hot_unplug(void)
>   {
>       QTestState *qts;
> @@ -934,6 +1006,77 @@ static void test_override_virtio_hot_unplug(void)
>       g_free(args);
>   }
>   
> +static void test_override_virtio_hot_unplug_q35(void)
> +{
> +    QTestState *qts;
> +    char *joined_args;
> +    QFWCFG *fw_cfg;
> +    QDict *response;
> +    int i;
> +    TestArgs *args = create_args();
> +    CHSResult expected[] = {
> +        {
> +            "/pci@i0cf8/pci-bridge@1/pci-bridge@0/scsi@2/disk@0,0",
> +            {10000, 120, 30}
> +        },
> +        {
> +            "/pci@i0cf8/pci-bridge@1/pci-bridge@0/scsi@3/disk@0,0",
> +            {20, 20, 20}
> +        },
> +        {NULL, {0, 0, 0} }
> +    };
> +    CHSResult expected2[] = {
> +        {
> +            "/pci@i0cf8/pci-bridge@1/pci-bridge@0/scsi@3/disk@0,0",
> +            {20, 20, 20}
> +        },
> +        {NULL, {0, 0, 0} }
> +    };
> +    add_drive_with_mbr(args, empty_mbr, 1);
> +    add_drive_with_mbr(args, empty_mbr, 1);
> +    add_virtio_disk(args, 0, "b1", 2, 10000, 120, 30);
> +    add_virtio_disk(args, 1, "b1", 3, 20, 20, 20);
> +
> +    joined_args = g_strjoinv(" ", args->argv);
> +
> +    qts = qtest_initf("-device pcie-root-port,id=p0 "
> +                      "-device pcie-pci-bridge,bus=p0,id=b1 "
> +                      "-machine q35 %s", joined_args);
> +    fw_cfg = pc_fw_cfg_init(qts);
> +
> +    read_bootdevices(fw_cfg, expected);
> +
> +    /* unplug device an restart */
> +    response = qtest_qmp(qts,
> +                         "{ 'execute': 'device_del',"
> +                         "  'arguments': {'id': 'virtio-disk0' }}");
> +    g_assert(response);
> +    g_assert(!qdict_haskey(response, "error"));
> +    qobject_unref(response);
> +    response = qtest_qmp(qts,
> +                         "{ 'execute': 'system_reset', 'arguments': { }}");
> +    g_assert(response);
> +    g_assert(!qdict_haskey(response, "error"));
> +    qobject_unref(response);
> +
> +    qtest_qmp_eventwait(qts, "RESET");
> +
> +    read_bootdevices(fw_cfg, expected2);
> +
> +    g_free(joined_args);
> +    qtest_quit(qts);
> +
> +    g_free(fw_cfg);
> +
> +    for (i = 0; i < args->n_drives; i++) {
> +        unlink(args->drives[i]);
> +        free(args->drives[i]);
> +    }
> +    g_free(args->drives);
> +    g_strfreev(args->argv);
> +    g_free(args);
> +}
> +
>   int main(int argc, char **argv)
>   {
>       Backend i;
> @@ -974,8 +1117,13 @@ int main(int argc, char **argv)
>           qtest_add_func("hd-geo/override/zero_chs", test_override_zero_chs);
>           qtest_add_func("hd-geo/override/scsi_hot_unplug",
>                          test_override_scsi_hot_unplug);
> +        qtest_add_func("hd-geo/override/scsi_hot_unplug_q35",
> +                       test_override_scsi_hot_unplug_q35);
>           qtest_add_func("hd-geo/override/virtio_hot_unplug",
>                          test_override_virtio_hot_unplug);
> +        qtest_add_func("hd-geo/override/virtio_hot_unplug_q35",
> +                       test_override_virtio_hot_unplug_q35);
> +
>       } else {
>           g_test_message("QTEST_QEMU_IMG not set or qemu-img missing; "
>                          "skipping hd-geo/override/* tests");
that's looks like pretty much copy-paste of the same code with different 
strings.
Should this be unified?

Den


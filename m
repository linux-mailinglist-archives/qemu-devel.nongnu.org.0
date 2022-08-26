Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6500C5A27F3
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 14:47:10 +0200 (CEST)
Received: from localhost ([::1]:55198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRYjt-0005XV-HJ
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 08:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>) id 1oRYh6-0003ii-UD
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 08:44:16 -0400
Received: from mail-am6eur05on20700.outbound.protection.outlook.com
 ([2a01:111:f400:7e1b::700]:22817
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>) id 1oRYh2-0005MK-PC
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 08:44:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iKuHcz5nhEEmtjCliYmkX2WVauncjrHP32AwediBetqXkE3/jXnK0CtU2o36hEugshTpMVzr9e3E85nNAvZh+Ag1gYraRNW2mAXfWXFCP6xxyk+IKRjbKAVu5uxzpD6IHXiS/SqIIFrkEATUKQHKfasi0OAD3iv15oMoSpO+lzKa2LUtPtyonMs86jrabAxwCyboeMfNVGMILls41PTbvGZsOrGhtDklYhLaUNtV2BXSMQHJv16G0TRz0AE3ul7HRTxQMUAaf8q5AnqO+zp54xpIFbiT22+j/AZ69bsyDJ4T+GaIrlK3z4MQqFm63bkjeP/0gsArNUmpAHtgg6pavg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rAV7pQArTE2i9fpB5SbzhM92Rx8vdPQdx4cOJ9Wuq0Y=;
 b=k4IyW/D74qMX8SI9md0qFXRfHzPvWaQdldEpKuYxHZIA+jmwHZ5M+ANTq5q1RUs9ig0qoWvyS5+HlmnGVhYn9uX4svFjtgJIJrYZTa7mqe4Ov3R3wd52v4pF7cs5XyOoOWxsZ3lNXknFsC3/vDB3zDDrFQSKeV7Pb0nibo6p/PiePug8lIKm6+EIIHu2t4LegweHU4BK3kl4AWNOuqn/V3xZQ/cUD3OzyNHiX8iBZlcwl4mOt2y23S8KxodLYIKiXaQyjkFp/sFp+GrrC3rfc2PJVIFqhGGD+24hrRl/7lYMsjqDo2VxI3aZTThhdRnDwhBg6dw+AX7iATw5anXghQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rAV7pQArTE2i9fpB5SbzhM92Rx8vdPQdx4cOJ9Wuq0Y=;
 b=Ye+97mkMDI6RO/5emrjYB78pp/kdk/l7kCFlFM5xH0RWeCMwiSMQtGq1AeQWvaoWEn8F69jSawdKfTr+ipQ8Bc6/68P4GI5t53qO7prIFWObIxkQQtXdd+5m+fH4JMGAyXeFUIlrxeEfh6Qbrl39FXESK/kWbSeRJ5G6oydVwr++RW0MmrF0d7FqxBSxu71LIzt39HN/ZxCac1pPvGug8UfSa2wO/ZEHMswSRnXO9yeOdg2HHHFe4VlH5iXdvMbdKdlb7YZvyNUGpf9TtQpS1T59sbpw4MQkUuPFbFputETNC9cmX7GiUBM8BeKCQtQNyRnqbm3891EOknrM4GxQpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by AM9PR08MB7119.eurprd08.prod.outlook.com (2603:10a6:20b:41f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Fri, 26 Aug
 2022 12:39:04 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%3]) with mapi id 15.20.5566.016; Fri, 26 Aug 2022
 12:39:04 +0000
Message-ID: <e344f9f1-2dc9-5fdc-77e0-32900b721d42@virtuozzo.com>
Date: Fri, 26 Aug 2022 14:39:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] tests/x86: Add 'q35' machine type to hotplug tests
Content-Language: en-US
To: Michael Labiuk <michael.labiuk@virtuozzo.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
References: <20220826114159.6370-1-michael.labiuk@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220826114159.6370-1-michael.labiuk@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0302CA0009.eurprd03.prod.outlook.com
 (2603:10a6:800:e9::19) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae28a25b-12ae-4a6e-b844-08da875ff603
X-MS-TrafficTypeDiagnostic: AM9PR08MB7119:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4ehxPZDEWmdGlF3gxzXW9WqfoJscBZB0Tz7074bjtass2kdRFint77S3xsRm40QDMCV5HSFPo/1iEdsMLubmCS0WpXhHFtPrH9Jlfw8j6Hp1sMaouSQ0whAzXHqzwxRjg8ugUIC8edFj3VhCGBDht2Jm7auUU/EVSTJ17n3gjyIbaznUJ0kIchGfbDLYHCzEqz668T/ZppCgiovqritTyht/0JOrw4bY7dEfYLdxhRY9qgaSlQ1sDZQgqASP+OJvs3hzh8sOYbBskptjWBNLBu1/n5dl3XfYpTEGcE9x/780UQWkiojyzKwXW/Ll4nqbMUzTtV+6HV2Q8nNH1eXzyU/+u6tB2GMla3rhIgLK2mjPW5sBw+Gn9+DnlrmPtLu4/Byo8c60ojGTwUdkE82FrZwGHamomB33atsV0KDeCjDka29wFb3zJrTO83iwM1xZjs7qiEKtVRqMcRn0uQpRHNk1JlAD8eYj/u5ROD6G9ALOPHGkHi35InpGxjlTFT2f2tvVHaaPcNaKp9Hadq8oPdsWl5GKNE28EwqL6Szzcctc9ntVr+aGDKisms6Zdq4cuVh+GAOhhUHyxid5WmLX74LHRJ302AAz4ZnBl+D0nLAwYF1mZxZN+COuVUpEJhfMFq6VZIWf/0iDFjDNvjlrTJX874A4J7MRG6hXZHc+uHkMi76PhwDpgC7aH+APn89/bba7EQfyY7z9gelcIDeKc9huTmpapBV8jTXF115XqRPW+tOxCot1nTTWomPFffJ80Gf+zZiVAR6po9ZSI3zaXkRpWPo/e6bjMMz5da0jJiZTLUYIvTqIATysMHna/ihQX8ku9ekyHB0zy0bogmKq7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(39850400004)(136003)(396003)(376002)(346002)(316002)(8676002)(66556008)(31696002)(66476007)(4326008)(54906003)(66946007)(6486002)(478600001)(41300700001)(5660300002)(86362001)(8936002)(36756003)(26005)(38100700002)(186003)(83380400001)(2906002)(52116002)(53546011)(6506007)(38350700002)(30864003)(6512007)(31686004)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TW0vT1ArQXo5NzIrM2N2N2hiR2dYWmR4bTBkLy9ZMEZ4dkc1Yk4vcXQ0UGZT?=
 =?utf-8?B?UEVLY2NPWGJPRmQvRFdTUzB2R2MzRVVFUHUrTlJRNFBGeVpyK3lHekhGajl2?=
 =?utf-8?B?MkhZQTBIaHQ2ZTlzeFROeXBmVTlLMlNhMEZoZjlwdGFZSTRuVmxUWTJTMHFq?=
 =?utf-8?B?UGpNN0RBQ2hrVTg2YWFKSlVRMUhoTE4wNHJnWk1aK2FEU2dpRUhyR3RpbGZw?=
 =?utf-8?B?dnBlT1NXME05eklEcmI1U1MxVXVySU5nVktpWlcwckYrVFkzQVZYUmQ3aWNq?=
 =?utf-8?B?bDN2WUxsOTY2YmthUkxBb3VnQWo2Qis1bDFOaGJySnFpUWRLV2YzdDN6K29y?=
 =?utf-8?B?TmIxSGVZMU84SWlZTFUzSE5qd1FZUmgwVXZpSkZlWjExZnR3TUpwUjBpNGor?=
 =?utf-8?B?bDJRQ2o4Y1o1S1d3OE5EbVpSQ3h5KzJ1OUxKc2hFdlNGb0NURDRYL2ttcnQ0?=
 =?utf-8?B?UXFSZlJXa2pKNlVPdGcrZFhzZVEyWEZNdDJXVDBMM0dRVVpCeDhXN3p1MHlF?=
 =?utf-8?B?ampyN1pPc2ZhUVFDcERqRVJDcXdnY1VpL3pFdjFrVHpvbEZ3ZnpEOFFrZkd0?=
 =?utf-8?B?Rk1XYnZNcFlVWndQbmJ3cmJnVlhmd05WN0kzbkszSlcvS2lONGFRckJuV2lk?=
 =?utf-8?B?c25KSVk1ZnVFOGs1VUhkWUNvUFFQMDd0bGs5Zlk1SzVLMklvZW5oZEI4cDcr?=
 =?utf-8?B?RXRMWW83R1czOTY3T05Wc1JENHRGTkNzT3Z6NzEwVU1FNCs5WnkxbGQ4TEZW?=
 =?utf-8?B?c3F5d1kvSHRaZWtMS2M3VytWb21WUlpickt3T21mdFo3a0pyOUNGOWNTd2Ju?=
 =?utf-8?B?RENoeGJjRFNZSDNwSWZpSjlsTW8xUW5xck5ZcklZbkp5b2JaMDZjdVY3THFP?=
 =?utf-8?B?RGh0TEh6a2NhNWVreG9ZSlY5dzZ3VzhUWlJ5TjZkdjZNZjJPMm1xa21JcjJr?=
 =?utf-8?B?dG5NRUc5TG5SNDBsQTdrdyt4eGYrT05YVkNmeUE0RlhsUXBpUW9kSTM1dlNs?=
 =?utf-8?B?dXJuSGZFdkMzeFlMUjk5SExpZFI5K2tmd1pJWERneVBoRGY4bVlvaWxWQ281?=
 =?utf-8?B?TmcxWGpaK0duRk0zN1VIRnRKRHRadFYvZUpsNjRFS2QwOEFsVWdJaXNLcWlS?=
 =?utf-8?B?UllzOWR2ODVTWVMwS2lhZm00OVBUY2pNNjdTemQ4RkZFcjhnelg3SURpd2Vn?=
 =?utf-8?B?aWZlMmZBVGErcnBQS3NLdVowNWFkVjY0M3REeGxEMFJDMU84b2oyV3RXRmxQ?=
 =?utf-8?B?OEN2Sk11aGZjWDlHWnRhMjdIU3B5VlpETWsxSFFoaXhZektTTUlWUDJ6aTQy?=
 =?utf-8?B?K3ZoY3g3RlFtR21JVHJodnVwNmZwUWNxQWVGTXFoSmIzajFsYnFyS0VTR2Yv?=
 =?utf-8?B?cXg1RGpaRDZ3WEs3bGJKNUNhUUVIK2oybjJ6azJIQzFrajF5dFF6WDRWNUxL?=
 =?utf-8?B?bXFBUmtzMzQ3ckROMW9MQmFBZElzbDQ0VW5NaEVvZFBnRG1OWFlzVE1VRE80?=
 =?utf-8?B?S3FUbE1ocWFLSTQxUEdybDVackJRTzQvRS9wZ3paOUM0SDN4YUNXSjB2MDhE?=
 =?utf-8?B?ZWZRbG5RVzUrSVBhWUI1UmxRdnNDVUxsYXNpYlM1MVdDbVJ6K2RNaDNMQVcw?=
 =?utf-8?B?L1Z6RDdvb2w4R0pHelRwYnhFd2dmVXIybzZTaWhGQjBsUkpGSlZPaFJEMUNG?=
 =?utf-8?B?UHF2ZTl3SWMvZThLOXVuQ25tOG5DZjBTNUtRK1JFUnZUcjIxVjNGNjJhSFVO?=
 =?utf-8?B?UWtOWERoQzZ5MDN4NmswRkVZOE5naExtRVBrejk4WFM5NEpyUUswMklVdHFq?=
 =?utf-8?B?WTI2SHRjNHl4ckI3NGRvd2xwNnhtNFlxUWxqM2kzRS8xWGdBZnBYOGZmdHls?=
 =?utf-8?B?YkxUZ0Z0RjduT3VCRHJLNjdadnA4enhka3lxU0MvOElJUUxlenhlTGM5VjNv?=
 =?utf-8?B?OW9RWXVKZW83alg0WEtZWXVhUHV4Zy9mV0swV0xNTjhEMENpNW5vaGxabHZp?=
 =?utf-8?B?MTU0SHo5Z0oyWXUySEhMTEJCTTRxM3hmUDRSS3QyanZsUlh3eldPVG1OY0Y3?=
 =?utf-8?B?MFZwWE4wNVdHak9DaVdEUzNiWDRtOVJuZmpPSWsyOXNiNCtOK2xDQUdOQXEy?=
 =?utf-8?Q?YDbw4V+DahtXHXQui26LIWA+2?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae28a25b-12ae-4a6e-b844-08da875ff603
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2022 12:39:04.6521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jd7zTMMw4xIw5iemCVbtQoETaNvhTELr685uzQzW43JN5I20yFOU3Q86Z1F8MP5ppxGv/hejLCxHbiW4e4q9aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7119
Received-SPF: pass client-ip=2a01:111:f400:7e1b::700;
 envelope-from=den@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

On 26.08.2022 13:41, Michael Labiuk wrote:
> Add pci bridge setting to run hotplug tests on q35 machine type.
> Hotplug tests was bounded to 'pc' machine type by commit 7b172333f1b
>
> Signed-off-by: Michael Labiuk <michael.labiuk@virtuozzo.com>
> ---
>   tests/qtest/device-plug-test.c |  26 ++++++
>   tests/qtest/drive_del-test.c   | 111 +++++++++++++++++++++++++
>   tests/qtest/hd-geo-test.c      | 148 +++++++++++++++++++++++++++++++++
>   tests/qtest/ivshmem-test.c     |  30 +++++++
>   4 files changed, 315 insertions(+)
>
> diff --git a/tests/qtest/device-plug-test.c b/tests/qtest/device-plug-test.c
> index 2e3137843e..2f07b37ba1 100644
> --- a/tests/qtest/device-plug-test.c
> +++ b/tests/qtest/device-plug-test.c
> @@ -165,6 +165,26 @@ static void test_spapr_phb_unplug_request(void)
>       qtest_quit(qtest);
>   }
>   
> +static void test_q35_pci_unplug_request(void)
that seems a little bit wrong. we have pcie test and thus
the naming should be appropriate.

What about test_pcie_unplug_request()?

> +{
> +
> +    QTestState *qtest = qtest_initf("-machine q35 "
> +                                    "-device pcie-root-port,id=p1 "
> +                                    "-device pcie-pci-bridge,bus=p1,id=b1 "
> +                                    "-device virtio-mouse-pci,bus=b1,id=dev0");
> +
> +    /*
> +     * Request device removal. As the guest is not running, the request won't
> +     * be processed. However during system reset, the removal will be
> +     * handled, removing the device.
> +     */
> +    device_del(qtest, "dev0");
> +    system_reset(qtest);
> +    wait_device_deleted_event(qtest, "dev0");
> +
> +    qtest_quit(qtest);
> +}
> +
this is better to be placed near 'pci' testcases I think

>   int main(int argc, char **argv)
>   {
>       const char *arch = qtest_get_arch();
> @@ -195,5 +215,11 @@ int main(int argc, char **argv)
>                          test_spapr_phb_unplug_request);
>       }
>   
> +    if (!strcmp(arch, "x86_64")) {
> +        qtest_add_func("/device-plug/q35-pci-unplug-request",
> +                   test_q35_pci_unplug_request);
for me JSON version of the test would also be good to be added

> +
> +    }
> +
>       return g_test_run();
>   }
> diff --git a/tests/qtest/drive_del-test.c b/tests/qtest/drive_del-test.c
> index 5e6d58b4dd..3a2ddecf22 100644
> --- a/tests/qtest/drive_del-test.c
> +++ b/tests/qtest/drive_del-test.c
> @@ -258,6 +258,27 @@ static void test_cli_device_del(void)
>       qtest_quit(qts);
>   }
>   

this patch seems trashes the internal structure of the test.
originally it was unified for all archs through
   qvirtio_get_dev_type(void)
and this change makes the test non-uniform.
This should be rethinked

> +static void test_cli_device_del_q35(void)
> +{
> +    QTestState *qts;
> +
> +    /*
> +     * -drive/-device and device_del.  Start with a drive used by a
> +     * device that unplugs after reset.
> +     */
> +    qts = qtest_initf("-drive if=none,id=drive0,file=null-co://,"
> +                      "file.read-zeroes=on,format=raw "
> +                      "-machine q35 -device pcie-root-port,id=p1 "
> +                      "-device pcie-pci-bridge,bus=p1,id=b1 "
> +                      "-device virtio-blk-%s,drive=drive0,bus=b1,id=dev0",
> +                      qvirtio_get_dev_type());
> +
> +    device_del(qts, true);
> +    g_assert(!has_drive(qts));
> +
> +    qtest_quit(qts);
> +}
> +
>   static void test_empty_device_del(void)
>   {
>       QTestState *qts;
> @@ -294,6 +315,45 @@ static void test_device_add_and_del(void)
>       qtest_quit(qts);
>   }
>   
> +static void device_add_q35(QTestState *qts)
> +{
> +    QDict *response;
> +    char driver[32];
> +    snprintf(driver, sizeof(driver), "virtio-blk-%s",
> +             qvirtio_get_dev_type());
> +
> +    response = qtest_qmp(qts, "{'execute': 'device_add',"
> +                              " 'arguments': {"
> +                              "   'driver': %s,"
> +                              "   'drive': 'drive0',"
> +                              "   'id': 'dev0',"
> +                              "   'bus': 'b1'"
> +                              "}}", driver);
> +    g_assert(response);
> +    g_assert(qdict_haskey(response, "return"));
> +    qobject_unref(response);
> +}
> +
> +static void test_device_add_and_del_q35(void)
> +{
> +    QTestState *qts;
> +
> +    /*
> +     * -drive/device_add and device_del.  Start with a drive used by a
> +     * device that unplugs after reset.
> +     */
> +    qts = qtest_initf("-machine q35 -device pcie-root-port,id=p1 "
> +                     "-device pcie-pci-bridge,bus=p1,id=b1 "
> +                     "-drive if=none,id=drive0,file=null-co://,"
> +                     "file.read-zeroes=on,format=raw");
> +
> +    device_add_q35(qts);
> +    device_del(qts, true);
> +    g_assert(!has_drive(qts));
> +
> +    qtest_quit(qts);
> +}
> +
>   static void test_drive_add_device_add_and_del(void)
>   {
>       QTestState *qts;
> @@ -318,6 +378,25 @@ static void test_drive_add_device_add_and_del(void)
>       qtest_quit(qts);
>   }
>   
> +static void test_drive_add_device_add_and_del_q35(void)
> +{
> +    QTestState *qts;
> +
> +    qts = qtest_init("-machine q35 -device pcie-root-port,id=p1 "
> +                     "-device pcie-pci-bridge,bus=p1,id=b1");
> +
> +    /*
> +     * drive_add/device_add and device_del.  The drive is used by a
> +     * device that unplugs after reset.
> +     */
> +    drive_add_with_media(qts);
> +    device_add_q35(qts);
> +    device_del(qts, true);
> +    g_assert(!has_drive(qts));
> +
> +    qtest_quit(qts);
> +}
> +
>   static void test_blockdev_add_device_add_and_del(void)
>   {
>       QTestState *qts;
> @@ -342,8 +421,29 @@ static void test_blockdev_add_device_add_and_del(void)
>       qtest_quit(qts);
>   }
>   
> +static void test_blockdev_add_device_add_and_del_q35(void)
> +{
> +    QTestState *qts;
> +
> +    qts = qtest_init("-machine q35 -device pcie-root-port,id=p1 "
> +                     "-device pcie-pci-bridge,bus=p1,id=b1");
> +
> +    /*
> +     * blockdev_add/device_add and device_del.  The it drive is used by a
> +     * device that unplugs after reset, but it doesn't go away.
> +     */
> +    blockdev_add_with_media(qts);
> +    device_add_q35(qts);
> +    device_del(qts, true);
> +    g_assert(has_blockdev(qts));
> +
> +    qtest_quit(qts);
> +}
> +
>   int main(int argc, char **argv)
>   {
> +    const char *arch = qtest_get_arch();
> +
>       g_test_init(&argc, &argv, NULL);
>   
>       qtest_add_func("/drive_del/without-dev", test_drive_without_dev);
> @@ -363,6 +463,17 @@ int main(int argc, char **argv)
>                          test_empty_device_del);
>           qtest_add_func("/device_del/blockdev",
>                          test_blockdev_add_device_add_and_del);
> +
> +        if (!strcmp(arch, "x86_64")) {
> +            qtest_add_func("/device_del/drive/cli_device_q35",
> +                           test_cli_device_del_q35);
> +            qtest_add_func("/device_del/drive/device_add_q35",
> +                           test_device_add_and_del_q35);
> +            qtest_add_func("/device_del/drive/drive_add_device_add_q35",
> +                           test_drive_add_device_add_and_del_q35);
> +            qtest_add_func("/device_del/blockdev_q35",
> +                           test_blockdev_add_device_add_and_del_q35);
> +        }
>       }
>   
>       return g_test_run();
> diff --git a/tests/qtest/hd-geo-test.c b/tests/qtest/hd-geo-test.c
> index 413cf964c0..256450729f 100644
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
> +            "/pci@i0cf8/pci-bridge@2/pci-bridge@0/scsi@2/disk@0,0",
> +            {10000, 120, 30}
> +        },
> +        {
> +            "/pci@i0cf8/pci-bridge@2/pci-bridge@0/scsi@3/disk@0,0",
> +            {20, 20, 20}
> +        },
> +        {NULL, {0, 0, 0} }
> +    };
> +    CHSResult expected2[] = {
> +        {
> +            "/pci@i0cf8/pci-bridge@2/pci-bridge@0/scsi@3/disk@0,0",
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
> +                      "-machine pc %s", joined_args);
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
we should add SATA tests here too

>       } else {
>           g_test_message("QTEST_QEMU_IMG not set or qemu-img missing; "
>                          "skipping hd-geo/override/* tests");
> diff --git a/tests/qtest/ivshmem-test.c b/tests/qtest/ivshmem-test.c
> index e23a97fa8e..c4ca7efc62 100644
> --- a/tests/qtest/ivshmem-test.c
> +++ b/tests/qtest/ivshmem-test.c
> @@ -378,6 +378,32 @@ static void test_ivshmem_server(void)
>       close(thread.pipe[0]);
>   }
>   
> +static void device_del(QTestState *qtest, const char *id)
> +{
> +    QDict *resp;
> +
> +    resp = qtest_qmp(qtest,
> +                     "{'execute': 'device_del',"
> +                     " 'arguments': { 'id': %s } }", id);
> +
> +    g_assert(qdict_haskey(resp, "return"));
> +    qobject_unref(resp);
> +}
> +
> +static void test_ivshmem_hotplug_q35(void)
> +{
> +    QTestState *qts = qtest_init("-object memory-backend-ram,size=1M,id=mb1 "
> +                                 "-device pcie-root-port,id=p1 "
> +                                 "-device pcie-pci-bridge,bus=p1,id=b1 "
> +                                 "-machine q35");
> +
> +    qtest_qmp_device_add(qts, "ivshmem-plain", "iv1",
> +                         "{'memdev': 'mb1', 'bus': 'b1'}");
> +    device_del(qts, "iv1");
> +
> +    qtest_quit(qts);
> +}
> +
I think that we need something like we have observed in 
tests/qtest/drive_del-test.c
to avoid copy/pasted code


>   #define PCI_SLOT_HP             0x06
>   
>   static void test_ivshmem_hotplug(void)
> @@ -469,6 +495,7 @@ int main(int argc, char **argv)
>   {
>       int ret, fd;
>       gchar dir[] = "/tmp/ivshmem-test.XXXXXX";
> +    const char *arch = qtest_get_arch();
>   
>       g_test_init(&argc, &argv, NULL);
>   
> @@ -494,6 +521,9 @@ int main(int argc, char **argv)
>           qtest_add_func("/ivshmem/pair", test_ivshmem_pair);
>           qtest_add_func("/ivshmem/server", test_ivshmem_server);
>       }
> +    if (!strcmp(arch, "x86_64")) {
> +        qtest_add_func("/ivshmem/hotplug-q35", test_ivshmem_hotplug_q35);
> +    }
>   
>   out:
>       ret = g_test_run();

In general, this patchset should be split as such approach violates
"patch should do only one thing" approach. There are too many items
to discuss and fix.

Den


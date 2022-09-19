Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A764F5BCD25
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 15:28:00 +0200 (CEST)
Received: from localhost ([::1]:44444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaGoZ-0007yP-Lt
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 09:27:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>) id 1oaGaJ-0005Yn-Cz
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 09:13:15 -0400
Received: from mail-eopbgr70114.outbound.protection.outlook.com
 ([40.107.7.114]:35555 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>) id 1oaGaH-0005HY-09
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 09:13:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NnfmNY0sToQcitzWuLJFIJbPGZd9Fj8M/Do6BKz/1oDZ5oRu0Cc+732SP7Uo/0MTY8r8VNGYUCKSUGKNSyjTcCaYG7Td57Qe4tvm0gg73LzumJULsxc/QCFXy3zXmMfLGYCB/wx1k3YJWLFbkHkj6Jdb4SrxV/4eqb8qAM/OZwv6c2ZfQZCcBzhkaHnM2rGxlw71n3xP4KoI6clSDA4B6fkFY7kH0huG5rF6a6pI+Xb4ToyGEuHJZBQPcaWAMAwH5vXIuprn4Vsapq1ZAbpIVgOr3AHoqClrLuFdfAQ3WM11lnLBsYtgVCG7fJXSFpvsN4kQpAfmtO1mRTaFlo14dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ST9tm813lMFjZTFHlX3NhJvLUEKJj+C8ENceLHmrwmE=;
 b=grgREnz6seCqH8mvJCnGECc++lLKktODJS9c8Ex2tfBF9kAQfLnwqC9ssVyxuGK/67zFXfJGAa+wgIPUj023QjKWmGFjYEGA3f26QwaRqzFj7KiNMjnulncTu5GaIDRzsBeBeb37inelveDcoD9YYFYX8KQGpGXbLxaB1TnlPwXlRZMeLXN3d2z7feHUc1TM345xPG2jESieQ/atneAjNi04QT1HvgNffppOzsy0SX1lMKaK6QWxd7ka/ZVhavL7SrItoNeXmSvTXJA16+yO4xpn592VvglHpPq6T5TsJPwesM73h4cJS374hMkfXTTvBflHhVNRz19WIP7gDI2K/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ST9tm813lMFjZTFHlX3NhJvLUEKJj+C8ENceLHmrwmE=;
 b=ESjIsijpwK1390f/3EHcaKUYcQplxSoFYfFORRwRq2lByYw0hKyXc7Mg/EHmjNJaWQLIrTlM1tMQ7QTOIiu2T0kTutJuNJ18Ot1o+2fP1ZznSUNoVRu3KGNhcl+bAxDrtM+AqkJ9Q0UzG6uNO/eWQ9yveCo2lbPGTJVXDa+3wEG0Ioj5IalaMQw6f9h5TFToKWe1gqP1rG/AVKlfORwRH1ABCIxwuxLDhRdtetckB9rmuMcUbqqhC0eupILrUpMghDyysEZDrQEtbNJO8Y85IsNQOVODtNsy7nGCEqCQtwomvkT2ngRN002yedY3uhpERBFoRaE9WBBSocUOcvomXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by PR3PR08MB5771.eurprd08.prod.outlook.com (2603:10a6:102:83::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Mon, 19 Sep
 2022 13:13:08 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::f173:be01:d26d:8d2a]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::f173:be01:d26d:8d2a%7]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 13:13:08 +0000
Message-ID: <69fdd561-4231-cf02-7438-2bf5acef4794@virtuozzo.com>
Date: Mon, 19 Sep 2022 15:13:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 2/5] tests/x86: Add 'q35' machine type to ivshmem-test
Content-Language: en-US
To: Michael Labiuk <michael.labiuk@virtuozzo.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
References: <20220915131407.372485-1-michael.labiuk@virtuozzo.com>
 <20220915131407.372485-3-michael.labiuk@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220915131407.372485-3-michael.labiuk@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0165.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::22) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR08MB6956:EE_|PR3PR08MB5771:EE_
X-MS-Office365-Filtering-Correlation-Id: b2328042-8d30-4e07-9a79-08da9a40b239
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /qa1mm61UKiNE+plXSycuyy6AwxQco7VYqOO5umcpWOZejwBnQ4a5+KzJrf1ky6Malqu2O96uYkiVw2u0YtUkzhx7uwwz+iJBqs3RHSUhqF8QlsUHy3vT1x4hrKZZdcSHU+zAtMykCLujb18uMvJygVyIQNrz7fQGVSTGX2CJ6JSjRhDLDYojb/SXmF4myXoTPt3reOmeIR2jA+JnkL+LIrTNX3bCU0KAFntDqQN23QDEAw45iVRgG/SavqR2SXNd7AJp4iDrbROP6YI50RZAmwbc7i4JQ7XXJWfr3G2p5+GuhZnAYn24DoMliJ1+1o838mP741hE4VbZ/FAUNrmsFtL8i5yU4irT6D2RNy6A2n0gm7h+QNTj1AEK6MFlO3Fdg62rbnB1iEilaVDsOKEmf1OaII+Y3yjT17FOjxNLQJXO1cCsFengBuduhiNTTHgb+yHt/sXI577dgLuhxHB4XnaQNxDQR8fErGFgrfUSGGP5DMbojA7GBRLVfET+hn9Gggabu2O/MhSUHkL/V217ZL8m00g2fS4K1FT/VLJ3H39J//c3TR6QtFDk6upgv/tLGzeaHWNxcO9B3EokjNf0lGUZti414zGYTTG9k1AIFhi9Mehk/2emBW+dul2uZOf1+cXgAiMTlGxo94xpBQYUTgIDzXjokm+15AgZ2JYMkCcUL8gDw3i95QcM7OX1aCNKeAWWsJDcYCO5AQCnL/tg0mZKoJNBZG1XGn9qHofCefXdXXDNSkF12tovKl5yBFRnUnoRM9jsR4IMUyd8IpC6w1heWGFuYAlqIu8VnCsCJm5v4EdADv/47TfVlJnatRVLaW2dvusl+pu8RSECix8Qw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(39850400004)(396003)(136003)(366004)(451199015)(2906002)(31686004)(36756003)(316002)(38350700002)(38100700002)(4326008)(66556008)(8676002)(66476007)(5660300002)(66946007)(8936002)(31696002)(54906003)(86362001)(186003)(478600001)(2616005)(6512007)(26005)(83380400001)(6506007)(6486002)(53546011)(41300700001)(52116002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHZhRERYQ2pHUHczVXJmRzd6L2l3dUVHQ3lvT0pEcEoyRHJERm5DVGtOOEZa?=
 =?utf-8?B?ZWZmREhCSG01R1djZ0FhVU5VSmRIWHJPOVdoY2JYODFnYXZ0SmttRmZ6cCtN?=
 =?utf-8?B?dVdoUnM5cEhlMFB1dlo5OW9JK2VWaCt6QUhMcnZ6bTZMVzdDS1FNUE5RN2lk?=
 =?utf-8?B?V0dlNTM5NHgwajN2NUQvOWNoVVIrLy9EaFFDZE5zdk1zOFFEQkl6Y09mZE5H?=
 =?utf-8?B?bW1IeEdVYzFSV0dNN0ZiMTRwU0lzd3lpMmtlelNsQVF1UHNPeXJmZnJQNkF3?=
 =?utf-8?B?NExhSVMvVXFLSTlMTnNJOCtYa0NWR2poRGl0VDc3NDdUQ2tYcDVYc2xpcERn?=
 =?utf-8?B?a1g2U3p5bG5kWXZkM0ZJYXpTSnNVR2RPMURRSU5XdU1wN1pRYTloKzJ6WDVx?=
 =?utf-8?B?N2M1Y05xbEZpRzdjYWk5WmZQVXl0VHUrTXp3c0tiZ2J2RE1ROEs2VTY4Um5k?=
 =?utf-8?B?cFllSGd0d0VzQm1INm9TSCthek90M2lRUENGUFNaaUlaKzR2UjQ0KzFoWkRH?=
 =?utf-8?B?MG1lM1Q2dVVNM2VBRDZzcTRtd0hVVWNNWk1nVjRYSmdTdHRoekZsS1k1ODQr?=
 =?utf-8?B?am8vaUVpMm5acjh6MHdWVXgrWHcrbTNYY2lhRDlnS1hLUDJUcGVVckMzdjBS?=
 =?utf-8?B?UmExcnV5UEdXbmxId1JJYzFIQnJtZ2NSdTUrRkRHdTVXNVFYZ3FDeVRSUlUv?=
 =?utf-8?B?aE9ITW9ETkJxR3REdnY2S1BsL2xBTDNRNTZFQXNuWFFEV004NkZkQTZSTm91?=
 =?utf-8?B?SzRWcjlRWTRmUVZFMEFkTE5yL3FMQVA1c3B5UnM4SDhrRmtsSGJxNUg5UHdK?=
 =?utf-8?B?SVM5N25WVnF3cHVhTHRBK1NRdU1mNys0a3lRT1B5L0lDYjdRTUZCRVFiQUdS?=
 =?utf-8?B?M0Z3aTY5a2tQOE83UDMva3lZV2oyZGcrTlpOT2xEVG9NSUwrU09OYk9tdTEx?=
 =?utf-8?B?K1l0SHlVdHM5NDlGMThGV2puOUJ0bWZUMlVkcEhXaHR3SUhUWFZRUFA4S0VP?=
 =?utf-8?B?Tm5UK0d2aldxdFM4VVFhSzdIcVlHWmc2R0tMajlCR3BEMGxjdkZTeC9YRjNx?=
 =?utf-8?B?S09LRmhtUmJheUNOZ1g1ZzRMUE5TdllSTHNnZWtmZ1dsanAxaDVZd3JKbTZ0?=
 =?utf-8?B?am8xNnhaTWpDczcwc1lzSWNHSDVxQlo5KysyUTVJMk12RS9JK081eU5KbVd3?=
 =?utf-8?B?M202dXJKRDg5Nm9vRm8ySVJQN3Bjam5MMXczNEtHaXJOcW55TTQyakVzR01w?=
 =?utf-8?B?SXVSdEFoQ1JudTM0TEo3N2lJSVJGUDd2U1BUK0EzSDdiOENxemhSWDRzVTBk?=
 =?utf-8?B?Rkg1ZGVwZW1sdkNDWmlxTnlsTTk5OVZVbFVkMHZnTVZaMmxYaVRzSEtGUExL?=
 =?utf-8?B?VDZjVStCUHl1cldVS2src2M2b3pqdHFaek9TTCtZdkJVdk1objJYTjNPdWo4?=
 =?utf-8?B?VkR5aWRVclQwZ2hkcjc1REo4dW9VeWdFSHNoNlM3Wmo1Q3E3MlpOcGJhM3FL?=
 =?utf-8?B?R0NHTStocGFta25sT0VJa3N4Y3ZaK1NWV1ppdm83YnV6ZU5UUkRTMXlZdzc4?=
 =?utf-8?B?UmdZSUNqMzRXUVFrbndkMUk4cytoSTdQb3I1L0JvbE5hWm1BU29vT2RkakJ1?=
 =?utf-8?B?SjBJQWMwSVJXeXAzSmxSSE5PZWZIa3A1aytZZlFyZEtMT1lvaXhXK3V6eDRp?=
 =?utf-8?B?cXA3eCtTZHJhaXhOQkZaLysyb3pTdCtCUHlRSkErUnl1Wnc3eWUxRVhROGhi?=
 =?utf-8?B?THJaaTRoVmU2eU5lNXRnYTlnZWFjbU1sR0RvRTI3K1BXelFUaVdERThneTZj?=
 =?utf-8?B?MWFoOUtBWUc0Z01qK1JiNjkxSFRWZ2VDY01aU2JiZitBNVU0Z0VUTDRqM0Mw?=
 =?utf-8?B?cllOS3ZENXQ0L1FDSk1LV2JJbHdvWVAvVHlJNTgxWDZVbkFtTDNiOHY2R1VH?=
 =?utf-8?B?citKa1EwWGhRanA4WGxEd0dEb3lYZm9aWkJvYzlPNW1ZWDg0RFUvSFNqZjBH?=
 =?utf-8?B?VUNRUk1HMTROQ25nMEhSUDhWZVZzUEJyMXRtR0lRUitsSnh2YWNIZ3VoS21G?=
 =?utf-8?B?REhqUG4rOUxrYkhjb1YzRk5jbnVVcC9GQ3dUSmVNMmkyVXFvL0I2NVVYM1Zy?=
 =?utf-8?Q?f7Z7SeAwFfmuloeE36jqfr8Jl?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2328042-8d30-4e07-9a79-08da9a40b239
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 13:13:08.6300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b3bdXlC2p1A3yM3UDpRkVz9QCR0QQSqv1LLCUDVusQG02UAbg2FEuvwJV4cNTFYpt44KpDRfLEKAxr6SBlwzUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5771
Received-SPF: pass client-ip=40.107.7.114; envelope-from=den@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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
> Configure pci bridge setting to test ivshmem on 'q35'.
< empty line here is needed
> Signed-off-by: Michael Labiuk <michael.labiuk@virtuozzo.com>
> ---
>   tests/qtest/ivshmem-test.c | 30 ++++++++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
>
> diff --git a/tests/qtest/ivshmem-test.c b/tests/qtest/ivshmem-test.c
> index 9611d05eb5..0f9755abc6 100644
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
hmmm, why do we need this helper if it is not used anywhere in next
and this patches?

it is also unclear to me why don't we do 'device_del' for other archs.
May be this is to be clarified in the patch description or worth
additional patch.

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



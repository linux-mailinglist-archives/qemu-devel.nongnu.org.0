Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E44325BCCCA
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 15:18:58 +0200 (CEST)
Received: from localhost ([::1]:46070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaGfp-0001V1-Na
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 09:18:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>) id 1oaGa7-0005Dt-CV
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 09:13:03 -0400
Received: from mail-he1eur04on0702.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::702]:63764
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>) id 1oaGa3-0005Fk-1b
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 09:13:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aSeGyBDq+c6Kntz/FfkPkeunSS1hgQDN1y7oRCpmfx+iUZCk1PLoAtx5zmr/d722wT0JD3Os54N1GW7VU+wCRo27+af4PibzKPapawceJOQRWbFy06swXWYdNHhuysE8TYbd29JgHVB38zJ0ue7IDy+vipReuIBewESNCQy526Ram2uPVQNTOJ8Q/gMjEG0OUloSTuYmqBOVkAoqjXX4MDJT9RgULVnTxsWbYvDKeCVIfS8+gxE9AX7xAgSoWxy/Zvq5m0XM8een/i6HBgnkLjrCnGO14LW3uKXgK4TqnVaMa5ok4X+66qmWA0RKMAYHkKV7T0t7tdHwX4FC40k+iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qN7keurVMwW6/80YiDNGYeISRKhj4gFRFR5Lu5a1oWI=;
 b=JRIfZzv6iT3GAn8382VohyKFzS/HZ9DPwmb/tmAtOJ0rZdLY+cgoPF3BM4+fF+LQ/kxoMhltwCfDGwg4J3BmnpQDGUu3ED31FzWPT7kqE3w8S1ySvyQZ4OumE63h5XZnWGefVzRNDDkW+D1I4v4Rqin1ztQpX4woo3FnhrqwAlPoPO+QVan613/oBG3DDWxUfFQrjSKnVxcvzR9x89zS0zxLQaDG42Ys08tm4V+1hx+6KehO1305cMzl0XhnrPjut2D34MoGNCkJYqdhraqrzbUcfRcrjFcrmgg5XhptQIKaXYPlIj5qENNiOpYucdACdC3jDr536qFZ7DHokCstxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qN7keurVMwW6/80YiDNGYeISRKhj4gFRFR5Lu5a1oWI=;
 b=v9gMnL6ZAaJHVCNBnxuodU8qlSY2uYrbMRM+LI8XRsF2W9zwHdt6Hm++cnE3tt47hKOo+aEN6loRFf0rcOg6lyDE4P2PoM1p7ttvfTX021wt5gAOJJ9F42f8+6s0hFYxdcTJOZIyjEoBioEVSJZZxpP9hKEzfostKGdsQZ7mg0jUnK+allyGtq+7/qc1xMUVy1Xae7gdxCKG/8kq+dbq3N9AWAMrBdUKgZLZ/WcyB+uMV9nubXpNUh4nPsUSd+pCe17+8oYYeHOQCtJjq4Lfk59oJ4ieU/ahes7gmHPk+D3La/dhQ/029qFSBVzq7g1y4Hua1E1XcQ8ZelQ6amML0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by GV1PR08MB7347.eurprd08.prod.outlook.com (2603:10a6:150:22::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Mon, 19 Sep
 2022 13:07:50 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::f173:be01:d26d:8d2a]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::f173:be01:d26d:8d2a%7]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 13:07:50 +0000
Message-ID: <491ee271-0342-d281-c9f2-e1c3e0c5f74b@virtuozzo.com>
Date: Mon, 19 Sep 2022 15:07:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 1/5] tests/x86: Add subtest with 'q35' machine type to
 device-plug-test
Content-Language: en-US
To: Michael Labiuk <michael.labiuk@virtuozzo.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
References: <20220915131407.372485-1-michael.labiuk@virtuozzo.com>
 <20220915131407.372485-2-michael.labiuk@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220915131407.372485-2-michael.labiuk@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0302CA0018.eurprd03.prod.outlook.com
 (2603:10a6:800:e9::28) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR08MB6956:EE_|GV1PR08MB7347:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dc2fcf1-046a-4ebb-02b5-08da9a3ff4c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wkz1p2HuCOLjq+d09Q8sX4+rJT1ZU6Rpp90gp/MgAG5hhEpLS7E2fUwiXA5pq0B6ftOSHrqxX/8lLg44g1Uz5tohodFHzeo2zPqPXj+8/ee+PRWk222DY017vmocIeeqSZccUPj/YVDp47fEby1HQtYJ+wEbKGKqinEgHdf1x+V8vyvp55ZphUKVo//OS+RTwCuPS8S7EljPTOX0l/QlIpGf+WBSIToClMh1bIYLAe4kDYteTrupSPy96W9Fx6eB+1B2eMzQ20FAzFX94ligLxni8H8HjOO1FXjFSvxdykWb836JaNjwlTyb/7gokPXEBqs10hZyRVPqCDAXwCbaqZmnEw/hMK/gqEvry8cPKQrccTHA4kl9cqdYitYhCdt46aorLWSietOFk/YNZplgs9qp8MBx4e8bk6DvbZiIECcFIVEDxvZdLbmcJB/gKINUQTPJtiPUtN4MTgV5R/2x9emukhG+fZ6YTfydjoGVBi4SJRh+wkB1X4u/szqiCYqPssKTupf/GgKqdGLx7QWbxKcUCC5/adZoSQtUCKNXbiD735bYHokU6hIcxmHZsqzruu+0iIYID7RgneL4eLvopEYM8umjLKB7dUcqIQsfkZe/IoNELdPMHjcvJk7Z5alVmkRwfeTtSuB6CagWcaTmtQ4CQAdD2wDeBp7y8cFJpZMJNNNieKoY98vnHOHn+rZN2P1AZHxGss98F1Llnv0WXINy6fVyXMg1CM/c7jVyQOXb0dwYnIcznlmlyoFHTyFLEjT5du78EJWMA2gr/FeIb6b/ia2+VQKsa8gAJiIZ4ZbSfO9KLWlUex16DgDpDNV8Ri+DE4ms1I5HWJLz/PrGhQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39850400004)(136003)(346002)(366004)(396003)(376002)(451199015)(83380400001)(86362001)(8936002)(41300700001)(2616005)(186003)(478600001)(5660300002)(53546011)(4326008)(316002)(54906003)(66556008)(66476007)(52116002)(6512007)(6486002)(8676002)(66946007)(6506007)(38350700002)(38100700002)(31696002)(31686004)(2906002)(36756003)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0ZHbnd1allVcnU2VExLcDliT3UxaVU5Ry9aTUJyWmltbFR4ODVJazAwLy9B?=
 =?utf-8?B?d2pGYk1nR2orc2xBOWV2TUVEZVc4QlpVcytmeUJaUWpVazJwc0FUNHFydE0z?=
 =?utf-8?B?UzNqdGg0Nk9yalpKLzhSUmprRzVrZncyWUJ5TlB1YUhPTit6bUxidE1VTWx3?=
 =?utf-8?B?OElHeW9ENk04WGFkOUdwWE5Bc1lBVithclZPQVJiVldjQjlKdTdzU1VSL280?=
 =?utf-8?B?bnB5SnBTZTBMbHNrbU5pc3Q3VTROanZCd3cxRkl1aDczZGE5bGExVFl3SWdO?=
 =?utf-8?B?UVZCZXo1MDRMOWlQYzVBeS9yMCtRNFJ1OWtXRWxGL0FoQThDdmFTY1Byelln?=
 =?utf-8?B?clRJYndYNE1nYkxoZmhrcjBLUzRVdVBzay93VktYR0FYNmFmSUo3UG40aDA3?=
 =?utf-8?B?Z1lFTDRQUWFBVUtSaUNBS3pXZCtkY0hQa1NLdFNPN29BRGc0SUJIVFhkempm?=
 =?utf-8?B?Q1RsNFlPRStYSFNCYlFUT2RpK2NuVXBGMW9kVmZrWTZQejhIWGRoOXMrc2E0?=
 =?utf-8?B?K2YrSGVUdmtDY0RaekcvWDZHK3RncFNremJYUGJIMExIVjNsV1U3OVAyWitw?=
 =?utf-8?B?dVJ2ZzIySnk4cmNpRU1PcGlBd1JuNE1pNmxBcDV6WENHb0ZvRnlKRTdUNWRQ?=
 =?utf-8?B?UDFpay9IRnI0ZmFIQUIxb1R6eGtaSUtEaUJCRVVLTGhXK09YL3IxNGRMdGhH?=
 =?utf-8?B?bGdIUFR0Ui9wMTRqZFArR29jVzJFZGhVUVJyekw5OVRpeUpnajBhYmF2OXhS?=
 =?utf-8?B?M3ExWDFRK2ErVStWYXUyOHdFVUI3MDBocWlrRC9VNGxjMzBrbXFkaU5vdVVO?=
 =?utf-8?B?RllOZEE1My8wU1R0d2VpaVBpaENmQWdwREhNeEdPN2JUSXpQVnFzcmVBOHcr?=
 =?utf-8?B?N1dIWjNMNm02cVdsa3ZCL2pEQ2ZSeUNQQzYvTy9ET2k4TENHN1dWM3BFYzdt?=
 =?utf-8?B?dlNEOU81OFVncDBKbVo4R1ZKNUZtclE4ZjBUbXhlaEU0TTdIajNaOEgvZ3cy?=
 =?utf-8?B?UlVUTkVLWWFDVVJLeUk0RUdzOTdmTzY3K1A5YmFaL2U3Z0V3NzE1QjNuWnha?=
 =?utf-8?B?M3lSVHEvaWlUR2h2eFFvb3pVUUpKVERTaEx4eWdKSkpUUTRPSGxITHduSWFX?=
 =?utf-8?B?cGoxU0wxeHhlV1ZTVWhMcTc1V2tPSGsrSis1bnMxS0ZncGdsbnErTDl2S0lB?=
 =?utf-8?B?TXNIS29VR2tOSEhOWnhhV0RLWXlwemlQY204dVh3TVJoMEx6a3F3a0QxMk01?=
 =?utf-8?B?WkJhQWVFZmpYbTBzVjBDeEJaRnJBTGczYXVuYnRWZUxyMld4WW5EZFQrR3Bo?=
 =?utf-8?B?aWlSaDlYOWZmQmJzR0RlNDllYkNXS05jZ3BzRVZ1OEtPd3NOWTlXRFFGL1V6?=
 =?utf-8?B?dDhEUVowRTV2L3lQc0ZpL0trUlNnbUNuL2t3TnJGL3MrcXdmRVhFbmRGZGgx?=
 =?utf-8?B?c2tlVTRIcWFhQ084bW5wd20wY0N6aHhRL0tzODk0VVc4SnFETlVMVDBOTnJt?=
 =?utf-8?B?bzhFc2VwbDVqWHk5K1BiWlBtdU0wUTVGdDhIS1VIMXpMWFV0T3lCVnRETHhh?=
 =?utf-8?B?Mmo2enZvVHV3VGRveGloRFNISEFIVnozdzROT0wrS1lzQ1BuRTBVOTJsSVpi?=
 =?utf-8?B?VXdua1k1VzZqdlJraEpzbHZKN2trdms0OXMrTjNPa0o3TWZzNjFjYWlTTW9B?=
 =?utf-8?B?OTFsa2RKazhaWlFiSzAxOHF3Uk5RQ2lUQjlhY2lsZlJhYUdvNXNIdUpCV21U?=
 =?utf-8?B?cm55OVN3d3gwaThWNFVXSjN4M0tjZENWYTE2b1pnZHRjRzR1NWNrZ210TlhD?=
 =?utf-8?B?U1dQbWt6LzQ5Q2dtc01uM2NpTHFuVkVCNTRlN2kxWkFJcXM3QkxCdXR5elAy?=
 =?utf-8?B?amt2aWhSREZOL0FyWG5GWmlrTktlc2VQbFpjWnFFTGdXcC9Cbm1tYiszWDRB?=
 =?utf-8?B?cCtTNE5RNzFFcVVoaG91ZitwQlE3WldJa3ErZjZoMGRZeW9QMnBuTThkejB3?=
 =?utf-8?B?N2NaejhBLzJOM01FR3EyZExuSUUreFJQTEg1aGMrMy9rQjA1d0pHbjBPVDB2?=
 =?utf-8?B?K25xbSt6N2JRYm00cjIxcW1JZXFxU1JqK2ZnQkNybVpPc2NRZUZEN0Q4a3U5?=
 =?utf-8?Q?6gNNw/gg/I4DpY1lIAdYzVFa3?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dc2fcf1-046a-4ebb-02b5-08da9a3ff4c4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 13:07:50.7543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uh0YwoD855Kc0AUDbDeLiuZrKDDuzubHq1IKeR3fmlxvS5UNfeg67PVKtng6jBxNnk9jxREg0+9aFkIj2fWdAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7347
Received-SPF: pass client-ip=2a01:111:f400:fe0d::702;
 envelope-from=den@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.952,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
> Configure pci bridge setting to plug pci device and unplug.
> Move common code for device removing to function.
> Signed-off-by: Michael Labiuk <michael.labiuk@virtuozzo.com>
> ---
>   tests/qtest/device-plug-test.c | 83 ++++++++++++++++++++++++----------
>   1 file changed, 58 insertions(+), 25 deletions(-)
>
> diff --git a/tests/qtest/device-plug-test.c b/tests/qtest/device-plug-test.c
> index a1fb99c8ff..d66c386ef4 100644
> --- a/tests/qtest/device-plug-test.c
> +++ b/tests/qtest/device-plug-test.c
> @@ -61,6 +61,18 @@ static void wait_device_deleted_event(QTestState *qtest, const char *id)
>       }
>   }
>   
> +static void process_device_remove(QTestState *qtest, const char *id)
> +{
> +    /*
> +     * Request device removal. As the guest is not running, the request won't
> +     * be processed. However during system reset, the removal will be
> +     * handled, removing the device.
> +     */
> +    device_del(qtest, id);
> +    system_reset(qtest);
> +    wait_device_deleted_event(qtest, id);
> +}
> +
>   static void test_pci_unplug_request(void)
>   {
>       const char *arch = qtest_get_arch();
> @@ -73,14 +85,20 @@ static void test_pci_unplug_request(void)
>       QTestState *qtest = qtest_initf("%s -device virtio-mouse-pci,id=dev0",
>                                       machine_addition);
>   
> -    /*
> -     * Request device removal. As the guest is not running, the request won't
> -     * be processed. However during system reset, the removal will be
> -     * handled, removing the device.
> -     */
> -    device_del(qtest, "dev0");
> -    system_reset(qtest);
> -    wait_device_deleted_event(qtest, "dev0");
> +    process_device_remove(qtest, "dev0");
> +
> +    qtest_quit(qtest);
> +}
> +
> +static void test_q35_pci_unplug_request(void)
> +{
> +
> +    QTestState *qtest = qtest_initf("-machine q35 "
> +                                    "-device pcie-root-port,id=p1 "
> +                                    "-device pcie-pci-bridge,bus=p1,id=b1 "
> +                                    "-device virtio-mouse-pci,bus=b1,id=dev0");
> +
> +    process_device_remove(qtest, "dev0");
>   
>       qtest_quit(qtest);
>   }
> @@ -98,14 +116,28 @@ static void test_pci_unplug_json_request(void)
>           "%s -device \"{'driver': 'virtio-mouse-pci', 'id': 'dev0'}\"",
>           machine_addition);
>   
> -    /*
> -     * Request device removal. As the guest is not running, the request won't
> -     * be processed. However during system reset, the removal will be
> -     * handled, removing the device.
> -     */
> -    device_del(qtest, "dev0");
> -    system_reset(qtest);
> -    wait_device_deleted_event(qtest, "dev0");
> +    process_device_remove(qtest, "dev0");
> +
> +    qtest_quit(qtest);
> +}
> +
> +static void test_q35_pci_unplug_json_request(void)
> +{
> +    const char *port = "-device '{\"driver\": \"pcie-root-port\", "
> +                                      "\"id\": \"p1\"}'";
> +
> +    const char *bridge = "-device '{\"driver\": \"pcie-pci-bridge\", "
> +                                   "\"id\": \"b1\", "
> +                                   "\"bus\": \"p1\"}'";
> +
> +    const char *device = "-device '{\"driver\": \"virtio-mouse-pci\", "
> +                                   "\"bus\": \"b1\", "
> +                                   "\"id\": \"dev0\"}'";
> +
> +    QTestState *qtest = qtest_initf("-machine q35 %s %s %s",
> +                                    port, bridge, device);
> +
> +    process_device_remove(qtest, "dev0");
>   
>       qtest_quit(qtest);
>   }
> @@ -128,9 +160,7 @@ static void test_spapr_cpu_unplug_request(void)
>                           "-device power9_v2.0-spapr-cpu-core,core-id=1,id=dev0");
>   
>       /* similar to test_pci_unplug_request */
> -    device_del(qtest, "dev0");
> -    system_reset(qtest);
> -    wait_device_deleted_event(qtest, "dev0");
> +    process_device_remove(qtest, "dev0");
>   
>       qtest_quit(qtest);
>   }
> @@ -144,9 +174,7 @@ static void test_spapr_memory_unplug_request(void)
>                           "-device pc-dimm,id=dev0,memdev=mem0");
>   
>       /* similar to test_pci_unplug_request */
> -    device_del(qtest, "dev0");
> -    system_reset(qtest);
> -    wait_device_deleted_event(qtest, "dev0");
> +    process_device_remove(qtest, "dev0");
>   
>       qtest_quit(qtest);
>   }
> @@ -158,9 +186,7 @@ static void test_spapr_phb_unplug_request(void)
>       qtest = qtest_initf("-device spapr-pci-host-bridge,index=1,id=dev0");
>   
>       /* similar to test_pci_unplug_request */
> -    device_del(qtest, "dev0");
> -    system_reset(qtest);
> -    wait_device_deleted_event(qtest, "dev0");
> +    process_device_remove(qtest, "dev0");
>   
>       qtest_quit(qtest);
>   }
> @@ -195,5 +221,12 @@ int main(int argc, char **argv)
>                          test_spapr_phb_unplug_request);
>       }
>   
> +    if (!strcmp(arch, "x86_64")) {
> +        qtest_add_func("/device-plug/q35-pci-unplug-request",
> +                   test_q35_pci_unplug_request);
> +        qtest_add_func("/device-plug/q35-pci-unplug-json-request",
> +                   test_q35_pci_unplug_json_request);
> +    }
> +
>       return g_test_run();
>   }
this patch mixes non-functional changes - process_device_remove() helper
introduction and functional ones - new test cases added. It is mandatory
to have such stuff separated into different patches.

Den


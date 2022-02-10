Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D7E4B13F3
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 18:13:50 +0100 (CET)
Received: from localhost ([::1]:39670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nID0u-00025W-8u
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 12:13:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nIAWo-0000AN-1A
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 09:34:34 -0500
Received: from mail-eopbgr80123.outbound.protection.outlook.com
 ([40.107.8.123]:23808 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nIAWm-00066T-5L
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 09:34:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CHWBD5nRHt1qyso5xy3N8rcfPHgg8kcWO+BipSQlCdpj8XfvjZLk012qaC9DI8FLPmqDGz6lLgjstrbukz6NAOsWUw6zinsScCowpGvN+0eYFpVS1nRZ79MPDTEeYcBvo66MTdnUCPBCDuvhJAhvBIDOCP/XbiL/ZM5OBxQVGVZA35WGwPPIQTwXczpBamKelPyxw+FSrDk2ZCu/iG7/0TXTR9J74cCkaW1+ubNsMvU0gdedXaExmcbaCSX1KkvFseDqRkZhibF/g5BrWIB4WYx7twN8bMi+UaHeeTm0/pyzoAQtAFsdJUL6045Ah+KRHTAstN4bI82na7IPAPHJqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U5/BSiGlqQJ0fRwRPvtmjzdV44BR5P8M43Z9Ua4i/AM=;
 b=k/1RF8Xo6Vt1QUNiscYeg9WBlvcUYftM7MyH9YteF3+gLV0O/saf4BL09LaH87baXY1FXzWolSH5xMQ8Ma+v1Pp6dCMU0oqWMIQCMieu4et1bQgCUxcAAKUtU+wEPZeUQddg1bF8ODr1T4xh6TKxprN7EdmqFWCCwxBXZ8hbNPaTWnhNxr9TURDkzuBa2ciWAAPNxqBDwXWTcsZ0jE1Q2hLuuWMQ4oqXZUFK4sa13dBw4xaMYkF66kVwDgnq1G/O9O+NHB4KkoryhfticSQx4JztP82bSy6fWwJYfxRLua6tZy7NKhC4Ea58zuFZofdWUC6lO1TkIoa3V0y/a7Gc7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U5/BSiGlqQJ0fRwRPvtmjzdV44BR5P8M43Z9Ua4i/AM=;
 b=mqH95xRyyhmjKQC0XfGazLxAKPn/5Yn+6ylXqLCstSsckMAIXkwX/FBFhMyMRg0RwTROkkIEujhMnrPxcgBjQniRqJCJnKaMzPR+KdvIwzsnys//qObwf+VyVo2RgFdNJLKbAa1oIPGpb149E7HD5TYKArAAEkcGJ6jvuBjmyFo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM7PR08MB5413.eurprd08.prod.outlook.com (2603:10a6:20b:10a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Thu, 10 Feb
 2022 14:15:09 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4975.011; Thu, 10 Feb 2022
 14:15:09 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: bleal@redhat.com, wainersm@redhat.com, f4bug@amsat.org, crosa@redhat.com,
 eblake@redhat.com, armbru@redhat.com, kraxel@redhat.com,
 vsementsov@virtuozzo.com, berrange@redhat.com, marcandre.lureau@redhat.com
Subject: [PATCH v4 0/3] qapi/ui: change vnc addresses
Date: Thu, 10 Feb 2022 15:14:54 +0100
Message-Id: <20220210141457.539582-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR05CA0036.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::49) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f4a7473-a2af-4966-5d7e-08d9ec9fbe7d
X-MS-TrafficTypeDiagnostic: AM7PR08MB5413:EE_
X-Microsoft-Antispam-PRVS: <AM7PR08MB5413D9A41D50E5AA2D9F7128C12F9@AM7PR08MB5413.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3IO7c11k1z/9o1AAE1331pj5Wrl0ww0zTcP4Bm/320rL4t8iOy/CK6VESotTCqeSjUGXBfFoJ3CwLmAck26OnzoPPDPCoNZ0pMaH/NmQzHxQ7FsBZ4eghUkuyoUbdCf8TUrFp3LCR8E9C3Kg+IiAc550I0fNFzQkqlvVj03c32wi0CaC0zMpvSVOfvUvWxb9kUMN0DhU/p9dhibtbAXdxlh6KwgjRhDH1j/BGV6k/8JXu9DDNXbaxY6tjHmFB1RYUqLb5Czx6O25/aItAqmMCw6zBmDIcpIjkr2ZUKsP06e3WcY03KR4Z/Q7rM8Ye6pMnl+1nWpVpI8tU5lNpMFwUrVFtspg2nS348M9Y1a94ySDOWFjaFyRf0T8pAvs1JA+tqJBNHoDpAGpLzmsbrMcvxD0fb1cBHUGviJrJjt8gUw2EdU9DNfFTwjJGRImmd0aUYVh5mZBRlScQsapW0V2uYOvUsPEOcZzfKpuiew7CDu9gYTdq+r47cmWbpNDhm1pSlaohJHN23fuehv3qwSfLAKcXLbSTVCfZNnkZ7Emy7DpyBk+3WF25K93eWovhKoRMpgZks4J6dh8d1yg1Xt9MmsyTRbhX2wOyO30kkbMH+EVMXBBfCfo/l8hwcn20fpHF7PxcrET12Fqj5ECXCj/ZrXjA6636a1pP+ZhrFBpL9sNf/Yj6nJtZxfXUN2vupXuJt0ggdEcumjZhvkAS4Mg7g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(186003)(52116002)(2616005)(2906002)(6506007)(38100700002)(316002)(86362001)(6916009)(38350700002)(66946007)(1076003)(66556008)(66476007)(4326008)(8676002)(5660300002)(8936002)(6486002)(6512007)(83380400001)(7416002)(6666004)(508600001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2tMUmVPcU5rYi9RSUFvNW02YmNpaXNYazh6L1JkbjhqZnpjYnQ2cmpNL0tU?=
 =?utf-8?B?Y1NKQTRMVmVwalhxU0JtS2lKWitOeWFwRkZqUEFFdVk0Q1JaT0Y0K0JmbVJo?=
 =?utf-8?B?SmlkZ2d5Y201V210c015OVdDczRyN0Z3cUgxbFlVRGJGNlNjOGJjL3orOUJ5?=
 =?utf-8?B?bUlTQmtQRFpidmVWdHdxSXBKK3IzcGtITklGVVNWeXNDMGdCOG9XczFMYXdT?=
 =?utf-8?B?cTFSbFB3Mm02bW9DVUp5eWx5V3p6RzY2cWxidUMyc2o0QVhZRWFCdi8wUUJs?=
 =?utf-8?B?V1k3djFRVWZlelNyNjVRbEIyVit6eFFhMHRCTlhSZHd1eGpTU3RodVRZOHBw?=
 =?utf-8?B?cCs5ZVVuTWxXRXlac3NiQVZlL1NhVDd6Y0ZuRzNRN3dtR2hhMlFXMmNRek9J?=
 =?utf-8?B?K1Q4eFVlTVZLeUYrY0RYaFhnbGFncTFlNW4zWHZZejlPT0xzMUpHL3c3d1kw?=
 =?utf-8?B?aitLQXdleFE4VGhjVjhHMFVUdXVMMEZVWGhxdnRjaFNzN1d0SlJzQzRoWEZK?=
 =?utf-8?B?QWpaQmNKMTh4SHlRZjlWc1c3NVBvRjVDYUJQZlU2SVZMdTBybEFmMHpURXNY?=
 =?utf-8?B?WkFqMUtRRGNwNkdiWUkwVk9DKzYrYTcrcXRRQ1EvWFgrUGJtVCtQbkF6b3hP?=
 =?utf-8?B?aldjWVA1Um5XRlVZTC9kNnpvS0lUQW5EdXRJN0dEbDJXTjRyMDh1aTcxckh4?=
 =?utf-8?B?Sk83STVORjhrWUdKY0FONTcrZkpvRlpPOFBGajQvSG44MVlnaTBJcUFZdEdz?=
 =?utf-8?B?WVdzRklYaEcxRERzMFBVYlpmWkNGZ2JTVXRsSVNnRWduazR2TVdYZ1Q2N1J4?=
 =?utf-8?B?REN4UGhJM29GOFMrQVN2cUVTRDdFTCt5RE1Vd0pPUzNLVjA5MjROdlM1U1V6?=
 =?utf-8?B?Qkd5ZnNpOGYzRTI4UUJXYktUeHJrV0tQRFp3Q29GVENyMGtRUWxGS1Nrb0dH?=
 =?utf-8?B?WjRaM2ZyaUE2OXEzNFZyRTRWTzVtbUI3UWphdlRkeGtWV3NRV3VwMkxFQnMz?=
 =?utf-8?B?VVkzWHI1Y2tVZE1OOEk0bmhsWTFDUGlUNW1NN1psZzBwU3pnNHluand2UUFv?=
 =?utf-8?B?MlA4Z1hFWmJ6aEdkMTNTdlpKdVg1anJmZkRoS1IrY3JLRVltdzVRaXRqVXpS?=
 =?utf-8?B?UmthYzdkclVXZlhXRGE1MC8yZ2tzbGdXdTNPMFJTZUV3bjJyaW1OVkNjRUpQ?=
 =?utf-8?B?czNBSlRDejA0ZS9rUitMN0l6bWVhTFJMYTFGd1VraXVjZG5pc0pEMWJQMWJy?=
 =?utf-8?B?cGljV2NkVEhKVEp6UmZTNXM5L2dYOFNMUG1HNVl6d1N4TDFRRlJ1QlB3TDJw?=
 =?utf-8?B?WXRFT0J2WkJXRnM1NEowYWtmQVczK0tVVnpZWjhPNm53Uk8wV3p2R1hSS1ZI?=
 =?utf-8?B?Y0xuVU5UTW9uM0krVEh1MmtkblRYeHlmSERLL1pTaDcva2RUQTFKWnZMMlBi?=
 =?utf-8?B?T3NLb2Y2UDRWb09ybWtuNU5xQzZ4NnhmME5pb0xxenM0bGdFamgzSmltZXVa?=
 =?utf-8?B?emdGNWZUTlFkMS9yYkx2SVdKUC9CVkhpcWZtQ0htczI1Zk5qVy9NcURRSEc1?=
 =?utf-8?B?UlU1c2VOV1RWSzBwd1RtNnFYcDNZWlBqYjRyODJtU1RVN213WmRNNmFxOWVV?=
 =?utf-8?B?V1RFZ09EWlAxcStIb1BvYm9IWkk2akh5YmlkWEVNM0x5akFTSEt3UHltRzdV?=
 =?utf-8?B?dk1VNXBwMU52d1BaY1B6QkdSTGk4V3h3RzlZRTVHVk02dUtKeUFtM2c2U1R2?=
 =?utf-8?B?NEhhTHFmYkpKWnl2Y2t4OVB2bHRNc2hlbkJnZnExQ0t0TWE3OC9BSmRpU09z?=
 =?utf-8?B?YW5CU3lkdnhNVko4VVR5MUdXbS9DWjlFbUJJdzIveURFdUxyMWE5STZEVCto?=
 =?utf-8?B?d2dNM1VEL0NlSDhCZldGcmVvN0g4TG80bGJBZTZlM0h1S1JxNGFYZDdtalk1?=
 =?utf-8?B?QUY3Sm9KNkJGQVhuSlVVSHROMUl6Yi9HaWFONnI0bmxNRk85UlQ1TnZnY0lF?=
 =?utf-8?B?TUhpaEYwYk16bTBLUHMzdTBRY25aQTY1cEVpMjlXTDdxeFlqejFSM2hmU0JQ?=
 =?utf-8?B?akIvcW9JRDJLZXp1UUZTT1I1ZHlTemtOSVZQZWxiYm1sWFpXRDRRenNHUWEy?=
 =?utf-8?B?QkhiS3VNWHZoamkzckRaYzA4a3U4NHVtL1hOSVEwNFkxT3VuS3puUjhMdUFZ?=
 =?utf-8?B?VTZ2N0VzZldiSklsSlZ6OGdZTlI0VkhsV2NLUHk0dU1iaUFDNmVmbHVhbVJa?=
 =?utf-8?B?NTlzSmFvUGNnYXMwbHF5OVZRVHRnPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f4a7473-a2af-4966-5d7e-08d9ec9fbe7d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 14:15:09.2446 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DANanRbm+y2y6WvdMhf/Nw5MR53PPhgsDWSC/LiyOZXWF0UEkjwuji18tzXNfD5PH+pUcYFUrowM3E/McX17FziEa+ITfeiDFPSICcJEVjk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5413
Received-SPF: pass client-ip=40.107.8.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi all!

v4:
01: add Daniel's r-b
02: refactor to add new display-update command instead
03: rebase on 02
    search for free ports, using same range as in tests/qemu-iotests/147
    check connection on ports

Recently our customer requested a possibility to change VNC listen port
dynamically.

Happily in Rhel7-based Qemu we already have this possibility: through
deprecated "change" qmp command.

But since 6.0 "change" qmp command was removed, with recommendation to
use change-vnc-password or blockdev-change-medium instead. Of course,
neither of them allow change VNC listen port.

So, let's reimplement the possibility.

Vladimir Sementsov-Ogievskiy (3):
  ui/vnc: refactor arrays of addresses to SocketAddressList
  qapi/ui: display-update: add possibility to change listen address
  avocado/vnc: add test_change_listen

 docs/about/removed-features.rst |   3 +-
 qapi/ui.json                    |  65 ++++++++++++++
 include/ui/console.h            |   1 +
 monitor/qmp-cmds.c              |  15 ++++
 ui/vnc.c                        | 152 ++++++++++++++++----------------
 tests/avocado/vnc.py            |  63 +++++++++++++
 6 files changed, 220 insertions(+), 79 deletions(-)

-- 
2.31.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FAE2CA915
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 17:59:12 +0100 (CET)
Received: from localhost ([::1]:46300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk8zf-0008La-3c
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 11:59:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kk8xH-0006xe-KG; Tue, 01 Dec 2020 11:56:43 -0500
Received: from mail-eopbgr50125.outbound.protection.outlook.com
 ([40.107.5.125]:64898 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kk8xE-000583-JZ; Tue, 01 Dec 2020 11:56:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IVeQhGORexkQ2219uGaTLk+3YX9G2B607dRtD+/DOQ9FOVxPTR/uj4Z41rkkgM4QZvPdFQZBooOCWbHQPqkzWKlDQns1rScjdZeO7UXENOAIHVi7usKLX+ic76F0c0ZIeyYoPeYsLP4M9q6J3WobsUO0C04ZlsSvHAf1k3buN7L3s9uznMfUETQDVNpheTD/OR86imxy4RjiRadGBS/5cYEt/p2FOPV8fsTYYnLXACCEdPO4Mj1RlOyYOqMBLE17WQt/iiIg0jAcb1kdWWgbWGPwlqkqEH8XnSt91yOLWSCA2Bu7hG74EEERALpn367JlT/XnZsCJpFLOgdpar1uKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HYKs7pxQzYc+NoZfPCiccHdHnSmTFMBFJ7+2j1REkVw=;
 b=AHlwFeFqVdETa5pKZSoIQxmOLHjqrKcM0Cpi+oU0jeDTjPnLY81XYEjCRbwYjSnBLtTH+yVFZ3A7aMwUQr4ugRWKhYozO1bVeLdzwlWeIHu6Du4Ke+IEM6tBmLCEOI5fFPtrzr9Njeksxt/OItggVUPVIBbng9uRa0BmPNdQcVi8Nsvv2+TqVde13Qyu4IPmp+U3VXuKF/EUzJ0W3KRJI0N0BG+E4YMD1bzGi0DSSVUo4ZN3L7SgegBNYlLVHQt3rKP5DBZ6Ndht+zf7bERgKPBAiF5ikGQ5ZYsnnRttF9x0m7/A7rx1p0KD0io5dNitl8SVzUvuNQgJiPOXCBKQWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HYKs7pxQzYc+NoZfPCiccHdHnSmTFMBFJ7+2j1REkVw=;
 b=mm0HJajBEMlNBNDZDKtmMzjTBPuMBChstXLMqHSrmf4wgOk3q/KB53NOk18JEdk6MusnIrXQ3TbeyXO+WzEPywDdaJie1kcHILXrTS6nTrkNG0UpKgFtIHoe/UNaYuuVd2qF5mQnL0PzwgVDV0J2gLOAM7CZPc1YFf677Nz06n8=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2532.eurprd08.prod.outlook.com (2603:10a6:203:a1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Tue, 1 Dec
 2020 16:56:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Tue, 1 Dec 2020
 16:56:36 +0000
Subject: Re: [PATCH v3 00/17] 64bit block-layer
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, mreitz@redhat.com, ari@tuxera.com,
 pavel.dovgaluk@ispras.ru, pbonzini@redhat.com, stefanha@redhat.com,
 jsnow@redhat.com, sw@weilnetz.de, fam@euphon.net, ronniesahlberg@gmail.com,
 pl@kamp.de, eblake@redhat.com, berto@igalia.com, dillaman@redhat.com,
 namei.unix@gmail.com, qemu-devel@nongnu.org, integration@gluster.org,
 sheepdog@lists.wpkg.org, den@openvz.org
References: <20200430111033.29980-1-vsementsov@virtuozzo.com>
 <2a61f322-b274-f642-2d5d-6664d653adc4@virtuozzo.com>
Message-ID: <c5c1116a-9e98-633e-9160-6ce2176b2b54@virtuozzo.com>
Date: Tue, 1 Dec 2020 19:56:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <2a61f322-b274-f642-2d5d-6664d653adc4@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM0PR06CA0076.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::17) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.91) by
 AM0PR06CA0076.eurprd06.prod.outlook.com (2603:10a6:208:fa::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Tue, 1 Dec 2020 16:56:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 172f501b-920e-43d5-8e66-08d8961a10b7
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2532:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB253275FD79306B96C8FA2A2CC1F40@AM5PR0802MB2532.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wEFx09gKRjHvJdSMKlwe4c8dAkSb9FKuf/a47eGBLTyBpSh9ZYA2GHg7KwiikQ38mta0SDLZSDg+sNp1NXicmkN60iEgihDHFUTTyQgEiSonsXbYcZS0a3mygLnsJCA6jpi7k1EP2XjglPnLEyw85V/Pz4qNG5SjLend6DtS4I0PKmf4WSDhQTQbTabVAnZ7SZi7WE2T/V5tCUQeFaFfC4QAjLcrOLm3tHQC0HEE3c3TOeCpJkrtlCatbqir/4Pjx9fS+vsyM4OLqZQtwrODshAJDcvSfiD6k+j5+vwznKKoHQWN6GT1TM3l4SRz8TUDszWM4JOkQJXvG7Ykj5u/PCMXs/VNh0DiaoedK/XcvOEO7cz4xo1UcGJ3B6rMv9fM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39840400004)(396003)(346002)(376002)(7416002)(107886003)(86362001)(16526019)(26005)(4326008)(2906002)(2616005)(956004)(52116002)(16576012)(8936002)(83380400001)(186003)(31686004)(36756003)(5660300002)(4744005)(6916009)(478600001)(31696002)(316002)(66946007)(66476007)(6486002)(66556008)(8676002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MlErNUJ1VEdCam0vcXhFaG5RMUc1WnYwZG1GNDhEcWFlRDgvRjdtb2JkT1JZ?=
 =?utf-8?B?VHBvQUxCeHJldktWdDRDeVBvQnVDcTRRb3F4M2JiWExZRVJJQXN6L2dZL3lq?=
 =?utf-8?B?ZkZOcjZlSE1jcVpxTlBydmpLTHlnbjVIUXVmSWdwQ0xjN0gwdG1EVjU2VHJy?=
 =?utf-8?B?Y2lCQ29ISXZQSDFXY21kQ3VQVTgxRDNuODVwUEdxZHo1eG1pM1FjNnVYalY1?=
 =?utf-8?B?VG50RUcxRG1FZmVBYkxEdDA2ZGlIVWZxUTFMWUp3eU01TENVc1U5bWJ0RHAx?=
 =?utf-8?B?dEZJREREeDd5YVphZEFXVU5EWFNNT21DczdFcDRxMkVJWnFJbE5UY3cyeFND?=
 =?utf-8?B?R2g3bFdnTWJZeW9VRml0T1ZNNHR1VWRiWmRSdmU2K1d2NW9LdUZUNTVlR2Rt?=
 =?utf-8?B?M0Z1cFN3QVZZaEZ6ODhqZ0cycjY0ZlNjWmpMRWNZcU5zVDF6VTdyd2lwZm5z?=
 =?utf-8?B?TnBGQlNoZTBPUFJDbUFpWkpqbDhBVUFxYWo3cjlONG1kK1RvaFpKZVFNQUpL?=
 =?utf-8?B?Vy8wMlJ5dWgxWEFlTU9majU4bWZjZkZFOEIvVGN3MHBNWTZldW96dkxLcENR?=
 =?utf-8?B?cG9IWTgwRlBSU0VScFhtazg5aGZjWHV2ZXVuWFpzdk5BKzkwT085NTVmL0tF?=
 =?utf-8?B?cHZKMTVhV0dUdEN3dDBrbnZPRmVNOWNnZ2xlUGJjYUZyRjNIcytyY0ppNDVo?=
 =?utf-8?B?RmFLZWZETU5BLzhuazdKUGR2VlVnalJzcWttVlJabVF1ejVzMi9sWk5SRTYy?=
 =?utf-8?B?NzBUNDBpVEFhZzJWaFRqMHpObDlNMG5sVGNyRVV2MnpBNjdCL1ZmLzh2RUsz?=
 =?utf-8?B?L1VPU2ZZS2hlanpxcFV3bklqYkpZWVN0Y0xrdkhjVTk0ak1YUmwwY05LMFlQ?=
 =?utf-8?B?T2lvZHZ6TzZpck04dStiU1JYL1VZcXB1NU1ZVnppT0NsZW0ySzlIRENSd2Fr?=
 =?utf-8?B?TzJKWW5jS1BCdHloT0JNRXRqMVorQ1lSWlEydlZnRTVkTUdRNlBuUHRyUXJP?=
 =?utf-8?B?OGljVFdNakZsZHpuL0t2Y1RKQ1FVRXhPZG14Zmg2Y3BLZ0c1Zy9NRjBXOUFU?=
 =?utf-8?B?OEJ6b0tqdm1mZkMrT2Rsb3BnZG81ZzE4Z0NzLy82Q3JPSnRhWDdFUzVPQ0Rj?=
 =?utf-8?B?ZVJIZitvUWhUN2NDZzNSN211NWErTFB1Sm5NT2d3RlhrWjUzYXI1ZUltc3Mr?=
 =?utf-8?B?THA0TnA4emlIbnlneW1wQk5uRVFLMmtTMDRuR2xTaXBTMG5zSWd1bnI5VkJa?=
 =?utf-8?B?TWNEUFFnK21iRlAwQlFxTFlKbEhuM1ZoOHBWQjRGTlo5V1pWVUlOUTJXWnJD?=
 =?utf-8?Q?JfkTbqAUGJ0ki3MMWCs/7rbNRSeWkeLOrk?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 172f501b-920e-43d5-8e66-08d8961a10b7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2020 16:56:36.8677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ir1Hr97F8N8Vdxy4+zqKOWDcDZa17PZBFWhmtLPyXOYBGR2sr/BA1I9L+b+a6qcj8RXHmN88DCFpV2kYb9+x2tsrmDlcIWk0aaaor/Z0ZeA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2532
Received-SPF: pass client-ip=40.107.5.125;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

01.12.2020 19:07, Vladimir Sementsov-Ogievskiy wrote:
> 
> I have an idea: instead of auditing each function callers, can we just make some good assumptions (like that the whole offset/bytes request being aligned to bs->request_alignement doesn't lay inside [0..INT64_MAX] region), check it once in bdrv_check_bytes_request() and assert in each function we convert to int64_t.


s/doesn't//

-- 
Best regards,
Vladimir


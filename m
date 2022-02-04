Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C09E4A96F0
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 10:37:23 +0100 (CET)
Received: from localhost ([::1]:42396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFv1u-0006QM-Du
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 04:37:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nFuIP-0001FV-6B; Fri, 04 Feb 2022 03:50:21 -0500
Received: from [2a01:111:f400:7e1b::706] (port=7515
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nFuIG-0002X5-F0; Fri, 04 Feb 2022 03:50:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OufLBF09LHEszKJEFr/C9O6VQEPVuA9wONY+HsTs7mreCuFc2JF/t78JK4YN5ICnopBR1T7dJ3d3EibTXu/yCbo03EHiag5n0gLBCf0ilpXNyxJOgOsxKxgh/4aqZdmR6uJkcpj4K9VHS7LDu9j9e07VQmYI28YvwWqABoVzWF9HDlwicsSe8f27iwTEdaTNrJ8K1DoW+HdWULifkekCLbUPmw1lxMnsBWS1pxgwlNtBgc2plTONVa6aq4+4Q1M0ZuNp3AVz9ZUv9qlQnosCioZaYisfF8pBjTShEg7TAmSdWyjojYEWETG/IhLx2hPTaPeiNAwrpl1JO/vxUugLSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rrX5puuQfZe3Hv4LXIN+nEsUhmDViVR4TpNcuzv4ei0=;
 b=MnU3lIJVEDSHhqeF2xHw3Vq6uKTBYNMPeJ9ia+uD6Z2/nU8r3+F0aE3Fy+UWMi0hAneN/ro1X53xujiwQ7jEx4WTuktpOSRTsk8OswnB6VVnpbUvnuGZYyoMop2y9u8s7M9MGQJZOCELxZmcS/y3g2RozABZh8oBtp2OnstwD/gx+oxa8Al1kn4no9qI4v3ZOxp9pRMJgHR40xbuyaLjokgdoZapcghEtnlQPkIF9TigGzNwNbkZxTa5COtc+BnI06eqB0LOfA3cty+Fb+K82X/ZOa2bRl6gDb8lz/Lj9+ZCUCqB0B3JSQ5cs0frXTIDFPJJYY3+mD4WSwbXlxeB6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rrX5puuQfZe3Hv4LXIN+nEsUhmDViVR4TpNcuzv4ei0=;
 b=jMJXmy+kPD7ID159jlMIr1Xp2w5zWaImgaXaTgzIfrlG92NJdltU9l/MCYAhROx6KnsTAW6u9+LFEf74J8526sLXGxZKGOSN53y60HnAGTSpCApTr5N9ibhv6omBYyRRUTH8Aey7ClE3WNH+uoyUlocaXGXMNxqoi4wFk/HwFHs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB7PR08MB3340.eurprd08.prod.outlook.com (2603:10a6:5:20::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.20; Fri, 4 Feb
 2022 08:50:06 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.4930.022; Fri, 4 Feb 2022
 08:50:06 +0000
Message-ID: <8aef874a-fbd4-c389-6914-9e7261305fd2@virtuozzo.com>
Date: Fri, 4 Feb 2022 11:50:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/7] block/nbd: Delete reconnect delay timer when done
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20220203163024.38913-1-hreitz@redhat.com>
 <20220203163024.38913-2-hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20220203163024.38913-2-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0228.eurprd06.prod.outlook.com
 (2603:10a6:20b:45e::20) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5f41c8c-6e72-436b-428e-08d9e7bb57bc
X-MS-TrafficTypeDiagnostic: DB7PR08MB3340:EE_
X-Microsoft-Antispam-PRVS: <DB7PR08MB33405CA26858F91205C5668BC1299@DB7PR08MB3340.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iDs8McjAFGcJKVpstESF2F0M8ogV1HFE1yRO4znasS3Zk9zGLmOlsTneKwqg8tMqQAaZvBUV2qNjv0KfjcWSiHBDl4PxfC340mBAGD2laaviT3CYe9frP03ZmaekXz91qcP4lApu0QHbHVG5bpS1dK1tcs/szZ9FJnS1X/jp7fcXUqgjFA21MG3OKEUYYH3OkuUrrdYYPu8pxLiaRiOhvGMsxU9c3ECUL1PWG8KxTwpuEIXYFDSMFXP+wms1vyAcFGNUUZps+xZtUDs7AbxJzCMFOAqZhoL892cpQSBA4nxnstOQ4sTpvHwsaAk6jDwwOJUR05kCcL35ao91AwskBgUcShMKxw6Woe2Rxlt+P6q2Ah9+1uYqaIp+BsGgh0AqjG0YKudFj6Weez92Oe841dVl+dNnNtij1wUXDB2K+dA9HIxcVgNgk3UYzysoyTsEoOt4OLRSnmklCco1+hHjvQFE6l4tQXV4ZfYJnltypzkzaybz2KS93XQJCRxpBtgsoPISKo6054zHzRJGbcgTTC0vIqsLg92nSWS2s7zqJ5qNRNeknBNlPf0woE0DK41IBZ5UgoOxeQsidYL08Zq/9fLM2Qsk18LZAUey41KXjxkdRPQY2Pl5MpUfaNascOhjg3p0Fv4pldexva7Z+Us/lFXNhwhZNTHzzeG1at4gUnW6OUD692uSZNjfv8mIlYMbDWpAJHrOROdBnYI7Irm9jKEZyNgGgdrEjIw+PySEZGkAGRMX1rusNXuB4xbTVgL6syF/p44rK963ck9HYVVa6w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(66556008)(508600001)(2616005)(4326008)(52116002)(5660300002)(2906002)(6486002)(8676002)(31686004)(8936002)(66946007)(66476007)(36756003)(26005)(38100700002)(54906003)(31696002)(83380400001)(4744005)(6512007)(6506007)(86362001)(38350700002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHpadHZzZG9wbG5nMTM3bHc3TmpBaENGMEVPSmczTFZ3T2l0NVdSOUVDaDBP?=
 =?utf-8?B?VE84K1B2SFRWUjJxMWMyRC9vQVhoZjIzVzVFeW5nNmVucnpYVXo4eWtkeEFY?=
 =?utf-8?B?VGwvbmZLK1V5cGhwMzBJV1NyaWtibGdVUHlGbU1KeUVzdlIrdTdXSmQ1cjFX?=
 =?utf-8?B?Tm0xb0JDaDF2Uy9vZXkzd2tkOVp5RVFZU0NUVzZKMEFkYzExSkRMUWVPSmJo?=
 =?utf-8?B?QWJ1Wmx5NHZQV2Vnc2JYeFVLZ0JIRi9xK0NXeXNMUjRnN1FMWUNoQkNVWlJv?=
 =?utf-8?B?VDh2eS9NMWovaGNONFE3RGRhbGlJWlphb3dmZ2xzTUhiVS9yU3pSS056Q1dV?=
 =?utf-8?B?ZUFnbHZDYzdLaWJodnhvUTBEOXpPWjVFTlhNM01VMDZBQmlBTmRCS2pWdUVh?=
 =?utf-8?B?cHF5OWE5UG5lK0xvZi9mQXBPaFEzTU82MkxhUTl4WEw5MjhldysyYXNLK2I2?=
 =?utf-8?B?Z0xIV1JvcmV5VFVKaXlBMElxUjI1Z2ZoT2gzTkNDeGR3SVVzVjVxM0F0RG5V?=
 =?utf-8?B?RGdPbmxaOHBYU2JTQVU1Q2Y3V0pyeVZ1VGJJTnZmakJvSFU2Z1ZDODR4aGtS?=
 =?utf-8?B?ejNPRjdWYVVYQmVGUGtJckJyZGswdWtTc2JuY2NrVjNLdEl2eCtLeVVIWlpM?=
 =?utf-8?B?QTJTeXh3d2ZzRmhwM2hmaG15c25OelppTnZoZHROUVNrT1VQZlZZL01JYmFQ?=
 =?utf-8?B?eVZuZjlmbnMyY3dsRUhEMzhaQ2VOcjF6N2tzeTFhaEtHKzBZUDNhalhVcWtq?=
 =?utf-8?B?eVVxdnF1cGJFb2ZtQkUrZ09VL2gxTVdJT1NNQytKWUlZWjR2ZVNDZk5MVWxv?=
 =?utf-8?B?K3JKTkJNMmEwSHJERERnSW11R00xM1NZVzdzYUJVUU9rTkROUkk5RVdBZWxJ?=
 =?utf-8?B?UUd1b1RuazdkZUxoYlcvQ29SUGtyeVJRaGFKK1h5NHVPM1YvRWdLc2I1RTBE?=
 =?utf-8?B?ZlFiUXkzNTVmM2N4WXAwRjltR0NBd3BzTWRrSUZDM1E5ZTVSQnRmTDdoK2ZG?=
 =?utf-8?B?bHQyYXZhRUxoYzNMdFZLZ216akp5NGh2b284VjhhTE1ic0hhVXJBd29nc0xV?=
 =?utf-8?B?R1FXd2t4NFlVYkJYOGNpK2RYNTFXRFhLekV6Z3E2cGJJeDQ1aWxYZDIrNVJq?=
 =?utf-8?B?ZS8vMS9UOEhmNnorR0xTNU5MSWZML0hYMllYbTVZb1ZpYkpLS2owY2Z0M05p?=
 =?utf-8?B?R3RsZmRRaGZLUTh1aWdxR21lRm11SVVNdFRoWkhjRi81SWhtaVRabjVWd1U2?=
 =?utf-8?B?UDM4Q095dzRZeW9JUzRnSk5rNjlxVStLcHpUejlycHlGdmNWdDJXNnFIeVJ0?=
 =?utf-8?B?WnBXTkt6bFBnOWVWSFhBc1dLSFVzZWZoZThydHFrN08xN0pkTkg3dVVHbjFX?=
 =?utf-8?B?OHlLdWJibjNsajdQQ1BPU3hjR294ZFlQS2FUdk5JNElGcm11Z1RQeEh0UldL?=
 =?utf-8?B?K2VZWDdidEluZCtyZXRXRDJxaVRVb3RBOHBNRFJLTzZSenRSVWVKbTY4QnNY?=
 =?utf-8?B?VFdSMzNzS0QrK2JpT1lqQjRxUkNzaDczR2FjQU1HV0poUk1ZN0tRRnJJcTlM?=
 =?utf-8?B?KzdNekppb3NTWGpYUnpHS2h5MzZSM2hmdDBuRzdzUitzbngvOVBONHR2MmU3?=
 =?utf-8?B?Q2ZXUzUxZjhrYzJxY0gxaUJYNTBrY0tuM2o2YnJzN083MVAyV05XakRGME9G?=
 =?utf-8?B?OWc1MG1jTWNOMlNHbEsydjlEa0hFN2psMDRhYnd4QXg3TmJaMUIzQWpqT3p6?=
 =?utf-8?B?aGlrTkVvTkR6bktIMlRDcktBTnNMUzZMTXlibi9rcTFPVDVhTXNIWXp3Sm9l?=
 =?utf-8?B?eVRJMHhFN2N1S2FpOStxOHVSQmp6aE1ZcGhEVWF1bDNxZ2RST1JzTmtXdk1D?=
 =?utf-8?B?NHB0bksxZU04a2pzaXl6L0xOaEV4ZTE2Wld0R1dGaXdFbUlLR25OaG11ZGhE?=
 =?utf-8?B?UURheDFBdWIraStKbGYrWVhTSW5rci80MmN1NWF2L2ltR1UyV0JSbDR5ZEc4?=
 =?utf-8?B?WTdFQ0J5ZE92R05qRXdubm0vTFFKN2Jqa3h3SUN3MDJTSE9OSDU3M3NYRmFL?=
 =?utf-8?B?UE85TTdDUFp6dzZMUmtCVWswQnJadEpWOFlrZlpJMXNPTHlDNXVnajE5bnUv?=
 =?utf-8?B?eUNpRmU5UzBxMVFKL1ZiTlhydjM1MTE2eStQYmZGMHhuWXByZlRUSVFTU0Vm?=
 =?utf-8?B?eUQ4TGxnaDF4RkZTTUphVWlKWGlIbnFWWGl1dmlvRmRsV21hOTJIbCtUMUhk?=
 =?utf-8?Q?optVz3bw26fQ6BkL30vhbibBY94UhJU9ypQw1EokaI=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5f41c8c-6e72-436b-428e-08d9e7bb57bc
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 08:50:06.8691 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aaR2dAv5kH0o6oi5Ao4TePx8GzFnPFyeyjcASR7emB0YpdZtH+YtI4HDetc42KA/kLpW2xK7DUxGVAtViW6XbI0W3DyPSPQpAE23UMBCs8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3340
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1b::706
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1b::706;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

03.02.2022 19:30, Hanna Reitz wrote:
> We start the reconnect delay timer to cancel the reconnection attempt
> after a while.  Once nbd_co_do_establish_connection() has returned, this
> attempt is over, and we no longer need the timer.
> 
> Delete it before returning from nbd_reconnect_attempt(), so that it does
> not persist beyond the I/O request that was paused for reconnecting; we
> do not want it to fire in a drained section, because all sort of things
> can happen in such a section (e.g. the AioContext might be changed, and
> we do not want the timer to fire in the wrong context; or the BDS might
> even be deleted, and so the timer CB would access already-freed data).
> 
> Signed-off-by: Hanna Reitz<hreitz@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir


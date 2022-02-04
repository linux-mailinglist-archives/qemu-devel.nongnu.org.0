Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 358044A9729
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 10:51:37 +0100 (CET)
Received: from localhost ([::1]:32968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFvFg-0002cZ-Bf
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 04:51:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nFuAc-0004w8-58; Fri, 04 Feb 2022 03:42:23 -0500
Received: from mail-vi1eur05on2107.outbound.protection.outlook.com
 ([40.107.21.107]:25056 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nFuAZ-00018p-3O; Fri, 04 Feb 2022 03:42:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nq8GKZ3IDUDq8Uf3Rl0OebcErJOZr1OFYXykedHJsyFLOgkOpW+JWFBx7prWBT5yiWKstAmtyc7TpK+RzmZdpnxOBPjFoiLGJqGDnWX9JmlddzpPZXOeZGHRmlaWOOhcuG4ukoxUEpuSdFDsIV9q2F+b+ySyIySLanklU1qDS2/LjzBrbS02D7LL3npS2tWL3/NgUZY6MRexfzOnqIsPpuDXQXB089AoCVRCjBBgraIA97S+jHZ1KVSz1N1C8SjuZAT1tGD3v8S6r9eLX36r2NC7iD/opvi2sDKHEiBKq0jYEOG9MFJCh705HgIh9wf+a7dXoX1d/8w7JR2ft27xOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kUy1533BSsEIxBGmHcLsOpJpr4Sb7hShgoi+liON75w=;
 b=oAHEM6TVsnojEhV7qZoFi/10+uijnje+tth7pEs4SxshV2rd36zYjowMGOVDgRCIZRZw9cWreWHtymxcffdZMrx5nIsEdb5172cE+ZgIdL3xoTU/0E+p0XvfiekFtoJICPeFsINOANHHAnoGFlUvmwcqvQ1fpzyTk18izfyKdNA7bXUT/gYDqYrl8h36mezwk0+VG5+qRnWFMofGieXKaBYHEhBOaK1SMUGDR4Lh9fx3aA3bldR7JlUrysdEqhwiAnCtgYFKR2jzN5uWSy2KXtVh2B7mLW5C6DHI9AprluLrTWAd0uVhCeWVQs9tu1yxawdwsoH6Hb2zYa2cDbPqRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kUy1533BSsEIxBGmHcLsOpJpr4Sb7hShgoi+liON75w=;
 b=EeNnchZ9vfFluF5Gfi9Oou0lCJyBe+VDof7Nbx+JQt3P3CRjXx4v+yG//BVa11Pk6cn/PTjM8jCA+oPiZkq9vh4UeWKGcjoKUGWtncU6QipOl8gnYh0vT+lnaBWxIvPbpEoCgFutn7RIZeze94OS1F18r/7cedlTwd/l2aAS+kU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by PAXPR08MB7092.eurprd08.prod.outlook.com (2603:10a6:102:204::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 4 Feb
 2022 08:42:09 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.4930.022; Fri, 4 Feb 2022
 08:42:09 +0000
Message-ID: <3d36bcdf-edee-6d6a-ff8e-280ffe3cb005@virtuozzo.com>
Date: Fri, 4 Feb 2022 11:42:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 3/4] iotests/mirror-top-perms: switch to AQMP
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Hanna Reitz <hreitz@redhat.com>
References: <20220203022405.1336635-1-jsnow@redhat.com>
 <20220203022405.1336635-4-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20220203022405.1336635-4-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0215.eurprd06.prod.outlook.com
 (2603:10a6:20b:45e::22) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7747f94b-2d8e-4d42-8898-08d9e7ba3b57
X-MS-TrafficTypeDiagnostic: PAXPR08MB7092:EE_
X-Microsoft-Antispam-PRVS: <PAXPR08MB7092C2A9BC81EADBC32E2A56C1299@PAXPR08MB7092.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FZDKfzCC7sABfSLMn3E6bVHnE17F8r2AUEU+FLCGiSDC2Mx+e+DExoDL8i2YNWzZF2yPuIhZ/Uwy1hKuoerW91Vzje7TaIncUvx+AfNfM6hC24O4RpoHYwLN5YqyBY2m71xvr+zxXH+vON9F+kE1m44ykaLjxmdjwLlmCYTci6Yu3x5YRG94DifXXNoFtrKTQEGvU/ZeaHI7LbA0OIp4v4yaBBj/59QHs7NT3jikEodQUGT3W5k0PTyGgGAPuG9QDn9D9jW6ng3LLx8mftV5NI7ScPgUgPzOWEfUhSTKMBOBZotbz5ohMYR67tTvuS3v0U6kILo3EK8E8ksB2gyy9PdmOmmh/Ui/wqYHFCiyQ4ApiksW20M4a3Xq8hHSeCMxckMoudHYJSAquH+yw+r01z4f0Pb/8lle98gOa3zp+5HEeJn+aLG+6qWDs7UZl4IMyZEHxllMM4YEY5///gVuSs6O3Rh8rgYvmPqBaWnQJ+/kOyriDcSc5hczgD6XDjYbGpE6ZFJxlRAmOU9yenXL9amuutFuVvOwevd+3E8DaCV5Xwnh+IRg21VxlMNhjtp918quQVIE21Ws2Lmn9fLQNziexp3qaF7+iTEkRE7+FClzBeTmZGSoBnsT2JgcJeWB7MLDL+87lpW3fQctcjyJHieMC99/Ub6TAyyhTYQqbbWicpG2bTjiCTsBTQSx7pohdoIwiaVZuw3ofz37PkJGjROatEBQuwsR2C4nQRk99vP2d8gHmKBdd6bZ9TPdccc0q9C858sVWeuTyCKhH9br2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(2616005)(31696002)(6506007)(6512007)(186003)(508600001)(54906003)(26005)(86362001)(52116002)(8676002)(8936002)(66476007)(2906002)(83380400001)(316002)(38350700002)(38100700002)(66556008)(5660300002)(6486002)(66946007)(31686004)(4326008)(4744005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVpjVU5aeXNtVGMvWDBxRExLQXoyOUxBbFJGRjdnNS9NN2NGa2ZRSjQ1OEU0?=
 =?utf-8?B?YTB5Q3AxYnY0bnFlMUV0QUZMOHVHTGZ0OU5OYUtBT0pXWWFTeG02Y1U0UENI?=
 =?utf-8?B?SllDWFFJSXdiSU5NdHpYR3V2SlROckZ2QTU5QjVwbkdlemc2a2ZxQWJYTDRi?=
 =?utf-8?B?d2ltMVpSU3prMmN2clptUTNJMDFzRmlQY1BINS8zTmVIM08zMU1DbDUxQmE4?=
 =?utf-8?B?Q3Y1VlFSalVSdE1JeHMxMHUzQ1RUVWszMlRDTXhPaWdkanJxajFITHYxL3pJ?=
 =?utf-8?B?RFplZktxREZUSFBBREk2YzhGZmFBTmIzSlZrclN1cGl0U3FWVEtGYVhLeVlT?=
 =?utf-8?B?Rmo4YVFrY2EyVWtGWjlGVUlueVp2RDJ4VWp0eFdJVnZtODkwZ1JNWnlHZ2U3?=
 =?utf-8?B?RFhVUlVFd3Y0bWVhUUFWYm4xdks3V2ZGTmFjdFJRcUhJQVY4Yk53WVZ2YXQ1?=
 =?utf-8?B?cVBLTmRXT2NKNGxGMHBJbk45U0pQR2dZWDFHa2F3Z0tydXpkT3FvbG1KSDhh?=
 =?utf-8?B?aXpFRCtFMjgxTHpUVXIvQ1lRZ1NmT2Iyc0pwREZNdWdWcmlEOGw3ckp0OElx?=
 =?utf-8?B?Nk5ON1BpcHNjVWxlL3U1UFBjcW1RRzhiNWphRDFUbjZ0aUwvaFNidHNEeVRK?=
 =?utf-8?B?Z2tDUlFyRjhiczBGU1pTM0NCaDBuU3FvQ3VqOFZBYndvOTBwdGgxWHcwckdR?=
 =?utf-8?B?dWtaVTVOYklrWUF5cklvOTNXN1VqdEhtRDRBTXlpL0VOR1BzVWM1OHhvMk5r?=
 =?utf-8?B?eGJmMWVJUUJJSitHT29NM3Z6ZHFrSmlibkpsMCs3MXdoZTBBcXBaTnhBTEVr?=
 =?utf-8?B?SnVmN3pvU3duSnhVME15TEhwaEtKVWRXajFLVTdLS2RDZ1Q4eUFZYjBFNE5P?=
 =?utf-8?B?UGpaeVhOaFBQNTNieWJ5eDhjVGFYZHp6QWR4YjNFeWsvN0k3MzBwbTQyVng0?=
 =?utf-8?B?Z3pzcEJhNWVhcThqVXlPZk91ZmdTR3RoVWcrTU9vU2dSd1kzYXYrQnpHdzlF?=
 =?utf-8?B?d2RlcThiSXFJZUVTMDZvWTVNVExHNnVrN3BpQXZZTEZMT1N4blpqZmpjM3VN?=
 =?utf-8?B?ZmIxRE1zTjJWQkVTUnNFUFdZS3N4MnBMdmVqaTdrY05YNGJVWW9hUUhsUkUz?=
 =?utf-8?B?TmdUbmlxR2Y0dmZYbzdWVlF4VHppQ2JKYnZ3R0NWNjZEQWRQQjhXNkRXaWEv?=
 =?utf-8?B?Ujl4SjFaYkV6NXgzRjd2eXFsK2g1MTcrUkNTVzJ4dmtqNkJSdnhtVW9qSFg1?=
 =?utf-8?B?NUMwWHpCb2VnWDVzODdmSmZ3TFQzS25adzBVQkFqMXpxVm5hQTdWblJpYzV4?=
 =?utf-8?B?R0ErTnYwbHc2dnFTY201SGJCWXdVSzYvVnlINHVGUXdiUVE0SjA0SWxCNG1K?=
 =?utf-8?B?azFzWVFNTUUxTEZiTG1WR3hmTUw5Nks1UUpRSmtIbEozc0NwT1FGRUo0aXhY?=
 =?utf-8?B?ZU1yY3hheno1dzRkRkhHSVhMQzJobUd1SEFZSUkzZFZTL0Q4TkFUaUQ5MHhI?=
 =?utf-8?B?bGJVN3FHbEhkVk5sRFkrVEJJYzhJZEFTQ1ZseFR0eHFJdWI0UHV4c28xTGNj?=
 =?utf-8?B?STg0cXZyelJ5OHJtTFljRUltcTRxWnZ3b2VrSGk2ZnJqOHE1Q0syMVdONDlQ?=
 =?utf-8?B?NDRQZ0pGYmVzbHNEekkrYk9ORXFIemU4ZHFoNkxZYmpIVitTS0w3a0puN1BL?=
 =?utf-8?B?OUhnamRrVDJNYllCRVk3QUljdXozTTMvbEpTc0FVZm9NWmJBV2hPM2ZwM0Iw?=
 =?utf-8?B?V3c3aTBrMTc4TUFIcnNNV1ZVMXJvY2N0cUZXYllnejVUV3QyMG0xdE1TckUv?=
 =?utf-8?B?eTRIeDE2L0IxMGZicWdOOEd3RzFCQXBoZzhlNzdKeDViS2FBRW0zTmQ2Vm04?=
 =?utf-8?B?OVdLbGhVVmJzb1hVSFptRDkvUW1JSnV2bEJ5NTB3TEJua25oMmVOOFF6Ymli?=
 =?utf-8?B?M3dtVzVjS0djd1UvY0x6WWZOWFpRYnlVV3AwUkRwb0s2OVlVK2pKS293ZWpz?=
 =?utf-8?B?eC9HS2RxVmhndUc5THU3Zlc2aDg3RHNRRGZxbHhWTFhLRjN0RVV0a0xoRXJN?=
 =?utf-8?B?Sklmcm85VHBOQjhnTGNMdDU2VDdTSjJlY2N4TzhTYmRmNm1pTVNKTnhTanlv?=
 =?utf-8?B?bTBGQVR6ZnBwYkZPSW92dXR6azZ0Umx0ME9wSDlDaTB1aGhKUUVQK0sveGZn?=
 =?utf-8?B?L1RtbG52SUNjR2ZFV3UxZXJqZXNORUtCbFpKRlQ0QmJwTlZwcjA3a1dxY2RT?=
 =?utf-8?Q?jAeXLMvnku9YWFZtFVWmpNk2/dPvndqj/1HbvBh4/c=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7747f94b-2d8e-4d42-8898-08d9e7ba3b57
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 08:42:09.8286 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wKcL3H06g2DNLoJcwNVYueMQbCAddvZCJx25/yJhjIJsxe3PvOQWG/1RyhnmgBTeM7LbodQssMPZDRd2m4+5kPdwk2X46rJ6h7wKOZt7ot4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7092
Received-SPF: pass client-ip=40.107.21.107;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

03.02.2022 05:24, John Snow wrote:
> We don't have to maintain compatibility with both QMP libraries anymore,
> so we can just remove the old exception. While we're here, take
> advantage of the extra fields present in the VMLaunchFailure exception
> that machine.py now raises.
> 
> (Note: I'm leaving the logging suppression here unchanged. I had
> suggested previously we use filters to scrub the PID out of the logging
> information so it could just be diffed as part of the iotest output, but
> that meant*always*  scrubbing PID from logger output, which defeated the
> point of even offering that information in the output to begin with.
> 
> Ultimately, I decided it's fine to just suppress the logger temporarily.)
> 
> Signed-off-by: John Snow<jsnow@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8190B4BFE3D
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 17:13:47 +0100 (CET)
Received: from localhost ([::1]:54654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMXnO-0003BP-J6
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 11:13:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nMWXy-00042V-2d; Tue, 22 Feb 2022 09:53:48 -0500
Received: from [2a01:111:f400:fe07::724] (port=3867
 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nMWXt-0007li-Oq; Tue, 22 Feb 2022 09:53:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J0wzRa3Ubm+m935fweOGTCgvc6ZfNjUHyurZqhlNsO92f9S0GoM0iVZfg+QrXXp+CigjNZdY6EigOOduU7V4FNuqHDCf2jkRTvV9/OiGCA2/GZzfBQqKah0GL0tGSbGoac73X5XPFJpOieX+Cc1QOrmyvSH+enO5n4mPqXWXoMgSarQgIkM30kTA/BWRlU2aqzOtyWlGhmnfREuMToPfTmqTJslsbJENx9Q3jwMZWx+ZhAsLucI+KvalbaiTUJ+yvu9nxICIKsS+s1gkPW8l1AEFwa1LGgprcA/clkh93sKMK8lXpCsOOwdZTzXEG1D2HrxWpLNQG6nKnfF+PfozHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=az0phfr68F22zGFCUT50NnjtdGjx+KKjUeFq1SfDt4M=;
 b=IBVdKWg60vDwo5LeGcZ25Yc32v+HShxF/y1W1Ad2yw3g3l1+N6yfgkA+fqhS+1MKLlesf7GujADBy6tik6QXWDwrh/JK1gyxQH5erUzzx2ZTWfesFMMdxMGXHOQ+RSoSewioFfMaZ9xkcIbvMgHrjdXc4CR8XLEfoFPdrpfGkVltp/Q/56CXLaSW3sKw/pSFW6PcQ9/y78AxThh78jBVV0GSef8zzpr86bc4j7wD0VGVNlM7tS9JGi7hM9yvKdrFdWfihSMEMV6rBxpEE6jH2BgA8on8d+KixdQEAd5dueOls+L6ORWhESLn+vgZApoSieKGR+q+6LLY2AW8JiJDkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=az0phfr68F22zGFCUT50NnjtdGjx+KKjUeFq1SfDt4M=;
 b=IP+9N4vUOzI0G5MwFDZ/fmPPMsR/k7zEc5I+5+yLcsV1uT17dYRxoL2fgLc4kIQXpxgQ9CHcWxAXpzepcmDnn5OAtJvpHEo96FCkBgirLUSBneHl/QfBCGzj+0fAHNiW7iq2p4R/oHDYoA8MVbyyEOU+kxY44iYktzMNgyCq77c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB9PR08MB6521.eurprd08.prod.outlook.com (2603:10a6:10:254::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Tue, 22 Feb
 2022 14:53:29 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.021; Tue, 22 Feb 2022
 14:53:29 +0000
Message-ID: <8ff376bf-251d-f315-e4a7-dbfb5d7b070b@virtuozzo.com>
Date: Tue, 22 Feb 2022 17:53:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] iotests: Write test output to TEST_DIR
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20220221172909.762858-1-hreitz@redhat.com>
 <4be7a117-3928-5366-52ef-58eaefad528e@virtuozzo.com>
 <0467c1a2-222c-0382-88da-3872a99231bb@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <0467c1a2-222c-0382-88da-3872a99231bb@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR07CA0029.eurprd07.prod.outlook.com
 (2603:10a6:20b:46c::25) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b3e5963-5811-4428-aab6-08d9f6131665
X-MS-TrafficTypeDiagnostic: DB9PR08MB6521:EE_
X-Microsoft-Antispam-PRVS: <DB9PR08MB652111342B4C9A6463A5951BC13B9@DB9PR08MB6521.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0eNBncj2M009IXhsMoXTEdtO/xPApiiHLyFpw8olTAJKVgT3s12r3pKBfcn+jUAA+nO/99XJQe7q5TpAckKYRqXd6jHIRQpmtZ0xikgpI6PdqfXiK9+6YSjNkEr8opFBcrlh3K9QX1sJDXmxPZ3aBHg/C7kG78W5Vh8zPPZVoduN0hbIvSeGHiSKJWX0N81UKRopepasXZSoW3duC95Qgz6FRuAEn837hn7uZbHViNGRY+b1LaXWloKkcjdII22uftp/w2fhIuCZXi10mMzjm0FWJ3qX13Z4DrDizsOZzTS7z3oIeNs8Tmspq1FDvo1IUfB8IObsn5zZamLOYUPpvg6pivlZVi5tCxlocXLttJXyEkDuwbZuMETot02MvqN3+021P9r83dve8k4iFWih+sDkyEuipV3QwAxNIaM+BYxrO1nPQi7+p3Sqi/isuK0WhBY2N2wZ7AGTDnDaoPCTGv8UMRwkJzalVotdw6mmB9xz0ZVUtaxs1uf39a+GNsKoLBSkOFaafuU5nd9fVpdQ+MSMuGu2IPxM6wWGNnI/uBo6mi/3LRZ4DT4snefPOKes8USM1UxExpZLhrsmNXQPebZhZcVLnY6qHl/kbd4K1YPaxTqv3YLeR148qzD4Hra3FyLjqEhrMz/Zd/EncWx+bQTTfTEZrQVPGBUii/WqeGHpTl5Qpfpr1orAAgCdKylbmAgUqtqqK2f9HZe4dqyg+Es19XchJAFXFFBNvtF8/W1fWshyibrYduN/x7Hor9u83VDlHC2WlTtkq3KxsYXr47NeWn8UCGSfdO/Jzi8xzhRemZqYvlAaYxdCFe4a3M4UMLkpg1wj+0vNLelmY4GAXKt/FrqDVkWJtnm1hdXGxQQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(2616005)(186003)(508600001)(38350700002)(26005)(38100700002)(8936002)(2906002)(6486002)(966005)(86362001)(31696002)(6506007)(6512007)(6666004)(53546011)(31686004)(316002)(83380400001)(36756003)(8676002)(54906003)(4326008)(66946007)(66556008)(66476007)(52116002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q01SSzNlU0RhNm5kbkVHeGw3a2xYbnpHNVk3eVRRV0UyYnlzZ0E5ODRrWVI0?=
 =?utf-8?B?V3FXV2RjVGNuT0hIcmRjTFE0SERKTUhIQXhUT1Y0bzhEd3lhNjYrYW1GNXRl?=
 =?utf-8?B?QS9ON1d2NGhKNGpoYnJUV3dzdGdzbGhvNUpqbE9FcHE3V3VoMG9aNEltcnNZ?=
 =?utf-8?B?VzVGeFBOZ21GRVZralhiQzRxYmNnM3VKSHRWT1pnOXpjai9COGxrOWJSN1ND?=
 =?utf-8?B?cS9idEkyeGJEY1FZc0JnVVBoaGs0R1NUWUpEU1hFdks3T3VOdTR5NjZML3ZS?=
 =?utf-8?B?ckRLN1ZoYlNSZGMyM2FEcDhtcUNXMTVlSTIzd1AyczViWXhhNFVuME5sTnlP?=
 =?utf-8?B?VDdvdnFJZWd3aTkwdFVSdUt0SXJXWnN6Yk5qK2lFdlIySFBHQXpWL3B5L2hi?=
 =?utf-8?B?aStiR0orNWhLZm1rdndndm1sZURPeDlVTm13VjJBV29sTE02MXJ2SStVRkdi?=
 =?utf-8?B?QTRnM1RJcytKaG1zSlppQUd0blh2dmNZNk5Mck1YWmR0TWw4Y1hzSlhRRXRD?=
 =?utf-8?B?UnQxNTJYZVp0LzhZNm9yeHA3ZzAxS05OYURsQnNKWTdrQk9Rak1kNXp3NkFp?=
 =?utf-8?B?NW5sNE5qQTZibCtBdTBOM2RWVEFEMlFKMmdNWFcxeDM4a3NaenZ0bldKUU5O?=
 =?utf-8?B?S2s5U3ByeEFVUnRMQS91Mjk2aFpNcjlkVklvTXIzS2hFeEU5Zms2UUM0Mmhn?=
 =?utf-8?B?YzRLVTUyNXU3bGlnTHhnWVRVQUlYTkJaSlJScUxWdGEzRXBNdlluMG91aW5N?=
 =?utf-8?B?QnQrQ2J3QWNXTjl1L2ZDb09DaldZbFcrdnNjcWtBdE1iRGtqa2pqbFBWQlBw?=
 =?utf-8?B?TS9IZTlWNmhhWThiSkZFMm82M0s0M25UL1oyUGdWNEFGZHFVZnduY25yYVFR?=
 =?utf-8?B?dHBMMTVFMnZTRnVIS3Vzbng5YWlrbGttbW5iOTBFc0VRMGo1NUcyREdTL1gw?=
 =?utf-8?B?ZUU5cEhqQjkxWlJ5M3NOeCtudnY3WEZHUXZqRWhrZnhQMjROay9zOW9sbm5I?=
 =?utf-8?B?YWllamNZY2NxYWNpaER4dFNQM2pZemVUcEZNVVJYdVo0REQyZndCbG5vTmJK?=
 =?utf-8?B?Z1VKQ1htU2lsSC9KbzVaaTFpeWxlakZmV3V2aEJuRmtDOGNjTVZtTDdvc0lP?=
 =?utf-8?B?WG5Tb05NNEdrU2doV1YvNlNkVzZhanl6ZWhSN1hRUEpIcFpJL1dhYTFzZFQz?=
 =?utf-8?B?TW85TGJJZXBqSzFiUTltVzcvM0s5aUl1SitSMG9NYlBid3VPZ1gxeUtQekYr?=
 =?utf-8?B?L3htRDhWQ3l6cFo3TldHUU8zR3pXMjNvdWh2MUJQaHZUWFM1UDdkNjFxZC9s?=
 =?utf-8?B?Ryt0dkVWODUrelRsZkpRYXQrQzRDNzhnRC9zWXBXS0EwUWtCNEx3RTM5bjA4?=
 =?utf-8?B?ZGpqVDRYaHRPeG1wQWJIOUN6QzFmQzFjdG91dllnY04yWVZFYmp6c3JRZTgy?=
 =?utf-8?B?WFVOT01HZnQ5dm9rVXRYMUxSN3VBZzNaM0lTYjg1dVFVZy9xalM0NVo3a2ta?=
 =?utf-8?B?cnFXUGsrb01oYXQrNlFmMWNDUUl3TlpwQUEzOEs2emVLUjYycVdETGJtcDFV?=
 =?utf-8?B?QlYvcUFLSTRxczdFblIrRktVNFZPK0ZwZXFjVmRSMDFNNlpJTWdYUXllN3dG?=
 =?utf-8?B?K3lva3NxQXo4VGRUTkxwMitjeVA3T3ZHRG1PRnBsZkNmbjVtNkV2VEJuS29n?=
 =?utf-8?B?YmRTcjlqcW8zZWFMdFY1LzNVcjVvS3E4WjBVeUxUQ2tPWTZjdFFwK0xkUDVK?=
 =?utf-8?B?YjBXeFZZQXZRVDA4Q082cWcyK0dyNGF1Vll3c3ZjR0dxSXZ5Y0Z5d3ZoRHpw?=
 =?utf-8?B?SkppT1dLSElobFZ4R20vd0VGQk1TZFZUS3k5Y29ES3creVFKQ1RVakdxMW1W?=
 =?utf-8?B?L0w4ckwwSXE1bmFBQjNMQkNNTDFCQWNkY0FlWDNHbnpNVStuN2hPNVM1YTRV?=
 =?utf-8?B?bkMyc29md1EvV05lQVBWeS9RYlFaV05yeDBoWWxmU21RY2hCNDg1T2FoSXdm?=
 =?utf-8?B?VmtSajQzd0VsSzRuek5IbFd5a0xYYmRYb1d5VlZvY2J5YXBrajdUZUlYUDJB?=
 =?utf-8?B?bGp1ZlNhUUNzYTJzNWRYVXJCVzhMc21NMGtPUjE4L2Jwa21lVWZjdEdwL1F6?=
 =?utf-8?B?ZFhCTVRtYnNFVVdXNUt5ck43dThZR0xSTFAvQjYrMkF5WElKaGNyRnJGZzVi?=
 =?utf-8?B?K29RWUpUVlFvcFNvN0Z2L2JIZi9KZ3hsVFdXUTQ0dmVZKy9wQ0N6Tkl3bUhr?=
 =?utf-8?Q?cO7k06H7AA1XyisXFxQ/5ZpWOJLuMB12G/M5+NDJL0=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b3e5963-5811-4428-aab6-08d9f6131665
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 14:53:29.1302 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eHBWh8/mv8tEYenLuEQknVMMapLgCYympbGjNr6z7CG+th5v6XphBwnAPrbylu0g1Lk2s3wsoPTxT08uGUigNuQsX8eV6NanU53cpoIQ5pE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6521
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe07::724
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe07::724;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

22.02.2022 17:44, Hanna Reitz wrote:
> On 22.02.22 15:39, Vladimir Sementsov-Ogievskiy wrote:
>> 21.02.2022 20:29, Hanna Reitz wrote:
>>> Drop the use of OUTPUT_DIR (test/qemu-iotests under the build
>>> directory), and instead write test output files (.out.bad, .notrun, and
>>> .casenotrun) to TEST_DIR.
>>>
>>> With this, the same test can be run concurrently without the separate
>>> instances interfering, because they will need separate TEST_DIRs anyway.
>>> Running the same test separately is useful when running the iotests with
>>> various format/protocol combinations in parallel, or when you just want
>>> to aggressively exercise a single test (e.g. when it fails only
>>> sporadically).
>>>
>>> Putting this output into TEST_DIR means that it will stick around for
>>> inspection after the test run is done (though running the same test in
>>> the same TEST_DIR will overwrite it, just as it used to be); but given
>>> that TEST_DIR is a scratch directory, it should be clear that users can
>>> delete all of its content at any point.  (And if TEST_DIR is on tmpfs,
>>> it will just disappear on shutdown.)  Contrarily, alternative approaches
>>> that would put these output files into OUTPUT_DIR with some prefix to
>>> differentiate between separate test runs might easily lead to cluttering
>>> OUTPUT_DIR.
>>>
>>> (This change means OUTPUT_DIR is no longer written to by the iotests, so
>>> we can drop its usage altogether.)
>>>
>>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>>> ---
>>> v1: https://lists.nongnu.org/archive/html/qemu-block/2022-02/msg00675.html
>>>
>>> v2:
>>> - Delete .casenotrun before running a test: Writes to this file only
>>>    append data, so if we do not delete it before a test run, it may still
>>>    contain stale data from a previous run
>>> - While at it, we might as well delete .notrun, because before this
>>>    patch, all of .out.bad, .notrun, and .casenotrun are deleted. (Really
>>>    no need to delete .out.bad, though, given it is immediately
>>>    overwritten after where we delete .notrun and .casenotrun.)
>>> ---
>>>   tests/qemu-iotests/common.rc     |  6 +++---
>>>   tests/qemu-iotests/iotests.py    |  5 ++---
>>>   tests/qemu-iotests/testenv.py    |  5 +----
>>>   tests/qemu-iotests/testrunner.py | 15 +++++++++------
>>>   4 files changed, 15 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
>>> index 9885030b43..5bde2415dc 100644
>>> --- a/tests/qemu-iotests/common.rc
>>> +++ b/tests/qemu-iotests/common.rc
>>> @@ -726,7 +726,7 @@ _img_info()
>>>   #
>>>   _notrun()
>>>   {
>>> -    echo "$*" >"$OUTPUT_DIR/$seq.notrun"
>>> +    echo "$*" >"$TEST_DIR/$seq.notrun"
>>>       echo "$seq not run: $*"
>>>       status=0
>>>       exit
>>> @@ -738,14 +738,14 @@ _notrun()
>>>   #
>>>   _casenotrun()
>>>   {
>>> -    echo "    [case not run] $*" >>"$OUTPUT_DIR/$seq.casenotrun"
>>> +    echo "    [case not run] $*" >>"$TEST_DIR/$seq.casenotrun"
>>>   }
>>>     # just plain bail out
>>>   #
>>>   _fail()
>>>   {
>>> -    echo "$*" | tee -a "$OUTPUT_DIR/$seq.full"
>>> +    echo "$*" | tee -a "$TEST_DIR/$seq.full"
>>>       echo "(see $seq.full for details)"
>>>       status=1
>>>       exit 1
>>> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
>>> index 6ba65eb1ff..1d157d1325 100644
>>> --- a/tests/qemu-iotests/iotests.py
>>> +++ b/tests/qemu-iotests/iotests.py
>>> @@ -84,7 +84,6 @@
>>>     imgfmt = os.environ.get('IMGFMT', 'raw')
>>>   imgproto = os.environ.get('IMGPROTO', 'file')
>>> -output_dir = os.environ.get('OUTPUT_DIR', '.')
>>>     try:
>>>       test_dir = os.environ['TEST_DIR']
>>> @@ -1209,7 +1208,7 @@ def notrun(reason):
>>>       # Each test in qemu-iotests has a number ("seq")
>>>       seq = os.path.basename(sys.argv[0])
>>>   -    with open('%s/%s.notrun' % (output_dir, seq), 'w', encoding='utf-8') \
>>> +    with open('%s/%s.notrun' % (test_dir, seq), 'w', encoding='utf-8') \
>>>               as outfile:
>>>           outfile.write(reason + '\n')
>>>       logger.warning("%s not run: %s", seq, reason)
>>> @@ -1224,7 +1223,7 @@ def case_notrun(reason):
>>>       # Each test in qemu-iotests has a number ("seq")
>>>       seq = os.path.basename(sys.argv[0])
>>>   -    with open('%s/%s.casenotrun' % (output_dir, seq), 'a', encoding='utf-8') \
>>> +    with open('%s/%s.casenotrun' % (test_dir, seq), 'a', encoding='utf-8') \
>>>               as outfile:
>>>           outfile.write('    [case not run] ' + reason + '\n')
>>>   diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
>>> index 0f32897fe8..b11e943c8a 100644
>>> --- a/tests/qemu-iotests/testenv.py
>>> +++ b/tests/qemu-iotests/testenv.py
>>> @@ -66,7 +66,7 @@ class TestEnv(ContextManager['TestEnv']):
>>>       # pylint: disable=too-many-instance-attributes
>>>         env_variables = ['PYTHONPATH', 'TEST_DIR', 'SOCK_DIR', 'SAMPLE_IMG_DIR',
>>> -                     'OUTPUT_DIR', 'PYTHON', 'QEMU_PROG', 'QEMU_IMG_PROG',
>>> +                     'PYTHON', 'QEMU_PROG', 'QEMU_IMG_PROG',
>>>                        'QEMU_IO_PROG', 'QEMU_NBD_PROG', 'QSD_PROG',
>>>                        'QEMU_OPTIONS', 'QEMU_IMG_OPTIONS',
>>>                        'QEMU_IO_OPTIONS', 'QEMU_IO_OPTIONS_NO_FMT',
>>> @@ -106,7 +106,6 @@ def init_directories(self) -> None:
>>>                TEST_DIR
>>>                SOCK_DIR
>>>                SAMPLE_IMG_DIR
>>> -             OUTPUT_DIR
>>>           """
>>>             # Path where qemu goodies live in this source tree.
>>> @@ -134,8 +133,6 @@ def init_directories(self) -> None:
>>> os.path.join(self.source_iotests,
>>> 'sample_images'))
>>>   -        self.output_dir = os.getcwd()  # OUTPUT_DIR
>>> -
>>>       def init_binaries(self) -> None:
>>>           """Init binary path variables:
>>>                PYTHON (for bash tests)
>>> diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
>>> index 0eace147b8..262b13004d 100644
>>> --- a/tests/qemu-iotests/testrunner.py
>>> +++ b/tests/qemu-iotests/testrunner.py
>>> @@ -259,9 +259,6 @@ def do_run_test(self, test: str, mp: bool) -> TestResult:
>>>           """
>>>             f_test = Path(test)
>>> -        f_bad = Path(f_test.name + '.out.bad')
>>> -        f_notrun = Path(f_test.name + '.notrun')
>>> -        f_casenotrun = Path(f_test.name + '.casenotrun')
>>>           f_reference = Path(self.find_reference(test))
>>>             if not f_test.exists():
>>> @@ -276,9 +273,6 @@ def do_run_test(self, test: str, mp: bool) -> TestResult:
>>>                                 description='No qualified output '
>>>                                             f'(expected {f_reference})')
>>>   -        for p in (f_bad, f_notrun, f_casenotrun):
>>> -            silent_unlink(p)
>>> -
>>>           args = [str(f_test.resolve())]
>>>           env = self.env.prepare_subprocess(args)
>>>           if mp:
>>> @@ -288,6 +282,15 @@ def do_run_test(self, test: str, mp: bool) -> TestResult:
>>>                   env[d] = os.path.join(env[d], f_test.name)
>>>                   Path(env[d]).mkdir(parents=True, exist_ok=True)
>>>   +        test_dir = env['TEST_DIR']
>>> +        f_bad = Path(os.path.join(test_dir, f_test.name + '.out.bad'))
>>> +        f_notrun = Path(os.path.join(test_dir, f_test.name + '.notrun'))
>>> +        f_casenotrun = Path(os.path.join(test_dir,
>>> +                                         f_test.name + '.casenotrun'))
>>
>> You don't need os.path.join inside Path(), simple
>>
>>  Path(test_dir, f_test.name + '...')
>>
>> should work.
> 
> Oh, good!
> 
>>> +
>>> +        for p in (f_notrun, f_casenotrun):
>>> +            silent_unlink(p)
>>
>> Why don't you want to remove old f_bad too, like pre-patch?
> 
> Mainly because...
> 
>>> +
>>>           t0 = time.time()
>>>           with f_bad.open('w', encoding="utf-8") as f:
> 
> I found it’d look just a bit silly when we immediately overwrite it here anyway.  But if you prefer to keep the pre-patch list for completeness’ sake, I won’t mind.

Ah, right, we rewrite it immediately, OK for me.

With simplified Path(..) constructors:

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> 
>>>               with subprocess.Popen(args, cwd=str(f_test.parent), env=env,
>>
>>
> 


-- 
Best regards,
Vladimir


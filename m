Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 802E34785AF
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 08:44:23 +0100 (CET)
Received: from localhost ([::1]:35158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1my7ug-0006bm-0u
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 02:44:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1my7qW-00046V-CQ; Fri, 17 Dec 2021 02:40:06 -0500
Received: from [2a01:111:f400:7e1b::713] (port=23392
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1my7qT-0007Ui-A6; Fri, 17 Dec 2021 02:40:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mxePNKjG/1v5WcsN6oxdefLGFXPxxsJo5NWh+kBb0eybw1WVhew9+wmre9StnnTGtpSFsxL5LxAr/hkK5LV/v0pdH15FPLA1/5xF3QYUX3VteSyqwdry7O2HPRvbjNeA2N56eXxQJNXz/U8d5+/NuWYbPZ4vufX5ZenQW7Et+yylK/TGd4YiTP+70uH1uVoEVKm7pAeEFcN2QhpBwI3iHrpN7pCpfJwXL+mOsYHXEb5cdtMegVEXM9uIpPEJGhUIVltTR8UknJemRYvzyBFNCGDbRiatlMD0pZT5Vwe/SN2T5qfKO9AOOcVCH4y155Xih5fP6rUREJqSiF3YiNH60Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CtDuKBBPv2HXlIgT6h5Dk+IMSLLFOd4YpulY7xnJPMo=;
 b=E07l6uLPrixCdA5864QtkI0TDXgiRNnQj5BQsAA98maWqNoUQPnMiBNplytO9qFs8/vLDtAkL/Ni/Jn+X+g9q2xRrD+XofUXMu3+D2NZkDWfLplLbbArNLQALccKvG867BuDyBfNie3tHyjN6pbsh+drs0AmWbGCM/uvdbphDCEwa0qNH1y4ZDlj+Pmm8ottMsq0iA0M6mqYXC7Rca+9160NasqeWXJ3FuI3J3wunBvjzXrkQrcdypF0kbwTbK4Lr2ftmo488yBi6LJ1VUfNAZckW3EFUYNbjpeIUMP5eRptd7gY3Hi40CKTPZkDXF85j8bwIXtSbVEN1ahW+bIKtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtDuKBBPv2HXlIgT6h5Dk+IMSLLFOd4YpulY7xnJPMo=;
 b=NKxfv1F9VYWFGLBeJvqD276IOde8O+59VpmfFrmVJyV7EPLwcoQoebQ/DVySXtIDLUfQWcNWuT2O58FG71X/S8PDtN0gPXTKApoRagWOlurXuH1sXYGOJpLu/cWiQNuvmfTwxs2uhOj0CxPxynx8nAHlPU3pYJwsoq3ejKDRT9s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4514.eurprd08.prod.outlook.com (2603:10a6:208:13a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Fri, 17 Dec
 2021 07:39:57 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 17 Dec 2021
 07:39:57 +0000
Message-ID: <cbf2841c-dbd6-5284-b8a3-06b19b1c9f0a@virtuozzo.com>
Date: Fri, 17 Dec 2021 10:39:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 25/25] python: rename qemu.aqmp to qemu.qmp
Content-Language: en-US
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Eduardo Habkost
 <eduardo@habkost.net>, Daniel Berrange <berrange@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Qemu-block <qemu-block@nongnu.org>
References: <20211215193939.3768033-1-jsnow@redhat.com>
 <20211215193939.3768033-26-jsnow@redhat.com>
 <59b70dd8-cae7-4106-7ba3-ba0b6f74897d@virtuozzo.com>
 <CAFn=p-apQ=rocDVeAUCu_JJVAPV90H3uRemWv0ndEwOmKq6nMA@mail.gmail.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <CAFn=p-apQ=rocDVeAUCu_JJVAPV90H3uRemWv0ndEwOmKq6nMA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0109.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::24) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 AS8PR04CA0109.eurprd04.prod.outlook.com (2603:10a6:20b:31e::24) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Fri, 17 Dec 2021 07:39:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e99cabae-1825-48d3-483f-08d9c1306c3a
X-MS-TrafficTypeDiagnostic: AM0PR08MB4514:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB45146B58F477CAAF5C1A7D43C1789@AM0PR08MB4514.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fR7uNuWr7+Bik23rf2ooJpVZwwfVd6gSVERZNY0Seod2p1mtWzvHc3z4DFktlkXgCC4QePzcV9d9j4//tzXqC6SqvROwPi8Xmt/2oPHJRTMAOw4obizhOP9XhBkeMYF4/rLnw8EAbaEDvoEoXvQzz1g0uMSIng3oIZ5TDg/4c4eECqTbUOZLEyGJNfhL0uXpGjIiNMJuJRX8oIp136aRGcOdTdOMyI6wEmJDliW4N6mPfmzSK+3I7HruWbMkYI0PRXrQqQOh8ctxIA71xX86Gb4oRgnUQ5GV3fEyBZanDUA+GVkkyecu0UpuWFxD4CytYgxLybel5175Ln+L7PM2uBfIFllmVc9q/lt57jSWXQOk2NSHWk/yx4JRUaVvaSPXUPz7rHOb7Q1C89K7TRNcP0Cp7c9+7OPmZaqxX2e+OibzRRTowUTniRTS5pK6FRaC9EE/FWUi9qH6VQP/dJpBMzHCv7xaDgAxdkQI147M1iXjPgrDWJzTa3msrspjL8m9ko1ek2O9XrumNCWR+nEF2IEPWe9rX5ZfJy3fUpgHO/9BuVDLMPCv9QkNkdMocNhLoz2v0DE1pxqO+Lp8Wrvz6ExRGMqFee1gNRcwmFiKitmyFHXhuXtICRYfqfYid3/WSJghaQlQuG4gTBV3zwYM9wpj1J5M1u6EgYypfIyu/qnv59yDSy15X3r7xx5oc6e740t6UlE4JUOFQWAoIYFyy7GxXhZVJT6BUClFOzAg+nt4T7VK/oaMBQm16vPhIXNbAoSBQ73sZD2pc7Y9BlH5rw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(16576012)(956004)(8936002)(2906002)(508600001)(54906003)(26005)(86362001)(31686004)(52116002)(2616005)(186003)(316002)(8676002)(4326008)(7416002)(31696002)(38100700002)(6486002)(5660300002)(36756003)(66476007)(66556008)(66946007)(6916009)(38350700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rnk1N0trSEZTS1lRYUM3Y2doSHd6MDdJREV2SFJ6VHE5dTZQeXI4VWpwODR4?=
 =?utf-8?B?K0ZGaUFJNDZkS2kwMGxsblR1Zng0c3E2czA0OVE4R2V2Ni9WRUpHUXhLUFZz?=
 =?utf-8?B?ZE1ETWpkS3ZnaXRjNkwwaEk3ZWo2cWUyZEF0a0V3aWpBZVBCNHVtU3cwTytz?=
 =?utf-8?B?QUx3UzcrUlZUTzd5MUpzcittS0FYOTU0ZDhjUEdNUHFGZnBDdmJIWUZTMkQ0?=
 =?utf-8?B?ZHBCN0FMb3dQQ0UrdzgxWVlTdTMwcmNzYkJkb3lJVEI1WkhuOWFHZTBQMGtC?=
 =?utf-8?B?S0I2R1RlWGxPVjk4cFJPeVJ1b1BNSC94TWs3WDZLUUVjUklqVmJqZkRJalJK?=
 =?utf-8?B?TmRXc21pTlpCa24rbjJWWjdMZkU5RTNyeHR4QkNkNVM4UFJqYVBpcGhSdUE0?=
 =?utf-8?B?enRzTlBST21ISlkyM29Zb1R2Rm5JaFhQY09Gc3NTMXhXcmIwemhDV1gvcHZq?=
 =?utf-8?B?TzZodEpkZzB3cVZ6SjEzSkF2aW9PWEJBelF5SmRHb2Q2T0tuVHMvK3o2RzFm?=
 =?utf-8?B?U0FlSTIzY3JGZHoxb1VyU3NiVDhZK1RMNHh2dzJRd3dWdVRZalh6RHMwcHE5?=
 =?utf-8?B?RDZRaDhOUzFVbWxiR2RqaDNRWWFuQnJaSFo4UzFiRmh3QzQxWDVEWFYvaTNE?=
 =?utf-8?B?Y2JMU1VBZ2thRzZES3N5QWJaT1lZbFJWSXZDY2d5SGtEN0Vvc1RIa2dXTTJr?=
 =?utf-8?B?WXlnNHNSbllyRWtocU52aWpDbDRvczBNOVQ4dGNMQVVyVUN6ejJDd1FqNkgx?=
 =?utf-8?B?V20wVHJyZ2tPUVFoRUVkTm1WMGdoUnpvOVBIb21TOGZvV0p3WG0zMUticm9y?=
 =?utf-8?B?bXA0TzgzNEg4ZzhzajIrL3NyTjdHbFlLTDEydEFTMm1iL0JrQjh2NG1teU9p?=
 =?utf-8?B?K1UyVm9MckRnR0pIem9IVEg2MUY0aHYxaFRSYysydXJnKzBVeHJwdzRWSlZh?=
 =?utf-8?B?NG1ETXZIUHpXdVJTKzVCZUhnQzMzaEZLYTltUmx6dnRHOUI2ODQrdkRlRzZV?=
 =?utf-8?B?ZlZOOExtemNSMjlRejUxZEFYLytJaXJsZFFJNllWQ1h1V3FNNzExUmEvRmhh?=
 =?utf-8?B?ZHFnUWpkUFE1R25LdDUxTllPbjNObTc0ZUZOc1JmbWNRNUliQTJZUUxNSEJR?=
 =?utf-8?B?SnlXdFIyUkNNWmhJakxuSVQ1T1I0WkhGbHorMzZWU21GVU4zcGU4bWhqd0sv?=
 =?utf-8?B?cWpGSmNhWW14QVNMTHVzYVBVOHlRT3E3VWwwZzRLTWk4dEFFbGRWN3pmenZJ?=
 =?utf-8?B?M0EzanRNNnhhMGg3MkV4SjR1aUZ4UkJjaVVvSjFHV3U4UmJDdXdQOG9ieGdS?=
 =?utf-8?B?SXE1Z2JiUE1GajNibUNJV2k2Z0RBTWFvT3RKd0lnV2NvdUdFMzQ2MjNHeFgx?=
 =?utf-8?B?ZTZDVlFaYm1GZThYOTg1MzNRckMvc3BFSU9UOGhBS3ltTUtWdW1OOUk0OXZB?=
 =?utf-8?B?Sm5YRGsxTmdsRVpKT294UGdxeCtZbG9na0w0M3MvZVRIby81SEJURGRxenFP?=
 =?utf-8?B?ZjE3bVlNMEF2Y1U4NWpjb3JQZjV6M3FIelVlcjdyeU5UZnFLME9LaHVJNHRi?=
 =?utf-8?B?UldqWGlxMWI3OXN1bUcyT3B5OUdOOVV2Qlh5SDlpcG9kYW1kZFllQmIzbkdM?=
 =?utf-8?B?S3dWamtLeU1HQ3ZFNGtpOE1vbEZUT3dhZmsrU2kyN2I0Mm9RaDVkTmZ3ZmM4?=
 =?utf-8?B?VUNpNGVESmc3SWZwZ3k0OXRTZ0duVTNjWVpSSVAweiswdi9kYzBRRDNxeWhn?=
 =?utf-8?B?UENNMVo5cW5iV2VKS1RJK0VyL05OYm42dEg0c3I3eDcrSUVBaW1SdTNxUytt?=
 =?utf-8?B?ZUlpeGl4QjJwSWRwYys3MWt3R25zdHBlMnM1UnF5VnJtMDBxbm0wbjNQYkoy?=
 =?utf-8?B?ejB5QjZCTk5YM0JhSEhYNXdDRkRZeXFVSmV6UXVYRjdYRGVqdjFUTHBHRUdS?=
 =?utf-8?B?bUM5dnczSERwY3lFd29yUkV1emNnckQrMGxjbXNaVHFyMVpJYTlmMldTSnpx?=
 =?utf-8?B?S3p0TEFUT2Fxc2w4di95emxyZHdZWEFIOUNkL3dIcloyUXVQbUdIVS84YmJx?=
 =?utf-8?B?clJGeFVuaXNNNGJTQm9oSUxGZk5pNkFZaE9abVI5YlRoNFhoRUFzMzZ2T0k5?=
 =?utf-8?B?ZEprc0JIU0VnRFkrcFdPVzA5MTJ6SGg4OW9JNTZITk5xQm5TancyK3Y0VFN2?=
 =?utf-8?B?dFRyQXVXdTBCTFhBSzJjbEYvaGVsWWlpV3d2VXZVUlZpSFp6WTdzL3pjQnU0?=
 =?utf-8?Q?BdWGlo3vlugSxleqPGKPBVOmvgzACBjyMJuL3b1Jbs=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e99cabae-1825-48d3-483f-08d9c1306c3a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2021 07:39:56.9976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yw9gdRZiZ28pgrKNvWsJ+kNDjrxgf/l0CuO+LJWd+X6oSPnS5CUteYgEFELBMDc3FRYrz4D0q+kWEEIwZidIKEJTts22YtpWXHWwssz3UY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4514
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1b::713
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1b::713;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.716, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
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

17.12.2021 00:10, John Snow wrote:
> 
> 
> On Thu, Dec 16, 2021 at 6:41 AM Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com <mailto:vsementsov@virtuozzo.com>> wrote:
> 
>     15.12.2021 22:39, John Snow wrote:
>      > Now that we are fully switched over to the new QMP library, move it back
>      > over the old namespace. This is being done primarily so that we may
>      > upload this package simply as "qemu.qmp" without introducing confusion
>      > over whether or not "aqmp" is a new protocol or not.
>      >
>      > The trade-off is increased confusion inside the QEMU developer
>      > tree. Sorry!
>      >
>      > Signed-off-by: John Snow<jsnow@redhat.com <mailto:jsnow@redhat.com>>
> 
>     Great job!
> 
>     I looked thorough the patch, changes looks correct. Simply rename every aqmp / AQMP occurrence.. But:
> 
> 
>     [root@kvm review]# git grep -i aqmp
>     python/qemu/qmp/aqmp_tui.py:AQMP TUI
>     python/qemu/qmp/aqmp_tui.py:AQMP TUI is an asynchronous interface built on top the of the AQMP library.
>     python/qemu/qmp/aqmp_tui.py:Example Usage: aqmp-tui <SOCKET | TCP IP:PORT>
>     python/qemu/qmp/aqmp_tui.py:Full Usage: aqmp-tui --help
>     python/qemu/qmp/aqmp_tui.py:    Implements the AQMP TUI.
>     python/qemu/qmp/aqmp_tui.py:    parser = argparse.ArgumentParser(description='AQMP TUI')
>     python/qemu/qmp/legacy.py:        self._aqmp = QMPClient(nickname)
>     python/qemu/qmp/legacy.py:        if self._aqmp.greeting is not None:
>     python/qemu/qmp/legacy.py:            return self._aqmp.greeting._asdict()
>     python/qemu/qmp/legacy.py:        self._aqmp.await_greeting = negotiate
>     python/qemu/qmp/legacy.py:        self._aqmp.negotiate = negotiate
>     python/qemu/qmp/legacy.py:            self._aqmp.connect(self._address)
>     python/qemu/qmp/legacy.py:        self._aqmp.await_greeting = True
>     python/qemu/qmp/legacy.py:        self._aqmp.negotiate = True
>     python/qemu/qmp/legacy.py:            self._aqmp.accept(self._address),
>     python/qemu/qmp/legacy.py:                self._aqmp._raw(qmp_cmd, assign_id=False),
>     python/qemu/qmp/legacy.py:            self._aqmp.execute(cmd, kwds),
>     python/qemu/qmp/legacy.py:            if self._aqmp.events.empty():
>     python/qemu/qmp/legacy.py:                self._aqmp.events.get(),
>     python/qemu/qmp/legacy.py:        events = [dict(x) for x in self._aqmp.events.clear()]
>     python/qemu/qmp/legacy.py:        self._aqmp.events.clear()
>     python/qemu/qmp/legacy.py:            self._aqmp.disconnect()
>     python/qemu/qmp/legacy.py:        self._aqmp.send_fd_scm(fd)
>     python/qemu/qmp/legacy.py:        if self._aqmp.runstate == Runstate.IDLE:
>     python/setup.cfg:# AQMP TUI dependencies
>     python/setup.cfg:    aqmp-tui = qemu.qmp.aqmp_tui:main [tui]
>     python/setup.cfg:[mypy-qemu.qmp.aqmp_tui]
> 
>     [root@kvm review]# git ls-tree -r --name-only HEAD | grep -i aqmp
>     python/qemu/qmp/aqmp_tui.py
> 
> 
>     I think, this all should be renamed too
> 
> 
> For aqmp_tui.py, sure. The new TUI isn't 100% ready to replace qmp-shell yet, so I wasn't entirely certain what to name it... qmp-tui?
> 
> *shrugs*.

I don't remember what tui is abbreviating) qmp-tui is OK, and it may be renamed to qmp-shell when it is ready to replace it..

> 
> for legacy.py, it's just an internal variable name and I wasn't sure it was worth the churn just to change a private variable. I could still do it if you feel strongly about it.
> 

I'd rename everything.


-- 
Best regards,
Vladimir


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 046934B09C1
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 10:42:31 +0100 (CET)
Received: from localhost ([::1]:50270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI5y8-0002XY-Nl
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 04:42:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nI5vh-0001gH-P1
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 04:39:59 -0500
Received: from [2a01:111:f400:fe0d::717] (port=54756
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nI5ve-0004b0-8h
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 04:39:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V2n75nw9MV5oCd4bDyhD33m1SYvlxp3K7UeM40GhQdw3+BIGLbCnbNGQkDVZTQ2macMsR/VHY6E+1RE5CIozFeSClnXqnKkUmps1n8lGf71prVAiZ7/bI/nUUeSEqZtdhI9/DLZ18Xg5dQimxKNXoVA/OQtCar1vox2sLW9izEdn4CI31S7iNTwJy+Mz6sPMbHGgg6+tr9E4gD+vOXgk/2H68VchGZGCCmoK5UZSOnElKr27K8DDAsfMpMVuQALCxHCYSkLZwhM4dGr6MvPNaj3zhRhvZF/m1BQ0LK1crSySxJSeov3R6Ph4VQZ1CRKPbI17+0/NgNIcTO2QzKE/jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=moCwzeZoKC8T0BDYTDUw5yyAj4lYQZLItVvIdgArR2Y=;
 b=Z6SmMLUH2UMRX7yZS+M9XvM0U6orwCeXbUgD7Hap5v/gB6Zdn9rKGQ1/K7GVc+f3QNVDq2PC4A12sO9ll7s2M6wmfdNam6hzPIeccMSxBjMPPGzPP9aaVEKVxV2FYy071a/uSWLG1kAal78gl+IOdG4JiMREdomce0jMy1JR0dHdtjFEa6VsSRebuw/wjsFqOuUayOHoxJw6eobKTd+Sf4KhMwXdVfEkm89GbgBhrPVd1j033LC/6a0cqxMVVcrXitmBBCEERtrIKqChGLswKW9FXAWUryZrd+mSX6NfFjQP9qwZavazo4z6zs2Uj7puY5eUdE7N6/joNGddEybpUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=moCwzeZoKC8T0BDYTDUw5yyAj4lYQZLItVvIdgArR2Y=;
 b=tieh18B9VkblkYYg5ku80UcM0YbhyCcSjtITSMeq35ULbuV8GRmdfL8JQKHKqtzwgSX+KuMQt3NDcTleJOPuNkYJNx8Ccd2JGErbdqJ+oEfMbFAVys3uUH6nLS5iJNRYCCG6u7I34RqE9IZB78FYCrs7PIhuUNon2+Q5fRcFfxs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB7PR08MB3833.eurprd08.prod.outlook.com (2603:10a6:10:79::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Thu, 10 Feb
 2022 09:39:49 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4975.011; Thu, 10 Feb 2022
 09:39:49 +0000
Message-ID: <76e89297-9467-56d5-5d2b-2df17b9a7b9e@virtuozzo.com>
Date: Thu, 10 Feb 2022 12:39:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 2/3] qapi/ui: display-reload: add possibility to change
 listen address
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, bleal@redhat.com, wainersm@redhat.com,
 f4bug@amsat.org, crosa@redhat.com, eblake@redhat.com, armbru@redhat.com,
 kraxel@redhat.com, marcandre.lureau@redhat.com
References: <20220118160909.2502374-1-vsementsov@virtuozzo.com>
 <20220118160909.2502374-3-vsementsov@virtuozzo.com>
 <YgQI8dUX92WNCdX0@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <YgQI8dUX92WNCdX0@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR04CA0093.eurprd04.prod.outlook.com
 (2603:10a6:20b:50e::21) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9adee44-a9ae-4280-ce42-08d9ec794802
X-MS-TrafficTypeDiagnostic: DB7PR08MB3833:EE_
X-Microsoft-Antispam-PRVS: <DB7PR08MB3833A49352A0F4465E0CA4D1C12F9@DB7PR08MB3833.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H0Swy6Zjl2c32jdbrmJIbzB49PctWNvll70WoFY2O4QvS9BD1SwF74fydy5UZP4DuDUlQLO30AGPVQ+49yXNbGrdU8+iV9Ubx7/ZGEiOthWiS61sIOHFHn+L6sNS+QM+8drsqeFqfjZAGXm68n/MuWPELAtPClWoLX59mwbwYE4p/tI6VBQwjDtO4tq7pIHlma20jTqmuWfGthoexVMKN7GKi8ui5WluiTTeYG8LnWV/HmAdUMItzfsylidKA8abVyFJKcQe0PgwWL82QEmpZOiMuY8YyhsXefnxJ9w9DJ3wrLVjKSVCylK9kcwdZShsA+ZPWJk2AAdnAsNc/EJoOVB/ffuF5BOV3ICGWDGi3XxbHqSxt+0RMIc3/2eS+apKDx3pHa9x6gSfU4yWIIKaoloLfwIE1KtL84scxuFtFf1eXhZhMbXnv6g1MVg3U4aRAxZLMeVXbzjFnt8nf024fXDP/AQg5Ocze9sn+fDS/hyITyUjGAQQ0cI+KVpEs7YkUcaUD+P4LA2gkxZnoCt9YoT5ZYVlSAqy110HO49y3euHqLpz9ee2v+WIRYWzR0/G5Ra96PSWlWRhzIcKCWVJYA8QesIz75T9Zi0lUNZKCPzqFVCuKyqaPhnI1o3V/qIID38+4R9nqk0zvcYeQgja349ixjJu4jKNfI/PclcaUfl674KqwDIchcsW4bksR7JbNhhwBymSdLTpQSM33oKdwXVPvXfySprkvsxqaSMI/R9C/ej3JV/5q0MbJ9snn4SeQRG6qODxfZomtO+BEVuHDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(66556008)(66476007)(26005)(508600001)(316002)(6512007)(4326008)(52116002)(2616005)(31686004)(6486002)(6506007)(6916009)(36756003)(8936002)(5660300002)(31696002)(7416002)(186003)(66946007)(38350700002)(2906002)(38100700002)(86362001)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXBFZW1vbVRGSy9YWTRwa1N6SGdiT1p2R1NrZGJVQ3Z5M3EzMG43MTlMVTF6?=
 =?utf-8?B?K3VLSFhVNXZUZEpmNForSVlvV0RQaVBuUE1xR0VsTXNaK0NGMUZyV1Q2MnBy?=
 =?utf-8?B?NWxmdUhiVFVIUTNQWGYzRTFmWTdMaS9POWJFd2JVbUMvUDhGWlMvaEl1ODRM?=
 =?utf-8?B?MnljSEo5ZUxmQU1uYmlGVkJwc3ZLeFVERHkwTHFtYnZ3Mk9RNHFvSGFmVXNB?=
 =?utf-8?B?bk4ydXZhN3c4VmZDakRXUnloVUNIS1Q1K1pHU01GSmZ5MHVCSCswV2ZLTzlX?=
 =?utf-8?B?OTVEVlVIcVA2Qk44Vi8xdEFPcEowUVZKcDJDdDF3SlVVK1lvWHo0Q1d6VC90?=
 =?utf-8?B?TEZkeTlVVGgrUDJQdWhlRXNweGw2RUVLMG1NU1dqTWFmRERJMHI0aDBaNTE0?=
 =?utf-8?B?eHhZVTJ3R1ZXTENkUUtNN3ByeVhHNmxjWjNqNWJlcktxN08xOGRNQ0tRaDdU?=
 =?utf-8?B?VFB3bXZtMERqdUtEejVrR3pncGFpYW4wUkZRdkdSNWFyZTNXNVBQM0FuVEI3?=
 =?utf-8?B?WFpvN3QrcWQ2M3FPUGl0VDFxUnFGeUxPVVFXc09xUkxaQVpjSlpaTGtiTW9p?=
 =?utf-8?B?aDlFTG9KK0JxTGorQ1JCd05iUkljSEc1SjArcVR1L1diQnQ5WFYvcVMrZU9s?=
 =?utf-8?B?OElUQlNocWNnbTlQNnpSdnJHL1dJbnJKSjVuaTFuYjlxRFpZSGFPaW1lSTFy?=
 =?utf-8?B?cG5BSm1PbEs5alNLYytXdU52aE1jNGtMNHVEV200R1R0UnhqeStnMkRYeDVr?=
 =?utf-8?B?ZGpUNGhQaHcyT0tGVUx5M3c0NEswOGN2UndWWnI2cHFDTit0K0phZ01YRDdk?=
 =?utf-8?B?UWg2RENnSTNBUHkwR2thT0lHWk9jY09YZXVmT29ZQTVySGl5aEhGbkhoN2tP?=
 =?utf-8?B?K1NZQmFsZ1J5WTlKSW1RSTgrMW1WOXR3dk5kRkFjZU5McmEwSlVkWXNzaFAz?=
 =?utf-8?B?cjFtMllYYis0R2UxbmJOVUlJaWFmaXVucVlqQm94b1dqclFCbWZZWWRQZ0V1?=
 =?utf-8?B?Z3R5cDAxRERURVpRM2NqZUk0dExkTzNxSGE3c0R4UVlGZGJ1U0l2a3E3L0dC?=
 =?utf-8?B?UDFrcmlBVG0raytBcWh3eWUrRi9PTDIzRHYvYXVZUkZWQ0JVdDU2eXNwZVFt?=
 =?utf-8?B?ZFJiak1MTmxmSWtEZ0hTYm9JVHFWZFlBQUhmWmplMHkrcDdOU0hsUEl3MnFH?=
 =?utf-8?B?eVkwSzNacEQrOSsvajdibVMzLzlRNVBGWnRMWWxTcldsV2M3TEtVRGpXcm1V?=
 =?utf-8?B?bWp6cmFtWnBxNXNGOFVPVEpzeFZzRmw4cXpqV24zbTduNHQrWjlkQVlYYkFJ?=
 =?utf-8?B?Q1JJT1ZBREZNT3JiNVl3dlJKb3FDN3NzbEJ3S2dFT240YUxuWUZLMkk1RGtV?=
 =?utf-8?B?NnY0eE1oQVlGU3FNdDMwZnVNdVE0UkEwMmUyUkNLWlhiWFhweTZ5Vm5EUGpT?=
 =?utf-8?B?WEhXYklXN3l4VGNOeEM4MllaV05ibEF3aWdteStSL2d0a0JmQmE0WXhDUmxG?=
 =?utf-8?B?cjBJbUIxZDJiYlc4UGdRMkdId0h6cnkvaTdJWExpUnhlK3BXQkVzVE8yOFJy?=
 =?utf-8?B?MEN0RVVPTXhuQUVhUWJNd2ZxcTcyWlVDbHRTQk50TVpCQjB2dGRCMnRDSE5Y?=
 =?utf-8?B?d0VGRzl6RXJ4UW5yQy9ySzBTWnZQV0NOc1pxR0M0QmNuL1lYSjg2RzYyTHVV?=
 =?utf-8?B?bjIySXlUbGJqZ05GTUlBb3dxczMxVnJGZnRldnNhcWVOTHoveUR1T3lzanNn?=
 =?utf-8?B?TXJhb2FLSnp0WldISEVIZ0xRQlJpTkNHOXgyNFpZMlgvRXc4eHFqVVp0Ly9M?=
 =?utf-8?B?b3RKM215MzFZNzJDY3RQMWtqVFo2RlRNOVIxQll6QTI3bUxFZzJRdXdkMlRB?=
 =?utf-8?B?S0IzdzVucXBVS1hKcm1XYTBPNGpWdFlSZUV5V3RFWC9UQjVrT0NNblVvNzd5?=
 =?utf-8?B?NFJDZHBQNkE2OERVZUQ1OGlaMnhlZ1J3QjNsN2JidmR2ZHZ3d0EwQXlmWm5X?=
 =?utf-8?B?RFRncUJOSDlhVy9XdFhyS29ObFQ4SVFMd1VsMW1YZVBFdWtYdFNEYXNtc2Fm?=
 =?utf-8?B?V1lMVXM0Nm5TZHdSYmZ4aFRVVm9TaVFzSWJXQzBaeFI2MFlOamJoemkzbEtp?=
 =?utf-8?B?VTlNZEFZdlhGUlR3a2daNzNYUDh4S0JmRUM4alNqVmdWNWRrK2RWZXJYSHBS?=
 =?utf-8?B?MkVoaFVmaXE2dkw5OXJ6NmNjUTVEaTVrRjMwMXNvN3FKbzJ2NjV0Tk1rc2c0?=
 =?utf-8?B?WGFKaUpWc1plZmUzNVNac2xnVm1nPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9adee44-a9ae-4280-ce42-08d9ec794802
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 09:39:49.5183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qGfsuvm8yfKRusxXzCpbDozsJ4Xocz6MQilxIkZV7hoM/EKD4HcUzwCtXO7AWaK2LYowTdMiTclnl2/Hwo4b7hzZ/54WZ+E0KnbtLUkAdWo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3833
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0d::717
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0d::717;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

09.02.2022 21:33, Daniel P. Berrangé wrote:
> On Tue, Jan 18, 2022 at 05:09:08PM +0100, Vladimir Sementsov-Ogievskiy wrote:
>> Add possibility to change addresses where VNC server listens for new
>> connections. Prior to 6.0 this functionality was available through
>> 'change' qmp command which was deleted.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   docs/about/removed-features.rst |  3 ++-
>>   qapi/ui.json                    |  6 +++++-
>>   include/ui/console.h            |  2 +-
>>   monitor/qmp-cmds.c              |  4 +---
>>   ui/vnc.c                        | 37 ++++++++++++++++++++++++++-------
>>   5 files changed, 39 insertions(+), 13 deletions(-)
>>
>> diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
>> index 4c4da20d0f..b92626a74e 100644
>> --- a/docs/about/removed-features.rst
>> +++ b/docs/about/removed-features.rst
>> @@ -355,7 +355,8 @@ documentation of ``query-hotpluggable-cpus`` for additional details.
>>   ``change`` (removed in 6.0)
>>   '''''''''''''''''''''''''''
>>   
>> -Use ``blockdev-change-medium`` or ``change-vnc-password`` instead.
>> +Use ``blockdev-change-medium`` or ``change-vnc-password`` or
>> +``display-reload`` instead.
>>   
>>   ``query-events`` (removed in 6.0)
>>   '''''''''''''''''''''''''''''''''
>> diff --git a/qapi/ui.json b/qapi/ui.json
>> index 9354f4c467..4c4448f378 100644
>> --- a/qapi/ui.json
>> +++ b/qapi/ui.json
>> @@ -1293,12 +1293,16 @@
>>   # Specify the VNC reload options.
>>   #
>>   # @tls-certs: reload tls certs or not.
>> +# @addresses: If specified, change set of addresses
>> +#             to listen for connections. Addresses configured
>> +#             for websockets are not touched. (since 7.0)
>>   #
>>   # Since: 6.0
>>   #
>>   ##
>>   { 'struct': 'DisplayReloadOptionsVNC',
>> -  'data': { '*tls-certs': 'bool' } }
>> +  'data': { '*tls-certs': 'bool',
>> +            '*addresses': ['SocketAddress'] } }
> 
> So I'm having second thoughts on this, because I think we in fact need to
> distinguish between reloads of state related to existing configuration
> vs applying changes to the actual configuration.
> 
> For example,  when I think about the 'tls-certs' option here, it
> lets us reload the existing TLS credentials from disk. ie it lets
> the user re-write the TLS file content on disk and then tell QEMU
> to reload the files.
> 
> An equally valuable option would be to tell QEMU to simply use a
> completely different set of TLS files on disk, rather than re-writing
> in place.  We don't have this feature now, but I think we should
> anticipate it in the design.
> 
> So I'm going to suggest that instead of 'display-reload', we should
> have a general purpose 'display-update' command for modifying existing
> config and , leave 'display-reload' purely for re-loading state, not
> changing config.
> 
> Essentially 'display-reload' is about re-starting QEMU displays
> with the same config, while 'display-update' is about restarting
> with a new config.
> 
> This shouldn't be too much work to achieve in your patch. Just
> clone everything related to the 'display-reload' QMP command
> boilerplate, replacing 'reload' with 'update' throughout and
> discarding the 'tls-certs' bits leaving only your 'addresses'
> bit.

Yes, that's simple to do, I'll resend soon.

> 
> We can use this 'display-update' command for making pasword
> and auth config changes possible too later.
> 
>>   
>>   ##
>>   # @DisplayReloadOptions:
>> diff --git a/include/ui/console.h b/include/ui/console.h
>> index f590819880..b052027915 100644
>> --- a/include/ui/console.h
>> +++ b/include/ui/console.h
>> @@ -512,7 +512,7 @@ int vnc_display_password(const char *id, const char *password);
>>   int vnc_display_pw_expire(const char *id, time_t expires);
>>   void vnc_parse(const char *str);
>>   int vnc_init_func(void *opaque, QemuOpts *opts, Error **errp);
>> -bool vnc_display_reload_certs(const char *id,  Error **errp);
>> +bool vnc_display_reload(DisplayReloadOptionsVNC *arg, Error **errp);
>>   
>>   /* input.c */
>>   int index_from_key(const char *key, size_t key_length);
>> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
>> index 14e3beeaaf..ad45baa12b 100644
>> --- a/monitor/qmp-cmds.c
>> +++ b/monitor/qmp-cmds.c
>> @@ -356,9 +356,7 @@ void qmp_display_reload(DisplayReloadOptions *arg, Error **errp)
>>       switch (arg->type) {
>>       case DISPLAY_RELOAD_TYPE_VNC:
>>   #ifdef CONFIG_VNC
>> -        if (arg->u.vnc.has_tls_certs && arg->u.vnc.tls_certs) {
>> -            vnc_display_reload_certs(NULL, errp);
>> -        }
>> +        vnc_display_reload(&arg->u.vnc, errp);
>>   #else
>>           error_setg(errp, "vnc is invalid, missing 'CONFIG_VNC'");
>>   #endif
>> diff --git a/ui/vnc.c b/ui/vnc.c
>> index fa0fb736d3..a86bd6335e 100644
>> --- a/ui/vnc.c
>> +++ b/ui/vnc.c
>> @@ -587,16 +587,10 @@ VncInfo2List *qmp_query_vnc_servers(Error **errp)
>>       return prev;
>>   }
>>   
>> -bool vnc_display_reload_certs(const char *id, Error **errp)
>> +static bool vnc_display_reload_certs(VncDisplay *vd, Error **errp)
>>   {
>> -    VncDisplay *vd = vnc_display_find(id);
>>       QCryptoTLSCredsClass *creds = NULL;
>>   
>> -    if (!vd) {
>> -        error_setg(errp, "Can not find vnc display");
>> -        return false;
>> -    }
>> -
>>       if (!vd->tlscreds) {
>>           error_setg(errp, "vnc tls is not enabled");
>>           return false;
>> @@ -3973,6 +3967,35 @@ static int vnc_display_listen(VncDisplay *vd,
>>       return 0;
>>   }
>>   
>> +bool vnc_display_reload(DisplayReloadOptionsVNC *arg, Error **errp)
>> +{
>> +    VncDisplay *vd = vnc_display_find(NULL);
>> +
>> +    if (!vd) {
>> +        error_setg(errp, "Can not find vnc display");
>> +        return false;
>> +    }
>> +
>> +    if (arg->has_tls_certs && arg->tls_certs) {
>> +        if (!vnc_display_reload_certs(vd, errp)) {
>> +            return false;
>> +        }
>> +    }
>> +
>> +    if (arg->has_addresses) {
>> +        if (vd->listener) {
>> +            qio_net_listener_disconnect(vd->listener);
>> +            object_unref(OBJECT(vd->listener));
>> +            vd->listener = NULL;
>> +        }
>> +
>> +        if (vnc_display_listen(vd, arg->addresses, NULL, errp) < 0) {
>> +            return false;
>> +        }
>> +    }
>> +
>> +    return true;
>> +}
>>   
>>   void vnc_display_open(const char *id, Error **errp)
>>   {
>> -- 
>> 2.31.1
>>
> 
> Regards,
> Daniel
> 


-- 
Best regards,
Vladimir


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7374B82DF
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 09:24:26 +0100 (CET)
Received: from localhost ([::1]:59256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKFbt-0002Oi-F7
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 03:24:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nKFMJ-0007G3-7H; Wed, 16 Feb 2022 03:08:20 -0500
Received: from [2a01:111:f400:fe02::72d] (port=60126
 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nKFME-0000tu-QE; Wed, 16 Feb 2022 03:08:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WHeVpbQYxFwrhwrVHiwO2POLGoHftIe9OS7vyD1hMqerDSaYITZnU8S2CfkFuo+D3rGUgbyj2Bx3KQxK1CVhYR9M7eJe7vihPJsD7kjw/XGPWqwnh7kCh6qvBE9fkyzyn7h0QEVBYGHmnnAnNH64l6/CDqklPwfGfghQYn4opEBgMR7hyx77sfLcZiUFOLmTaA49FngHBEZnIzI0tTmXGAQqp8jfExHPyaC9DMQwe79rE5AVlsv8AvGECFtIHGizYAnHmD0OKy8zIC+i8IPYeJjGq8/xwjBmvhN1jEW0J5dgiFLwoJlOncSgLTUz1arQieDRjvWkss2IZHETkaN7Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KeVwMiCqM5kInstZAmJ5xYe3XvimAlTii4cdQgWXVjM=;
 b=LKmgIvF5IP5D/TTjcNTnJdXaZYy7z/dUBqqMAwa58biAwjFEs4G38egTiIpqkDyGkU5kB36L+ITi1XiJzaxfwUHVxBrxsDFTBNj1IrkCsyEAZg5Mar2gcoEPYZBpuxh/hmHwo+cHalMB9o3PPoHTv3qUNnGyfM51sZIrNM8TzGpaDg685YvXlZLUAYZ83XWvwXUNixV4N808iSbn7k1cby5WTWyqgt1raak6ZVFxlM6JXeVI0uTPNqJ8PC1yHwFxUqSAZuwd9UR0mhFQZRKFD8YN6FEl75qL2eClNxx8ENOKiRiUeWlRoYE/LP7Wxy32Y0XiOuEohhdVsPYZlje3/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KeVwMiCqM5kInstZAmJ5xYe3XvimAlTii4cdQgWXVjM=;
 b=XEbfXbEnB80ZfvyoBlnNNtlSYMjGnOHqgNwzHegM0phBpneZ46PFBCHMB4PrF4SQOx3ccXZH3i/LTCmn9lUPIIyPLX90Cri0X0CdXF+tmPZc9JE7hZUMeMwTfzpMG1s0IBaZPyMFUTb6uyQvQp8Q79zr43t5Wg7iIf9ElcOrNTE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DU2PR08MB7270.eurprd08.prod.outlook.com (2603:10a6:10:2d5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Wed, 16 Feb
 2022 08:08:10 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 08:08:09 +0000
Message-ID: <a36660ff-c7d6-9bd1-bea8-dc0a10b74329@virtuozzo.com>
Date: Wed, 16 Feb 2022 11:08:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] nbd/server: Allow MULTI_CONN for shared writable
 exports
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>, Nir Soffer <nsoffer@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block <qemu-block@nongnu.org>, Richard Jones <rjones@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>
References: <20220215171838.2651387-1-eblake@redhat.com>
 <CAMRbyyvdBWMB9bzpkUUMO+SZj6PN8Xy0kJnvqLhB2W6vw+5iWQ@mail.gmail.com>
 <20220215232414.g4l4qoqiqyjvnweg@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20220215232414.g4l4qoqiqyjvnweg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0028.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::19) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1f37f97-6b0f-4af1-25ad-08d9f123785b
X-MS-TrafficTypeDiagnostic: DU2PR08MB7270:EE_
X-Microsoft-Antispam-PRVS: <DU2PR08MB7270BB6876698124E5EA541EC1359@DU2PR08MB7270.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mw5mOtOPaTbN2grdeWZ3wPIBEterLXkOFEu4jRePMJtslILwAFtcixgm6wxoo3rReSxWs4FhQvCCcsF5Iij+bjQhMISiMQh6cH9dyGx9edy1stUszv+/PfT4eB3zK4x/x5cHs/CefTzd2R32XnKJaxHUR8rx0w6Ks+ZFScXoVNj+Rl95WHRtxLyStkXOOdkMhdnJrr73TYbu7mGGxdGPap66T7b9n0OJ5s2gXIF9ITN9LTz1W0vatUfihZrv0ME6YzNpjRCxqsLW9/de9FrfdIFDw1qRGePJzUZU6ocV2OmfNJaqcuuW2wxceODPo8Nvr7PyHiQKLbs/RL7ICaMCCEtEj0T2Cr+zjgPoHZjbD0G/IR0Mu4C6dKlF0b+9EMu8P74PITNA+FzaMJeuZw80b/VHIymnKw6jcQCOuZbF7fOCcmw7aZ+3DJcI43e8GBIkVlhF8T8R7/B1ESucznX5bfiLIQVLHImNHALs9zQlNJehVtlKFn+RHYmMM7lGXcJ9UOC5o/B1Mespier38UoKap2Rco12Ff/FJv3JnwqxG4NXOxotOowyNk4Mam8wTMuUPRFyXNHEy0V5DbDw+aJjqkAZ3CfJID820GoJTmZ8JO9eT/N3+opjXL1ysEqGdpkKiA8UIthXcSYHCfn4v6xbubyw8vYu0rDQlld9XABU+TSGomjSv5/2CXOxtWfi46XXMTQXcPPSXBF7v2f/tMU99UhVxdTmtkb8whUPCQo8PURysFCzIj9OH2fgUVFUP3bnH+EO+1K0XLliAYsvlNyRdQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(110136005)(6506007)(52116002)(53546011)(8676002)(186003)(26005)(2616005)(66946007)(66476007)(6512007)(54906003)(66556008)(2906002)(31696002)(6666004)(6486002)(316002)(86362001)(508600001)(83380400001)(38100700002)(38350700002)(4326008)(8936002)(31686004)(30864003)(36756003)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3FmN3lxQ0hDRnlXS2FVTFZMM0VQSVZoQ0Z1ZlhxQnF4N1Zva1BPYi96MkhF?=
 =?utf-8?B?bE1JT0xPRVBINk1nd1BnUjY3SHAyYi8xUnlEWEd3bnNoTzhxaVRJbWlwaE9o?=
 =?utf-8?B?b1BBVzkwNVJ3c0xKS0o3OVZzYUVNNXU1NEM1bEJ5bTRvZzFGaFNZdEZCWW1B?=
 =?utf-8?B?N0gxdnAveXJSVmlqQ0F6K0xydDhTVFVFbXNtSjNYQkFUWitPOWk3TFJnb0tM?=
 =?utf-8?B?Wm4wRDladzZvWFJDVGJ5b2JHTHQrQjdheVorTEdNOGtqRkFYanI2SkhCNDgz?=
 =?utf-8?B?c3h5cnVuQVdUOTlIRHdhbUx1ay9vY1JhdnpkUEtqUlQzUXBqVUhEeEladHBx?=
 =?utf-8?B?MjZhUmN2cnR0NHBVejF5WmtEcWUrWndGU3lSQlRvRnhldVcrWW9RbWJEaTJr?=
 =?utf-8?B?dGdHcUhPYktVdG9VMmUvOE1wTGRCTFRVSUxQK3ZDSWp5bUVvQVdJeTJmQXJs?=
 =?utf-8?B?RWoyMEZvL08waytoOXVSWWhUYVdZMlF6VVRxL1FhZ3BTRTB4dUVwRm1UWDF4?=
 =?utf-8?B?bkpVNUQrRHBnTENWRi9td281enNzZFZSRzdnaFR6OUZRek5Sckp2TUlGaDln?=
 =?utf-8?B?QjlxeGp1bEtjSFNpMkZuMDBSaEhmZ0h4ai9UZHJDU2tIN3AzakRwN2lsWlQy?=
 =?utf-8?B?empnYWJHbXRLUDF4dGdDekZhMWNQM1FlQkpSL2tEY2E2a3FNaGFKblJ6bklJ?=
 =?utf-8?B?alBuRFFkVTdsbVB6UklqamRXVXl5a1QzRVFsMEhyZEEwcUViZTVhRk9pUEIw?=
 =?utf-8?B?QmpyNnlXSkRsVWVUdHRvUnE5OTQxYkkzclRFejFTOWFYSWxiMWl5MElOcTdQ?=
 =?utf-8?B?dm1pU1FpR3FZS2FLV3hPNDJUYndrOTYwR3VoVUhwSHFlWFE1UkpKVEgvMHlM?=
 =?utf-8?B?bUhVbUdxUTVYcGxEOXA1dUY3bDBUaTgrMm1JU1lYUDg3dUhSd0R2VVBWdWZr?=
 =?utf-8?B?blE4MlBiVUtpaFFKQkFCeFFOUXk2cER4YkY3YWVKWXFZb0pYemloRU9zZmI0?=
 =?utf-8?B?dWNnMytOVVUzMHRGVmloZUZLVmgwcFE1aWF5b0ljblRFRi9BaFczNzJ3VFIv?=
 =?utf-8?B?MEFjenA5TTRscFBrRXlDODFoL1prWHpFSjNSRUk0eDdnaUlsdzJTOFUrRnhu?=
 =?utf-8?B?TSsyRmhWUm1iVDEzL3ZmK2IyV3ZEZ3A5ZXRoUWg3N0poZTRTZ05VUWZCVjJO?=
 =?utf-8?B?Nm9LUUVVZHZNRDJzVkRBZlY1REpxT3JQSzVOVnhFL1pQZU1iNGRERnN0STNM?=
 =?utf-8?B?Q1JUczAzSVo3U1lSa3FGZkV3MUxMekwxS0t4YVRseVVsa1Q1SlBjWXBRQ2tW?=
 =?utf-8?B?TTJiUzR3NFN0Z1djR2poMU00eGNlL3IrdDI1R3RaN2ZoTVg3eThvbVdSd0p2?=
 =?utf-8?B?SE9CeXY3SHBTRFpyL1FsekhDL2Y0cExtZVZmc04rbURlb0YzOWNaOGpKZmQ1?=
 =?utf-8?B?eHFKbi9SblVjUlBmUmlqNEFTWDdrUzVSZS9kN3ZOMklYTC8vN0locTBQMWNY?=
 =?utf-8?B?VEZwSXVJOVJPZThNN2lzRnJwS094a28wbUR1cjQ5NFgxTFVhaTRCUWRVdC8w?=
 =?utf-8?B?MXBKZjRuTXdlYS9HakJuQ0t0V3lyUVpyNkVNNkNXbGM2K2hIUThtU2gra2hB?=
 =?utf-8?B?V0s5NDNkTm1keC96dmUwZ3V2MGxtclZRMDVPamU1MmZSbWtBd3dCdWRPNHJ1?=
 =?utf-8?B?S3ZQTnJPRGVLWWhraEpJYytJVU5raDRjQ2x4RkdBTmhKV3BxZTVmQjhpdkF0?=
 =?utf-8?B?SmtPTDRRZVpFZ1MxSEZweEx6QnJHVms3V3Q5K1REZ200YnpxWDA4TTVSKzVT?=
 =?utf-8?B?YlRscjVVR2h1V3VML1pMTXUvZDMxYVVoSGM3Skx6NTVKaWxrcTdXTzdtVVFu?=
 =?utf-8?B?RFE5c3NkU2FLZjcyRkFKTFFpMThqODNETnFaWlFJUW9NM2QxVlFvMWtMVSs1?=
 =?utf-8?B?RXBDaHpxakZXRDY1a01kR1hRK3U2T0ZhSzMwL2pYYUx5WDk0bWxEWW1rZEph?=
 =?utf-8?B?MURwbGN0eWo2TTFEWU0ydHBJakJ6MFhFSzRoUE83azA3LzY3SFRZdUZCRXc1?=
 =?utf-8?B?Qk40enhYSUoxQUF3TW80RDNIWDdqK0duZlZ4VERkUU9VREdYdU5pcUpJK2F0?=
 =?utf-8?B?VFNXN1ZDSWlkSnlRb25BZ1E5aFNWSVhjbnc1ZzFwZzQ1Z0JjdHJaTGlYamgz?=
 =?utf-8?B?c0FRZ2gzNHhwcVoxWDh6UzFNaHZhZGlpQWZ5MHQ0Lzg3YmFlLzI1aU0ySXRZ?=
 =?utf-8?B?eVZ4MnIwOGp3MWVnQmdPV1NsUEJnPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1f37f97-6b0f-4af1-25ad-08d9f123785b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 08:08:09.8942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RxzC9T2P7MrJXbWrvuH69SIB/d7CBONcx8J7Hjr1p67jJeEg+Ic+U9+cOil6QX+V2Ya7VIzVLeISjSdWt8NS/rmk4jdRzKAl75+4orseUOs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7270
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe02::72d
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe02::72d;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.904, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
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

16.02.2022 02:24, Eric Blake wrote:
> On Tue, Feb 15, 2022 at 09:23:36PM +0200, Nir Soffer wrote:
>> On Tue, Feb 15, 2022 at 7:22 PM Eric Blake <eblake@redhat.com> wrote:
>>
>>> According to the NBD spec, a server advertising
>>> NBD_FLAG_CAN_MULTI_CONN promises that multiple client connections will
>>> not see any cache inconsistencies: when properly separated by a single
>>> flush, actions performed by one client will be visible to another
>>> client, regardless of which client did the flush.  We satisfy these
>>> conditions in qemu when our block layer is backed by the local
>>> filesystem (by virtue of the semantics of fdatasync(), and the fact
>>> that qemu itself is not buffering writes beyond flushes).  It is
>>> harder to state whether we satisfy these conditions for network-based
>>> protocols, so the safest course of action is to allow users to opt-in
>>> to advertising multi-conn.  We may later tweak defaults to advertise
>>> by default when the block layer can confirm that the underlying
>>> protocol driver is cache consistent between multiple writers, but for
>>> now, this at least allows savvy users (such as virt-v2v or nbdcopy) to
>>> explicitly start qemu-nbd or qemu-storage-daemon with multi-conn
>>> advertisement in a known-safe setup where the client end can then
>>> benefit from parallel clients.
>>>
>>
>> It makes sense, and will be used by oVirt. Actually we are already using
>> multiple connections for writing about 2 years, based on your promise
>> that if every client writes to district  areas this is safe.
> 
> I presume s/district/distinct/, but yes, I'm glad we're finally trying
> to make the code match existing practice ;)
> 
>>> +++ b/docs/tools/qemu-nbd.rst
>>> @@ -139,8 +139,7 @@ driver options if ``--image-opts`` is specified.
>>>   .. option:: -e, --shared=NUM
>>>
>>>     Allow up to *NUM* clients to share the device (default
>>> -  ``1``), 0 for unlimited. Safe for readers, but for now,
>>> -  consistency is not guaranteed between multiple writers.
>>> +  ``1``), 0 for unlimited.
>>>
>>
>> Removing the note means that now consistency is guaranteed between
>> multiple writers, no?
>>
>> Or maybe we want to mention here that consistency depends on the protocol
>> and users can opt in, or refer to the section where this is discussed?
> 
> Yeah, a link to the QAPI docs where multi-conn is documented might be
> nice, except I'm not sure the best way to do that in our sphinx
> documentation setup.
> 
>>> +##
>>> +# @NbdExportMultiConn:
>>> +#
>>> +# Possible settings for advertising NBD multiple client support.
>>> +#
>>> +# @off: Do not advertise multiple clients.
>>> +#
>>> +# @on: Allow multiple clients (for writable clients, this is only safe
>>> +#      if the underlying BDS is cache-consistent, such as when backed
>>> +#      by the raw file driver); ignored if the NBD server was set up
>>> +#      with max-connections of 1.
>>> +#
>>> +# @auto: Behaves like @off if the export is writable, and @on if the
>>> +#        export is read-only.
>>> +#
>>> +# Since: 7.0
>>> +##
>>> +{ 'enum': 'NbdExportMultiConn',
>>> +  'data': ['off', 'on', 'auto'] }
>>>
>>
>> Are we going to have --multi-con=(on|off|auto)?
> 
> Oh. The QMP command (which is immediately visible through
> nbd-server-add/block-storage-add to qemu and qemu-storage-daemon)
> gains "multi-conn":"on", but you may be right that qemu-nbd would want
> a command line option (either that, or we accellerate our plans that
> qsd should replace qemu-nbd).
> 
>>> +++ b/blockdev-nbd.c
>>> @@ -44,6 +44,11 @@ bool nbd_server_is_running(void)
>>>       return nbd_server || is_qemu_nbd;
>>>   }
>>>
>>> +int nbd_server_max_connections(void)
>>> +{
>>> +    return nbd_server ? nbd_server->max_connections : -1;
>>> +}
>>>
>>
>> -1 is a little bit strange for a limit, maybe 1 is a better default when
>> we nbd_server == NULL? When can this happen?
> 
> In qemu, if you haven't used the QMP command 'nbd-server-start' yet.
> In qemu-nbd, always (per the nbd_server_is_running function just
> above).  My iotest only covered the qemu/qsd side, not the qemu-nbd
> side, so it looks like I need a v3...
> 
>>> +++ b/nbd/server.c
> 
>>> +    /*
>>> +     * Determine whether to advertise multi-conn.  Default is auto,
>>> +     * which resolves to on for read-only and off for writable.  But
>>> +     * if the server has max-connections 1, that forces the flag off.
>>>
>>
>> Looks good, this can be enabled automatically based on the driver
>> if we want, so users using auto will can upgrade to multi-con automatically.
> 
> Yes, that's part of why I made it a tri-state with a default of 'auto'.
> 
>>
>>
>>> +     */
>>> +    if (!arg->has_multi_conn) {
>>> +        arg->multi_conn = NBD_EXPORT_MULTI_CONN_AUTO;
>>> +    }
>>> +    if (nbd_server_max_connections() == 1) {
>>
>> +        arg->multi_conn = NBD_EXPORT_MULTI_CONN_OFF;
>>> +    }
>>
>> +    if (arg->multi_conn == NBD_EXPORT_MULTI_CONN_AUTO) {
>>> +        multi_conn = readonly;
>>> +    } else {
>>> +        multi_conn = arg->multi_conn == NBD_EXPORT_MULTI_CONN_ON;
>>> +    }
>>>
>>
>> This part is a little bit confusing - we do:
>> - initialize args->multi_con if it has not value
>> - set the temporary multi_con based now initialized args->multi_con
>>
>> I think it will be nicer to separate arguments parsing, so there is no need
>> to initialize it here or have arg->has_multi_conn, but I did not check how
>> other arguments are handled.
> 
> arg->has_multi_conn is fallout from the fact that our QAPI must remain
> back-compat. If it is false, the user did not pass "multi-conn":...,
> so we want the default value of "auto".  Once we've established the
> default, then we force multi-conn off if we know we are limited to one
> client (although as you pointed out, nbd_server_max_connections()
> needs to be tested with qemu-nbd).  Then, it's easier to resolve the
> tri-state enum variable into the bool of what we actually advertise to
> the NBD client.
> 
>>> +++ b/tests/qemu-iotests/tests/nbd-multiconn
>>> @@ -0,0 +1,188 @@
>>> +#!/usr/bin/env bash
>>> +# group: rw auto quick
>>> +#
>>> +# Test that qemu-nbd MULTI_CONN works
>>> +#
>>> +echo
>>> +echo "=== Initial image setup ==="
>>> +echo
>>> +
>>> +_make_test_img 4M
>>> +$QEMU_IO -c 'w -P 1 0 2M' -c 'w -P 2 2M 2M' "$TEST_IMG" | _filter_qemu_io
>>> +_launch_qemu 2> >(_filter_nbd)
>>> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"qmp_capabilities"}' "return"
>>> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"blockdev-add",
>>> +  "arguments":{"driver":"qcow2", "node-name":"n",
>>> +    "file":{"driver":"file", "filename":"'"$TEST_IMG"'"}}}' "return"
> 
> I'm not the best at writing python iotests; I welcome a language
> translation of this aspect. 



Let me try:)


#!/usr/bin/env python3

import os
import iotests
import nbd
from iotests import qemu_img_create, qemu_io_silent


disk = os.path.join(iotests.test_dir, 'disk')
size = '4M'
nbd_sock = os.path.join(iotests.test_dir, 'nbd_sock')
nbd_uri = 'nbd+unix:///{}?socket=' + nbd_sock


class TestNbdMulticonn(iotests.QMPTestCase):
     def setUp(self):
         assert qemu_img_create('-f', iotests.imgfmt, disk, size) == 0
         assert qemu_io_silent('-c', 'w -P 1 0 2M',
                               '-c', 'w -P 2 2M 2M', disk) == 0

         self.vm = iotests.VM()
         self.vm.launch()
         result = self.vm.qmp('blockdev-add', {
             'driver': 'qcow2',
             'node-name': 'n',
             'file': {'driver': 'file', 'filename': disk}
         })
         self.assert_qmp(result, 'return', {})

     def tearDown(self):
         self.vm.shutdown()
         os.remove(disk)
         os.remove(nbd_sock)

     def server_start(self, max_connections=None):
         args = {
             'addr': {
                 'type': 'unix',
                 'data': {'path': nbd_sock}
             }
         }
         if max_connections is not None:
             args['max-connections'] = max_connections

         result = self.vm.qmp('nbd-server-start', args)
         self.assert_qmp(result, 'return', {})

     def export_add(self, name, writable=None, multi_conn=None):
         args = {
             'type': 'nbd',
             'id': name,
             'node-name': 'n',
             'name': name,
         }
         if writable is not None:
             args['writable'] = writable
         if multi_conn is not None:
             args['multi-conn'] = multi_conn

         result = self.vm.qmp('block-export-add', args)
         self.assert_qmp(result, 'return', {})

     def check_multi_conn(self, export_name, multi_conn):
         cl = nbd.NBD()
         cl.connect_uri(nbd_uri.format(export_name))
         self.assertEqual(cl.can_multi_conn(), multi_conn)
         cl.shutdown()

     def test_default_settings(self):
         self.server_start()
         self.export_add('r')
         self.export_add('w', writable=True)
         self.check_multi_conn('r', True)
         self.check_multi_conn('w', False)

     def test_multiconn_option(self):
         self.server_start()
         self.export_add('r', multi_conn='off')
         self.export_add('w', writable=True, multi_conn='on')
         self.check_multi_conn('r', False)
         self.check_multi_conn('w', True)

     def test_limited_connections(self):
         self.server_start(max_connections=1)
         self.export_add('r', multi_conn='on')
         self.export_add('w', writable=True, multi_conn='on')
         self.check_multi_conn('r', False)
         self.check_multi_conn('w', False)

     def test_parallel_writes(self):
         self.server_start()
         self.export_add('w', writable=True, multi_conn='on')

         clients = [nbd.NBD() for _ in range(3)]
         for c in clients:
             c.connect_uri(nbd_uri.format('w'))
             assert c.can_multi_conn()

         buf1 = clients[0].pread(1024 * 1024, 0)
         self.assertEqual(buf1, b"\x01" * 1024 * 1024)

         buf2 = b"\x03" * 1024 * 1024
         clients[1].pwrite(buf2, 0)
         clients[2].flush()
         buf1 = clients[0].pread(1024 * 1024, 0)

         self.assertEqual(buf1, buf2)

         for i in range(3):
             clients[i].shutdown()


if __name__ == '__main__':
     iotests.main(supported_fmts=['qcow2'])







> But the shell code for
> _launch_qemu/_send_qemu_cmd was already pretty nice for setting up a
> long-running background qemu process where I can pass in QMP commands
> at will, then interact from other processes.
> 
>>> +export nbd_unix_socket
>>> +
>>> +echo
>>> +echo "=== Default nbd server settings ==="
>>> +echo
>>> +# Default allows for unlimited connections, readonly images advertise
>>> +# multi-conn, and writable images do not
>>> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"nbd-server-start",
>>> +  "arguments":{"addr":{"type":"unix",
>>> +    "data":{"path":"'"$nbd_unix_socket"'"}}}}' "return"
>>> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"block-export-add",
>>> +  "arguments":{"type":"nbd", "id":"r", "node-name":"n",
>>> +    "name":"r"}}' "return"
>>> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"block-export-add",
>>> +  "arguments":{"type":"nbd", "id":"w", "node-name":"n",
>>> +    "name":"w", "writable":true}}' "return"
>>> +nbdsh -u "nbd+unix:///r?socket=$nbd_unix_socket" -c '
>>> +assert h.can_multi_conn()
>>> +h.shutdown()
>>> +print("nbdsh passed")'
>>> +nbdsh -u "nbd+unix:///w?socket=$nbd_unix_socket" -c '
>>> +assert not h.can_multi_conn()
>>> +h.shutdown()
>>> +print("nbdsh passed")'
>>>
>>
>> Mixing of shell and python is very confusing. Wouldn't it be much cleaner
>> to write the test in python?
> 
> Here, nbdsh -c 'python snippet' is used as a shell command line
> parameter.  Writing python code to call out to a system() command
> where one of the arguments to that command is a python script snippet
> is going to be just as annoying as writing it in bash.
> 
>>> +echo
>>> +echo "=== Demonstrate parallel writers ==="
>>> +echo
>>> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"nbd-server-start",
>>> +  "arguments":{"addr":{"type":"unix",
>>> +    "data":{"path":"'"$nbd_unix_socket"'"}}}}' "return"
>>> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"block-export-add",
>>> +  "arguments":{"type":"nbd", "id":"w", "node-name":"n",
>>> +    "name":"", "multi-conn":"on", "writable":true}}' "return"
>>> +
>>> +nbdsh -c '
>>> +import os
>>> +sock = os.getenv("nbd_unix_socket")
>>> +h = []
>>> +
>>> +for i in range(3):
>>> +  h.append(nbd.NBD())
>>> +  h[i].connect_unix(sock)
>>> +  assert h[i].can_multi_conn()
>>>
>>
>> This is somewhat C in python, maybe:
>>
>>      handles = [nbd.NBD() for _ in range(3)]
>>
>>      for h in handles:
>>          h.connect_unix(sock)
>>          assert h.can_multi_con()
>>
>> Since assert will abort the test, and we don't handle
>> exceptions, failure will not shutdown the connections
>> but it should not matter for the purpose of a test.
> 
> As I said, I'm open to python suggestions :)  I like your approach.
> 
>>
>>
>>> +
>>> +buf1 = h[0].pread(1024 * 1024, 0)
>>> +if buf1 != b"\x01" * 1024 * 1024:
>>> +  print("Unexpected initial read")
>>>
>>
>> Not clear when we initialize the buffer to \x01 - is this the qemu-io above?
> 
> Yes, when the qcow2 file was initially created.
> 
>>
>>
>>> +buf2 = b"\x03" * 1024 * 1024
>>> +h[1].pwrite(buf2, 0)
>>> +h[2].flush()
>>> +buf1 = h[0].pread(1024 * 1024, 0)
>>> +if buf1 == buf2:
>>> +  print("Flush appears to be consistent across connections")
>>>
>>
>> buf1 was the initial content, buf2 is the new content, but now we override
>> but1 to check that the right was flushed. It will be be better to use
>> different
>> names like inittial_data, updated_data, current_data.
> 
> Can do.
> 
>>
>> This block is the most important part of the test, showing that we can write
>> in one connection, flush in the second, and read the written block in the
>> third.
>> Maybe add a comment about this? I think it will help someone else trying
>> to understand what this part is trying to test.
> 
> Can do.
> 
>>> +{"execute":"block-export-add",
>>> +  "arguments":{"type":"nbd", "id":"w", "node-name":"n",
>>> +    "name":"", "multi-conn":"on", "writable":true}}
>>> +{"return": {}}
>>> +Flush appears to be consistent across connections
>>> +{"execute":"block-export-del",
>>> +  "arguments":{"id":"w"}}
>>> +{"return": {}}
>>> +{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
>>> "event": "BLOCK_EXPORT_DELETED", "data": {"id": "w"}}
>>> +{"execute":"nbd-server-stop"}
>>> +{"return": {}}
>>> +{"execute":"quit"}
>>> +{"return": {}}
>>> +{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
>>> "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
>>>
>>
>> Nothing about the contents here says anything about the actual test
>> except the "Flush appears..." line.
> 
> Yeah, it's a lot of QMP debugging (to show what commands were run in
> setting up the server), and less verbose in the nbdsh side.  Do I need
> to add more output during the nbdsh that uses multiple connections?
> 
>>
>>
>>> +*** done
>>> --
>>> 2.35.1
>>>
>>
>> Looks good, feel free to ignore the style comments and suggestion to rewrite
>> the test in python.
> 
> The style comments are nice, the rewriting is going to be harder for
> me (but I'll accept help).  At any rate, getting qemu-nbd to be
> feature-compatible may require a v3 anyway.
> 


-- 
Best regards,
Vladimir


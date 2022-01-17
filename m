Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1527D49043E
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 09:48:13 +0100 (CET)
Received: from localhost ([::1]:44776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9NgR-0006ey-Lm
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 03:48:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n9Ndx-0005J0-TP; Mon, 17 Jan 2022 03:45:38 -0500
Received: from mail-eopbgr80133.outbound.protection.outlook.com
 ([40.107.8.133]:65262 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n9Ndt-000654-5W; Mon, 17 Jan 2022 03:45:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O6JiSFKf+NwjD+ET6lNoD/qa0Vi5ZexnFSPS/Iuw78IKxMrA5MgMY814B6Ocj84AB6hq6TTOslqCb5T4zDs7oTOrE5u11xVC5FbTE+5Cs1tNu4b0qxJWm7ujq6M+/rOIQnWDXUFfphEDiW7umyKi5yQYmrAUrU7OAbBc/Ccn8YRV5PDoBSWCk81Vndk63CEO5NaylVxnYkWN2hYYuJs/p7hB7dDbr27zV1Hbf8lDS0fYFoaAGwnbJmqzfZMxdHgxi1utYDAeClx5CO/0w7IbaARAcmqWel5ahNkbFhiJMRDsF2UV0TZlFd3e5Ul28fjf7d0zRQQy9z7W8tZq7P2QwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H5/re7m4+hdpw3Sa8rhPpi3mQbMTRBhWdeALefr7390=;
 b=H+NwxQdIsLID8Mr4OMzquy/jc850iI+GEkKEofoZVla8PUTwlBGb0Fl2dVqGtARkSv4XTM+tLHXEgxGEgp1dpVcmmwnriRQczubTPi/7pZG5NbjwCdU5rctmRpu2EvKia4x/ojTr8udm2avlJIxWDH6inh4mvg1sYHxGaoIJJpbNI8+5JDr0MJvrcxwOFbefmRjfEgUfBuMrFYNYKQOSLDbJIu6Ic81zR94IMzmjn06i5hOgzkZ4x0eAD+TVA0joZjv9Ma1RbyJrJvQcybE5OmRKNTbt4/6hruJkgX1lLi97yVdhcoed2pQxvtNLtfbh/mZgZbY6/kaURJil7kanJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H5/re7m4+hdpw3Sa8rhPpi3mQbMTRBhWdeALefr7390=;
 b=sdpOxUxZpLhk3J6jqyDuScJDb0W6rKlhUDvn4+IzzdQ2U+XrefgyJ5j7/xkATtXsKi4Yty+nJ9mol9gdwQ508GywlBDNpQRUfOr7DeyObzHhBhWdgLnXzcKYwbKAXWsMylMbOaVKNklMCz7t3Ya2V/E10outbAnrEqAdKrwjdJo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM4PR0802MB2274.eurprd08.prod.outlook.com (2603:10a6:200:64::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Mon, 17 Jan
 2022 08:45:28 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b435:c0de:ef6b:5917]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b435:c0de:ef6b:5917%7]) with mapi id 15.20.4888.014; Mon, 17 Jan 2022
 08:45:28 +0000
Message-ID: <cef3a0e8-da08-f02b-8e9a-f12d963d18a8@virtuozzo.com>
Date: Mon, 17 Jan 2022 11:45:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 2/4] scripts/qapi/commands: gen_commands(): add
 add_trace_points argument
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>,
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe Mathieu Daude <philmd@redhat.com>
References: <20211223110756.699148-1-vsementsov@virtuozzo.com>
 <20211223110756.699148-3-vsementsov@virtuozzo.com>
 <CAFn=p-ZxtMggvUoGOviWQAt9XpBUSUQX9nOo=MRWyH4k-fpv=Q@mail.gmail.com>
 <CAFn=p-bnoCP2HcXvaokrspOOFG-AqiVD18t54F1=yjzNQn1OmA@mail.gmail.com>
 <Yd6yhi96nErPW/rV@stefanha-x1.localdomain>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <Yd6yhi96nErPW/rV@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0344.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::27) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fef8370f-16e3-4425-472f-08d9d995b645
X-MS-TrafficTypeDiagnostic: AM4PR0802MB2274:EE_
X-Microsoft-Antispam-PRVS: <AM4PR0802MB22743E7A871116C092E1B8D5C1579@AM4PR0802MB2274.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P3iGto6lBQ4Y+QI5mxHKLJQUbpNXd6tcP21RoqVkH4RCcLke7NJywC15CepGCWrMpn4t4WCx6kIw87Ya174au2t8Na2QRVmNe3cy8lQeS/A052fr7hH39QJLZKf5B3ZkvYWH4O0rMz5HpRcE4iEBzNnjR35/lVLXk1U2gMJEoLGF/E4sbVriIBUwho3wGjOT6ztX2C2ai2VvJslF5h+zR0t9T12Vk0gWXDClgGTd9p9l+DDfoedAuxSmiI8gf5r4UJdiG80AGn5YYk1psomRU1y5/4lw9hlZ6AhAhY+IBqVZt+QdbbdsaYcdDvm3ordV2l60v/YGBSpUn5XnUBDfqDC7N+HDqGyGBBJ3NoN1sk3l9IPCCD04JC2ywrRW/4AZSQBFCccwX3Q/EyolF9TRYO06HNUwXfoUt71MZlDStp74AmIu77rbsNok8Oz+sdcRa6bDut8JATouZH+3EowJ9fMhit5YVtJj/Vzdbcrf0FTu2htvT0AU0le1eQpQCaGk1CMyHHIlUYNeQx63xXOVgvMIWweX1p7O7iL1wvnUwfXo+EV7neJeoZP3P4fCT1Pg23tuO215nq0DtqO5FLH3CXSvSBOyFn580kg2sEid+lUF/QejYwW20Y5K7fMf7UZ1pV4B2XWVe4gEU+TezIBEpoK95z++9206aEWI2qo6EN4dSxtLbn2a4zMubSt/GsMg0Er077PYarIbvIQkk/g3KlMpab3X0XA0Fiaob5UBU0vB3CEu+F3xWBV0KsEGHjqR0GiTYZ4MD50ZLiv2jJk9xA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(2906002)(86362001)(38350700002)(31686004)(36756003)(38100700002)(508600001)(26005)(8936002)(6486002)(186003)(66476007)(66556008)(31696002)(53546011)(66946007)(6506007)(83380400001)(8676002)(52116002)(5660300002)(7416002)(54906003)(110136005)(6512007)(316002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUNYYW0xUndTU1I4TGhrUXdXR2ZIWWtVUTUvSGcyN3N0NG5XVXBrTDZpK2U0?=
 =?utf-8?B?R2RhRHRvUWR5VTY2aThRRFFyRTZqWUExSUpSR21xbXR5b3JCbXBKcVFnSjJq?=
 =?utf-8?B?YlFTRTAzNXVSOHdOL25LYjRxdFRDc2xnNDJuRjNIL1ZaU2JEQzAzZXVXb2hD?=
 =?utf-8?B?VjZCUVVvdE8zaTFmMHU4MjV0ZzFTWHoxYjJGcGNuSGo2QjB2azBWYkIzbExF?=
 =?utf-8?B?aDJneHFqZm5OOFVTYWxHV1dJaWZOR0VpQmlzcU52RVlpLzlFZnYrKzJwcDlY?=
 =?utf-8?B?ejdzT1ozY0xhNlFOeXdDZnNsdjh2SnlUamx6ck1MK2VwNDg5UUJtWk1sS2VJ?=
 =?utf-8?B?ZEtaUEpHMlJlMWUyNzVQbDNWTmsxeVpXWDArSWd2aWJUaGd6ZC85bDFmZDJ0?=
 =?utf-8?B?NGVwY1NFcmYzRVBpdEZBWFV3VmtkT1dXcTRXUDFkbVJpaFJPdnA5M0lCeFNn?=
 =?utf-8?B?TW1hMWg5NWs0R2ExVVByVUtnZmJvNXlKZUIyYUFVQWpxT3VCT3BJNUVNdjdL?=
 =?utf-8?B?cWlJWTdPNS9WZW5aWGl3RVk2cUNCWDNEOGVSV3grRnZZUkFPcUhyaDZTMS9n?=
 =?utf-8?B?MXBmaXcyck85LzdwU1lCdm00VVQ3eUVKTGZnWTk4blNRandPVjVFUU5MRFNE?=
 =?utf-8?B?c1BsT0tUKzQ3RlN2SDlqdFYzQmpDSDZOcWUzbnEzNGRzV1RPTE45NmovNi9E?=
 =?utf-8?B?bDM5cmp0aVRRdWVJSTJSU0tDeUk4ZC9xbG1jZnBuSStjOHNjU2V2UDZRZVlr?=
 =?utf-8?B?ME5NMWhvWUFUWXoxNmM1NGlKVnhKMDgvbGxBR1RrelhxSDR0VFkyWFBoUExx?=
 =?utf-8?B?R0lreUMvNFpQWmFGSGlRbTJhVVQrVXZoR1Jqd1paSXVROEhYV3hqekF6bEpF?=
 =?utf-8?B?NlFNNWZYN3hVMjJpbXZuVXNXRy82V2dLN05PNHN5dzdIaWVyN3JtRExKZEFQ?=
 =?utf-8?B?YXIrNk1lb3FQRW5aOEtYVWU2THR5d2NPVENrbEZUbkxTT2FyQ2JUa0ZIWlRt?=
 =?utf-8?B?a2hzcW5FV1ZLdHBPTnJwOE1hV1JDdFYwcTFaQlAzdGZkRmZzSFdEOUZZNXRT?=
 =?utf-8?B?MVNZV2g2a1ZrZmZWcW5jSEplVnZ2Z1VKN1dhQW5penJ4VGV4eUtxelk2MGd6?=
 =?utf-8?B?TzU5MDluSld1YTFOMUpEdXdmNkdaUjFja1JuNitPbHUrd1lwRWJ0MlBiV3VO?=
 =?utf-8?B?L1puMHZTY0tIUkF5Mm5ZeTF2STZuK1JnQzBqd1ZacDFkSWhRUFZRa1pOcm01?=
 =?utf-8?B?c09sWWViTXZsTGgvMGJja0ZHbVROQmlFV2hHUkNzclViczNVTjBXbnVKVFpm?=
 =?utf-8?B?ZWNNazEwNzgvVVdKRE1hcjlROUZ3V2g3dzJBaHdPaW85Y1RBS25OV0Ezd3Va?=
 =?utf-8?B?dHlYdmt2QkF3WDY1QkhFeVFXS240QksvTFFIczZ1bEh3VVBGVG94UVZuamY0?=
 =?utf-8?B?ejV5dmR0SEttK0FCbnRrd1JJT1pUL2FPdTlIMlVlRnFPQ2hzQXluc3ZibVNu?=
 =?utf-8?B?M284U3diMUg1MHdGZDAvbkNUQmxkNm5mQ0Y5TnZNeit5cEJ3Slp4SjJoRmZ4?=
 =?utf-8?B?TVVPcG5rVmFWU3czZmMyZFNtYmdmNlV0S3p1Q1lNVjJZbTlpRko5VWFjOU9a?=
 =?utf-8?B?T3pHMndoNnI5L2JtZURtV0J0MzlPbi82L2hTQm5XOWkxSDZDWGJkRUNqcDRj?=
 =?utf-8?B?Y1dwd1hGaWVnODAvQzBvTXkrekF5cUJUd1ZpZ1E2VlB1d0NadnFxSCtISWtu?=
 =?utf-8?B?cy9kaytsN0YxQmpQM1M3L1lWVEVYYzdTbmtmK0FYWkloTUV3ZjFtZkhONWk5?=
 =?utf-8?B?am1WREJJbkJNbUQ3SFJMY3MrSFB5S2dzbW94ZTZ3anpCMkhqN0wyaG1EcWJi?=
 =?utf-8?B?S0MydmNsMnFFUmFybjUvT3I1OFpPaFg5Mmo5UitmdFhRT0EvenRtdjliR3RS?=
 =?utf-8?B?eWc5ZWlvbnA0K1FiNEozTEpjaGIwak1GeS9zTnJDcWFrMmk1ZTNJTXdEazAx?=
 =?utf-8?B?M1JGaHVNRERadGlQbFo0SzNmeHVrZ1VzMVdVRVg0ejVZVzA1M09MVWNhSlhI?=
 =?utf-8?B?UHJZN0VLRW5xb0k5ZzhJRnIzZmcyOENrelNGclJLVFhxTHFIMXkxQmpyREUv?=
 =?utf-8?B?eXJqb2Vmc3NvUXJHME1SRC9MaDJuaEE0NEZ3Wm1pUzlNVGJ2LzgxMHN2NUl4?=
 =?utf-8?B?WUFFM2hnRXBqWE5GVUJ5ZW5IcXcxSGFucG56elFDTkRRZTZRSzY4MlBHUjM3?=
 =?utf-8?Q?JqHMFzIityY5ao7Hyt3HrBWz1l9JHq56BolLDlkYGM=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fef8370f-16e3-4425-472f-08d9d995b645
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 08:45:28.2702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: djEDaa/kXJtrx1/xqxxLkKrMZOXk36Xf+Kh+kG07Sz6K70Rj+4UrQNdJkfVLxDgAYBtFe+jobgEqDYSl1HhnG3q91NSSjVGimMUnGFSHKWk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2274
Received-SPF: pass client-ip=40.107.8.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

12.01.2022 13:50, Stefan Hajnoczi wrote:
> On Tue, Jan 11, 2022 at 07:32:52PM -0500, John Snow wrote:
>> On Tue, Jan 11, 2022 at 6:53 PM John Snow <jsnow@redhat.com> wrote:
>>>
>>> On Thu, Dec 23, 2021 at 6:08 AM Vladimir Sementsov-Ogievskiy
>>> <vsementsov@virtuozzo.com> wrote:
>>>>
>>>> Add possibility to generate trace points for each qmp command.
>>>>
>>>> We should generate both trace points and trace-events file, for further
>>>> trace point code generation.
>>>>
>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>> ---
>>>>   scripts/qapi/commands.py | 84 ++++++++++++++++++++++++++++++++++------
>>>>   1 file changed, 73 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
>>>> index 21001bbd6b..9691c11f96 100644
>>>> --- a/scripts/qapi/commands.py
>>>> +++ b/scripts/qapi/commands.py
>>>> @@ -53,7 +53,8 @@ def gen_command_decl(name: str,
>>>>   def gen_call(name: str,
>>>>                arg_type: Optional[QAPISchemaObjectType],
>>>>                boxed: bool,
>>>> -             ret_type: Optional[QAPISchemaType]) -> str:
>>>> +             ret_type: Optional[QAPISchemaType],
>>>> +             add_trace_points: bool) -> str:
>>>>       ret = ''
>>>>
>>>>       argstr = ''
>>>> @@ -71,21 +72,65 @@ def gen_call(name: str,
>>>>       if ret_type:
>>>>           lhs = 'retval = '
>>>>
>>>> -    ret = mcgen('''
>>>> +    qmp_name = f'qmp_{c_name(name)}'
>>>> +    upper = qmp_name.upper()
>>>> +
>>>> +    if add_trace_points:
>>>> +        ret += mcgen('''
>>>> +
>>>> +    if (trace_event_get_state_backends(TRACE_%(upper)s)) {
>>>> +        g_autoptr(GString) req_json = qobject_to_json(QOBJECT(args));
>>>> +        trace_%(qmp_name)s("", req_json->str);
>>>> +    }
>>>> +    ''',
>>>> +                     upper=upper, qmp_name=qmp_name)
>>>> +
>>>> +    ret += mcgen('''
>>>>
>>>>       %(lhs)sqmp_%(c_name)s(%(args)s&err);
>>>> -    error_propagate(errp, err);
>>>>   ''',
>>>>                   c_name=c_name(name), args=argstr, lhs=lhs)
>>>> -    if ret_type:
>>>> -        ret += mcgen('''
>>>> +
>>>> +    ret += mcgen('''
>>>>       if (err) {
>>>> +''')
>>>> +
>>>> +    if add_trace_points:
>>>> +        ret += mcgen('''
>>>> +        trace_%(qmp_name)s("FAIL: ", error_get_pretty(err));
>>>> +''',
>>>> +                     qmp_name=qmp_name)
>>>> +
>>>> +    ret += mcgen('''
>>>> +        error_propagate(errp, err);
>>>>           goto out;
>>>>       }
>>>> +''')
>>>> +
>>>> +    if ret_type:
>>>> +        ret += mcgen('''
>>>>
>>>>       qmp_marshal_output_%(c_name)s(retval, ret, errp);
>>>>   ''',
>>>>                        c_name=ret_type.c_name())
>>>> +
>>>> +    if add_trace_points:
>>>> +        if ret_type:
>>>> +            ret += mcgen('''
>>>> +
>>>> +    if (trace_event_get_state_backends(TRACE_%(upper)s)) {
>>>> +        g_autoptr(GString) ret_json = qobject_to_json(*ret);
>>>> +        trace_%(qmp_name)s("RET:", ret_json->str);
>>>> +    }
>>>> +    ''',
>>>> +                     upper=upper, qmp_name=qmp_name)
>>>> +        else:
>>>> +            ret += mcgen('''
>>>> +
>>>> +    trace_%(qmp_name)s("SUCCESS", "");
>>>> +    ''',
>>>> +                         qmp_name=qmp_name)
>>>> +
>>>>       return ret
>>>>
>>>>
>>>> @@ -122,10 +167,14 @@ def gen_marshal_decl(name: str) -> str:
>>>>                    proto=build_marshal_proto(name))
>>>>
>>>>
>>>> +def gen_trace(name: str) -> str:
>>>> +    return f'qmp_{c_name(name)}(const char *tag, const char *json) "%s%s"\n'
>>>> +
>>>>   def gen_marshal(name: str,
>>>>                   arg_type: Optional[QAPISchemaObjectType],
>>>>                   boxed: bool,
>>>> -                ret_type: Optional[QAPISchemaType]) -> str:
>>>> +                ret_type: Optional[QAPISchemaType],
>>>> +                add_trace_points: bool) -> str:
>>>>       have_args = boxed or (arg_type and not arg_type.is_empty())
>>>>       if have_args:
>>>>           assert arg_type is not None
>>>> @@ -180,7 +229,7 @@ def gen_marshal(name: str,
>>>>       }
>>>>   ''')
>>>>
>>>> -    ret += gen_call(name, arg_type, boxed, ret_type)
>>>> +    ret += gen_call(name, arg_type, boxed, ret_type, add_trace_points)
>>>>
>>>>       ret += mcgen('''
>>>>
>>>> @@ -238,11 +287,12 @@ def gen_register_command(name: str,
>>>>
>>>>
>>>>   class QAPISchemaGenCommandVisitor(QAPISchemaModularCVisitor):
>>>> -    def __init__(self, prefix: str):
>>>> +    def __init__(self, prefix: str, add_trace_points: bool):
>>>>           super().__init__(
>>>>               prefix, 'qapi-commands',
>>>>               ' * Schema-defined QAPI/QMP commands', None, __doc__)
>>>>           self._visited_ret_types: Dict[QAPIGenC, Set[QAPISchemaType]] = {}
>>>> +        self.add_trace_points = add_trace_points
>>>>
>>>>       def _begin_user_module(self, name: str) -> None:
>>>>           self._visited_ret_types[self._genc] = set()
>>>> @@ -261,6 +311,15 @@ def _begin_user_module(self, name: str) -> None:
>>>>
>>>>   ''',
>>>>                                commands=commands, visit=visit))
>>>> +
>>>> +        if self.add_trace_points and c_name(commands) != 'qapi_commands':
>>>> +            self._genc.add(mcgen('''
>>>> +#include "trace/trace-qapi.h"
>>>> +#include "qapi/qmp/qjson.h"
>>>> +#include "trace/trace-%(nm)s_trace_events.h"
>>>> +''',
>>>> +                                 nm=c_name(commands)))
>>>> +
>>>>           self._genh.add(mcgen('''
>>>>   #include "%(types)s.h"
>>>>
>>>> @@ -322,7 +381,9 @@ def visit_command(self,
>>>>           with ifcontext(ifcond, self._genh, self._genc):
>>>>               self._genh.add(gen_command_decl(name, arg_type, boxed, ret_type))
>>>>               self._genh.add(gen_marshal_decl(name))
>>>> -            self._genc.add(gen_marshal(name, arg_type, boxed, ret_type))
>>>> +            self._genc.add(gen_marshal(name, arg_type, boxed, ret_type,
>>>> +                                       self.add_trace_points))
>>>> +            self._gent.add(gen_trace(name))
>>>>           with self._temp_module('./init'):
>>>>               with ifcontext(ifcond, self._genh, self._genc):
>>>>                   self._genc.add(gen_register_command(
>>>> @@ -332,7 +393,8 @@ def visit_command(self,
>>>>
>>>>   def gen_commands(schema: QAPISchema,
>>>>                    output_dir: str,
>>>> -                 prefix: str) -> None:
>>>> -    vis = QAPISchemaGenCommandVisitor(prefix)
>>>> +                 prefix: str,
>>>> +                 add_trace_points: bool) -> None:
>>>> +    vis = QAPISchemaGenCommandVisitor(prefix, add_trace_points)
>>>>       schema.visit(vis)
>>>>       vis.write(output_dir)
>>>> --
>>>> 2.31.1
>>>>
>>>
>>> I looked at Stefan's feedback and I want to second his recommendation
>>> to use _enter and _exit tracepoints, this closely resembles a lot of
>>> temporary debugging code I've written for jobs/bitmaps over the years
>>> and find the technique helpful.
>>>
>>> --js
>>>
>>> (as a tangent ...
>>>
>>> I wish I had a much nicer way of doing C generation from Python, this
>>> is so ugly. It's not your fault, of course. I'm just wondering if the
>>> mailing list has any smarter ideas for future improvements to the
>>> mcgen interface, because I find this type of code really hard to
>>> review.)
>>
>> Come to think of it, we could use a framework that was originally
>> designed for HTML templating, but for C instead. Wait! Don't close the
>> email yet, I have some funny things to write still!!
>>
>> Downsides:
>> - New template language
>> - Complex
>>
>> Pros:
>> - Easier to read
>> - Easier to review
>> - Avoids reinventing the wheel
>> - Doesn't even technically add a dependency, since Sphinx already
>> relies on Jinja ...
>> - *Extremely* funny
>>
>> As an example, let's say we had a file
>> "scripts/qapi/templates/qmp_marshal_output.c" that looked like this:
>> ```
>> static void qmp_marshal_output_{{c_name}}(
>>      {{c_type}} ret_in,
>>      QObject **ret_out,
>>      Error **errp
>> ) {
>>      Visitor *v;
>>
>>      v = qobject_output_visitor_new_qmp(ret_out);
>>      if (visit_type_{{c_name}}(v, "unused", &ret_in, errp)) {
>>          visit_complete(v, ret_out);
>>      }
>>      visit_free(v);
>>      v = qapi_dealloc_visitor_new();
>>      visit_type_{{c_name}}(v, "unused", &ret_in, NULL);
>>      visit_free(v);
>> }
>> ```
>>
>> We could use Jinja to process it from Python like this:
>>
>> ```
>> import os
>> from jinja2 import PackageLoader, Environment, FileSystemLoader
>>
>> env = Environment(loader = FileSystemLoader('./templates/'))
>> template = env.get_template("qmp_marshal_output.c")
>> rendered = cgen(template.render(
>>      c_name = "foo",
>>      c_type = "int",
>> ))
>>
>> print(rendered)
>> ```
>>
>> You'd get output like this:
>>
>> ```
>> static void qmp_marshal_output_foo(
>>      int ret_in,
>>      QObject **ret_out,
>>      Error **errp
>> ) {
>>      Visitor *v;
>>
>>      v = qobject_output_visitor_new_qmp(ret_out);
>>      if (visit_type_foo(v, "unused", &ret_in, errp)) {
>>          visit_complete(v, ret_out);
>>      }
>>      visit_free(v);
>>      v = qapi_dealloc_visitor_new();
>>      visit_type_foo(v, "unused", &ret_in, NULL);
>>      visit_free(v);
>> ```
>>
>> Jinja also supports conditionals and some other logic constructs, so
>> it'd *probably* apply to most templates we'd want to write, though
>> admittedly I haven't thought through if it'd actually work everywhere
>> we'd need it, and I am mostly having a laugh.
>>
>> ...OK, back to work!
> 
> I agree that mcgen string formatting is very hard to review.
> 
> I'm not sure if it's possible to separate the C templates into large
> chunks that are easy to read though. If there are many small C templates
> then it's hard to review and I think that's the core problem, not the
> string formatting/expansion mechanism (%(var)s vs Python {var} vs jinja2
> {{var}}).
> 
> If we could stick to Python standard library features instead of jinja2
> that would be nice because while jinja2 is powerful and widely-used,
> it's probably a bit too powerful and adds complexity/boilerplate that
> could be overkill in this situation.
> 
> Stefan
> 

I think that conversion to Python f-strings would be a good start: not very invasive, no extra dependencies, but may probably solve 60-80 % of the problem.

I thought about different templating techniques when creating scripts/block-coroutine-wrapper.py, but finally it just utilizes f-string (look at line 119 for example).


-- 
Best regards,
Vladimir


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B151632B0F
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 18:33:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxAfF-0001QW-IX; Mon, 21 Nov 2022 12:33:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jfehlig@suse.com>)
 id 1oxAet-0001Pq-TX; Mon, 21 Nov 2022 12:32:40 -0500
Received: from mail-db8eur05on20605.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::605]
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jfehlig@suse.com>)
 id 1oxAer-0005UN-JK; Mon, 21 Nov 2022 12:32:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n1E+B78+YUxe/wQgOsDjgFWLH7JO4V0/dCS+fyboq2t/wcFCdfGe2XkCidU3vnxP8gtyi+T9k4Cqpwu2VNArDyDjGyJkZcziRWxuWkJ9DXLJkQqassFsxygg1GOxe7Fp9tbwvaWrWPsdZR9O/OA4IXizAMnhuVrutVOejfoD+pFQTNFCujJhOcMN897nUV4iCqqkph2mcmBDExwlk4znMwuQGaIh614XwDtzXQv35uQdKE+UaIG6thqXzha0hAOV6hfhyv2FrtR4crw/Bpf0SsBFp9KheWdYGLMFruzlrbu2/5BUn14c/RDl+4HU5RGdoITOBUvkog7IzZmcmnzvmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wCjBknsW2GzpR84up9CSyO5ClXyHgNBst+e6zG0wZxA=;
 b=dnA0kD0LADpQpxRl8O94dpwpzInUJ/JEFh39YKS+thD1gHz+KfWe8LGwK3Iq9nCgRAEJWGDUE1NgxapeQfhWKYYGHbOn+lS84vdZyP2C1fPoFeaq3vXLYTl4+yuGCOn4DzWnGVDe2ZJafc6zLM3bKkXuBAkqYi8ykoGNkS3Alee6ObY7AVDwTwAdo9a8TwbDfM0/cdLWA7prTZYvfUZ2YwF+mPMcwkce5DUpXqvIHwZOgemkO1VYL/0gJnApXzcA19rs62rm8v/n6lFll2i7nRKpQg01vcU4D3sUherlzAWQAgjhH55oUMqWbshjNUxf3Rb8qD/stMqMy4n7ED/QFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wCjBknsW2GzpR84up9CSyO5ClXyHgNBst+e6zG0wZxA=;
 b=2yDarpYIpRb6tVW8mpgfEFmZB1+nYYxO6HoerBv+MMSHmqd00l9ZXTgYKr7wsxUJHLPp/nIqVR6wK31J6VP/kxaxjl0EAG6gLWPvgMZt0TIkqjeJQjNVrJvVzZnBa6wmlfdwKJbf59s3DG3HUEY9pR3BJvlGZorvy0WzLy38RZIEbxA3e11o+bEGGoudsx0thO9X1GYKIQPXOZE5+0dxW6lEKgXErkA5kewDsumYk/FupHjIXyck0iHE5apy5ll4A4ZgUy9ltkDt33QhMey5pBsZ0w+ZUuEt1LKrpP5KIXswZF9Ulex4U8YoTT4gMTDveKppah6M0UzbmlEy1mrJ2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB4899.eurprd04.prod.outlook.com (2603:10a6:208:c5::16)
 by DBBPR04MB7706.eurprd04.prod.outlook.com (2603:10a6:10:208::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Mon, 21 Nov
 2022 17:32:31 +0000
Received: from AM0PR04MB4899.eurprd04.prod.outlook.com
 ([fe80::c5dc:fe50:9918:744f]) by AM0PR04MB4899.eurprd04.prod.outlook.com
 ([fe80::c5dc:fe50:9918:744f%4]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 17:32:31 +0000
Message-ID: <312ea4b1-905a-91ba-bf75-a0cef00849b6@suse.com>
Date: Mon, 21 Nov 2022 10:32:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] gtk: disable GTK Clipboard with a new option
 'gtk_clipboard'
Content-Language: en-US
To: Claudio Fontana <cfontana@suse.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org
References: <20221108162324.23010-1-cfontana@suse.de>
 <980e2701-5271-8977-c574-f5b64e80e02b@suse.com>
 <2ebe3466-bdc2-8c31-46ee-c2d958d96944@suse.de>
From: Jim Fehlig <jfehlig@suse.com>
In-Reply-To: <2ebe3466-bdc2-8c31-46ee-c2d958d96944@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0148.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::9) To AM0PR04MB4899.eurprd04.prod.outlook.com
 (2603:10a6:208:c5::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB4899:EE_|DBBPR04MB7706:EE_
X-MS-Office365-Filtering-Correlation-Id: 2184fd50-495a-4bf1-00ad-08dacbe65e7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VXiJhwr+Ah3QuAWVVx3yM9GrHaybps0q3CLwXCfIqlb02OZ55KMxy7385VNLt6HCOSJnm350BxnxbYHgjv37hedgxvlmRWxLF+PhB5P+5Ap4RgVV865EklyUlIm1/RtDX4SltNswCcflxRtpWBcmTEASRfgNnLuxK8rt9vM+lipLNCPB3GIz1fPUQapXv4EiucbLyp1hC6DmtW569cQ0kGJXyvWOD4JWdNzCEVnmm/XMOPPykSsGASbNBENs0SV/pWRDogscpEw77ip5kOyGXYeU3lpXsNXycTH6h059WmnbV4FZwYVHpVSsja009pAfVKcUNmZ+gJ0Deu3mrFYeHeku4KT0yVZVS+XCzhbQCJhZJR9GC9GgMqGJXJi+izg5OPo8hVESxoe/wk17T/G7Wk2NjCxTIDxjLlM26wLiBTqV8FbYWrFxfaLJMF4J0g/L8uMLUg+c7OPklgQxctdbJVpPhp+PB5pijz2SmfnO3HjCjJc03B81jcUqbPzsy2+Pjo2DhhCU9EwbHKkv4YyHV0lsPMT2qOYxKMvRcDrNX7lmi1UQFCWaIIklOmDf4h6bTjN13CpOmeEK2VrwBliS9Mj/b5ojVcMmV3ePUncAf607Zl8EI8eD4eM/tUdXAZ6+pYBYNZrjBm1B8aeZu+0HYBEVff+0qhBnNeN3cs+pC8w314V+sYRiCSOlONTFFz4H3MP7wMtVTxnwvMN7jzEQ50q3mK8+tLhD4fN4kSvRDCZ7mYXZE8pVnXflmL0ZwLj7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB4899.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(396003)(136003)(376002)(346002)(39860400002)(451199015)(38100700002)(31696002)(86362001)(6486002)(966005)(478600001)(6666004)(8936002)(6506007)(66476007)(66946007)(66556008)(4326008)(8676002)(316002)(41300700001)(5660300002)(53546011)(186003)(110136005)(2906002)(2616005)(6512007)(83380400001)(26005)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHF5TDd4dGs3RmFVWHdNWTQwUjEvRTFtMkNXV3pMK051ZXBpaHF4WWJmK3dj?=
 =?utf-8?B?REJ2UUdXMkVHZDJsR2RpNXFWeWZFUkkzNU4zSjBsVFZacXhUWEl0eEMrRElQ?=
 =?utf-8?B?UHFrcExVWVZDWnpLVGl3Ly9XZXhTQTN5b3FLNnNxaGwwTzZYa3dNSTFpM0Zj?=
 =?utf-8?B?dWpoajhvNU5KR3ltbCtwUXdad2pNaExvOW12bkd3Mmp0NFZUWHJYcDA0Q2JC?=
 =?utf-8?B?ekovbzZzb25zNnJUbVl2MVMvOWE1TGpjRnRvd0ZZOGhBcjJPUU1VTzhZTytT?=
 =?utf-8?B?QmpOV05ZRHFCRGQ1ZzErVlk4WElIMXlsL1U3ZUNYYTRrbll2L0srV2tncy9I?=
 =?utf-8?B?cFRBY29hRm93V1NlU0ZZeG9NSDhzYjR1aUZxMFBlWm5HVWY3VHZHTE1La25W?=
 =?utf-8?B?WVZlV3RDc0loaVM1dG51OHdUYkRqWTl4QWtXUHRyb1RDZjloYnI1SHd0R0Vq?=
 =?utf-8?B?OGwrMURoaHMzSTZ5Q0ZKb3dLY05ZRlhFMHUvVVZ0V3FFZkgvMXVRMWQrVjJ0?=
 =?utf-8?B?cHlmOXUrazgzbEFHYzR2Q0lwZExWOEFxQ3JnOFpsYnVZbkgxWkdGMWZGZTVQ?=
 =?utf-8?B?K1VpMFVrZjJBaU9Ec0lvaStrd0Q1VGR4Z3Z1QUZLVHQ4NFNOWm5zalNjVkh0?=
 =?utf-8?B?cDBIOTU3VkxKVlBZdlRObE94KzJSQ2FjME5ld1BaRHRaYThHN2t1MUtLb1hu?=
 =?utf-8?B?ZER1d21WQzdJY2dWNWxhd3ZlS3QxeWtJZ2d3cHVmdWs0RklsdUpGSXNhWnl1?=
 =?utf-8?B?UkJMSGFOMU5QUGdWSHNxSUhKNWpITEE5YjE2VitCdWlQOGNDNWh6Q0FsZHZ5?=
 =?utf-8?B?QVd4MWRXemtJSU9vSTlFQTg4S3o5b25kVzFpWVdhR21FdDhhNGhlek5vL3A1?=
 =?utf-8?B?MGoyd0lmYXVvUXdhWkhONjBlZ1hKbEc0dTRHQmdrZWt4SkpMbU5CcjBwMzRR?=
 =?utf-8?B?QTNEZmlnTGtaUUZibS9RRDdMbCtrTU9HVEd1d0NUUzJPU0hzeHpGTnhOU0dm?=
 =?utf-8?B?MXpveVRZazJiY3dwRUQwOVh1cjQ1MUxEemNYeUtqVmZGQVU5aHhvWWtPRjhX?=
 =?utf-8?B?M0FROEtDaGFVcGVjcUg5Qkk2NG9wUUkwcER5cHpMNGVjY205ODZjVlpmVzdG?=
 =?utf-8?B?WFp0eVh6R3BTZWFZajg5S2ZSVEhjQlFCY0dhVGtsSi9YQmQ4N3hkMExNN3N5?=
 =?utf-8?B?dUhmNWpLalg1MVkxbGhyS0ttZlBnc0VDTFVsc3RyRXVHaGxmSThzT1MxZVZU?=
 =?utf-8?B?UGFxZkRHeGREOGhZRm1DNFhRdU1yYTZFdkJ0aTRlMHdzUnA5WjBoZmhXcVhi?=
 =?utf-8?B?bytoNm80dGpXY1lUQzJmeHBTT2luc042RWhWS1hkQmhOZUNkN3ROamdaYTlV?=
 =?utf-8?B?QTZmUXZFUm5aczB6cjFMMUVPN0NZRUZpNXFKeDgvcjUrenZNUkZXK3dLWit4?=
 =?utf-8?B?VEJsN0FlRHBFcDBQYTRmWjVzOWhwK2FGK2ZiVC9rUGpuSUx5TXdlUHR6cmJy?=
 =?utf-8?B?aEZMTm1KWVdHZU9KRXpOMllDN1NlckozY1NTTy9oZjB2UlNVRHFxTEJGcURr?=
 =?utf-8?B?WlQ5bVgrYjhSSE8vNnh2cVJ6dUlEaFdCSEFBZnFJM1V1WVpKQ1QyanNrZ3ZP?=
 =?utf-8?B?UkdZM2UrMkxZYzhpdkRtVFJYTy82WUNCYVdGQ01xL0lIazVESUYzdHdKdm1p?=
 =?utf-8?B?R2xQVE1raURUdFhDWXVTKzhnejNIYU1TWXFtYWx5SFd3K0FhZzllTi9rY1U5?=
 =?utf-8?B?TXpZUG9OdXJvV28zZFY5QW5qUWtIVHNnekJIT2trUlpQeDRzSTBWTDhUUnpl?=
 =?utf-8?B?Snl4Y243QXhKM1ZnVWszR1lid2dhQmdBQlRMNzMrQzd3aXp1TDZ5bmp0Zis2?=
 =?utf-8?B?cEJHZVdJM3MyUTNzZEhvbUlnWE9UenByOU85M3JlNkdoTWtlQUxYZnZsdmJO?=
 =?utf-8?B?bFZvTXBFZHBMRGpLdUhZRFVWaHRiVEE1WlkxVVNOdmIwQU5JUGJMUkVvU1Fy?=
 =?utf-8?B?dURJOGRsVGE5ay80VWVNL0Jhbm15S0FaYjhNbWFFR2F3Yyt5dUxRL05hbVBI?=
 =?utf-8?B?dVpaQ3FSbGJpNHh0RHBXWHdHUWpkYjhLWm1Kd1huZnRSWHVnaGdJSzlCK1E1?=
 =?utf-8?Q?1qKH+w2eE6t0+PGgghZnlQyF+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2184fd50-495a-4bf1-00ad-08dacbe65e7c
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB4899.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 17:32:31.7104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ih0FBQ4oMkXEcGN+mnLKBMDDTZMiv/6pkuxhgtuCnh8j7NhZ6+p36L1UP/o8vhhRJ6Pf5h/7nhTdKGl0BCYxHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7706
Received-SPF: pass client-ip=2a01:111:f400:7e1a::605;
 envelope-from=jfehlig@suse.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/21/22 04:24, Claudio Fontana wrote:
> On 11/18/22 23:26, Jim Fehlig wrote:
>> I should make myself useful around here on occasion when items are within my
>> skill set. But I already struggle to find time for that in the libvirt community
>> :-).
> 
> Thanks for taking a look,
>>
>> On 11/8/22 09:23, Claudio Fontana wrote:
>>> The GTK Clipboard implementation may cause guest hangs.
>>>
>>> Therefore implement a new configure switch --enable-gtk-clipboard,
>>> disabled by default, as a meson option.
>>>
>>> Regenerate the meson build options to include it.
>>>
>>> The initialization of the clipboard is gtk.c, as well as the
>>> compilation of gtk-clipboard.c are now conditional on this new option
>>> to be set.
>>>
>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1150
>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>> ---
>>>    meson.build                   | 9 +++++++++
>>>    meson_options.txt             | 7 +++++++
>>>    scripts/meson-buildoptions.sh | 3 +++
>>>    ui/gtk.c                      | 2 ++
>>>    ui/meson.build                | 5 ++++-
>>>    5 files changed, 25 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meson.build b/meson.build
>>> index 1d448272ab..8bb96e5e8c 100644
>>> --- a/meson.build
>>> +++ b/meson.build
>>> @@ -1243,6 +1243,8 @@ if nettle.found() and gmp.found()
>>>    endif
>>>    
>>>    
>>> +have_gtk_clipboard = false
>>
>> Can this be initialized with get_option(), instead of the two calls below?
> 
> Yes, I think we can initialize it once here.
> 
>>
>>> +
>>>    gtk = not_found
>>>    gtkx11 = not_found
>>>    vte = not_found
>>> @@ -1258,12 +1260,18 @@ if not get_option('gtk').auto() or have_system
>>>                            kwargs: static_kwargs)
>>>        gtk = declare_dependency(dependencies: [gtk, gtkx11])
>>>    
>>> +    have_gtk_clipboard = get_option('gtk_clipboard').enabled()
>>> +
> 
> ... I'll remove this...
> 
>>>        if not get_option('vte').auto() or have_system
>>>          vte = dependency('vte-2.91',
>>>                           method: 'pkg-config',
>>>                           required: get_option('vte'),
>>>                           kwargs: static_kwargs)
>>>        endif
>>> +  else
>>> +    if get_option('gtk_clipboard').enabled()
>>> +      error('GTK clipboard requested, but GTK not found')
>>> +    endif
> 
> ... and simplify this to an
> 
>        elif have_gtk_clipboad
> 
> 
>>>      endif
>>>    endif
>>>    
>>> @@ -1842,6 +1850,7 @@ if glusterfs.found()
>>>    endif
>>>    config_host_data.set('CONFIG_GTK', gtk.found())
>>>    config_host_data.set('CONFIG_VTE', vte.found())
>>> +config_host_data.set('CONFIG_GTK_CLIPBOARD', have_gtk_clipboard)
>>>    config_host_data.set('CONFIG_LIBATTR', have_old_libattr)
>>>    config_host_data.set('CONFIG_LIBCAP_NG', libcap_ng.found())
>>>    config_host_data.set('CONFIG_EBPF', libbpf.found())
>>> diff --git a/meson_options.txt b/meson_options.txt
>>> index 66128178bf..4b749ca549 100644
>>> --- a/meson_options.txt
>>> +++ b/meson_options.txt
>>> @@ -219,6 +219,13 @@ option('vnc_sasl', type : 'feature', value : 'auto',
>>>           description: 'SASL authentication for VNC server')
>>>    option('vte', type : 'feature', value : 'auto',
>>>           description: 'vte support for the gtk UI')
>>> +
>>> +# GTK Clipboard implementation is disabled by default, since it may cause hangs
>>> +# of the guest VCPUs. See gitlab issue 1150:
>>> +# https://gitlab.com/qemu-project/qemu/-/issues/1150
>>> +
>>> +option('gtk_clipboard', type: 'feature', value : 'disabled',
>>> +       description: 'clipboard support for the gtk UI (EXPERIMENTAL, MAY HANG)')
>>
>> 'boolean' seems a more appropriate type, but I see 'feature' is common practice
>> with these various options. Is gtk_clipboard marked experimental elsewhere? Is
>> there a need for the warning text?
> 
> I did not find anything else to update about the GTK UI docs, at least in docs/ .
> 
> The only other place that comes to mind is about/deprecated.rst ,
> but that would be about deprecating the feature , not sure we want to do that.
> 
> In terms of whether we should warn about the experimental nature of the feature at all,
> I think so, as it can hang QEMU.
> 
>>
>>>    option('xkbcommon', type : 'feature', value : 'auto',
>>>           description: 'xkbcommon support')
>>>    option('zstd', type : 'feature', value : 'auto',
>>> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
>>> index 2cb0de5601..a542853bfd 100644
>>> --- a/scripts/meson-buildoptions.sh
>>> +++ b/scripts/meson-buildoptions.sh
>>> @@ -93,6 +93,7 @@ meson_options_help() {
>>>      printf "%s\n" '  glusterfs       Glusterfs block device driver'
>>>      printf "%s\n" '  gnutls          GNUTLS cryptography support'
>>>      printf "%s\n" '  gtk             GTK+ user interface'
>>> +  printf "%s\n" '  gtk-clipboard   clipboard support for the gtk UI (EXPERIMENTAL, MAY HANG)'
>>
>> Same here. None of the other options have such warning. Cant this be treated
>> like the others, just another option to be enabled or disabled? Whether or not
>> the option works is another matter.
> 
> I'd warn the user, packager, etc that enabling this option may hang QEMU.

I wasn't objecting to the text, only noting the warning is unique. But as Peter 
said, the problem is unique.

> Hopefully these warnings can be removed as we find another way to collect the necessary GTK events
> that does not incur in this bug.

Agreed. And maybe your "loud" warnings will remind the author of such fix to 
remove them :-).

Jim



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD71446B6C5
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 10:11:41 +0100 (CET)
Received: from localhost ([::1]:60402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muWVe-0005Bk-SW
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 04:11:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1muWTE-0003y5-VM; Tue, 07 Dec 2021 04:09:08 -0500
Received: from mail-eopbgr80103.outbound.protection.outlook.com
 ([40.107.8.103]:38663 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1muWT9-0007qV-An; Tue, 07 Dec 2021 04:09:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H9HiAZAthdaOibdsggRi9kDBXX+9oSmZMYl1KUJDCF8PX1du75tnjmoTxeuHa/P+11Vkdga6TZGJuSiGFpoQC9v+HIstJNnxNHZfYcFu1bV92DmeeO02uyVbnWjnFwi8FETzHPIiGKA72OIPCJTUomGXqUOOIgtBoZjwtYO1Hy+eLXE8YIiWRQyLWv8Su4no7eFyl/gW41879LUi8KrpEtCTMHNdNzJv4LAlT2D+A4lIBmnxJj9+5+gRk+Ka9tPHvPI5BXkH9LPzJLMOhlCiPplwgPmJmzrLdvhsnsnyAkfsy+KnQflZ/nq07PhPSun7EnKMxEHtRaDm0vpCD8YWdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ga0GnaJq+b3uanZ3Sinqljib8UlYP3n4tIk86py0Yh8=;
 b=eC/x5n5xxC9oaIIyZGBVmo3xbQG6F2x713l+5ckmQ6T5TCBLri0fpK4lyNL84QXPc6EbQCMsX3hrwQ5HzmRD9J5h1/5+s7UK5P57jv9Nz6VwjVan1ZOwwzFtQQf0YxtrqJ7JyEEa15D4S4ukEQn85r4NQXo8Bq5/7EeVkJyjNHcMMkl/gEndAky7GNJfuUKvRhjXRpDyhmxtHtpsv1Kxuu/4T0j0COS4PvzD8HH4ZS/s779TGGX9KHqEzDGLKh0Uas94don05jWkhFRGMj61PFpywRyeNHFGQgAcoYt/O53U5lmAhWrgs3f3YEQ3jjleDY3Ynmy09cgVEsA9zj2r7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ga0GnaJq+b3uanZ3Sinqljib8UlYP3n4tIk86py0Yh8=;
 b=iRH2SQFv8k5cIZTJQHek4wDZF4xmVyf/hQbFaaUy0rVZwxl/4l0zYHMPMB+ov0Q1Jnco6AES0T06Si92bArYJMVjdZYNFUeymTx614ladjQU4z2QjYGOJMganWWDFWfu/xmFKrXzBbJobdFrUBWiteh3lje0U3mTN6lXvBSnVJM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM4PR0802MB2371.eurprd08.prod.outlook.com (2603:10a6:200:5d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Tue, 7 Dec
 2021 09:08:59 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Tue, 7 Dec 2021
 09:08:59 +0000
Message-ID: <45f22ac7-a36a-0c40-7198-267a2f46e71a@virtuozzo.com>
Date: Tue, 7 Dec 2021 12:08:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] spec: Add NBD_OPT_EXTENDED_HEADERS
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 libguestfs@redhat.com, nsoffer@redhat.com
References: <20211203231307.wmtbw7r72tyzkkax@redhat.com>
 <20211203231434.3900824-1-eblake@redhat.com>
 <f05c680a-73c3-b0d2-dbdf-c0bcf1ca3530@virtuozzo.com>
 <20211206230047.q5xc5enodbicf3gw@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211206230047.q5xc5enodbicf3gw@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::11) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 FR0P281CA0006.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Tue, 7 Dec 2021 09:08:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49cf5587-93db-45b1-7b33-08d9b961347c
X-MS-TrafficTypeDiagnostic: AM4PR0802MB2371:EE_
X-Microsoft-Antispam-PRVS: <AM4PR0802MB23714BEABE7B2972451E7D87C16E9@AM4PR0802MB2371.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EEUruYqegUF9Jfhqtvye6mQofgsAQ0RyACuJ1KUjhe25A+If5ki2kkDX6LuJWiBO4+jv7MlajJrmt2KpMJCtG1LtpSDZl+4akbWLzWEQZWXber9i8pg5QjptUshh4m6OL1Tmt7NlyF6d4NXcWgSqhJT6mZt98gW5oFmTO7ZyGfGpv2pMlEJIEyA4yBgM+a1jyQFD0Foo/kMokttJo4yl0IvNWGvpKXopaMoFyzV8s6q0gnpS+w7vAZ4IWbpbUee+wsp7HJiVYar359++O7KMTa3EKYeSEMndWw/65JgohP19GxELJXU0ybH8EhWSyAzdDXodQHfp59FxwjCZpvgUrKupWdR7r+F2qbu/Ui96gcPbX/0YUugvRLk2GL6G3PSHUDtAUXDUhTwsypHmChyKDvRXoMVoEHAQ+WLSlI73k7eexiVTybNQL0Vm5wGKnzWsCIW3GV4HZ03jsBEDbGj7JkFl2ygmoIwwmleYPRAvXSAkSFsIQHZmox/k/+LEiGKI9MUTmbVaKmflX8/8/R5fWLH0Vne2rZyW5+RCssll/3Tno8JZrRUdS9EufC5TDITbGDBqcLTMa1S7hKOxrVvy4qj1EIJfatZ/37Xc+FARoSveT6yYLVB54KtpZG2XpxrouUorlTyla9TvT/5sO3UagTQyK/v/a1DJM4l0J8mbvFs7FvsUJGH5p+kS9B6N2UHh50Fq2tDbKX7Lko0+hHxWDZOKRcvtlnj72Lb9Wdvedk5O5jSTEIj+G93eT8ln3et8OCkLUxWXFi96LUJIQAPx/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(38350700002)(66946007)(66476007)(4326008)(30864003)(66556008)(26005)(36756003)(186003)(52116002)(2616005)(6486002)(6916009)(31696002)(83380400001)(316002)(956004)(5660300002)(16576012)(86362001)(8936002)(508600001)(31686004)(2906002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHU1UHdySnJpcTFBWkYra1pHNktGdGJmOWdrK3hKaHVVcXVoNVg5cG9FVE9n?=
 =?utf-8?B?cDF6V0lVRWY4cXdPWFlSV3VQYU1ocDc4S2tVUTIvK0UvZG54VHV4N2s4bG00?=
 =?utf-8?B?dkMrVDhVTXgrN0Fmbzcrdi9DeU1PRDZXZkVkcnhlNThsVmFQdTNBV3hsWWZ4?=
 =?utf-8?B?V3M1bDA2RUNsWnN4WTNORGR3L1lJWCtlT1N2VWNGbHhITlZxRUMyMUt2UG1z?=
 =?utf-8?B?aVF4bHdWaXhBOVBEaWhnRFVFSTkvcWtjRFhSTFFSM01aa2VGV0NIaE1Jb1dv?=
 =?utf-8?B?UU5IdlhkNG5nV0luVFFYKzRDZTR1T2twa0QwYjlhOEtIeEUxK09GTkZGS1pH?=
 =?utf-8?B?S01MTFhkS1lHQmRmZWZHbDd3WktBRVh4Sjg5dGZOSmZRVUhKMjJzZTVHd3FI?=
 =?utf-8?B?VUpxaTJXbHJMd2pjeURnNFRmQ2FOQzBmWVN4RnlzL1BkcjRVVjM3Y2lMdDhL?=
 =?utf-8?B?TWFJS3cvR2FQSzljdmNHUisvOGVJVi9nZ0FWVWlQeklsd05pbUlRZUpMT0Z0?=
 =?utf-8?B?c0NMYTZlYlNHblhURFIyMnpyNjRwdUlQNlhjZHE3cjl4eFhIckdRaWtLSmJ4?=
 =?utf-8?B?bkJOL2lGUVFhSTdBTCtWSlBJaVVTcExyT1Fac1F0MFVCM1FDSjlxaEMvYXo3?=
 =?utf-8?B?ZEJtYjN4R1B4S2NRYTdRMC95bDJ5d3Fpd1NLZFUwcWZDc3ZsbUltTXZSZ1dW?=
 =?utf-8?B?a2wwQmFZYVVaRFhxRDk2TG81aDhsOHhzajBNWDVjTmFyQVd0QkhjL1k5eTNU?=
 =?utf-8?B?RHFmSmJpT3FoZkg1V2VHa2cwYVNMQVhkNnFBUWJ0aFlnSkJvYnJqVUpKYlRl?=
 =?utf-8?B?SDJsY0VWSkZ0NG01NjkrNEpONUt2YkJRQmtoaS9YOFk1M3JTQncrSXFuZ2RC?=
 =?utf-8?B?RG5KNzFodDlaUUVZMmp0U2FmUnd5T3dqWHZzTXAremNKbytoN3h4TldiOTZu?=
 =?utf-8?B?QTRNVlpnb3A1bmErOVRoZGRuR3pyaGxCM2JPaXcrVmM4OXUrUUVpTmtrbEtB?=
 =?utf-8?B?VnhnblByZlZEOXQveURTM2JtYnR6eHM2SFNvS21QcDIxV2RXenRuUzlFcTZI?=
 =?utf-8?B?eGVseUJpS1dWaGJ0RWY1cHg1c09FSkJtV0MxZFcya1ZMeDNROENPeHRFMFps?=
 =?utf-8?B?eHp3NmlMbjl0RlIrd2NBT2praVgybEpncUU5WXNiUjIzcXRmSW1mWWlDdnBE?=
 =?utf-8?B?c1NnakpFYjZ2cnFWMzRlbitFQ1c5ZFdMSmt3K1R6R2ZJdzBjQ1dnWmc0YStZ?=
 =?utf-8?B?YlhRcWp4OWx0WERIcEJGdDNYTGJuNUx2Q0tzTThCcG10RS9tVEMyMU5hUzhr?=
 =?utf-8?B?R25mdEhYT2NTZC90QkUzQXZGQWRpL29qeG43cFhoUzBPcSszS3llWmRqSnJV?=
 =?utf-8?B?L2hVc2J3eTJMSStTSkt1RDNUeGYrdy9QeHFWdFlGc3lNcjdDeE0ray9pZVZ0?=
 =?utf-8?B?dUk0a0k0UlpYVVQ5S294VHhWeGFGU2NFRlhtS0xqTnZSTVRPSE8ya2crK21L?=
 =?utf-8?B?SDZpT3FnZm1vRVdHYmdpWlpKNHp5aUE1cXlITzhDaGVaTUxCZWYvNWYwbk1F?=
 =?utf-8?B?TWFiU0hTVDk1OXRCSUxRUFNWS3F6bUJxRlNPdHI3czJqS0I3bitXV2t1TFlt?=
 =?utf-8?B?NktST000T1pvQmxZcldZeVV2U1ZPRkVSWHNHL0xNc3BCVllaMm9mcDdCQXRH?=
 =?utf-8?B?dW1xeFdpcjVIeUdOQ1VrUmR5MXgrOG1QWTdUZmlhU1p1cEVrVGFxdWxPN25P?=
 =?utf-8?B?dWhpUmRicExyVDEwbHhPZDlyb0NpeUIydFcvTlhTYTBVR0FMMldDOUFkdmZm?=
 =?utf-8?B?N1l6dzJVektZMGx1Y05tWCtSOFZ2WlU5YU4vNk4xeEZ5MURMRWRqRzhXMWdU?=
 =?utf-8?B?Y3BwU1l5c2lHeGxLaXdBVnVuTyszLy9udlRmMlo3c0ljTnJ2UXhxV0RoOGRI?=
 =?utf-8?B?YkNLd2pkbjJQQlVYRE42dHVYNFRhWTE3VkREbFZnd3JYTEZKTGhkQWtLQVVC?=
 =?utf-8?B?dVhMU0J3ZE9TWGFQcVBKbUFNS3dpMDRtRkM2cllIT0NuS2k3czdsM3ZSUDlQ?=
 =?utf-8?B?L3cva3lJVkxZZHVmRXE5VGRtcWl2Y2tWc3JacmdvRnVQWjdJeDdzcVlxOXJS?=
 =?utf-8?B?K1JadnJnbS9YL0hSRFlYTmZZb0lCNXh6NUQ4WXNIU3FMbEpGM1R2WlR2TEF3?=
 =?utf-8?B?K212Nk4xS0RsNHI4a0t6WmE2VERiRUc2bFgrbWN4cDhVdVpuSHdTR2p2eVA5?=
 =?utf-8?Q?pK3401VFungtJU28quV46OvELTQh8v1fL+zYGezYNM=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49cf5587-93db-45b1-7b33-08d9b961347c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2021 09:08:59.5365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MJN7UP+5BDBTlw5YpHmexSLWXDUjYZPs5E/rmX6gMdWu621cf2HLNrifQBU+IHSiM3oRqkT00Jfy3kAVrpWWQSBF3HbLGeWJKZRyB19gVcA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2371
Received-SPF: pass client-ip=40.107.8.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.44, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

07.12.2021 02:00, Eric Blake wrote:
> On Mon, Dec 06, 2021 at 02:40:45PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>>    #### Simple reply message
>>>
>>>    The simple reply message MUST be sent by the server in response to all
>>>    requests if structured replies have not been negotiated using
>>> -`NBD_OPT_STRUCTURED_REPLY`. If structured replies have been negotiated, a simple
>>> -reply MAY be used as a reply to any request other than `NBD_CMD_READ`,
>>> -but only if the reply has no data payload.  The message looks as
>>> -follows:
>>> +`NBD_OPT_STRUCTURED_REPLY`. If structured replies have been
>>> +negotiated, a simple reply MAY be used as a reply to any request other
>>> +than `NBD_CMD_READ`, but only if the reply has no data payload.  If
>>> +extended headers were not negotiated using `NBD_OPT_EXTENDED_HEADERS`,
>>> +the message looks as follows:
>>>
>>>    S: 32 bits, 0x67446698, magic (`NBD_SIMPLE_REPLY_MAGIC`; used to be
>>>       `NBD_REPLY_MAGIC`)
>>> @@ -369,6 +398,16 @@ S: 64 bits, handle
>>>    S: (*length* bytes of data if the request is of type `NBD_CMD_READ` and
>>>        *error* is zero)
>>>
>>> +If extended headers were negotiated using `NBD_OPT_EXTENDED_HEADERS`,
>>> +the message looks like:
>>> +
>>> +S: 32 bits, 0x60d12fd6, magic (`NBD_SIMPLE_REPLY_EXT_MAGIC`)
>>> +S: 32 bits, error (MAY be zero)
>>> +S: 64 bits, handle
>>> +S: 128 bits, padding (MUST be zero)
>>> +S: (*length* bytes of data if the request is of type `NBD_CMD_READ` and
>>> +    *error* is zero)
>>> +
>>
>> If we go this way, let's put payload length into padding: it will help to make the protocol context-independent and less error-prone.
> 
> Easy enough to do (the payload length will be 0 except for
> NBD_CMD_READ).
> 
>>
>> Or, the otherway, may be just forbid the payload for simple-64bit ? What's the reason to allow 64bit requests without structured reply negotiation?
> 
> The two happened to be orthogonal enough in my implementation.  It was
> easy to demonstrate either one without the other, and it IS easier to
> write a client using non-structured replies (structured reads ARE
> tougher than simple reads, even if it is less efficient when it comes
> to reading zeros).  But you are also right that we could require
> structured reads prior to allowing 64-bit operations, and then have
> only one supported reply type on the wire when negotiated.  Wouter,
> which way do you prefer?
> 
>>
>>>    #### Structured reply chunk message
>>>
>>>    Some of the major downsides of the default simple reply to
>>> @@ -410,7 +449,9 @@ considered successful only if it did not contain any error chunks,
>>>    although the client MAY be able to determine partial success based
>>>    on the chunks received.
>>>
>>> -A structured reply chunk message looks as follows:
>>> +If extended headers were not negotiated using
>>> +`NBD_OPT_EXTENDED_HEADERS`, a structured reply chunk message looks as
>>> +follows:
>>>
>>>    S: 32 bits, 0x668e33ef, magic (`NBD_STRUCTURED_REPLY_MAGIC`)
>>>    S: 16 bits, flags
>>> @@ -423,6 +464,17 @@ The use of *length* in the reply allows context-free division of
>>>    the overall server traffic into individual reply messages; the
>>>    *type* field describes how to further interpret the payload.
>>>
>>> +If extended headers were negotiated using `NBD_OPT_EXTENDED_HEADERS`,
>>> +the message looks like:
>>> +
>>> +S: 32 bits, 0x6e8a278c, magic (`NBD_STRUCTURED_REPLY_EXT_MAGIC`)
>>> +S: 16 bits, flags
>>> +S: 16 bits, type
>>> +S: 64 bits, handle
>>> +S: 64 bits, length of payload (unsigned)
>>
>> Maybe, 64bits is too much for payload. But who knows. And it's good that it's symmetric to 64bit length in request.
> 
> Indeed, both qemu and libnbd implementations explicitly kill the
> connection to any server that replies with more than the max buffer
> used for NBD_CMD_READ/WRITE (32M for qemu, 64M for libnbd).  And if
> the spec is not already clear on the topic, I should add an
> independent patch to NBD_CMD_BLOCK_STATUS to make it obvious that a
> server cannot reply with too many extents because of such clients.
> 
> So none of my proof-of-concept code ever used the full 64-bits of the
> reply header length.  On the other hand, there is indeed the symmetry
> argument - if someone writes a server willing to accept a 4G
> NBD_CMD_WRITE, then it should also support a 4G NBD_CMD_READ, even if
> no known existing server or client allows buffers that large..
> 
>>
>>> +S: 64 bits, padding (MUST be zero)
>>
>> Hmm. Extra 8 bytes to be power-of-2. Does 32 bytes really perform better than 24 bytes?
> 
> Consider:
> struct header[100];
> 
> if sizeof(header[0]) is a power of 2 <= the cache line size (and the
> compiler prefers to start arrays aligned to the cache line) then we
> are guaranteed that all array members each reside in a single cache
> line.  But if it is not a power of 2, some of the array members
> straddle two cache lines.
> 
> Will there be code that wants to create an array of headers?  Perhaps
> so, because that is a logical way (along with scatter/gather to
> combine the header with variable-sized payloads) of tracking the
> headers for multiple commands issued in parallel.
> 
> Do I have actual performance numbers?  No. But there's plenty of
> google hits for why sizing structs to a power of 2 is a good idea.
> 
>>
>>> +S: *length* bytes of payload data (if *length* is nonzero)
>>
>> Hmm2: we probably may move "handle" to the start of payload. This way we can keep 16bytes header for simple reply and 16bytes header for structured. So structured are read in two shots: 1. the header, 2. handle + payload.. But that means deeper restructuring of the client code.. So seems not worth it.
> 
> Right now, the handle is in the same offset for both simple and
> structured replies, and for both normal and extended headers.  My
> proof-of-concept for qemu always reads just the magic number and
> handle, then decides how many more bytes to read (if any) (1 syscall
> for simple compact headers, 2 syscalls for compact structured and for
> both extended styles); while my proof-of-concept for libnbd actually
> decides up front to only do a 32-byte read if extended headers are in
> use for fewer syscalls.  I don't know if one way is better than the
> other, but the differences in styles fell out naturally from the rest
> of those code bases, and certainly anything that can be done with
> fewer syscalls per transaction is going to show a modest improvement.
> 
> But you are right that repositioning the handle to live at some other
> offset (including forcing it to live in the payload with a 16-byte
> header, instead of having a 32-byte header) would be more invasive.
> Doable?  Maybe.  That's why this is an RFC.  But unless there is a
> compelling reason to try, I'd rather not go to that effort.
> 
>>
>>
>>> +
>>>    #### Terminating the transmission phase
>>>
>>>    There are two methods of terminating the transmission phase:
>>> @@ -870,15 +922,19 @@ The procedure works as follows:
>>>      server supports.
>>>    - During transmission, a client can then indicate interest in metadata
>>>      for a given region by way of the `NBD_CMD_BLOCK_STATUS` command,
>>> -  where *offset* and *length* indicate the area of interest. The
>>> -  server MUST then respond with the requested information, for all
>>> +  where *offset* and *length* indicate the area of interest.
>>> +- The server MUST then respond with the requested information, for all
>>>      contexts which were selected during negotiation. For every metadata
>>> -  context, the server sends one set of extent chunks, where the sizes
>>> -  of the extents MUST be less than or equal to the length as specified
>>> -  in the request.
>>
>> I'm not sure we can simply drop this requirement.. It seems like an incompatible change, isn't it? May be, we should allow any size of extent only for 64bit mode?
> 
> I'm not dropping the requirement; 

Hmm.

First, the sentence restrict all extents to be less than length. But actually, I think we don't want to restrict the last extent..  So, this is just a mistake in spec. Can we just drop it, not caring about possible implementations that checks all extents be less than length including the last one? It's an important thing if consider the case when server can reply with only one extent, that covers more than requested length and REQ_ONE is not set.

Second, you add a global statement that "size is only a hint". But formally that's not true: we do have some restrictions..

> what was listed here is redundant
> with what appears elsewhere under NBD_REPLY_TYPE_BLOCK_STATUS, where
> the addition of NBD_REPLY_TYPE_BLOCK_STATUS_EXT made it too wordy to
> keep the redundancy here.  But yes, I can try and separate the patch
> into minor cleanups separate from new additions.
> 
> ...
>>>    #### Structured reply types
>>>
>>> -These values are used in the "type" field of a structured reply.
>>> -Some chunk types can additionally be categorized by role, such as
>>> -*error chunks* or *content chunks*.  Each type determines how to
>>> -interpret the "length" bytes of payload.  If the client receives
>>> -an unknown or unexpected type, other than an *error chunk*, it
>>> -MUST initiate a hard disconnect.
>>> +These values are used in the "type" field of a structured reply.  Some
>>> +chunk types can additionally be categorized by role, such as *error
>>> +chunks*, *content chunks*, or *status chunks*.  Each type determines
>>> +how to interpret the "length" bytes of payload.  If the client
>>> +receives an unknown or unexpected type, other than an *error chunk*,
>>> +it MUST initiate a hard disconnect.
>>
>> Just add "status chunks" to the list. Seems unrelated, better be in a separate patch.
> 
> Previously, only NBD_REPLY_TYPE_BLOCK_STATUS counts as a status chunk,
> now we have two reply types with that qualification.  But I can indeed
> split up the terminology addition from the addition of the second type
> of status chunk.
> 
>>
>>>
>>>    * `NBD_REPLY_TYPE_NONE` (0)
>>>
>>> @@ -1761,13 +1837,34 @@ MUST initiate a hard disconnect.
>>>      64 bits: offset (unsigned)
>>>      32 bits: hole size (unsigned, MUST be nonzero)
>>>
>>> +* `NBD_REPLY_TYPE_OFFSET_HOLE_EXT` (3)
>>> +
>>> +  This chunk type is in the content chunk category.  *length* MUST be
>>> +  exactly 16.  The semantics of this chunk mirror those of
>>> +  `NBD_REPLY_TYPE_OFFSET_HOLE`, other than the use of a larger *hole
>>> +  size* field.  This chunk type MUST NOT be used unless extended
>>> +  headers were negotiated with `NBD_OPT_EXTENDED_HEADERS`.
>>
>> Why do you call all such things _EXT, not _64 ? _64 seems more informative.
> 
> _64 would be fine with me.  As this is an RFC, the naming is not
> locked in stone.
> 
>>
>>> +
>>> +  The payload is structured as:
>>> +
>>> +  64 bits: offset (unsigned)
>>> +  64 bits: hole size (unsigned, MUST be nonzero)
>>> +
>>> +  Note that even when extended headers are in use, a server may
>>> +  enforce a maximum block size that is smaller than 32 bits, in which
>>> +  case no valid `NBD_CMD_READ` will have a *length* large enough to
>> s/nc/no/ ? But hard to read any way, as sounds very similar to "not valid", which breaks the meaning.
>>
>> may be just "in which case valid NBD_CMD_READ will not have"
> 
> I like that.
> 
>>
>>> +  require the use of this chunk type.  However, a client using
>>> +  extended headers MUST be prepared for the server to use either the
>>> +  compact or extended chunk type.
>>> +
>>>    * `NBD_REPLY_TYPE_BLOCK_STATUS` (5)
>>>
>>> -  *length* MUST be 4 + (a positive integer multiple of 8).  This reply
>>> -  represents a series of consecutive block descriptors where the sum
>>> -  of the length fields within the descriptors is subject to further
>>> -  constraints documented below. This chunk type MUST appear
>>> -  exactly once per metadata ID in a structured reply.
>>> +  This chunk type is in the status chunk category.  *length* MUST be
>>> +  4 + (a positive integer multiple of 8).  This reply represents a
>>> +  series of consecutive block descriptors where the sum of the length
>>> +  fields within the descriptors is subject to further constraints
>>> +  documented below.  Each negotiated metadata ID must have exactly one
>>> +  status chunk in the overall structured reply.
>>
>> just rewording, no semantic changes, yes?
> 
> The change is that it is no longer to have exactly one of these per
> reply (you can have a BLOCK_STATUS_EXT instead).  True, not much of a
> change, but it is because of the new type.  Again, adding the notion
> of exactly one status chunk per metadata id (even with only one
> possible status chunk) in one patch, then adding the second status
> chunk with extended headers, may be easier to review, so I'll try that
> for v2.
> 
>>
>>>
>>>      The payload starts with:
>>>
>>> @@ -1796,9 +1893,36 @@ MUST initiate a hard disconnect.
>>>      information to the client, if looking up the information would be
>>>      too resource-intensive for the server, so long as at least one
>>>      extent is returned. Servers should however be aware that most
>>> -  clients implementations will then simply ask for the next extent
>>> +  client implementations will then simply ask for the next extent
>>>      instead.
>>
>> So you keep all restrictions about NBD_CMD_FLAG_REQ_ONE and about sum of lenghts of extents as is here..
> 
> Yes.
> 
>>
>>>
>>> +* `NBD_REPLY_TYPE_BLOCK_STATUS_EXT` (6)
>>> +
>>> +  This chunk type is in the status chunk category.  *length* MUST be
>>> +  4 + (a positive multiple of 16).  The semantics of this chunk mirror
>>> +  those of `NBD_REPLY_TYPE_BLOCK_STATUS`, other than the use of a
>>> +  larger *extent length* field, as well as added padding to ease
>>> +  alignment.
>>
>> But what about restrictions on chunk lengths and cumulative chunk length?
> 
> That is supposed to still be in effect.  If I deleted that
> restriction, it was unintentional.  That is, the cumulative length
> (and thus each individual extent length, since no extent can be larger
> than the cumulative length) is not allowed to exceed the client's
> length request except in the case of the last extent, and even then
> only when REQ_ONE was not in use.
> 
>>
>>> +  This chunk type MUST NOT be used unless extended headers
>>> +  were negotiated with `NBD_OPT_EXTENDED_HEADERS`.
>>> +
>>> +  The payload starts with:
>>> +
>>> +  32 bits, metadata context ID
>>> +
>>> +  and is followed by a list of one or more descriptors, each with this
>>> +  layout:
>>> +
>>> +  64 bits, length of the extent to which the status below
>>> +     applies (unsigned, MUST be nonzero)
>>> +  32 bits, status flags
>>> +  32 bits, padding (MUST be zero)
>>> +
>>> +  Note that even when extended headers are in use, the client MUST be
>>> +  prepared for the server to use either the compact or extended chunk
>>> +  type, regardless of whether the client's hinted length was more or
>>> +  less than 32 bits, but the server MUST use exactly one of the two
>>> +  chunk types per negotiated metacontext ID.
>>
>> But we have anyway one chunk per ID in a reply.. Or you mean that the type of reply for the ID should be selected once for the whole session?
> 
> I envision the following as valid:
> 
> OPT_SET_META_CONTEXT("base:allocation", "my:extension")
> => id 1: "base:allocation", id 2: "my:extension"
> OPT_GO
> ...
> 
> CMD_BLOCK_STATUS(offset=0, length=3G)
> => REPLY_TYPE_BLOCK_STATUS(id=1, extent[2] { length=2G flags=0, length=2G flags=1 })
> => REPLY_TYPE_BLOCK_STATUS_EXT(id=2, extent[1] { length=3G flags=0 })
> CMD_BLOCK_STATUS(offset=3G, length=6G)
> => REPLY_TYPE_BLOCK_STATUS_EXT(id 1, extent[1] { length=5G flags=0 })
> => REPLY_TYPE_BLOCK_STATUS(id 2, extent[2] { length=3.5G flags=0, length=3.5G flags=1 })
> 
> Note that the first id=1 responded with a cumulative length larger
> than the client's request, and the cumulative length is > 4G, but the
> response itself gets away with only 32-bit extents.  The first id=2
> response is < 3G, but the server chose to use a 64-bit extent anyway.
> The second id=1 response has to use the 64-bit response (because even
> though 5G is shorter than the client's request for 6G, it is larger
> than the 4G maximum of a 32-bit response). The second id=2 is similar
> to the first id=1 in that it uses a 32-bit response even though the
> cumulative length is >4G.  There is no requirement that the cumulative
> lengths of the two ids be identical.  And since REQ_ONE is not in
> effect, the last extent of a given extent array can cause the
> cumulative value to exceed the client's request.
> 
> What is invalid:
> CMD_BLOCK_STATUS(offset=0, length=3G)
> => REPLY_TYPE_BLOCK_STATUS(id=1, extent[2] { length=2G flags=0, length=2G flags=1 })
> => REPLY_TYPE_BLOCK_STATUS_EXT(id=1, extent[1] { length=3G flags=0 })
> 
> because it used two status chunks both for context id=1.
> 
> Maybe I need to add the phrase "within a given NBD_CMD_BLOCK_STATUS
> response", to make it clear that exactly one status chunk per id is
> chosen, but whether the server chooses a 32- or 64-bit status chunk is
> dependent solely on the server's whims, and the client must be
> prepared for either, regardless of the length the client used
> originally.


Ah, I understand, thanks. Somehow, I just thought about REPLY_TYPE_BLOCK_STATUS and REPLY_TYPE_BLOCK_STATUS_EXT like about one object, and somehow I thought that old "This chunk type MUST appear exactly once per metadata ID in a structured reply" of NBD_REPLY_TYPE_BLOCK_STATUS is enough. But yes, REPLY_TYPE_BLOCK_STATUS_EXT is a new chunk type and we need a clarification. Yes, "within a given NBD_CMD_BLOCK_STATUS  response" helps.

> 
> ...
>>
>> Overall, seems good to me.
> 
> Glad to hear it!
> 
>>
>> 1. Could we move some fixes / rewordings to a preaparation patch?
> 
> Yes, I'll do that for v2.
> 
>>
>> 2. I see you want also to overcome unpleasant restrictions we had around lengths / cumulative lengths of BLOCK_STATUS replies. I like the idea. But I think, it should be clarified that without 64bit extension negotiated all stay as is. And with 64bit extension negotiated, BLOCK_STATUS works in a slighter new way, so it may return what server wants, and original "length" is simply a hint. Or, at least that new behavior is only about NBD_REPLY_TYPE_BLOCK_STATUS_EXT.. Also, some clarifications may need around NBD_CMD_FLAG_REQ_ONE flag, what changes for it? You don't mention it at all in new version of BLOCK_STATUS reply.
> 
> That's not new behavior.  The client's length has always been a mere
> hint to the server, where the only constraints are that the server
> must make progress on success, and that if REQ_ONE is in use, the
> server may not report more than then length the client asked about.
> 
> Or are you proposing that we relax REQ_ONE, and allow a server to
> report additional length in 64-bit mode even when REQ_ONE is in use?
> The 32-bit limitation on not sending back too much length with compact
> structured replies was because qemu as client at one point would abort
> if the cumulative length was too long (and qemu has always used
> REQ_ONE).  But if extended headers are in use, qemu no longer aborts
> on oversize answers, and no other client is new enough to have
> extended headers.
> 

I mistakenly thought that you want do it) OK, then we can consider it as my proposal: we are going to alter block-status behavior in incompatible way with new extension, why not to overcome some inconvenient limitations?

So what restrictions we have:

1. The LAST extent must be <= than requested length. It's from sentence "For every metadata context, the server sends one set of extent chunks, where the sizes of the extents MUST be less than or equal to the length"

In this patch you silently remove this mistaken limitation.. I'm not sure that we could do it. But if we sure that known clients are not affected, probably we could.
If we can't simply remove it, we still can fix it when extended headers are negotiated.

2. Only last extent can cross the boundary of the request.

Actually, why we need it? What if in some implementation, server has some more extents for free? We can drop this restriction when extended header are negotiated.

3. With REQ_ONE, the returned extent can't cross the boundary.

Recently we had patches and discussion in list to overcome this restriction by requesting more than we actually need, I argued against this logic in client.
If we allow last extent to cross the boundary when new extension is negotiated - great, we can use this feature in qemu immediately (when full support for multi-extent block-status requires a lot more work).

-- 
Best regards,
Vladimir


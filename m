Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C25A44B207
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 18:33:28 +0100 (CET)
Received: from localhost ([::1]:56684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkUzu-00071d-Lz
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 12:33:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mkUyM-00068f-VG
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 12:31:50 -0500
Received: from mail-eopbgr20108.outbound.protection.outlook.com
 ([40.107.2.108]:44655 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mkUyJ-0003fZ-7e
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 12:31:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G/ZHXaRjlYrsUj3AsrB2wLEOsPkowSkiMxyWQLj6Ri1LqekI1q8eO9QqCe6bDtygkboaVRT6XNMykMmLb8O91nmt2Ad8L9v0QMies4op+TR1GRPduqTb+yATE8udLBajxNcIxZoFlqkH1ePmXWKMYMgsPiLPc2EAQou0qcyWTrlqoUg9SWCGuX1GDPQR1Zb1piMGnWgk3SzPXGwmrHkpnXF6LDYrEyfIMVXAQoLCMP5wpTL8lhb1cfutJNKlxcoMlegDtxohWrdTVOZ+/TG1NvEgFgDRM6uF4sPYkf4z937yAB0M21KZHI3UuIcIR0+G8jNi9w6WZhIvFSCPRVZKFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6XfpK1pfzrLuxC7NhPtFotPf8Z2dZKLu1iZeSDFoyOI=;
 b=XnkGlTHZnGkrfhRzec7ykOvX8b5syVa6LQaswp3Nih+MkQgUDq0gZHG3SKn+eO9Jdl+q4ZumeHkSCUa1v4jCPmD76qZ+Xfwjy4vPW9rSRNoBeIkOmX1DOqftt34wQ366D7nRC4y0CtHn8n3eoHcPHWjTdabq19EjQyaXz7xaGeIyhqQm/Ib5G9qM+Bpj+o+ucp7bpY4qC2D7lTeAZr4OK4bmEcD5WLVU4eejK93SiVN0I182CEnDGdvxm71xKrpYKLJ1NNYKpeFqBnCxL9/o7fUyDhaSdJeBPJDZjnTrvelOI9XUWqtdDBYP4tLqS2IvVbTRXiGWV25WtoFS7GAbMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6XfpK1pfzrLuxC7NhPtFotPf8Z2dZKLu1iZeSDFoyOI=;
 b=IyKbmiOoYinAfwA8M5YuS5J9bNwJctOFhVclzT0X25KXyXvx1GHuVnH3wflhQgHrJBk81EVuuMrDsbhjSvaRMVxrALd+55FsezLeIT4X7ZwyQk6IQrldLDETfThVl391/ynvkNNjfSADZcYDzDlYfdRjrJk25zap4DkHNKoNdO4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5334.eurprd08.prod.outlook.com (2603:10a6:20b:10b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Tue, 9 Nov
 2021 17:11:21 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%5]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 17:11:21 +0000
Message-ID: <4f4037a7-b729-b086-e663-276b827eefe0@virtuozzo.com>
Date: Tue, 9 Nov 2021 20:11:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v4 5/5] block: Deprecate transaction type drive-backup
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, eblake@redhat.com, jsnow@redhat.com,
 marcandre.lureau@redhat.com, mdroth@linux.vnet.ibm.com,
 libguestfs@redhat.com, libvir-list@redhat.com, berrange@redhat.com,
 pkrempa@redhat.com, kwolf@redhat.com
References: <20211025042405.3762351-1-armbru@redhat.com>
 <20211025042405.3762351-6-armbru@redhat.com>
 <c505d2d8-955d-7c64-b769-80ed40428ed5@virtuozzo.com>
 <87ee7wh3m6.fsf@dusky.pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <87ee7wh3m6.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.243) by
 FR3P281CA0029.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.4 via Frontend Transport; Tue, 9 Nov 2021 17:11:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3b76ca9-0e04-47c8-dead-08d9a3a3f388
X-MS-TrafficTypeDiagnostic: AM7PR08MB5334:
X-Microsoft-Antispam-PRVS: <AM7PR08MB5334C498376120A653FCE10AC1929@AM7PR08MB5334.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KJv4QbG8a78nvCzUsOtVVj+FWcmRFuWNougUOT/B3gQf/3YiwZ+uIK+m2xlGcpUELzhA+fk0Ju0Lcr8l69IZh3odVJAp/iKdjNYwd+AvFBvHjHZbqqMTa7RKCdhRSlYzAvKoVxA9vJLjKugte1vCEqoNQEDa7L3U4eAvloMxym22m6VZCzgM7CF4T7tDlpHxfvbAm+m1NcAdyxAXfRuZHXblXqvyTY5huE4uXnbB1beRZs0Kzpp6zbijakmdnytO27taPniKSMeaUYOQJH2TUyjyBQIANXL0cu3w0X2wYO3TGvEJQy2J3MAGfqay9rP2k9DGB5z4ZFkdDmpFkJLlGFk9sQEGn3tFyakXBOLfFsv/bI2dyJNJgbMTDt0mm251H3no8XgMCXKvWbAnnEOx0PciWPtLE4AlpiUsYD0JK4JKEK+pLZs24MEB47t9O9OWRNPKSxjNB1/tu7tIdscmXCCi5TSuZHjt/QMpA/F4aswj6P/o+32AuFs46zk3zPQIzHHJP+qr6T2WdYSQvxRvh4hzJfoDz+TjWSaPbqXiCgOGyv58EZiXS1+c8W0LhwNuzGQuMnW33mJL+MV5MsoN35+Sl4qcmGWskpxmurX5zxc9RYCN2G9zTMSXDz0M0P0wTsvDg99vx/pFTFh0tF5TLbOhhcfJWtM+c8EfeWLxML5b0eQWYrxb4XnxlVGBuiDqEzyuVK+DPsUsc1ETUtFsN+KKKJ5GnI3fVbLg6kSO7MBwkkSAMLFfUzbDKd4B8hWoAcSuCY7p7dEvYtCCju1tNP/enTt5jcoW4wY9hfXfqs0m2Jy3ZnsOKiHCT39xj5A0iw+GiqUGnlrHQVBW8JJrRFIqyQgkmVv8VShEnGJ6VQ0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(2616005)(966005)(6486002)(956004)(26005)(16576012)(316002)(5660300002)(31686004)(2906002)(52116002)(66946007)(66476007)(66556008)(31696002)(186003)(6916009)(8676002)(36756003)(38100700002)(86362001)(83380400001)(38350700002)(508600001)(8936002)(7416002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d00vdXRaeFdtRWN4VFY0MlRmM0drVXE5Qnp5dUk2cFdQM0dNNS9saGlJSGNX?=
 =?utf-8?B?clQ5NTJlTHpKWER3bXRyM3pkRVRHdVVLRlZrRnhFYUo5R250OUYyMS9LN1h5?=
 =?utf-8?B?OXpxSlpBMVc1TGQxU25OeCs1aWl5bVoxRnFiM1JJSGpxS09NM1Fxc1lhcW1a?=
 =?utf-8?B?VlhmYWIyTlZYcHR2UXlzbmFIa0Q2TU0zaG9yblZ0MVdYaFVBZ0FFcytIVmFE?=
 =?utf-8?B?T3c4NEVuZ1hLL1ZLOU52ZnBmWnVKZXp3LzFjdHIxQUxBRWs1NTY5YXZ1Yjh4?=
 =?utf-8?B?Nk5CRkNha3pCcjVmeU1RMXE4MmlKVnNhd2xicHRaQzBmM0JBWkkyME1zckIw?=
 =?utf-8?B?YUZXbGN3RytZSHQvaTVseFVvNVdFeWJ0K1BCUkV0dzlkQzNkM3lweVNiVG44?=
 =?utf-8?B?NEdNTCs5ckRJTXdLTnMwY3VRV0t4Wk9ZTW5zanZQWjc0eU9lZVNQdmdBWUNs?=
 =?utf-8?B?K0lqUjBDaTdZb2p4bGNqZW9pM2ZpWVlqTWZjcnhIcXI5OE9nUWJ6QUkwNmtZ?=
 =?utf-8?B?MW1pdWZhaWMrSkdtRWNQL3N5VVFYSXROTktQaVZQVnpMUDlrOHFSUFg4VDgz?=
 =?utf-8?B?QTh2cHJSWjJJMlpTODN1dlZQOGN6K2FjQWRRbDIrM2hkNzh4QmU4ejJBMDgx?=
 =?utf-8?B?b3ZIUWhIbHN1Y2p1K3lTYnZFRjZHS251b2srMmJQckhnUVIyMHZHV0oyeDVt?=
 =?utf-8?B?V0xmLyt6U2RQRnZCc0Q4RmlKSVdUbkJSR20vZVR0b3AvU3dVcURqdnR0eDc1?=
 =?utf-8?B?MFM3VHdjRGVnaUwxVVBOZTh3VHlGM1VlNE40dU1zQjE0Tk9qdVhiTU82azFa?=
 =?utf-8?B?aVowNllaNjVoMFY4QVBjTlRPckhSMFdyUHNQVzh3bUJZTGxBTG1kOVMzV3VI?=
 =?utf-8?B?YURlSTZ4Y1lTTW5ERlZERFArakoxbVhBL0ZSTU1qRzlsNUdwL2JwRlFxaW1y?=
 =?utf-8?B?a3kzdkpLak5Ma2xUd2d6WjJQMlJ1aFpqNDlJQ3RHMmZjaTA5MStRRnRONFhE?=
 =?utf-8?B?K2xkcnJLRVJ6UGFlR3FST0hrc3kxK2xxdGhkMENGRkI0N1AyaDM5YVVmSURQ?=
 =?utf-8?B?WlBkLzJVSlJLTVU4dGJNUmlGRlRkajg0ZlNVdzhpK21DcGxDeE1KbWZFUHVY?=
 =?utf-8?B?Ulc4NHBiNXhjbllNdEs0SGRqNHovb2JEb1Ezd2l3akkrc0V4YkdweHZ3NGpZ?=
 =?utf-8?B?a3NiUFdMdmhNWFR6YWVUQ2NmbFFkOXB4ekVZS3RrWjB0SFhWYnNvYXZVVTJH?=
 =?utf-8?B?cjNWbTljcVZHZ1Q3ZkYwTVBaTnNrc1lFVnExK05sWGtiTzhFTERDY0M1emVn?=
 =?utf-8?B?L3ZxNHovOUJZUUVVbHBXNDRyY2pOUG13TEhCakxpZk51RlVocFR5OWlsTk9M?=
 =?utf-8?B?TENPVUNlQ1FRZG5vcUdvdXpwYVArZzNCWUNZZVk3UW1yQk00TzdtdjZBOG11?=
 =?utf-8?B?czhVaFdJVUlhdnVhVGpvNHdBeWpPRkIzWE82OTR0NnhERDhvNDdvVjRKRm4y?=
 =?utf-8?B?dWpZbFlvdDgzbVM1dzMxVDhKREdRdEdrYmRONjJzS0hTMGhpTWNqb0lSQlNO?=
 =?utf-8?B?WmFjcXFnTTdmdUExNVNJajVtZlRGa0Y4bDlzUSs0UkF1eThzWUpoSjJDbVBw?=
 =?utf-8?B?NWNMTGEvL1BibGx1VGdabWQwajV6cm5ySkRQNERGemNJT0RJb1JaTG51Q1Ns?=
 =?utf-8?B?NHNhZ0NubzBRVzhZQXl5TXFWcW1WYmV4OC80ZVhOcVpZU21tOThLZlBDY0d3?=
 =?utf-8?B?ZXl1cEQwSG1EeWg2YS9DVWVVZmUvamFTY05VTGVsM0RSdlBucmlRb2xod0p4?=
 =?utf-8?B?Mmx4cEtVZVp4RVhFRmdWK09URmp5TXZQQlV5cjQxaHQwUmh5enUzNEZkMGxF?=
 =?utf-8?B?RXpmbWNEQlA3VjNlNjIyMWRWdEtnU2VVRTNTSTFkZlVEWFMxeTlEM2hqU21Q?=
 =?utf-8?B?cUFPalNOOUV0Q0xnakh4cTFmUTJkc3k1OGlqTnc5VnRiZCs1L2tRSXVtQUJo?=
 =?utf-8?B?cHlHbHR0RHgzVWJBNDBpK21qNlBkREdsVXN1MitJYUUyMHBWV1ZQWUtXMlFH?=
 =?utf-8?B?ZVBUYWhxbm9wczhHT3VJUTNCR2YvUzNIc1l6dVVOUTdzTmlURUZ4eFpEd091?=
 =?utf-8?B?WEJKZ0N3anlJOGhJUEQyaUFjeEx4S2h4MkJqT3ZKdjdnUjJQdE5Dcm5OUzJv?=
 =?utf-8?B?NU04ZDhtckdvWDlDOCtSM2x0dWVpaTRVM3pIV01JWVFEdUNqUVRoaEpEMm5i?=
 =?utf-8?B?bTZxelBnQi9WdWF6UmVMaEowN2VnPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3b76ca9-0e04-47c8-dead-08d9a3a3f388
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 17:11:21.2258 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jF/o6eR6ltrIrrKalpsyS5PeFTxf9l5Pz2TOzxKoMi8Ez7qW6/eLVJh3qUEy3uOLu4Krwxgx88QoF3CrCluPRT3OszlfvflWhcAc1eM9kgA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5334
Received-SPF: pass client-ip=40.107.2.108;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-3.364, RCVD_IN_DNSWL_NONE=-0.0001,
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

04.11.2021 08:49, Markus Armbruster wrote:
> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
> 
>> 25.10.2021 07:24, Markus Armbruster wrote:
>>> Several moons ago, Vladimir posted
>>>
>>>       Subject: [PATCH v2 3/3] qapi: deprecate drive-backup
>>>       Date: Wed,  5 May 2021 16:58:03 +0300
>>>       Message-Id:<20210505135803.67896-4-vsementsov@virtuozzo.com>
>>>       https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg01394.html
>>>
>>> with this
>>>
>>>       TODO: We also need to deprecate drive-backup transaction action..
>>>       But union members in QAPI doesn't support 'deprecated' feature. I tried
>>>       to dig a bit, but failed :/ Markus, could you please help with it? At
>>>       least by advice?
>>>
>>> This is one way to resolve it.  Sorry it took so long.
>>>
>>> John explored another way, namely adding feature flags to union
>>> branches.  Could also be useful, say to add different features to
>>> branches in multiple unions sharing the same tag enum.
>>>
>>> Signed-off-by: Markus Armbruster<armbru@redhat.com>
>>
>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>
>> (with simplified commit message of course :)
> 
> Your "[PATCH v2 0/3] qapi & doc: deprecate drive-backup" series contains
> 
>    docs/block-replication: use blockdev-backup
>    docs/interop/bitmaps: use blockdev-backup
>    qapi: deprecate drive-backup
> 
> I figure proper deprecation needs all that, i.e. we need to merge my RFC
> patch into your 3/3.  Could you take care of that?
> 

Of course, but it depend on your 1-4..

Oops, I missed the fact that your 1-4 already applied to master. I will make a pull request with deprecations now, may be it's still applicable for 6.2


-- 
Best regards,
Vladimir


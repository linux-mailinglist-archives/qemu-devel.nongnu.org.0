Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B4138EF8C
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 17:57:13 +0200 (CEST)
Received: from localhost ([::1]:51842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llCx6-0000iU-9x
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 11:57:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llCw1-0008EO-OW; Mon, 24 May 2021 11:56:05 -0400
Received: from mail-eopbgr70101.outbound.protection.outlook.com
 ([40.107.7.101]:34316 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llCvx-0004Wu-Aq; Mon, 24 May 2021 11:56:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n0Po+CwhUJ18hcZ2i/GYFutw8tV71LYU2DvR9jnGLDUFeREbkizZBGKjXsC80snzjJPyPOkcDAX4xyS+ln5C3WLeM0X6B6jNLgHoAE7jT/D7IfmD4KVCfjoma3MZdv44G2joTaclyrWn8cr/Jnd03XMvfA6JKiQJiPIUPKQanodkt7DUNeOEoFjr+HfRHtEDnaGvdkBuxnLcXgofiqp8mg972IOL+RoGR79VTwTBldfwEtRxkBPSRk/syrFS1TOhYg2v3AKv/oZ8ddWrtQbDTuZdO/K+Ih8da374CZ45vh58/+wJA2dcUCxdt+tWtQxYTQO2pLFV34KK2GerIR9KIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ah7ORlTkGPN4wJ/SsN4FJZpFR30umI4awdQI1ELPbFU=;
 b=c7Xc2TZXpKyP4gxaDKzKBLUeoedqzfS5joMEM0HAsSZAxjQKt9YbLGyWOFArq+nQSZj+uYyzmp+q/dTFhGJVWO0NO9DPYXU2Nm4w63DlabN4WfHnuJhDWqzc8MHhrg4cY2woZ5necyYxPG3GKzW08aGWkHTI4+ehEYoz2qaU4VHOyN7l+wS8Td675yrloz/DK/xDv13TFd7x0I3tE3VNl1kT18FiuhPJD/pG9Jk53tV6Vs6iRVxC+JopRxjtR/hO7enpKRonvJiDcmH4bzqRvI3vDBGQtAibBQGpurNQa7f2Qzr3AKlOWN93xZbb2yno300kzdygvspsLrzm9I+ZGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ah7ORlTkGPN4wJ/SsN4FJZpFR30umI4awdQI1ELPbFU=;
 b=dUH8Nl/wW358VjFhrvlk1PItbo2wgwN6ZH/16LDXcqUO7TXQyka86xGg7dik8hQS9ZMErfGf4faojJyv2qwafq4sG2ORay4wR6XdxW7igpxCwID/kBTKPYVRgehP0mLphHgcyz+7FbsJaYok+zwX+/ZXC5nSbxncxP6Hz1pd7XM=
Authentication-Results: igalia.com; dkim=none (message not signed)
 header.d=none;igalia.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5909.eurprd08.prod.outlook.com (2603:10a6:20b:297::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.25; Mon, 24 May
 2021 15:55:56 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 15:55:56 +0000
Subject: Re: [PATCH 0/2] vvfat: fix two crashes.
To: Programmingkid <programmingkidx@gmail.com>
Cc: Qemu-block <qemu-block@nongnu.org>,
 QEMU devel list <qemu-devel@nongnu.org>, mreitz@redhat.com,
 Kevin Wolf <kwolf@redhat.com>, berto@igalia.com
References: <20210524101257.119377-1-vsementsov@virtuozzo.com>
 <E8FEBD24-139F-4918-92D9-5183EECCA8FB@gmail.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <482b0f59-addc-2bdf-21b7-53d07265b651@virtuozzo.com>
Date: Mon, 24 May 2021 18:55:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <E8FEBD24-139F-4918-92D9-5183EECCA8FB@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.195]
X-ClientProxiedBy: FR3P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.195) by
 FR3P281CA0063.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.11 via Frontend Transport; Mon, 24 May 2021 15:55:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1668daa-5c05-46e7-5994-08d91ecc6a9d
X-MS-TrafficTypeDiagnostic: AS8PR08MB5909:
X-Microsoft-Antispam-PRVS: <AS8PR08MB59093D5B86684D37EB34B2B4C1269@AS8PR08MB5909.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wq/1Mueg5EgHwlQDmd+g/lYqO3eVjdPHZhvs532Jd5XM1F+rxT3p8/Yb3YD5LvWieQDsSUJVIn9GZpVUS+ubsxhB+edXUsEjN7A0whYVjWyosnn8vJ8QN8FmNPv61BEUpiAMsL36zUJIgB7QJvY5wRGFVHRQqTPCueEITnIPpKEzfL+d8rCzBjL44W8+Vg/VmcgXv2tMHRgIWjXMH8P+oa8Rl6Yb1DTaRuzOZiWsb4H8FQEqDeEzkZfvBaS+xWwTxs8cXS2NBLTiGWFLLV458Q7fgfcXJL7ERLkjDx1k465E6BmehPUAigUv6qspb+yNPUIB6CmB6Y4J0s/Led7yzGLieioMc1Xjba+ncZOe+J6rUzAFBPQ5NVWHoAk4uiAIPODB+802pVGwNzRDmqq6PytDuwl14ZM3J7wHPA/SKolvaDWBfJAfHcgNtdtZRVfznvuoGRevdR1JEp7tmdc4s8TVzT2X3I1fzkBsbnebMQK+uaW0POdFHl5h9moIiv+NR3eqirAYatoYB5FBnq+gygTOD/xClHWJ+aQ9H2NFRQuWON0+QtaK+YPM14WtLXd/ZRMB0PLZUQChyWHOdCnzVwlSCdYgg6RmNJYbcTX1xUSYZ0vpPvcLupUBv9QOcW1bgcmWnUeCWv6l82Y1G9nTNNKdnk3V3gk0eJSvJ3ahrF+xoAKLNxag2U5OeOLjVxgYbmg1yAQ8Owbs38i5l0wMrQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(6486002)(66476007)(66946007)(36756003)(6916009)(66556008)(2906002)(52116002)(38350700002)(38100700002)(4326008)(53546011)(186003)(16526019)(16576012)(2616005)(5660300002)(8936002)(31686004)(86362001)(956004)(31696002)(8676002)(83380400001)(54906003)(498600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z3lEUU5SYi80M2dUV05CTldKTlJFeVhhdnJVL2hZcS9NRXJjbElFRlVuaWVr?=
 =?utf-8?B?NDJFNWdWU1k3cE1GSFVZRlRzZ1BiSythNGtjSS8ySFJQV2Q5TVFhVUlqdFpY?=
 =?utf-8?B?Sm1TVlpCRm9URTlRSnJUWDJxRHZneEh1dlBRTy8zQm5CYzFOc2gxa0RhT2w5?=
 =?utf-8?B?a3NYbGl4Sk5ueTA0OHlkbGVHL2paZTFROVkwTlRQM082RXlYSXR2UUhzS0ty?=
 =?utf-8?B?Z0VMNlQxRnJKMjA5YU1SWm1GdFhtR01ITVYweERVUC92Nk9iRVF0MkZneVNX?=
 =?utf-8?B?Y3E2U08ydkRXYnh3bjN3MllSeERRdDRtT3pPR2FzTVNpUlVuWFhXU05VaWZP?=
 =?utf-8?B?ZERaeUJ6KzZ1Wm5zR3Z0a2tRNGliTVMyVVdNQTFRUHE2MGJSakRkOTlZTk9t?=
 =?utf-8?B?UTRBVGdSSWhrS2NoY1BON0NuWnBvQVNPMEphNGNFZ3plS0dwajA3d2ZtbXNP?=
 =?utf-8?B?LzVCNVVROGR1Rit6akZiTUpLZXFGa1krVnJVR0tzVG41YWJ1cnpOMWxrUzVI?=
 =?utf-8?B?VjNyMDRIYTI4amtEcWl1U0IwL1lMZXFmWXE4NWZjNm1JVndaV05UMUZTRWYv?=
 =?utf-8?B?TGJhZVkvdVlMTW5SUlhOWkhTd2N5eUJQMmtJMTBoeGtZdXJmS3YrWlk0MkVu?=
 =?utf-8?B?dDZTTlNtQTZOQTU4ZzlFc2t4blkyUW10ZnNQak8zeEsvSUt2Z1NjOFcxNWV3?=
 =?utf-8?B?NGhNaEhQdWhOdEV6MVJGdkVGM2R0WlRrZkgxNkY2Ymp2SUNsZ3dPWXhBTTNn?=
 =?utf-8?B?WlRVeTBTWXdncFRGT2NqYk5IWUVJUXdMdThrbjF2aFV4YzllMlE1S0NrSlRh?=
 =?utf-8?B?TXlIZUgwcUJIb3E3eGRETktjcXlHNTVxTmlqZDhKVUpkT05xZmxlMHZPM2ht?=
 =?utf-8?B?SmJXTHBOZ1ExaXNOZ0hUaFVkeC9yeXg0aDZjbjYrOEJtUUxTMDRVWFk4OEVJ?=
 =?utf-8?B?b3FNRmdtYkFpaDRhZ3g1dGZjMGZsNldyTUxtK1Bxb0NabC9GRjlBYUJoSzlj?=
 =?utf-8?B?SURwOGFFSVdFTm94K3RGelBQbnFqaUxKekZySUgxeWVkZkcrVzRmUDNpempC?=
 =?utf-8?B?akVqSHltWTZxTURrczYyK0dGdFN0U295VkZjWGhoK0djOHdkN0E3S1U3Z0FW?=
 =?utf-8?B?SnZiTWJYUFNuUWVPZ29MNVp3VWpjVHB2bUtCNVYrRVJSNUxLdndWNFJUNUp2?=
 =?utf-8?B?TjNkQlZKTEk5NC90U3BqcG9YWlM4REZ3eTljYzZTajZPdEZpNjZva3ROSGRa?=
 =?utf-8?B?VmNSMUNhMlBIcGkvcDgzdW5ySmZ1Y3F1a3JEZTUwMU43Uk9rODBjMnUveXE2?=
 =?utf-8?B?VDQya1lFd21vVlBDbmFId3hSSGFaSGNIN3lES3VtMEQxL3dEQ2pkbitCY0JE?=
 =?utf-8?B?ajhzaXBMazR4cE9LeHJwUzZJZytnMzJmeVpaSG1Ia0FqRE9oSnUvd0ZzTnhs?=
 =?utf-8?B?NHN6U0t6RHgwUWk5L2ZJaWFYZVROUXNwOXR2OE9TSWhyUFN0dkM1cThvVTU5?=
 =?utf-8?B?QUF2VmFvU2xDTFIyd0NZMjVQeGpRRnlNNG4wY3RQVEQzR3h5T1UrM2Y5SE0y?=
 =?utf-8?B?ODc0Q0RNWmkyME1YVHZ1YVIwWllIT1VhSVF3Y2xaeFJ2ZXFtWEdFbG1KY056?=
 =?utf-8?B?elA5cG0xY3NzbTZFbWhVUWJncXBtc09Wa3J5d2NjY3BvajdZTEJScUl1TVNQ?=
 =?utf-8?B?WEdaS1NYdUx0czJwQmU1NHFzdnBKMTZmR2Frci9TVlFpU2hDbTgxOXg5Rmw5?=
 =?utf-8?Q?n+ZNMnsnm+SvLy8SaHW0G4E9BnHJBeZbkXwRcbe?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1668daa-5c05-46e7-5994-08d91ecc6a9d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 15:55:56.1290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VjUbZxXAfJbo+VWg5y4I23c+R4VXFEF35HSZBPj8FB1PYVj+iNPU1PFbQltA+Vu0JWTFRnfBuSpyRp+rN3mrbKWEgfWdDLNG3qV8U7T8Ve4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5909
Received-SPF: pass client-ip=40.107.7.101;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

24.05.2021 18:41, Programmingkid wrote:
> 
> 
>> On May 24, 2021, at 6:12 AM, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:
>>
>> Hi!
>>
>> As reported by Programmingkid, command
>>
>> qemu-system-ppc -usb -device usb-storage,drive=fat16 -drive file=fat:rw:fat-type=16:"<path of a host folder>",id=fat16,format=raw,if=none
>>
>> crashes.
>>
>> I tested it with qemu-system-x86_64 and it reproduces for me. I even
>> kept "<path of a host folder>" as is :).
>>
>> So, here are two fixes.
>>
>> Vladimir Sementsov-Ogievskiy (2):
>>   block/vvfat: child_vvfat_qcow: add .get_parent_aio_context, fix crash
>>   block/vvfat: fix vvfat_child_perm crash
>>
>> include/block/block.h | 1 +
>> block.c               | 4 ++--
>> block/vvfat.c         | 8 +++-----
>> 3 files changed, 6 insertions(+), 7 deletions(-)
>>
>> -- 
>> 2.29.2
> 
> I applied both of your patches to the most recent git commit today and they worked. I was able to share files from the host on the guest.
> 
> Thank you.
> 
> Reviewed-by: John Arbuckle <programmingkidx@gmail.com>
> 

Thanks for testing! Didn't you mean "Tested-by: "? Or if you both reviewed and tested, having both marks makes sense.

Hmm, also, I think "Reported-by" in first patch should be fixed to your real name too for consistency.

-- 
Best regards,
Vladimir


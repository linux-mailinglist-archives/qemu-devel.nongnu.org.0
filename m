Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D04544429D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 14:44:25 +0100 (CET)
Received: from localhost ([::1]:46084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miGYy-0002tc-2i
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 09:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1miGUs-0007TU-S7
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 09:40:10 -0400
Received: from mail-eopbgr140127.outbound.protection.outlook.com
 ([40.107.14.127]:61422 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1miGUn-0006PL-72
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 09:40:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OVLjbZZs9okjutDJJDROxwdDft/IzB5ibmNVryIVbHOP/WCxfiuUfRfOiD95T4aFr1vfAHn7PzDt829TRsG4Q5mEnK3/nNSlHVOc4HDwIoc6Cn8ucqKoPirzGI7pcYx9TucRCxj/tYlihFfrlw64W8FpFwb1iUdeO3XG9AokNc30I/mnrXaia7FkxPzMx5iHyvjyg5x6IoXaDsjvwvGgzgExAehU/L2d/jVOhLoOlIF1/j+MkkDmJlArPfKGpIsj3Z0SJ+nuswaU54DA+PFsAWnNIlGojWjgh5/kj3Zq3YyW+20AYirvsqgLk01aM3HdAXBSdwktpwn+o96XhZ0mHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/6N/py92dwOvL3XXlUeRx/Uuv92EaZCCei3ThKBfIE=;
 b=dNBX2Ybg9499ERGrFyNkSESxSK9dDUlz6ePto0+hEZA+/BtXmIu2vhrSAA11F1j60ladAbWmeXPrDr3bdzeHXO5SyAVrn39DyMripeq4Wj+dZdE7hVBc+MboYEMeusaJ1Kpyw+wxueClwHwP0WN/3glloQ/JEnVAMc6OO++0jtMqaC8p40JuTbHQTNOQZA8OgYz7llbesFAtw4w3NA7Rgfhni6j+Ttsf+0GeEbQw52vsZbgd+a81ZtlnrTAP9cdUkA8G5/tmIU40NjWrblXaV1yiaAMvSMspgxu356QftPuEEBMCd804RB8hR53qCepq8ZsBmrWjY9cyi4JUgzfzoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/6N/py92dwOvL3XXlUeRx/Uuv92EaZCCei3ThKBfIE=;
 b=GjjXG1z83laTJbeBvW9jokxU+GmBZ3RtEk6ZVxTSF/6ZaJ36PdUjKgWb3lh555LqPkStU/nVvcAMvQfLRDny9qkKknmdc3LVMZ67iEm7yD7HUqo7opjCcbecJBWr3NCMYqEi7VPFxW2aGkOuzxZuWiZ/m0Ltax13NOhp1Img2aI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4470.eurprd08.prod.outlook.com (2603:10a6:20b:b5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.18; Wed, 3 Nov
 2021 13:40:02 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%5]) with mapi id 15.20.4649.020; Wed, 3 Nov 2021
 13:40:02 +0000
Message-ID: <c505d2d8-955d-7c64-b769-80ed40428ed5@virtuozzo.com>
Date: Wed, 3 Nov 2021 16:40:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v4 5/5] block: Deprecate transaction type drive-backup
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: eblake@redhat.com, jsnow@redhat.com, marcandre.lureau@redhat.com,
 mdroth@linux.vnet.ibm.com, libguestfs@redhat.com, libvir-list@redhat.com,
 berrange@redhat.com, pkrempa@redhat.com, kwolf@redhat.com
References: <20211025042405.3762351-1-armbru@redhat.com>
 <20211025042405.3762351-6-armbru@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211025042405.3762351-6-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::9) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.243) by
 FR0P281CA0072.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.4 via Frontend Transport; Wed, 3 Nov 2021 13:40:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5f4cd55-1c1f-48b2-ffed-08d99ecf6fcc
X-MS-TrafficTypeDiagnostic: AM6PR08MB4470:
X-Microsoft-Antispam-PRVS: <AM6PR08MB447062EDA6B30DD02F7300A1C18C9@AM6PR08MB4470.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RT2ruuI4yqVXrxWqm0OmzwgCqraLdJNWzzjWNxSgfJNaMCmjYEy3TPWjQu3YvCxPLVUpBDCm1/MVAyz+U6LbaHtmnwEhJRNRaDtDMKnSGsVrMH7pgJ2QHunr3d7KpM9bGE+Vczy+CJi8HpOITK5HUwb7oL9V49v6e2eKDImm8Q2BdU5sPF2HpR9F63Ym4uolIoiMIPsq3gWUao7YDSpsOnBLyYkQRiSWSS488cdKDU95zpMc7OEAp+6TimDL6wDODM9viL1NmOyM4277cJEWjxAPbuzWcWmw2jjpy0gOOGaCsbvARd7MQBrnMN6ItjTtjPsOE/16FdXCrICrBqgOKvF3zhBIt5BALbEWVAUFmTNJaEkweWZQiEzj6GW/garKbOBvUS6TY31BUgORurAVV8OOE//EgcUy4o5axpYj6Fot3ViDoOafX/76ihevHAGuMPgulF1kluySqtQhyGWjy4OL62TvLgswu6L01Cgtu0lwh74rGRD64i/7EiMY9NY5NfPPMxNMp/fbBzXETa/jJ8QGJ7ny1Sj+xaGdbJADRUadRMHpEQQicP/qYFaJduX3vL7JFxa2mVmIP9T7Q9rNeW6+mmTAscRukXOgWBcx66Ey8DW0IgIHUvlHusAFEqm034wtImJlvp4AKtKWftmALwKcMx/EpITlCF3mTYJMg3zFBiIP1xACVQTkfKdC+zJBtuC148Kc8XJpQzZfuL16/0jnh5nMjUvtk+2h9XhYvZ8C8mqfkjrq2tIqYoJXEVJxdx4WKcVoQ27/ahlVfGzmHF+/bNv3/xVg1pv3z3hh35tZwSsQNJf6/5ayUsJeuEjq6XyHzfVP9onesoqerHK2bgO08P5id9/sAvO9HVJAL0s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(8936002)(66556008)(66946007)(956004)(2616005)(4326008)(16576012)(66476007)(2906002)(83380400001)(316002)(508600001)(966005)(6486002)(5660300002)(7416002)(86362001)(26005)(31696002)(38100700002)(38350700002)(31686004)(36756003)(52116002)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGZQQUlmSWJDOHNwaUtjQ2UvOTdSS2VObU9UMVV4UDRxTzVVbE5hSElGTDRK?=
 =?utf-8?B?OGFFOHRFcXRKMlBmUnJHcjZWbTdOYlpvL1AvZTVwRDREQmxScVFXR28zTXJ1?=
 =?utf-8?B?ZXJ1T0RKWTBEc2dGdTlDWmRqOXNrZ0N6SjVFRmgzVFJTd2llamhtZDNxbEpp?=
 =?utf-8?B?SlE0MDd1aVZaQkQ1NEpGZ3M0K1ZjNTVnVjJhUTA1TWtxVGFwTTZubW14Q2R5?=
 =?utf-8?B?THgyN0J3RFpyWC9icWdKcDdzYy9XTUE1M0VaM1NlK2xQaDd2ZXBKcFpMdmxm?=
 =?utf-8?B?QlgyVlB5YlUrQ2g5WFpzdmlOeWk5ZnJIbEFJTjg4VXQvd2MrNXNISnBPSGNJ?=
 =?utf-8?B?MDJTaURoaDJadVh0UVFITEordytnRXBJSnpGN1NjUHhrbFZNOUJVTWhZckZN?=
 =?utf-8?B?WmdqVHFQd1lRaTNTRUZROTU4ZkhPVm14QllyZEp6S3k0UTQ1YmtWZk5pRFVp?=
 =?utf-8?B?RDA2SzJYS3FhSnJaNGpaamFuWnV2RUU0dmZrSzU4cmljNnIvQU5YWmNrRWpT?=
 =?utf-8?B?V0tXNktBbENIMDArQUtWZUxjUnVGdWR6bXNqU1pMaWFHSXpTOFdxTHNwajNY?=
 =?utf-8?B?UXkzSC9ZMVB0eUNwVUEvL2JRZDE4VEUyWjRSaUJ0Y2FTdmwvRjBpblNDQ1hC?=
 =?utf-8?B?WHdTaG9WZWVRaXpUQytVMU5DTnBzVUZNMXJJdTNWeDVYbi9CWCs0dkIwekw3?=
 =?utf-8?B?bzUyTk1lNHN3djJuT3VNamcxZXo3cUFrZHV1WDZheW9mdGlCbmRUNmJ5TzRC?=
 =?utf-8?B?U2tNZFlGK2JBLzFma1pJQ0FWUTFkZmNkNWVUQ0F3MzVaRTIzN1FTbUp1T1JV?=
 =?utf-8?B?RjdVWG0wTHI5UTZpV3VpeE5oZHV6MGNRTmpYUGFhR0k4QktBWENxaFZJRnAy?=
 =?utf-8?B?ODNuTU82L1dhclBVN2NMeGtBbWR0Y0NoRWRNRUp2a0dhUENLQTM2b0ttczJI?=
 =?utf-8?B?U3hJK2k4d0kwRVZkUHR3cGROaWJrQUdlSkxTTCtWUzQ4Z0xsSkRUelI5RGZO?=
 =?utf-8?B?NnBybVkxTVo4S3QrWWY4VkhQWlBMOXpJZVlDVUwxS0dFVThWQ2lvbWRyOCsw?=
 =?utf-8?B?TjhUaFFpT3BKNkIyQlBWOVZ5SkNtNWVMVG9SZVQzWDl5TWx3dWczVHZjNEo1?=
 =?utf-8?B?ZldXbUNFL0dJNUhtWGhoekV0c0JndHJJbjErWlllR1JLaUdQeWg0TW1KTE92?=
 =?utf-8?B?bUNJTUlCdmZMQWtSTHRPOTJZNnUweGdkT1Q0bVVOYy9NN1RkSzBtSm9waXZX?=
 =?utf-8?B?R29wZmZXN1FTVFhoL1g0bXFGQzlYWmtmbUxVWW5TTlBIRDBmc2NJc203T1I1?=
 =?utf-8?B?UWZRczNJdWNReFNDOFl4Q1FacFVPOTBNeE5FMXJLV0laZkZpdUNTdzgvOGNz?=
 =?utf-8?B?UGpzaWxOcnFiSmZ3dkk3bVJ5Q2JjTGhPeTFLR25CZEZlYWp1RVJYcVFBVVdT?=
 =?utf-8?B?MW5NWWpkUXFUc0Zxa2QyWEI1Rk9ETXNmaGtjb25CT05WdnU3UkNzVkNQMHZ6?=
 =?utf-8?B?ZWpWN05lZFFNak1yZmhLZnd0Z1hhVU1LencrS1B2ZURCRWpyYW90QVNxOElP?=
 =?utf-8?B?d3FVUzl2OXBLRnBZNzc5dzVzK1haRk9KQ2grS3VZVkJrY1pOYW5ib2ZKWXNL?=
 =?utf-8?B?eE1ONjZaRkZIZTNUMVFrRjVINjhZcnNzd2VwUXlNSElEVGFyU1JDRzJuNGVl?=
 =?utf-8?B?T2RFQkFHZW5OTTZTY1YvOUNVdEkzVlorRnhvd2dTdFNJRnM2TkRHdy9CaTM3?=
 =?utf-8?B?Uzh6ZW8rR3dFK0duVDNISGcycXl0L3YyaGVCYmlZWDRDV1BvUTBwRkhBR0FB?=
 =?utf-8?B?eTVKdUNLd2NOQXNZZzVpODV4dUZMRG5qaTdpRUQxZS82ekdONzhxTVBSM2Ur?=
 =?utf-8?B?cUhtczVsOHhJOXpPc2tXYktPUVVlT2R2THUvUEY5SHhsb0ZzbjhCQ0NjMmZs?=
 =?utf-8?B?QTNLWm1hY000ODhqdVhiMUJEM3dOKzQvc1FaRlBLdE9UTzdocmlCTXQ0R3d0?=
 =?utf-8?B?TEpFa3RycEc1SWg5akdSK1dURmxsVXNaZ2FaR2FiencrU3ZzY0pKSTU2L3p3?=
 =?utf-8?B?N0hrMktNM09wcDlTQnhXbjhiYlgzQTQrUFZ1dHlSWXpIRjllWTNBSHZIU3JC?=
 =?utf-8?B?MUFETVNBRFJLaGlWOGpleTlUUjFaTW1PRTc3NHEyb016NThlaGJnYVdpeDh1?=
 =?utf-8?B?T3BVSkhZQUxBZU5SelFHbDRQYmMreG9nK293eS9MSTZYNmZkd1g5TEVmTk0v?=
 =?utf-8?B?bEQ2bHdYUU9jNld6bm1JU3E2THd3PT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5f4cd55-1c1f-48b2-ffed-08d99ecf6fcc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 13:40:02.1835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jsKyNIWP2/bU+sSYCjvz4GMDNCnMTz1hUynmd6v6ZZq991/FhUrK7rQB/FB/s+6Q5+ZHNtZryAhIOwBhRTfguBM2AQ0FcclHCmKgrRvP2Lc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4470
Received-SPF: pass client-ip=40.107.14.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-3.528, RCVD_IN_DNSWL_NONE=-0.0001,
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

25.10.2021 07:24, Markus Armbruster wrote:
> Several moons ago, Vladimir posted
> 
>      Subject: [PATCH v2 3/3] qapi: deprecate drive-backup
>      Date: Wed,  5 May 2021 16:58:03 +0300
>      Message-Id:<20210505135803.67896-4-vsementsov@virtuozzo.com>
>      https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg01394.html
> 
> with this
> 
>      TODO: We also need to deprecate drive-backup transaction action..
>      But union members in QAPI doesn't support 'deprecated' feature. I tried
>      to dig a bit, but failed :/ Markus, could you please help with it? At
>      least by advice?
> 
> This is one way to resolve it.  Sorry it took so long.
> 
> John explored another way, namely adding feature flags to union
> branches.  Could also be useful, say to add different features to
> branches in multiple unions sharing the same tag enum.
> 
> Signed-off-by: Markus Armbruster<armbru@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

(with simplified commit message of course :)

-- 
Best regards,
Vladimir


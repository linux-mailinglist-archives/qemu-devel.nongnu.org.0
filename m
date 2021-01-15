Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A722F7760
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 12:16:31 +0100 (CET)
Received: from localhost ([::1]:54284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0N5h-0002Ae-NO
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 06:16:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0N45-0001dw-Cj; Fri, 15 Jan 2021 06:14:49 -0500
Received: from mail-eopbgr70108.outbound.protection.outlook.com
 ([40.107.7.108]:65349 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0N42-0005C9-Ke; Fri, 15 Jan 2021 06:14:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BrAz+0W28CdxQ2SafhAxmP6dYDqiYRWITOanXcT2Gt/v6rqRiz9VozJOwVqg/ltja1/daScCRqZQRFlIy2YvLKQNtCVnbFGz8ahL9CZZ2DraO18dHhq3vb3cciIs67GCWqtJgoY9VWFLbgR98HpdVN20EcAX4yYU4zFqCpSPxrLZJHuE61+SWFRSuGEWeSNBd+KydL8T/xivRbLuR0jrJvG6ZNKmHafz5LMolVVl1kYXR5sYit8ybJzoTVTzjlKwqRgZelA+1Zyr0vUKuGLL4lNEm3Pwe3NQNKLHgN9ercqBpoeRDsi5QYlxso9G0bCbeWUNDINDbibxcPYCaJZe/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8QJYuw/1aLIsufHxrKLG6zYspOlFncZR9Z8ddb/B/v0=;
 b=HdsC03Llx+pcHclytEkagyES73NvsAdW8EjdmFonGQwnsrkRqxJVJBE9AIgy2iNhAT993Q7coqeMQezZ7vQq4116V7Rh3CiOdaMs4FvRMTyK/NgcYt1Zi3PvtPlwPMILxgV4C9rqvJZXtYoZI2eT9ruqanmqrvZK+yKy0+5ymFVnp8SAA6ntB9QyGwGLODiMj7Bw5vsA6QBAKop91CNrLaSA/hyenN6iLT1Eh0JMklimuEy78MwUl4m2aWWS0HNomYd2TLKPEm3DlonZ9WrUyDEJvlGk0lDS9iPJ+wQyf19DvZH/bBmCMtbi9STqYcayatjlZuLrVcgrRvj1G82xLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8QJYuw/1aLIsufHxrKLG6zYspOlFncZR9Z8ddb/B/v0=;
 b=la02PrUpqt64txbcV4MihdeVOphLFFft44MxrgWUaHiWxx7WDdXQsgmqiXYz2o8O8RAIq/GhkgW9bFnFpHWVBZpHOGp5PatbNx90EDZp6Ee6pb3htAi0ZImXncoJTMo+qy+VcL3aMd+IdUoCVTKkIE+EItNMQkNcjxXs+9t3Mvo=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4949.eurprd08.prod.outlook.com (2603:10a6:20b:ee::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Fri, 15 Jan
 2021 11:14:11 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.011; Fri, 15 Jan 2021
 11:14:11 +0000
Subject: Re: [PATCH v3 03/10] iotests: Move try_remove to iotests.py
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210114170304.87507-1-mreitz@redhat.com>
 <20210114170304.87507-4-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <1f4a9658-379c-5d23-5588-206774063fd9@virtuozzo.com>
Date: Fri, 15 Jan 2021 14:14:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210114170304.87507-4-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.75]
X-ClientProxiedBy: FR2P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.75) by
 FR2P281CA0001.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.4 via Frontend Transport; Fri, 15 Jan 2021 11:14:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfb240ed-376f-41e0-0f95-08d8b946af80
X-MS-TrafficTypeDiagnostic: AM6PR08MB4949:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4949FA8470DC3039852D46A7C1A70@AM6PR08MB4949.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:400;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gh9BStmEjt/wFHI4NvIhX30D97OoWGwgbycUzSvG0hlfDwWiszRUEasupfH46Av7B33aTS+XT4arqSBnWwwXtXky/5bM/0+uNiZ9shE+m9Op4xGbowmT5PoDh+XAbROJxp3PTOTDGqdHQqA0vjFNm7siPB9HvXD8M2FTCwt2korm5IZF1vEIFTdQDW2Qcxl9lMQmbEWz/oY7MK0llxwMxpqQVD6d/u5RXyFkTlupApVP+fVb6CZC+h5IAVHGFnB5ceHNbtyh4cxFLTpz0yf2gUwRTvoV+G4jBWk2RJzrpNI1HHybZkF9jbXj7x/pEpjmA1UhiWPpvorpruipk+H+gRA2FZvFQu1JfhIgltfPDv0emhMmCHhsJ9RruillMi/cjDM7Vmh6aibw9gBFd0vBwu8IJy6fC+7/iqZrJQCNoq2Y8GurF8N61b3C7pRVqmfowQoaDQoY5cS3dz/S5r/iQLcjGQmt9JzyP71+erJfnpw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(39830400003)(346002)(366004)(5660300002)(86362001)(36756003)(31696002)(478600001)(16526019)(2906002)(8936002)(186003)(26005)(4326008)(8676002)(6486002)(31686004)(956004)(2616005)(558084003)(16576012)(66556008)(66476007)(66946007)(316002)(54906003)(52116002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aW5ZREExT1NQRFJlVm9pbWdZRHJaQ1VKYWh0SjNwRllqdlZQazdhVTM3ZFMw?=
 =?utf-8?B?d3NmV2YxYnNLcldnQ05qbjgrME9KYjhtOGlvSEdsQ0hvT2wxOFdhSER5N29F?=
 =?utf-8?B?UGxFZGpRY3Nua2hseWFEVzZWM1ZUVi9pekg3b1hNaStnRkVLbnhFRVltdFFx?=
 =?utf-8?B?aWRHeEdGZkN1UlN3Y3Y4WnAwOTZlVWFUU0JkNUZZN3ZJOTEvVWZpQWtIYTNw?=
 =?utf-8?B?ZWxMdkxVZHUxUmpLVGsvbEM0aWh5RVJ4a0NaMStzQ25OQXRPUDRnQTk2MkpZ?=
 =?utf-8?B?bXg0M0NZTlZ0dWxwOEVHNENsRnV5WXg2dHhuRjZRdlRrTG5JVGtERlRZU0FM?=
 =?utf-8?B?bEkrTklSSllNak4rZDlUT01hWnRESEM0VDZUZFREM3VvRkplcU11NmcyVTdU?=
 =?utf-8?B?MjRMUnRJRFVKNi9kVDY2NW1xcmZldGZsaDNBR0JyU2E4azV3OSt6T2VxYUlw?=
 =?utf-8?B?dTRzNkFwd3IyVXlEcXkrMmFqVm9KZjFWSm5Ud0NqdWxPVVBwNXVMU0JzYkFh?=
 =?utf-8?B?a0VXeVQ1a21qUSswcEJCL2JWdEdJcVZxZTE1cHpxZWs4VlMvNytNR1hkcUhs?=
 =?utf-8?B?YTA1RHlibTdwN2phTVNpU2JkWWhLTG5oNkVKKzQ5VVBQczgwbnJaRWVDdmhW?=
 =?utf-8?B?Q0ZhY2dvci9RdTgvRGhuck9tMERyYlIzUkgxMUN5cS93VElqRzhDdUhqd0FY?=
 =?utf-8?B?OFlzdnJSV2s3R1lGbGM4SDdoNGVIclZnTXhheWo5ZHoxV0JnaURiTGY0bklS?=
 =?utf-8?B?dEpsdmhJK2RkenNUc1g2eCtiWmNQV0VqTyt3VTFveVNjSENOUXU5MDRyWXdp?=
 =?utf-8?B?a3FDTkdXMkdPeVoxYkpDRTRIclVYNzFYM1FJb3VxbERrc2RlZWN3QUZXQVZ6?=
 =?utf-8?B?a3oxd1dkUEpQNnZybWVEb3JtTk5vR2loblJvYXBCNWgzQVdJeEdCaXVUQi9q?=
 =?utf-8?B?OXRlbHU2SldNdktuNFl3MUpwbE1UTnR4SGlVRFc5bXlaSHN4c0VDT0NaYVJQ?=
 =?utf-8?B?SVRibHNsS3lGRnhtcGN6cHBVY0dyN3dyMUNiZ1g5UnhsRERaSkwyRVRMOFNM?=
 =?utf-8?B?amxUK016alVFVkJYRW1GeVNUWW1DNWMwWGkzVENZN1pieFovaXZwaC9WRVFN?=
 =?utf-8?B?YURPTmE0bjJUN1ZsbDh4d0RVOUM2d3ZITVA3dVMrZVlzS1ZGVm5YVnphQmtX?=
 =?utf-8?B?SERYZkFROThrVFpSTG1rRlBjR0tjdGhNS3BQYUUvTC9vN0Z6MklWcmwrY1J5?=
 =?utf-8?B?dStoNDJzNW1xK2cyQk52RGRPUlkrUXI3ejEwWmdaQkFmSzU5SFRUdlh3dFRG?=
 =?utf-8?Q?in17P6HmXAEnpfVvc2JgE97E9VyAtwjmeW?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfb240ed-376f-41e0-0f95-08d8b946af80
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 11:14:11.6891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dqj3cOuIZ4zh/bLQtsUYJwymU4xf+33G1pwProkXjJYMofWoNys0JcoOcHdphxyhsakOh5aChlVFw7U9bTUQlpRLPpfZbG5qgpsRycJaxgg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4949
Received-SPF: pass client-ip=40.107.7.108;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

14.01.2021 20:02, Max Reitz wrote:
> Signed-off-by: Max Reitz<mreitz@redhat.com>
> Reviewed-by: Eric Blake<eblake@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir


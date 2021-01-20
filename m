Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EA62FD210
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 14:57:49 +0100 (CET)
Received: from localhost ([::1]:44206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2DzW-0002dc-Hg
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 08:57:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2Dxp-0001YQ-0C; Wed, 20 Jan 2021 08:56:01 -0500
Received: from mail-am6eur05on2102.outbound.protection.outlook.com
 ([40.107.22.102]:7233 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2Dxh-0004Xl-T3; Wed, 20 Jan 2021 08:55:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gFh7JauLplUAe/HK9cFN8kzmr5EH4zJjdt4a8kObH37a18FG5yZMHMZH59OPFH/UJsNR8i3zbY4+mhmimHOv/zGDrvZUFkKxYa4azvxm0WFIovO01kMRb99iDL50gMibuGirJw71g1iJ0p625Nqf/huqW+NqkTEkr/Esuwtwem0ZgxpsIoriA8bhs7tjJhO9xIWdB5tZxy7svqKbvG+NAOjSlOlM1x5iakiFJaTJUIVTEe57M5/i8daRQRJauPJnifWFUBUCra/iacWJDbxvGmL+5vJZn8dYaEvENEMqJgDb34wUcdfCb0if73cdiKM4XcI3EcD/e0tiERtmg3qpgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mX7uGhEaUnIPt/eykOLJuEFc3gWVy9uAEy3Au4G40Eg=;
 b=i8Qr8DYDYPjdeXQxRoybqbbgHo1gZGc8rgGMqVjz4EtV4edrThgSeJMYAcsx8Rb9Q8Ywvz+E/Imu794AfNz+PEZcOLV4tGRYaNC7iBCqz4jlgW5r3fcv8zpuQ3bwg3ljgOV3x30ctLxc2Rq4FcGIyvBAKbQHNI+ZZhCePWsEkUmalY7k89xnGMiJBPuzoVPdNuGzgRbw+LAwJgwfKwsiqaMm2GN1AZBqSeFhMoQ6X9672T8fcvIELkehnJ57Wu4wgJJCa0/ztvBnjvyOfClfa5WM9XISDU0SdPVYz1xv4VSLQ/mVOnrOrOUrIow7Du1X2T1ELHjm8QJdzhQV36yshA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mX7uGhEaUnIPt/eykOLJuEFc3gWVy9uAEy3Au4G40Eg=;
 b=dsow7TvC4HeggH1vCIOFbYT1ugwGg4VdSCr3BvK6gKFxy5IL8RBG85ei+dncp52hVV+5zf4VjsU0RMlLqVbUMatGyQWwydv1IHEtc9ctWltmN/1Lz3oD2qRQw3ecJn3tit8KL6WRlTw24zZNhG5S6JOEsjxOkEH9fmN/RMDzl6A=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6534.eurprd08.prod.outlook.com (2603:10a6:20b:31c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Wed, 20 Jan
 2021 13:55:49 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.014; Wed, 20 Jan 2021
 13:55:49 +0000
Subject: Re: [RFC PATCH 0/2] Allow changing bs->file on reopen
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <cover.1610715661.git.berto@igalia.com>
 <dafbbcb3-9d87-ab04-5413-eac551cdfe44@virtuozzo.com>
 <w518s8npvgg.fsf@maestria.local.igalia.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <46725429-f50c-ca09-a968-ad11eeb4d5cc@virtuozzo.com>
Date: Wed, 20 Jan 2021 16:55:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <w518s8npvgg.fsf@maestria.local.igalia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.70]
X-ClientProxiedBy: FR2P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.70) by
 FR2P281CA0016.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.6 via Frontend Transport; Wed, 20 Jan 2021 13:55:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34b41fe2-07db-4770-a0ac-08d8bd4b17aa
X-MS-TrafficTypeDiagnostic: AS8PR08MB6534:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6534159AE3603A867BA895A8C1A20@AS8PR08MB6534.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TZDQDEVpfrlmSVqh4cqDlyZ14FkMOQh3n3yylUP25vkYlxdG4nRJ1GFc9deixnb7LmrBFpByvRiqgPxPF8+JWTEcGEnxCO56HCPycoHhWKk4LuL+VC+weRSN6ZarmdwyMsbcZjT2BWpvXajqdhQuGx6pESxREM1hDZvtrteMlYBYSiZlRjis0DWSaeX5kN4tSTmgzxqGH0qF7teth9dgzItAd91irvDDUbLULPrCDbwJpi+79l6SBuC+HtADZ4qp65fURE7zFdxpxaxbA2pCOt9+/RVp9hvozZOYQ11LKXwVxq+l5sv/NWXNsgPTyun5hUyH8o+62iOvFOAVtQBdlRqvKffnY408dNxjYl9z5VlXl0LcohfqQGT9M/3Hel8+PQ6pHK/kpva4M8lIJUOzNmGK6YMylBrzPlUw7HAck5Dk5qgod16Dn4ZBZaiMXG/I5t00gfWOd2Aokj2nY3lbNeArTHPNixDb6g70CwQ+aAL5pIiqU+p8b/Rc9l0YCHM4aFvwhXdS6XhkZ7+MshPkftnelhXnpbt6hEI/ZGZYkUBtBZTnUiMmNlO4lYstexv4ROVEPbYvBO3UJHUQSMdfEzBPQVuIIx//CYpXqmQ4UDE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39850400004)(376002)(396003)(366004)(136003)(8676002)(8936002)(956004)(36756003)(2616005)(16526019)(31686004)(186003)(6486002)(5660300002)(4326008)(86362001)(54906003)(478600001)(31696002)(2906002)(16576012)(83380400001)(66476007)(66946007)(52116002)(316002)(4744005)(26005)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OUF4ekV4dzA0eGZKTEJRMGdBRHZYRDVqR05jYTRRcWh5UTVvYXFNNEJxb2Iy?=
 =?utf-8?B?SnN0REs2ekJHMW5OMEkxUGlCY1RkN1VTc0JBTDJiY0VLZ3ZmcFR2cWVwRmg2?=
 =?utf-8?B?amxhSkJkTzNNU2tTTU9YbWxIZHBGUUZpVjdiRXdLbXMrYXpLM1pMbERwbWI4?=
 =?utf-8?B?aWpiSUhFdzZERXc2NWcvTnJYblFjdkcrdkQwVTJwQ0l0bnN4T0RyaUxwWFZW?=
 =?utf-8?B?cFFiZStyTkRYNlEyNnBQcjZFNmhDdkttcGJpQ3hsMVU3UEdINk1ENElPbTBJ?=
 =?utf-8?B?TWkvaGJkTkgrS05uU2dCMWlkRERTNFhPb3ZjdGVYeTR5aWFabDJVRldtNXgv?=
 =?utf-8?B?SzExdjNSQjNtYVpHYnN5MmoxZlg5YXJCcVE3WitvZCtzb2diWUxBYjRBWFBI?=
 =?utf-8?B?cncxOFQ5WjZQeVZRSDYvTGoxYmtYNnBYMW5iTS9kaGdaVXY4R09EOVlsSVJM?=
 =?utf-8?B?RTNjNytlaDJ6R1N5bXFKMkF1Ty9KWDhrOTlsaUQ4SE02U2kzR3dsRlFOaTRs?=
 =?utf-8?B?WGp1MC9BaDQrcE1hUG1CcnZ5eHpTYVJGejUwM0FVZzNIU2dnNnhxaHp6bS9w?=
 =?utf-8?B?SXJXdFFIckVIY2JaL1RQNEVrRW5YcHRaOFlvZnVvZ3lHUjBmMkNKZzlKNkV5?=
 =?utf-8?B?M1U3eU1oZXVyOXR5MFZpZWZ2VG96V2RmVlJrMXZZYnNHOG5LWGRoWjBRSmVB?=
 =?utf-8?B?RnBQT0M2SFlyYkJtOTdHL3lvRFlQd2MyYytZQS84TjRiNWJkVjgrREFPVVNL?=
 =?utf-8?B?cmk4enhRM2tLbVFKQnpNRmR1Z2taQWQ5VkcyM0dxUnFBcmE5Tkw2ZCtIYkhu?=
 =?utf-8?B?N1dXazdTYzVmUkZxcFRCU2VVY2hUZUNjSHJMeGY2aGlxNUkySlpjVUlnLzNZ?=
 =?utf-8?B?dk12cUJZZ2l3RTRnL1BHeGZIZzJhUStIUFY3WUh1QmVhaS9pdVMyUUZ1Wk56?=
 =?utf-8?B?N2RhSk5JZE43Q3RmTUVuVUJMQURnQU0yMTVjc05UTHlnWUorOS9PUzJjK09E?=
 =?utf-8?B?dVVOa1ZkbDVmRXZWQlhpL2w4c1dkRy9TWDZHSzBaTzc4TGR5dVBnaW1KVVpt?=
 =?utf-8?B?TUZvREFsNjE0c0RzWEZaOG85VFlNbXA5NkhGeE5GNGE3NW95blY3MHI2MXEv?=
 =?utf-8?B?cUxyZk1ZT3hEK0oyOUMwY2V5endnc0poZjlJSlZQUGdYdXZ6dVpFYy96eXFW?=
 =?utf-8?B?cldMSE5UODZObFRKSW9zYWVkUWFxZVdnN25CTHovY1NHbTkwang3SHR2aXVR?=
 =?utf-8?B?VHYwOUFDSGdRWlFiK0k3WElUQ2VDcVBQem5wWjlIMlBqbFFhNHAreUs4a2lR?=
 =?utf-8?Q?KXEVNerAjIIML4u00j+g+TeoTACzvOJU2R?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34b41fe2-07db-4770-a0ac-08d8bd4b17aa
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 13:55:49.1952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ys4J6pgv3fbF/uaI8YIOt5bfDR10yMTqx8Ot3RdDejLvQgkYg1fonRSqA+CV61cPfNN9mrk/phjPINthX8yFKhvFkDy8FgBapiX5FPSQdx0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6534
Received-SPF: pass client-ip=40.107.22.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Kashyap Chamarthy <kchamart@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

20.01.2021 16:51, Alberto Garcia wrote:
> On Mon 18 Jan 2021 11:22:49 AM CET, Vladimir Sementsov-Ogievskiy wrote:
>>> This is still an RFC but you can see the idea.
>>
>> Good idea and I glad to see that my patches help:)
>>
>> Hmm, still, removing a filter which want to unshare WRITE even when
>> doesn't have any parents will be a problem anyway, so we'll need a new
>> command to drop filter with a logic like in bdrv_drop_filter in my
>> series.
> 
> Do you have an example?
> 

backup_top filter



-- 
Best regards,
Vladimir


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CECB3252BC
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 16:50:16 +0100 (CET)
Received: from localhost ([::1]:58672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFIu7-0004S8-B0
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 10:50:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lFIsS-00038C-Th; Thu, 25 Feb 2021 10:48:32 -0500
Received: from mail-vi1eur05on2132.outbound.protection.outlook.com
 ([40.107.21.132]:34643 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lFIsP-00065e-UY; Thu, 25 Feb 2021 10:48:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OJOy5ewvj5IRZK0akPVZYMguOkztnJO0AX4lLokileJXB2s9j7GyJHxnsIQbg3doC0vTqL2F0ZDlb8FGYBwwWUIwePEfLdNODQRm+QZIzNkb7RM4d2uT6kDiEz6idRBLBI6X2b15x3v8QAftB6eL3D2NKadD2BWF4r/3OENCrG1sz/sEpCePESel4X3J6gFwDkKfsaoblNF18e2hsAM9lMIc/hshh8wped2OPagC6LfBwVTwGpKtNqdwQYBZSIcKSio0S+txhmKeoHuU5Y7eMl+S3Y1iz2QrkqOfh/iMIiEhpwKmG2fktmoe29Juj9RgQJbfSlTEzGZB+Po0UK43pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQJXqdSH/iE40vUdqqVrXpk23vzU5z+jh4AYLro//g4=;
 b=R2brNimF5a1W4mvAK0MrIq3XyUFLrnESOsrypyquaPL74JyAyFdBp4Nu5ZeOhdexSh4grsSXq9/uJFsIItQahHNzVVGf/ppDvG+U/Di/4jA/AwyYd9VEoWMl972fmYPbyH9z3m0YYAetfJREW7N7lJdXzorOYwZ2U3XOBip/3Vep9KgzLHIiUrMaQEheUlXZJysygPwA+6ZIHYqNa/0o7Ys1ThXzfApJRcNFem2CyUc5pg/L6rj/6N6NF9Dzn/MHhaIMLmVO/lSFE7cmC/PeuZ+0DoihGt6LdgzoztpR4wUOIZZelcpi//a7xOpZYupJd2LSUvIFf4liLjAEiCXQtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQJXqdSH/iE40vUdqqVrXpk23vzU5z+jh4AYLro//g4=;
 b=EgF/YyHhe2MdOCvaG7AbSh3zEoavsPu1UJGpBGWLLIYYzjSdMpaMBxTS8O+R5WHYOLgi7kBMWUJyD/kBiMuWWgpeoRDVvcc3OBOe8DXfKgB4YXrLoRdl5+qsmYG8CDuEl8hf9aHM0dPlWO0Jir32RSJm8EeStKtMke73Pmf6VnY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6502.eurprd08.prod.outlook.com (2603:10a6:20b:335::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Thu, 25 Feb
 2021 15:48:25 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3868.034; Thu, 25 Feb 2021
 15:48:25 +0000
Subject: Re: [PATCH 12/14] block: remove dirty bitmaps 'status' field
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Cleber Rosa
 <crosa@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Fam Zheng <fam@euphon.net>, Markus Armbruster <armbru@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, libvir-list@redhat.com,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Eric Blake <eblake@redhat.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-ppc@nongnu.org,
 Max Reitz <mreitz@redhat.com>
References: <20210224131142.1952027-1-berrange@redhat.com>
 <20210224131142.1952027-13-berrange@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <74f40381-db8f-761f-7e5a-6778827efca3@virtuozzo.com>
Date: Thu, 25 Feb 2021 18:48:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210224131142.1952027-13-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.253]
X-ClientProxiedBy: HE1PR05CA0131.eurprd05.prod.outlook.com
 (2603:10a6:7:28::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.253) by
 HE1PR05CA0131.eurprd05.prod.outlook.com (2603:10a6:7:28::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Thu, 25 Feb 2021 15:48:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca2abcd3-8144-4ce4-9830-08d8d9a4c7e3
X-MS-TrafficTypeDiagnostic: AS8PR08MB6502:
X-Microsoft-Antispam-PRVS: <AS8PR08MB650276C50FB79FCB13F23E8BC19E9@AS8PR08MB6502.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5Ou+b/MpYFjDFG9+0CNi4CDo9qJkjCtPxAvKs0ECaat611xeqaXgMZRQ53rvBMViLqUHdUSgMQdoSHWPeBC/gFPTeNx1DRjcAg8N/tZpVWxOMdGpERnmuPqvokiO0+xShH8kNWQ+w/8bb2WsISgDD+iFqmo00aZ2SxgdeW5R5U02MCPE05SMLLsM0s9dMs5TyTsUuNZkRNeOZCBy2aWutrcgNsUVId8FLLfZRnBKicZTokNiu5J0VNXTpS5Vf5pkG606/FrS4w11e1KZJyiXbIbVyO6MIQR3JaRXc07GixuXZbAZiSrmnWNcza3RlX4yXrh0t7pvZ6ck2JYQ6YMm8a2t2QhYLAfbCPkH8KfZaJ+Ccp2ky9OVtmXS59ensEzY6o5ULxyXX2Jrl1igFWDEtjxQOu+Y9dHOTHU+lRr0pKxkmum2FA0P0VdYuAwC5pE3o4ch99wbHlCNbglZorwSplxCYlIzforAifDHGvC8iPttvMBglA9/lqNlt6ybSHl09X/jJn3GVMn5PKfdA5Nc02z1NC06mjSCViAffddoVRHUzE1jnZMq8ham/zlbDx6ov8TU0Dg/AZP1qtuL2Cq0vyiI/iCh99j/LcdZvmRWhJCA34CC2OXF2tREOBT+ya+M
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(376002)(346002)(136003)(366004)(52116002)(4326008)(31686004)(558084003)(7416002)(5660300002)(6486002)(66476007)(66556008)(66946007)(86362001)(26005)(316002)(2616005)(956004)(31696002)(36756003)(8936002)(478600001)(8676002)(16526019)(186003)(2906002)(16576012)(54906003)(14143004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NHp1UENpZTZJQ1RaYXhCeVpyaWdIc3o0YmFrNWxJUURReWhLdWw3ZGVJZW5C?=
 =?utf-8?B?Zkt1QzNsSGtocFkzdFNaMlkvV1dvVThVZnd5eklnMmlYNGlLcEFaaWtMN05S?=
 =?utf-8?B?WGJQYkFpaTIrcExwNC9CcWt5aDRxMHlxc1pZaUNRcmMxMUVyRWJhT2JqQlV2?=
 =?utf-8?B?ZWk2cWJ6QXRrMnRTM3pLMFRaWjUwMGdrNmZWZytRT2tUdjE5bm15Q3RSakFJ?=
 =?utf-8?B?QzZ1WUtlUDYvTE9hTGFVVGZCL3RLUXlyVm9DZlB0TkdnOXI1NVhzMDQ3WC9o?=
 =?utf-8?B?ZEoxRkFsRVVxTk15a0FYa1d6b2JFY1oyNlZyRzcvbFBGcFdvemk3emp3Vjdx?=
 =?utf-8?B?cUVKdjhtRXB3M2hpTENyZFNtREZPRUtFWGpXYzBQZnpXWHNBejBnbU1jaDFZ?=
 =?utf-8?B?Y21hNy9XS3NlcGJDa3p1N21kK3lvZmVRTXI0T2FrRFgwdTA3TFBzYUk0ZXdk?=
 =?utf-8?B?TFRwY0M4dllWbjdqZVF3VVhocGlXNFY0Q0UwRlYrTzFjNExtZ3dsakF2QVVG?=
 =?utf-8?B?RWQvM1ZRTDJlMjhtTFV6YzZ0c3VZc2FVKzhkWTFwcHhvazNadE0wWkJNeGxz?=
 =?utf-8?B?cXFZVlNtOWNmRjBFdHFDVFcwUm1TUy9Fa01RaytDVHUwQ2tGS2NjbVRXTUQx?=
 =?utf-8?B?bmlzWVA2Y3U4aGsxMGlQM1JCdjNaVDEycUQ2cDQxU2duc1NBTjI2ZTh6NHVp?=
 =?utf-8?B?R2M1OFkwSjVySUJmZmwxaWZQdmtpYUpqNjY1MUZOZVJxc2tiUDhhRVFwMDJH?=
 =?utf-8?B?VTdwOU5xcmg4a21iclNoVWhvOTk0T3ZxRjlFZzIvcGJGRFV3NFErdHV0anJ1?=
 =?utf-8?B?cklFbWxzbWxPTmVITndlQnptTEIvTExzSkhYUm5jT3FnNElhOXc3Q29WTXVG?=
 =?utf-8?B?bTkrRVlVa1RkWnN1MWYvUGF1RWxaN0dhM2NrSW9UOE9INzNYM1MzVXIxSTlk?=
 =?utf-8?B?WnRPS0FaMTQ3UFNRUnQvdnh6UHkvNlBXaitwdGNaUGF5T1E4RjRjdVRPaEtM?=
 =?utf-8?B?TGVzcjBUamt2c3UvUVozOWJYZU5ubmczSXJ5K1VPOUsxQ3pUMjUzay9xZmZm?=
 =?utf-8?B?WWFCSCtkVXVDb3Rzb0kzYloxcTJkZFoyb013M2RxZ3BYNUQrZXlqQnQrUWNH?=
 =?utf-8?B?QXNKbVoxUkViQzZMaTJraTNPdkhvRUNMdDAzMEtBeU9uemxwOFI3SFlORmM1?=
 =?utf-8?B?T2pFMy8yWnlVYzR4bVpobHA1YnU4d2JaQjJQRmQ2eXJxZzlYajlRK0lTQjNu?=
 =?utf-8?B?MzM0TEJBUUxsdlh0QmlaYmZPWXVBT2ZlTFdSQzB2bVVObEZwb2F6R2RDQ2du?=
 =?utf-8?B?cTluaE5EeXUwelJoK3NLRkZSM3FJZER1RFd6djV3WnI2UEgrSG81U0o3Vncr?=
 =?utf-8?B?MnBEM3ZLQ3V6S1FPTXBYWVdaRDZQUFNLc0Z6bjc1SDM0M0w0RWxuWkp5QVJD?=
 =?utf-8?B?SFhWNmVhU0l1dkMrWTg2S2lzUWlmU0UwcGVaWFMyMFRycXk0MGxla1hxeUpW?=
 =?utf-8?B?Z1FVU1A2eEVRNkJULzNDYjRPRHpFcVp2RktBd0ovOHU4SmJUTUtKc2pXZng2?=
 =?utf-8?B?eG9RN2ZMbXRKU0RweXdYZXAzcjUwSWNrWStRaVlLS2ZHSnlRTEhDUnNNa3lp?=
 =?utf-8?B?Y21ZTDl6NEx6NUw0aTV2U3V6T3NTNlhXNllKeEh6N0ljUEEwd1BWYlphM2tP?=
 =?utf-8?B?SWZidEE5dy9pZGlCQ3JoamdJcUt4d2dadmRpbitqQWtyeDdNaW5PYWJVNGtH?=
 =?utf-8?Q?/e55ummC+Xhr02WPynkrWQYqR/HMItaaRebcRAG?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca2abcd3-8144-4ce4-9830-08d8d9a4c7e3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 15:48:25.1879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ki9U8TukM3OIPfboogTdByiWjIQWf3TKitO8tYCSZY5jRmUsWlWyq53qs8yC6qCtbhRSVKQm/we+fuet3lcKCwwxPYPhqdnJ+vv3qhJLgpw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6502
Received-SPF: pass client-ip=40.107.21.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_NONE=-0.0001,
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

24.02.2021 16:11, Daniel P. Berrangé wrote:
> The same information is available via the 'recording' and 'busy' fields.
> 
> Signed-off-by: Daniel P. Berrangé<berrange@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir


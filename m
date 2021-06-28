Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CC93B66A8
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 18:24:11 +0200 (CEST)
Received: from localhost ([::1]:54518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxu3O-0002JT-RI
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 12:24:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lxtzI-0002nT-OK; Mon, 28 Jun 2021 12:19:56 -0400
Received: from mail-eopbgr50111.outbound.protection.outlook.com
 ([40.107.5.111]:5440 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lxtzF-00087j-Oc; Mon, 28 Jun 2021 12:19:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WJh665FrUSaIrmnKF4NR7YZsWjfiwchd1eJ3cN99o9rfVjZF+YsRbGr4mjPOPGkrS2Xj4MAbBYvYjU4hTNt9vACbs0oLW1dOAMLCufksE0s6wUC54TPFK524hv459OJJLNsAwafZYRANYEdkq60WclxcWCx2WjpQXFnXcHnHCd24h2KhXGodxZOo5F0TYSDM+2VZMjfN8ii2yZPnCmx49wr/AvK3y+qyrxXIVaGcsuZbA2sy4HTGs5pEI3tjhHbotFWBIyQBMd+CGY6ROt3l30lxFUn5SAKJJzSq1oQ9qJ3LnoIqnpauzws86rwbxQuqTkTiOQJk+2YYgTGSTM4FpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFTdM15ZJP2W9PZMNraPpZeMCVrbJOOkgbfA4D2pOAs=;
 b=W5UKB/2CiEjfEWLgFnbrb7qvj/AHNaAIJbuGXiddcxcJBY+OulMS1yRz6B/3R+DVfrUAoi1ZvoCN5Ri0ZliYU6slNyeHJL/EtT5BxFYNgwLNYdxmLL2ckUtJikcA6mUxmfaLgdUMW6LgHnkM+PFa3qjEKDfN5OheR95fqxZneIm4F0qkAqtH+TMq18QXSJRhCGmeZF5VmDtWsXZgsx6vD2wbS/2LZI0FItlTPDIDPhJG9DvPS/F+3/tlwYd31J4nYjlzFdsUKwhJI9ZVPD+oc9IP8uIO/sLlKIWWwP0+Ya/9iBoOBRTPVUGKjp3M2NNpiYTlG1Q66zqXAOqD2knInQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFTdM15ZJP2W9PZMNraPpZeMCVrbJOOkgbfA4D2pOAs=;
 b=Yuf6S62D+66hZ2wbWw5nhwz6z6MJ4Z+7MHJdbdITz7IsTtFwZgb2fyNxhlHNb2Gfj2GZsDopjd69RGybJzMjQsIYqHhcFAtqBAHo2cMZVkTnjk7R08ReSBj+XMvaffRPDS8GNcrH7lmLp5jP+i0vED3hBgI2vehzZZeYP6DbFAE=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3896.eurprd08.prod.outlook.com (2603:10a6:20b:83::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Mon, 28 Jun
 2021 16:19:49 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 16:19:49 +0000
Subject: Re: [PULL 00/10] Block Jobs patches
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Qemu-block <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
References: <20210625130006.276511-1-vsementsov@virtuozzo.com>
 <CAFEAcA_j+vQt_a5zYYghmBdo-+G+_sq3yV40w2CQSJ27+Py8Eg@mail.gmail.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <eb11da56-fa17-77cb-8695-c190e7e631d8@virtuozzo.com>
Date: Mon, 28 Jun 2021 19:19:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAFEAcA_j+vQt_a5zYYghmBdo-+G+_sq3yV40w2CQSJ27+Py8Eg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: PR3PR09CA0005.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::10) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 PR3PR09CA0005.eurprd09.prod.outlook.com (2603:10a6:102:b7::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.19 via Frontend Transport; Mon, 28 Jun 2021 16:19:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5a85cf5-e0f0-40ed-2a9e-08d93a508d7f
X-MS-TrafficTypeDiagnostic: AM6PR08MB3896:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3896659A401FFCF9AB8D18A5C1039@AM6PR08MB3896.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:669;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bi/IZGs1Zh1ytrU1vvn3ZQQMd3A+Bn1FW3R96OojCqo9nDYr2GcJvNgTCEyQh93C/Kp2TB9hlC4Z51EjxuNMkmkAFsrUrYN6jX25+g64oNAv79kufbJ2+kha3/T/LOHpwtTQVtjRa72tFVp7Kjxc+bBALCB38trmAKUtHJw5nBc+Ko7+91SfTvWNHHduzs2OlAtEvJMYPh7u4aJnrLIq8BocIBMm9qOq0idEkHPmhNXP86I/NACkL5Uui1j7HSQqUvufACyieAr9iXjLkBM+TE+u+HjDHeigmbIDVRCURH4E2SrqA+ZRiVcLVQIgZwGoAVIEEyXXp7xS3WnWOLorrN9AGukRqcPw212zkjRTch4SL6PV4EjW3a3MyZCQojMMo+xzuafp6/baS17KhPq4LNrijsNJaLwaQeP/eO3Qpbf7piU5Y9RPAKwL1MTkeIDnTe9I6uqn/Llt7X21TylyZXetUnIgwnmso088PWw+XlVGf8QTbpW4wGp79pDJhjpCQKGoTADVeU7kyRVMuyA1V1N+bmDrCVG7Efmqj+AVd+VALxUhHrUzDUPZKr4uBVS8fF1jQVunYqxNJaU5eaRh44yM+sEvdHIvkK6jF1CMO3RZNQI3P7eyxXFjiKvQExwrj314PtRGG8+oNsK2QMwDz0Q6njj2HKh0XccPiysmjfxRVYFYpjz16lc6z0w9n774y7acsJRm7qXQPa+uZgKtzRj7FqBQSHg65miEpn3Vg6Z7AY20VW8yXo+d73aCGz/OdNxEORWwntkBvYqX5umQJ4k1yVu6gn0Awnj5mEsQ+z5cUYztzrkF80pEbOKYqTnLm7sEKDNjd378BWtHdX+6FO6rlifhavMB7k44HHxhFXWGxEF61T2CEuT7r1cpiDSgLK/mVYpW2gViUCfpT0AmKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(366004)(346002)(39840400004)(83380400001)(38100700002)(4744005)(4326008)(2616005)(36756003)(5660300002)(52116002)(38350700002)(86362001)(16526019)(186003)(31686004)(26005)(54906003)(66946007)(316002)(31696002)(6486002)(16576012)(66476007)(8936002)(478600001)(6916009)(66556008)(8676002)(956004)(2906002)(966005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3JIL3FIbXhVL0NvWkJNRFNWWWg0aGpRTjdrbU5IVFFZWUVKaVNxLzVSaDVJ?=
 =?utf-8?B?UGgyTi8zQ3E1NkF0M1pjc2MyNDh3aTYyRW1NNm1KMVNBWXVGRmdSSVhYeHN2?=
 =?utf-8?B?L3kwdWhVbEhSWGd1bFFDUC9LajFHdHRiSm5DZEQveWU1WDZjaXlYbHBHei9B?=
 =?utf-8?B?d0lvNURxVTFQeEV2ZE1kTmR1QjdVWFNkWU5JeWpQYmhUeDkxaTk4bVBWZ3Fk?=
 =?utf-8?B?YVkraGV1YnBhZ0ZidDNRTlFNQWRBWlRaSnR1MGRvWERBYVJZRnkvMmNZRjNu?=
 =?utf-8?B?OGJTdXp0NmtXMW02QmRrRjM0V3hla1VnVG1wbGtHeFM2VXkya3lYVXF5dmMv?=
 =?utf-8?B?ODY0VHU0T05PVG94NlZadmExdmg2SFJTQlJGQVpMYzM4Qi9qRmxGY0RwNCsz?=
 =?utf-8?B?WWpqckZCODdYN2poUjRDenRoc3Z0cnplKzB2bkw1THluajBjQldZdjZEVEpm?=
 =?utf-8?B?QnJwRXVSN0pySml4VjRWZ050RnROUXJJSjMzVDhuak8yTktjNjRWWGVOZk5l?=
 =?utf-8?B?WWN0TG8zY2MzZ2VmZC9pYmhVT1FJd3Y3RzJkUmZDUzZ2aFUwZ3BXK29TYjJ2?=
 =?utf-8?B?bUExbmhOMnFDUDhkWG5zT0JROVBPVTc3NXpJQ1gybmZ0WS9uWmJ3NTdEaG9R?=
 =?utf-8?B?Q3VOcklhbjFGdWtHcnd3M3oyRitkK1YvRUVFNW1QbU96RDMyUEcxaUhQc3Mr?=
 =?utf-8?B?Nm14MFk5Qjcwanc5UjJFd1FvYUFnNWxoV0xXUmF5eWt1L1dKeVNCSzdxQ1ZT?=
 =?utf-8?B?M0ZyMkNtRmpmK2Y4WkxWb28xZk1NbWtvTkxqMmdrRlp1OFBOSUdLM2M1eE1q?=
 =?utf-8?B?a3F3Zk9wWjh5akViU0dqUzhicUNsbitaS1BQc01NUWs5MHd3NE5tNE5QbmYr?=
 =?utf-8?B?ZWdOOHlCSGRlU1c2ZHZENFdsQythQ3ZqT2VCalgrVkRRNlpaVWE3ZWJmMnla?=
 =?utf-8?B?TXQxT2NVd3A2ajdkckZEcXBBYUdlVDlKOXdxUS9xZW5CVm83VXpGWFRJQnRH?=
 =?utf-8?B?emEvK3NVb1kzR2toUERxQ1NlaWY4cllGRXVjUCtDSlc4dXN0d3lKclloSEVL?=
 =?utf-8?B?anJxdFVTd1VMRDZRdXNmU1g2MTE4WHNxMkZtWS9wN3J3bGJFck01UnFiMEF2?=
 =?utf-8?B?RXYxL1BlaGNjclhqUWFQRkVBam5yZjluVnMxaHBLS2F5TkFvZEltbGpTU2ti?=
 =?utf-8?B?aGZnNzlDYjNjTjAzQkh1cDVydmxSakxTWWxuRGpwMWZ3ZkQ0U1JQTkxkb3Vn?=
 =?utf-8?B?czQxM3RwdXpNUThOSTdjODVBRTFSSy9qVXdvOVpEZmF2YlpSQVJ5WDlLRkVj?=
 =?utf-8?B?cDEyWWEydXQ2cC9qWjh5cDZHSnMyV3dFdmNacDIveHhYbU80MmozTFdJVVV5?=
 =?utf-8?B?SElZM1FjdWwvQitMRUZYYzJ3QTd6ZlBvSER6cU8wcmlNdUNaYlNkT2F2c1NV?=
 =?utf-8?B?aC9JL2lCa2U1QzRHSENlcW9qbkxIM0lseWdrbWJjMXBGekk0enRwbDVkUHVi?=
 =?utf-8?B?OFlJZklORHR1NTUwYk5yZWFia2FxRUlhUjQyaEtzUWRWTjVEMUJWa2lkNUVj?=
 =?utf-8?B?NlFzN2NjSlBiS2t2WHlSbXdUZ1dWckZCR0FnSC8vWHVVSWwxWVJZTlZxckZ4?=
 =?utf-8?B?ei9ORThyQjF1eWo2bHJnNnNTNUxtUUN2S3BWS05QWWtHalErZDI0c0o0QjdL?=
 =?utf-8?B?a1V1bThPWng2S29Vb29tZjlOSWM3M3dYNGF4bWttOFFUclpQSk02L0MxVGxO?=
 =?utf-8?Q?KIs3pbAPtaIkU4Rn+tXnE+Ud2IPEavKc7BzPWZj?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5a85cf5-e0f0-40ed-2a9e-08d93a508d7f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 16:19:49.6128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t5b884Nk/4Gdl2OUFO+hOx109GbVswLho8af4WEbl/QROUfCHyzBDxNHWanm5KE9GKACcxqMwjKgI7ehD6kifUxeDOiRpDvo5bqGBIzKs4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3896
Received-SPF: pass client-ip=40.107.5.111;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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

28.06.2021 19:09, Peter Maydell wrote:
> On Fri, 25 Jun 2021 at 14:00, Vladimir Sementsov-Ogievskiy
> <vsementsov@virtuozzo.com> wrote:
>>
>> The following changes since commit e0da9171e02f4534124b9a9e07333382b38376c6:
>>
>>    Merge remote-tracking branch 'remotes/kraxel/tags/ui-20210624-pull-request' into staging (2021-06-25 09:10:37 +0100)
>>
>> are available in the Git repository at:
>>
>>    ssh://git@src.openvz.org/~vsementsov/qemu.git tags/pull-jobs-2021-06-25
> 
> This doesn't look like a public git url. I'm going to assume you mean
>   https://src.openvz.org/scm/~vsementsov/qemu.git

Yes, that's a right URL, sorry.

> (the remote URL I have on file or you) since it has the right tag/commit.
> 

-- 
Best regards,
Vladimir


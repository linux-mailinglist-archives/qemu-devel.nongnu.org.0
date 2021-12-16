Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B594476F15
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 11:45:04 +0100 (CET)
Received: from localhost ([::1]:42794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxoFz-0006Ew-Kk
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 05:45:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxoED-0005I8-3Y; Thu, 16 Dec 2021 05:43:13 -0500
Received: from mail-vi1eur05on2090.outbound.protection.outlook.com
 ([40.107.21.90]:44641 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxoEA-0002lH-Vb; Thu, 16 Dec 2021 05:43:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YhKljrKcU/AknvnR8y+wb1tULKkJ0l+TTALCiPsO2FwIll0ADTkmGmbxo2GO1OEQt+0Piv8KH3DhekwHWpVY8WG6e4GJMKX80X2qipFNiVLnjmt/uW0EZXxg+ioFXl2UZPujxK6zsFIYpf70ARexFKpcot1stmUolBPM8irwkvhmHa1ovnbDBFRqjGqVbLLDD85us5BJjmNXIjUGNHmLRyX095gIXFVYhVC6mmbrIRrEGNUZlDoWnncAS5SQDqFs+UVjjWwiGqpPYpGLeyS4UBh2Pva3/QzOVHqRSQhl6XRAe54TKMYvezXGSjYGrSi1ao4wig45rX1xZcAGyIhaRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Abhf0qxDuL51ZUQTmTL9x050UpnoxJkTleM8E00d3Bk=;
 b=D+7OkWNIOGS8+zUzrK5bzLQJ5ZUBLwlvnphfDsGl5EPn2MYeHYFvPHv0+7ZGJ7v6PtVsU3YVfF5c2+FMdANr6s/DbLcINVY5WEHovY5NH1disR6gvE324jx/Th26VLwIP3STwXFV59R2wwac72OSNc819Niyg7CLzLergRJyacei7aEL0s6SG9KtLlFU/K4YukvwkzSJNIKZ5l/BYrS0HOHg/bzO0ebFlGl/WKwg97RD6aIBUZMxT7WO2Bov8qupqT9zlmyBSelEPYmnG96QyJysDe/T+jehY7ig7RFr2aG024D/NhTp05pnRXuq/Hd6Tksg5NVP8ArKx84QfDxpug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Abhf0qxDuL51ZUQTmTL9x050UpnoxJkTleM8E00d3Bk=;
 b=ot0oidbvxKVjRaeeZFhpI3Gktzg8BCdIP+xg0tB0etS7LbL14sIbMeAE+BrhYCHXgoK1mXCqh+19/57tR9OQbD/PSea4z0ucDNlZORd15EJ+8bAbcfg7YDrxhOg6FfLYA8DrRBn/4xl1Hbl0hh2tIAnTefluqZPfEft6MewiGpM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Thu, 16 Dec
 2021 10:43:07 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Thu, 16 Dec 2021
 10:43:07 +0000
Message-ID: <3a12c0be-b6ab-7be0-44cb-42317bca7527@virtuozzo.com>
Date: Thu, 16 Dec 2021 13:43:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 08/25] python/qmp: switch qom tools to AQMP
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Daniel Berrange <berrange@redhat.com>, Andrea Bolognani
 <abologna@redhat.com>, Wainer Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-block@nongnu.org
References: <20211215193939.3768033-1-jsnow@redhat.com>
 <20211215193939.3768033-9-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211215193939.3768033-9-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0076.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::6) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 FR0P281CA0076.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 16 Dec 2021 10:43:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 572691c1-68a6-432e-accb-08d9c080d878
X-MS-TrafficTypeDiagnostic: AM9PR08MB6737:
X-Microsoft-Antispam-PRVS: <AM9PR08MB6737A4C3031438C9DBC7D821C1779@AM9PR08MB6737.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:400;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dFwom2bg8opc8HlQ1Y5A36VqbSdyKVtmcepH2ZzmD1b2je7ypK4m9Hod2aIJquGJHI3kdwvYglTccXIK0Ow6DKybpDwUTJciF9A9tMI3Ok2H/VxZamUd5AMaIB08Q5H7bBzhLLJW2Q2t67iszA8eCtX8yRf8KxVEiDYs512RLuOLjko+ccctNLx6dI4/MmLPDmkSwLg2+JRTKu4gR1pN18miuX77ZBBHhTj9FxcaBX3pigdI44o2IS1Tykp1ieMKD+KDab1fYliYxqn2vxt+mxsJisEzAXhFjOAqkN6uJ72XIn4nHo7Ei0zrkmvnrkljj6jROewUkqkoh9/egN0S7BaoXLqdKkfvk82CHIi3kUmLVm57g0kPDt2445kkatUxTIUaHlThBB+mxwfL1qDlBFr25+1IsbaqKfnUnas5e9Y2Nl6GuBvRWPtoyroGvCNzH6uu1RDm2F9KlkgUfEObUFLrod+3Ko56WUk3nn06VPD8NJNf8lyWJKuNzr1diPvHTUsFOs0r9UI83gteDlICGTkTmuLDaMez3G/pHmLPrzzLoQwIraWadRfGoXUm7A4n/DUJqFxjy7+qB83MVS2pAVyH6EBlk8YEYcCLs5gGMxBRUt27nay6TGKUsNipggQoL+htQA7wwfQOAeGk+daBQcW7Ar/lQi3X6vLka6U1pzWveJ5G7jU+hR4DnwKPM4hVzDKuLnm6EVbLNAud48AsToGgm294MCQ7Ps83T97L/kepyg00IlsWHBm70Bl03SToujqa8Gl8KrSAkfadl+nHUg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(2616005)(316002)(6486002)(8676002)(86362001)(7416002)(956004)(66476007)(66556008)(36756003)(558084003)(16576012)(4326008)(52116002)(31696002)(8936002)(26005)(5660300002)(31686004)(38100700002)(2906002)(38350700002)(54906003)(508600001)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUZkbk4yNGhXWGpNNnR0a0JrL2ljZzNrc2w3WFoxZTRpVVk0Ly9WL3Q3QkJn?=
 =?utf-8?B?NFh4d1dUK2FsVDZaTFYrMy92aE5PV21wVzJVb0NpaEVpZUo2R2ZIMlFFb3ND?=
 =?utf-8?B?RFgwTXJmdVlqOUxrZVlMOXd0dDhrdkdkLzJTVk9remltWkJ5WWpHKzNLZHYz?=
 =?utf-8?B?S3Z2dVpySk1xSnQ0MGo0eXk2dUx1OG1ROEVXSVlLSUlvNjVPRmV5Z1dJZzBV?=
 =?utf-8?B?dzg3MFpRaFRzMDJFWUZNRkU0eWkvOW40cE9OMjU5RElpM1Y5eFRuQVJuVFB2?=
 =?utf-8?B?S2Uyd1hBcENWQlVnQnZyM0x6eE5xOThwVDk0cVVkYmx1SmpqMTkxYzI3ajNl?=
 =?utf-8?B?bEcwVGR5TSt3RTN0R1NtV1oyQ2JMbjA3azI3MHM5RHd3WWVibUpvVEIwbG9M?=
 =?utf-8?B?M0xrMWRlMHBsM3JHQkZHUi94aXM5TmYyOUJXYVlOdFVpdHJiVGNlWVJvc25z?=
 =?utf-8?B?ZEJWL0xxUXZuelFuU2FxdEVQYy9CdTEyT1k3ZW5aMXBnbzY0MUtiVXYvWG03?=
 =?utf-8?B?eis3VExpQWZRWjFYbTN0L0puNVJhOW1KLzg4VTltYmxxT2pqY2tkWHFRZmEx?=
 =?utf-8?B?cjdlalYvZnZFYVpwbW1FRE5ic1c5VW5GYThHMkxRVXE2QmNBM2ZXcVNvN1pz?=
 =?utf-8?B?YlcwMGI3WXRlU0RiMXZjOCsrN3Y3a04wenhkelB6OXdlKzRMRjZ4TGJHc3JK?=
 =?utf-8?B?cnVic1dicXJ4WU9wYVBoMWFtWG9aNjIvcHRUS1owa05QTTB4dk1MSGsxTDBh?=
 =?utf-8?B?VG83dmVjK3kxMUlZK0RuL2NxcVhvekpJSlQwcFZ4aXFPTGFiYm95clhBNDJp?=
 =?utf-8?B?NWw0cjlKTjNkQVROVVYzNFFtNnljeVV5NFJLanpBc3gvWnBwanhNdjNUM3dN?=
 =?utf-8?B?cDR6WEJkZjByOVFRYXVGMTZRL3JPeXA5T3dreWwxRHRLQndGTkxObWJRZ3F5?=
 =?utf-8?B?MDhSQkdBbUVCWFZhL25MQm4zY2JaVXhYbDhicDU1WVJ3d3FaWkJJRTZPVVhw?=
 =?utf-8?B?WlRIbjhxTUFnemtGZmtuQWR2aEVRclI4MkxGTW5XbFpvd0NzN01FVm1EOHJJ?=
 =?utf-8?B?TEV5K3VTb24yZU9MY0tEams3Z3NLemZBcWJmSkNBQzFCM3d5ZEN4dVRFbkpt?=
 =?utf-8?B?TDFYVTdwTVBPNS9Hb2VrakVOOEhIMC90YlEvS2VPRDl0U3p1Um4vc0drdjZQ?=
 =?utf-8?B?NFV6YWNBckUzS1Y2Zm1mbkZBd0graXJIOG54ZTlUTkZaMEdZaVV1MU5NMVhD?=
 =?utf-8?B?SU4xRXZ1b2dXVXJ2c3dhL1VhblRTSFFxOVIvRWZ1UFJrMC96dGRnVWNwSUt1?=
 =?utf-8?B?TVg2bjB4Wndha21jNk9PUEdHMVRDblJKcEZWM1N3U013b21hdjVwS2R0K2tr?=
 =?utf-8?B?dVpLc2ZnbytWTFE2SUQ2MWR2QzB0N2M5VWNiYUlFRVl4WDV5clVGdmFvQTQ0?=
 =?utf-8?B?a2dwMHlqSHJHaDNscWQvbWVaaGNoWU1NUXFaaGExK1dzVEsrR1lMRUY0eC81?=
 =?utf-8?B?T25Pa1VVcjdSNUE5OXUvQkZzNDBXL09aNTBJTGJ5Z08ySzVkZXRlQ2UwMzVr?=
 =?utf-8?B?ZzMzdkVzOFVncEtkbHVsaktIb3BzWE10amh0ZnZUdzVJNjRMLzRnNmNXUDdh?=
 =?utf-8?B?R3kxOXB3WUV3d1hkUVdPREYwMDRnbjdqQ3FHb2RWaTJYUUhJVzlPQ3IvNk5X?=
 =?utf-8?B?MTNmbDh5Y3lCNmV5Mm80UFhiQ2pER0lzTWhyUXRKdVNOZnRDMitxNHBYcXo4?=
 =?utf-8?B?aU1oZ1c1aDlLLy9DUmJEeDdDZHZhSE9UaXdRRFBqNGVPdWRWMDhQU3k3N09V?=
 =?utf-8?B?dzZJNWF4MVVheVNQaDhSUzdHNXB2SDIxOW93SHRjeVR1QmxUOFRaLzRhNzFs?=
 =?utf-8?B?R2Y1WVJUR01mZ3VwVlZ1TzF0LzhIeTVQeHlPYXNuWVZZS3hxWVpGMnR0b2Ev?=
 =?utf-8?B?SnF3bXZza1c5ckdHUXo0MnNwSXFzRWwyejRibjdMK0xWbS8vdVdGZEZqaVNZ?=
 =?utf-8?B?TTFFazQ3RFBCbHdCd0dTL24zT1A2VElRR216UFE1dHlhY20vNjE3djhWbFhx?=
 =?utf-8?B?ZGc5aGM1K1FBcDc1NTUydEtSa1BWbnlEVS9YUzNMVHROelpZL3dsd3M1VVlP?=
 =?utf-8?B?dEhlMitpams5THBodityRURDZ2szVk56alVMVGJrQmVPdnU3VWFsS2FYQURi?=
 =?utf-8?B?Z2dORjhkN0pHVTRBZktpUG9xUFFDQ09UU3lnOXdxMm1YbWNjS1k3KzJ0NFQ3?=
 =?utf-8?B?RTc4RWJkWVNBRHY2VXJsemdXN0NnPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 572691c1-68a6-432e-accb-08d9c080d878
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 10:43:07.2298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sgaIfrkLng9skNLDZG9vcbhY4Hm0eHb0yHwiMqfVRVnOnXn66188JCh49EZj34bmpyhhRqkvnMKtRL3VgzzXyzBqR6ThnwmZGc5QfQ1yZhA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6737
Received-SPF: pass client-ip=40.107.21.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.034, RCVD_IN_DNSWL_NONE=-0.0001,
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

15.12.2021 22:39, John Snow wrote:
> Signed-off-by: John Snow<jsnow@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir


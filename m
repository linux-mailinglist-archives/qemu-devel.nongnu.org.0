Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F34BF2F59EC
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 05:30:13 +0100 (CET)
Received: from localhost ([::1]:59062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzuGz-0004DU-1r
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 23:30:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzuFw-0003iQ-9E; Wed, 13 Jan 2021 23:29:08 -0500
Received: from mail-eopbgr20104.outbound.protection.outlook.com
 ([40.107.2.104]:62529 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzuFt-0004FO-6v; Wed, 13 Jan 2021 23:29:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kv+gRaSWWL7OXaWGOfjNvBaigrBBRQp7AvoUNQmyVMYIa+CJrzmNdD22tfC+eqv+az7WytpthzKewIeYmY2dROhhm/+TRyGwdhxzg6ay8aHdtwysHoolTUcqX/lDJ3enoce8ix6hZmXJfC9VNHx7sZRW2UH1HFFZ5yxwEN6+eVkhmfO3Ee3OXzWPDsk42RQ3Pj+emWv95iLriGni7TWNvA0yvWEk2qeGDbXNk+Zcw99GKGepzZR7aSA1doU2GdmakRTWGUc3Fo5bNtbjkfwhImM0F2UnU7VoEgifSEMLroaMOvGZmoiM0qKGXDas4MZZOoUeBfxjqtO2NOkLPWN/IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=laYYZtf5qDW3Ry0Dn1Ev7LQwTWtG2ihseKP+UoXv5Hw=;
 b=MP4VxXGH/OIDmVmhFHSs5MJm7/50xmn3Rc/weaOqr7EmiSdqkkgLgr8JJzcBq3w44haydoO6bZHZKTYgWHTnVNJX3KCQ69nIpGioshBXxmB7SltMeoozp7+46JJtjxSXYMdccuebxXueq0vm49/fGSqNY4s42TmbU3Ee4AeoDISO/Q+iEOoCcMYPUE6b3nze2Q7d6poINE8t7W3/OmL3G+n/FaGnbyziB3NKZWxAsPMc/ZU7PIl50HG6zzPZiyfhvAOq4IkTh4feBa1fLhWUOdfxxPCw96ZsqPrn5+0FpTKUjO2/8zRfhUC62vOxgwTWSNqu6pGF6cNEnkAlidEnNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=laYYZtf5qDW3Ry0Dn1Ev7LQwTWtG2ihseKP+UoXv5Hw=;
 b=lohHW4v2wjGKTJGonM4W+SvPpq+myFUHGwmnaECejT7tMNJiqtxOtSK4KhaZXstNifJp78dKrJFLi4BepIUYP8roCbmbSZ5IEFX9mzDew3aL4Vv+pGtaAaXyL7eWl+2W4GPp/4hExO30GTGwFb/oOGo0OiPuLLD3nYpGow0yowA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6293.eurprd08.prod.outlook.com (2603:10a6:20b:23e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Thu, 14 Jan
 2021 04:29:00 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.009; Thu, 14 Jan 2021
 04:29:00 +0000
Subject: Re: [PATCH v6 08/11] iotests: add testenv.py
To: qemu-block@nongnu.org
References: <20210109122631.167314-1-vsementsov@virtuozzo.com>
 <20210109122631.167314-9-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <4bc3f007-65c1-ce8e-0e16-3e6087918d8f@virtuozzo.com>
Date: Thu, 14 Jan 2021 07:28:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210109122631.167314-9-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.80]
X-ClientProxiedBy: AM0PR03CA0004.eurprd03.prod.outlook.com
 (2603:10a6:208:14::17) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.80) by
 AM0PR03CA0004.eurprd03.prod.outlook.com (2603:10a6:208:14::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10 via Frontend Transport; Thu, 14 Jan 2021 04:29:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61500a00-31ed-4e84-4cae-08d8b844eab7
X-MS-TrafficTypeDiagnostic: AS8PR08MB6293:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6293FBB8E65C7BF7BE0896BDC1A80@AS8PR08MB6293.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DtSlgnGLYQ/nGgLQ6ZtvHhHngwYSmp8YiCFFn8UD0Cxf+dcPL6RWcnfu94yx5lK2wlQJ+mJaHYdKauUUS9dZUvwOE83D51nI4qiHaO7s90y2Bqo+4EPkN7EO0G4OEraFTqdrJSHao7dblseF0V8zMSHwKWH5th6f6uK65Dxalb0r9Kls3Lc4EitVipKCTUP6WRgBNIwh355GrSWBIrdZbSDZgD+ae+mUzsYmBlR+1FI+lFHYED90lu5DC59aUtEgFdIpev34L++gwNjcgAKw5J4avfDKjiQIOxLdp5vnsbf2cx0eI8aeKomi9QaAx0C1mFTVLyEZlgWhQxrERxcm66qNg3robEvW570iwL6Ber3rziXPcZ+/XGY5pq3iaPO0vv6yoHF0NQ5ub58cSDGUFtrj9RChdie7G0adMiJ85oeDbWuLKeyaY4QMfS28skxSUMGmr30oxnDU4rkJV9hk9SY5AcfDMca9wE4sHHHUkYk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(366004)(39840400004)(136003)(6486002)(6916009)(956004)(2616005)(316002)(26005)(36756003)(2906002)(478600001)(66556008)(66946007)(8936002)(4744005)(186003)(31686004)(86362001)(5660300002)(4326008)(16526019)(8676002)(66476007)(16576012)(31696002)(52116002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VmRONkw3TG5CZE9aL04wTmtIYzdqczA4UCs3UkQ3TVAwWi9KaEd6SGNBV1Bj?=
 =?utf-8?B?blIrdnBaQzNqN2VUTndMU2FaZU1mZkJTQnhXcDZVdXh0cG1UZU5Bb1Z6b0xr?=
 =?utf-8?B?SU1pUGx1M3NabENsVkFtTzdrVGUydUdWRjRPZkUwK0pqUkFCdHkvcmczSzlt?=
 =?utf-8?B?UHcvWFE2TWFYWGpHWmRCclVaSGdMc0UxUWllSGF5NFFtSlU0S3d6and0Q0py?=
 =?utf-8?B?ZFQ5UytTUkF3VDQ1ano3c1pHbGxIVnFQbTc2Y29IVndHRU45Y3VrbnVWeUVh?=
 =?utf-8?B?ZGlXc0xTSWZaVjVYMEZkcU9VOHZoQVlGVVNjazAwalNzYWdacmxtbDUzMHhZ?=
 =?utf-8?B?Rjl1MnIzN0R2Q21GTFloZmdvbVhPd1Z1eGRIc1JWaGpVWGRyeWRTUDNXMVJD?=
 =?utf-8?B?Sjc0UlRaTkMwcTl6eTl3NVhhMnprYWt5RzN0cGtTdjlCaGM0U2F1ZEQ3WFNT?=
 =?utf-8?B?Z2hVekhGclphR2IrTU5kVHhEU3JvV3JTSGoyenlkRFJQR0VobVZGcnV6SDNO?=
 =?utf-8?B?UmFHK2RpVDJUM1ZFQlNMS3pCYit5VmJyWnczSmhoTkd0TURSMGp1T29IZUhT?=
 =?utf-8?B?aS9IYUtMcjJFdS9VUGxmUkgxRFZvcVpKWTAzSHFidk1yeThaanRvRnRMQ3Y4?=
 =?utf-8?B?UGRreWcyYTlJbThSbGM4OUg1K0tSKzUzRWUyZ1JhZitGMGVHTGUwM1RCSlZU?=
 =?utf-8?B?RnRrSXdSVHZwZzZLR0tNZ0VvNkcxZC9QVm9Hdmp6VGVFVFFsUW9sbjd5N1du?=
 =?utf-8?B?VUFQcnpvV3JWbStOaGJyTUFwTkMwSW1zK21OcjRjNFlDNmsxVkRLYjhjUkto?=
 =?utf-8?B?ZHl6bmZ4YkQwb1lld0lmWTN0ZEZuc2E0WFp0S05LbDRNMlJqcjZtZ0ZaV2wx?=
 =?utf-8?B?L3o1cm55VHkzVnU2eVRHOFRQTUVCNTVTaldqQ0xoMXE5NWlFd2xxTzlhOGJN?=
 =?utf-8?B?azlxc2ZFaWN6QWpFeDM3ak5FdEhOU0thbFVuOHEvRWdsSTY4WklVUWUyZmw0?=
 =?utf-8?B?c21DeXV4Q3BzdDFhQnBQc0cwSGh2UWp6cndoNnh1eStRK3U4QW9IdlNLVmFo?=
 =?utf-8?B?cUkyTDMyanhhcmxXbzRqUWRCN0Ztb1RqeGV0V1FVRXRWYVQ2SldOdGlSQmlu?=
 =?utf-8?B?QUtGQWxGVnpsTXp1Q1BaTWZxY29GUHZJUzQ2VllKcU9tNnZzMUFubzN5TFJk?=
 =?utf-8?B?ZU5Oa1NkdlBzN0I1QXJ2VDJTaVhQMEdZL1FyU3ZCNk52b0x0S0FLM21ucGx1?=
 =?utf-8?B?VXcyUTlKcVRZcjhadXo3Rmo1b1BvRVBZNzhyQjZHQjF3NS9ITFlrUS9Ud0w1?=
 =?utf-8?Q?ZSW2C5jp+IiN5VmT9u95+f2D2v6bOUM3dN?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 04:29:00.7685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 61500a00-31ed-4e84-4cae-08d8b844eab7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3LTw5ihoNYC6KkZWI+TcDhnfEjCdtMALXPThtoDJAbuWmZZ5XJsbOEHHZ0d2oNSTzXbAZAAOOHlT0GgvsIq1H9GV+mgeqQQrjEIXwtSQOjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6293
Received-SPF: pass client-ip=40.107.2.104;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com, den@openvz.org,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

09.01.2021 15:26, Vladimir Sementsov-Ogievskiy wrote:
> Add TestEnv class, which will handle test environment in a new python
> iotests running framework.
> 
> Difference with current ./check interface:
> - -v (verbose) option dropped, as it is unused
> 
> - -xdiff option is dropped, until somebody complains that it is needed
> - same for -n option

One more thing dropped is looking for binaries in $build_iotests directory.
Do someone use this feature? Or we can drop it, and reimplement when someone report the degradation?

-- 
Best regards,
Vladimir


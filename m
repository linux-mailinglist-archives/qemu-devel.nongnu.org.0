Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2114534CF39
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 13:41:12 +0200 (CEST)
Received: from localhost ([::1]:53926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQqGd-0006OC-52
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 07:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Valeriy.Vdovin@virtuozzo.com>)
 id 1lQqCw-0005PF-4R
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 07:37:22 -0400
Received: from mail-am5eur02hn2246.outbound.protection.outlook.com
 ([52.100.8.246]:40580 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Valeriy.Vdovin@virtuozzo.com>)
 id 1lQqCs-0007qo-RR
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 07:37:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ti52tKfreWuDelC7m7Oe7p4Gx8WUpH6NEi4HcGt32+JXGwB/03reHyDPOlUWQBhcmyHbB0sMzKrN4hYAScC4g7u+3Z/WIHaPt1YezW5CZNP6s3d32gHdwSRw71ymlK9s9h508DFcn5zh59ZVxt6fQc6/WVVbDqSxpkuM1E4xvH8hKZVKvI+djqU3GiXQVrjSRMJj0q9HYu+qvi++Lrqozztl1ZWeYIdtNO8WFlGxdP85ubUaaNbDHx5iIUwzfXVhQOYxsH22k+y9zsEvh9VEwlvOhu9ZZhO/BGOoYLsTTek8ZDWDDEas1kOoLvl4V8BVsWPl4CiXWKA+qAF5HMdLow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXlzfx5dPuIKFeWIq6b+0AS/jkzAg5nhZmWF66qzu8w=;
 b=NMlsl+JP1vbWihEiWEMdlrtz77bo1Z6S26X7ET7XW6+hYt+eQCTkRUDknjCT+imm6oMEtoQHSpCkP05AALuZdT1uR2s+MbHCXLtx3k9YxpDUeLVsBUHdwNtySQBCRFktmyRliq4mvHw+63Ow45WWYcDI1hNgunLCo+1U1QWND4ATNau6vPLH1P+A54dHaLH5wCWg9g5IhaABQxPGmTxR13gSA/WH23yPBMnvz/+Fvo80kWvLFV6HsrYWdAgnCo3/ghHKqzuleq/ATV4AZyV+wIdwwvWsC5CbGeRZ+NI2yB9CyRdXJ1qO09INVMbcWB6Hn3MSH0lrneClURZ89Bs5UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXlzfx5dPuIKFeWIq6b+0AS/jkzAg5nhZmWF66qzu8w=;
 b=l4qZDzrfPKX+NwGtoxCTJfMXXrQZMDU5KoazdKO1bUGeFn25yc9kbC6/LkByS48idVFdRNn/GhIPA34IjH49Oibu+ofjDQ1pB+RNHtHUqL42KAKB4wnLj/HPY/rqBxNNfuev6tY9nIyNEaHTdRRK1m2wcIMHmMlXR6pis70sKOo=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB5988.eurprd08.prod.outlook.com (2603:10a6:20b:283::19)
 by AM0PR08MB4419.eurprd08.prod.outlook.com (2603:10a6:208:139::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Mon, 29 Mar
 2021 11:22:00 +0000
Received: from AM9PR08MB5988.eurprd08.prod.outlook.com
 ([fe80::557:7687:5016:7c97]) by AM9PR08MB5988.eurprd08.prod.outlook.com
 ([fe80::557:7687:5016:7c97%7]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 11:22:00 +0000
Date: Mon, 29 Mar 2021 14:21:53 +0300
From: Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>
To: "Daniel P. Berrang??" <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Denis Lunev <den@openvz.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3] qapi: introduce 'query-cpu-model-cpuid' action
Message-ID: <20210329112153.GA413337@dhcp-172-16-24-191.sw.ru>
References: <20210326173000.18750-1-valeriy.vdovin@virtuozzo.com>
 <YGGb9ohT/EztzFbr@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YGGb9ohT/EztzFbr@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Originating-IP: [185.231.240.5]
X-ClientProxiedBy: AM8P189CA0014.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::19) To AM9PR08MB5988.eurprd08.prod.outlook.com
 (2603:10a6:20b:283::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from dhcp-172-16-24-191.sw.ru (185.231.240.5) by
 AM8P189CA0014.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24 via Frontend Transport; Mon, 29 Mar 2021 11:21:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c08647c1-7077-4f4b-9c9b-08d8f2a4deb9
X-MS-TrafficTypeDiagnostic: AM0PR08MB4419:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB441984007CFEE0DE4C38796A877E9@AM0PR08MB4419.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:5; SRV:;
 IPV:NLI; SFV:SPM; H:AM9PR08MB5988.eurprd08.prod.outlook.com; PTR:; CAT:OSPM;
 SFS:(4636009)(396003)(39840400004)(136003)(366004)(346002)(376002)(6916009)(66476007)(26005)(16526019)(186003)(8936002)(7696005)(66556008)(6506007)(44832011)(86362001)(4326008)(478600001)(316002)(966005)(2906002)(33656002)(1076003)(5660300002)(52116002)(9686003)(55016002)(38100700001)(54906003)(36756003)(956004)(107886003)(6666004)(8676002)(66946007)(30126003);
 DIR:OUT; SFP:1501; 
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YcOGiG2kuNqtEQUd0byr1UhkQ0P6JqemMeCTpcHg23chQh2DQDm9IO9py230?=
 =?us-ascii?Q?BVBUmAeXljIoXPfHhk/ayePne/iQBC03UymcpeEW65NNF2Es42S6iLgR1ewd?=
 =?us-ascii?Q?Qy1CMah97rUBAwwYsoAYkzc+RUtt/7k/yGAmXZthBWJHdQKmGcnVOcoW9hxp?=
 =?us-ascii?Q?D4KxyHqQxeihFQ+KI2g0waiII+TsYobTr2v/Y8xNFb1wa9wQFgY74ePD/k4A?=
 =?us-ascii?Q?pmyciOPNISN4UP1Os/VZK6HlVX4FWsQX+B8dq+YqScwNZ9BJEhCsYDu8QA1w?=
 =?us-ascii?Q?eJK5eLuNys7Jkb5uP3p3mlN9izIcqYsC+Rsb89TxDTFsrlkG03S0tNcpz7uQ?=
 =?us-ascii?Q?E0uaALu/IJdrdRI5hn920uXnJwgeHC6ZQGgnCzg/grHgweStvp+vJN/B9hXU?=
 =?us-ascii?Q?CJE3gCkJHIoM3V5QuM5VrLfjogglyWSXoor8hyNMeNSERTilR4qaal7T2zWg?=
 =?us-ascii?Q?HxBYn+zxEtmUL65uAVhbg5OvxtkGd5DkcdZ0hyUOBGN6J62hhzjEYig979A7?=
 =?us-ascii?Q?bLFDpSMkMTbcCiB85Ryo3G8bD5DQXRFWV4sb3ae86qbYR/O5YL5rT2O3OaZr?=
 =?us-ascii?Q?JTftWZwIQH3VbMw6gBVVzxO+FSMzPlZy5SbLYZ0Qb9bvuPuiajdpTsyP7xHZ?=
 =?us-ascii?Q?Y+zsq4wz/6XqnC9O9uu14Td7FLblQurD0mOym3Zi1S6y1+vLpY3WvUh7MaGq?=
 =?us-ascii?Q?j6d2uRyy8+VW4+/nVfGhLf47dN0tEwniccN5bmllxwrGLQqVcRv6UwBQaNuW?=
 =?us-ascii?Q?Vt1TprGfX4VQi421K6aswEEPMHP1Zxb3KofwAceIHyJ5SHdJExSRouI5RJ16?=
 =?us-ascii?Q?pPcFdbj2N+sk6QyNVX6VYmEOlmCqAhrWTpMAPPbfJ0MXT4QbrFuaDGtUG/66?=
 =?us-ascii?Q?cLrJdIupR1+qo7rh5Hy1sJzOaFnaZK1eDFOnn7vRaUaV1KAlfuppvJwuKNEq?=
 =?us-ascii?Q?Mb2NxOw2SY3aObFeMRUJIzuKNsQK/Nhrndi9aq4JhblPOYShap6ynaqeBqRa?=
 =?us-ascii?Q?XuWxkw73Tj3CiCktc5pKpuqyL7lFB7DSRG1XLurV24LPjihQZHA5Kznn04ei?=
 =?us-ascii?Q?FU8WjJjS?=
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ld62EkeUiszQ9H+VrKVfgBUzvDPtov3dHOQYhyR6IiXIZ9J1hfm2LdMoLj8N?=
 =?us-ascii?Q?I7RUYBaPWP0Xm25yCHi3Lslqa7QMUXbDH0sNZlVbn/Hy1ytmNF9ykAaOJb+8?=
 =?us-ascii?Q?PIZc9xJkmkTT7Ch+LpV1wt7Od+bf7mk33m6wHVRr8igoLLwm4jhmoiDeUVft?=
 =?us-ascii?Q?sSGW96DofWu25N33SdM7zx/TlcbcRN5Ldo6jsmwa1AvBj5Q89SxcnfuW+QMA?=
 =?us-ascii?Q?SjLFcIEmT+y3bSX1ANVmS9dNpx3uJWnVW/xqSWzTBZuL/cEDPG1Byhf5BgVS?=
 =?us-ascii?Q?JDWAe7Aknb3yTvxSKHK5KqGgcLnIjnfI4hXx/z3x4SAvJ9uDV1FW8JUGAf8c?=
 =?us-ascii?Q?YsPtlULsFSErH0Zv2zzcBSbd1Pb8/agRILtw0v1btZJca1uSyT1xBU5eEB2M?=
 =?us-ascii?Q?dtQ7SfNKvmfcVt8jdvS7ir3XDcinyGn9nioar9IE/wTz/zZpAswzweXW/N8K?=
 =?us-ascii?Q?+foTtCkPThYDHbamc+gDth7RbZlCK76OOpxUgDbTW5gcWKhw1Q2A7VQigbLp?=
 =?us-ascii?Q?aPeP7gWuZ+1RY/ZY2lM+UFo8mHIFGanTPralQXqSqn3EpMUpabtWX7GflIT9?=
 =?us-ascii?Q?2Ks1rY/plDq15+YVooqdGidqFbrPS29fHznEq+rhNQaUCPwiKClShkQXUV4f?=
 =?us-ascii?Q?8rcxjXq4Wvz2jf/OVCxr840pAsDghLkJ9zXmtqZWQc8LYA+7ULIKoLpMLbPb?=
 =?us-ascii?Q?T6vGwNj2B6zjO5seI+6NfZqrDsZlNzbQ+1YOAoH0bWhJXhaDM9RraQAwOWcZ?=
 =?us-ascii?Q?6EP0cpoPETVoomyq6mEMraB2Tl8Z8/54/t5AWXshxdbuSCpEJBXrtstaxevi?=
 =?us-ascii?Q?WfpnxskIHquroVcnCv+x/IA65ruDpm5TitpOHCm1XchUsmK/z8+5fB5xDODP?=
 =?us-ascii?Q?Kq9UIGhmAa6w8RbFrVxuqwAWOpAThjc4J5Jnyte2pOzQMB2GZkB6PkmI9wBG?=
 =?us-ascii?Q?sX3V0SM+T2sXRo38Hbgk7LozVxEFxnvL+SzRV8YZFltayzFbE+zShHIAafdN?=
 =?us-ascii?Q?KdHpP1VavmDfPQYm45d5WW6dXkyUpdoP4kF5/RKL0bQ5mZ1R1jqZhNc029GG?=
 =?us-ascii?Q?PGEZKfdwu8r3ffQE1LQNvJqNyV0R8dz3ARGtxFRZWi0wXyBIfMDT8lNWdntb?=
 =?us-ascii?Q?uaK9O/tZp1lakR1ljM9TYhQeVOOnNkr0NlpwbGW/Zp1HKdTK7QPuLPEB8YVw?=
 =?us-ascii?Q?jrwvLU/4VNyqz6U1ElavHcIczizbFmyqhep8H67EJGKHnSI1XHtCgINXsUB9?=
 =?us-ascii?Q?kWx2bjWsag/gYDMv1h80a5eBvq7f4v8/uHtfB/awT6sxLYZeG/mAnJ538iJw?=
 =?us-ascii?Q?rmWayQbsdVagzYEaX7VfhnMN?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c08647c1-7077-4f4b-9c9b-08d8f2a4deb9
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB5988.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 11:22:00.1306 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J/nuwPLxf6F8K4mXwSnYfIUMd0sGDVBd/CGnz9hIEZ0JEPS3r3HkULl82eWLo5PeJ51CV9JLBTzT+ZEQoKWlnRux25956rxXgbEzAvXp/bA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4419
Received-SPF: pass client-ip=52.100.8.246;
 envelope-from=Valeriy.Vdovin@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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

On Mon, Mar 29, 2021 at 10:20:54AM +0100, Daniel P. Berrang?? wrote:
> On Fri, Mar 26, 2021 at 08:30:00PM +0300, Valeriy Vdovin wrote:
> > Other than debug, the method is useful in cases when we would like to
> > utilize QEMU's virtual cpu initialization routines and put the retrieved
> > values into kernel CPUID overriding mechanics for more precise control
> > over how various processes perceive its underlying hardware with
> > container processes as a good example.
> 
> When I read this, my impression is that QEMU's CPU handling doesn't do
> what you need, and you're trying to work around it outside of QEMU.
> Can you give more detailed information about what situations QEMU's
> CPUID handling doesn't work, and why we can't simply enhance QEMU
> to do what you need ?
> 
We want to override CPUID for container processes to support live
migration. For that we want to base on a reliable cpu model, which is
present in libvirt and QEMU. We will communicate cpu models information
between physical nodes to decide the baseline cpu model and then we could
use the new method to get all CPUID value leaves that we would return to
containers during CPUID override. In our case the QAPI-way of getting the
values is a clean solution, because we can just query it from the outside
(not as guest system).

> > virsh qemu-monitor-command VM --pretty '{ "execute": "query-cpu-model-cpuid" }'
> > {
> >   "return": {
> >     "cpuid": {
> >       "leafs": [
> >         {
> >           "leaf": 0,
> >           "subleafs": [
> >             {
> >               "eax": 13,
> >               "edx": 1231384169,
> >               "ecx": 1818588270,
> >               "ebx": 1970169159,
> >               "subleaf": 0
> >             }
> >           ]
> >         },
> >         {
> >           "leaf": 1,
> >           "subleafs": [
> >             {
> >               "eax": 329443,
> >               "edx": 529267711,
> >               "ecx": 4160369187,
> >               "ebx": 133120,
> >               "subleaf": 0
> >             }
> >           ]
> >         },
> >         {
> >           "leaf": 2,
> >           "subleafs": [
> >             {
> >               "eax": 1,
> >               "edx": 2895997,
> >               "ecx": 0,
> >               "ebx": 0,
> >               "subleaf": 0
> >             }
> >           ]
> >         },
> >       ]
> >     },
> >     "vendor": "GenuineIntel",
> >     "class-name": "Skylake-Client-IBRS-x86_64-cpu",
> >     "model-id": "Intel Core Processor (Skylake, IBRS)"
> >   },
> >   "id": "libvirt-40"
> > }
> 
> There's feels like there's a lot of conceptual overlap with the
> query-cpu-model-expansion command. That reports in a arch independant
> format, but IIUC the property data it returns can be mapped into
> CPUID leaf values. Is it not possible for you to use this existing
> command and maintain a mapping of property names -> CPUID leaves ?
As already stated in the use-case description above, having this method
around, helps us in a way that we can just take values and return them
to containers. QEMU code already does a great job, generating CPUID
responses, we don't want to do the same in our own code.
> 
> 
> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 


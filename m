Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 355176F7E2A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 09:52:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puqDv-0000wV-UN; Fri, 05 May 2023 03:51:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1puqDu-0000vT-2J
 for qemu-devel@nongnu.org; Fri, 05 May 2023 03:51:26 -0400
Received: from mga04.intel.com ([192.55.52.120])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1puqDr-00075o-P5
 for qemu-devel@nongnu.org; Fri, 05 May 2023 03:51:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683273083; x=1714809083;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OFfCyIj5eQPT7v7z1d2aio7cn4a8ucNRgHJT9epHHX0=;
 b=b8zrR2ESmsDZpCoDExf+oB78QHuuf2PQQAbefqkP+8Mj3JkgXOnDhAmk
 sovwQ/32+SA+PhkpdANlpaZp+ekXqcPlUjh4TEVWCf+6qO0sFkFqqPNA2
 HOvrgR9lxLL1tWLGEGmnQRKnefV+hqcKmrU9supDwmPC9X4DOV/UZv30w
 D7cmFwPWqgTQu5KNNVOcFGIB37UAoWiawtwwvDg2DJ9n5sBfB5TQM+gbn
 5lj/gKSECXOGclAvMRKPXQrjDANYmF4ukTzu7nQ6is/0oF32zPDFAQwzQ
 R8vHxhYgwVUYtaa/CxPJ3OgPCTPieQJYI4ysflt+vqvdrC9VfNBxemPwM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="347978256"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="347978256"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 00:51:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="691549301"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="691549301"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 05 May 2023 00:51:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 5 May 2023 00:51:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 5 May 2023 00:51:16 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 5 May 2023 00:51:16 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 5 May 2023 00:51:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YeaeNoQsLY2wozNh2HrywPFgrDx9OYp33huUyztUCANz4wbfiyTRIyPMj1AKJ128sKMfbocp6IyJSFS1wshxf7TceU7eA8exgQQO7ny9wmx/ZoN0JxRtRfD9NFFvsK/UxVhQa4Om94U2863rfXbHKydmf1eEWbzwkqE324XNe3lU1s2Hl222NOqBti/PFl6PRi1dLOJgVVkLqLr8DJIOg44vwHnCx2pai5eHC8F7grIU27diWU3ExqlnBlQRGV7UPNXd/pu5c8MsqfYR2y+kchQc6Tjz6jMOXtNpcE3s/7KK90KeOwLPoeWs76llvahDbSffmOG7nIwwVrb8jC7M/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NyXG1im7uK5QqcaOcEPbd/teWZZmgGpYbYXZ/bnmaCs=;
 b=VpJ/y9Iuz5Y5+wrpAR+IOkNt+xcppL5X6XFLtFxfjdrK570gZX2sRVyYuQbqrCJQLaguaTs7dmWbmlBuPiBjOWy2cK1/a9NnAmfheEMhr0YQMy8SvDD6suZJvMrmu7mxKPCOU4Q6WFyry+7iD7OqHjHTnYp/qArtiCDT27jRqHHKHEhkiDwGu+nN52XwFjdvUjEigorjjNJNMQ1Updl6Jy2jWjT6SlBaJ/IVbcGYl+bOS6pGTFwzcB/HjvFcHuq+VQRxDap3IYCQyZ2rxouPCNF3h0W2S2yjDJ2KwVMC/71Kxqx7mN7bwBEJ0Th9Di/VMDR292oYJYSNaD/jXuS+bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by IA1PR11MB7176.namprd11.prod.outlook.com (2603:10b6:208:418::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Fri, 5 May
 2023 07:51:12 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::1323:5ae6:8e04:faf0]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::1323:5ae6:8e04:faf0%3]) with mapi id 15.20.6363.026; Fri, 5 May 2023
 07:51:11 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Lukas Straub <lukasstraub2@web.de>, Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "quintela@redhat.com"
 <quintela@redhat.com>, Peter Xu <peterx@redhat.com>, Leonardo Bras
 <leobras@redhat.com>
Subject: RE: [PATCH v4 10/10] migration: block incoming colo when capability
 is disabled
Thread-Topic: [PATCH v4 10/10] migration: block incoming colo when capability
 is disabled
Thread-Index: AQHZegsem5DlCMGXNUO9DfneGN0CCa9KtoAAgAAFfgCAAARdgIAAlzsw
Date: Fri, 5 May 2023 07:51:11 +0000
Message-ID: <MWHPR11MB0031744B42FDE3E7D891A3239B729@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
 <20230428194928.1426370-11-vsementsov@yandex-team.ru>
 <20230504221054.616e4fe6@gecko.fritz.box>
 <35dd6e24-543f-e36e-5130-4f1a92be6a40@yandex-team.ru>
 <20230504224611.2ea16229@gecko.fritz.box>
In-Reply-To: <20230504224611.2ea16229@gecko.fritz.box>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR11MB0031:EE_|IA1PR11MB7176:EE_
x-ms-office365-filtering-correlation-id: ab95f990-3550-4e2a-7199-08db4d3d7ecb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1yDGa3SeCrOMKR3uJdIOTDZ0n5NH0BfJdZpXKcP5SEsnzUfLD1ATKSOch6yBTZtI/Ykr0lL4CuDKEX0W8eY54UUDQYR6fDm+k/9FaYr58TmZ9P5/jWrOAF9F6KesEKQOY2Pbo/5INI3CtPDuFXZxI86AwE6ipKfHu/ora7yr5mr9svC1UXTFJgCO65Ctqi1nowSahuKDqaAzV9qtD6NUavxaDdCkts+ooSIr6LLXzxcdgQQ3dnYYDyIcvjf6FYetbWYZM23VnEdxAsTZv29yXhNzC6GiyQUkkJIRZ0pD99yetdbgX2HMazPKHkvUG59ZaoXokTwv8O+NkJme0m7MlnqCjJwKXBLNol+bOCXovXcJNhWn5EPE56QsMMtL9LWCxu/0J6YWqdVnw7LJGHQ5I2QehxJSQCDClk3QpaXqckdIVM9vdKXJV10PkkrG90Asp2uWOtf0B/92GRc32U8B7iGVP3LL/Q8u5JGsu356NcojBZRMX7wjhoSK5P6YOkxxxBSU0hPgGZArJrhB/JBHeD0zbFOfH/cvM3YdM/CAUUS/1F6Jus5N799CY3BNaLog/uUy8pmbk7SROTeHx1Kj158s4rh/tF7NM932/Ck1iYfbSU/K88D6ESn21D9XkB//
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(366004)(396003)(376002)(39860400002)(451199021)(2906002)(8676002)(52536014)(41300700001)(8936002)(5660300002)(66946007)(316002)(66446008)(76116006)(64756008)(66556008)(66476007)(478600001)(86362001)(38070700005)(110136005)(4326008)(55016003)(38100700002)(71200400001)(7696005)(33656002)(122000001)(54906003)(83380400001)(53546011)(82960400001)(9686003)(6506007)(186003)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?K853DYrmlsOdwaEtsE6OX+f1jhbcLuxe0nc81vJErhNT4MkFDm7j8lJLE9Pd?=
 =?us-ascii?Q?jKbVkRxUz0HWPk68Nt9fb/JhVLk8nbf6GkhLBIMv3ROoz7HWsH68MdWbPEYp?=
 =?us-ascii?Q?y9Uwfeu22RpzWQzNkfZxiCWN7k5vQvnHgEW70hn4y8WQwldKip2zQAp93ChI?=
 =?us-ascii?Q?+m4gAOg3uiAOmQMZcUCIsSgWSy1UiytfFZAkzFC1nGru++Ko7ZlAie90Lj0F?=
 =?us-ascii?Q?06w/G1KIYyHsrNZN6blkb1s6wvc3ghz4cRaOZKKuPpeGXQ4Rk3rKu6La7CNt?=
 =?us-ascii?Q?zEzP2EdIyKlWfDWbyceNhLYUQjdtSdi+b2D8QAmS0rJnqT6LKbN8lbvw7Lxr?=
 =?us-ascii?Q?twf+3qsMI9c9Kv5PtMAgtlhnbmMjkQmjWV+qC2WotA1E6WX7UpHdaWSK5zA5?=
 =?us-ascii?Q?gYpElDnNdePg1RQM4krd7O/yvAQEfjkVPxG36DseVwfUFimvfVq1dMjpkKL+?=
 =?us-ascii?Q?ftHvnPY15OYIUbTizjO74dFRoOPNIpsdfTn51ZL2UttQWthXOt0AZcWeB6S3?=
 =?us-ascii?Q?PRrQl+0z9KtT5GJj/mX96plpWJiX/wcfPCEtrqfGsgcxxBkwwinYiMK/47Ap?=
 =?us-ascii?Q?gMgyIkcJhUOy5r4IzIl8PcSldfn0DegjOJnySLNLFaoWczldj2eGQk23us8C?=
 =?us-ascii?Q?gh011Jh5wNA65JdqhIo7k35mL8uefAX0n0lLh8gNabT1dGX0FngeOwBJZKHk?=
 =?us-ascii?Q?bN63u6WIETL57h12X5IRrOzsGqYBX3JBCQHTRc28Olid4DmiQUils518pNgI?=
 =?us-ascii?Q?vRYTdhjfkTiMZ3qxO+YjIr+JJhDr9yzRl6STM612R2Vxb/YJm7XyvnHGmbBB?=
 =?us-ascii?Q?AXe0b3yepp6SWP/vvzuuws/rKQxg3ysdrn95VctdJPnAHgfwS0S2jOXKay0a?=
 =?us-ascii?Q?XcYzVvgl9DskRF1CAGQhnHaGl0uJGepFtIZJCpCCc6gdOmHiZEb3VfVVikJx?=
 =?us-ascii?Q?J6v0RUYnfMdd1Ij0EnzXF/TtAhugm3x5FMNo4YUzOo5ma83h6cj+SYPYJnFf?=
 =?us-ascii?Q?MhsDrbiUdVmvb3v+JY/khDpOwe2ygiRTvN3qiojGO1bGEBE1U47cbxfCaCOR?=
 =?us-ascii?Q?2rNlmj8JswT+ybO3yELed0MYgncVMtu3p3JGT0xDbm9s88NBHbCYwhSuEubG?=
 =?us-ascii?Q?W9wqi0tlI8OK5rs7WTbiZMTZ83lZw2kinDYNRXwnyua7bWmDvdFPczVZFRdv?=
 =?us-ascii?Q?yUoxgITB5Gk6JYHbCGFpbUopYEIG8iLLotznKzmSzsM423OaeIt92YI5tyQO?=
 =?us-ascii?Q?bJWqQm3EnUtFs4nffHqCiEF+NLuCzM9uBkrfJVnkAEYdP92RQDtY2FZWhmKe?=
 =?us-ascii?Q?inO+4nCM4kiIECOBgDEJV7e7Xe7/kImcFHv9ztoBuoL1WY1derM1pIjY2zDX?=
 =?us-ascii?Q?E3FE3kxUSk8/XblHW1XueS2142bQoqQYAn0z1oZIioFgYIcjrnaFm5+hnGiM?=
 =?us-ascii?Q?7B3le9WCioC5s3BO4llIrQ/HJfq4CfeyHXh/ek7DoOZJoq+DbaXgcSyq4SmC?=
 =?us-ascii?Q?YrwX1Foxcf+1uB9zSze8EZIfBpVHjtfEKnLaqCRfuoo50cTE7PYHMh9IERy3?=
 =?us-ascii?Q?qeidAqOn+K0W1BWsQQUr2tOZvtxn9qaDAlTmqxZF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab95f990-3550-4e2a-7199-08db4d3d7ecb
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2023 07:51:11.8547 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ORzV9g4uGXBV+oqpW3BPhtV65ic1UjVWxu+7h0+MT/+8Jep0WVGa5mMEokowMh5DyRyLQc8tih5jKTWT1B61FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7176
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.120; envelope-from=chen.zhang@intel.com;
 helo=mga04.intel.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



> -----Original Message-----
> From: Lukas Straub <lukasstraub2@web.de>
> Sent: Friday, May 5, 2023 6:46 AM
> To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> Cc: qemu-devel@nongnu.org; quintela@redhat.com; Zhang, Chen
> <chen.zhang@intel.com>; Peter Xu <peterx@redhat.com>; Leonardo Bras
> <leobras@redhat.com>
> Subject: Re: [PATCH v4 10/10] migration: block incoming colo when capabil=
ity
> is disabled
>=20
> On Fri, 5 May 2023 01:30:34 +0300
> Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:
>=20
> > On 05.05.23 01:10, Lukas Straub wrote:
> > > On Fri, 28 Apr 2023 22:49:28 +0300
> > > Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:
> > >
> > >> We generally require same set of capabilities on source and target.
> > >> Let's require x-colo capability to use COLO on target.
> > >>
> > >> Signed-off-by: Vladimir Sementsov-Ogievskiy
> > >> <vsementsov@yandex-team.ru>
> > >
> > > Good patch, this is needed anyway for COLO with multifd.
> > >
> > > Also, it allows to remove a some code, like
> > > migration_incoming_enable_colo(), qemu_savevm_send_colo_enable()
> etc.
> > > I will send patches for that.
> >
> > Great! But with such changes we should be careful to not break
> compatibility between versions.. On the other hand, x-colo - is still
> experimental with that x-, so there is no guarantee how it works.
>=20
> Given COLO's usecase, I think it should only be run with the same qemu
> version on both sides anyway. Maybe we should even enforce that somehow,
> while we're at it doing breaking changes.
>=20
> For upgrading qemu without downtime, normal migration can still be used.
>=20
> Zhang Cheng, what do you think?

It's OK for me. We can add the same version requirement comments to the doc=
s/COLO-FT.txt.

Thanks
Chen

>=20
> > > Or you can do it if you like.
> >
> > To be honest, I don't :)
> >
> > >
> > > Please update the docs like below, then:
> > > Reviewed-by: Lukas Straub <lukasstraub2@web.de>
> > >
> > > diff --git a/docs/COLO-FT.txt b/docs/COLO-FT.txt index
> > > 8ec653f81c..2e760a4aee 100644
> > > --- a/docs/COLO-FT.txt
> > > +++ b/docs/COLO-FT.txt
> > > @@ -210,6 +210,7 @@ children.0=3Dchilds0 \
> > >
> > >   3. On Secondary VM's QEMU monitor, issue command
> > >   {"execute":"qmp_capabilities"}
> > > +{"execute": "migrate-set-capabilities", "arguments":
> > > +{"capabilities": [ {"capability": "x-colo", "state": true } ] } }
> > >   {"execute": "nbd-server-start", "arguments": {"addr": {"type": "ine=
t",
> "data": {"host": "0.0.0.0", "port": "9999"} } } }
> > >   {"execute": "nbd-server-add", "arguments": {"device": "parent0",
> > > "writable": true } }
> > >
> >
> > I'll resend with this addition, thanks for reviewing!
> >
> > >
> > >> ---
> > >>   migration/migration.c | 6 ++++++
> > >>   1 file changed, 6 insertions(+)
> > >>
> > >> diff --git a/migration/migration.c b/migration/migration.c index
> > >> 8c5bbf3e94..5e162c0622 100644
> > >> --- a/migration/migration.c
> > >> +++ b/migration/migration.c
> > >> @@ -395,6 +395,12 @@ int migration_incoming_enable_colo(void)
> > >>       return -ENOTSUP;
> > >>   #endif
> > >>
> > >> +    if (!migrate_colo()) {
> > >> +        error_report("ENABLE_COLO command come in migration stream,
> but c-colo "
> > >> +                     "capability is not set");
> > >> +        return -EINVAL;
> > >> +    }
> > >> +
> > >>       if (ram_block_discard_disable(true)) {
> > >>           error_report("COLO: cannot disable RAM discard");
> > >>           return -EBUSY;
> > >
> > >
> > >
> >
>=20
>=20
>=20
> --



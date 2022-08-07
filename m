Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A0758BE37
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 01:06:13 +0200 (CEST)
Received: from localhost ([::1]:53362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKpLX-0003zA-Vx
	for lists+qemu-devel@lfdr.de; Sun, 07 Aug 2022 19:06:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mikelley@microsoft.com>)
 id 1oKiUP-0003YH-Q2
 for qemu-devel@nongnu.org; Sun, 07 Aug 2022 11:46:58 -0400
Received: from mail-cusazon11020022.outbound.protection.outlook.com
 ([52.101.61.22]:21347 helo=na01-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mikelley@microsoft.com>)
 id 1oKiUM-0003pJ-JD
 for qemu-devel@nongnu.org; Sun, 07 Aug 2022 11:46:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OZ0GvKcWP4SD5+S06+8spzHncXRrWrJxA9K3tXRgJVWPgm1RmO/9VVxQQSsgU5662gt1cPuCUz0QKCg2Vl6DLxUae8dtjbDpP2Bp1C0Mp/2n5IV3yIprF/FMhyA5qTxREMrZDs5EX2ba6VpfTvfRryqh5gRmYZAq5L4kOv/YWnpc8kQMxJpixQCxlMfQchmBfsHN5+JDtF/aWbW68s+Tx8h/ifCwt4TWfRXm7ppaj3nciNNR8Cy843/QYvSUKtIXomYw8627RgqjD5S8x+AOUBcBiMmC+r2hOidaoVgf9fUdacvMbpLYggZezmdKUwSjboNRYI3uOWxW4yc+1/cCwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PzNe6DRzAcraTdRdid/sfBS+ehfKHfltICMPguFOYxw=;
 b=TJm+WbKaqT//NVNhOwr7IqGdhv7lskKzxMNCEWL9whGCJRRd5hvfYE8fTzURD0W1mNaNJTg68BlRYTdRiwz1aVnH0EhE9BSn0DmTF7ZFEI2iOUHd0t8gF2KjyHAR60cfy60iZ/P9KAWgCfUOrVeFyg+H8vn/vVDVjOTuQ9ViG7UdqJkDe1/ommd11w32iA6o3omJaYl2nZxbmduBxjyV4gjxz26buKZAIy+kKSKjeYaNxPPFj+fIn21Rhk4o+JbHCQYy8pLbIp47GBX+yLr/hMpkwTAKcHC/tjW/LE6/lp56AkkQ+YBk1HvZhe2KHLxuRn24MzndcaHvU8P9IXYb5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PzNe6DRzAcraTdRdid/sfBS+ehfKHfltICMPguFOYxw=;
 b=P1yHrQ61N+X/CS0hoe+UcYrglzcRBeWNCQzgPPgkYFnziGI0YdQXbi/hcZ6sE/f+RzoK6G0XQRB+2sBj0Bl1UQhawCSDR8C9xQAnhJWn+o9upHWAaT41s2rTQhiAL6T6qLSkJuZJ3GGEoYBi845kXYJ7UOjkF2WKuzNu8/L38Qc=
Received: from PH0PR21MB3025.namprd21.prod.outlook.com (2603:10b6:510:d2::21)
 by MN0PR21MB3314.namprd21.prod.outlook.com (2603:10b6:208:37f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.8; Sun, 7 Aug
 2022 15:39:59 +0000
Received: from PH0PR21MB3025.namprd21.prod.outlook.com
 ([fe80::29af:3ad1:b654:63b8]) by PH0PR21MB3025.namprd21.prod.outlook.com
 ([fe80::29af:3ad1:b654:63b8%7]) with mapi id 15.20.5525.009; Sun, 7 Aug 2022
 15:39:58 +0000
From: "Michael Kelley (LINUX)" <mikelley@microsoft.com>
To: "Chalios, Babis" <bchalios@amazon.es>,
 =?iso-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "ani@anisinha.ca"
 <ani@anisinha.ca>, "mst@redhat.com" <mst@redhat.com>, "imammedo@redhat.com"
 <imammedo@redhat.com>, "dwmw@amazon.co.uk" <dwmw@amazon.co.uk>,
 "graf@amazon.de" <graf@amazon.de>, "xmarcalx@amazon.co.uk"
 <xmarcalx@amazon.co.uk>, jason <jason@zx2c4.com>
Subject: RE: [PATCH 0/2] vmgenid: add generation counter
Thread-Topic: [PATCH 0/2] vmgenid: add generation counter
Thread-Index: AQHYqAaL+CyG+G8eR0epAQEmvPeQBK2jj39w
Date: Sun, 7 Aug 2022 15:39:58 +0000
Message-ID: <PH0PR21MB302536B15A1F99482378280DD7609@PH0PR21MB3025.namprd21.prod.outlook.com>
References: <20220803134147.31073-1-bchalios@amazon.es>
 <Yuqhm5LCdg+zf/rH@redhat.com>
 <babbf105-f7df-a759-c942-45483dfae02f@amazon.es>
 <YuuZLeYmOfzBlcNl@redhat.com>
 <68bc7d84-9ece-f115-68c9-76fc461c71d1@amazon.es>
 <31d08784-cdd5-c5fe-8f09-e7d27e0e3277@amazon.es>
In-Reply-To: <31d08784-cdd5-c5fe-8f09-e7d27e0e3277@amazon.es>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=6c7cd134-7d2c-42ef-9249-a878032c42a8;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-08-07T15:10:04Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b3f24777-4993-42c9-8c32-08da788b15ce
x-ms-traffictypediagnostic: MN0PR21MB3314:EE_
x-ld-processed: 72f988bf-86f1-41af-91ab-2d7cd011db47,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2iascYbYfRXezXoZBsH3AdGm3A/vtQz5mwXrBwwQcEBeZpAYYGxlYHYWjSTz/eg2ODpN69NuCJ5U2euc8JOHB/bOshvYkwKkBIyqbex0g/UCCKVKosWq5QIZu4oAyYfyobT8l+ShUFHkIwACoNlLLOZPBnTjoa4X4nBIoQyWjsvHFUyppCcxChr1zTieEpuoqQErBcOWRTA4PXlSzjWmSXJ2iUf7LQKJRThsgEgWqLUqXSWrOdYOVDijjt5ClFY6+Ol6aYAwUKeqLW/ULY4gCYZWrPaFPnPoi1P95UgdKXlakw7rkRuusAWMtcRSjJxGuFt3FmeEtoogW2DaVJxd5l/mQmymuSg6/p2PK5fZuSeiRA6UBlPON6iyb6fb73d3BCkHib5i+3zeEIaWy9gph70mkjjoaRW/0mfNnarZIm9qYHnqbnoNiQySJEncCe15+RghGieSgzU/tEKqh9OZfflCbMikEQXVm3775UDmoM5bAXN+ly+4PGe7+kVutLGk/FHthaKGVn3t+ylx/4aZaZnu3JY1QMaFz/0CUXumPJv6gSMCxRZ1MegnIzJPF6mYgQ0zk525qz8maUCxYPczHSzckwyuBmJHi9PKt1ie1GcwtANEkLGfuvx1nO+I2+IWR0Gf3RQ0Gc+dryUpgMruMXnRXQozKVj3EYBrRSvbKCTodFdNQFfjtxSNac9R9tMDiR8RhKPt68VR9OnKXY/u8KTVPxg9gK22RJcMZjyN6kUcDIWIT/GBVOR1BZnQ/+61+SyJSc9YFWI/gIJ1Kr3WUh8I9VgTWw3B/QGv/falQKnAnw21ZidetqwxM89+x8Snghu7Ub6UYuQHDhutDTztHUAzVPHFG9vJCyv5NUoa5OOXyv4dFKYvWEWNqETdEic1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR21MB3025.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(396003)(39860400002)(366004)(136003)(451199009)(71200400001)(110136005)(478600001)(54906003)(33656002)(122000001)(966005)(53546011)(10290500003)(316002)(82950400001)(82960400001)(41300700001)(38100700002)(4326008)(8676002)(83380400001)(66556008)(55016003)(66476007)(66946007)(66446008)(76116006)(64756008)(5660300002)(6506007)(7416002)(8990500004)(26005)(9686003)(7696005)(86362001)(38070700005)(2906002)(186003)(52536014)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?4DYLxVM0fNwMP5BUKjsW39Q0An5vAPaoLPfDh0BXMzC8cMzLdf/L6GSlDU?=
 =?iso-8859-1?Q?9h6na0umfXRAHXfPUvieZv2+s/68ZG2uh0K/S6TBfgOwym4TzgYEXvPBby?=
 =?iso-8859-1?Q?iWqq3N3G0mxzntlSqtRbMcDyQUTeKmi9wKg9B1NfJehsVO84xB1DUTsvVx?=
 =?iso-8859-1?Q?Y8jLwCaPaK5UGudTBQQaJwgGpOwT9KF8/KCUVKooK1pLi2hUlgJ/M1jwn3?=
 =?iso-8859-1?Q?jc8HLILm5IQ41Eq9tD2/ZInI9JRvfNhQYOuMv8xHRThHOycdyrIwrearyH?=
 =?iso-8859-1?Q?olihuXPw9AzrcNq82Wln1kB9A2SSLgaG1ZRp/I8JJtnriRjw1rC3/ooccP?=
 =?iso-8859-1?Q?SG2nn5xchOE2BswX/qg2pWGZJGt5WkIoT1V8CPrpKPblKRm6Jl1Zqd7Jqz?=
 =?iso-8859-1?Q?k71y/+TgN5CNF0shZDzeXvQ50T69xaVL6pqC6eBVFvWVjb4lrdB/xHNoz5?=
 =?iso-8859-1?Q?UdYAiKlqq+F97f58LovVHrbi+LbI98b3upYDL3V1gdvIE9UqDqgh1UodJI?=
 =?iso-8859-1?Q?b90V0F5a106eSSggaEReNUoQpoFUAYq1MYd+VS3kdudx/+r0yM/Umxsni0?=
 =?iso-8859-1?Q?Y4kFehcR9wHA5weGpfK58LaJ4SX1aWog+Za1dFWLsd+1WsOXKYaVHN9Vu1?=
 =?iso-8859-1?Q?DWN0eSVydMvavfTMrzMOZZtm4cviiM6q3ikqxMIz3qI3sY/6ekKFR3Oik5?=
 =?iso-8859-1?Q?i19Ik3f89bAvLEaluNXmjTGaGw4XSve3Oq3tkcWwYU0S74sUEwwYptaIEJ?=
 =?iso-8859-1?Q?H0p9SPgByk+egC3fCITi3AUWCLeeqpItZOKwXqJ4r7JQiB3zDGh0d84ap+?=
 =?iso-8859-1?Q?l1FJNxnJ3k0BtxRqMMgO5/hvWAYrtQ01a+moGloKHiQBwlZBiyGRr1Tn+R?=
 =?iso-8859-1?Q?CcegwZncKkFTu+pCmo75g+qblaXIqczqJ9IrwiohMgXvVo6/VVjeaWutxg?=
 =?iso-8859-1?Q?b1PffKpdwWTELHQAyrdQIdnRucXVRh/mrBlUbksnubWsPmR6X5V9Ph1TgZ?=
 =?iso-8859-1?Q?A1B2SXd74TE5MSwBOCRkPA7qLhkw+upIngArqmL/+5ZxcE4aUiyKDc7jff?=
 =?iso-8859-1?Q?8nuwio1eQacsDWfRstI+/y8RrED87XC18qFmwjNrr1b9cihlRGnPP0QAEW?=
 =?iso-8859-1?Q?mXRfhEMoDbgoEeiDZ10fyiXQ39dhuRW3u24HCvwhhRqsgzoqFbHImZD0vb?=
 =?iso-8859-1?Q?yRYWtrXuRNcbLoZEwJXe+7ykxm2wO21zuhdnL8hlIrNZO/wcIK6d3uCJA2?=
 =?iso-8859-1?Q?7dB5Uoi9HZB+PUnN9dyR4OPdbB5BO6zU78KZT5LRncfOTCuKfJKt6R9eN6?=
 =?iso-8859-1?Q?y2G5a0uQLP/80hF3tURNCg82swNcXtSFnNlBFN545X76o6cCzS+5aoRy9b?=
 =?iso-8859-1?Q?KNlU5f0UUjf2AIRdAlqW9czRTimYWLZIi6IukRxETUqtrDMD3jN263Qnbw?=
 =?iso-8859-1?Q?vWGL99SjPi5ZJyxwArPB2yizRGtU0XDxAzknJplXl2/cr+HFbH9htyPClQ?=
 =?iso-8859-1?Q?37f8icvOhhvgfY/UIKikWsbzWESOdlLG5bn2joKauFN08F2Grv1UJPOTi1?=
 =?iso-8859-1?Q?jNTXsVjHR5FrUR4RJEcek5/aqtuRol/5lqMwtQojCsl6LwFYLy/J2jRNTi?=
 =?iso-8859-1?Q?Zz9t0l/jpQBMqE09SrY2p7o+0UKAK9TP0qWQFYsfLdijELary4ZZG2TA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR21MB3314
Received-SPF: pass client-ip=52.101.61.22; envelope-from=mikelley@microsoft.com;
 helo=na01-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 07 Aug 2022 19:02:26 -0400
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

From: Chalios, Babis <bchalios@amazon.es> Sent: Thursday, August 4, 2022 6:=
31 AM
>=20
> On 4/8/22 12:17, Chalios, Babis wrote:
> >
> > On 4/8/22 12:02, Daniel P. Berrang=E9 wrote:
> >>
> >> On Thu, Aug 04, 2022 at 11:54:05AM +0200, Chalios, Babis wrote:
> >>> Hi Daniel,
> >>>
> >>> On 3/8/22 18:26, Daniel P. Berrang=E9 wrote:
> >>>>
> >>>> On Wed, Aug 03, 2022 at 03:41:45PM +0200, bchalios@amazon.es wrote:
> >>>>> From: Babis Chalios <bchalios@amazon.es>
> >>>>>
> >>>>> VM generation ID exposes a GUID inside the VM which changes every
> >>>>> time a
> >>>>> VM restore is happening. Typically, this GUID is used by the guest
> >>>>> kernel to re-seed its internal PRNG. As a result, this value
> >>>>> cannot be
> >>>>> exposed in guest user-space as a notification mechanism for VM
> >>>>> restore
> >>>>> events.
> >>>>>
> >>>>> This patch set extends vmgenid to introduce a 32 bits generation
> >>>>> counter
> >>>>> whose purpose is to be used as a VM restore notification mechanism
> >>>>> for
> >>>>> the guest user-space.
> >>>>>
> >>>>> It is true that such a counter could be implemented entirely by the
> >>>>> guest kernel, but this would rely on the vmgenid ACPI notification =
to
> >>>>> trigger the counter update, which is inherently racy. Exposing this
> >>>>> through the monitor allows the updated value to be in-place before
> >>>>> resuming the vcpus, so interested user-space code can (atomically)
> >>>>> observe the update without relying on the ACPI notification.
> >>>> The VM generation ID feature in QEMU is implementing a spec defined
> >>>> by Microsoft. It is implemented in HyperV, VMWare, QEMU and possibly
> >>>> more. This series is proposing a QEMU specific variant, which means
> >>>> Linux running on all these other hypervisor platforms won't benefit
> >>>> from the change. If the counter were provided entirely in the guest
> >>>> kernel, then it works across all hypervisors.
> >>>>
> >>>> It feels like the kernel ought to provide an implementation itself
> >>>> as a starting point, with this QEMU change merely being an optional
> >>>> enhancement to close the race window.
> >>>>
> >>>> Ideally there would be someone at Microsoft we could connect with to
> >>>> propose they include this feature in a VM Gen ID spec update, but I
> >>>> don't personally know who to contact about that kind of thing. A
> >>>> spec update would increase chances that this change gets provieded
> >>>> across all hypervisors.
> >>> You are right, this *is* out-of-spec. The approach here is based on
> >>> various
> >>> discussions happened last year when we first tried to upstream and mo=
re
> >>> recently when vmgenid landed in Linux. I find that this summary:
> >>> https://lkml.org/lkml/2022/3/1/693 quite to the point. (CCing Jason t=
o
> >>> have his take on the matter).
> >>>
> >>> This series comes together with a Linux counterpart:
> >>> https://lkml.org/lkml/2022/8/3/563, where the generation counter is
> >>> exposed to user-space as a misc device. There, I tried to make the
> >>> generation counter "optional", in the sense that if it is not there, =
the
> >>> ACPI device should not fail, exactly because, for the moment, this is
> >>> not in the spec and hypervisors might not want to implement it.
> >>>
> >>> However, I think that changing the spec will take time and this is a
> >>> real issue affecting real use-cases, so we should start from somewher=
e.
> >> I know a spec change can take time, but has there even been any effort
> >> at all to try to start that action since first discussed a year ago ?
> >
> > These patch-sets are out exactly for starting the conversation on addin=
g
> > this to the spec. As you mentioned, it would be great if we could get t=
he
> > opinion of someone at Microsoft on this.
> >
> >>
> >> If these race condition issues are supposedly so serious that we need
> >> to do this without waiting for a spec, then what is the answer for the
> >> masses of users running Linux on VMware or HyperV/Azure ?
> >
> > The problem arises when you start snapshotting and restoring on VMs,
> > so not everyone is affected from the issue. Use-cases interested in thi=
s
> > are ones that manage fleets of VMs that run code that relies on
> > user/kernel-space PRNGs or network-facing services using UUIDs, for
> > example.
> >
>=20
> I am CCing Michael from Microsoft. Maybe he has some input on this.

FWIW, Microsoft created the vmgenid concept and spec 10 years ago for
Windows running virtualized, with virtualized Active Directory Domain
Controllers being the primary use case.  I doubt there's anyone on the
Windows side here at Microsoft who has any further interest in the topic.
I do know there haven't been any requests to the Hyper-V team to
further enhance the vmgenid functionality.

As such, I think the Linux community is free to extend the functionality=20
without conflicting with something Microsoft is doing.  I don't personally
have domain knowledge on these technical issues, so I'm acting more as
a Linux advocate with the Hyper-V team rather than a domain expert from
Microsoft.  I can circulate the Linux proposals with the Hyper-V team and
to see if they have any objections.  If there is agreement on extensions to
the hypervisor/VMM interface, I can ask the Hyper-V team to implement
them in support of Linux guest requirements.

I can also try to update the original spec with the extensions so that the
spec is captured in one place, though the internal logistics of updating an
old document like the vmgenid spec can be surprisingly difficult.  At worst=
,
there might need to be a separate spec for the Linux-driven extensions
that is hosted elsewhere.

Michael


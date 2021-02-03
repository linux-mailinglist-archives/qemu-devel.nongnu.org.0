Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE2D30DE99
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 16:48:39 +0100 (CET)
Received: from localhost ([::1]:44830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7KOU-000088-6r
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 10:48:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1l7KLx-0006rp-VL; Wed, 03 Feb 2021 10:46:02 -0500
Received: from mail-dm6nam10on2120.outbound.protection.outlook.com
 ([40.107.93.120]:1123 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1l7KLw-0004oL-FM; Wed, 03 Feb 2021 10:46:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QQej/lFaovd9UIpSWt0PKKP4tQyWsQIbRymw0Qgw5smrRNaxjtw0oA8a8gLXfppgpI7JlCyyoYShd4sxC8Dm6c/DHods1zCxVbK2mwwYLl5Do+KGBAEW+Be1OWKjiImtTXrdYNSG6Vo4euSsmDc2p28o6CId3SE/zbClpoMZkj6PW5/SJTc1ouCDDQGDHIYFSDqIldIree1RhG2oBbF50X0Vckn6uxs7LcghPZLxLtQwwgozVP/K4oSbOERctCYXnsUyxW0XNon17w/vQcREM3ledEPznh5xiiUk3gG9UiCPjxIIyqgXeIf+gSoV24wIT7PTAIO8BGKn0MJlwXd0lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWC/ARLsXbZGrw1Pb0m7VDGTLclURHdEWF+DNhwaldI=;
 b=ZdYdccg1RQjVpMlQ337kD9wS4kdLpggsvjitnpwlv8amAKSnfLCeIHtlDLRYrUVlZWzPwob9FCP306AH57cW+GZuIs3Ehlf/LKk+NjMOKedmUwakjS9o+hSfi7QRh294z4mbj1cOTz7rjL/zWbg7ygG0KbKuM9Gy8XYuqpb7W6OYx+0ngMGJohiE5kpitaCASFTlv7YrAaMeXc4UTYER06NAXqezhJcoKRzLQBLIHguWPG+Ef2s8j3uzy/Ixg7byJuezMZdM7WzTPn+reikXzy9KXK2aAYu5h3udGIyYHiNJEzRKA1OMxPOkux3oj9gsRBVBeZQ++3cGO9sNdrddBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWC/ARLsXbZGrw1Pb0m7VDGTLclURHdEWF+DNhwaldI=;
 b=o9h1v3LLmmzRwls0HlhGmAkUb+lTV3tiTY9e0JBQnQePeujJziiybet+naeVV3lHTu/r2OdiV/Dh17J/hdvYy8WajNDilNOjtuVRotbRl/qG635mYqPa/PMAIpfB7MZqGe5QlOaZWiMqdJI057amOY3qMiUSCpoyurFGY52MjeI=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SA1PR01MB6607.prod.exchangelabs.com (2603:10b6:806:1a4::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.25; Wed, 3 Feb 2021 15:45:58 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::6caf:7c56:c4de:b5c5]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::6caf:7c56:c4de:b5c5%6]) with mapi id 15.20.3805.027; Wed, 3 Feb 2021
 15:45:58 +0000
Date: Wed, 3 Feb 2021 10:45:47 -0500
To: Andrew Jones <drjones@redhat.com>
Subject: Re: ARM Snapshots Not Backwards-Compatible
Message-ID: <YBrFK2XscG6Y1/Rq@strawberry.localdomain>
References: <YBogDGJRU5pcDKmi@strawberry.localdomain>
 <153e5c54-f8bf-d088-502d-502309f5d2a6@redhat.com>
 <20210203102758.GC2950@work-vm>
 <CAFEAcA9_mcXHd5m+Z2M1jvk58kGVEcYKF+0kVsLJTjwB9MZcfw@mail.gmail.com>
 <20210203104920.GE2950@work-vm>
 <CAFEAcA9DdiBA+-5cQ87NR6fHFFFJAtDVbAEc+AJQNMNo4bVB+A@mail.gmail.com>
 <20210203124412.xioafvptnovzalle@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210203124412.xioafvptnovzalle@kamzik.brq.redhat.com>
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: BL0PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:208:2d::24) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 BL0PR03CA0011.namprd03.prod.outlook.com (2603:10b6:208:2d::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.17 via Frontend Transport; Wed, 3 Feb 2021 15:45:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5f77aa4-acab-467e-d2bf-08d8c85accc7
X-MS-TrafficTypeDiagnostic: SA1PR01MB6607:
X-Microsoft-Antispam-PRVS: <SA1PR01MB660764D24954E41880D627D18AB49@SA1PR01MB6607.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6zhb0jNk2cQvpt9iLuSp4Bh6Dhn9PBypjbSpqUdE5r+LkL8M9H79k8og8YNfBFHoEpswEJ7Rzz2hk7oyRl0VDUNtoaiHK7qhEoWTs07xt1F0kigTdnAGdUKwdElTdaf471SWhFn9ltoWQNgomP3/XnZHMxMTU7w74e4uXPVhpkpxqIPwr0I6nM0Qd5bQPzYYBQKpNcjdLTa43TLys42dFYfXl3EqGr7PdR58hRdY1n/+OhPN3emq1FHRwCGaHcIXYsDNWiwsyenDT/Nllui/TgeaLqEagko+Tyfg83931yCT531Aqke9Pil93jOZcAPJPRz/g/ofMm5kUwnORyRE5RYL76PGPbGdjVIoI+DGhFoA3fdImg8xQHMk1HB/cu+N4coqqQ1n8/EuN1O3dpO/Ze9KAoI1id2eT7A42FY9yZgrOvBm02LzBc0eMkj/v+TO7UtwRVWvwIaXXl2L6Ixmwx3Ta+tACeSxfg0BFK3sDG+E3uvKwZASnHq/FuQ04i6U1t6I+osp3mak+xc/f+4stg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(396003)(136003)(346002)(39850400004)(83380400001)(956004)(6666004)(8936002)(52116002)(6916009)(8676002)(5660300002)(2906002)(55016002)(86362001)(7696005)(186003)(4326008)(9686003)(26005)(478600001)(316002)(16526019)(66476007)(66556008)(6506007)(54906003)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?2xD37xNCW594LYX4kUfWzbfZbyEBP85YgH35gRBQAXAA9E6rwhdMzZt3XS?=
 =?iso-8859-1?Q?SB2yH9hFuOne9F9sAJRSITuE9UPTuy8cs2qU1DFqYjbmDvgLJvOCUNcY1G?=
 =?iso-8859-1?Q?sruZve7Fto2dNLs6xh2fw9JlFk+y+IN6VYNsyTVrWJrGjUDDG7rvYSdtN8?=
 =?iso-8859-1?Q?SAEE7+VUFvg5sv+2iM1azvMdzAzHs48dXE9S/FUg0iQqF6OSB6oSR51xBv?=
 =?iso-8859-1?Q?GGQ+EexyHzXF4V123M+FGfmu/VuqnEf+XzDAsSE9ETGtCR0zwHP7oCLerj?=
 =?iso-8859-1?Q?fK7F188P9bXOY9gArs92j6W/EuV6UREtLBkAVXPpFseuDXouZKoLOBQUyV?=
 =?iso-8859-1?Q?l8JHSoro4GS7LYp1xf1Htko9OSIxraCvYOeLXZWTFsrgjMPBIATbj5Cqgw?=
 =?iso-8859-1?Q?ORP3P9Vli/RNxWr1WYYGRZoGhPYrP/J7HXRwBSFu+w/gO93OI6su7KuxmP?=
 =?iso-8859-1?Q?YqWHTPuzfJ6f9ZozT6GkVSyxWLSIa69EcPGk3E0n2Xh+qZRopv8XDdLn+N?=
 =?iso-8859-1?Q?Q40h1EhOFtwg7I5U6tp4k4YBTlk22W3113BLhugYLQxk1id17hE5eHIBM6?=
 =?iso-8859-1?Q?pZv7Jp52xukjifO3JpEC5mpQM94998FYvksMSDS4CV82n68loW31abAgiN?=
 =?iso-8859-1?Q?Yp6DzvKjHn5lv65cod5B5Vbb+34NxD50V1dc5kxlzbD9nJ346hDCbfPMTg?=
 =?iso-8859-1?Q?HQOIhwgnws/xw3nmkI/Yyehg4cCW5vEAyhSNT3XQYxrrv4CAmvHSDdQJ03?=
 =?iso-8859-1?Q?dKvfDQgXSwl70az8eLCGsojBP7Q+BOo7JzPzDF3M3xPOPk0rDk8MQOCzzI?=
 =?iso-8859-1?Q?3CW4/zapLIlar9e1iiuynQipCmHIEWsqr9qqO0XHAziKRlRhnkZOkvmJzg?=
 =?iso-8859-1?Q?L0BGUgDGiYfxH6Fj1MkcexC+DqZuxYvncyPz3D3din5w6rvDXsZboBh8Fv?=
 =?iso-8859-1?Q?Of4Cwt3ws8GVQbIQjGWwR6ankSl95uj9GEsbCCraZ9aK8FcpH+tBKuxxWL?=
 =?iso-8859-1?Q?8hpfuD0LelskLXKDhdrIZOWHD599SoWT3TRxIZCFF27v/ShXvDTtvufE7W?=
 =?iso-8859-1?Q?/FaRt/tYnRQ81wB2NCTlxvwHYg4401GhfEWjYwBtfnM2?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5f77aa4-acab-467e-d2bf-08d8c85accc7
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 15:45:58.2344 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tEsF07Vk26EauU2P7f4L+6C+QRtQZGCT1hsAzgFjTiYT1SGNzTPb86m7mFi5PvxNSnX98RmanDSzH+uW1Kez+02ld57edY589BjIh/5wugg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB6607
Received-SPF: pass client-ip=40.107.93.120;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Aaron Lindsay <aaron@os.amperecomputing.com>
From: aaron--- via <qemu-devel@nongnu.org>

On Feb 03 13:44, Andrew Jones wrote:
> On Wed, Feb 03, 2021 at 10:52:59AM +0000, Peter Maydell wrote:
> > On Wed, 3 Feb 2021 at 10:49, Dr. David Alan Gilbert <dgilbert@redhat.com> wrote:
> > >
> > > * Peter Maydell (peter.maydell@linaro.org) wrote:
> > > > On Wed, 3 Feb 2021 at 10:28, Dr. David Alan Gilbert <dgilbert@redhat.com> wrote:
> > > > >
> > > > > * Philippe Mathieu-Daudé (philmd@redhat.com) wrote:
> > > > > > Cc'ing migration team and qemu-arm@ list.
> > > > >
> > > > > I'll have to leave the detail of that to the ARM peole; but from a
> > > > > migration point of view I think we do want the 64 bit ARM migrations to
> > > > > be stable now.  Please tie incompatible changes to machine types.
> > > >
> > > > That is the intention, but because there's no upstream testing
> > > > of migration compat, we never notice if we get it wrong.
> > > > What is x86 doing to keep cross-version migration working ?
> > >
> > > I know there used to be some of our team running Avocado tests for
> > > compatibility regularly, I'm not sure of the current status.
> > > It's something we also do regularly around when we do downstream
> > > releases, so we tend to catch them then, although even on x86 that
> > > often turns out to be a bit late.
> > 
> > So downstream testing only?
> 
> Not even downstream for the Arm architecture, at least not at Red Hat. The
> support we have for Arm Virt is still limited to the use cases for which
> it has been deployed. To this day that hasn't included migration[*].
> 
> > I think that unless we either (a) start
> > doing migration-compat testing consistently upstream or
> 
> This is the best choice and it can certainly be an additional approach
> regardless of what goes on downstream. I can look into this. A pointer
> to the x86 tests would be a good start. It's pretty simple to do a
> quick migration test between two versions of QEMU, but we need the
> whole build two versions of QEMU stuff first, which I hope already
> exists.

Does this mean that this is largely an issue of developing the tests,
and not a need for a place to host them? Or would additional
hardware/hosting be required for these tests to be run on?

-Aaron


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B80EE611782
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:29:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSDp-0007iT-VJ; Fri, 28 Oct 2022 12:28:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Kropaczek@solidigm.com>)
 id 1ooRSP-0000ws-JF; Fri, 28 Oct 2022 11:39:43 -0400
Received: from mail-bn7nam10on2112.outbound.protection.outlook.com
 ([40.107.92.112] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Kropaczek@solidigm.com>)
 id 1ooRSN-0002NO-EB; Fri, 28 Oct 2022 11:39:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eGqq0mhAu8rdrW8ouJcR4qPspY+RgaRGdI3rdv2m/lUDIrYjXI4eTCdNAkpCu12BZtnfT1Nk385f1F6tDkjZwjVgYjp/RNvdGOnu0yEsfUyrsp2tAPfmZQB3OxjNt5BFEJnDKBeVSMRTqJKfjiFaMrkaewfepN3jikbrLdN5q0T2zYosq+bF7s8eAfSenXfKesDrO2l8AG8zKOFckZw8QVskdeABoWsAwki25xTzxQ7W7LvCktVCEsOcMw4kigso0HqA/wd524q5tlv4omLA1o1GdheqBOUyx0/9Apa11z4gVSUCPdJQPpeV4JzJA+DJLWbK6qF9xPnStqVKDTqxHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZfoNRFYQjatxLZzOaHyOpQJQTegIBABTVSVsUVXjJCQ=;
 b=Spq63FijHtDTAcc26xbZM5G+f7GNWM+6JBedwr5cDXH02iMslswgvx7KoxUDhq9Xilo2GahzYa3pPHfX7QJFWtQeb9zduIddQnF4Uie/HtudCQqCVbAsJSVMZ7T9YqE7F43RM8ENhjTWyrL++tvZ7A530+n/kEOprNbxdc4kvIR4ry4aMy43rP428ZC/tSDNBYaq1Z+X95GHdx7MDBbOoqfTzj4pO3lPDiBeuWUKUpHzzeoVcYjXIUiK3EWbtUj6kTGsSw2hfTyuIxzyjmQeyVsGzO1stG/sk8DLAya95hF2pZ15hZJn6ghKBatQKL4qcMlrWiSplvBUk3MVpwHNfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solidigm.com; dmarc=pass action=none header.from=solidigm.com;
 dkim=pass header.d=solidigm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solidigm.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfoNRFYQjatxLZzOaHyOpQJQTegIBABTVSVsUVXjJCQ=;
 b=o5N7dzc0WrFUnDB81rYybMwUvXg8t9q49y2McPXyfOO7b4KEEANi24e4M8aVX1aZ7ARYDLzbXeOr5D/tTsNG5yWbVmIQhYkhau+iMdanHNU3sF2X/z96VXF4tR4FHCl7rPol299VnymvaCd6BdN8PGUlBQBne0MYdmy0DJZJ+s1m8TQOzEYo35bfPbPSLlIuG2lK2v69M7U16y8LuttZyQgdpl7e7KMHRdJt8ZVNoPYhgHSkQkToVtZfmYywiiOUK8lahanie1A1Qpuq43wFJZ69sOZAI6VL0HX9+4W5QG/sGRVDw+JG573JAsKoDXAAUJa8sw2pB+DZqTnR4FrdQQ==
Received: from BYAPR10MB2533.namprd10.prod.outlook.com (2603:10b6:a02:b4::13)
 by DM4PR10MB5967.namprd10.prod.outlook.com (2603:10b6:8:b1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 15:39:33 +0000
Received: from BYAPR10MB2533.namprd10.prod.outlook.com
 ([fe80::3821:e2e:8c42:8b40]) by BYAPR10MB2533.namprd10.prod.outlook.com
 ([fe80::3821:e2e:8c42:8b40%6]) with mapi id 15.20.5746.028; Fri, 28 Oct 2022
 15:39:29 +0000
From: "Michael Kropaczek (CW)" <Michael.Kropaczek@solidigm.com>
To: Keith Busch <kbusch@kernel.org>, Jonathan Derrick
 <jonathan.derrick@linux.dev>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-block@nongnu.org"
 <qemu-block@nongnu.org>, Klaus Jensen <its@irrelevant.dk>, Kevin Wolf
 <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: RE: [PATCH v3 1/2] hw/nvme: Support for Namespaces Management from
 guest OS - create-ns
Thread-Topic: [PATCH v3 1/2] hw/nvme: Support for Namespaces Management from
 guest OS - create-ns
Thread-Index: AQHY6kGsrco+LiRdUkqJr75yS44A2q4j7bJw
Date: Fri, 28 Oct 2022 15:39:28 +0000
Message-ID: <BYAPR10MB2533B48522A954D1F0A2A48F92329@BYAPR10MB2533.namprd10.prod.outlook.com>
References: <20221027180046.250-1-jonathan.derrick@linux.dev>
 <20221027180046.250-2-jonathan.derrick@linux.dev>
 <Y1roNWIrCaJv3aGn@kbusch-mbp.dhcp.thefacebook.com>
In-Reply-To: <Y1roNWIrCaJv3aGn@kbusch-mbp.dhcp.thefacebook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solidigm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR10MB2533:EE_|DM4PR10MB5967:EE_
x-ms-office365-filtering-correlation-id: 2ef22613-2aa3-4909-fbcf-08dab8fa9996
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G/w7bLO/Iuu2B9XG4wkdHKP3WO+6kbAizl/Zjtozyu/d84uXuuPzhughFjQb9huzJ0Cvk6CtFfx2nz2jLC805wCRMSCidOn+Vm647iga+i75woLOd0o5lxwrFGi3lWB5SNEvV6PCnZv2b5aIvqIRUtw2jm4KstIxt4/5dYKJco6abFEA0KVpeS/MNIj1XJj2a7wlfM/LC+5tKJ4Xfy5uQdMxJDzYyrpr72zhgBNo60FK7iSHYklsHmgYroQzjwRHVoJtdJKxjgsqzEYtZjbchYsLD33KUhYSceamXD9MujvMmGeNGrH9IiWrOEiY/WIC/pn2DqWnC2+4lXcmiFUnm8P4X43hAklgAlGh25FOUG+NcNsw05f4bkNCU8tLR0ARPNJu5q0u1LbXKNHDG3UEPC8JkXZL8y7OZUWJ92OiGAhS8GUPpaAEA3qqW7AKUAX4/KLlZMLeBq4jZvHzqt3Q76NWGSw4HwnUbwG8he2/v1S2Ku+awJobpVG9wXv8/uLag+Ds4BsRNGOSRHGfW2yzCGW7eI0Y/Pszu9QMY4NJnf83FJ1DwByGOan7q0ACubFyjcxs/q6C7DJ3P3y+e8onAXcLz1DN1PoSwge74Hbgft9HhPfWDB2p2cCDC15WFaVrCt/OiuJ5+n8ndECCKQd/7oblQ8c5gLYZnRxaJbyGsk66mN4eedFUyeCsVu659dEavjTSnr7ktCl73GPk8Lplh/Lxe85lRGKdMyT/TZ5wA3jSWcxZBSe2BAehDi5cJMrZmPAp4Yl3q0U8/hsu+Ujsaw4b90y3nx1uIgDsXes6sfAoeh1rVuMzG9UVwoCH8lRE
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2533.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(396003)(136003)(39860400002)(346002)(451199015)(7696005)(6506007)(53546011)(66476007)(4326008)(66556008)(76116006)(66446008)(64756008)(66946007)(8676002)(9686003)(55016003)(5660300002)(38070700005)(186003)(41300700001)(83380400001)(52536014)(8936002)(2906002)(26005)(86362001)(38100700002)(33656002)(110136005)(122000001)(966005)(478600001)(71200400001)(54906003)(316002)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NvDcoxvUmhTB9A0VgXNhWSgCKZIOGIhRf5wh/RNnRIcesKyGLK3fuF9M7LIG?=
 =?us-ascii?Q?mDoDf/t7hAzUfaXE++BX5IwjJsTZChIX8Tgjzug5KNaAwXba0WqwWneLMlW2?=
 =?us-ascii?Q?W7L22ccdGjq1CcFqN0Grj59QpQGoHZsQu+46OzxQP/T6p5k36J2cTFqGWqHP?=
 =?us-ascii?Q?VYpPlGPqaoruvwSOnm7upKYxHfT3Vh370giI/c0d5Wf0S2kA40bgyuRLX2Pk?=
 =?us-ascii?Q?QLBYLB37y2Bh/ygs851oBLrjq8C4/KpSylZjRkv16KxRGQax2RroHYSIKVcN?=
 =?us-ascii?Q?LXS8fpFp7Bxs+8dQzjLI6FX87wPae0VgSUb1u+UQq7WJ7mHQrF2NihAAitnS?=
 =?us-ascii?Q?S9Ok4/mJj50ZPjZ/dhXxkH5MftIJostm3sLXQZ4mI29Fc1Jxp+/pcWKcpVfI?=
 =?us-ascii?Q?5nwDPTiVMhK74IG55857DNGrofiX8ru9wSyYPZTVWafjYLVeGMOQFDiAvKoz?=
 =?us-ascii?Q?lZTs1Mbgm/6j/39g/HJroqHS+t0shQzsMVA2npgSbfJoJWiN8ElPi/F4ABEj?=
 =?us-ascii?Q?B7Il1khleu/kHW63OKuAWcjFlwEebdCYQ5kf1L5GN9G7IEboEcOUYa9VjSu/?=
 =?us-ascii?Q?IL2oSNAsVQ0dk04tm+BDGlx4xqLO1Aibus08qhVjr9pNNDKW2ErawxtSJ4h+?=
 =?us-ascii?Q?3ef8sizH/aWT1YEgxoZ3EaGKKTRjnL4f0nREAAXcOtXYCyoLuifC/cBrzVi7?=
 =?us-ascii?Q?sadW8ID0oJzVs5kzfcquH82jcd5i6QQXtLwlqWFtjyu2fL6CZQy7H8mQx6kn?=
 =?us-ascii?Q?Q57e9AtvM4LsWos+2xxG+9dTXGP595l8JEDv8sbQwapmIEWfLsVUo6iY3MBp?=
 =?us-ascii?Q?YN2Mq2bifNdELZ5HamwlHIu/CoSHga1DbJ+0d59avRyN3v0hriGDmwQWtd2b?=
 =?us-ascii?Q?KQuiA3iyEkWX3WsnPGPmwU+Bg7Z5oQtD8iRcldFIUz5UWvSKxh1/cgclMCIn?=
 =?us-ascii?Q?iltTf4vvoAzcokZ1BXluCzKPuzo6HOkujx8Oj2oftWY066IYmuiCpP3FuUFN?=
 =?us-ascii?Q?SG/baw70OJuzdVYflTP6WqIIs//5e35tOkZGTslbQcgfWQRfaKxJ8VDZeZyE?=
 =?us-ascii?Q?/qP0SczNxkrRIp03jo+p7xOmWW/hosLqu/PU3J3Ux5blmz6rxWIuu1LKrLY6?=
 =?us-ascii?Q?uI/zpjFjK3rW4juWgrayFqs2wOfxTpk5NH1t75WzpmK8IAqvvIxzyQspxpuY?=
 =?us-ascii?Q?8F+GDdUi9ONTdQEjJtNIIQ5Y72rWxMv0ArpETk2vcE7LmnkFrFpziV74pg1w?=
 =?us-ascii?Q?VR6QunHm3aDoPti50SKw+z5nus9+bBZxJB0+hN/foWGSKB0UkVH8Irc9qDOR?=
 =?us-ascii?Q?uhKMDbZBiE2vbRL8x106avii8wGg4RzSqKkALyKSnTLKfSXQGo8kpg/pD/gl?=
 =?us-ascii?Q?Nc/Ey/mSwxFbX9sLjQu306BZt1OlPGVq/AwZAAdBwsGPwy7GqqVxqGom1gGw?=
 =?us-ascii?Q?2ByRTL25DPeNFPkQqUnIFHKE2f01dmshwHPQvhqHLLR0JvvbyWVPypmDAm/g?=
 =?us-ascii?Q?1dyLnAfivCj+Dg8x1eZBiZMHrNkO3ayEYpGGD4nwRz1AiOiHhGRcnu5W3vDW?=
 =?us-ascii?Q?l3/pjSm5Vs9Oua3Fw5fyStX2fgoP1H0vIPknPnW7jJbfewbTNgtMokPDyJg2?=
 =?us-ascii?Q?Slafjyx6ZRLyZ2L0MEydyuI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: solidigm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2533.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ef22613-2aa3-4909-fbcf-08dab8fa9996
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2022 15:39:28.3865 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4bb44aac-867a-4be0-aa34-30794e8470dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sGw7M4xpxMUVHgQM+Pv/31Nvhdw/zF3tuPHT6pfh2PIEHl72muatAzg/wtiUJUnn8D8Uf8W3njFFkaWCaAF+hHcRQ1xRHnNzQh5dTMac6lj0uPd1fjcUAAgKYhNMmqddgjb+z4BT2U8oipvKUCbgQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB5967
Received-SPF: pass client-ip=40.107.92.112;
 envelope-from=Michael.Kropaczek@solidigm.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 28 Oct 2022 12:28:40 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



-----Original Message-----
From: Keith Busch <kbusch@kernel.org>=20
Sent: Thursday, October 27, 2022 1:21 PM
To: Jonathan Derrick <jonathan.derrick@linux.dev>
Cc: qemu-devel@nongnu.org; Michael Kropaczek (CW) <Michael.Kropaczek@solidi=
gm.com>; qemu-block@nongnu.org; Klaus Jensen <its@irrelevant.dk>; Kevin Wol=
f <kwolf@redhat.com>; Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v3 1/2] hw/nvme: Support for Namespaces Management from=
 guest OS - create-ns

[You don't often get email from kbusch@kernel.org. Learn why this is import=
ant at https://aka.ms/LearnAboutSenderIdentification ]

Caution: External Email


On Thu, Oct 27, 2022 at 01:00:45PM -0500, Jonathan Derrick wrote:
> +Parameters:
> +
> +``auto-ns-path=3D<path to nvme storage location>``
> +  If specified indicates a support for dynamic management of nvme=20
> +namespaces
> +  by means of nvme create-ns command. This path points
> +  to the storage area for backend images must exist. Additionally it=20
> +requires
> +  that parameter `ns-subsys` must be specified whereas parameter=20
> +`drive`
> +  must not. The legacy namespace backend is disabled, instead, a pair=20
> +of
> +  files 'nvme_<ctrl SN>_ns_<NS-ID>.cfg' and 'nvme_<ctrl SN>_ns_<NS-ID>.i=
mg'
> +  will refer to respective namespaces. The create-ns, attach-ns
> +  and detach-ns commands, issued at the guest side, will make changes=20
> +to
> +  those files accordingly.
> +  For each namespace exists an image file in raw format and a config=20
> +file
> +  containing namespace parameters and state of the attachment=20
> +allowing QEMU
> +  to configure namespaces accordingly during start up. If for=20
> +instance an
> +  image file has a size of 0 bytes this will be interpreted as non=20
> +existent
> +  namespace. Issuing create-ns command will change the status in the=20
> +config
> +  files and and will re-size the image file accordingly so the image=20
> +file
> +  will be associated with the respective namespace. The main config=20
> +file
> +  nvme_<ctrl SN>_ctrl.cfg keeps the track of allocated capacity to=20
> +the
> +  namespaces within the nvme controller.
> +  As it is the case of a typical hard drive, backend images together=20
> +with
> +  config files need to be created. For this reason the qemu-img tool=20
> +has
> +  been extended by adding createns command.
> +
> +   qemu-img createns {-S <serial> -C <total NVMe capacity>}
> +                     [-N <NsId max>] {<path>}
> +
> +  Parameters:
> +  -S and -C and <path> are mandatory, `-S` must match `serial`=20
> + parameter  and <path> must match `auto-ns-path` parameter of "-device n=
vme,..."
> +  specification.
> +  -N is optional, if specified it will set a limit to the number of=20
> + potential  namespaces and will reduce the number of backend images=20
> + and config files  accordingly. As a default, a set of images of 0=20
> + bytes size and default  config files for 256 namespaces will be created=
, a total of 513 files.
> +
> +Please note that ``nvme-ns`` device is not required to support of=20
> +dynamic namespaces management feature. It is not prohibited to assign=20
> +a such device to ``nvme`` device specified to support dynamic=20
> +namespace management if one has an use case to do so, however, it=20
> +will only coexist and be out of the scope of Namespaces Management.=20
> +NsIds will be consistently managed, creation (create-ns) of a=20
> +namespace will not allocate the NsId already being taken. If=20
> +``nvme-ns`` device conflicts with previously created one by create-ns (t=
he same NsId), it will break QEMU's start up.

By requiring the controller's serial number up-front, does this mean we can=
't share dynamic namespaces with other controllers in the subsystem?
[MK]: At this point namespaces of one controller can be attached to the sub=
system.=20
[MK]: More controllers would require additional parameter specifying the nu=
mber of controllers and expanding the naming pattern of backend files.
> +static inline char *create_fmt_name(const char *fmt, char=20
> +*ns_directory, char *serial, uint32_t nsid, Error **errp) {
> +    char *file_name =3D NULL;
> +    Error *local_err =3D NULL;
> +
> +    storage_path_check(ns_directory, serial, errp);
> +    if (local_err) {

How is 'local_err' ever *not* NULL here? Are you meaning to check "*errp" i=
nstead?
[MK]: This will be corrected, indeed a dead code.
> +        error_propagate(errp, local_err);
> +    } else {
> +        file_name =3D g_strdup_printf(fmt, ns_directory, serial, nsid);
> +    }
> +
> +    return file_name;
> +}
> +
> +static inline char *create_cfg_name(char *ns_directory, char *serial,=20
> +uint32_t nsid, Error **errp) {
> +    return create_fmt_name(NS_FILE_FMT NS_CFG_EXT, ns_directory,=20
> +serial, nsid, errp); }
> +
> +
> +static inline char *create_image_name(char *ns_directory, char=20
> +*serial, uint32_t nsid, Error **errp) {
> +    return create_fmt_name(NS_FILE_FMT NS_IMG_EXT, ns_directory,=20
> +serial, nsid, errp); }
> +
> +static inline int nsid_cfg_save(char *ns_directory, char *serial,=20
> +QDict *ns_cfg, uint32_t nsid) {
> +    GString *json =3D NULL;
> +    char *filename;
> +    FILE *fp;
> +    int ret =3D 0;
> +    Error *local_err =3D NULL;
> +
> +    json =3D qobject_to_json_pretty(QOBJECT(ns_cfg), false);
> +
> +    if (strlen(json->str) + 2 /* '\n'+'\0' */ > NS_CFG_MAXSIZE) {
> +        error_setg(&local_err, "ns-cfg allowed max size %d exceeded",=20
> + NS_CFG_MAXSIZE);

I find this whole "local_err" control flow unpleasant to follow. The local_=
error gets set in this above condition only to be overwritten in the very n=
ext step without ever being used? Surely that can't be right.

I'm just picking on this one example here, but the pattern appears to repea=
t. I think this would be easier to read if the error conditions took 'goto'=
 paths to unwind so that the good path doesn't require such deep 'if/else' =
nesting.
[MK]: this will be corrected.
> +    }
> +
> +    filename =3D create_cfg_name(ns_directory, serial, nsid, &local_err)=
;
> +    if (!local_err) {
> +        fp =3D fopen(filename, "w");
> +        if (fp =3D=3D NULL) {
> +            error_setg(&local_err, "open %s: %s", filename,
> +                         strerror(errno));
> +        } else {
> +            chmod(filename, 0644);
> +            if (!fprintf(fp, "%s\n", json->str)) {
> +                error_setg(&local_err, "could not write ns-cfg %s: %s", =
filename,
> +                             strerror(errno));
> +            }
> +            fclose(fp);
> +        }
> +    }
> +
> +    if (local_err) {
> +        error_report_err(local_err);
> +        ret =3D -1;
> +    }
> +
> +    g_string_free(json, true);
> +    g_free(filename);
> +    qobject_unref(ns_cfg);
> +
> +    return ret;
> +}


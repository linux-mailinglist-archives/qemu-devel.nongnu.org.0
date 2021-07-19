Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E00F53CEB3B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 21:06:32 +0200 (CEST)
Received: from localhost ([::1]:55138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Yb1-0007Ss-Vv
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 15:06:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1m5YaB-0006hN-CW
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 15:05:39 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:33296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1m5Ya7-0002D4-O5
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 15:05:38 -0400
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16JJ2Nlo027044; Mon, 19 Jul 2021 12:05:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=94TrzxgKBxhUYJJPmmhxuCBj53CVwDdTV3yNm4UZrc8=;
 b=BG6qRxIyLDxDr4heMqVsaXTsm6QmJ/deAN0jrQOEEkRryZXmzbnJnHKm2XUZSqzfDiiU
 3mJHFKjLbWOJ6Wg6u8e3DjkFlOBiJDOBdOQujLAXbxpHXGdvhqwa+jXNrR651WppkImP
 C1XwK9+S+uMgMTO4/bKCxrAvZj/eXNO3UEFI/tOGzzakIZBxxQrmR4VjhjciOjLKIfbn
 Oprql8Be8bNp9DGkeUuXRE7I/WMJNmX6Slwl/Q5U9K+JTgAc1ZzDViGwEDvcilpmVS4I
 S9tPxanfgly/odADq11DfLBe2PterLUPylwcdRd9ivVKeVJh9/9cXMt0ixh6/aCayzhR ow== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
 by mx0a-002c1b01.pphosted.com with ESMTP id 39w4j49bg0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 12:05:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SdGTogu+LM2RQCs/8hlf1OWWFw6itJSKBnro8brkvlg+tHoHG1XNirBiI1CUG4xXTQgO7/RiSf8iTmMPvIuEptN2WNqEtwK5B6x2ZplvrKTuP9xbI6smOKl7K0nhx/Lflrit5VcJOclGIRopOxnXiQ2VQcoDeV4kd3E5Ze0PaMaIfRNf7fvBF6WOoLE3AaVxqAYB12nED8mmvHRYDFJXNnK6B4cnlqAJotcopldwo1dEu4/jOCOZIPWO77J8NrG3L6n5IHVIXwgIbXMUiBSG3aMN8y6Bt4gkIJGO6WRaZGC/vV/SMwq/bi1SYEU8ip0pQJ536AIySkkEp9PbP0OaBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=94TrzxgKBxhUYJJPmmhxuCBj53CVwDdTV3yNm4UZrc8=;
 b=cqyLcWPibS0L5Cw+3i87LrthPlJ0PiZrFaWAIc2tyK92O38aml2mnekzWNGNm+L04c8DO4YzP4K0iCSdxOpo8ZhF6mmk9p/Klxp95Vtl63MkEaZZDrZ0JkBEAxal5P+OSduW7KV0OVkLUd/y7Fv1inWJ0WXnt8jKXLJTyxSblzMtwQjXJSkM+e9uFUkIX0eUoOvxfuK+pt7B3XGddSA6qq2PyDaWsxE7BdmRF4BIpQJL3Htd+Ztbk94I4J72fnMvhYhyOYiUJ/ynQoxgIKyjX44sJazLY0s6rjEPWC6ANXD69Jh4s1xq0f7HBt3bT6NF9JjmUbD3Lmpc5FkYeh4G7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from CH0PR02MB7898.namprd02.prod.outlook.com (2603:10b6:610:113::5)
 by CH2PR02MB6981.namprd02.prod.outlook.com (2603:10b6:610:86::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Mon, 19 Jul
 2021 19:05:30 +0000
Received: from CH0PR02MB7898.namprd02.prod.outlook.com
 ([fe80::3167:f3a5:5f8c:284b]) by CH0PR02MB7898.namprd02.prod.outlook.com
 ([fe80::3167:f3a5:5f8c:284b%9]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 19:05:30 +0000
From: Thanos Makatos <thanos.makatos@nutanix.com>
To: Thanos Makatos <thanos.makatos@nutanix.com>, Peter Xu <peterx@redhat.com>
Subject: RE: Question on memory commit during MR finalize()
Thread-Topic: Question on memory commit during MR finalize()
Thread-Index: AQHWF1blDKoce5BcwE+aLVbWV0XOZKiCivmAgAAd6oCAAKsXAIAAEMEAgsN1h+CAAEdvgIABHU1QgAAtSoCABLlmgIAAGMwAgAAi0xSAABDV8A==
Date: Mon, 19 Jul 2021 19:05:29 +0000
Message-ID: <CH0PR02MB7898BBD73D0F3F7D5003BB178BE19@CH0PR02MB7898.namprd02.prod.outlook.com>
References: <20200420210049.GA420399@xz-x1>
 <fe73a74b-2324-68a5-a37f-530a6bb03ebc@redhat.com>
 <20200420233115.GB420399@xz-x1>
 <5ed295a3-9e4a-0dca-adc6-5361dc78a83c@redhat.com>
 <20200421104334.GC420399@xz-x1>
 <CH0PR02MB78989C2F77880AA5355037748B129@CH0PR02MB7898.namprd02.prod.outlook.com>
 <YPB/8f0pv7mDR310@t490s>
 <CH0PR02MB7898ACD1C68149CE11314EB08B119@CH0PR02MB7898.namprd02.prod.outlook.com>
 <YPGVQ0ONUc/qPSNz@t490s>
 <CH0PR02MB7898BB81DCB85237D38E07638BE19@CH0PR02MB7898.namprd02.prod.outlook.com>,
 <YPWglNqZFegBRZjM@t490s>
 <CH0PR02MB789857DE73B0A9B1FC29593E8BE19@CH0PR02MB7898.namprd02.prod.outlook.com>
In-Reply-To: <CH0PR02MB789857DE73B0A9B1FC29593E8BE19@CH0PR02MB7898.namprd02.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nutanix.com; dkim=none (message not signed)
 header.d=none;nutanix.com; dmarc=none action=none header.from=nutanix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cff35402-db29-4587-da45-08d94ae82d2d
x-ms-traffictypediagnostic: CH2PR02MB6981:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR02MB6981091BB7A42D1C3C9C6F368BE19@CH2PR02MB6981.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:431;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h8p+pObjg8N1m3+KdiMYR47oq9OrKrzYAVDFAIvIZ3AZ66SG07e61M8e8MT2V8P7kn3Pd2iVXCUUDHgiemxkCpKQM4ILUVGOB/sFT2zHAsHQMA8ew2xF0CG4QblUqHOSqe1bqf/1B1CCAtl/e1WFPZyAwbkEhjXbEc/IENUd9SVoIWvG6+YEYb2I7N2rB2O+CxrdhgfQbzq21FG2pHoNa5/Bxm8/XV6iUq+oEuX2FCdfn4MT5QVNLNWh+LmoBa3zbKhpjdFNeWM2uaxIDHbFT0/mkQUdfplykZHfp8dH8bWNZCJBJHVe/4SwSZWfA+vEY0GzgXYCfdSP6nGVaBJC5hDlaoLA50kiC8yLpUH1cD2B9as1Kt/1Da/UfatKMM3CHnSPCST+djpR+2/TXCX5OB7VYZjO6dL3mGEEF146Q1MR5qZ+idv3ZIrPA6Pu9DnGjHMlkAl3qqLN1msUnZ8UaIBjm62x6xDP8reaWqwS3g3RhQFNcvVoq54roegaPjlW8cmHuJ1evCJr4rY76I37YYdvZAFs9ZZUh4o6jihwscqR+nx1ZTEzj16yLBHMR6VC92nTroNAz7RytBSeWgynHvaUWZQi2gqbk958DeNHUovlPN/IfCJ2EpbrGjQz2EPeqRaZcluVbrnj1THljqEStYG8AzNV25diQVDi7T35ZcaDiiN/tZzWkST/aHBI4e8X8VlhiYpd1qCsGHqbfcv2Tz974mJ7Bv4FPI8TsVYsuVl/XhRrEblhm0/v97+ZRZL0R+Iomzyqq8l6lRkWZocOPnNeloudaeNAxZ7KD4BJ2sY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR02MB7898.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(136003)(346002)(396003)(39860400002)(186003)(33656002)(66446008)(26005)(76116006)(64756008)(66556008)(66946007)(54906003)(9686003)(4326008)(110136005)(55016002)(316002)(7696005)(2906002)(66476007)(966005)(71200400001)(86362001)(52536014)(2940100002)(478600001)(6506007)(53546011)(122000001)(83380400001)(30864003)(38100700002)(5660300002)(8676002)(44832011)(8936002)(38070700004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?f+r/aJo3hYdn1iYzxoz4FHIa0dUx7z+YRVatCo/0/qJOt0Cb/5FKkV4RTZ?=
 =?iso-8859-1?Q?V4dNdb7maf4+BBw6LSO4/8k0/pr0R9hFe3XBC4PEteU6/UkBSvl2cFSTVM?=
 =?iso-8859-1?Q?z3YLA7qBdD+L0VQbkGWrOG+0vueVe0m9dLzGzPt+y/z1gYSkwT3m15Ryvs?=
 =?iso-8859-1?Q?TYixDktIL00ckO+urUYUmegW4KbfgVFfn9mFuZec+AdauTQidC9Z3Ge1co?=
 =?iso-8859-1?Q?oVqCUvbBr/xMIWdBkgUML/wDc/3LhVrMnKYWnFjjxchxfqhpkNL2sPkWuF?=
 =?iso-8859-1?Q?UCl1HqwmKlaVYEqogqp9x0Gx/eQJ2uDp14Bo1orrr0SRfamI3a21HUcQ51?=
 =?iso-8859-1?Q?7fh6zESqJuwPrQKW4In7oS6yl+9F2C6ueArB7fkYzjVbedYUquHhsPcHbf?=
 =?iso-8859-1?Q?60uHTt1iPdqWP3mzZxwDCbR7h1pE6cElMM8VEwD94P8r7Tt7vsKsLOS20R?=
 =?iso-8859-1?Q?ovaW1yadTjnV1y1fabNDsnPWtOBctC4ncvM9neMXacB42wEUzQCA6LXxRk?=
 =?iso-8859-1?Q?VbX/x4aTGCA7lRv3JLBt9gWP00KwqpeCgIga67NpqEgWEoiWhn4SxlegnM?=
 =?iso-8859-1?Q?rC1Yd0WjB5BdsyXGlpiG1Sphbei+w/eg5FiQ5LqtTJiAS6gMt4QAAOY1IO?=
 =?iso-8859-1?Q?KADeSfUwpbXFTeOhGf4RrUA3J+OAL3fF1GhxVIm8fE/3WK4j3yOmzshk43?=
 =?iso-8859-1?Q?oajzkM+wA6W6+fXHvFayoILSRIJCrMHJ/pheRON+v3uscGCwBlh5snl4Fl?=
 =?iso-8859-1?Q?3wZNyQ30I29DtteTWrnsIiSUAW+DMmTO+VFpeLC+xm0PGMolw8lVrumr2C?=
 =?iso-8859-1?Q?a0/TSI2ERhumkW+SgbXaxsYg4tX3W2gEesg6vbUUe+NlVxkH68Z+ALI9sf?=
 =?iso-8859-1?Q?IIAzF9scE9y1oaou45MA+nnwjpw2NZR1R3JL9m3H+k9bt0alBm5Al40Zgb?=
 =?iso-8859-1?Q?jE2xkdvDgb4elmAa04kjEzjMSXYEICij5oyjy3fNkcb/eBy4Vjvu0RgkJD?=
 =?iso-8859-1?Q?KD9ps1dszuwV2wFeRGO47ssISMSGdyaCCGqjjCaL0qgkYlE5wcw9c+qDJe?=
 =?iso-8859-1?Q?eIUqF+/uulYEiKhLSig83zjBOC2uDq2kf0pA7+MEPMKGVf7kVhd7yCbxwd?=
 =?iso-8859-1?Q?A015e8K6gQyCq9jzy7PlIseZu1uEbmT4PrCWTidXajRQIfYi1V7SZaQDF8?=
 =?iso-8859-1?Q?FwyjIMjU8aLLVMn4RxV88xf2iLEOLT+1diw0AogZzXe32qYN56onoD64H3?=
 =?iso-8859-1?Q?48+/Iva9xVDJM39ry7DmS3XRJdh1nwMj/+vVbHaT5rpubEZc7QqbhKzVQr?=
 =?iso-8859-1?Q?x4kFXzp/xQElTIc0dCuwfi43Z/FM7FfW1dyaqH3zpwI0vuQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR02MB7898.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cff35402-db29-4587-da45-08d94ae82d2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2021 19:05:29.9488 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5OF/+1bpw4XDNaxCmGrGvOcIl80hyK6+cDzx6My9x+JF54ARVVFzj3BS+Sm9ST0yAneQJ7AGIKGpwcqkeTb3KHkiG+WfLBIkx/l/6XQ+/HA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6981
X-Proofpoint-ORIG-GUID: L0orfd0DTQRQbYYRz3WndWIOIU6rfI81
X-Proofpoint-GUID: L0orfd0DTQRQbYYRz3WndWIOIU6rfI81
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-19_09:2021-07-19,
 2021-07-19 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=thanos.makatos@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Devel Mailing List <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Markus Armbruster <armbru@redhat.com>, John Levon <john.levon@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> -----Original Message-----
> From: Qemu-devel <qemu-devel-
> bounces+thanos.makatos=3Dnutanix.com@nongnu.org> On Behalf Of Thanos
> Makatos
> Sent: 19 July 2021 19:02
> To: Peter Xu <peterx@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>; John Levon
> <john.levon@nutanix.com>; John G Johnson <john.g.johnson@oracle.com>;
> Markus Armbruster <armbru@redhat.com>; QEMU Devel Mailing List
> <qemu-devel@nongnu.org>
> Subject: Re: Question on memory commit during MR finalize()
>=20
> Omg I don't know how I missed that, of course I'll ignore SIGUSR1 and ret=
est!
>=20
> ________________________________________
> From: Peter Xu <mailto:peterx@redhat.com>
> Sent: Monday, 19 July 2021, 16:58
> To: Thanos Makatos
> Cc: Paolo Bonzini; Markus Armbruster; QEMU Devel Mailing List; John Levon=
;
> John G Johnson
> Subject: Re: Question on memory commit during MR finalize()
>=20
>=20
> Hi, Thanos,
>=20
> On Mon, Jul 19, 2021 at 02:38:52PM +0000, Thanos Makatos wrote:
> > I can trivially trigger an assertion with a build where I merged the re=
cent
> vfio-user patches (https://urldefense.proofpoint.com/v2/url?u=3Dhttps-
> 3A__patchew.org_QEMU_cover.1626675354.git.elena.ufimtseva-
> 40oracle.com_&d=3DDwIBaQ&c=3Ds883GpUCOChKOHiocYtGcg&r=3DXTpYsh5Ps2zJv
> tw6ogtti46atk736SI4vgsJiUKIyDE&m=3DLvALaULnrxZWlgXFcaxGAl95UIwq3a6LI8
> OnG_5r4XY&s=3DmoFPVchYp27xozQcvvxG4nb4nC2QmMnqQ1Wmt4Z3dNE&e
> =3D ) to master and then merging the result into your xzpeter/memory-sani=
ty
> branch, I've pushed the branch here:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-
> 3A__github.com_tmakatos_qemu_tree_memory-
> 2Dsanity&d=3DDwIBaQ&c=3Ds883GpUCOChKOHiocYtGcg&r=3DXTpYsh5Ps2zJvtw6og
> tti46atk736SI4vgsJiUKIyDE&m=3DLvALaULnrxZWlgXFcaxGAl95UIwq3a6LI8OnG_
> 5r4XY&s=3DveyjdkkFkGSYNDZOuksB-kbHmdQaw9RYxyZp8Qo7nW4&e=3D . I
> explain the repro steps below in case you want to take a look:
> >
> > Build as follows:
> >
> > ./configure --prefix=3D/opt/qemu-xzpeter --target-list=3Dx86_64-softmmu=
 --
> enable-kvm=A0 --enable-debug --enable-multiprocess && make -j `nproc` &&
> make install
> >
> > Then build and run the GPIO sample from libvfio-user
> (https://urldefense.proofpoint.com/v2/url?u=3Dhttps-
> 3A__github.com_nutanix_libvfio-
> 2Duser&d=3DDwIBaQ&c=3Ds883GpUCOChKOHiocYtGcg&r=3DXTpYsh5Ps2zJvtw6ogt
> ti46atk736SI4vgsJiUKIyDE&m=3DLvALaULnrxZWlgXFcaxGAl95UIwq3a6LI8OnG_5
> r4XY&s=3DHYP5NmDMGuS13pdyV83x3HzyhGbE-oP1T8NLtu0d1U8&e=3D ):
> >
> > libvfio-user/build/dbg/samples/gpio-pci-idio-16 -v /var/run/vfio-user.s=
ock
> >
> > And then run QEMU as follows:
> >
> > gdb --args /opt/qemu-xzpeter/bin/qemu-system-x86_64 -cpu host -
> enable-kvm -smp 4 -m 2G -object memory-backend-
> file,id=3Dmem0,size=3D2G,mem-path=3D/dev/hugepages,share=3Don,prealloc=3D=
yes -
> numa node,memdev=3Dmem0 -kernel bionic-server-cloudimg-amd64-vmlinuz-
> generic -initrd bionic-server-cloudimg-amd64-initrd-generic -append
> 'console=3DttyS0 root=3D/dev/sda1 single' -hda bionic-server-cloudimg-amd=
64-
> 0.raw -nic user,model=3Dvirtio-net-pci -machine pc-q35-3.1 -device vfio-u=
ser-
> pci,socket=3D/var/run/vfio-user.sock -nographic
> >
> > I immediately get the following stack trace:
> >
> > Thread 5 "qemu-system-x86" received signal SIGUSR1, User defined signal
> 1.
>=20
> This is SIGUSR1.=A0 QEMU uses it for general vcpu ipis.
>=20
> > [Switching to Thread 0x7fffe6e82700 (LWP 151973)]
> > __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:=
103
> > 103=A0=A0=A0=A0 ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S: No su=
ch file or
> directory.
> > (gdb) bt
> > #0=A0 0x00007ffff655d29c in __lll_lock_wait () at
> ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:103
> > #1=A0 0x00007ffff6558642 in __pthread_mutex_cond_lock
> (mutex=3Dmutex@entry=3D0x5555568bb280 <qemu_global_mutex>) at
> ../nptl/pthread_mutex_lock.c:80
> > #2=A0 0x00007ffff6559ef8 in __pthread_cond_wait_common (abstime=3D0x0,
> mutex=3D0x5555568bb280 <qemu_global_mutex>, cond=3D0x555556cecc30) at
> pthread_cond_wait.c:645
> > #3=A0 0x00007ffff6559ef8 in __pthread_cond_wait (cond=3D0x555556cecc30,
> mutex=3D0x5555568bb280 <qemu_global_mutex>) at
> pthread_cond_wait.c:655
> > #4=A0 0x000055555604f717 in qemu_cond_wait_impl (cond=3D0x555556cecc30,
> mutex=3D0x5555568bb280 <qemu_global_mutex>, file=3D0x5555561ca869
> "../softmmu/cpus.c", line=3D514) at ../util/qemu-thread-posix.c:194
> > #5=A0 0x0000555555d28a4a in qemu_cond_wait_iothread
> (cond=3D0x555556cecc30) at ../softmmu/cpus.c:514
> > #6=A0 0x0000555555d28781 in qemu_wait_io_event (cpu=3D0x555556ce02c0) a=
t
> ../softmmu/cpus.c:425
> > #7=A0 0x0000555555e5da75 in kvm_vcpu_thread_fn (arg=3D0x555556ce02c0) a=
t
> ../accel/kvm/kvm-accel-ops.c:54
> > #8=A0 0x000055555604feed in qemu_thread_start (args=3D0x555556cecc70) a=
t
> ../util/qemu-thread-posix.c:541
> > #9=A0 0x00007ffff6553fa3 in start_thread (arg=3D<optimized out>) at
> pthread_create.c:486
> > #10 0x00007ffff64824cf in clone () at
> ../sysdeps/unix/sysv/linux/x86_64/clone.S:95
>=20
> Would you please add below to your ~/.gdbinit script?
>=20
> =A0 handle SIGUSR1 nostop noprint
>=20
> Or just run without gdb and wait it to crash with SIGABRT.
>=20
> Thanks,
>=20
> --
> Peter Xu

Sorry for the bad brain day, here's your stack trace:

qemu-system-x86_64: ../softmmu/cpus.c:72: qemu_mutex_unlock_iothread_prepar=
e: Assertion `!memory_region_has_pending_transaction()' failed.

Thread 1 "qemu-system-x86" received signal SIGABRT, Aborted.
__GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/unix/sysv/linux/raise.c:50
50      ../sysdeps/unix/sysv/linux/raise.c: No such file or directory.
(gdb) bt
#0  0x00007ffff63c07bb in __GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/un=
ix/sysv/linux/raise.c:50
#1  0x00007ffff63ab535 in __GI_abort () at abort.c:79
#2  0x00007ffff63ab40f in __assert_fail_base
    (fmt=3D0x7ffff650dee0 "%s%s%s:%u: %s%sAssertion `%s' failed.\n%n", asse=
rtion=3D0x5555561ca880 "!memory_region_has_pending_transaction()", file=3D0=
x5555561ca869 "../softmmu/cpus.c", line=3D72, function=3D<optimized out>) a=
t assert.c:92
#3  0x00007ffff63b9102 in __GI___assert_fail
    (assertion=3D0x5555561ca880 "!memory_region_has_pending_transaction()",=
 file=3D0x5555561ca869 "../softmmu/cpus.c", line=3D72, function=3D0x5555561=
caa60 <__PRETTY_FUNCTION__.37393> "qemu_mutex_unlock_iothread_prepare") at =
assert.c:101
#4  0x0000555555d27c20 in qemu_mutex_unlock_iothread_prepare () at ../softm=
mu/cpus.c:72
#5  0x0000555555d289f6 in qemu_mutex_unlock_iothread () at ../softmmu/cpus.=
c:507
#6  0x0000555555dcb3d6 in vfio_user_send_recv (proxy=3D0x555557ac5560, msg=
=3D0x555557933d50, fds=3D0x0, rsize=3D40) at ../hw/vfio/user.c:88
#7  0x0000555555dcd30a in vfio_user_dma_unmap (proxy=3D0x555557ac5560, unma=
p=3D0x7fffffffd8d0, bitmap=3D0x0) at ../hw/vfio/user.c:796
#8  0x0000555555dabf5f in vfio_dma_unmap (container=3D0x555557a06fb0, iova=
=3D786432, size=3D2146697216, iotlb=3D0x0) at ../hw/vfio/common.c:501
#9  0x0000555555dae12c in vfio_listener_region_del (listener=3D0x555557a06f=
c0, section=3D0x7fffffffd9f0) at ../hw/vfio/common.c:1249
#10 0x0000555555d3d06d in address_space_update_topology_pass (as=3D0x555556=
8bbc80 <address_space_memory>, old_view=3D0x555556d6cfb0, new_view=3D0x5555=
56d6c8b0, adding=3Dfalse) at ../softmmu/memory.c:960
#11 0x0000555555d3d62c in address_space_set_flatview (as=3D0x5555568bbc80 <=
address_space_memory>) at ../softmmu/memory.c:1062
#12 0x0000555555d3d800 in memory_region_transaction_commit () at ../softmmu=
/memory.c:1124
#13 0x0000555555b75a3e in mch_update_pam (mch=3D0x555556e80a40) at ../hw/pc=
i-host/q35.c:344
#14 0x0000555555b76068 in mch_update (mch=3D0x555556e80a40) at ../hw/pci-ho=
st/q35.c:504
#15 0x0000555555b761d7 in mch_reset (qdev=3D0x555556e80a40) at ../hw/pci-ho=
st/q35.c:561
#16 0x0000555555e93a95 in device_transitional_reset (obj=3D0x555556e80a40) =
at ../hw/core/qdev.c:1028
#17 0x0000555555e956f8 in resettable_phase_hold (obj=3D0x555556e80a40, opaq=
ue=3D0x0, type=3DRESET_TYPE_COLD) at ../hw/core/resettable.c:182
#18 0x0000555555e8e07c in bus_reset_child_foreach (obj=3D0x555556ebce80, cb=
=3D0x555555e955ca <resettable_phase_hold>, opaque=3D0x0, type=3DRESET_TYPE_=
COLD) at ../hw/core/bus.c:97
#19 0x0000555555e953ff in resettable_child_foreach (rc=3D0x555556a07ab0, ob=
j=3D0x555556ebce80, cb=3D0x555555e955ca <resettable_phase_hold>, opaque=3D0=
x0, type=3DRESET_TYPE_COLD) at ../hw/core/resettable.c:96
#20 0x0000555555e9567e in resettable_phase_hold (obj=3D0x555556ebce80, opaq=
ue=3D0x0, type=3DRESET_TYPE_COLD) at ../hw/core/resettable.c:173
#21 0x0000555555e920e0 in device_reset_child_foreach (obj=3D0x555556e802d0,=
 cb=3D0x555555e955ca <resettable_phase_hold>, opaque=3D0x0, type=3DRESET_TY=
PE_COLD) at ../hw/core/qdev.c:366
#22 0x0000555555e953ff in resettable_child_foreach (rc=3D0x555556ad2830, ob=
j=3D0x555556e802d0, cb=3D0x555555e955ca <resettable_phase_hold>, opaque=3D0=
x0, type=3DRESET_TYPE_COLD) at ../hw/core/resettable.c:96
#23 0x0000555555e9567e in resettable_phase_hold (obj=3D0x555556e802d0, opaq=
ue=3D0x0, type=3DRESET_TYPE_COLD) at ../hw/core/resettable.c:173
#24 0x0000555555e8e07c in bus_reset_child_foreach (obj=3D0x555556beaac0, cb=
=3D0x555555e955ca <resettable_phase_hold>, opaque=3D0x0, type=3DRESET_TYPE_=
COLD) at ../hw/core/bus.c:97
#25 0x0000555555e953ff in resettable_child_foreach (rc=3D0x555556b1ca70, ob=
j=3D0x555556beaac0, cb=3D0x555555e955ca <resettable_phase_hold>, opaque=3D0=
x0, type=3DRESET_TYPE_COLD) at ../hw/core/resettable.c:96
#26 0x0000555555e9567e in resettable_phase_hold (obj=3D0x555556beaac0, opaq=
ue=3D0x0, type=3DRESET_TYPE_COLD) at ../hw/core/resettable.c:173
#27 0x0000555555e952b4 in resettable_assert_reset (obj=3D0x555556beaac0, ty=
pe=3DRESET_TYPE_COLD) at ../hw/core/resettable.c:60
#28 0x0000555555e951f8 in resettable_reset (obj=3D0x555556beaac0, type=3DRE=
SET_TYPE_COLD) at ../hw/core/resettable.c:45
#29 0x0000555555e95a37 in resettable_cold_reset_fn (opaque=3D0x555556beaac0=
) at ../hw/core/resettable.c:269
#30 0x0000555555e93f40 in qemu_devices_reset () at ../hw/core/reset.c:69
#31 0x0000555555c9eb04 in pc_machine_reset (machine=3D0x555556a4d9e0) at ..=
/hw/i386/pc.c:1654
#32 0x0000555555d381fb in qemu_system_reset (reason=3DSHUTDOWN_CAUSE_NONE) =
at ../softmmu/runstate.c:443
#33 0x0000555555a787f2 in qdev_machine_creation_done () at ../hw/core/machi=
ne.c:1330
#34 0x0000555555d4e09c in qemu_machine_creation_done () at ../softmmu/vl.c:=
2650
#35 0x0000555555d4e16b in qmp_x_exit_preconfig (errp=3D0x5555568db1a0 <erro=
r_fatal>) at ../softmmu/vl.c:2673
#36 0x0000555555d506be in qemu_init (argc=3D31, argv=3D0x7fffffffe268, envp=
=3D0x7fffffffe368) at ../softmmu/vl.c:3692
#37 0x0000555555945cad in main (argc=3D31, argv=3D0x7fffffffe268, envp=3D0x=
7fffffffe368) at ../softmmu/main.c:49

This is where the vfio-user client in QEMU tells the vfio-user server (the =
GPIO device) that this particular memory region is not available for DMA. T=
here are 3 vfio_dma_map() operations before this happens and this seems to =
be the very first vfio_dma_unmap() operation.


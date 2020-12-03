Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDBC2CDEA5
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 20:19:08 +0100 (CET)
Received: from localhost ([::1]:46204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kku8B-0005s0-VW
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 14:19:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1kku5h-0005Bw-KI
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 14:16:33 -0500
Received: from mail-mw2nam10on2054.outbound.protection.outlook.com
 ([40.107.94.54]:42465 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1kku5d-0007kF-7C
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 14:16:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D5tKBBCgPRt6HltK98wcKguiK5SXlzzXZvCMhH1f5GMa0bGt7Trp7vb9ZlJ92T0vGtjrKdSMoRurqDNdyfcj8J8An1kGO3LENtImrw37lNfK6qTaGVzC+KGex7KwQ+izBAXNoG3psPQac6b58H1wCWuWtHam3VT9By2JITyeI7g0LH8Hhut+F+gzyniyQqXd/OoSbA1w+dzW7Sj7buFnkr+Ol8Yy+uzeorWpFDcHCSsTX0yru7y3Oam+iLEyX5kyRi1hxmUxr16Yj7+Rb8YEgfTzuGhv1dn6vuVK0ellHuXzfx1WjpxdVnpv0XnIrvM04vp8Y34prT+hqfLy5kJv9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=InlbVKG+pPmm6Xu7BaUc1njeaBPz+7w7tg3RJx1CXc0=;
 b=V2jGNvymR39SY9ZxYrC4SgXYQm7lnAOYHaxI0C9SoQSUxem2vfXLca8GCe/gqJMwBaXC36RjUUdwxxY8ydgnk7TeIYVlsK4NBJ1NS0l5fOcoUW41LXCD4jlqGg+E72XAW9bsQhDUxwOIFV6KouuXA5UqhdZIQJMedn+ZjtEbCsrv3qiZ2Vm2MSxEFMA1rawx5Xy8vosCqX0Xtb7jNP1LzzkRcdyd6wbk6W+fg2+Jl9W+4mjLQEJl+7yMECwt9Yc0W1um9/aNTuGwbyDDyMjKsv/19u4OHzcBDk5PlAeP5I1DXwvOgoEe2KgSgIqwQAxAaoyVi7VKB2y3lBTEpolc9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=InlbVKG+pPmm6Xu7BaUc1njeaBPz+7w7tg3RJx1CXc0=;
 b=qR4aTohmyB3vvH8NQLaaixwonTxkntqFOvFE8inFNTOC6O3r4lHO/FO9x+P8iXtZ47eIkO7UJUYUFpRY1HTHRHMGfFtwyfL9YksJH9izuQcog+GmE+l/+FddcPYhgnUNjH9WzwNthXuVZkkAokrD2CMxEomWgKK4ZNFJ0dDsqmg=
Received: from CH2PR02MB6774.namprd02.prod.outlook.com (2603:10b6:610:a8::18)
 by CH2PR02MB6822.namprd02.prod.outlook.com (2603:10b6:610:a5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Thu, 3 Dec
 2020 19:16:23 +0000
Received: from CH2PR02MB6774.namprd02.prod.outlook.com
 ([fe80::e9ae:72df:1e0d:6007]) by CH2PR02MB6774.namprd02.prod.outlook.com
 ([fe80::e9ae:72df:1e0d:6007%9]) with mapi id 15.20.3632.018; Thu, 3 Dec 2020
 19:16:22 +0000
From: Sai Pavan Boddu <saipava@xilinx.com>
To: Edgar Iglesias <edgari@xilinx.com>, Peter Maydell
 <peter.maydell@linaro.org>
Subject: RE: [PATCH v14 4/4] arm: xlnx-versal: Connect usb to virt-versal
Thread-Topic: [PATCH v14 4/4] arm: xlnx-versal: Connect usb to virt-versal
Thread-Index: AQHWx7zBCcYqMZmOKU+qx807nnvwYqniHF2AgAOR34CAABN0YA==
Date: Thu, 3 Dec 2020 19:16:22 +0000
Message-ID: <CH2PR02MB6774160CB9E210766817532BCAF20@CH2PR02MB6774.namprd02.prod.outlook.com>
References: <1606811915-8492-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1606811915-8492-5-git-send-email-sai.pavan.boddu@xilinx.com>
 <CAFEAcA-esWWXWx-kfz=UvVsydU5siFvx-=u42DTW4n42YLu_jA@mail.gmail.com>
 <20201203180517.GA10051@toto>
In-Reply-To: <20201203180517.GA10051@toto>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: xilinx.com; dkim=none (message not signed)
 header.d=none;xilinx.com; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.50.130]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 18702b4d-c6ba-4282-de44-08d897bfec2d
x-ms-traffictypediagnostic: CH2PR02MB6822:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR02MB682258BFD87A3872C6B472F3CAF20@CH2PR02MB6822.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Urh/5te7+R1FTJGN9sEjwVJI1UKrwwEiMNjrTpanHb/SDvJp443UvRSCwQ6b8Yk/cy8uDXRD+ygf6+3/1BvdoZYARdiXaWOTmS+x1F8AeJYyAfwQy1kdF+zD8+lC7fQVpYmqV8XBo6R4eLP42ftakLVE3nP4exZfHrPWAF0fhylHQVC8FHSy+Hf9fUpvk2u1QIiJt4sMyRESgLvu0MoPkbO6nD+ej21qqV3wokQRKoza5in9nSaFsvfo+vDhNafhR+QmGBQr0rGT+pSFGmP+eJGo2PwpFhNVpiSelaNjMQw7Sru7cOMAgdPJd8HQC7bDVsEa/PlnONgPOAuMct/Bnw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR02MB6774.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(346002)(366004)(39860400002)(478600001)(66446008)(64756008)(186003)(66556008)(66946007)(66476007)(316002)(54906003)(4326008)(110136005)(26005)(2906002)(71200400001)(7696005)(33656002)(7416002)(53546011)(86362001)(6506007)(8676002)(52536014)(5660300002)(76116006)(8936002)(55016002)(9686003)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?8fpJIZj+SVxQIgOq2ORBURwvJU0TlXxNs9Nc0KO6akuw0psePiRy3pu30q?=
 =?iso-8859-1?Q?3c6YSshR9kEa3Umx3jezxlOroT0uny6Pn0aEaSKTQKX5E03dBxmP86Bir1?=
 =?iso-8859-1?Q?9ekysWUCU15swrJzHF//zh5R2AXVvc380jVh6YwBRKKf8datDwERABhcij?=
 =?iso-8859-1?Q?trxVsQR/Py7b+ksBQwh9a3LZ+luDQklm30UnhfALftblAROQCaH2M2Bpr9?=
 =?iso-8859-1?Q?h4oBHugm+M8L/tgUDmKS7lztptuyqsiPexahKjU70vYy61ozAdgHNvUXF3?=
 =?iso-8859-1?Q?Ol+1IrFWK7X20tu5fp1pZFLvq4Sov2o38zmgZxuGy8h255WOZJlS1KWcE+?=
 =?iso-8859-1?Q?ZJV1n+mmS3JsPONYBJoYyn9b16TIVgYkrgUNXaOinUnviyeAgj0DtK9QIq?=
 =?iso-8859-1?Q?fVxPeHfKd7HJnOqPD7un08pcnqeionRP8WmdJXxHaXlD1FfhDjMZUqwDLA?=
 =?iso-8859-1?Q?1x+0zEE9PUNojc/QueA4K+vjCYkPGtmtaRU7S5xvzgQ9/QxAwGJ+fOOmxy?=
 =?iso-8859-1?Q?DKQ8cdlz+W8hXIagVHjgFFmumd1jyKHIKxRqa59S/zVpdr+9IR21iStDYB?=
 =?iso-8859-1?Q?Lvnz4B/UOnnotudVqNlZ3txQjL8mLckgf/lUoATT7Rn0f1jH8I5QzjcfA5?=
 =?iso-8859-1?Q?DYTvrhqrSp07923RBX3oyuprIVgjyDNQbR+6cSD97T03BsS6dWSNYZsrZi?=
 =?iso-8859-1?Q?x5pk/wGyp7GVLUElYztmRzhfmriuj+deXM7VWILX2mlE6qdRjaDW5CyP09?=
 =?iso-8859-1?Q?wilWQ/iQcuwZr2E6QP7LrdtlXt31C349ubR3B1+FOPI5EGrGUravGdJJ3K?=
 =?iso-8859-1?Q?0Lo7X6rJh21oXM3ulEU9Bo+X05LH6V0fycjI+lW659oy7qtw36nJa1kCsd?=
 =?iso-8859-1?Q?utt96GSGGC9mQWzXX6HiDMHLoUS/PIHZr6yEgmeCk0JROdUfwVQNfCFoZl?=
 =?iso-8859-1?Q?T1YCEHFDryauoU8Zqux8yn7QdfE6c/gcS7eFyD8t5qgkJ19+Kd7OClf70q?=
 =?iso-8859-1?Q?TsisWi8bu09OHxbUo=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR02MB6774.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18702b4d-c6ba-4282-de44-08d897bfec2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2020 19:16:22.8956 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G0seaV6LUtxzZ7lZNtQPZj0CSWnSiavPbKa0R6EO8nddxtUIs6oFQa/WeLLW/FhSmWbKW3NjyQXurS0VNuqQAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6822
Received-SPF: pass client-ip=40.107.94.54; envelope-from=saipava@xilinx.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Francisco Eduardo Iglesias <figlesia@xilinx.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Vikram Garhwal <fnuv@xilinx.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Paul Zimmerman <pauldzim@gmail.com>, Edgar Iglesias <edgari@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ying Fang <fangying1@huawei.com>,
 =?iso-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter/Edgar,

> -----Original Message-----
> From: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> Sent: Thursday, December 3, 2020 11:35 PM
> To: Peter Maydell <peter.maydell@linaro.org>
> Cc: Sai Pavan Boddu <saipava@xilinx.com>; Markus Armbruster
> <armbru@redhat.com>; Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>;
> Paolo Bonzini <pbonzini@redhat.com>; Gerd Hoffmann <kraxel@redhat.com>;
> Edgar Iglesias <edgari@xilinx.com>; Francisco Eduardo Iglesias
> <figlesia@xilinx.com>; Alistair Francis <alistair.francis@wdc.com>; Eduar=
do
> Habkost <ehabkost@redhat.com>; Ying Fang <fangying1@huawei.com>;
> Philippe Mathieu-Daud=E9 <philmd@redhat.com>; Vikram Garhwal
> <fnuv@xilinx.com>; Paul Zimmerman <pauldzim@gmail.com>; Sai Pavan Boddu
> <saipava@xilinx.com>; QEMU Developers <qemu-devel@nongnu.org>
> Subject: Re: [PATCH v14 4/4] arm: xlnx-versal: Connect usb to virt-versal
>=20
> On Tue, Dec 01, 2020 at 11:34:25AM +0000, Peter Maydell wrote:
> > On Tue, 1 Dec 2020 at 08:34, Sai Pavan Boddu <sai.pavan.boddu@xilinx.co=
m>
> wrote:
> > >
> > > From: Vikram Garhwal <fnu.vikram@xilinx.com>
> > >
> > > Connect VersalUbs2 subsystem to xlnx-versal SOC, its placed
> >
> > Typo : "VersalUSB2".
> >
> >
> > > in iou of lpd domain and configure it as dual port host controller.
> > > Add the respective guest dts nodes for "xlnx-versal-virt" machine.
> > >
> > > Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> > > Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> >
> > Code looks OK but I'll let somebody else from Xilinx review the detail.
> >
> > > +static void fdt_add_usb_xhci_nodes(VersalVirt *s) {
> > > +    const char clocknames[] =3D "bus_clk\0ref_clk";
> > > +    char *name =3D g_strdup_printf("/usb@%" PRIx32,
> MM_USB2_CTRL_REGS);
> > > +    const char compat[] =3D "xlnx,versal-dwc3";
> > > +
> > > +    qemu_fdt_add_subnode(s->fdt, name);
> > > +    qemu_fdt_setprop(s->fdt, name, "compatible",
> > > +                         compat, sizeof(compat));
> > > +    qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
> > > +                                 2, MM_USB2_CTRL_REGS,
> > > +                                 2, MM_USB2_CTRL_REGS_SIZE);
> > > +    qemu_fdt_setprop(s->fdt, name, "clock-names",
> > > +                         clocknames, sizeof(clocknames));
> > > +    qemu_fdt_setprop_cells(s->fdt, name, "clocks",
> > > +                               s->phandle.clk_25Mhz, s->phandle.clk_=
125Mhz);
> > > +    qemu_fdt_setprop(s->fdt, name, "ranges", NULL, 0);
> > > +    qemu_fdt_setprop_cell(s->fdt, name, "#address-cells", 2);
> > > +    qemu_fdt_setprop_cell(s->fdt, name, "#size-cells", 2);
> > > +    qemu_fdt_setprop_cell(s->fdt, name, "phandle", s->phandle.usb);
> > > +    g_free(name);
> > > +
> > > +    {
> > > +        const char irq_name[] =3D "dwc_usb3";
> > > +        const char compat[] =3D "snps,dwc3";
> >
> > Minor coding style side note, but I'm not hugely fond of code blocks
> > in the middle of functions just for declaring variables. You could
> > either put these variable declarations at the top of the function, or
> > if you think the code in the block is self contained and worth putting
> > in its own function you could do that.
[Sai Pavan Boddu] Yeah. I could fix this in V15, Thanks.

> >
>=20
> Hi Sai, I beleive I had already reviewed a previous version of this patch=
 so after
> you fix the stuff the Peter pointed out feel free to add my
> Rb:
>=20
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
[Sai Pavan Boddu] Thanks Edgar.

Regards,
Sai Pavan
>=20
> Cheers,
> Edgar


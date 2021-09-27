Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F89C4196BF
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 16:52:31 +0200 (CEST)
Received: from localhost ([::1]:55374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUrza-0003Fa-NF
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 10:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shitalkumar.gandhi@seagate.com>)
 id 1mUrsm-0004tb-1A; Mon, 27 Sep 2021 10:45:32 -0400
Received: from esa.hc4959-67.iphmx.com ([216.71.153.94]:25205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shitalkumar.gandhi@seagate.com>)
 id 1mUrsi-0006o5-1E; Mon, 27 Sep 2021 10:45:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=seagate.com; i=@seagate.com; q=dns/txt; s=stxiport;
 t=1632753923; x=1664289923;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=W5CFJAVjTLQuOX0Vp/VBeyTaceScxja55X+NWsUNKE4=;
 b=BwJkKGfco4oETbllVkE1ibCAYUwLd6OKC1QYpqnzgTyp71gstwPKHNau
 d3kmCe0x2CmFaqBN2tXwh8tdRBW+l4CaubJWH+lA5qMH/wSkF9Cwk2CJs
 Ksnoz1klqUA8tUv1Nowfy/TpTy2/CW2w4fzgjn6TQOMBYMbzdElHtpf3A s=;
Received: from mail-dm3nam07lp2047.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.47])
 by ob1.hc4959-67.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 07:45:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DmGEsxLnkW5dpcioBJ2uFx5D9DK+UxGkseR5jdt5z2P3Yz4wN+R0WeNAEiBfGTJm0qNR2ovDrKnytglrhA5k1xyMdWGHq+1jzpQDhkZySBLmYjyOjB1RFwsfLF724ardJDhk7Zd4U/wrUQ6avAlBl1dIK6Ypk3CgkH3Q0enhzWhBi5i5FhyRA/MtHfspKK0RSIJL20OW4Jc584cgeNn7lAhKx2JxRtajrIiNkkYJx5edvyybxcZafckqp2B+sAX6w5q619aOvIa1BRqPfQMFcwLhu05h3FKGX7TTqMwY4tsIBjNjVL74/6RemcYNQrZqcfGeq6uwJLjjncmLx4zf+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=9zH5kfWrdcZGjsviqLxj3FIkNY096/xD+nwFJkO6W8s=;
 b=haoENYEy9/MDh2HYSJLBeZnkOofp5uluQzxLNdZliveL/UNKnen+QmWkG4L2LnynLb+JugyDb/RRu6LVkPE0wmHRTFsd6W7n9C+V3U/JG3+zo4J2IT000QViFlwn3BWSBjrXuN+efyIN3d7qeAtSD1J8rVxUSMhokHqjc0ZvhDerel30/183C0kCMLtgSHdKEEitC3tM0eWnUPhIAoRhV+IMVOFzHIOOiTnMxGQPHNe6/GMdw0R/ZtEmC9zuoLzsNPQsnHVN4guH821nEe7Lu9oYShAAC1Eg//BxoZ/XOmfhk+cWZj5HFUUcG4Nyg9B+h6MePCEvLsJapgM8SHnUUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seagate.com; dmarc=pass action=none header.from=seagate.com;
 dkim=pass header.d=seagate.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seagate.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9zH5kfWrdcZGjsviqLxj3FIkNY096/xD+nwFJkO6W8s=;
 b=L2UDrGvtBxjehNicylWEM8xTIvi2nNhu+YTYRDpzbrMgzqYVSuaYxDSWETAtvrubeJYOH+ckqS0kfrA1F3X3bOvOvlLphcNBL07VnJEFXDEXsjKNslbVc3gB1dJnTCueWKtfIlxtw71SymkFS0IUXriMkR9LLqejpGvhSDx4LHk=
Received: from SJ0PR20MB3643.namprd20.prod.outlook.com (2603:10b6:a03:2e1::14)
 by BY5PR20MB3188.namprd20.prod.outlook.com (2603:10b6:a03:1b2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Mon, 27 Sep
 2021 14:45:14 +0000
Received: from SJ0PR20MB3643.namprd20.prod.outlook.com
 ([fe80::94f7:7038:a27c:5e55]) by SJ0PR20MB3643.namprd20.prod.outlook.com
 ([fe80::94f7:7038:a27c:5e55%9]) with mapi id 15.20.4544.022; Mon, 27 Sep 2021
 14:45:14 +0000
From: Shitalkumar Gandhi <shitalkumar.gandhi@seagate.com>
To: =?iso-8859-1?Q?C=E9dric_Le_Goater?= <clg@kaod.org>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, qemu-arm
 <qemu-arm@nongnu.org>
CC: Hao Wu <wuhaotsh@google.com>, Patrick Venture <venture@google.com>, Andrew
 Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
Subject: Re: Need to merge - QEMU patch for booting eMMC image for AST2600
 machine
Thread-Topic: Need to merge - QEMU patch for booting eMMC image for AST2600
 machine
Thread-Index: AQHXsi8RpibRV/Qva0WR6yL4MOIGOau19JMAgAH7YgCAAAggcw==
Date: Mon, 27 Sep 2021 14:45:14 +0000
Message-ID: <SJ0PR20MB36433AFB78BA0BAF6DC537649DA79@SJ0PR20MB3643.namprd20.prod.outlook.com>
References: <SJ0PR20MB3643750F8FF71E838A750F9B9DA59@SJ0PR20MB3643.namprd20.prod.outlook.com>
 <38e08d56-00b2-8759-a729-4bb6a26e6cdd@amsat.org>
 <4b2c7f4f-f2b5-7990-bcdc-5f9fb19418b4@kaod.org>
In-Reply-To: <4b2c7f4f-f2b5-7990-bcdc-5f9fb19418b4@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_56e366eb-86f1-4645-85a7-f29555b26fee_Enabled=True;
 MSIP_Label_56e366eb-86f1-4645-85a7-f29555b26fee_SiteId=d466216a-c643-434a-9c2e-057448c17cbe;
 MSIP_Label_56e366eb-86f1-4645-85a7-f29555b26fee_SetDate=2021-09-27T14:45:13.726Z;
 MSIP_Label_56e366eb-86f1-4645-85a7-f29555b26fee_Name=Seagate
 Internal; MSIP_Label_56e366eb-86f1-4645-85a7-f29555b26fee_ContentBits=0;
 MSIP_Label_56e366eb-86f1-4645-85a7-f29555b26fee_Method=Standard; 
suggested_attachment_session_id: 43647024-bdc0-649d-1644-1b71afbe1fc2
authentication-results: kaod.org; dkim=none (message not signed)
 header.d=none;kaod.org; dmarc=none action=none header.from=seagate.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d6646e8-220b-4693-9468-08d981c56a66
x-ms-traffictypediagnostic: BY5PR20MB3188:
x-microsoft-antispam-prvs: <BY5PR20MB318809CB3EE5266F9D83EBEF9DA79@BY5PR20MB3188.namprd20.prod.outlook.com>
stx-hosted-ironport-oubound: True
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PvedUz8UM1Std0T0UHcufbPf2FG9cp+NjWZ/ovfCqLq6L43IWMl9Ai+TBzLmaIMwr2hOUbk1DPq9y5LaEv4sUWmrkInBYXEHl/CyO86UcrNPr1NVpQc18iSHQS7bSMfYO4TFM7rCmVaqZQwEUmIaks5Tfp+G8yImWkoOH4zx2DHJ1XgK2iFqiFAn0U4rB6mY2JMOsZQfgJLamCaAzwo/vQiEWHO5Mn8Y9YV0xO9OfaKaU4Z05xy9r4Kr4eZ0sNpls88lC9XrBhvAZfC+BjbhxC2haZqIajgcvxSJ7/Rx9ZzS3pexVX/g6mjNf/UuwKeknUWSAdBHtRGOmi0n4TweaEEymq8DN6wHYEdXSsiMGGYmlnIgYSHzC3h/Pp5MnVlOcQcR5icVUbe+9Wwa5erQrx1DEsmsXVxRoZrl+zacAm0zPdjlc0FsX9bEL2zBTORdQhQLeXdHbCiZb/q8qmMla4uJEzoz6lgFhqm/ddVAGKghbuV0FilnowN5LXa6fG8iMFWcx+BcF18kGZa8sUgL7nBKlENwmT+UK/2Jb8rlueI9Fq60yLi/wFNCy8oqb5o8os1BcJvqsfFUMDP9d+NYmrOqSkvuMYHAp7WDIk5cUmhVwXsTBRtPEIDRxc2MirJmjoSXePXQbTq4s0I9sqLh3uC5hkEWZKkuc+CuFx/xtgQM0jRL5MJs/USF0FOqYF2jrlDugEd5REy8HhLayZ6HnhM7VucmwYqqKXzlC/DTgaDqkBsALmHdn2ZZzorsRzMTjc9zsVHGMCJgrBwG9aVR1mKbA4Qxj9+jEKwojFTwSIE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR20MB3643.namprd20.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(26005)(44832011)(54906003)(508600001)(53546011)(4326008)(166002)(966005)(71200400001)(7696005)(66556008)(64756008)(86362001)(66946007)(66446008)(9686003)(52536014)(66476007)(91956017)(33656002)(2906002)(76116006)(38100700002)(122000001)(8936002)(5660300002)(316002)(19627405001)(83380400001)(110136005)(8676002)(55016002)(38070700005)(6506007)(66574015)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?8c6CUyjhKayegxr2n1Seqqfi7RTtTd/2xp9/ZhDIzwH8cFR30xhBI+6br0?=
 =?iso-8859-1?Q?U+i6llqEvnPtmM48YYvSyXouoAG4iFe6HPXxcDrtQQeZlEb3vxmvKAxMDo?=
 =?iso-8859-1?Q?U1/N7VclG28S/2l/PaC21l28UV+kcxZw/oQ8WFYYHk7rvC2CIRBK1X6tc3?=
 =?iso-8859-1?Q?g9cRhPFInNRFck1fn0NXmO2rD/VLer1OSJuzQDSjMQx1R1h4eMelb1BQCv?=
 =?iso-8859-1?Q?n1FlPYt+YjSJQEZlcP1K8L+ZBSgvT230uPhpE3sp0JN/Pr2g65Izy4uo8h?=
 =?iso-8859-1?Q?1XYbdhUg36pCFXzPdWwmAhNfrVYOtyhl/4Q05Yl16Bpp9znpSzyMYFgG5n?=
 =?iso-8859-1?Q?gJ+FweDFuoUUq3ITqfODG5ImJWsJt8c2GrBNZ+PHjuPODiU6HjcgxTRqce?=
 =?iso-8859-1?Q?Osij1yBQ2X2595T73nk8zGqXhpw+uUcHAnkZbmYqQnMkeS2pQw+FFWpmkj?=
 =?iso-8859-1?Q?VgLN1/iODEcQ5Fs4kKDbfzE+XRv2719dvRsNV+mcAVbys/HQ/DQAvTopyC?=
 =?iso-8859-1?Q?+cz+W1f2pVEssctdefPzUTx/gVEVkuDvJv5fqlyvIi201bNZgQJl0zSLIv?=
 =?iso-8859-1?Q?Ndi6iaKF9L9WKuDY93QnX/dGDu3OO7HNKbb7Zff4BaU9EmDyctV63OdZVR?=
 =?iso-8859-1?Q?EmHmYhozkMEm2SzE5Q2f4NPdA4JRIjrJLmJ+TBO5DPl4uiquh+ZvhKxQwN?=
 =?iso-8859-1?Q?PWE5flXByVLmRvEycn4d5sT1B72ampqAyBRw9Xc+7+nExDbXHdiakEfPNI?=
 =?iso-8859-1?Q?W//L7BeQMHegfZXoQYetuiao4i7qmNl0QjofeCG7ku23qmwzZEumzIw4qc?=
 =?iso-8859-1?Q?U0QpgbB8le1kxb/jgoV++KuIrg4oY/c4Gpd8jMRoNBdTUAcmUAWMrI5NOw?=
 =?iso-8859-1?Q?APG6F7C5Bm6MneIZs/EoG/6vfZK75QYTi6+7Ls0qi8nRXjL3R46nU9fBoH?=
 =?iso-8859-1?Q?6LX3RW3aExGZKu9moVNjF/SRLOwbynXArxZVaY71lYY2UnPFB7d3F9cg/g?=
 =?iso-8859-1?Q?KBLL/yIyudzG/xqBYRIobhjuVwInblQ7U8OMCjxs8iEEns3LhZXYRRlQpo?=
 =?iso-8859-1?Q?Te6KG4XoohXBIeLYYZWgmh+1kUnE99wR7ifRuVifBOMImikO5QPQs4LnLV?=
 =?iso-8859-1?Q?In1haP41IXA7kKO9d+6YvqH8iaF0zY0klWHopHZp4ouT5qWK8Qr/VQI0ko?=
 =?iso-8859-1?Q?GQgglgXt9U3v8pfaXLHZQCvRrks6Wue/fLsE+YWUA+b/VmcdT19UbXVdp6?=
 =?iso-8859-1?Q?MPiFbeulMbPs3uhVWgh8T/2kU1GuklQdMYV7UaFFXqtmlpCuMT1eFrNP4p?=
 =?iso-8859-1?Q?x+r97Ed+heq6t1Nq+hwb1IW+tYKoHDlFC+zIJavs+5nK9wTC4exX5Pg1S5?=
 =?iso-8859-1?Q?2jgvAkQziJ?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_SJ0PR20MB36433AFB78BA0BAF6DC537649DA79SJ0PR20MB3643namp_"
MIME-Version: 1.0
X-OriginatorOrg: seagate.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR20MB3643.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d6646e8-220b-4693-9468-08d981c56a66
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2021 14:45:14.1611 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d466216a-c643-434a-9c2e-057448c17cbe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cgpkhAjCT/b6ukp5MzuAN/FQZmOoTrv9J1UOcnChD5ikXY/G/LC3N7dvdHeX+FPVT3Da8LqV4K5LS7UzUpSHHLZEbmxbd5oUDrk8iHX7bn0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR20MB3188
Received-SPF: pass client-ip=216.71.153.94;
 envelope-from=shitalkumar.gandhi@seagate.com; helo=esa.hc4959-67.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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

--_000_SJ0PR20MB36433AFB78BA0BAF6DC537649DA79SJ0PR20MB3643namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Yes, I have raised this.

  https://secure-web.cisco.com/13Y5NFuOyUgdDUpPwn5OgA8NY1sIBiajir-UA3dTP1yJ=
GRWy2THA4rAtsVnZgvUls637SkO3gba7qmnDzMaxpGKwioLHRH2wf1xefPAKWL8QzKFY4phI7X7=
oyU8rhzQaj5dwIgY_y_WgmTI8SDnnzBRgQ8R742s0fb89kXTBSexyXTLqSOW11D3kpi0OSLjADE=
WJ5u87lD25OUNSiSQIFBC6LGiiYQbD2oxDTFeForuIGaT5fpAiI6SYEfc2lBf2j8mjnP-w8K-t2=
if_hfV0tPeFcYebcRDXoovS10ww85LEADDvpRReejBwftxZK6b5_AgH2U6beeWJ4r-VOi9-2ZxM=
C6iHuIZ1RBM0gzCMZpRFxgJb2E44ETONZneg1HJheeiEqDqyoLVGqgQbCu8pOW2e9njyXPvG94Z=
C8uh4ZodtuPdFanbmvOb6cgic0tZ4Q/https%3A%2F%2Fgithub.com%2Fopenbmc%2Fopenbmc=
%2Fissues%2F3818

BR,
Shitalkumar
________________________________
From: C=E9dric Le Goater <clg@kaod.org>
Sent: Monday, September 27, 2021 7:15 AM
To: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>; Shitalkumar Gandhi <shitalk=
umar.gandhi@seagate.com>; qemu-devel@nongnu.org <qemu-devel@nongnu.org>; qe=
mu-arm <qemu-arm@nongnu.org>
Cc: Hao Wu <wuhaotsh@google.com>; Patrick Venture <venture@google.com>; And=
rew Jeffery <andrew@aj.id.au>; Joel Stanley <joel@jms.id.au>
Subject: Re: Need to merge - QEMU patch for booting eMMC image for AST2600 =
machine


This message has originated from an External Source. Please use proper judg=
ment and caution when opening attachments, clicking links, or responding to=
 this email.


Hello,

On 9/26/21 09:59, Philippe Mathieu-Daud=E9 wrote:
> Hi,
>
> On 9/25/21 19:07, Shitalkumar Gandhi via wrote:
>> Hi,
>>
>> I am attaching a patch that will fix eMMC image booting on QEMU for
>> AST2600 machine, without this patch it will be stuck after SPL saying,
>> "booting from RAM".
>>
>> Please review and merge, thanks.
>>
>> Let me know in case of any concern.
>
> Thanks for your patch.
>
> Please look at how to submit patches here:
> https://secure-web.cisco.com/1oJkyJ6o1FSjeLofNCk-SJBvHe8F5z4Gz5K8rDouTJuL=
6pWtzenJ1yE0imiWoNBJUx5BooSaYSkvQfHj1aTBxq2d7eD-xZyztLaT2DS20DjjENjFLA8jfhI=
XRN_hJPLa8vikrdvz9p60Jy7kojB3AJRD9ZzEL6NwZS2AZfc2ElH7-meAzFGLq-3qKResEOEwqE=
kMU5ocivYTBkJpgcJLPiR34MZr3ZUdMsFnYCLYImWZ9TxlbUyo742xmCDQdg-CM-GFhJm3h6Vu6=
t1b8LHALySrJqK4dUdKPfzYgkDmhH11RMEXwPNMW19QNF62MbxEDFcekCoClvnOYuRsoEjgnwJH=
-rJn9B-D54vVPbAhqsCkjjd8wBCwBCjbWuq2kovWRZC9hl7URdTe2-F3JVb2EItEsQBr52Wxc5D=
1D_tnuboaCIzn1osTeVB2_nJbwIIKc/https%3A%2F%2Fwiki.qemu.org%2FContribute%2FS=
ubmitAPatch%23Submitting_your_Patches
>
>> This patch has been added to boot eMMC image for AST2600 machine on
>> QEMU.
>>
>> Run quemu as follows:
>>
>> ./qemu-system-arm -m 1G -M ast2600-evb -nographic -drive
>> file=3Dmmc-evb-ast2600.img,format=3Draw,if=3Dsd,index=3D2
>
> What is index=3D2?
>
> Is this mmc-evb-ast2600.img image publicly available?
>
>> Tested: Booted AST2600 eMMC image on QEMU.
>> Suggested-by:  <venture@google.com>
>> Reviewed-by: Hao Wu <wuhaotsh@google.com>
>> Reviewed-by: C=E9dric Le Goater <clg@kaod.org>
>> Message-Id: <20210416162426.3217033-1-venture@google.com>
>> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

I don't remember having reviewed or signed this patch.

>> ---
>>   hw/arm/aspeed.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>> index ba5f1dc5af..6a890adb83 100644
>> --- a/hw/arm/aspeed.c
>> +++ b/hw/arm/aspeed.c
>> @@ -148,7 +148,7 @@ struct AspeedMachineState {
>>           SCU_AST2400_HW_STRAP_BOOT_MODE(AST2400_SPI_BOOT))
>>
>>   /* AST2600 evb hardware value */
>> -#define AST2600_EVB_HW_STRAP1 0x000000C0
>> +#define AST2600_EVB_HW_STRAP1 (0x000000C0 |
> AST26500_HW_STRAP_BOOT_SRC_EMMC)
>
> IIUC you are not implementing any eMMC code, simply faking the
> controller can support eMMC, but the card is used in SD mode?

I think this is related to this issue :

   https://secure-web.cisco.com/13Y5NFuOyUgdDUpPwn5OgA8NY1sIBiajir-UA3dTP1y=
JGRWy2THA4rAtsVnZgvUls637SkO3gba7qmnDzMaxpGKwioLHRH2wf1xefPAKWL8QzKFY4phI7X=
7oyU8rhzQaj5dwIgY_y_WgmTI8SDnnzBRgQ8R742s0fb89kXTBSexyXTLqSOW11D3kpi0OSLjAD=
EWJ5u87lD25OUNSiSQIFBC6LGiiYQbD2oxDTFeForuIGaT5fpAiI6SYEfc2lBf2j8mjnP-w8K-t=
2if_hfV0tPeFcYebcRDXoovS10ww85LEADDvpRReejBwftxZK6b5_AgH2U6beeWJ4r-VOi9-2Zx=
MC6iHuIZ1RBM0gzCMZpRFxgJb2E44ETONZneg1HJheeiEqDqyoLVGqgQbCu8pOW2e9njyXPvG94=
ZC8uh4ZodtuPdFanbmvOb6cgic0tZ4Q/https%3A%2F%2Fgithub.com%2Fopenbmc%2Fopenbm=
c%2Fissues%2F3818

> I'm surprised your guest is happy and boot that. If so, then
> what is the point of announcing eMMC is supported if not used?
It should work on the aspeed branches I maintain which include the
emmc support but this is not for upstream.


Some comments,

I don't think the AST2600 evb boots by default on emmc. I agree
it's nice to have for tests and there are other ways to modify
slightly the default behavior.

We could add a machine property to define the 'hw-strap1' register
but it's a bit difficult to remember the value.

A custom '-boot' value setting the 'hw-strap1' for the AST2600
machine seems a better alternative. We could merge such a change
even if emmc is not ready.

Thanks,

C.






Seagate Internal

--_000_SJ0PR20MB36433AFB78BA0BAF6DC537649DA79SJ0PR20MB3643namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Yes, I have raised this.<br>
<br>
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important">&nbsp;<span>&nbsp;</sp=
an></span><a href=3D"https://secure-web.cisco.com/13Y5NFuOyUgdDUpPwn5OgA8NY=
1sIBiajir-UA3dTP1yJGRWy2THA4rAtsVnZgvUls637SkO3gba7qmnDzMaxpGKwioLHRH2wf1xe=
fPAKWL8QzKFY4phI7X7oyU8rhzQaj5dwIgY_y_WgmTI8SDnnzBRgQ8R742s0fb89kXTBSexyXTL=
qSOW11D3kpi0OSLjADEWJ5u87lD25OUNSiSQIFBC6LGiiYQbD2oxDTFeForuIGaT5fpAiI6SYEf=
c2lBf2j8mjnP-w8K-t2if_hfV0tPeFcYebcRDXoovS10ww85LEADDvpRReejBwftxZK6b5_AgH2=
U6beeWJ4r-VOi9-2ZxMC6iHuIZ1RBM0gzCMZpRFxgJb2E44ETONZneg1HJheeiEqDqyoLVGqgQb=
Cu8pOW2e9njyXPvG94ZC8uh4ZodtuPdFanbmvOb6cgic0tZ4Q/https%3A%2F%2Fgithub.com%=
2Fopenbmc%2Fopenbmc%2Fissues%2F3818" target=3D"_blank" rel=3D"noopener nore=
ferrer" data-auth=3D"NotApplicable" data-linkindex=3D"1" style=3D"margin:0p=
x;font-size:14.6667px;font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web =
(West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemF=
ont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;background-color:rgb(25=
5, 255, 255)">https://secure-web.cisco.com/13Y5NFuOyUgdDUpPwn5OgA8NY1sIBiaj=
ir-UA3dTP1yJGRWy2THA4rAtsVnZgvUls637SkO3gba7qmnDzMaxpGKwioLHRH2wf1xefPAKWL8=
QzKFY4phI7X7oyU8rhzQaj5dwIgY_y_WgmTI8SDnnzBRgQ8R742s0fb89kXTBSexyXTLqSOW11D=
3kpi0OSLjADEWJ5u87lD25OUNSiSQIFBC6LGiiYQbD2oxDTFeForuIGaT5fpAiI6SYEfc2lBf2j=
8mjnP-w8K-t2if_hfV0tPeFcYebcRDXoovS10ww85LEADDvpRReejBwftxZK6b5_AgH2U6beeWJ=
4r-VOi9-2ZxMC6iHuIZ1RBM0gzCMZpRFxgJb2E44ETONZneg1HJheeiEqDqyoLVGqgQbCu8pOW2=
e9njyXPvG94ZC8uh4ZodtuPdFanbmvOb6cgic0tZ4Q/https%3A%2F%2Fgithub.com%2Fopenb=
mc%2Fopenbmc%2Fissues%2F3818</a><br>
<br>
BR,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Shitalkumar</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> C=E9dric Le Goater &l=
t;clg@kaod.org&gt;<br>
<b>Sent:</b> Monday, September 27, 2021 7:15 AM<br>
<b>To:</b> Philippe Mathieu-Daud=E9 &lt;f4bug@amsat.org&gt;; Shitalkumar Ga=
ndhi &lt;shitalkumar.gandhi@seagate.com&gt;; qemu-devel@nongnu.org &lt;qemu=
-devel@nongnu.org&gt;; qemu-arm &lt;qemu-arm@nongnu.org&gt;<br>
<b>Cc:</b> Hao Wu &lt;wuhaotsh@google.com&gt;; Patrick Venture &lt;venture@=
google.com&gt;; Andrew Jeffery &lt;andrew@aj.id.au&gt;; Joel Stanley &lt;jo=
el@jms.id.au&gt;<br>
<b>Subject:</b> Re: Need to merge - QEMU patch for booting eMMC image for A=
ST2600 machine</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText"><br>
This message has originated from an External Source. Please use proper judg=
ment and caution when opening attachments, clicking links, or responding to=
 this email.<br>
<br>
<br>
Hello,<br>
<br>
On 9/26/21 09:59, Philippe Mathieu-Daud=E9 wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; On 9/25/21 19:07, Shitalkumar Gandhi via wrote:<br>
&gt;&gt; Hi,<br>
&gt;&gt;<br>
&gt;&gt; I am attaching a patch that will fix eMMC image booting on QEMU fo=
r<br>
&gt;&gt; AST2600 machine, without this patch it will be stuck after SPL say=
ing,<br>
&gt;&gt; &quot;booting from RAM&quot;.<br>
&gt;&gt;<br>
&gt;&gt; Please review and merge, thanks.<br>
&gt;&gt;<br>
&gt;&gt; Let me know in case of any concern.<br>
&gt;<br>
&gt; Thanks for your patch.<br>
&gt;<br>
&gt; Please look at how to submit patches here:<br>
&gt; <a href=3D"https://secure-web.cisco.com/1oJkyJ6o1FSjeLofNCk-SJBvHe8F5z=
4Gz5K8rDouTJuL6pWtzenJ1yE0imiWoNBJUx5BooSaYSkvQfHj1aTBxq2d7eD-xZyztLaT2DS20=
DjjENjFLA8jfhIXRN_hJPLa8vikrdvz9p60Jy7kojB3AJRD9ZzEL6NwZS2AZfc2ElH7-meAzFGL=
q-3qKResEOEwqEkMU5ocivYTBkJpgcJLPiR34MZr3ZUdMsFnYCLYImWZ9TxlbUyo742xmCDQdg-=
CM-GFhJm3h6Vu6t1b8LHALySrJqK4dUdKPfzYgkDmhH11RMEXwPNMW19QNF62MbxEDFcekCoClv=
nOYuRsoEjgnwJH-rJn9B-D54vVPbAhqsCkjjd8wBCwBCjbWuq2kovWRZC9hl7URdTe2-F3JVb2E=
ItEsQBr52Wxc5D1D_tnuboaCIzn1osTeVB2_nJbwIIKc/https%3A%2F%2Fwiki.qemu.org%2F=
Contribute%2FSubmitAPatch%23Submitting_your_Patches">
https://secure-web.cisco.com/1oJkyJ6o1FSjeLofNCk-SJBvHe8F5z4Gz5K8rDouTJuL6p=
WtzenJ1yE0imiWoNBJUx5BooSaYSkvQfHj1aTBxq2d7eD-xZyztLaT2DS20DjjENjFLA8jfhIXR=
N_hJPLa8vikrdvz9p60Jy7kojB3AJRD9ZzEL6NwZS2AZfc2ElH7-meAzFGLq-3qKResEOEwqEkM=
U5ocivYTBkJpgcJLPiR34MZr3ZUdMsFnYCLYImWZ9TxlbUyo742xmCDQdg-CM-GFhJm3h6Vu6t1=
b8LHALySrJqK4dUdKPfzYgkDmhH11RMEXwPNMW19QNF62MbxEDFcekCoClvnOYuRsoEjgnwJH-r=
Jn9B-D54vVPbAhqsCkjjd8wBCwBCjbWuq2kovWRZC9hl7URdTe2-F3JVb2EItEsQBr52Wxc5D1D=
_tnuboaCIzn1osTeVB2_nJbwIIKc/https%3A%2F%2Fwiki.qemu.org%2FContribute%2FSub=
mitAPatch%23Submitting_your_Patches</a><br>
&gt;<br>
&gt;&gt; This patch has been added to boot eMMC image for AST2600 machine o=
n<br>
&gt;&gt; QEMU.<br>
&gt;&gt;<br>
&gt;&gt; Run quemu as follows:<br>
&gt;&gt;<br>
&gt;&gt; ./qemu-system-arm -m 1G -M ast2600-evb -nographic -drive<br>
&gt;&gt; file=3Dmmc-evb-ast2600.img,format=3Draw,if=3Dsd,index=3D2<br>
&gt;<br>
&gt; What is index=3D2?<br>
&gt;<br>
&gt; Is this mmc-evb-ast2600.img image publicly available?<br>
&gt;<br>
&gt;&gt; Tested: Booted AST2600 eMMC image on QEMU.<br>
&gt;&gt; Suggested-by:&nbsp; &lt;venture@google.com&gt;<br>
&gt;&gt; Reviewed-by: Hao Wu &lt;wuhaotsh@google.com&gt;<br>
&gt;&gt; Reviewed-by: C=E9dric Le Goater &lt;clg@kaod.org&gt;<br>
&gt;&gt; Message-Id: &lt;20210416162426.3217033-1-venture@google.com&gt;<br=
>
&gt;&gt; Signed-off-by: C=E9dric Le Goater &lt;clg@kaod.org&gt;<br>
<br>
I don't remember having reviewed or signed this patch.<br>
<br>
&gt;&gt; ---<br>
&gt;&gt;&nbsp;&nbsp; hw/arm/aspeed.c | 2 +-<br>
&gt;&gt;&nbsp;&nbsp; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c<br>
&gt;&gt; index ba5f1dc5af..6a890adb83 100644<br>
&gt;&gt; --- a/hw/arm/aspeed.c<br>
&gt;&gt; +++ b/hw/arm/aspeed.c<br>
&gt;&gt; @@ -148,7 +148,7 @@ struct AspeedMachineState {<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SCU_AS=
T2400_HW_STRAP_BOOT_MODE(AST2400_SPI_BOOT))<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp; /* AST2600 evb hardware value */<br>
&gt;&gt; -#define AST2600_EVB_HW_STRAP1 0x000000C0<br>
&gt;&gt; +#define AST2600_EVB_HW_STRAP1 (0x000000C0 |<br>
&gt; AST26500_HW_STRAP_BOOT_SRC_EMMC)<br>
&gt;<br>
&gt; IIUC you are not implementing any eMMC code, simply faking the<br>
&gt; controller can support eMMC, but the card is used in SD mode?<br>
<br>
I think this is related to this issue :<br>
<br>
&nbsp;&nbsp; <a href=3D"https://secure-web.cisco.com/13Y5NFuOyUgdDUpPwn5OgA=
8NY1sIBiajir-UA3dTP1yJGRWy2THA4rAtsVnZgvUls637SkO3gba7qmnDzMaxpGKwioLHRH2wf=
1xefPAKWL8QzKFY4phI7X7oyU8rhzQaj5dwIgY_y_WgmTI8SDnnzBRgQ8R742s0fb89kXTBSexy=
XTLqSOW11D3kpi0OSLjADEWJ5u87lD25OUNSiSQIFBC6LGiiYQbD2oxDTFeForuIGaT5fpAiI6S=
YEfc2lBf2j8mjnP-w8K-t2if_hfV0tPeFcYebcRDXoovS10ww85LEADDvpRReejBwftxZK6b5_A=
gH2U6beeWJ4r-VOi9-2ZxMC6iHuIZ1RBM0gzCMZpRFxgJb2E44ETONZneg1HJheeiEqDqyoLVGq=
gQbCu8pOW2e9njyXPvG94ZC8uh4ZodtuPdFanbmvOb6cgic0tZ4Q/https%3A%2F%2Fgithub.c=
om%2Fopenbmc%2Fopenbmc%2Fissues%2F3818">
https://secure-web.cisco.com/13Y5NFuOyUgdDUpPwn5OgA8NY1sIBiajir-UA3dTP1yJGR=
Wy2THA4rAtsVnZgvUls637SkO3gba7qmnDzMaxpGKwioLHRH2wf1xefPAKWL8QzKFY4phI7X7oy=
U8rhzQaj5dwIgY_y_WgmTI8SDnnzBRgQ8R742s0fb89kXTBSexyXTLqSOW11D3kpi0OSLjADEWJ=
5u87lD25OUNSiSQIFBC6LGiiYQbD2oxDTFeForuIGaT5fpAiI6SYEfc2lBf2j8mjnP-w8K-t2if=
_hfV0tPeFcYebcRDXoovS10ww85LEADDvpRReejBwftxZK6b5_AgH2U6beeWJ4r-VOi9-2ZxMC6=
iHuIZ1RBM0gzCMZpRFxgJb2E44ETONZneg1HJheeiEqDqyoLVGqgQbCu8pOW2e9njyXPvG94ZC8=
uh4ZodtuPdFanbmvOb6cgic0tZ4Q/https%3A%2F%2Fgithub.com%2Fopenbmc%2Fopenbmc%2=
Fissues%2F3818</a><br>
<br>
&gt; I'm surprised your guest is happy and boot that. If so, then<br>
&gt; what is the point of announcing eMMC is supported if not used?<br>
It should work on the aspeed branches I maintain which include the<br>
emmc support but this is not for upstream.<br>
<br>
<br>
Some comments,<br>
<br>
I don't think the AST2600 evb boots by default on emmc. I agree<br>
it's nice to have for tests and there are other ways to modify<br>
slightly the default behavior.<br>
<br>
We could add a machine property to define the 'hw-strap1' register<br>
but it's a bit difficult to remember the value.<br>
<br>
A custom '-boot' value setting the 'hw-strap1' for the AST2600<br>
machine seems a better alternative. We could merge such a change<br>
even if emmc is not ready.<br>
<br>
Thanks,<br>
<br>
C.<br>
<br>
<br>
<br>
<br>
</div>
</span></font></div>
<br>
<p style=3D"font-family:Calibri;font-size:10pt;color:#008000;margin:5pt;" a=
lign=3D"Center">
Seagate Internal<br>
</p>
</body>
</html>

--_000_SJ0PR20MB36433AFB78BA0BAF6DC537649DA79SJ0PR20MB3643namp_--


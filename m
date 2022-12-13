Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3409464B732
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 15:20:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5692-0000Wf-Hs; Tue, 13 Dec 2022 09:20:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mburton@qti.qualcomm.com>)
 id 1p568z-0000UQ-60
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 09:20:29 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mburton@qti.qualcomm.com>)
 id 1p568u-0002m2-5l
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 09:20:28 -0500
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BD7b5Ou015649; Tue, 13 Dec 2022 14:19:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=qcppdkim1;
 bh=PI9PGeBa5eC0ER7a6ZzhHecoSRXiouLZBFjwKoNHWas=;
 b=NN7pfIcHMRc1rCp/+jPHClFG5sBtuOgBqnVE/M/njj5TKKJe5FkjpH6JaobVLE0wXsJA
 Iw6Ldge/UgpTEI+3ndSsG6vLXD25+l51ZwylKWI2mPCX2gS+Wte2qpJ0avJjg2FsmQM8
 ihFf5mDBDmX9u+iFlfFS1VEC4No8udpn+iob1PtiVQnrmMTPjWBfS8WGnsZ3YvHnFOQ9
 Y5VJHEMKonyuIDSiINxABjBd9Zcj5Rcxt2l7A8xoAcKaRajQZtzA62QJrKpRUAPHwvib
 vJzOIUO0tA3h7ZtXcUoeDnQRINrLTOIiLSXyQfltc64C47Tho/Z9+naQmq1U5DENCg/C /w== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3medypa98y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Dec 2022 14:19:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M6bROKrsdE9ue7SEruGmpMxEOTRteaAmAehoghp+UJQ+97D61PLtOUX4DCgNCp8ekRrw4+Rm+WNItTuKGjzASCnipOnbt3/GpfvBN60ypb860PksHF6vESNQ84kNHhp/JnxWnBaxx8OZsYIM2Sl6zLWS1wTO5mFoPw66vSK5io5Awk137jdr3QGKCQwh7ZZVO1rX25FrgaTTZQofgqirl5Q4NJrvcYzJhzouXsnCKOxWKcxvcL854EADlN/kdW92BrR9XYiD+UYLN9rHLhW6sJYoYzRV7W87ZwVg/1ItP9ljNOFa9dr02X7EhFsSD2BM0oh+81m9mfdMMFzzAVSz2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PI9PGeBa5eC0ER7a6ZzhHecoSRXiouLZBFjwKoNHWas=;
 b=eTpPuutcZ6nYhTNT2fStM2A8YlY41Io1UJuOTgA/RtWo2VmlagCday9uv99E5maoy1AvI4eu49UUVkahtbmVH1BGpUI3JizQnkKerZzSrBjEzCED3/8/n9ejQ7EHsU/U64XC1M0gdHtsEmWKTOCBDcrQ0U4iSvOe8vVa6KIfEyO8qN9EyaQEsKiU/bKBkTY0fADtYSqjXGFvQ5Cv9eJ5LCVrIwN8cyoBelmFcrduUSZLBOxGXxVS8aPEY8oxYI3PejIiv6WOx1RkQj2gfFN37HBuQPZjqTiAegRVc1J66s+ybKmEJh2MrQuYC3TALvx+rF9P3WEXrhMpN7A3DaPlUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from MWHPR0201MB3609.namprd02.prod.outlook.com
 (2603:10b6:301:78::26) by PH0PR02MB8677.namprd02.prod.outlook.com
 (2603:10b6:510:102::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 14:19:21 +0000
Received: from MWHPR0201MB3609.namprd02.prod.outlook.com
 ([fe80::7723:cbdc:1779:6cf4]) by MWHPR0201MB3609.namprd02.prod.outlook.com
 ([fe80::7723:cbdc:1779:6cf4%4]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 14:19:21 +0000
From: Mark Burton <mburton@qti.qualcomm.com>
To: Stefan Hajnoczi <stefanha@gmail.com>,
 =?Windows-1252?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
CC: =?Windows-1252?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>, John Snow
 <jsnow@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Thomas Huth <thuth@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Bernhard Beschow <shentey@gmail.com>, Brian Cain
 <bcain@quicinc.com>, Warner Losh <imp@bsdimp.com>, Luc Michel
 <luc@lmichel.fr>, Paul Walmsley <paul.walmsley@sifive.com>, Alessandro Di
 Federico <ale@rev.ng>,
 =?Windows-1252?Q?C=E9dric_Le_Goater?= <clg@kaod.org>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, Jim Shu <jim.shu@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>, Alistair Francis
 <alistair.francis@wdc.com>, =?Windows-1252?Q?Alex_Benn=E9e?=
 <alex.bennee@linaro.org>, Anton Johansson <anjo@rev.ng>, Michal Privoznik
 <mprivozn@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>,
 "Denis V. Lunev" <den@virtuozzo.com>, Cleber Rosa <cleber@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?Windows-1252?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Dominik Csapak <d.csapak@proxmox.com>,
 Christophe de Dinechin <dinechin@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Kashyap Chamarthy <kchamart@redhat.com>, Mark
 Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Jagannathan Raman
 <jag.raman@oracle.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Dongli Zhang <dongli.zhang@oracle.com>,
 "afaerber@suse.de" <afaerber@suse.de>, "andrea.arcangeli@redhat.com"
 <andrea.arcangeli@redhat.com>, "bazulay@redhat.com" <bazulay@redhat.com>,
 "bbauman@redhat.com" <bbauman@redhat.com>, "cjia@nvidia.com"
 <cjia@nvidia.com>, "cw@f00f.org" <cw@f00f.org>, "digitaleric@google.com"
 <digitaleric@google.com>, "dustin.kirkland@canonical.com"
 <dustin.kirkland@canonical.com>, Eric Blake <eblake@redhat.com>, Eric Auger
 <eric.auger@redhat.com>, "felipe@nutanix.com" <felipe@nutanix.com>,
 "iggy@theiggy.com" <iggy@theiggy.com>, Jan Kiszka <jan.kiszka@web.de>,
 Jason Gunthorpe <jgg@nvidia.com>,
 "jidong.xiao@gmail.com" <jidong.xiao@gmail.com>,
 "jjherne@linux.vnet.ibm.com" <jjherne@linux.vnet.ibm.com>, Joao Martins
 <joao.m.martins@oracle.com>, "mburton@qti.qualcom.com"
 <mburton@qti.qualcom.com>, "mdean@redhat.com" <mdean@redhat.com>,
 "mimu@linux.vnet.ibm.com" <mimu@linux.vnet.ibm.com>, "z.huo@139.com"
 <z.huo@139.com>, "zwu.kernel@gmail.com" <zwu.kernel@gmail.com>, Laurent
 Vivier <lvivier@redhat.com>
Subject: Re: Single system binary & Dynamic machine model (KVM developers
 conference call 2022-12-13)
Thread-Topic: Single system binary & Dynamic machine model (KVM developers
 conference call 2022-12-13)
Thread-Index: AQHZDbo1t1zKK5U+3UGv1sqsPVlsx65r3WiAgAACdACAAAA3Pg==
Date: Tue, 13 Dec 2022 14:19:21 +0000
Message-ID: <MWHPR0201MB36094316A140120ACE6808EC8FE39@MWHPR0201MB3609.namprd02.prod.outlook.com>
References: <936e1ac4-cef8-08b4-c688-e5b1e057208b@linaro.org>
 <1ac96aab-c5c4-b539-956c-d2923e6d8602@linaro.org>
 <CAJSP0QUMRipTMiYMSftQQe+A3aaF553KpJeSgBaS9vY7X4aD0w@mail.gmail.com>
In-Reply-To: <CAJSP0QUMRipTMiYMSftQQe+A3aaF553KpJeSgBaS9vY7X4aD0w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR0201MB3609:EE_|PH0PR02MB8677:EE_
x-ms-office365-filtering-correlation-id: 65aa78f5-7704-4dfb-af62-08dadd15072c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mMRIsZa1IGkfwUKZ7xvKuLf67dW9PtBeHxNdjC+xGjHG0s5Oj4QHxrT583N3OYRaSuOtHiPDrIsMQHJSXhTCq9jyw+BAYiDjZ0ch5oZNQ4jmpk5OXAhHOp2Yj/3B60oz9QOPD2nlFrY6TbDAglz7f2BbwTD0YyI0tkVUB2dWuALOCuqCD9agxAeqTKGLc0zi1+vyvfBtgJvioTxnk0QTjdRmSj0yew61zrCO+E9UBesrhr6/wcE9oq5pXTyxqtybnFkRASsMkDJqR1xCdAaawDxlmbgEotrbxFO3YL72hB4glNhkfb5zN3KqgXyWnhK0Y9jGiCT77yd8Z5l1Whd7+bb9RcZSojvdE1LOYBWk0sB1A5Kox5c5YMm5eTAoSgthsx4q6YTVgD76FfqpW55aoUpy8FtHoF6wnGCgAKfqZ6/MkUtUW9tQ6x5RSVEnpvVELAfzowb122Fihvdl/+30bphK4owETh53rWtKMpdzZwFDjH5xUo4YU6k4QpPRtpa5gOD3o/YRrQxJwBA6FdRzPj0T1METhoZibPdFIIVU1MEw/A456cNzrbl5x6hpTxan8LjWfWbdCFUT7T318jVszeRuKgmFWP7sFG/2gLQHeKcxDoaiPO9LfY5ovL/Qy6SHCZ8C1lvrtPLN33TRa73sNdHYxRUIcgdOSv7RKzrbUwyDxaSEjLTGL2Op756YlW8gr50QJccFqNOLPNbYupN3n7CfdUHrCdt2nbir8Jt/qBQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR0201MB3609.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(396003)(376002)(366004)(136003)(451199015)(166002)(38100700002)(7366002)(7406005)(7416002)(5660300002)(86362001)(122000001)(478600001)(71200400001)(966005)(66946007)(2906002)(41300700001)(55016003)(91956017)(66556008)(7696005)(4326008)(66446008)(76116006)(110136005)(64756008)(8676002)(316002)(83380400001)(66574015)(26005)(186003)(9686003)(6506007)(8936002)(52536014)(66476007)(53546011)(54906003)(66899015)(38070700005)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?AfVVT2kdCbL4KSK5vEOsco2geBLTQrX74zlLRrunSAI84bKvu+yROeeN?=
 =?Windows-1252?Q?tGvq6uBH/k6ECz36wSdPeTAZEfl4YzjFSVdYwtSrAXHLd7GDGsCofhCq?=
 =?Windows-1252?Q?Ny4uLS+UpwUXOfntPSR0GaBLhePQG2RVkwausS2lFxX/G3MhbusN7QjF?=
 =?Windows-1252?Q?r+wk+bnjUp97njA2lXus5tk8xeu+h9Hj1AeNIKOPbJW7kpPVntbZhcYZ?=
 =?Windows-1252?Q?doqVGBmAV97oVdHMlYa1Az0b74/DeQFrUsHamauDYLN8LOBQlil5rHIf?=
 =?Windows-1252?Q?XkvXNRu+WigieGjG3tTqmggm0Fcsl7wJnsQHYgM9DDdU/F2h38TJvbYZ?=
 =?Windows-1252?Q?DjgW5inSvy5dtGtKhGXv6Ea1BmJVaOJFyAjpzxZ1DaPiTD3+YtCnDpFQ?=
 =?Windows-1252?Q?0He7MRdOK0aaxNpV4SNeiPheKpbqu/6Qy/fAPQhntTSa5F67+cht8QJF?=
 =?Windows-1252?Q?jaVnX9LSWysG2M7UqBjeUwsyvf6SyVMYk+FvJYp9fnURihgQVv9VXp+a?=
 =?Windows-1252?Q?EslSLeGH0SumLU3XsV7FfGsIOz2gVwKEqnr3OEf5/5lfvxNAq3xN1xJ+?=
 =?Windows-1252?Q?y5ZFnXUPntg8OqR4k3A6HiaK/Eofp+nTFfBZ1eguKkBvbEjaGPbGD3cp?=
 =?Windows-1252?Q?x1Nl6voo/jmnXY2Unk/4eCl5l4UA5uvxRd+yk2/p5Bav/N9mRX6Drdr3?=
 =?Windows-1252?Q?XJdI7GBFHURSdKmN09I64Nkvif8AO91ak3kIDyMAYyAP8h8PJpVVs4jy?=
 =?Windows-1252?Q?fy62SSs4ul0jNgRiVEHa5QodqvnbqfgJNaPKgqNRAK4oGk7OKcDEPMbY?=
 =?Windows-1252?Q?vcjYCz2dB8tsm0eG5PEUR6zpB50faVUIb0g4q6+lVvSvKVWk7+X+RwDr?=
 =?Windows-1252?Q?KzySlun4s8ZYDzCyI32AT/xUO1Mwamzk6hMF0QEsuuRJlivdHPquPETy?=
 =?Windows-1252?Q?UtaIUj3vaMZlayiWmuJhuob395lgmPLmYpc9VDNTG5rr+Zn8fbO0DhtO?=
 =?Windows-1252?Q?qYDfXYHkdlkw1i7bmeaFy1VD28QH2k9Uf9DlVqcl1ZBoYw/TPgwe0LS/?=
 =?Windows-1252?Q?g058b/v1MFWNnMxt+LR0xvC5lvoMfLnVgMAUWbNbLrV0ip8IA0F4K2bg?=
 =?Windows-1252?Q?oRIE4F8JhRIeGujGEcGWUyiPptgitvYRy4gBwQ+j8n1EvUFy8Bp566AH?=
 =?Windows-1252?Q?kEi9vAtPJavmwymvFddlwa6Au8FsbR/y4UDmRsXTh1y9O59RUew80RBC?=
 =?Windows-1252?Q?7UTTqMFuyS6qeBV22YMuuf46M5HGN3BgSIKjbb6o/SgXvBkRYl2kKGzh?=
 =?Windows-1252?Q?TiTPvJ0FpGiKEY55mI/T/6eFQ/oNhqeUv9Fssm8ffQOX7VPHI+rgfp6Q?=
 =?Windows-1252?Q?Im2FO7h7pdMiAVPgSqrWonC9UGarQmvvSL46HsGl8XaQpQhOOilzzy9R?=
 =?Windows-1252?Q?frqkkn9vhAcx0VF2sqVnJ1Qhfw6QckPa8XdmYSgY92zt+z5+KzSS7K5T?=
 =?Windows-1252?Q?vHggEkVzkVCbbXPuDJW3g2K0OEGUzdbG+8n4sJhsNp/Hqvgj3tfl49gX?=
 =?Windows-1252?Q?JRi5GFgLd54gdzKEZRkJJyJV4pVHdE2FPHySYhm3DBQfvRHKAHx1JmI3?=
 =?Windows-1252?Q?Rfzm2jbAsTMAVfVcoZWCUQVmrdVF7pvTROSG1gIo9DRB7aFUJMqOWLKg?=
 =?Windows-1252?Q?u4mZ5nofD87q9SZNWf3ENMeK0Vn5aT4PODEI4I9jf01uG2yq+3ajtUfC?=
 =?Windows-1252?Q?EnCzTiIF6fCKGuWzN24=3D?=
Content-Type: multipart/alternative;
 boundary="_000_MWHPR0201MB36094316A140120ACE6808EC8FE39MWHPR0201MB3609_"
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR0201MB3609.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65aa78f5-7704-4dfb-af62-08dadd15072c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2022 14:19:21.0610 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n9RrYlRu5K9vTreRk/GCKyubyDburBezIGh4uhkYlRl4/JZi3K99l5XhzPcYLGmq+ZUeEJNFCD54mj4uAGP+ThD3tqGl4e/Jvhgoea+ZuL4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB8677
X-Proofpoint-ORIG-GUID: n05Eh2W3wF6cO5w5TqHzfVhApCAPBSuk
X-Proofpoint-GUID: n05Eh2W3wF6cO5w5TqHzfVhApCAPBSuk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-13_03,2022-12-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxlogscore=989
 bulkscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212130127
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=mburton@qti.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--_000_MWHPR0201MB36094316A140120ACE6808EC8FE39MWHPR0201MB3609_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable



On 13/12/2022, 15:17, "Stefan Hajnoczi" <stefanha@gmail.com> wrote:

WARNING: This email originated from outside of Qualcomm. Please be wary of =
any links or attachments, and do not enable macros.

On Tue, 13 Dec 2022 at 09:08, Philippe Mathieu-Daud=E9 <philmd@linaro.org> =
wrote:
>
> On 12/12/22 00:41, Philippe Mathieu-Daud=E9 wrote:
> > Hi,
> >
> > In the last years we had few discussions on "simplifying" QEMU (system
> > emulation / virtualization), in particular for the "management layer".
> >
> > Some of us are interested in having QEMU able to dynamically create
> > machine models. Mark Burton's current approach is via a Python script
> > which generates QMP commands. This is just another case of "management
> > layer".
> >
> > Various problems have been raised regarding the current limitations of
> > QEMU's APIs. We'd like to remember / get a broader idea on these limits
> > and look at some ideas / proposals which have been discussed / posted
> > on this list.
> >
> > Feel free to complete your thoughts on this public etherpad:
> > https://etherpad.opendev.org/p/qemu-emulation-bof%402022-12-13
> >
> > Topic I remember which can be good starters:
> >
> > - Current limitations of QAPI (& QMP) model (Markus Armbruster)
> >
> > - Adding a new qemu-runtime-$TARGET / QMP-only binary without today's
> >    limitations (Daniel P. Berrang=E9 & Paolo Bonzini)
> >
> > - Problem with x-exit-preconfig, reworking MachinePhaseInit state
> >    machine (Paolo Bonzini)
> >
> > Markus / Daniel / Paolo expressed their ideas on the list (the
> > historical threads are referenced in the etherpad) so reading the
> > relevant threads before the call will help to get in the topic.
> > These people don't have to be in the call, but if they can attend
> > that would be very nice :)
> >
> > The call will be Tuesday, December 13 at 3pm CET on this Bluejeans link=
:
> > http://bluejeans.com/quintela
> We moved the call here:
>
> https://teams.microsoft.com/_#/pre-join-calling/19:meeting_MjU2NDhkOGYtOG=
Y5ZC00MzRjLWJjNjgtYWI2ODQxZGExMWNj@thread.v2

Please use a video conferencing system that allows people to join
without logging in and works across browsers. I gave up on Teams.

The =92latest=92 teams works within the browser, doesn=92t require a login/=
lobby, and kind of seems to work. It=92s nobodies preference, but - it=92s =
=93ok=94.
Cheers
Mark.


Stefan

--_000_MWHPR0201MB36094316A140120ACE6808EC8FE39MWHPR0201MB3609_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-GB" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt"><span style=3D"font-siz=
e:11.0pt">On 13/12/2022, 15:17, &quot;Stefan Hajnoczi&quot; &lt;stefanha@gm=
ail.com&gt; wrote:<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt"><span style=3D"font-siz=
e:11.0pt"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt"><span style=3D"font-siz=
e:11.0pt">WARNING: This email originated from outside of Qualcomm. Please b=
e wary of any links or attachments, and do not enable macros.<br>
<br>
On Tue, 13 Dec 2022 at 09:08, Philippe Mathieu-Daud=E9 &lt;philmd@linaro.or=
g&gt; wrote:<br>
&gt;<br>
&gt; On 12/12/22 00:41, Philippe Mathieu-Daud=E9 wrote:<br>
&gt; &gt; Hi,<br>
&gt; &gt;<br>
&gt; &gt; In the last years we had few discussions on &quot;simplifying&quo=
t; QEMU (system<br>
&gt; &gt; emulation / virtualization), in particular for the &quot;manageme=
nt layer&quot;.<br>
&gt; &gt;<br>
&gt; &gt; Some of us are interested in having QEMU able to dynamically crea=
te<br>
&gt; &gt; machine models. Mark Burton's current approach is via a Python sc=
ript<br>
&gt; &gt; which generates QMP commands. This is just another case of &quot;=
management<br>
&gt; &gt; layer&quot;.<br>
&gt; &gt;<br>
&gt; &gt; Various problems have been raised regarding the current limitatio=
ns of<br>
&gt; &gt; QEMU's APIs. We'd like to remember / get a broader idea on these =
limits<br>
&gt; &gt; and look at some ideas / proposals which have been discussed / po=
sted<br>
&gt; &gt; on this list.<br>
&gt; &gt;<br>
&gt; &gt; Feel free to complete your thoughts on this public etherpad:<br>
&gt; &gt; <a href=3D"https://etherpad.opendev.org/p/qemu-emulation-bof%4020=
22-12-13">https://etherpad.opendev.org/p/qemu-emulation-bof%402022-12-13</a=
><br>
&gt; &gt;<br>
&gt; &gt; Topic I remember which can be good starters:<br>
&gt; &gt;<br>
&gt; &gt; - Current limitations of QAPI (&amp; QMP) model (Markus Armbruste=
r)<br>
&gt; &gt;<br>
&gt; &gt; - Adding a new qemu-runtime-$TARGET / QMP-only binary without tod=
ay's<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; limitations (Daniel P. Berrang=E9 &amp; Paolo B=
onzini)<br>
&gt; &gt;<br>
&gt; &gt; - Problem with x-exit-preconfig, reworking MachinePhaseInit state=
<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; machine (Paolo Bonzini)<br>
&gt; &gt;<br>
&gt; &gt; Markus / Daniel / Paolo expressed their ideas on the list (the<br=
>
&gt; &gt; historical threads are referenced in the etherpad) so reading the=
<br>
&gt; &gt; relevant threads before the call will help to get in the topic.<b=
r>
&gt; &gt; These people don't have to be in the call, but if they can attend=
<br>
&gt; &gt; that would be very nice :)<br>
&gt; &gt;<br>
&gt; &gt; The call will be Tuesday, December 13 at 3pm CET on this Bluejean=
s link:<br>
&gt; &gt; <a href=3D"http://bluejeans.com/quintela">http://bluejeans.com/qu=
intela</a><br>
&gt; We moved the call here:<br>
&gt;<br>
&gt; <a href=3D"https://teams.microsoft.com/_#/pre-join-calling/19:meeting_=
MjU2NDhkOGYtOGY5ZC00MzRjLWJjNjgtYWI2ODQxZGExMWNj@thread.v2">
https://teams.microsoft.com/_#/pre-join-calling/19:meeting_MjU2NDhkOGYtOGY5=
ZC00MzRjLWJjNjgtYWI2ODQxZGExMWNj@thread.v2</a><br>
<br>
Please use a video conferencing system that allows people to join<br>
without logging in and works across browsers. I gave up on Teams.<br>
<br>
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">The =92latest=92 te=
ams works within the browser, doesn=92t require a login/lobby, and kind of =
seems to work. It=92s nobodies preference, but - it=92s =93ok=94.<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Cheers<br>
Mark.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt"><span style=3D"font-siz=
e:11.0pt"><br>
Stefan<o:p></o:p></span></p>
</div>
</div>
</body>
</html>

--_000_MWHPR0201MB36094316A140120ACE6808EC8FE39MWHPR0201MB3609_--


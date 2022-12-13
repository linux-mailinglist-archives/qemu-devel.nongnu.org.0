Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A1E64B9EC
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 17:38:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p58Hx-0000Zy-QX; Tue, 13 Dec 2022 11:37:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mburton@qti.qualcomm.com>)
 id 1p58Hv-0000Xy-Mn
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 11:37:51 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mburton@qti.qualcomm.com>)
 id 1p58Ht-0003lq-CG
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 11:37:51 -0500
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BDG9Lsq000719; Tue, 13 Dec 2022 16:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=qcppdkim1;
 bh=JKm7XcXeUsFB7Gmd6XGW+2x1h6rJ/sjq1lx9M8TReek=;
 b=aMXoU0KkImTlsKvT7ho0rBBuYTpFR2+JmkXwpFJvHc99QbdQvvibMBuqDOTn3t/2Iqio
 jBrUlt92y6wLOMlolreT2shTfk4NvnMy4K530ffMaU6kDSwGBOjYbOM7qXkzHuQva6R2
 fQ2OFKFQu2DUinFd+PgnRxU+14vcuvYjksVqkdOhrVN1bF0RRD6wtlTVYMZBvX62wCK3
 7Ujxf+0/PDBJirusM26YL0JzEzSUZnuP1C8GCc1zrvUEWXG4CzXJp5G2xyHqS1MpOOqv
 4GwYOpotlR/n3H9f88+3QjNmEQ9CWWrnY6NL7xunNErkzlfTxbWQbMH1w931gcIY21BT yA== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3me83skj2n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Dec 2022 16:37:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HxAmopN+RYs4vvtejcKGwnXREt3skqOb2F0zUSZKKZbA8J1GYTNUlD+kq28Xgkx9iTknTw1zBzNHHHK1Zj9E28QkfYo5rWnDb/8YjVWRDZRJpwLIm5iv+0s4xRM9Sj2yRJbb3XGOMh4ea5GcD0XLKp3qBNaso0la8n7jas+GPVcq1JCd1APHP8F/HL/jOkOlZftSMoUIHCno0p0D2xN0HOchcISqbgbEza+vpLgPiyjqDTjVKjl511MHG6g7+xEoRzKBSS260az0c5+fSiqxJ1qzdCChVrNvao2WnoQoDIQ4GItqePVXkuUFoR2HWVQg1PyIh6Waay1Kzs67InpZkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JKm7XcXeUsFB7Gmd6XGW+2x1h6rJ/sjq1lx9M8TReek=;
 b=JFVTwsEqzHScN34h6NdJnmFaVXdfaJeNckwL4mEGb3aoFdPpPWXLALPste1I2ESjphDFYnmzq0M5a+e0YYlJ/LPSspCR8UqZEpQXSeWt8eT0EBVVmTVYiYHYVzoa4OMfXEsYDOfIsfP/3JubvrNySpt5wL4obMTF+agmScIoZnWVmEavG1Q3lr7fr0viN2AIyPsXv9rZ4aPAqR7zpJU9mcPHUsO1iam8RnEmtK4IcBc8+LB9WV1caXvGKp19+b1VQOAoB6HgZkZEm35YCIzEKTud5FjijHbWgWuudbu8EKxtsCRDlTcyi0n5c72bBN6O/LczkrJETZuDRxSzbf7z0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from MWHPR0201MB3609.namprd02.prod.outlook.com
 (2603:10b6:301:78::26) by PH0PR02MB7304.namprd02.prod.outlook.com
 (2603:10b6:510:b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 16:36:59 +0000
Received: from MWHPR0201MB3609.namprd02.prod.outlook.com
 ([fe80::7723:cbdc:1779:6cf4]) by MWHPR0201MB3609.namprd02.prod.outlook.com
 ([fe80::7723:cbdc:1779:6cf4%4]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 16:36:58 +0000
From: Mark Burton <mburton@qti.qualcomm.com>
To: Felipe Franciosi <felipe@nutanix.com>,
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
 Stefan Hajnoczi <stefanha@gmail.com>, Eduardo Habkost
 <ehabkost@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?Windows-1252?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Dominik Csapak <d.csapak@proxmox.com>,
 Christophe de Dinechin <dinechin@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Kashyap Chamarthy <kchamart@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Jagannathan Raman
 <jag.raman@oracle.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Dongli Zhang <dongli.zhang@oracle.com>,
 "afaerber@suse.de" <afaerber@suse.de>, "andrea.arcangeli@redhat.com"
 <andrea.arcangeli@redhat.com>, "bazulay@redhat.com" <bazulay@redhat.com>,
 "bbauman@redhat.com" <bbauman@redhat.com>, "cjia@nvidia.com"
 <cjia@nvidia.com>, "cw@f00f.org" <cw@f00f.org>, "digitaleric@google.com"
 <digitaleric@google.com>, "dustin.kirkland@canonical.com"
 <dustin.kirkland@canonical.com>, Eric Blake <eblake@redhat.com>, Eric Auger
 <eric.auger@redhat.com>, "iggy@theiggy.com" <iggy@theiggy.com>, Jan Kiszka
 <jan.kiszka@web.de>, Jason Gunthorpe <jgg@nvidia.com>,
 "jidong.xiao@gmail.com" <jidong.xiao@gmail.com>,
 "jjherne@linux.vnet.ibm.com" <jjherne@linux.vnet.ibm.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 "mburton@qti.qualcom.com" <mburton@qti.qualcom.com>, "mdean@redhat.com"
 <mdean@redhat.com>, "mimu@linux.vnet.ibm.com" <mimu@linux.vnet.ibm.com>,
 "z.huo@139.com" <z.huo@139.com>, "zwu.kernel@gmail.com"
 <zwu.kernel@gmail.com>, Laurent Vivier <lvivier@redhat.com>
Subject: Re: Single system binary & Dynamic machine model (KVM developers
 conference call 2022-12-13)
Thread-Topic: Single system binary & Dynamic machine model (KVM developers
 conference call 2022-12-13)
Thread-Index: AQHZDbo1t1zKK5U+3UGv1sqsPVlsx65r3WiAgAAolICAAACJBg==
Date: Tue, 13 Dec 2022 16:36:58 +0000
Message-ID: <MWHPR0201MB360975DAE8AD1684FC96133C8FE39@MWHPR0201MB3609.namprd02.prod.outlook.com>
References: <936e1ac4-cef8-08b4-c688-e5b1e057208b@linaro.org>
 <1ac96aab-c5c4-b539-956c-d2923e6d8602@linaro.org>
 <236991F2-4CDA-46BA-AE68-66E8D329F459@nutanix.com>
In-Reply-To: <236991F2-4CDA-46BA-AE68-66E8D329F459@nutanix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR0201MB3609:EE_|PH0PR02MB7304:EE_
x-ms-office365-filtering-correlation-id: d596d3cd-1bf6-43be-e0bf-08dadd28410d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: djxSWJMbX6ukWXpK4O9m1Om8KmDZUoI/TqXiHnBDmZ2u6O0yovdbEQxhVGUxOT2fW0yjIlTNHmC49dXwAVK4E15u2yMsLV9nea6c72fzPAxMr+HObm/l4uYuU/k+irNA5I6kTWzn4HfWp4kE7PzTGOejcoNBr8bTJMUXgMan4efrBcTy7mMm9yXZnb8Rzl1H6bkvEww8SMK0bZE+fUnUUcW/Nf+o2u9tGLQqnRwX++zdOPRJOSM4svc7StvuLs9MDz8rBJrQ11038Id4ESRY8/4Ib+ciNouqRHOcy1RRxdjwNS+jzcR9kgbmjDO+ZY/BCGh+UHyZvc0aEWyOJVfj3VnbpHPeXEjUlJ+JUKZfyUuzFX2NVWR6y+cE3bYiVXchlnO9gmDf4bxeLp4dr6T+5+YE/lkhIGkiXQF3JbOh78ou+DmGQzs2UU8bwDBBy0sphxEEY2HVXgu2AIrsV314SHVYMH8+28pp/lTfNLqfbaW6g0RVQ27BNE4h5vPrOdx1T7jFzmiyRdEDU7G8eqFgTltA2s+97t4+YdI8aR8CCu626ZIvv1gOVgBO5JzCQiAlVd3LHr8/Qaw4YIQDzy1xP81Tmq06SGSDu8FOv5rUyg6iK8fYjiUBrfn2s4EFfuk6MZp7KRPXnajKO8SLInV4L5yOtf1/QvSXjCLXuKBAC3P9Zu+AWPkFqh7hFfbM+OZ8H/TWNR+phWUSdJmSRm4baYCBtjCcNulGKHIOnprgmaU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR0201MB3609.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(136003)(346002)(39860400002)(366004)(451199015)(122000001)(166002)(41300700001)(966005)(38100700002)(86362001)(55016003)(52536014)(8936002)(478600001)(71200400001)(4326008)(110136005)(316002)(8676002)(66946007)(66556008)(64756008)(186003)(76116006)(2906002)(54906003)(83380400001)(7696005)(66476007)(26005)(296002)(6506007)(9686003)(4744005)(7366002)(53546011)(91956017)(7416002)(7406005)(5660300002)(66899015)(66446008)(38070700005)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?Oo5Ek3Ki78OyOccg4yMgUdMOPq6Fwy6dDqufXQ7fqsTTlfO+d7Hd1swg?=
 =?Windows-1252?Q?cECrhg+kIqE03lYLvmFWGiBdJ2SqN7gD5Qn+x6IFBtizDkd6O/iNMUiK?=
 =?Windows-1252?Q?G4pJCsbV0fVWfi/qx7C+xT4WX8fK7EmknwTtonsgUeojcUn+51dMgMdE?=
 =?Windows-1252?Q?Ej3XbNWMgMuGc5vgJUD4vJor3i6WlBpzJx9GIKe6ndoMNXdda6d4aYYR?=
 =?Windows-1252?Q?ABKPiakO/A744+zm5Qf9nwRgUn4d+JYPpvz97qJHjAbnxVKTjH21LHIL?=
 =?Windows-1252?Q?j0yb4AolIKS5qqR++2ofS4f5qwtvETuiUmYNneiDky6Lbl2ZALdQAmQP?=
 =?Windows-1252?Q?DW6amJ8w6HVwX6Y1+C1GENa7OD1KnvL0tJE0CVeFB1GqyL/cPii+VDKJ?=
 =?Windows-1252?Q?KMhqxZjfV1KHt2Id/S17lnH7mwGzLfJLZOcinRIZDL/qrr2SGRIm9jo1?=
 =?Windows-1252?Q?ZrV7fhUNl8sQ1vWVJiiT+/nI1Fk+XTyuZaADZ6datPJgM4aU8Oaix7Zz?=
 =?Windows-1252?Q?XbS7fAtrWxmWDMKg9Xes6BkOuVsf2JmZpIb+vn9nBejkdXz1gKx0ei3m?=
 =?Windows-1252?Q?UwLy4tQR0jOMLiXADex5T51RoTlix9ciagfmxC4x7oX06foFCi+SRb8H?=
 =?Windows-1252?Q?2g7bicyHJC56EdEsgV8VV+9JEvVGvTgzRO08IoA6nZNxZCgpFi5s5L70?=
 =?Windows-1252?Q?LeWMaHxIw4ibsMxrpXc6UF5y7yjukY1C+8WI1J1oSoMAJ3gC8E4Z3VGG?=
 =?Windows-1252?Q?TB6tsF0LfEu+WL7xuMnfJxECw2SXXN8TzUh8w+8MVo1GAaoWDuOsx3r1?=
 =?Windows-1252?Q?wAvPu4lsPvbcGmZM4ts9DLQr/k8bDqB7fFm8SAVybKr+6vr55p+Zt0Ik?=
 =?Windows-1252?Q?rBMBwMi5cFa0A2dk4qvn8IXiZfW7tu4zi0YioWSwFKiy4ynXyOeITldT?=
 =?Windows-1252?Q?jLPuDXwkMG4Al81bMknC+cdSnx9k8taaboxSn7pLDngbbqefEuthPuUS?=
 =?Windows-1252?Q?rwhh8Mjg2WXXt1z9XsD/l2ef6G23TQMAOmH95lLu0vC8oi7krSMkeAtk?=
 =?Windows-1252?Q?4aZAJeQ9Uy7DVK4XCM8rxvrOi3Iy6gsC5xM4Wjioh8eg3Ai7VNLRRETk?=
 =?Windows-1252?Q?V87qeXUh+WIEJ6smUUJMeVdLwOeyMcU7BBKhwOHq20zKmJovDUUietVa?=
 =?Windows-1252?Q?5DCcn2sDr3XLTaxgv0HnRNPBzdisN+pa2ybJmQbIelAUnPcJ7vj5iUvA?=
 =?Windows-1252?Q?9LrXfjGbJwOHZ9RfDmqNy/SwNFlQ0fAjjJuHhg7+zcMBFu19gZBxkI2W?=
 =?Windows-1252?Q?VE0ruReFCv6cEONzh797bmf6Up67AYr6iITYw7BFaBeFQyH2jr0AQdDP?=
 =?Windows-1252?Q?kBK+XJ+bRFnVx3g/Xwfm+ANy9gmKha7NZj1fxh0QEW7FUV+2j3arCb3I?=
 =?Windows-1252?Q?a+oXSHOEj9+x8QnFPwmWndutf8/b4GgzKrSkwoISkTXo0Klzb0A/H2XY?=
 =?Windows-1252?Q?T52wb2tvhB3hXpzi3aIDA9XSiPyGQEzf0fzZUuyHukGK3fy6qMQ7xxMN?=
 =?Windows-1252?Q?w1ZVqAe8YGAQDK9VwFDHd8ZzspJZJ/dwbu0TQ8ZpNQNsCkQlPqj/3KOV?=
 =?Windows-1252?Q?AlfSkx4WYzAAGNFxA9hA40adM3+DsJkchzApJ03qCixyP1knSksKyCpE?=
 =?Windows-1252?Q?8cdAMIqApzjXAmE3grEulS827yZZHIeBnPffqK+CbXbMk3cLkp5H6VUl?=
 =?Windows-1252?Q?OvdRPhDpUM+C+ucww1A=3D?=
Content-Type: multipart/alternative;
 boundary="_000_MWHPR0201MB360975DAE8AD1684FC96133C8FE39MWHPR0201MB3609_"
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR0201MB3609.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d596d3cd-1bf6-43be-e0bf-08dadd28410d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2022 16:36:58.5580 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cg+anGTpr30FHAmWN+nVVcdfUHcHBpUewqH5pMRbhue3nyoHaueEnyWeXL7cg7o6Kktm3LIMbbiSleq8YkfDHW/iWWc0na1zTr18AKCAihs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7304
X-Proofpoint-GUID: IDZqrrGjnSFCkPmANKefIOJJaszfR412
X-Proofpoint-ORIG-GUID: IDZqrrGjnSFCkPmANKefIOJJaszfR412
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-13_03,2022-12-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 mlxlogscore=986 bulkscore=0 suspectscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212130147
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

--_000_MWHPR0201MB360975DAE8AD1684FC96133C8FE39MWHPR0201MB3609_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Happy with any choice so long as the meeting can be opened (either by any o=
f us, or by a =91larger=92 number of people) - it=92s not fair it relies on=
 one person.
Cheers
Mark.


On 13/12/2022, 17:35, "Felipe Franciosi" <felipe@nutanix.com> wrote:

WARNING: This email originated from outside of Qualcomm. Please be wary of =
any links or attachments, and do not enable macros.

> On 13 Dec 2022, at 14:08, Philippe Mathieu-Daud=E9 <philmd@linaro.org> wr=
ote:
>
> We moved the call here:
>
> https://teams.microsoft.com/_#/pre-join-calling/19:meeting_MjU2NDhkOGYtOG=
Y5ZC00MzRjLWJjNjgtYWI2ODQxZGExMWNj@thread.v2

Just wondering: what's wrong with Google Hangout?

If people want to try Zoom, I'd be happy to look into setting it up.

F.

--_000_MWHPR0201MB360975DAE8AD1684FC96133C8FE39MWHPR0201MB3609_
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
:EN-US">Happy with any choice so long as the meeting can be opened (either =
by any of us, or by a =91larger=92 number of people) - it=92s not fair it r=
elies on one person.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Cheers<br>
Mark.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt"><span style=3D"font-siz=
e:11.0pt">On 13/12/2022, 17:35, &quot;Felipe Franciosi&quot; &lt;felipe@nut=
anix.com&gt; wrote:<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt"><span style=3D"font-siz=
e:11.0pt"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt"><span style=3D"font-siz=
e:11.0pt">WARNING: This email originated from outside of Qualcomm. Please b=
e wary of any links or attachments, and do not enable macros.<br>
<br>
&gt; On 13 Dec 2022, at 14:08, Philippe Mathieu-Daud=E9 &lt;philmd@linaro.o=
rg&gt; wrote:<br>
&gt;<br>
&gt; We moved the call here:<br>
&gt;<br>
&gt; <a href=3D"https://teams.microsoft.com/_#/pre-join-calling/19:meeting_=
MjU2NDhkOGYtOGY5ZC00MzRjLWJjNjgtYWI2ODQxZGExMWNj@thread.v2">
https://teams.microsoft.com/_#/pre-join-calling/19:meeting_MjU2NDhkOGYtOGY5=
ZC00MzRjLWJjNjgtYWI2ODQxZGExMWNj@thread.v2</a><br>
<br>
Just wondering: what's wrong with Google Hangout?<br>
<br>
If people want to try Zoom, I'd be happy to look into setting it up.<br>
<br>
F.<o:p></o:p></span></p>
</div>
</div>
</body>
</html>

--_000_MWHPR0201MB360975DAE8AD1684FC96133C8FE39MWHPR0201MB3609_--


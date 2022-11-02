Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF326162A1
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 13:22:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqCjP-0008Lk-97; Wed, 02 Nov 2022 08:20:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83056df09e=guohuai.shi@windriver.com>)
 id 1oqCjJ-0008LF-8A
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 08:20:25 -0400
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83056df09e=guohuai.shi@windriver.com>)
 id 1oqCjE-0006s3-8K
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 08:20:23 -0400
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A2CDJuB032306; Wed, 2 Nov 2022 12:20:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=Q6XNbPnNJaAsiydgnzTipJh6EWWm1XkARB8OTXo7rK0=;
 b=cPVhTsR7qjkoZxluKD2yprhc5dRMrr1nKQPhFO/6uR4JmgMJtpn5tXygs2ximPC9tFdM
 sq/7QV1U3MoJNIgCDsLT2OHzVs7XAHXeg0nVkDPV/8u3ogfL+eLMhMPFFZN8kst2OeAF
 UD4xlGxZpEPuZRdxW6f59ZeFfikzpmPF5BPmtFkyVT0Zhe/7rB3/Z2ZtQNth55fY9EqX
 MywvlxALrt0uzEX2rIyOCWxNioUSZgSuGrkXaXd62bE8W8LPXUKIPtLhzZYjEcKh3wbm
 c62yCGwGQsdxLXRDmWBQSEErRG9J4lECd2F8KhAPj/WhtxLj3FsPlpOR5tCtsWIU2krD GQ== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2046.outbound.protection.outlook.com [104.47.57.46])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kgu5c3ak3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Nov 2022 12:20:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oInEWBM01K0Cg9d+WjYZ6HzS0aV855P+ovA60n4mUZy8QeXbKqUcfBuxYxMutqL4cbL/OTllNtoIXPFeURrD6EXXcWkWg1zGm4Hr+85J2/X1q1CgiRT8MKVUyqQ6th0IhGWukIJMu6iPYTsnbfc6+ql9VV+WNu529G4CEuCgpvxoOqrRkxRshz7wTbvusKE2Ul+nbm+I+vMn85aQ0m6bG1/ykPePxHTM/Y0MsQOIgHZ8ekAGGAI3UAcVWc8t3ayh1tn3bvwy/95S1q73rLLAvto+KuZH4dh5rfIULyIirTdGEl7fJlFCqZjO4vvfPEG4hluFpPpHyZxnTxX6vfk7kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q6XNbPnNJaAsiydgnzTipJh6EWWm1XkARB8OTXo7rK0=;
 b=ThcR9vAjF1ARug+jOOAH7N8DUZ7fAT0debLx8SFDgSVLetN+WQ22QGL/dTEbG+rwiFAl17ds5teXRmOJ+jvs5cq679JUm6f78PaM/7YLkianuZDAPwJ5OZzHpZJD7jH+D41XT4Ru/eF/0W4MVQrXiNmTChbtqKCGvU5SUN8tYE7/FOttIFy8Wf6vP95tmQ4yES8gjz5AWfrUvkqryLkI9wRJmPIFrosD0mqnCGqpGyaUwF++c3HqOIyQLx6YwtGHc92S5c5peBfVNIzXIeIptqK5mcYlx66JomoCoCCsdnmVO5+pPlP8zW6d9emfO3rkrQ2cD5Wfzw4JgCumjM2n+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN2PR11MB4173.namprd11.prod.outlook.com (2603:10b6:208:137::20)
 by DS0PR11MB7559.namprd11.prod.outlook.com (2603:10b6:8:146::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Wed, 2 Nov
 2022 12:19:59 +0000
Received: from MN2PR11MB4173.namprd11.prod.outlook.com
 ([fe80::d5da:febb:1542:911a]) by MN2PR11MB4173.namprd11.prod.outlook.com
 ([fe80::d5da:febb:1542:911a%4]) with mapi id 15.20.5791.022; Wed, 2 Nov 2022
 12:19:58 +0000
From: "Shi, Guohuai" <Guohuai.Shi@windriver.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: Greg Kurz <groug@kaod.org>, "Meng, Bin" <Bin.Meng@windriver.com>
Subject: RE: [PATCH 09/16] hw/9pfs: Disable unsupported flags and features for
 Windows
Thread-Topic: [PATCH 09/16] hw/9pfs: Disable unsupported flags and features
 for Windows
Thread-Index: AQHY52VFg9o7M4tGH0Os7IfLSKMdJ64qN5kAgAACtzCAAD7pgIAAie/QgACMKgCAAAejsA==
Date: Wed, 2 Nov 2022 12:19:58 +0000
Message-ID: <MN2PR11MB41735D6350E202A385BF7AFCEF399@MN2PR11MB4173.namprd11.prod.outlook.com>
References: <20221024045759.448014-1-bin.meng@windriver.com>
 <2052313.fat1d0ETzH@silver>
 <MN2PR11MB4173529A71C30E89E4DAF743EF399@MN2PR11MB4173.namprd11.prod.outlook.com>
 <5228417.8yWHOg2it3@silver>
In-Reply-To: <5228417.8yWHOg2it3@silver>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4173:EE_|DS0PR11MB7559:EE_
x-ms-office365-filtering-correlation-id: 8e891b9d-2b0a-4c59-582e-08dabccc8f29
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AmeiyhQj75GlaIklc7rxgCz0zuGVjmBmAZybho9VQlDpWxqwK1LchM5Th0UWxC6X7jCm/IdBZ7NNrL4Fs8S5MVWmqsIYnJGTTAWeLztjj1uD0z8JfTTqgcBmLHfC+EaEV2dXahlQy6ssbIgL1QGIMR4ZBS8HO2bfytAmTQgzQSjmJvJvZ2q3oMSpeObv2IkyiDEKVdgSj0us57IWKuLKExHEGvp4HqzHcyHjFYeWfhab/LzXdMCfLSAluLUQIR+4OCfsPhz0MAqBezkim9JF5cCLLEDTlMmbM0tO5AzMeeMGmMNKmxOGgvIWHv00rAZDr5dEIGHj2gRFd1rZz3mjWeVhOHY+UUa1IZ2ElFk3VeKxLDYwqEq6NjJtsNRr50iMQuWk0DWEsWS14PvFKjt5BGdBZb2MKbLeGQ6ZoP+vXUS3pb1CQ7XmNqh2GvJLAzU1NPGPYYj7iW9E5KiRDKoirJQXGelldyHeoB9k6ZkmPTAk4tFI4o0Csf2PsK0hmimo8AzvfnNshe0/M5rOdWn4w7S3vzz8o9QPCP5p9pigRjAjhcHxt6u6QFtpS7TCalSghVXF9Mf3HjZxg8S3F4TghOIJTtvCQghdY4SCC1OgoJYaipyOvjHaFininbSZKh04ADr3b5A+yKsawpIGHGqXLtthClJSR2WZfXxDZFPsuM63poHo+mAt8HxnUlVAlD6ogmGrRQNpI1drLlXntXOiX0zNWNBABjCxXHYHYHeG+PhiY34YnJAyY0NjplGs13CdIFVY1o3KVUaaUWicUzZO+5sr8KS5s2UMsTcyazuDGRoGHy2YnX2pmUoRPGwhHZHGgkG9NB3ce8Izl4T0S5M3eg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4173.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(39850400004)(396003)(366004)(136003)(451199015)(83380400001)(66899015)(86362001)(55016003)(478600001)(7696005)(107886003)(966005)(2906002)(6506007)(71200400001)(30864003)(38070700005)(38100700002)(33656002)(122000001)(9686003)(53546011)(26005)(186003)(316002)(64756008)(4326008)(66476007)(66446008)(66556008)(8676002)(66946007)(76116006)(110136005)(41300700001)(52536014)(54906003)(8936002)(5660300002)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UunTzsPXr8rFFVAXilmG8Ee7btmqFLzMmLsw2FEdQhgy+gRGiEUmblf+0/si?=
 =?us-ascii?Q?gJKwPou0BjcfR8wBF+yG5Qe1SB/oFZa0t3QqOlaUE5QiUOIO47TjVL2s/KQ+?=
 =?us-ascii?Q?VGB7xVhfaUOBDBF07iNsW5X4o7t+UY6Xw1ym0ClGJsN4TQaKv4n8gtjM9j9d?=
 =?us-ascii?Q?1hqiSAnS4owME6/5tmtdi5CAmwtVEdEE0q9RgVTr5KFfBO5EBDT96yhd5nfS?=
 =?us-ascii?Q?BvpAk5bKci1RTrtV5SQM/EOrEb5ppduIdWsh8Op663JjD7BPR/20eUnYfDZj?=
 =?us-ascii?Q?FbXGIo9Oa1Lf2WvrbCg2Jy5uQE8woRBXginJen3/0W55j8KP+nrKBUPQRCCq?=
 =?us-ascii?Q?uNZfVnsfHC8FWd9UCmvVZqQ6OpW15c6J609wXbOvF37tg8DLRsxdSfsKKIvs?=
 =?us-ascii?Q?p2HFEx96Fi0piFk2XYAqGqFiQqe7ltJNDWATqJpPdfAjEZcBJnxc5bGJwaUK?=
 =?us-ascii?Q?tuaJr60j2q6cnEBLYmkLvloc8/cPlKj0ZPxYJraGcjMMq3REEJSKxk6yexGG?=
 =?us-ascii?Q?ehG0ni6HMW3mfxBnGOcAEhm7gValpaomvzFIGA7DeWrXDmpNz+K5DN+YX3rA?=
 =?us-ascii?Q?xyOTJ0W1kro9uyLmSK7NknUYWII5PUMjQvoqAjV+ECrj4liGUWJuUjaOAju1?=
 =?us-ascii?Q?b4rhAPgr3wjdRDumIOVKYpgWxKqW5OkbXdKVaBshCIC7+/oKq4df8F53Be/2?=
 =?us-ascii?Q?8yaP4qnXgMEqmoXo3wKWv9jVRGLxhGrXbDRfrrcAA0fiStlvrQ3tg6ub6bh3?=
 =?us-ascii?Q?N7G9GqgD8K5yXu7kv924mX8C9+qZPn07X4WcRfCzKg6/ehTJi6U255IVVVVG?=
 =?us-ascii?Q?W89WgYMDdT8s+2ChML2KpxREZxaKqsDVK5jsrBgmKt/hSnt3vKK7Zc0XdmUq?=
 =?us-ascii?Q?pv6SApMR5T9Xpl0QsZig/z8SvkIyRO+nEhyLjCL8luFqFixN2d75h90gTwWf?=
 =?us-ascii?Q?0Yv2R8hQjFZSOhc/IWJ8RSZc+EwVyqvSLOGn6xWiEH67NTyY9Q4ymgRGTf4R?=
 =?us-ascii?Q?Cx81vVYjIJ6kE26Am9P+tIPgWf8+PpBxnGPgjh2UKan+V8okwdQdBcBrvTTl?=
 =?us-ascii?Q?7MCYPX7JGh7KDkc8R8M8s2JD5/zSZv1XHk2AMpF8kGq58FcfCSHp+7IpgSza?=
 =?us-ascii?Q?s5B3XL3D1DzdSDc1mwuXiVGSOZ4I6xOXLo+cDXpWFH/Kh0Iemi4aOMs98Tbf?=
 =?us-ascii?Q?ctlfVurYW+fIDOR+92Xq8nwCjT2jQS0zLl7N1Pe/xEa5xwkj99595ecvmNuN?=
 =?us-ascii?Q?yBatLcohwTJT9VZbPSmjUFXpknFUCEqQbJlETrb0FNLx+AO34fupdKQm0wqq?=
 =?us-ascii?Q?XuviY6Ddn99J2Mn6si0hf0XiTHjdDkBqq0djuv6Mx3rZGCx2I44cJfuexfya?=
 =?us-ascii?Q?46bTr3rfs1ax1lV31cloLjWWYl31K7bmszGP5QJDGSAWTFJg8DQwgP7OoYk7?=
 =?us-ascii?Q?GtUw1dkhbDLnfjzco0cHN9QISEbzgFtAxeS6aT+QQYMHtxGsWc/1UT2QiEw5?=
 =?us-ascii?Q?d3/wxXW4SANQYxmdZseF9CmF5I2DLt8bJCmyyx18JN4VaxK1AbrdAfYdl5fz?=
 =?us-ascii?Q?3tFqsqLtXbp/NAGJLOKOkReqHq16swFZjdBYmn8j?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4173.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e891b9d-2b0a-4c59-582e-08dabccc8f29
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2022 12:19:58.7235 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6PAarLsuDFN11bSqI+tYSQ0dTuh2+qlsP+wwT7iY6bOu6pg7pmLb5YMhjS8CyiPBU9xT4/HrMh7JQ7tQIWYemA1hEXzc5r+PpspQH9x16Eo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7559
X-Proofpoint-ORIG-GUID: hsm9BYGAihRJlqeMH1eHLEWlcQ0cIhk1
X-Proofpoint-GUID: hsm9BYGAihRJlqeMH1eHLEWlcQ0cIhk1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-02_08,2022-11-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211020076
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=83056df09e=guohuai.shi@windriver.com;
 helo=mx0b-0064b401.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



> -----Original Message-----
> From: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Sent: Wednesday, November 2, 2022 19:34
> To: qemu-devel@nongnu.org
> Cc: Greg Kurz <groug@kaod.org>; Meng, Bin <Bin.Meng@windriver.com>; Shi,
> Guohuai <Guohuai.Shi@windriver.com>
> Subject: Re: [PATCH 09/16] hw/9pfs: Disable unsupported flags and feature=
s
> for Windows
>=20
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d
> know the content is safe.
>=20
> On Wednesday, November 2, 2022 4:44:14 AM CET Shi, Guohuai wrote:
> >
> > > -----Original Message-----
> > > From: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > Sent: Wednesday, November 2, 2022 02:59
> > > To: qemu-devel@nongnu.org
> > > Cc: Greg Kurz <groug@kaod.org>; Meng, Bin <Bin.Meng@windriver.com>;
> > > Shi, Guohuai <Guohuai.Shi@windriver.com>
> > > Subject: Re: [PATCH 09/16] hw/9pfs: Disable unsupported flags and
> > > features for Windows
> > >
> > > [Please note: This e-mail is from an EXTERNAL e-mail address]
> > >
> > > On Tuesday, November 1, 2022 4:34:54 PM CET Shi, Guohuai wrote:
> > > >
> > > > > -----Original Message-----
> > > > > From: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > > > Sent: Tuesday, November 1, 2022 23:04
> > > > > To: qemu-devel@nongnu.org
> > > > > Cc: Shi, Guohuai <Guohuai.Shi@windriver.com>; Greg Kurz
> > > > > <groug@kaod.org>; Meng, Bin <Bin.Meng@windriver.com>
> > > > > Subject: Re: [PATCH 09/16] hw/9pfs: Disable unsupported flags
> > > > > and features for Windows
> > > > >
> > > > > [Please note: This e-mail is from an EXTERNAL e-mail address]
> > > > >
> > > > > On Monday, October 24, 2022 6:57:52 AM CET Bin Meng wrote:
> > > > > > From: Guohuai Shi <guohuai.shi@windriver.com>
> > > > > >
> > > > > > Some flags and features are not supported on Windows, like
> > > > > > mknod, readlink, file mode, etc. Update the codes for Windows.
> > > > > >
> > > > > > Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
> > > > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > > > > ---
> > > > > >
> > > > > >  hw/9pfs/9p-util.h |  6 +++-
> > > > > >  hw/9pfs/9p.c      | 90 +++++++++++++++++++++++++++++++++++++++=
+++-
> ----
> > > > > >  2 files changed, 86 insertions(+), 10 deletions(-)
> > > > > >
> > > > > > diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h index
> > > > > > 82b2d0c3e4..3d154e9103 100644
> > > > > > --- a/hw/9pfs/9p-util.h
> > > > > > +++ b/hw/9pfs/9p-util.h
> > > > > > @@ -53,8 +53,10 @@ static inline uint64_t
> > > > > > makedev_dotl(uint32_t dev_major,
> > > > > uint32_t dev_minor)
> > > > > >   */
> > > > > >  static inline uint64_t host_dev_to_dotl_dev(dev_t dev)  {
> > > > > > -#ifdef CONFIG_LINUX
> > > > > > +#if defined(CONFIG_LINUX)
> > > > > >      return dev;
> > > > > > +#elif defined(CONFIG_WIN32)
> > > > > > +    return 0;
> > > > >
> > > > > Really?
> > > >
> > > > Check MS this document:
> > > > https://learn.microsoft.com/en-us/cpp/c-runtime-library/reference/
> > > > fsta
> > > > t-fstat32-fstat64-fstati64-fstat32i64-fstat64i32?view=3Dmsvc-170
> > > > st_rdev: If a device, fd; otherwise 0.
> > > > st_dev: If a device, fd; otherwise 0.
> > > >
> > > > So for any file open, it should be 0.
> > >
> > > Yeah, but that function translates a corresponding device ID for
> > > *Linux* guest side. And the intention is to avoid e.g. file ID
> > > collisions on guest side.
> > > Because for a Linux guest, the two-tuple (device number, inode
> > > number) makes a system-wide unique file ID.
> > >
> > > If you just return zero here, that might be OK if only one 9p
> > > directory is exported to guest, but say you have "C:\foo\" exported
> > > and "D:\bar\" exported and mounted via 9p to guest, then guest would
> > > assume every file with the same inode number on those two to be the
> > > same files. But they are not. They are on two different drives actual=
ly.
> > >
> >
> > Got it.
> > Windows does not provide any numerical type ID for device, I think the
> > solution could be using driver letter ASC code "C:", "D:", etc.
> >
> > > >
> > > > >
> > > > > >  #else
> > > > > >      return makedev_dotl(major(dev), minor(dev));  #endif @@
> > > > > > -260,7
> > > > > > +262,9 @@ static inline struct dirent *qemu_dirent_dup(struct
> > > > > > +dirent
> > > > > > *dent)  #if defined CONFIG_DARWIN && defined
> > > > > > CONFIG_PTHREAD_FCHDIR_NP int pthread_fchdir_np(int fd)
> > > > > > __attribute__((weak_import));  #endif
> > > > > > +#ifndef CONFIG_WIN32
> > > > > >  int qemu_mknodat(P9_FILE_ID dirfd, const char *filename, mode_=
t
> mode,
> > > > > >                   dev_t dev);
> > > > > > +#endif
> > > > > >
> > > > > >  #endif
> > > > > > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c index
> > > > > > 6c4af86240..771aab34ac
> > > > > > 100644
> > > > > > --- a/hw/9pfs/9p.c
> > > > > > +++ b/hw/9pfs/9p.c
> > > > > > @@ -39,6 +39,11 @@
> > > > > >  #include "qemu/xxhash.h"
> > > > > >  #include <math.h>
> > > > > >
> > > > > > +#ifdef CONFIG_WIN32
> > > > > > +#define UTIME_NOW   ((1l << 30) - 1l)
> > > > > > +#define UTIME_OMIT  ((1l << 30) - 2l) #endif
> > > > > > +
> > > > > >  int open_fd_hw;
> > > > > >  int total_open_fd;
> > > > > >  static int open_fd_rc;
> > > > > > @@ -132,13 +137,17 @@ static int dotl_to_open_flags(int flags)
> > > > > >      DotlOpenflagMap dotl_oflag_map[] =3D {
> > > > > >          { P9_DOTL_CREATE, O_CREAT },
> > > > > >          { P9_DOTL_EXCL, O_EXCL },
> > > > > > +#ifndef CONFIG_WIN32
> > > > > >          { P9_DOTL_NOCTTY , O_NOCTTY },
> > > > > > +#endif
> > > > > >          { P9_DOTL_TRUNC, O_TRUNC },
> > > > > >          { P9_DOTL_APPEND, O_APPEND },
> > > > > > +#ifndef CONFIG_WIN32
> > > > > >          { P9_DOTL_NONBLOCK, O_NONBLOCK } ,
> > > > > >          { P9_DOTL_DSYNC, O_DSYNC },
> > > > > >          { P9_DOTL_FASYNC, FASYNC }, -#ifndef CONFIG_DARWIN
> > > > > > +#endif
> > > > > > +#ifdef CONFIG_LINUX
> > > > >
> > > > > Better
> > > > >
> > > > >    #if !defined(CONFIG_DARWIN) && !defined(CONFIG_WIN32)
> > > > >
> > > >
> > > > It is OK.
> > >
> > > You got my point, hopefully:
> > >
> > > > > Otherwise it might automatically opt-out other future platforms
> > > > > unintentionally.
> > > > >
> > > > > >          { P9_DOTL_NOATIME, O_NOATIME },
> > > > > >          /*
> > > > > >           *  On Darwin, we could map to F_NOCACHE, which is @@
> > > > > > -151,8
> > > > > > +160,10 @@ static int dotl_to_open_flags(int flags)  #endif
> > > > > >          { P9_DOTL_LARGEFILE, O_LARGEFILE },
> > > > > >          { P9_DOTL_DIRECTORY, O_DIRECTORY },
> > > > > > +#ifndef CONFIG_WIN32
> > > > > >          { P9_DOTL_NOFOLLOW, O_NOFOLLOW },
> > > > > >          { P9_DOTL_SYNC, O_SYNC },
> > > > > > +#endif
> > > > > >      };
> > > > > >
> > > > > >      for (i =3D 0; i < ARRAY_SIZE(dotl_oflag_map); i++) { @@
> > > > > > -179,8
> > > > > > +190,11 @@ static int get_dotl_openflags(V9fsState *s, int
> > > > > > +oflags)
> > > > > >       * Filter the client open flags
> > > > > >       */
> > > > > >      flags =3D dotl_to_open_flags(oflags);
> > > > > > -    flags &=3D ~(O_NOCTTY | O_ASYNC | O_CREAT);
> > > > > > -#ifndef CONFIG_DARWIN
> > > > > > +    flags &=3D ~(O_CREAT);
> > > > > > +#ifndef CONFIG_WIN32
> > > > > > +    flags &=3D ~(O_NOCTTY | O_ASYNC); #endif #ifdef
> > > > > > +CONFIG_LINUX
> > > > >
> > > > > Same as above: better explicitly opt-out than the other way aroun=
d.
> > > > >
> > > >
> > > > It is OK.
> > > >
> > > > > >      /*
> > > > > >       * Ignore direct disk access hint until the server support=
s it.
> > > > > >       */
> > > > > > @@ -986,9 +1000,11 @@ static int stat_to_qid(V9fsPDU *pdu,
> > > > > > const struct
> > > > > stat *stbuf, V9fsQID *qidp)
> > > > > >      if (S_ISDIR(stbuf->st_mode)) {
> > > > > >          qidp->type |=3D P9_QID_TYPE_DIR;
> > > > > >      }
> > > > > > +#ifndef CONFIG_WIN32
> > > > > >      if (S_ISLNK(stbuf->st_mode)) {
> > > > > >          qidp->type |=3D P9_QID_TYPE_SYMLINK;
> > > > > >      }
> > > > > > +#endif
> > > > > >
> > > > > >      return 0;
> > > > > >  }
> > > > > > @@ -1097,6 +1113,7 @@ static mode_t v9mode_to_mode(uint32_t
> > > > > > mode,
> > > > > V9fsString *extension)
> > > > > >          ret |=3D S_IFDIR;
> > > > > >      }
> > > > > >
> > > > > > +#ifndef CONFIG_WIN32
> > > > > >      if (mode & P9_STAT_MODE_SYMLINK) {
> > > > > >          ret |=3D S_IFLNK;
> > > > > >      }
> > > > > > @@ -1106,6 +1123,7 @@ static mode_t v9mode_to_mode(uint32_t
> > > > > > mode,
> > > > > V9fsString *extension)
> > > > > >      if (mode & P9_STAT_MODE_NAMED_PIPE) {
> > > > > >          ret |=3D S_IFIFO;
> > > > > >      }
> > > > > > +#endif
> > > > > >      if (mode & P9_STAT_MODE_DEVICE) {
> > > > > >          if (extension->size && extension->data[0] =3D=3D 'c') =
{
> > > > > >              ret |=3D S_IFCHR;
> > > > > > @@ -1118,6 +1136,7 @@ static mode_t v9mode_to_mode(uint32_t
> > > > > > mode,
> > > > > V9fsString *extension)
> > > > > >          ret |=3D S_IFREG;
> > > > > >      }
> > > > > >
> > > > > > +#ifndef CONFIG_WIN32
> > > > > >      if (mode & P9_STAT_MODE_SETUID) {
> > > > > >          ret |=3D S_ISUID;
> > > > > >      }
> > > > > > @@ -1127,6 +1146,7 @@ static mode_t v9mode_to_mode(uint32_t
> > > > > > mode,
> > > > > V9fsString *extension)
> > > > > >      if (mode & P9_STAT_MODE_SETVTX) {
> > > > > >          ret |=3D S_ISVTX;
> > > > > >      }
> > > > > > +#endif
> > > > > >
> > > > > >      return ret;
> > > > > >  }
> > > > > > @@ -1182,6 +1202,7 @@ static uint32_t stat_to_v9mode(const
> > > > > > struct stat
> > > > > *stbuf)
> > > > > >          mode |=3D P9_STAT_MODE_DIR;
> > > > > >      }
> > > > > >
> > > > > > +#ifndef CONFIG_WIN32
> > > > > >      if (S_ISLNK(stbuf->st_mode)) {
> > > > > >          mode |=3D P9_STAT_MODE_SYMLINK;
> > > > > >      }
> > > > > > @@ -1193,11 +1214,13 @@ static uint32_t stat_to_v9mode(const
> > > > > > struct stat
> > > > > *stbuf)
> > > > > >      if (S_ISFIFO(stbuf->st_mode)) {
> > > > > >          mode |=3D P9_STAT_MODE_NAMED_PIPE;
> > > > > >      }
> > > > > > +#endif
> > > > > >
> > > > > >      if (S_ISBLK(stbuf->st_mode) || S_ISCHR(stbuf->st_mode)) {
> > > > > >          mode |=3D P9_STAT_MODE_DEVICE;
> > > > > >      }
> > > > > >
> > > > > > +#ifndef CONFIG_WIN32
> > > > > >      if (stbuf->st_mode & S_ISUID) {
> > > > > >          mode |=3D P9_STAT_MODE_SETUID;
> > > > > >      }
> > > > > > @@ -1209,6 +1232,7 @@ static uint32_t stat_to_v9mode(const
> > > > > > struct stat
> > > > > *stbuf)
> > > > > >      if (stbuf->st_mode & S_ISVTX) {
> > > > > >          mode |=3D P9_STAT_MODE_SETVTX;
> > > > > >      }
> > > > > > +#endif
> > > > > >
> > > > > >      return mode;
> > > > > >  }
> > > > > > @@ -1247,9 +1271,17 @@ static int coroutine_fn
> > > > > > stat_to_v9stat(V9fsPDU *pdu,
> > > > > V9fsPath *path,
> > > > > >              return err;
> > > > > >          }
> > > > > >      } else if (v9stat->mode & P9_STAT_MODE_DEVICE) {
> > > > > > +        unsigned maj, min;
> > > > > > +
> > > > > > +#ifndef CONFIG_WIN32
> > > > > > +        maj =3D major(stbuf->st_rdev);
> > > > > > +        min =3D minor(stbuf->st_rdev); #else
> > > > > > +        maj =3D min =3D 0;
> > > > > > +#endif
> > > > >
> > > > > Really?
> > > >
> > > > See above link.
> > > >
> > > > >
> > > > > >          v9fs_string_sprintf(&v9stat->extension, "%c %u %u",
> > > > > >                  S_ISCHR(stbuf->st_mode) ? 'c' : 'b',
> > > > > > -                major(stbuf->st_rdev), minor(stbuf->st_rdev));
> > > > > > +                maj, min);
> > > > > >      } else if (S_ISDIR(stbuf->st_mode) || S_ISREG(stbuf->st_mo=
de))
> {
> > > > > >          v9fs_string_sprintf(&v9stat->extension, "%s %lu",
> > > > > >                  "HARDLINKCOUNT", (unsigned
> > > > > > long)stbuf->st_nlink); @@
> > > > > > -1317,7 +1349,14 @@ static int32_t blksize_to_iounit(const
> > > > > > V9fsPDU *pdu, int32_t blksize)
> > > > > >
> > > > > >  static int32_t stat_to_iounit(const V9fsPDU *pdu, const
> > > > > > struct stat
> > > > > > *stbuf)  {
> > > > > > -    return blksize_to_iounit(pdu, stbuf->st_blksize);
> > > > > > +    int32_t blksize;
> > > > > > +
> > > > > > +#ifndef CONFIG_WIN32
> > > > > > +    blksize =3D stbuf->st_blksize); #else
> > > > > > +    blksize =3D 0;
> > > > > > +#endif
> > > > >
> > > > > Really?
> > > >
> > > > Windows struct stat does not have such field. See above link.
> > >
> > > Yeah, but you cannot simply return zero here, because that
> > > information is interpreted on guest side as the optimum chunk size
> > > for I/O. So some apps might misbehave e.g. by trying allocate
> > > buffers with zero size, throwing division by zero exceptions, or
> > > trying to read() / write() with zero chunk size.
> > >
> > > I'm pretty sure there is some kind of API to get the block size of
> > > the underlying drive on Windows. And if not, then something like 4k
> > > or 8k is still better than zero.
> > >
> >
> > The possible solution could be put a hard-code (e.g. 4096, 512) here.
> > This function does not have any context parameter for input.
> > To get block size, need a file handle or path. But this function does n=
ot
> have it.
>=20
> Another major difference on Windows compared to other systems is that you
> don't have to worry about potential submounts in the exported directory t=
ree.
> Because Windows does not have that concept. So on Windows you can assume =
that
> all files of the exported file tree are on the same storage device, right=
?
>=20
> So another solution would be to query the block size with a regular Windo=
ws
> API only on startup, simply by using the export root, and then storing th=
at
> block size e.g. as a new member variable to struct V9fsState.
>=20
> In the end you could actually also use some meaningful hard coded value f=
or
> now, as it is not such of a big deal whether that's 512, 4k or 8k. But ze=
ro
> is clearly a no go, for the reasons previously described.
>=20

Got it, thanks!

> > > > >
> > > > > > +    return blksize_to_iounit(pdu, blksize);
> > > > > >  }
> > > > > >
> > > > > >  static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct
> > > > > > stat *stbuf, @@ -1332,7 +1371,11 @@ static int
> > > > > > stat_to_v9stat_dotl(V9fsPDU *pdu,
> > > > > const struct stat *stbuf,
> > > > > >      v9lstat->st_rdev =3D host_dev_to_dotl_dev(stbuf->st_rdev);
> > > > > >      v9lstat->st_size =3D stbuf->st_size;
> > > > > >      v9lstat->st_blksize =3D stat_to_iounit(pdu, stbuf);
> > > > > > +#ifndef CONFIG_WIN32
> > > > > >      v9lstat->st_blocks =3D stbuf->st_blocks;
> > > > > > +#else
> > > > > > +    v9lstat->st_blocks =3D 0;
> > > > > > +#endif
> > > > >
> > > > > Really?
> > > >
> > > > Windows struct stat does not have such field. See above link.
> > >
> > > Then it probably has to be calculated by file size / block size.
> >
> > Got it.
> >
> > >
> > > > >
> > > > > >      v9lstat->st_atime_sec =3D stbuf->st_atime;
> > > > > >      v9lstat->st_mtime_sec =3D stbuf->st_mtime;
> > > > > >      v9lstat->st_ctime_sec =3D stbuf->st_ctime; @@ -1340,7
> > > > > > +1383,8 @@ static int stat_to_v9stat_dotl(V9fsPDU *pdu, const
> > > > > > struct stat
> > > *stbuf,
> > > > > >      v9lstat->st_atime_nsec =3D stbuf->st_atimespec.tv_nsec;
> > > > > >      v9lstat->st_mtime_nsec =3D stbuf->st_mtimespec.tv_nsec;
> > > > > >      v9lstat->st_ctime_nsec =3D stbuf->st_ctimespec.tv_nsec;
> > > > > > -#else
> > > > > > +#endif
> > > > > > +#ifdef CONFIG_LINUX
> > > > > >      v9lstat->st_atime_nsec =3D stbuf->st_atim.tv_nsec;
> > > > > >      v9lstat->st_mtime_nsec =3D stbuf->st_mtim.tv_nsec;
> > > > > >      v9lstat->st_ctime_nsec =3D stbuf->st_ctim.tv_nsec; @@
> > > > > > -2471,6
> > > > > > +2515,7 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU
> > > > > > +*pdu,
> > > > > V9fsFidState *fidp,
> > > > > >      struct dirent *dent;
> > > > > >      struct stat *st;
> > > > > >      struct V9fsDirEnt *entries =3D NULL;
> > > > > > +    unsigned char d_type =3D 0;
> > > > > >
> > > > > >      /*
> > > > > >       * inode remapping requires the device id, which in turn
> > > > > > might be @@ -2540,10 +2585,13 @@ static int coroutine_fn
> > > > > > v9fs_do_readdir(V9fsPDU
> > > > > *pdu, V9fsFidState *fidp,
> > > > > >          v9fs_string_init(&name);
> > > > > >          v9fs_string_sprintf(&name, "%s", dent->d_name);
> > > > > >
> > > > > > +#ifndef CONFIG_WIN32
> > > > > > +        d_type =3D dent->d_type; #endif
> > > > > >          /* 11 =3D 7 + 4 (7 =3D start offset, 4 =3D space for
> > > > > > storing count)
> > > */
> > > > > >          len =3D pdu_marshal(pdu, 11 + count, "Qqbs",
> > > > > >                            &qid, off,
> > > > > > -                          dent->d_type, &name);
> > > > > > +                          d_type, &name);
> > > > >
> > > > > Are you saying that d_type is not initialized with zero already?
> > > >
> > > > struct dirent is defined by MinGW, it does not have d_type member:
> > > >
> > > > https://github.com/Alexpux/mingw-w64/blob/master/mingw-w64-headers
> > > > /crt
> > > > /dirent.h
> > >
> > > My bad, I misread your code. That's fine.
> > >
> > > >
> > > > >
> > > > > >          v9fs_string_free(&name);
> > > > > >
> > > > > > @@ -2873,8 +2921,12 @@ static void coroutine_fn
> > > > > > v9fs_create(void
> > > *opaque)
> > > > > >          }
> > > > > >
> > > > > >          nmode |=3D perm & 0777;
> > > > > > +#ifndef CONFIG_WIN32
> > > > > >          err =3D v9fs_co_mknod(pdu, fidp, &name, fidp->uid, -1,
> > > > > >                              makedev(major, minor), nmode,
> > > > > > &stbuf);
> > > > > > +#else
> > > > > > +        err =3D -ENOTSUP;
> > > > > > +#endif
> > > > > >          if (err < 0) {
> > > > > >              goto out;
> > > > > >          }
> > > > > > @@ -2899,8 +2951,12 @@ static void coroutine_fn
> > > > > > v9fs_create(void
> > > *opaque)
> > > > > >          v9fs_path_copy(&fidp->path, &path);
> > > > > >          v9fs_path_unlock(s);
> > > > > >      } else if (perm & P9_STAT_MODE_SOCKET) {
> > > > > > +#ifndef CONFIG_WIN32
> > > > > >          err =3D v9fs_co_mknod(pdu, fidp, &name, fidp->uid, -1,
> > > > > >                              0, S_IFSOCK | (perm & 0777),
> > > > > > &stbuf);
> > > > > > +#else
> > > > > > +        err =3D -ENOTSUP;
> > > > > > +#endif
> > > > >
> > > > > As with previous patches, I would consider making the user aware
> > > > > to use
> > > > > mapped(-xattr) with something like error_report_once().
> > > >
> > > > OK, got it.
> > > >
> > > > >
> > > > > >          if (err < 0) {
> > > > > >              goto out;
> > > > > >          }
> > > > > > @@ -3634,7 +3690,7 @@ out_nofid:
> > > > > >
> > > > > >  static void coroutine_fn v9fs_mknod(void *opaque)  {
> > > > > > -
> > > > > > +#ifndef CONFIG_WIN32
> > > > > >      int mode;
> > > > > >      gid_t gid;
> > > > > >      int32_t fid;
> > > > > > @@ -3691,6 +3747,10 @@ out:
> > > > > >  out_nofid:
> > > > > >      pdu_complete(pdu, err);
> > > > > >      v9fs_string_free(&name);
> > > > > > +#else
> > > > > > +    V9fsPDU *pdu =3D opaque;
> > > > > > +    pdu_complete(pdu, -1);
> > > > > > +#endif
> > > > > >  }
> > > > > >
> > > > > >  /*
> > > > > > @@ -3963,7 +4023,7 @@ out_nofid:
> > > > > >  #if defined(CONFIG_LINUX)
> > > > > >  /* Currently, only Linux has XATTR_SIZE_MAX */  #define
> > > > > > P9_XATTR_SIZE_MAX XATTR_SIZE_MAX -#elif defined(CONFIG_DARWIN)
> > > > > > +#elif defined(CONFIG_DARWIN) || defined(CONFIG_WIN32)
> > > > > >  /*
> > > > > >   * Darwin doesn't seem to define a maximum xattr size in its u=
ser
> > > > > >   * space header, so manually configure it across platforms as =
64k.
> > > > > > @@ -3980,6 +4040,7 @@ out_nofid:
> > > > > >
> > > > > >  static void coroutine_fn v9fs_xattrcreate(void *opaque)  {
> > > > > > +#ifndef CONFIG_WIN32
> > > > > >      int flags, rflags =3D 0;
> > > > > >      int32_t fid;
> > > > > >      uint64_t size;
> > > > > > @@ -4041,10 +4102,15 @@ out_put_fid:
> > > > > >  out_nofid:
> > > > > >      pdu_complete(pdu, err);
> > > > > >      v9fs_string_free(&name);
> > > > > > +#else
> > > > > > +    V9fsPDU *pdu =3D opaque;
> > > > > > +    pdu_complete(pdu, -1);
> > > > > > +#endif
> > > > > >  }
> > > > > >
> > > > > >  static void coroutine_fn v9fs_readlink(void *opaque)  {
> > > > > > +#ifndef CONFIG_WIN32
> > > > > >      V9fsPDU *pdu =3D opaque;
> > > > > >      size_t offset =3D 7;
> > > > > >      V9fsString target;
> > > > > > @@ -4080,6 +4146,10 @@ out:
> > > > > >      put_fid(pdu, fidp);
> > > > > >  out_nofid:
> > > > > >      pdu_complete(pdu, err);
> > > > > > +#else
> > > > > > +    V9fsPDU *pdu =3D opaque;
> > > > > > +    pdu_complete(pdu, -1);
> > > > > > +#endif
> > > > >
> > > > > Unnecessary double declaration of pdu.
> > > > >
> > > >
> > > > OK, got it.
> > > >
> > > > > >  }
> > > > > >
> > > > > >  static CoroutineEntry *pdu_co_handlers[] =3D { @@ -4341,6
> > > > > > +4411,7 @@ void v9fs_reset(V9fsState *s)
> > > > > >
> > > > > >  static void __attribute__((__constructor__))
> > > > > > v9fs_set_fd_limit(void) {
> > > > > > +#ifndef CONFIG_WIN32
> > > > > >      struct rlimit rlim;
> > > > > >      if (getrlimit(RLIMIT_NOFILE, &rlim) < 0) {
> > > > > >          error_report("Failed to get the resource limit"); @@
> > > > > > -4348,4
> > > > > > +4419,5 @@ static void __attribute__((__constructor__))
> > > > > v9fs_set_fd_limit(void)
> > > > > >      }
> > > > > >      open_fd_hw =3D rlim.rlim_cur - MIN(400, rlim.rlim_cur / 3)=
;
> > > > > >      open_fd_rc =3D rlim.rlim_cur / 2;
> > > > > > +#endif
> > > > >
> > > > > Really?
> > > >
> > > > Windows does not provide getrlimit()
> > >
> > > But it has _getmaxstdio() and _setmaxstdio().
> > >
> > > And even if Windows had no replacement functions, you need to
> > > initialize these two global variables with some meaningful value.
> > > Otherwise they would be zero, and that would mean 9p server would
> > > assume max. 0 files could be open at the same time, so it would
> > > constantly close and re-open every single file descriptor on every mi=
nor
> micro-transaction for no reason.
> >
> > I could implement this function by _getmaxstdio() and _setmaxstdio().
> > But these two functions are used for struct FILE, but not file descript=
or
> (FD).
> > I wrote a basic test for this function:
> >   _getmaxstdio() returns 512, but I can use "open" to open at least 600
> files without error.
> >
> > Windows does not provide any document about the limititaion.
> >
> > I think we can put a hard code here: 512, 1024, 2048, etc.
>=20
> Yeah, that's pretty badly documented, I agree. The fact that it's prefixe=
d
> with an underscore suggests that they were probably not too convinced abo=
ut
> their API either. But it is as it is.
>=20
> The fact that you can open a bit more files than what this function
> advertises is not a huge surprise or speaking against using it though.
> Because it is not untypical for systems to allow overallocation of system
> resources to a certain extent.
>=20
> At least from what I can see right now, this function is commonly used on
> Windows to get exactly that metric. So I would rather use that than using
> hard coded values, because from what I can see on the web, the numbers pe=
ople
> got experimentally are varying quite a bit.
>=20

Got it.

Thanks
Guohuai

> Best regards,
> Christian Schoenebeck
>=20



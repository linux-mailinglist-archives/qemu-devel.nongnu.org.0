Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD87D68DF7D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 18:56:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPSCU-0000bt-Oh; Tue, 07 Feb 2023 12:56:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=14024ddd48=guohuai.shi@windriver.com>)
 id 1pPSCN-0000bj-Fm
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 12:56:07 -0500
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=14024ddd48=guohuai.shi@windriver.com>)
 id 1pPSCI-0007ye-1t
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 12:56:07 -0500
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 317CFdeX012668; Tue, 7 Feb 2023 17:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=lAkXpBqm+bf9ehCCTlOJ+vyrjhRnmdRMTKvgduPDJBM=;
 b=Pw9RUdJWMQ1tyd8EKBdOzlfTDIo6i+tryDvn5PbwX+YAk6oqFz1bZIk4vwPd0WiQQScT
 +59aXpvL7vvutOF95SV+XgptKXTcVAvaCh6A5FValBpYFLR7IZt9E0ZujQIgzliN8wGc
 o8OWE9ZiDaO/jAjcOIGBMwLuNYyJ09iQmreXWbY5ZvgOc6jKbV113HltwbI9mDt7SsYs
 hbJwd362j+0yXUEl062lUWB94n+NJayK2RSZrmLS1HrBwPnx3SWIt0tame3RT8cDSM/T
 Zh+eMKfoxN9m0gg48msp9QepbPm4o6ajI8wtkay71uh982mhNPadphpdhQ1Mt+1oFETS eA== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nhebab526-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Feb 2023 17:55:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OEWVoQIz84XuspFnphv5GjzsUu9Wl08fXbPQiiKd1dz/pweDJYxMFhq84VNYTkKZcSh6DnXjDCeQjovic+CRMC73dwQHXn9bNx+sNBwXOa2M3drX1Q6y043lPce0AOPwY6m1Fi1YuYXY3suc9pIOEhy+/sNan0ELwQ271iUtSCM9XMhUfnYrDnQUiWp0n9FT2MMYkam32GqDfXoFZ6sq8RR7xOW0XD0wW2TGu0DbsogQLOZ/u/v1zI8iSKNNCylKkzAkyIdD0RZm+ei7GwGOxDOgMd6yUJCA054lIPN2ncNrpn/3QBaEkXwy/NRgGULcSK9PAc8UETCiVoUMSR9wlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lAkXpBqm+bf9ehCCTlOJ+vyrjhRnmdRMTKvgduPDJBM=;
 b=EcgzHTw/rRmZayFPp+A942mFaABE9FEibpF1mh7pLaZFBmxxPlsrNhvZWeMEarPGT22yzolk+j9Gt4uKevYF71x2lnOyyNEbMzW4RIHQa9xWuxjC3DCvE+15A48SRv1yShwK0M0p7RHctlKo7UJBvI5wQL+oah0825XzX5xwqdppiCOW0lOKZ65wGHzPnziLxYk1AMzR7L5La37w49WYnJVCTy3/1lRx7uQmfPzAvD9DdqdAVdQ5JfFZUhRelP5EL9pxtwa1rpoKFx0Gj2fcsVYljOVOhTQQM/wK67CexBaYVtmEtjd74pmnS1maAvmB8m+LHlnDfeXOpHH+K4FV0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN2PR11MB4173.namprd11.prod.outlook.com (2603:10b6:208:137::20)
 by DM6PR11MB4658.namprd11.prod.outlook.com (2603:10b6:5:28f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Tue, 7 Feb
 2023 17:55:42 +0000
Received: from MN2PR11MB4173.namprd11.prod.outlook.com
 ([fe80::2d69:6276:f527:9fb4]) by MN2PR11MB4173.namprd11.prod.outlook.com
 ([fe80::2d69:6276:f527:9fb4%7]) with mapi id 15.20.6064.036; Tue, 7 Feb 2023
 17:55:42 +0000
From: "Shi, Guohuai" <Guohuai.Shi@windriver.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "Meng, Bin" <Bin.Meng@windriver.com>, =?iso-8859-1?Q?Marc-Andr=E9_Lureau?=
 <marcandre.lureau@redhat.com>, =?iso-8859-1?Q?Daniel_P=2E_Berrang=E9?=
 <berrange@redhat.com>
Subject: RE: [PATCH v4 04/16] hw/9pfs: Implement Windows specific xxxdir() APIs
Thread-Topic: [PATCH v4 04/16] hw/9pfs: Implement Windows specific xxxdir()
 APIs
Thread-Index: AQHZNJCQ5QDQDl+c2UWDW8VIOF7gh669K9gAgAAOB2CAABf+gIAADomAgAAn3wCAA7nRcIACDeKAgAB30IA=
Date: Tue, 7 Feb 2023 17:55:41 +0000
Message-ID: <MN2PR11MB4173AE2B88F4298B910961BAEFDB9@MN2PR11MB4173.namprd11.prod.outlook.com>
References: <20230130095202.2773186-1-bin.meng@windriver.com>
 <3667674.co3Lnhysxx@silver>
 <MN2PR11MB4173960A520976B15946CCEBEFDA9@MN2PR11MB4173.namprd11.prod.outlook.com>
 <4342819.egquFENVeL@silver>
In-Reply-To: <4342819.egquFENVeL@silver>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4173:EE_|DM6PR11MB4658:EE_
x-ms-office365-filtering-correlation-id: 40080356-9209-4541-667c-08db09348790
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zpOu93cdWHrqGJ1sj+nJ5TzoMGIs+igwYK+fvPIWxSRTMKNOusDcoa+vCMKuUHDq5u0zsFpW+f4sZ07TSOba/Z9eY2ZNQOq2//WbtAGxSRkIiYnoatm0Y9amhCcmxWVWdkiLjD2w3g4co+ykzWBN3VyaPrkfUEgLtuQerqmf8i04mXUFUmzFxl3pH1IuyrvLDzi1gGR50HPgCo05Z/sbYkT+UC67bNdj//4HzNbY3uK5qg/qbRIVD6+PS31d0HuHUDxOkBJHhloA3ubN4VBJaGqzaxOA3SDEiakwJni47T7AQzkxQZ3dxdXCfux5ygipp29CZKSICRC6rGelhbdrFsBkRI7r7sC7aoIuvAbdn0vsb7e0L4SzHw92ZV62GFWPjRt+jQyeQMvI3CMmsMhGXo7WIq/uesQ56SCn9GCpH9wvu57GkXRqbNgV5oreL4zmw0hy8mxn8ICxnIqkDSCHn/XyhxS0LWW9Obs5pEbSUs/+CfRmBF+kMbkyiZvo0vLcREKIAqZMc5KLWbmNGd2gVluTs0M4OP+ljihjOD1ExPW0N0wNYazNAvQkAFjtx0XhtqqrvV08G1cZOv2L55vMqZFUckzyBkFikZDWMV3yPGJANqME8Ko+KxitMoVfuYWnL4YcZzGoyW/97Mrna/dm/Oo4Kr2tWrw2r1mebuDkrjT8WrHlI/8q4Ffhj92vsjXdoYUa/rS1iCDonex8MpyeVbsdpoEdQZCDVuUCfSsSw1Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4173.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(396003)(39850400004)(376002)(346002)(136003)(451199018)(53546011)(33656002)(122000001)(38100700002)(38070700005)(26005)(6506007)(186003)(9686003)(966005)(86362001)(83380400001)(4326008)(66946007)(66556008)(8676002)(66476007)(7696005)(71200400001)(64756008)(54906003)(316002)(55016003)(76116006)(478600001)(110136005)(66446008)(2906002)(5660300002)(41300700001)(52536014)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?At97aGJkZ+X5ysLdpYJvMewAtLKrzA089qVp+gNOYjkRLoYTcaCJ0A1lvp?=
 =?iso-8859-1?Q?mq6l73PzVT1gkstGKB8dM0YUJMOlSyO8W9NgMUnr2XMUAyRXmjVBajk4NB?=
 =?iso-8859-1?Q?0rSt7+rT738C8qQst1tl732rZ+zWmcjJhEs13cO37jXicIUFOxWJt6pMlh?=
 =?iso-8859-1?Q?RKj9r+lJ+oESswHSlU/yfQ+GKvLZUvi74rXAx6+2fhyO7Gs+RW/O8K34A2?=
 =?iso-8859-1?Q?CH8F8G1MIEMTz5S6tF6GNjfzCdJwkjP6Zf7UNU5/2YLflHznSpOEBK9GER?=
 =?iso-8859-1?Q?OxAxerW8RThrqKznIG+RWHFLT93zRjk/fZuoPmm5XffwAr2GRm8+3eKpGw?=
 =?iso-8859-1?Q?VIW0z6MCPQcb2V8UWnlA5QLYPiCstSyCzMyFsFNWZcvepr5+Jp4j+s58wF?=
 =?iso-8859-1?Q?MbDYp20qLJY+Exn9H0OrEehrj1Kwj9cbq8r/TpSTeEldM7RYSWIRFUFTj4?=
 =?iso-8859-1?Q?J7meABy8d3906d5No69drSCIVJgd3ji5St3udLbku0F4jb2JQDajmfzztt?=
 =?iso-8859-1?Q?HrVq9iC7Zl8yx4heuEY7BNmNWlrXT3HCUzzQ+yKMjHsoZ3j4lQw6ytV6Jd?=
 =?iso-8859-1?Q?N4FNXmqndxUUKYQqZDIMEdB7Ddr5HZQEBjNPJYR2utVzVjmRNxwnk8JrAw?=
 =?iso-8859-1?Q?Td3zeS8DzsZPRFep1c/wKWHtCmUlQnwA0t3HiF2lLTGahqPusq8Rt55Y1J?=
 =?iso-8859-1?Q?OVcrqncgszRPpuIIjcuA20kqSkpwf7t+b4x7WpXH3E3S0YY820F2DcxAzt?=
 =?iso-8859-1?Q?YBfsun3f3BmmxxzHXMYXlDKhSMZU/zeFZ1Kku0VAfLCnK0WI2zD9WuYiU4?=
 =?iso-8859-1?Q?Wo3a3itdpmtw9eKnBrCwfufnhZ7HNQHsrvPDD4O1KfucE+brK1tGWc52st?=
 =?iso-8859-1?Q?iGBRnvviyLcZ5r0ljUyW2ybC/gqffEQb0M84Yc6EVx++kbOmLwcSZHrudO?=
 =?iso-8859-1?Q?DiO8u1MFMXTcZkGiOq1KovKLmjIkI72v3F55salI5lZY4SCoL1ma6l2Pt0?=
 =?iso-8859-1?Q?riGx+LaFbSCSXXltZCDF/sQk8UlNoZkY7eHn2B9atl7sJ4N5Wou0f5LDje?=
 =?iso-8859-1?Q?bpqlJSHJP7uoDGQRnBbN/nSEvqpauAAKkvZPw/0qGiacUbS5OsxB3n4B/i?=
 =?iso-8859-1?Q?5SgXfTR2AB2CvjTMchFUygONzUUJjk8FxaKkE2ByvGnQfyzRSilDAHE4yJ?=
 =?iso-8859-1?Q?Xn+8y5cvx1hE/UfOvxcIfovvRPH2zNRsyW23f5xSdoPZfhitqNtlh5UXVt?=
 =?iso-8859-1?Q?dqJlVtdwKa3DYuBi+/DzKpL8FpNkvPUfmt0tXVpn42uAUl4H80Dq18iyI/?=
 =?iso-8859-1?Q?odyo5iVxyGe2mwrfCAR9lFGJg5FEvHQxFDaHk1qFnCLAwgUkj8Hr1frces?=
 =?iso-8859-1?Q?UZciIe0xDgr8nAmEdiePyZxaMwPMj+Ab1n7pCR/5Pxx5Gwo0sonKTsZ39a?=
 =?iso-8859-1?Q?igcLSfjKPGwqQykmSPY56BtvvBNabr5Z87ClSEBgllEHNSz8ujc35EJQ2Q?=
 =?iso-8859-1?Q?GOkImodqRaDEtLJPtMTGFEXbcEVkLSQN5lM4HNeLfgYi+xV/0eAGEdvO0J?=
 =?iso-8859-1?Q?fXTSPW5OVlJh7Rnaz8cQ5GgOyG4Sx+x/w9gbdx2IwkcPraSsKxuZShKSu4?=
 =?iso-8859-1?Q?bWY25C0Uk8wd9ioocOWzW8MUU102+F1u52764WBpJ/XXzScnW5tCNJLQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4173.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40080356-9209-4541-667c-08db09348790
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2023 17:55:42.0081 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gQqkPEIH+JO9hlbp0ddp8b6pzSMJTdo+PAx1dajJn4zzHAB8Zbb0Og7D8HrKTNdzSU8MbiPFfV6FLenRobxPi1UwoTQBu5Xcw+Yre5vnix8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4658
X-Proofpoint-ORIG-GUID: fuY_X_VB4wlV1BCDeUOQwayAXcEIGtp_
X-Proofpoint-GUID: fuY_X_VB4wlV1BCDeUOQwayAXcEIGtp_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_09,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=773 adultscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302070159
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=14024ddd48=guohuai.shi@windriver.com;
 helo=mx0b-0064b401.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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



> -----Original Message-----
> From: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Sent: Tuesday, February 7, 2023 18:12
> To: Greg Kurz <groug@kaod.org>; qemu-devel@nongnu.org
> Cc: Meng, Bin <Bin.Meng@windriver.com>; Marc-Andr=E9 Lureau
> <marcandre.lureau@redhat.com>; Daniel P. Berrang=E9 <berrange@redhat.com>=
; Shi,
> Guohuai <Guohuai.Shi@windriver.com>
> Subject: Re: [PATCH v4 04/16] hw/9pfs: Implement Windows specific xxxdir(=
)
> APIs
>=20
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d
> know the content is safe.
>=20
> On Monday, February 6, 2023 6:37:16 AM CET Shi, Guohuai wrote:
> [...]
> > > I know, it's an n-square performance issue and what I already wrote
> > > in the summary of the linked original suggestion [1] in v3 before, qu=
ote:
> > >
> > >   + Relatively straight-forward to implement.
> > >
> > >   + No (major) changes in 9pfs code base required.
> > >
> > >   - Still n-square performance issue (neglectable to land Windows
> > > host support
> > >     IMO).
> > >
> > >   o Consistency assured for "most" cases, except one: if hardlinks ar=
e
> > >     inserted in between then it might fail
> >
> > readdir() on Linux host may also return the deleted entries.
> > And POSIX specification does not mention about the consistency issue.
>=20
> POSIX explicitly specifies that 1. new and 2. deleted entries may or may =
not
> appear in result and leaves that implementation specific. That was never =
our
> concern.
>=20
> And yes, POSIX does not explicitly discuss consistency concerning entries
> that have neither been added or removed, but this expectation is implied.=
 In
> practice double entries are probably less of an issue, client might be ab=
le
> to handle that without misbehaviour (haven't checked this at all yet), bu=
t if
> the implementation would lead to chances that entries may *never* appear =
to
> clients at all, even after refreshing periodically, I mean how could you =
work
> with a file system like that?
>=20
> > NTFS file id is the $MFT index id. It will keen unique until file is
> deleted.
> > But the index id may be reuse if delete and re-create many files.
> >
> > Saving file id instead of name will make consistency better, but may no=
t
> cover all status.
> > Because read directory is not a "atomic" operation.
>=20
> I don't see an issue with that, because these are entries that were eithe=
r
> added or removed, we don't care about them. And their file IDs would not
> affect fetching the other directory entries that have not been touched in
> between.
>=20
> And we are also not questioning atomicity here, but consistency.
>=20
> > > [1] https://lore.kernel.org/qemu-devel/2468168.SvRIHAoRfs@silver/
> > >
> > > The idea was to use that just as a starting point to land Windows
> > > host support ASAP, slower on large dirs compared to other solutions,
> > > yes, but with guaranteed correct and deterministic behaviour. And
> > > then on the long run we would of course replace that with a more
> performant solution.
> > >
> > > I mean, this is really simple to implement, so I would at least test
> > > it. If it really runs horribly slow we could still discuss faster
> > > solutions, which are however all much more tricky.
> > >
> >
> > I did a basic test on Windows host, here is the code:
> >
> >     st =3D clock();
> >     pDir =3D opendir_win32(TEST_DIR);
> >
> >     if (pDir =3D=3D NULL)
> >         return -1;
> >
> >     while ((pEnt =3D readdir_win32(pDir)) !=3D NULL)
> >     {
> >         totals++;
> >     }
> >     closedir_win32(pDir);
> >     ed =3D clock();
> >
> >     printf("total =3D %d clocks =3D %d %d\n", totals, ed - st,
> > CLOCKS_PER_SEC);
> >
> > My local storage is SSD disk.
> >
> > Run this test for 100, 1000, 10000 entries.
> > For file name cache solution, the time cost is: 2, 9, 44 (in ms).
> > For file id cache solution, the time cost: 3, 438, 4338 (in ms).
> > I already used OpenFileById() to make it faster instead of CreateFile()=
. If
> I use CreateFile, it need more than 80 seconds.
> >
> > The performance looks like not good.
> > And actually, it would be worse in 9pfs.
> > Because in current design, 9pfs  may seek forward and seek back several
> times during reading directory, which may cause the performance worse.
>=20
> Poor performance, yes, probably a bit worse than I would have expected.
>=20
> So it is about choosing your poison (potential crash vs. poor performance=
).
>=20
> I mean, I am not keen into suggesting any kind of bike shredding for you =
on
> this issue, but if this is merged, then people expect it to behave reliab=
ly
> and not allowing a guest to crash QEMU host process by simply creating a
> large number of directory entries on guest.
>=20
> I was also considering to make it a QEMU option, but OTOH, this is a
> temporary situation and those options would be wiped once we have an
> oppropriate solution a bit later.
>=20
> I am open for suggestions. Could we probably just mark Windows host suppo=
rt
> as experimental for now, is that even allowed by QEMU policies?

Yes, it is hard to choose:

a) 1 file id entry is 24 bytes, to reduce memory fragment, I used an array =
to store the file ids.
b) 1 file name entry is ~300 bytes, by using link list.

If there are 1-million files in one directory, a) need 24 MB continues memo=
ry buffer, b) need 300 MB memory (no need continues).
If there are 10-million files in one directory, a) need 240 MB continues me=
mory buffer, b) need 3 GB memory (no need continues).

Both #a and #b are need more and more memory buffer. If there no more free =
memory, opendir() will be failed.
However, is it a normal status that a directory contains more than 1-millio=
n files?

I will prepare an new version solution just for this commit with storing fi=
le id.
The new patch would be ready tomorrow.

Thanks
Guohuai

>=20
> > > > So I think store all name entries would be better than store all fi=
le
> ID.
> > >
> > > As already discussed, NTFS allows up to (2^32 - 1) =3D 4,294,967,295
> > > entries per directory. So caching only one directory (entirely) in
> > > RAM can already exceed the available RAM, which would crash QEMU.
> > > Multiplied by an expected amount of directory lookups by client and
> > > we even get into much higher categories, even with much smaller
> individual directory sizes.
> > >
> >
> > Windows file id structure is 24 bytes, which is not a small structure.
> > If you think the performance is acceptable, I can rework this commit ba=
sed
> on file id.
>=20



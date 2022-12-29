Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EED65899A
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 07:06:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAm1h-0004sd-5s; Thu, 29 Dec 2022 01:04:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=036282bf9b=guohuai.shi@windriver.com>)
 id 1pAm1c-0004sS-BB
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 01:04:21 -0500
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=036282bf9b=guohuai.shi@windriver.com>)
 id 1pAm1Z-0005cd-9h
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 01:04:20 -0500
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BT5tajZ001716; Thu, 29 Dec 2022 06:03:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=ZjBYdEcZPyauKF1QRM7/eki/xZAt7pwup890Jg9qcgo=;
 b=UjIuatt0fTzrRjMeVFpBd9Duow5sMrMkYFIeuaIGrgF2qDHRRwQ2ClMFyRYFppZQaXCa
 zwepYek/0r8jxDOMtXvDzokxgetXSCP7QC+a2YbJH9ZS+Umr+ko4R5qFgPA3k/i8Q4Rq
 lKLzynv5eoP0UGvoZBYbya5t3R1bYulbwPy7yc9lFynPY03V6zlpq2cGTyB9IOh0eE9N
 QIIi+iTAsKQpBWcFdqNskdsvr8VP9mIaeAVS9UvFVfHNci6f7jtw1HfzhR8YmnBVKgfM
 ZMBahb6+/Vsfp9cc+oEMpWgjq3uun+w+QbHP9QmCPliC3nDcAy/gCnnEHdUkAnKxboZI vA== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnrda2t71-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Dec 2022 06:03:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XsFJI8AQ+HdhOS+w4tNrQVpyJxgKUAus4LgkLRdnnxngSL4A/1oAr3i36K6uZlLm5npA1zSSKcmlwH0R5CnNbNLT8cjYZa9+oKPk2OYAqb2IvLEh6ZeyOz4H11gVHQHa39o1q8/j4J9g6026+a5AVBoEcjxlKo657p7FgYeVmJjLJXd/lMsL8RtI5DJ+6qKDKtxkPSPI4u9yRxKc0vp58oCxbdbBLAI1QVD3XdcSmDo8Brpxw2a1HsZMeKFxLuK8NnY6iRyq08pwZJ9nCvu2/W8WaqrYCsqZsSN90+W9mC4JLlH3GWfdMztpiFerXjGMAzyziHVgjtVRcUC+M3hzlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZjBYdEcZPyauKF1QRM7/eki/xZAt7pwup890Jg9qcgo=;
 b=ZK9h7WUyUqi3jpOL4FQpfOQMjzZNjyNipSdRWG7IC7wPXdcyI7xaINkMhsFFrVtq2QXIXVtY9PJqP0x0hD1ZSqFJ4cyniOUyPmHAX+eAY7s3KuTmKfbt9xTm7zG4ntJBTjX7/fCaxa0oMee8yZxX0Z2/ZvqO4zFzjZ/6Dnnkm0Qqc3zOtdugWmbXMmcHxOTk/CrjlZFXHQmsrWv8q8vMY7w6gK3hDpq7D5GKZ+7NdaxpuDqgcgIsJEj8NXq59qq4IUi4hvbH74eKpN8aDugb9MJi/9sk3BRQlCnOOOl/SKY0VLAU/xvOMuaTQrLrJ4fE+bNbklERBmMRiAaJ7XEqkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN2PR11MB4173.namprd11.prod.outlook.com (2603:10b6:208:137::20)
 by IA1PR11MB7773.namprd11.prod.outlook.com (2603:10b6:208:3f0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Thu, 29 Dec
 2022 06:03:54 +0000
Received: from MN2PR11MB4173.namprd11.prod.outlook.com
 ([fe80::152a:cd56:591c:e9ae]) by MN2PR11MB4173.namprd11.prod.outlook.com
 ([fe80::152a:cd56:591c:e9ae%6]) with mapi id 15.20.5944.016; Thu, 29 Dec 2022
 06:03:54 +0000
From: "Shi, Guohuai" <Guohuai.Shi@windriver.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "Meng, Bin" <Bin.Meng@windriver.com>
Subject: RE: [PATCH v3 07/17] hw/9pfs: Support getting current directory
 offset for Windows
Thread-Topic: [PATCH v3 07/17] hw/9pfs: Support getting current directory
 offset for Windows
Thread-Index: AQHZE5OW94REMdLh3EyKw2mvTOVpOK54b2EAgAAxR0CACp2DgIABLnkA
Date: Thu, 29 Dec 2022 06:03:54 +0000
Message-ID: <MN2PR11MB417360E644694FB9F13A528FEFF39@MN2PR11MB4173.namprd11.prod.outlook.com>
References: <20221219102022.2167736-1-bin.meng@windriver.com>
 <1688271.CY4Nip6A2B@silver>
 <MN2PR11MB4173F332BAEA088CEA1C5629EFEB9@MN2PR11MB4173.namprd11.prod.outlook.com>
 <2830993.GtbaR8S6b6@silver>
In-Reply-To: <2830993.GtbaR8S6b6@silver>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4173:EE_|IA1PR11MB7773:EE_
x-ms-office365-filtering-correlation-id: 6dcef7b5-82f0-4ba5-0ed9-08dae9627778
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 13x2pBcBp84uGG4cwE4w6+N5Y0tI/AkJj9ikaOJBk8TMQmCWbpd/YS9d59/ZULvAAPfQ/gKb5dcYSGzjeN6lxYtXeAbQ28mIL9T97Sug7Enr80q2Uur/Y8qLuBvd3v+mzGcsIrH0mwRNPNh23RHzrldcYCtOi3W52/tNxia1sM4paRzg1Tys9DbsK3Uz+y1hOXZVscGOXgCbBqjJ4L8UQwlTAp5yPDmXII/pfgRqpXaiaSa2wyWtMRQPkMK46VuJiLJRrSOKeVeB8iS/CXOrY4a83/7JrZ+Yp5oo61ydyQc+EpK7JTfOureYZXGDFQeSo/hBPFOuRp8eYMxp823cEMQihkHM0nagoP6Jc4sHJ5gG09H8T8o+LHICkwaQSaQpYV+hqKMJGZaXN7Wc+T5JHd047eOOgNZhn9ameO+NQZkp9QIdLtY7OH91a3TWHSaDmtKjm2GIUSCYFgSgzvrD6g4U5WkgEXSgWG9YbMAkQznJ9EfaRlFJ7uIOasA5kOqAuHoXXih1mMqqzCnrLYVsY37A9jQyB1/EB2nm0PB/eVSg/FQdouI9wjzED7XzH1fVbKw5589QgMdcClZOObqChXDiWG46JMMYtg7f39sODBDVBIqd7bOxYdOYttwiM5XsEixFK40inRgam8ZAp9xI6JZswxonHxZYE0Y6HOrvuBDWHRYLR5DYWwV8LeNz5szZlELvEqCfNnaKtBHCyfytlteCzAHjlvRKnI9z6HeG3IA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4173.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(136003)(376002)(366004)(39850400004)(451199015)(83380400001)(5660300002)(107886003)(2906002)(7696005)(52536014)(8936002)(66899015)(122000001)(4326008)(66946007)(64756008)(66446008)(66476007)(8676002)(66556008)(38100700002)(76116006)(71200400001)(55016003)(53546011)(186003)(38070700005)(33656002)(26005)(9686003)(316002)(41300700001)(110136005)(6506007)(86362001)(478600001)(966005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wfKVoYu1p31s9BSg9vnUsNaIi1FFAvWFmd3zVPANSOG4kDBb4Tod/VQ7B3Se?=
 =?us-ascii?Q?812ksN/2pU7Jsl5/FCfjU+vEbLhdTVYAZ79Sree3sW0ZWXerm5YPG16webbv?=
 =?us-ascii?Q?JEjoYu259hmxbBeS+a2YjlWstvEL16gREcYxxmeuszzUk1FwrdJHrFF3ZPmd?=
 =?us-ascii?Q?iRNuWIGwbHZ+5A5GdRyI+DemtJV2Pe7qEf1txlueUHL6k9+75UGQvgPY//4a?=
 =?us-ascii?Q?GaCMvGNKoCJ/POexJwtWSWZ4AbDDx1um9kSX7EPBEJyzebRWfM58cfE5ILHp?=
 =?us-ascii?Q?DL5FNRGw/Ihl2I0YI/GLf4XCKW7zYLole6txv67TuDt3qctwRTlv/ntpOqjn?=
 =?us-ascii?Q?SUbo0UMhY6cRuX76oNwPnDaKzqOuyTJPLYbpjEqa7mTRVTO3A7kJMAl9oFZh?=
 =?us-ascii?Q?Mp3sFhHzoY4huRVzhTD/BlrCkUpQokiqRNN7VFUlux/uuN57CglmE2NAfZLI?=
 =?us-ascii?Q?+4q4pf0WzkQGUgBRFzvuhQlr3Pv4cXfMZpjeX/lFOlCsNgrd85HnwX1IKn4f?=
 =?us-ascii?Q?ECUS6ybpBXB5fRZtjW9s0DP3stPfnITi9EZ7VfQNYzlG4r/qiyBgxtqYC3bP?=
 =?us-ascii?Q?Htsbs1i3pPNh567sr7Tr+wuDOtwwQXrRgjUDjVRR9bD0Ouiuh8t9X1FfdY98?=
 =?us-ascii?Q?NlFelGWHyC21ferIM7RK8/tdCwCxrKVdKY2dZ2zg1n7UE2kywyH1T8RwuVv8?=
 =?us-ascii?Q?csCEFkiAQMvcNtUefqk1sFf7ThXeHkrGrgxjly0JEUQYJvIEeygNiZxX/00I?=
 =?us-ascii?Q?HGyyDX7Dxo8YpRqH9x7JStBxq1QbLMPz2Pinu++5IbpiN/X9y1HdzVSlkcRT?=
 =?us-ascii?Q?HGmVRGkhdcqhMjGJMK+VoK38xKROqWro2lf0JGXCAXi0xRpMnz/wOqNwA7UE?=
 =?us-ascii?Q?Iwc/2/NcjU1ogWeRFEBX1tQfXSmFmlJTPVY3jIrJW+0z/fpyPu+/TDHfCuNX?=
 =?us-ascii?Q?EdmF+8y5d6TSjCMaQszEf5whowl0/3O1bzXNNfxSByIgC1kEgN8yUgUJXQag?=
 =?us-ascii?Q?6Eb8nkHlK9nyr7/MwbMVGX/RJk/jMbWlEf4JOOBhPOkcAkWKfFBBx6xG0hNl?=
 =?us-ascii?Q?APqPXpsQpKb4XdSExSGFPTajIjHKuiSPa+7RZgItVETuS6kfgoKu2r3QskXG?=
 =?us-ascii?Q?Y/P+7lfwCc2dI/ps/6xFekoAwWqBM2xbPPOeq1vTKHxG5I6027MteRBdW7xf?=
 =?us-ascii?Q?BXI62dHcr3SBwjKctu5qDkf68bweAePiqeKlwCe7mS3vzJnt3UywGn86b7s4?=
 =?us-ascii?Q?FSDnPmRtcPoF17DHthFzJsbzGjyS13uDX3dE33yOCiMJeKoqCUAVg8CtOmiQ?=
 =?us-ascii?Q?zBaJOEs0oWDVjVCLkg4Cl3e50AXRtPszCS/WxXM8OgGbeAI0YtxjdvfH7vGc?=
 =?us-ascii?Q?uDwdkdlFXoapE6f0NIev8B5kLMPoKoI1vr3hOH677xvxMmAk9b+RP1k1iKS/?=
 =?us-ascii?Q?VNIDDqNX/9JtoQ27BKe0JhNQhz4PVEs0dg3bied2TjEEcrSECYBIig1SSAHq?=
 =?us-ascii?Q?TNEuvAX43Z5giWWeh0avHTBvxVUTcituoS21K9sq7Moyte5p2nTpQ3ec4gYz?=
 =?us-ascii?Q?+PTyyt2S/3y88JthHnbHf9Knf7decKefrRDPSlfL/E4rrBLiHqN5gmwHXXad?=
 =?us-ascii?Q?VQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4173.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dcef7b5-82f0-4ba5-0ed9-08dae9627778
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2022 06:03:54.6145 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XrZF3R83or3arCmqER+myITxx/mas0V9U04N1iLD/NiW14kebrAgOcAxtvDcwrOEOaj8Qf2kqoA+Fn/Unx0j2ZapVtx2/Yrap0nAqdB8iIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7773
X-Proofpoint-ORIG-GUID: -p5t5WwOG6G6Er_Ok-d7JpJVYOrlfvF3
X-Proofpoint-GUID: -p5t5WwOG6G6Er_Ok-d7JpJVYOrlfvF3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-29_03,2022-12-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212290048
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=036282bf9b=guohuai.shi@windriver.com;
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
> Sent: Wednesday, December 28, 2022 19:51
> To: Greg Kurz <groug@kaod.org>; qemu-devel@nongnu.org
> Cc: Meng, Bin <Bin.Meng@windriver.com>; Shi, Guohuai
> <Guohuai.Shi@windriver.com>
> Subject: Re: [PATCH v3 07/17] hw/9pfs: Support getting current directory
> offset for Windows
>=20
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d
> know the content is safe.
>=20
> On Wednesday, December 21, 2022 7:02:43 PM CET Shi, Guohuai wrote:
> >
> > > -----Original Message-----
> > > From: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > Sent: Wednesday, December 21, 2022 22:48
> > > To: Greg Kurz <groug@kaod.org>; qemu-devel@nongnu.org
> > > Cc: Shi, Guohuai <Guohuai.Shi@windriver.com>; Meng, Bin
> > > <Bin.Meng@windriver.com>
> > > Subject: Re: [PATCH v3 07/17] hw/9pfs: Support getting current
> > > directory offset for Windows
> > >
> > > CAUTION: This email comes from a non Wind River email account!
> > > Do not click links or open attachments unless you recognize the
> > > sender and know the content is safe.
> > >
> > > On Monday, December 19, 2022 11:20:11 AM CET Bin Meng wrote:
> > > > From: Guohuai Shi <guohuai.shi@windriver.com>
> > > >
> > > > On Windows 'struct dirent' does not have current directory offset.
> > > > Update qemu_dirent_off() to support Windows.
> > > >
> > > > While we are here, add a build time check to error out if a new
> > > > host does not implement this helper.
> > > >
> > > > Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
> > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > > ---
> > > >
> > > > (no changes since v1)
> > > >
> > > >  hw/9pfs/9p-util.h       | 11 ++++++++---
> > > >  hw/9pfs/9p-util-win32.c |  7 +++++++
> > > >  hw/9pfs/9p.c            |  4 ++--
> > > >  hw/9pfs/codir.c         |  2 +-
> > > >  4 files changed, 18 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h index
> > > > 90420a7578..e395936b30 100644
> > > > --- a/hw/9pfs/9p-util.h
> > > > +++ b/hw/9pfs/9p-util.h
> > > > @@ -127,6 +127,7 @@ int unlinkat_win32(int dirfd, const char
> > > > *pathname, int flags);  int statfs_win32(const char *root_path,
> > > > struct statfs *stbuf);  int openat_dir(int dirfd, const char
> > > > *name);  int openat_file(int dirfd, const char *name, int flags,
> > > > mode_t mode);
> > > > +off_t qemu_dirent_off_win32(void *s, void *fs);
> > > >  #endif
> > > >
> > > >  static inline void close_preserve_errno(int fd) @@ -200,12
> > > > +201,16 @@ ssize_t fremovexattrat_nofollow(int dirfd, const char
> *filename,
> > > >   * so ensure it is manually injected earlier and call here when
> > > >   * needed.
> > > >   */
> > > > -static inline off_t qemu_dirent_off(struct dirent *dent)
> > > > +static inline off_t qemu_dirent_off(struct dirent *dent, void *s,
> > > > +void *fs)
> > > >  {
> > >
> > > Not sure why you chose void* here.
> >
> > It is "V9fsState *" here, but 9p-util.h may be included by some other
> source file which is not have definition of "V9fsState".
> > So change it to "void *" to prevent unnecessary type declarations.
>=20
> You can anonymously declare the struct to avoid cyclic dependencies (e.g.
> like in 9p.h):
>=20
> typedef struct V9fsState V9fsState;
>=20
> Avoid the void.
>=20

Got it, understood.

> > >
> > > > -#ifdef CONFIG_DARWIN
> > > > +#if defined(CONFIG_DARWIN)
> > > >      return dent->d_seekoff;
> > > > -#else
> > > > +#elif defined(CONFIG_LINUX)
> > > >      return dent->d_off;
> > > > +#elif defined(CONFIG_WIN32)
> > > > +    return qemu_dirent_off_win32(s, fs); #else #error Missing
> > > > +qemu_dirent_off() implementation for this host system
> > > >  #endif
> > > >  }
> > > >
> > > > diff --git a/hw/9pfs/9p-util-win32.c b/hw/9pfs/9p-util-win32.c
> > > > index 7a270a7bd5..3592e057ce 100644
> > > > --- a/hw/9pfs/9p-util-win32.c
> > > > +++ b/hw/9pfs/9p-util-win32.c
> > > > @@ -929,3 +929,10 @@ int qemu_mknodat(int dirfd, const char
> > > > *filename,
> > > mode_t mode, dev_t dev)
> > > >      errno =3D ENOTSUP;
> > > >      return -1;
> > > >  }
> > > > +
> > > > +off_t qemu_dirent_off_win32(void *s, void *fs) {
> > > > +    V9fsState *v9fs =3D s;
> > > > +
> > > > +    return v9fs->ops->telldir(&v9fs->ctx, (V9fsFidOpenState
> > > > + *)fs); }
> > >
> > > That's a bit tricky. So far (i.e. for Linux host, macOS host) we are
> > > storing the directory offset directly to the dirent struct. We are
> > > not using
> > > telldir() as the stream might have mutated in the meantime, hence
> > > calling
> > > telldir() might return a value that does no longer correlate to
> > > dirent in question.
> > >
> > > Hence my idea was to use the same hack for Windows as we did for
> > > macOS, where we simply misuse a dirent field known to be not used,
> > > on macOS that's d_seekoff which we are misusing for that purpose.
> > >
> > > Looking at the mingw dirent.h header though, there is not much we
> > > can choose from. d_reclen is not used, but too short, d_ino is not
> > > used by mingw, but currently we actually read this field in server
> > > common code to assemble a file ID for guest. I mean it is always
> > > zero on Windows, so we could still misuse it, but we would need to
> > > inject more hacks there. :/
> >
> > If you check seekdir and telldir() implement in MinGW, you can see
> > that MinGW (and Windows) does not have a safety way to seek/tell direct=
ory
> offset.
> > Because Windows POSIX and native API does not provide a way to seek
> directory.
> > Windows native API only allow to read directory forward, but not backwa=
rd.
> > So even we store the d_seekoff to some places, the directory may still =
be
> modified.
> >
> > And Windows file system actually has inode number, MinGW does not intro=
duce
> it to MinGW API.
> > So I think it is not good way to use d_ino.
>=20
> Scratch that d_ino hack. My original concern was that we might get
> concurrency on the directory stream, however after a recap I stumbled ove=
r
> one of my comments on this:
>=20
> static int do_readdir_many(V9fsPDU *pdu, V9fsFidState *fidp,
>                            struct V9fsDirEnt **entries, off_t offset,
>                            int32_t maxsize, bool dostat) {
>     ...
>     /*
>      * TODO: Here should be a warn_report_once() if lock failed.
>      *
>      * With a good 9p client we should not get into concurrency here,
>      * because a good client would not use the same fid for concurrent
>      * requests. We do the lock here for safety reasons though. However
>      * the client would then suffer performance issues, so better log tha=
t
>      * issue here.
>      */
>     v9fs_readdir_lock(&fidp->fs.dir);
>     ...
> }
>=20
> So it boils down to whether or not we would want to care about broken 9p
> clients on Windows host or not, and considering the huge amount of code t=
o
> deal with here for Windows host, we might say that we have more important
> (real) problems to deal with than caring about a broken 9p client that do=
es
> not clone a FID before sending Treaddir (9p2000.L) or Tread (9p2000.u).
>=20
> However looking at current MinGW implementation I start to think whether =
we
> should use that API for directory retrieval at all, because for seekdir()
> they are rewinding the directory stream to the very beginning on *each* c=
all
> of
> seekdir() and then readdir() in a while loop to the requested location fo=
r
> which they use a simple, self-incremented consecutive number as stream
> position:
>=20
> https://github.com/Alexpux/mingw-w64/blob/master/mingw-w64-
> crt/misc/dirent.c#L319
>=20
> Which can lead to two problems:
>=20
> 1. n-square performance issue (minor issue).
>=20
> 2. Inconsistent state if directory is modified in between (major issue), =
e.g.
> the same directory appearing more than once in output, or directories not
> appearing at all in output even though they were neither newly created no=
r
> deleted. POSIX does not define what happens with deleted or newly created
> directories in between, but it guarantees a consistent state.
>=20
> What about calling _findfirst() and _findnext() directly, fetching all
> directory entries at once, closing the stream, and 9p would just access t=
hat
> snapshot instead? As long as the stream is not closed, Windows blocks all
> directory changes, so we would have a consistent state.
>=20

I met the issue #2 you mentioned, you can see the comments I added in funct=
ion local_seekdir().
Fetching all directory entries can resolve this issue, but it may need to a=
llocate large memory if there are many entries.
And we also need to re-write local_telldir(), local_rewinddir(), local_open=
dir(), local_closedir().
It would be a big change for 9pfs.

> > >
> > > > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c index
> > > > 072cf67956..be247eeb30
> > > > 100644
> > > > --- a/hw/9pfs/9p.c
> > > > +++ b/hw/9pfs/9p.c
> > > > @@ -2336,7 +2336,7 @@ static int coroutine_fn
> > > v9fs_do_readdir_with_stat(V9fsPDU *pdu,
> > > >          count +=3D len;
> > > >          v9fs_stat_free(&v9stat);
> > > >          v9fs_path_free(&path);
> > > > -        saved_dir_pos =3D qemu_dirent_off(dent);
> > > > +        saved_dir_pos =3D qemu_dirent_off(dent, pdu->s, &fidp->fs)=
;
> > > >      }
> > > >
> > > >      v9fs_readdir_unlock(&fidp->fs.dir);
> > > > @@ -2537,7 +2537,7 @@ static int coroutine_fn
> > > > v9fs_do_readdir(V9fsPDU *pdu,
> > > V9fsFidState *fidp,
> > > >              qid.version =3D 0;
> > > >          }
> > > >
> > > > -        off =3D qemu_dirent_off(dent);
> > > > +        off =3D qemu_dirent_off(dent, pdu->s, &fidp->fs);
> > > >          v9fs_string_init(&name);
> > > >          v9fs_string_sprintf(&name, "%s", dent->d_name);
> > > >
> > > > diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c index
> > > > 93ba44fb75..d40515a607 100644
> > > > --- a/hw/9pfs/codir.c
> > > > +++ b/hw/9pfs/codir.c
> > > > @@ -168,7 +168,7 @@ static int do_readdir_many(V9fsPDU *pdu,
> > > > V9fsFidState
> > > *fidp,
> > > >          }
> > > >
> > > >          size +=3D len;
> > > > -        saved_dir_pos =3D qemu_dirent_off(dent);
> > > > +        saved_dir_pos =3D qemu_dirent_off(dent, s, &fidp->fs);
> > > >      }
> > > >
> > > >      /* restore (last) saved position */
> > > >
> > >
> > >
> >
> >
> >
>=20



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4A062B5E2
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 10:03:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovEJF-0002j2-4G; Wed, 16 Nov 2022 04:02:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83198d8999=guohuai.shi@windriver.com>)
 id 1ovEJ4-0002fS-Q8
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 04:02:07 -0500
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83198d8999=guohuai.shi@windriver.com>)
 id 1ovEJ2-0008KK-Ek
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 04:02:06 -0500
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AG8t3MK026465; Wed, 16 Nov 2022 01:01:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=HBnZVABp+pT5CDOdiPmHJTLK6iHpYdPd9DME38agWDo=;
 b=AblHQKAeh3MuJNhtU3V2hQd1MiRXrv4R3sJEPH9aJ2CwXOBTjYxFieNzIQSbLfoULwXK
 z464cxnxribuHupQvMN0kF6BOEtT/JogohJnN3aLxoCLHy6760SjWChrJCUHf9p3NED3
 pqyMBCxdGL+HD+FubUbppvHY0e7qdrBIJQKRK7WppoVukSM+XC9HEzooDtsdM75yC/b0
 QVpGog7/lEn88swgJFLtwRddGUa5/ElhJ/hC0Ngyp5PxEO9vbgmSPStUSwqt+mL7sGMV
 PmgM3emGp+isYlIVCdaJ1vcN9WXSTYxV5fawi+AqvALoVr3fVrMdxeZooDnBRt7g333a qQ== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ktbvrb14j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Nov 2022 01:01:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CfyOjgpe5G7z0M6Fa8bQJhrcpzj5GIFHRhgoidHq9DkX3P/MaU0YzNwkIRufRbyUOvv9o3LrR1Nzz1qiokU8JR8NbOjoEirTn9TnN8Ppp73AolgLIxc5bvUZl3MXZei3tRJTLbvWrz/ZWuBMtdg8Qqsq3pcj37+ab6bUCAWcR5NbhrsVKSeR9z3SXcOjJ9NN/obvDQx/pkEKTue7SToyrKCBfEnCo7vdDOF4WecWss+blETBbHYCANZWKTr1SRYsCwXvf4JU4iHJ3tL5TkTPe3pJ4XW2yY+VeIUf1bLPofxPFkmQHnvjuy5P0fdQA04LUnnBgsKvGNXA87jE4v1pzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HBnZVABp+pT5CDOdiPmHJTLK6iHpYdPd9DME38agWDo=;
 b=hUdzXw9koGwxljOO7nchHQ5vcxeG568B2oaADvqoIZc185Ni/ZaW7eOstjYFM+uhOGhGavuSAlAZwofGaDGc4c5crOsZbmEGvRXNzo156ZV1ktDSaG9Cc9aecFR2u3i/hlwYWhnmvubM5FglrTU3Rr3yl0hyqc9rx7smbIpv0BKh/JyYSzu/a3MEG8NjtDezXUs3NCsfFFDvnunKr7bkyyw1godI0IXgcUH4hc4gxnvCXwSN4+zsONvrBOQdagbx/c2MVahsAeesNxUD1YAVgWsyfjmJRFK9+ledbyaKCh6rwN0tdQrLU79b1U4gAejZ0eRQjObmWVNJnbnNEY4LIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN2PR11MB4173.namprd11.prod.outlook.com (2603:10b6:208:137::20)
 by SA0PR11MB4735.namprd11.prod.outlook.com (2603:10b6:806:92::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Wed, 16 Nov
 2022 09:01:40 +0000
Received: from MN2PR11MB4173.namprd11.prod.outlook.com
 ([fe80::9614:33e1:965d:f223]) by MN2PR11MB4173.namprd11.prod.outlook.com
 ([fe80::9614:33e1:965d:f223%7]) with mapi id 15.20.5813.019; Wed, 16 Nov 2022
 09:01:39 +0000
From: "Shi, Guohuai" <Guohuai.Shi@windriver.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: Greg Kurz <groug@kaod.org>, "Meng, Bin" <Bin.Meng@windriver.com>
Subject: RE: [PATCH v2 06/19] hw/9pfs: Add missing definitions for Windows
Thread-Topic: [PATCH v2 06/19] hw/9pfs: Add missing definitions for Windows
Thread-Index: AQHY9YVIYW0MRSbc7Eqiql/84bsVhq4+pJkAgAKa83A=
Date: Wed, 16 Nov 2022 09:01:39 +0000
Message-ID: <MN2PR11MB417389F84C0A0448A29593A8EF079@MN2PR11MB4173.namprd11.prod.outlook.com>
References: <20221111042225.1115931-1-bin.meng@windriver.com>
 <20221111042225.1115931-7-bin.meng@windriver.com> <6443328.Q0H0RdsSbn@silver>
In-Reply-To: <6443328.Q0H0RdsSbn@silver>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4173:EE_|SA0PR11MB4735:EE_
x-ms-office365-filtering-correlation-id: be00c77f-b425-4c3f-4af3-08dac7b12c5c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QEsGsLSa1FaTUIBCgnBrscOKVL9G9nF3bWKy2FK/m9I1NX6QF3s6SiEPPIXLLcQsCdyFYeihqiltkVitIMAgECUwdSjiRxWhoDecsvRwcFA+dvtm0Gsx0D7N+qXJ2e76cFCqrnc4LeJm8c+MUoqoPfIhT03LFjmow7H9TaEDq7Egp6mSECqsQumY4B91mQat/uqhYPCEUzyFtD25VOiJZgBdbHIE0ZGhMR9+kgQD6AwsXOuiKSxeGIlNquwxTCtoDfuMwM4qEkTxcG41VcL2lok7HpGB7146hqy//rEL6Uq3Xpli1yTXO73z2ODIMJgUKDHs7VH1xD5XIntd2ixy+c5WoKK9HuK/ZbXajbzmKtFzaJPK6HP3tqJ4nXTbenMVDWnYzsRdUJdRTuvdSCNyBH8+uymEBiDRMrOnl9v9Z2BNIg9ylbxRIi1j+5iX38jAKcO2V+tKQk5JJ3r3pXhR7YPyRMdY3KvtBuXf/ANF3r7pjkLszHpu3zo1zxsKhmlDRgD1CldEPn7vOGXpuvgInWhld0qrP9Shf1aHTbgVe2Ml0CqhDsfCmWwuDOzBXj587L0dmbXUjgWCvUKUBPcNWHUfnB0DW+ohDoZt01d1i332NTsnV8DBw3FiroKfSjcIsAqvuTbi5M+u/b4KS/XmOldugp25cAkcrSs0GiDven2yuO2rqCOeeSCVMfPhzppsYaSefKuU9EiHhX3RBVePcEthmek94XydHaZb3WggZ2Dl9mK3RkjBwkzCQpKAo3mlqISZeNQZf3QE6B3ofTHkHxJOWbOe3a1N4pf+kdjyAy0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4173.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(366004)(346002)(396003)(39850400004)(451199015)(2906002)(33656002)(52536014)(41300700001)(8676002)(76116006)(66556008)(66946007)(64756008)(66476007)(66446008)(55016003)(83380400001)(86362001)(38100700002)(6506007)(54906003)(110136005)(53546011)(7696005)(122000001)(38070700005)(8936002)(186003)(5660300002)(4326008)(71200400001)(966005)(26005)(316002)(107886003)(9686003)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ogrDoRjJRlBknxJDfRZtZTC3bOWHuMT4E0POuJDjMHjT85zEMn8A6vUzCaBa?=
 =?us-ascii?Q?jxDCt53UkqaCHc4+lOWqzPDvRy7xAdmG+Dd8d2Kn4QmEJHA+xpMehNuvGGy5?=
 =?us-ascii?Q?NHYBDCXo8z7uTN8ohsqMcJ56gMwXEI5ZTec6oNUfXklEjykrG7L55/KLNIap?=
 =?us-ascii?Q?wpb6k0ipoH+00nYC5Ew2EpBnHg05Z0aLpvu+QqbeWDvmTHoknKNdNPreziez?=
 =?us-ascii?Q?KpWVm/4EKuqmgRFHmD5mXxMyTTfHGOallAm+jp+i64acNN6cXNeCwbXpNu3w?=
 =?us-ascii?Q?TyGsPR6Qz9hu8OJtbqi0pB+X3RBHjytc6pZNYOI3fArART0NE6pEn8RXMf45?=
 =?us-ascii?Q?2+kFpBmOsdgAszDPTRZoUso4978RH0HEHRFnY9qYFG0UV/X7aOqIHCMDgDIK?=
 =?us-ascii?Q?g6+/x0CziGLTOrumSI2bY/e0dGEckxOypJNmHJq136YXxHlMyOmizjzJSvPQ?=
 =?us-ascii?Q?ZIAfLmkeKbnKEtomuH/n7mL/2iGvaDZAj3MjgViK6SP9/P6A5m3AXDYn0JSX?=
 =?us-ascii?Q?rAmHOFnYfx97f9wa4OEDqcIKk1n2GtT6vMaeUVS+OXfYQqSSQnVpwTko8Qdw?=
 =?us-ascii?Q?UVcSuf0OYbomBy84Qdkl2b4AsQOpqMblSg+gth5YXXz+KDOR+2xi9qWMUksd?=
 =?us-ascii?Q?dkXaojqykRI9928QA71Kaq/pXpZB4OvR6Qi3braKsd3cn/IOGvn6vyy5WOcI?=
 =?us-ascii?Q?xBF6UvYEuHPgf3zRJAplONl2At8CIW8efIlBbVaCHnesRV6jqyWjd/0xuRIj?=
 =?us-ascii?Q?Ji7+XeM33htGujemlCdSM4IOPd/OYWRimfgDiGtpUIZK4ICpvkCiygp2Lj6w?=
 =?us-ascii?Q?uYyXyEpCRoLLrrI/4aTCKKw3v48epioGDGxMWvAIJeue2x7sFpMV+STDazg2?=
 =?us-ascii?Q?oS/JBW66jq5TqG447VjZIcqa2GhwMxR6KNc7IJ9ZEiNXO7CkWYHmPqom8fPd?=
 =?us-ascii?Q?01Ng75CxZdExrC11hteVHhOj0/xqdvIp5J+Z9zTyp4jUqcrxteSb04Au/ok/?=
 =?us-ascii?Q?IanTv7LEmzFZvlmYjlZdxNNr92jIhr+WF2DHGWkhhZbe0T4prWoVr0b4Cajk?=
 =?us-ascii?Q?rRsqeC9A6r3J/xZgtu6frfh56/vdtxRvLz6hd6UX+XKhyAugGp1vPWD17Dd/?=
 =?us-ascii?Q?QoOu17pISiBKWN/TN7L9837pqHQ5IyVModZBnm6VshKAMKZGMFXV0oKBWL1K?=
 =?us-ascii?Q?Os37imSJAO7o4ML5yKiwDwGwrwIQIzZJErk8iRFL6MxAi+B8iVJ+fZxBOFAL?=
 =?us-ascii?Q?fetIf0LiRsXOQYGmLbfKw7yRf0MmSy/rlA/5wvaKiiPTapeRoLjDCZavZ6gI?=
 =?us-ascii?Q?AxJdtFwKw6QMbosk+Y8QLOBDzXo4gOeW0U54keV/Vv25T28G2r/C5UD8CRLl?=
 =?us-ascii?Q?zdQFHa9s0St5cMtDifUpHkSpttqCrIre9lfSVhTc81gE3wMlfoYyLoO7y8dp?=
 =?us-ascii?Q?Je1eljDWG2Q4kHcEEoNWEwNDvmVApKMrjFTTyfAsG223Ap8N6HjxAQTqR8Ie?=
 =?us-ascii?Q?oqpkJAAhbWpIMiPYfg/DX2HoIpN0Eq98mdMxjEA2evsPXBDj3TK58JmSmd8c?=
 =?us-ascii?Q?mz8ESIEkYcLzFHNYlSf4pSJFXyRvOk3YxAzpeB3c?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4173.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be00c77f-b425-4c3f-4af3-08dac7b12c5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2022 09:01:39.3575 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FZuwl4fRjNW0/bCyi5lGKrD9SjRo6BPw0nHlRhgp2cQZg1Z6lqGSj/wztYWU0ftAzUddubMCeE74z1oKOefpgn5ppJnaaNJujfAFI7Bs6TA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4735
X-Proofpoint-ORIG-GUID: IM_ryEHb_i5VgZqpitM4Kv45T5SRVPxA
X-Proofpoint-GUID: IM_ryEHb_i5VgZqpitM4Kv45T5SRVPxA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-15_08,2022-11-15_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211160063
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=83198d8999=guohuai.shi@windriver.com;
 helo=mx0a-0064b401.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
> Sent: Tuesday, November 15, 2022 00:41
> To: qemu-devel@nongnu.org
> Cc: Shi, Guohuai <Guohuai.Shi@windriver.com>; Greg Kurz <groug@kaod.org>;
> Meng, Bin <Bin.Meng@windriver.com>
> Subject: Re: [PATCH v2 06/19] hw/9pfs: Add missing definitions for Window=
s
>=20
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d
> know the content is safe.
>=20
> On Friday, November 11, 2022 5:22:12 AM CET Bin Meng wrote:
> > From: Guohuai Shi <guohuai.shi@windriver.com>
> >
> > Some definitions currently used by the 9pfs codes are only available
> > on POSIX platforms. Let's add our own ones in preparation to adding
> > 9pfs support for Windows.
> >
> > Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >
> > ---
> >
> > Changes in v2:
> > - Add S_IFLNK related macros to support symbolic link
> >
> >  fsdev/file-op-9p.h | 33 +++++++++++++++++++++++++++++++++
> >  hw/9pfs/9p.h       | 33 +++++++++++++++++++++++++++++++++
> >  2 files changed, 66 insertions(+)
> >
> > diff --git a/fsdev/file-op-9p.h b/fsdev/file-op-9p.h index
> > 4997677460..7d9a736b66 100644
> > --- a/fsdev/file-op-9p.h
> > +++ b/fsdev/file-op-9p.h
> > @@ -27,6 +27,39 @@
> >  # include <sys/mount.h>
> >  #endif
> >
> > +#ifdef CONFIG_WIN32
> > +
> > +/* POSIX structure not defined in Windows */
> > +
> > +typedef uint32_t uid_t;
> > +typedef uint32_t gid_t;
> > +
> > +/* from http://man7.org/linux/man-pages/man2/statfs.2.html */ typedef
> > +uint32_t __fsword_t; typedef uint32_t fsblkcnt_t; typedef uint32_t
> > +fsfilcnt_t;
> > +
> > +/* from linux/include/uapi/asm-generic/posix_types.h */ typedef
> > +struct {
> > +    long __val[2];
> > +} fsid_t;
> > +
> > +struct statfs {
> > +    __fsword_t f_type;
> > +    __fsword_t f_bsize;
> > +    fsblkcnt_t f_blocks;
> > +    fsblkcnt_t f_bfree;
> > +    fsblkcnt_t f_bavail;
> > +    fsfilcnt_t f_files;
> > +    fsfilcnt_t f_ffree;
> > +    fsid_t f_fsid;
> > +    __fsword_t f_namelen;
> > +    __fsword_t f_frsize;
> > +    __fsword_t f_flags;
> > +};
> > +
>=20
> Does it make sense to define all of these, even though not being used?

Windows does not have this definition, so use Linux definition can make les=
s impact to 9pfs code.
If not, need to add many macro "#ifdef CONFIG_WIN32" in other places to dis=
able the unsupported code.

>=20
> > +#endif /* CONFIG_WIN32 */
> > +
> >  #define SM_LOCAL_MODE_BITS    0600
> >  #define SM_LOCAL_DIR_MODE_BITS    0700
> >
> > diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h index 2fce4140d1..957a7e4ccc
> > 100644
> > --- a/hw/9pfs/9p.h
> > +++ b/hw/9pfs/9p.h
> > @@ -3,13 +3,46 @@
> >
> >  #include <dirent.h>
> >  #include <utime.h>
> > +#ifndef CONFIG_WIN32
> >  #include <sys/resource.h>
> > +#endif
> >  #include "fsdev/file-op-9p.h"
> >  #include "fsdev/9p-iov-marshal.h"
> >  #include "qemu/thread.h"
> >  #include "qemu/coroutine.h"
> >  #include "qemu/qht.h"
> >
> > +#ifdef CONFIG_WIN32
> > +
> > +#define NAME_MAX            MAX_PATH
>=20
> That's not quite the same. MAX_PATH on Windows corresponds to PATH_MAX on
> POSIX, which is the max. length of an entire path (i.e. drive, multiple
> directory names, filename, backslashes). AFAICS MAX_PATH is 260 on Window=
s.
>=20
> The max. length of a single filename component OTOH is 255 on Windows by
> default. I don't know if there is a macro for the latter, if not, maybe j=
ust
> hard coding it here for now?
>=20

My mistake, it should be 255.

> > +
> > +/* macros required for build, values do not matter */
> > +#define AT_SYMLINK_NOFOLLOW 0x100   /* Do not follow symbolic links */
> > +#define AT_REMOVEDIR        0x200   /* Remove directory instead of fil=
e */
> > +#define O_DIRECTORY         02000000
> > +
> > +#define makedev(major, minor)   \
> > +        ((dev_t)((((major) & 0xfff) << 8) | ((minor) & 0xff)))
> > +#define major(dev)  ((unsigned int)(((dev) >> 8) & 0xfff)) #define
> > +minor(dev)  ((unsigned int)(((dev) & 0xff)))
> > +
> > +#ifndef S_IFLNK
> > +/*
> > + * Currenlty Windows/MinGW does not provide the following flag
> > +macros,
> > + * so define them here for 9p codes.
> > + *
> > + * Once Windows/MinGW provides them, remove the defines to prevent
> conflicts.
> > + */
> > +#define S_IFLNK         0xA000
> > +#define S_ISUID         0x0800
> > +#define S_ISGID         0x0400
> > +#define S_ISVTX         0x0200
> > +
> > +#define S_ISLNK(mode)   ((mode & S_IFMT) =3D=3D S_IFLNK)
> > +#endif /* S_IFLNK */
> > +
> > +#endif /* CONFIG_WIN32 */
> > +
> >  enum {
> >      P9_TLERROR =3D 6,
> >      P9_RLERROR,
> >
>=20



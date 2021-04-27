Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D49F836C5BA
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 14:04:39 +0200 (CEST)
Received: from localhost ([::1]:47416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbMSD-0004Fn-Re
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 08:04:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1lbMQq-0003o8-1M
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 08:03:12 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:37974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1lbMQi-0002wx-Ro
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 08:03:11 -0400
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13RBwAhG030195; Tue, 27 Apr 2021 05:02:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=p3dNnFRNiY+GIhFhxuBwz1AqdSIsA3hOHs03KWHcQJU=;
 b=bfq0QnuwvcLxNybhzBm+rdfdQzAZdRewdt8x9/xmN8Oj1+7WNz2iOnOReYgjjetZPYM9
 mtBiKnMZE58JFaSs4rlxu8fthR2dNmCpX5tZyyrHe8RCwpZNw4lwRiQSKuCn1m3B6rr+
 qHyqPeMh1AXlMPTrOCrKNQcVipKz+JmidzGOcuoth/zC7JZhfThkZxXrwKmOdJedrItF
 dP8MreUlFJHo18sxd5hZiSiULxD1Z+Tp4CWIAVN22fNVits03OYRU1iano8I/+JZeDhw
 XwESZ0KpN8+wjAVX+kBcXl0llCbCV1QBHJV60eFEpjIc7aU1IOTWFVSNkdwLc1Ry4RcJ iA== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
 by mx0a-002c1b01.pphosted.com with ESMTP id 385nb2bd3n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Apr 2021 05:02:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cwvoJac9g7m+sa9PCFnDRCbPYyS0wF8anD/998L0DSGeWDtQLeAxHwAON5aoPjooF26N8Wu9QtOuHoQCmd3JjLqouNX+FEVHHCH0MFsjCLr4Dw4HtMEnAePdOVmuPXQaSRPk3go9FyHjsNYLkk/+E+EQHjqPOVwT4rwWELuc5/OH1XTzPuMdW/ZnaApUJO5CcPHK2VnrLHJbdviJuVJto1X/7BjqgdSEoZY3nEtnPL1xRFV60k8DLgsHfpGVR5uIF5ygcjaZ2Fzd1bVXhsRCuWtzA3GGwfhUPJn8ikRjaE29Ej1b0PEfH0HpEHLoE2ZCIUXTL9tyQdoxszOhB1Q8kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3dNnFRNiY+GIhFhxuBwz1AqdSIsA3hOHs03KWHcQJU=;
 b=PPmouQKgV5MTBPf8ENCLXhxWmBlIf5P7Kc+NvQ45vyatSmyM4SpuhKcxGY7dkfaZg6QO1idGnek77taw3vj6emoP9GVaZJeXnjlLQN0vUplzjJR+YSPIp61baVHzbkLFS+mrtee/ac/phjGNN7obJJ6FJNOBoCvU5xq9cnTvkm1n/cZfPksHWtW76RvaL0fFdHJaIbOANDffezme2ZRANrIirk3k9W5eloErFmS8+7rrYMt9n/TXCsE6wptPgsNVi9SFPcR1dL8WBDT125yZ50rUPX39uwp6AGL6w7C+T890WUsZDX+DjwGv9T5uXzcio/p1GEpFcfFeSIO4uI5iiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from MW2PR02MB3723.namprd02.prod.outlook.com (2603:10b6:907:2::32)
 by MWHPR02MB2608.namprd02.prod.outlook.com (2603:10b6:300:43::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.24; Tue, 27 Apr
 2021 12:02:45 +0000
Received: from MW2PR02MB3723.namprd02.prod.outlook.com
 ([fe80::3591:14f:bb39:4797]) by MW2PR02MB3723.namprd02.prod.outlook.com
 ([fe80::3591:14f:bb39:4797%3]) with mapi id 15.20.4065.027; Tue, 27 Apr 2021
 12:02:44 +0000
From: Thanos Makatos <thanos.makatos@nutanix.com>
To: Stefan Hajnoczi <stefanha@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: RE: [PATCH v8] introduce vfio-user protocol specification
Thread-Topic: [PATCH v8] introduce vfio-user protocol specification
Thread-Index: AQHXMSMjtDp7nXmGRkuiYMGnZrvqnqrHBNGAgAFTRWA=
Date: Tue, 27 Apr 2021 12:02:44 +0000
Message-ID: <MW2PR02MB37238C9134B09733779D0DB88B419@MW2PR02MB3723.namprd02.prod.outlook.com>
References: <20210414114122.236193-1-thanos.makatos@nutanix.com>
 <YIbgtbUJxtuQ5PoM@stefanha-x1.localdomain>
In-Reply-To: <YIbgtbUJxtuQ5PoM@stefanha-x1.localdomain>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-originating-ip: [78.149.4.199]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f93be973-6c6f-4b04-ac0a-08d909745e0a
x-ms-traffictypediagnostic: MWHPR02MB2608:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR02MB2608C6DDAB980E65CE308F3A8B419@MWHPR02MB2608.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HJD4Cm+4fMTb+pI1Y6LLMOz4M/f2Q4JKzGTUWUl7V0KrYRUdr9eJ8gpt12gprejCR/2uKHGkz8606vErc/rVpUw/X06f2IZQElnsURGkkTgP4EgT2vLL/RiP/Y1WpQzY2r2iah0Ipx5UrZj1zNqUJ3jYRucmmtCNIMchkS3HuBNqhN5UmQKx3K4Ecfg5wufQjW40ZySJccMMJuCl1JCI0Gi1jzAWLQ48LWkH5z3kNxj0MLWDjCd40G6zzp+x8wlYWED3Z+0TKqTPeK8eI1j3eGOxDf8mh7KkjcQKMfTTrhPDfLmt231qYyukcwiCrNQ5tpo2FKAIYcHnse4Et+S8bYWiQ+UelkCDRVl2YplOXQ91/Xt40KdbJXwXbSu3Ije4y+cm8ISf6kD9QoGPUT9c5HJyZT9YMrv1hLpLmZAOSZZua/V8/ctX1GAFOArfbuHmzF0E1Iu9YoWviPigFixmBn2g0oKW9F7dv5VW7hTTCQJ5OTh4DNjKg3ovLSVwvZfICeIDwSZ1ZOkr6PaUBzm63ZDQB8KH+jfesPdnn8OIZ0W2HiZvnWTAykxCjOa2lhoSv/kh6v6xOBUOYEW4z374rngur9+NcCsWKbbHYWvds9s=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR02MB3723.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(396003)(376002)(39860400002)(366004)(55016002)(7696005)(54906003)(2906002)(33656002)(6506007)(66946007)(5660300002)(64756008)(4326008)(66556008)(9686003)(110136005)(38100700002)(44832011)(8936002)(83380400001)(7416002)(71200400001)(55236004)(186003)(478600001)(26005)(52536014)(66446008)(316002)(53546011)(86362001)(107886003)(76116006)(122000001)(66476007)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?KL2jsgrZsznc40gf9w4AV1w6MDlbt13Gg2riZDHl7JcC6d10uPvVgdrFbUAZ?=
 =?us-ascii?Q?njCK8W5pMxGdsTLzarYU7du8f+WG07KufGQAjWcmF2EcTuetwyIRPi9X6Zua?=
 =?us-ascii?Q?sveCxE6hkLCj8mgmju1kQwKG5p36rb/iTa5oXlpBpWN13TM4qQ8E1pT6z7q0?=
 =?us-ascii?Q?xkF8QjrlLx4J5DK0H9QY0bypx1cSMzPKndwvE/aLmHHBgkTgj3RIRXQaVqyA?=
 =?us-ascii?Q?W7pO3sW1TfuRVOPovlJteCWOq9UPfbem8jZ8rf99XimTikguo1jq2miOnm5V?=
 =?us-ascii?Q?uuCKlpH0WAPq4rGmwWutYSH2xQKKNnmC+bIIVHjSUNhojeNFmfliiqgRQo14?=
 =?us-ascii?Q?/AcWz9Dg5KWqYUjUdPsYNxM1kBg7UKwLGpQUdrryWGGu0UlJz/Pm+6XUsuOD?=
 =?us-ascii?Q?bYqfX9yxb+Qq+t/iwGb7m2cyGm/0sMl8g2jWi/NbY7WDY+BYs1rtF+3b8JtY?=
 =?us-ascii?Q?8WlNWEUTzj757QDWvb5Z0BfddzYPykNJV+axXv6qrkzHtzJpz0mFj+MIUja+?=
 =?us-ascii?Q?fo+n6u4Ihwg/7aT6Zfr769H/fYKnPh5W9/uUUG2FlsikSX7VI4LvRZHeen3n?=
 =?us-ascii?Q?O9bpKhazfzxqP5f3k9ZKVqU1KmtBsIU9nXZQ5sPHLSpftDC88Igi+5famnY+?=
 =?us-ascii?Q?Q2g1s8cjkNqJTcqDlmdmPLlp88p9wE+ukV8GDiTuN+WwdeC/BIBOiX7H+vXN?=
 =?us-ascii?Q?9W2FIs5E5lNTFg3pq4rc7T2Bu+qSBye9bogmQZBlMRA6c2KOBw/bAHFVamxs?=
 =?us-ascii?Q?oQNa++I9PjCGzVF4TCSAq1C4S0zQuSO3feXqvadedtH3uNEc+pSCp5CZ2wuW?=
 =?us-ascii?Q?J+MfDnFg/Nv+N/amRgu1JS0sV4G6ExWc8+JAciGQ97WDLepVzN3QLDJsJPXd?=
 =?us-ascii?Q?av5l8fHBFamj7+8hiVR7JoE9iIS8NBmPiIRmb+iZrAKLJ81Qk6Shcep65Nz1?=
 =?us-ascii?Q?4Q9uiiGz7Zq8boXECl/7ZtJMG27V0CIyv3dYtgOfFIUP+He+N8pyvB34CD4K?=
 =?us-ascii?Q?aAQUnsYbbEvfgVJ/CEk6+Nfd4kX5XgBg+OCCXPAX/ypS6Jm45M7i2Zw5tb2K?=
 =?us-ascii?Q?uH0J0ndteCSB4h+eJ6RCF9fX+9/rcmOooux+4aCeaB8zJ16Sc20WpzP+h9V5?=
 =?us-ascii?Q?epRp8L73ryQ7T8PZyHnxgWxt7KOf7wvhRM1cYtVdMpp3kdUrpHemc/s6f8Ke?=
 =?us-ascii?Q?yXTzwYOTmSc9FTEt107e8Cy/FwjhHXxiXenUy2f/XzALHYfDUgsdIMLKF12h?=
 =?us-ascii?Q?WfrHfQMRtXHCH0Nbdvzi68ZLAjhc5oLvu1LhFuOtLbW3vtHxC1lLp8INOuII?=
 =?us-ascii?Q?rwA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR02MB3723.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f93be973-6c6f-4b04-ac0a-08d909745e0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2021 12:02:44.4622 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ocY6PO7EKtqdZcaDrviJzuhE95jza19mm/pU1/9v1JLBI/+A79LtWlbaxA6WbPn/8JcLxA2YsRoGp8fOez2VcgJgrKXlsust4DJDVPEJVsg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2608
X-Proofpoint-GUID: VqN3pfrJ0e2XbiQ7vBOtQu3FXoQ6xg4y
X-Proofpoint-ORIG-GUID: VqN3pfrJ0e2XbiQ7vBOtQu3FXoQ6xg4y
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-27_06:2021-04-27,
 2021-04-27 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=thanos.makatos@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: "benjamin.walker@intel.com" <benjamin.walker@intel.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 John Levon <levon@movementarian.org>, Kirti Wankhede <kwankhede@nvidia.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "tina.zhang@intel.com" <tina.zhang@intel.com>,
 "jag.raman@oracle.com" <jag.raman@oracle.com>,
 "james.r.harris@intel.com" <james.r.harris@intel.com>,
 John Levon <john.levon@nutanix.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 "Kanth.Ghatraju@oracle.com" <Kanth.Ghatraju@oracle.com>,
 Felipe Franciosi <felipe@nutanix.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 Christophe de Dinechin <cdupontd@redhat.com>, Yan Zhao <yan.y.zhao@intel.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "yuvalkashtan@gmail.com" <yuvalkashtan@gmail.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "ismael@linux.com" <ismael@linux.com>,
 "changpeng.liu@intel.com" <changpeng.liu@intel.com>,
 "tomassetti.andrea@gmail.com" <tomassetti.andrea@gmail.com>,
 "mpiszczek@ddn.com" <mpiszczek@ddn.com>, Cornelia Huck <cohuck@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "xiuchun.lu@intel.com" <xiuchun.lu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Stefan Hajnoczi <stefanha@redhat.com>
> Sent: 26 April 2021 16:48
> To: Thanos Makatos <thanos.makatos@nutanix.com>; Peter Maydell
> <peter.maydell@linaro.org>; Michael S. Tsirkin <mst@redhat.com>
> Cc: qemu-devel@nongnu.org; John Levon <levon@movementarian.org>;
> John G Johnson <john.g.johnson@oracle.com>;
> benjamin.walker@intel.com; Elena Ufimtseva
> <elena.ufimtseva@oracle.com>; jag.raman@oracle.com;
> james.r.harris@intel.com; Swapnil Ingle <swapnil.ingle@nutanix.com>;
> konrad.wilk@oracle.com; alex.williamson@redhat.com;
> yuvalkashtan@gmail.com; tina.zhang@intel.com;
> marcandre.lureau@redhat.com; ismael@linux.com;
> Kanth.Ghatraju@oracle.com; Felipe Franciosi <felipe@nutanix.com>;
> xiuchun.lu@intel.com; tomassetti.andrea@gmail.com; Raphael Norwitz
> <raphael.norwitz@nutanix.com>; changpeng.liu@intel.com;
> dgilbert@redhat.com; Yan Zhao <yan.y.zhao@intel.com>; Michael S . Tsirkin
> <mst@redhat.com>; Gerd Hoffmann <kraxel@redhat.com>; Christophe de
> Dinechin <cdupontd@redhat.com>; Jason Wang <jasowang@redhat.com>;
> Cornelia Huck <cohuck@redhat.com>; Kirti Wankhede
> <kwankhede@nvidia.com>; Paolo Bonzini <pbonzini@redhat.com>;
> mpiszczek@ddn.com; John Levon <john.levon@nutanix.com>
> Subject: Re: [PATCH v8] introduce vfio-user protocol specification
>=20
> On Wed, Apr 14, 2021 at 04:41:22AM -0700, Thanos Makatos wrote:
> > This patch introduces the vfio-user protocol specification (formerly
> > known as VFIO-over-socket), which is designed to allow devices to be
> > emulated outside QEMU, in a separate process. vfio-user reuses the
> > existing VFIO defines, structs and concepts.
> >
> > It has been earlier discussed as an RFC in:
> > "RFC: use VFIO over a UNIX domain socket to implement device offloading=
"
> >
> > Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> > Signed-off-by: Thanos Makatos <thanos.makatos@nutanix.com>
> > Signed-off-by: John Levon <john.levon@nutanix.com>
>=20
> No review yet but I wanted to agree on the next steps once the spec has
> been reviewed.
>=20
> One or more of you would be added to ./MAINTAINERS and handle future
> patch review and pull requests for the spec.
>=20
> The spec will be unstable/experimental at least until QEMU vfio-user
> implementation has landed. Otherwise it's hard to know whether the
> protocol really works.
>=20
> Does this sound good?

Yes, of course.

>=20
> Stefan


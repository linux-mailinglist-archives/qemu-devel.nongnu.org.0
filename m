Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4D44312B9
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 11:07:48 +0200 (CEST)
Received: from localhost ([::1]:57640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcOcV-0002l0-R8
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 05:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mcOZA-0008B7-Di
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:04:21 -0400
Received: from mga06.intel.com ([134.134.136.31]:64686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mcOZ5-0004c4-Tk
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:04:18 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10140"; a="289058815"
X-IronPort-AV: E=Sophos;i="5.85,381,1624345200"; d="scan'208";a="289058815"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2021 02:04:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,381,1624345200"; d="scan'208";a="482649938"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga007.jf.intel.com with ESMTP; 18 Oct 2021 02:04:02 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 18 Oct 2021 02:04:02 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 18 Oct 2021 02:04:02 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 18 Oct 2021 02:04:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NVkokk38HiHE9HjWnYvmTrnrmuCF5Sxa+jtMuEJjMrSO+RNjkNXblQGHzT16hhQ3jsLSF0p4Xkr4bn2eifd2feOhILzuZ5toSBv0MUwaStF+ANdch4OIO4mS8GhPKRaaDwp2C4LSSjR9L8+jPHT/virqSguG0vFyDSNeH66SCgb2vACcpu1L30SmLySl2GpuW8KyWUChdRyoO5FDU0dlMU8jLf0cLxDlYSyGmKn+NZBN08E3TSkPL302Jw6L4IHvlgMqky4V81/0dqwOOAsR5mPzRN96EjmYzyVYYTVCqe7LuEo4iPB7rpqUQgwyi3QUskoj7NhIYgiLcOApHF3+bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UR54Wej4+dPLWmrEoRIfklT2YIRVolFaGdzX7Wi7Tjg=;
 b=n74SxA2H7WeaI8NbfQ12ea31dbO6Niqn8iq4ciS4/y3gqzcq9Y1Kww4C5dYumstWJT4rdDZlbAVVoUDJ8+2WPm5jqf7sRE5QkWKT0VTlFC13565wrhtWSKTFCIW8/tesjCTzZN7r3+nTHvDL4tr123RC2HWsdRNg8FJOYeM6jhp3sxn3JNfOSdNseJ7P6ZU6YNacfze7CGharlRYmdOFADVp/HgM7ntY4D+Mjr0qiLCHi2zOxaqSXsxURfdxSSKG8J0smPMl9QPSO01eELuOBSWjmL3ey3gmw64xbgRartMLGXeodEuLgPt/6lCM9IIbDz4BtKVEO5Hg6mUSrWa5JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UR54Wej4+dPLWmrEoRIfklT2YIRVolFaGdzX7Wi7Tjg=;
 b=rsC8C23gk5kWvC20DzUssiaMmeChjvinm8rOzQ/iHDKeNoeoCbT/CqqlC15dwQCg/n4PusJM6RZ3pZ6DxrS5EXELTFRBGwfSnrGx6nOOLRF1KxK6QxILrX4np5UlYolN0MD5KIYzGWHZc3IP3+noJ9A/W9oNt2kZ8YdIaRWU9i4=
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by CO1PR11MB4833.namprd11.prod.outlook.com (2603:10b6:303:99::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Mon, 18 Oct
 2021 09:04:00 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::359f:549e:18bf:fa8b]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::359f:549e:18bf:fa8b%4]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 09:03:59 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: RE: [PATCH V3] net/colo: check vnet_hdr_support flag when using
 virtio-net
Thread-Topic: [PATCH V3] net/colo: check vnet_hdr_support flag when using
 virtio-net
Thread-Index: AQHXrDLO3JQqRwvCjkWRAZN8QKPL1qvPP4WMgAllpYA=
Date: Mon, 18 Oct 2021 09:03:59 +0000
Message-ID: <MWHPR11MB00317056146763391A4FB1369BBC9@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20210918020437.1822937-1-chen.zhang@intel.com>
 <87r1cqbnds.fsf@dusky.pond.sub.org>
In-Reply-To: <87r1cqbnds.fsf@dusky.pond.sub.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 65361121-c9a6-43fd-3f5b-08d992163962
x-ms-traffictypediagnostic: CO1PR11MB4833:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR11MB4833BB22B708DDCF49D508A89BBC9@CO1PR11MB4833.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lLHZYyEhPFhWbkcj3GRu/QnAh5s1sN8bHKmaVwEH+bywYAktsV7gLaU+vHRUvxMY9Bc5n6lrpSdqb4BCtXVVRfHsOVbzuQq7H2jEXNNRSjGu5A3f0hICXOJS5ayUOftiBLpbTLaMTmtNNivJFjvqfrXsPWKTXVr1yk86VeOx7MLn1Vr0/z1zZr/LHvOG1hMGojohd72iQcHXg9+NW5U1sk7rl0LxppcmnhzL7FstwS2eGhIr8aoSn2o4Fd0G/Yi0yc9YLSE9nhRRj/ofceYW9uk+RsqhBaFT9JdB61rYhUBLWon03xaEvGuqSm/3ExKJH8oXjY8m7LQiTJkf66cauz4qo3QcUTpHew+9B8CRgB4zHSpr5tPFd9eBZp3EFSvBnJBOzp2gmIZ30K0cvTSN/u+/TbK8yyuF34VBGWxxgwLZTshWrQGorfciGDqfGNW5skgQNYbliqBzkp7jRNXVETW3+Sk3usQYTrd/8bI9711wyNJC2hl6/ezWbiVM5qURUazGJ96BOQepzMmT+X8FXecyuuAp2AgmbTNN+bm/LTWIjofF25ROOQgpUFckPdezeazz1pQ3rOME33+Ubw0Y6e9UDIRwC4at0+M4c9YlLRtaZCp9gQLiF+MbNGMKBdFoKoZ+HgSXFd572tpnciyw58JTTytBBnKGxSqrwkTiLyeiyo18lbWTSPmjrb7XbpHIZA4mNhnyBPJnjLUNLc3raA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(86362001)(82960400001)(9686003)(7696005)(30864003)(316002)(508600001)(38100700002)(53546011)(6506007)(122000001)(2906002)(8676002)(26005)(54906003)(6916009)(71200400001)(4326008)(66556008)(64756008)(38070700005)(52536014)(66946007)(186003)(33656002)(66446008)(66476007)(55016002)(5660300002)(8936002)(83380400001)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8DFtD0Jv5395hK0z8rH9mpA9Y1aESXpJ/EXKp7IQtwr5m25dkQk3TR7dYmap?=
 =?us-ascii?Q?9JWN2E7HPUi/HNIP7xBWtuTywvzxsmztTlXP3T+OVNTe/CyhvPImWeP+EO5Y?=
 =?us-ascii?Q?CNROoJYaq6Y8OO3OxPE3ja9ZLn6Rm3XZR6F6W7YD5hngkaBJJDaVgzP2RH6I?=
 =?us-ascii?Q?5wPVGCAv4iI+CydjIOo1iwduI9V59rF14PSYKD3xaaM23I+XQdIrDruPkvND?=
 =?us-ascii?Q?nS3RsOVVdZID/vbAqPrO3joReC5/AW9lc/vYggc9WxWgW0l10H7v47DkfrBh?=
 =?us-ascii?Q?0fqkpD/GC9mpJYHR2QCnJK7+T+sUk8f7ERg0osHoJitA861+34aYEoq8lfP0?=
 =?us-ascii?Q?TbZ9SCcTHmrzIYrjocOAMGcaaJnmtoD4iS8S/BNzYCpcKNau+NRJpmjlpyEc?=
 =?us-ascii?Q?VJcVIXDhcPD7sI8OT8A2bUSvQiThyuUBmXraGUEr6tmoM7M8rU2UjWQYRlg5?=
 =?us-ascii?Q?b7R8hbZKahQv28mrUpet3NNSRSuaIp+vZg57HhI+NP3YO945NUgMuw/7Bqxw?=
 =?us-ascii?Q?rUrU9hiARwQpqZ/iGANe7omtbkAB7aYaW49vrhvh972RIsPN0luSUvElXoOQ?=
 =?us-ascii?Q?YQIFyRukdA4m3uYv8mQkU5/lv14fUviD1gP9xeYHOrRKEBE3N7oIHKYkrw31?=
 =?us-ascii?Q?LRfbiSkN8enmzf1Lf1gpbew0bkyh3XgqBrOndYNxHNwUqw+b5IphWAmSV/4p?=
 =?us-ascii?Q?gSiD/MAjfsFG990nXbhWuLW1+K5zokGjMNE0llz5GvB1LMT5lDuFsI/+tP6A?=
 =?us-ascii?Q?Fl9DtyB6wP8c6ZuJrgk1VFCnfJtJlnl/x9IXPQ8ZeWA7lyv5zDQJ/5nPeFaV?=
 =?us-ascii?Q?DQSaB8cNdn1oGKIINnKeCsMGZvBUlQNJd/y8xvCffTsnAQIwdTtRg2IwSE71?=
 =?us-ascii?Q?3huN9w6395aZYh4IZJxE8Vw86q3r/9ApSZ8dVzOBVTmiFI4jtCWPd8/6vcRF?=
 =?us-ascii?Q?Cs9sQkmh6GcgJOt+821av5kn4fVjTOYZf7QcXB8L7965MrTyV/STPoPsKdWe?=
 =?us-ascii?Q?NT+zQwnX3U9k+NknVSsJs4hRkZZHJ939VNGmp/yl2T92gROOHgJj1EiicvdL?=
 =?us-ascii?Q?PTOxbx8a7JNqnr4oUWxZXBTgYUm6zm1fQacwKTBc5uAkA2htr/LTR1VkUvL6?=
 =?us-ascii?Q?4iEYzMegCs0BsFObCzgUYDkCGhc56jUTwYJEIjqwsTX9O8zgx6MCiY6rL2RP?=
 =?us-ascii?Q?PbimQq7vRcTe3wu0XArFQH0c9OCBIa746mZk05QJJ5WhngQC2Yg3g4pjRJt8?=
 =?us-ascii?Q?T6o5uHAu+1vdD/2ODAXSadBi4CotTi/c86W+AvTVmfLhYUu7Zu64BNyn350n?=
 =?us-ascii?Q?TOU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65361121-c9a6-43fd-3f5b-08d992163962
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2021 09:03:59.7512 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z+ikrutFUsWRU15gYc5UEJmQVuy37czvOL1wyTHNmeXvyRMaU5GR7MIzb6WyXM/78McWn9GZyS3PWw1Ki4bMnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4833
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.31; envelope-from=chen.zhang@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Lukas Straub <lukasstraub2@web.de>, Li
 Zhijian <lizhijian@cn.fujitsu.com>, Tao
 Xu <tao3.xu@intel.com>, qemu-dev <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jason~

Have any comments or updates for this patch?

Thanks
Chen

> -----Original Message-----
> From: Markus Armbruster <armbru@redhat.com>
> Sent: Tuesday, October 12, 2021 5:31 PM
> To: Zhang, Chen <chen.zhang@intel.com>
> Cc: Jason Wang <jasowang@redhat.com>; Eric Blake <eblake@redhat.com>;
> qemu-dev <qemu-devel@nongnu.org>; Li Zhijian <lizhijian@cn.fujitsu.com>;
> Lukas Straub <lukasstraub2@web.de>; Tao Xu <tao3.xu@intel.com>
> Subject: Re: [PATCH V3] net/colo: check vnet_hdr_support flag when using
> virtio-net
>=20
> Jason, did this fall through the cracks?
>=20
> Zhang Chen <chen.zhang@intel.com> writes:
>=20
> > When COLO use only one vnet_hdr_support parameter between COLO
> network
> > filter(filter-mirror, filter-redirector or filter-rewriter and
> > colo-compare, packet will not be parsed correctly. Acquire network
> > driver related to COLO, if it is nirtio-net, check vnet_hdr_support
> > flag of COLO network filter and colo-compare.
> >
> > Signed-off-by: Tao Xu <tao3.xu@intel.com>
> > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> > ---
> >
> > Changelog:
> > v3:
> >     Fix some typos.
> >     Rebased for Qemu 6.2.
> >
> > v2:
> >     Detect virtio-net driver and apply vnet_hdr_support
> >     automatically. (Jason)
> > ---
> >  net/colo-compare.c    | 57
> +++++++++++++++++++++++++++++++++++++++++++
> >  net/colo.c            | 20 +++++++++++++++
> >  net/colo.h            |  4 +++
> >  net/filter-mirror.c   | 21 ++++++++++++++++
> >  net/filter-rewriter.c | 10 ++++++++
> >  qapi/qom.json         |  6 +++++
> >  qemu-options.hx       |  6 +++--
> >  7 files changed, 122 insertions(+), 2 deletions(-)
> >
> > diff --git a/net/colo-compare.c b/net/colo-compare.c index
> > b100e7b51f..870bd05a41 100644
> > --- a/net/colo-compare.c
> > +++ b/net/colo-compare.c
> > @@ -110,6 +110,7 @@ struct CompareState {
> >      char *sec_indev;
> >      char *outdev;
> >      char *notify_dev;
> > +    char *netdev;
> >      CharBackend chr_pri_in;
> >      CharBackend chr_sec_in;
> >      CharBackend chr_out;
> > @@ -838,6 +839,28 @@ static int compare_chr_can_read(void *opaque)
> >      return COMPARE_READ_LEN_MAX;
> >  }
> >
> > +static int colo_set_default_netdev(void *opaque, QemuOpts *opts,
> > +Error **errp) {
> > +    const char *colo_obj_type, *netdev_from_filter;
> > +    char **netdev =3D (char **)opaque;
> > +
> > +    colo_obj_type =3D qemu_opt_get(opts, "qom-type");
> > +
> > +    if (colo_obj_type &&
> > +        (strcmp(colo_obj_type, "filter-mirror") =3D=3D 0 ||
> > +         strcmp(colo_obj_type, "filter-redirector") =3D=3D 0 ||
> > +         strcmp(colo_obj_type, "filter-rewriter") =3D=3D 0)) {
> > +        netdev_from_filter =3D qemu_opt_get(opts, "netdev");
> > +        if (*netdev =3D=3D NULL) {
> > +            *netdev =3D g_strdup(netdev_from_filter);
> > +        } else if (strcmp(*netdev, netdev_from_filter) !=3D 0) {
> > +            warn_report("%s is using a different netdev from other COL=
O "
> > +                        "component", colo_obj_type);
> > +        }
> > +    }
> > +    return 0;
> > +}
> > +
> >  /*
> >   * Called from the main thread on the primary for packets
> >   * arriving over the socket from the primary.
> > @@ -1050,6 +1073,21 @@ static void compare_set_vnet_hdr(Object *obj,
> >      s->vnet_hdr =3D value;
> >  }
> >
> > +static char *compare_get_netdev(Object *obj, Error **errp) {
> > +    CompareState *s =3D COLO_COMPARE(obj);
> > +
> > +    return g_strdup(s->netdev);
> > +}
> > +
> > +static void compare_set_netdev(Object *obj, const char *value, Error
> > +**errp) {
> > +    CompareState *s =3D COLO_COMPARE(obj);
> > +
> > +    g_free(s->netdev);
> > +    s->netdev =3D g_strdup(value);
> > +}
> > +
> >  static char *compare_get_notify_dev(Object *obj, Error **errp)  {
> >      CompareState *s =3D COLO_COMPARE(obj); @@ -1274,6 +1312,12 @@
> > static void colo_compare_complete(UserCreatable *uc, Error **errp)
> >          max_queue_size =3D MAX_QUEUE_SIZE;
> >      }
> >
> > +    if (!s->netdev) {
> > +        /* Set default netdev as the first colo netfilter found */
> > +        qemu_opts_foreach(qemu_find_opts("object"),
> > +                          colo_set_default_netdev, &s->netdev, NULL);
> > +    }
> > +
> >      if (find_and_check_chardev(&chr, s->pri_indev, errp) ||
> >          !qemu_chr_fe_init(&s->chr_pri_in, chr, errp)) {
> >          return;
> > @@ -1289,6 +1333,16 @@ static void
> colo_compare_complete(UserCreatable *uc, Error **errp)
> >          return;
> >      }
> >
> > +    if (!s->vnet_hdr &&
> > +        qemu_opts_foreach(qemu_find_opts("device"),
> > +                          vnet_driver_check, s->netdev, NULL)) {
> > +        /*
> > +         * colo compare needs 'vnet_hdr_support' when it works on virt=
io-net,
> > +         * add 'vnet_hdr_support' automatically
> > +         */
> > +        s->vnet_hdr =3D true;
> > +    }
> > +
> >      net_socket_rs_init(&s->pri_rs, compare_pri_rs_finalize, s->vnet_hd=
r);
> >      net_socket_rs_init(&s->sec_rs, compare_sec_rs_finalize,
> > s->vnet_hdr);
> >
> > @@ -1400,6 +1454,9 @@ static void colo_compare_init(Object *obj)
> >      s->vnet_hdr =3D false;
> >      object_property_add_bool(obj, "vnet_hdr_support",
> compare_get_vnet_hdr,
> >                               compare_set_vnet_hdr);
> > +    /* colo compare can't varify that netdev is correct */
> > +    object_property_add_str(obj, "netdev", compare_get_netdev,
> > +                            compare_set_netdev);
> >  }
> >
> >  void colo_compare_cleanup(void)
> > diff --git a/net/colo.c b/net/colo.c
> > index 3a3e6e89a0..4a03780f45 100644
> > --- a/net/colo.c
> > +++ b/net/colo.c
> > @@ -243,3 +243,23 @@ bool connection_has_tracked(GHashTable
> > *connection_track_table,
> >
> >      return conn ? true : false;
> >  }
> > +
> > +/* check the network driver related to COLO, return 1 if it is
> > +virtio-net */ int vnet_driver_check(void *opaque, QemuOpts *opts,
> > +Error **errp) {
> > +    const char *driver_type, *netdev_from_driver;
> > +    char *netdev_from_filter =3D (char *)opaque;
> > +
> > +    driver_type =3D qemu_opt_get(opts, "driver");
> > +    netdev_from_driver =3D qemu_opt_get(opts, "netdev");
> > +
> > +    if (!driver_type || !netdev_from_driver || !netdev_from_filter) {
> > +        return 0;
> > +    }
> > +
> > +    if (g_str_has_prefix(driver_type, "virtio-net") &&
> > +        strcmp(netdev_from_driver, netdev_from_filter) =3D=3D 0) {
> > +        return 1;
> > +    }
> > +    return 0;
> > +}
> > diff --git a/net/colo.h b/net/colo.h
> > index d91cd245c4..d401fc76b6 100644
> > --- a/net/colo.h
> > +++ b/net/colo.h
> > @@ -18,6 +18,9 @@
> >  #include "qemu/jhash.h"
> >  #include "qemu/timer.h"
> >  #include "net/eth.h"
> > +#include "qemu/option.h"
> > +#include "qemu/option_int.h"
> > +#include "qemu/config-file.h"
> >
> >  #define HASHTABLE_MAX_SIZE 16384
> >
> > @@ -104,5 +107,6 @@ Packet *packet_new(const void *data, int size, int
> > vnet_hdr_len);  Packet *packet_new_nocopy(void *data, int size, int
> > vnet_hdr_len);  void packet_destroy(void *opaque, void *user_data);
> > void packet_destroy_partial(void *opaque, void *user_data);
> > +int vnet_driver_check(void *opaque, QemuOpts *opts, Error **errp);
> >
> >  #endif /* NET_COLO_H */
> > diff --git a/net/filter-mirror.c b/net/filter-mirror.c index
> > f20240cc9f..69ca9c9839 100644
> > --- a/net/filter-mirror.c
> > +++ b/net/filter-mirror.c
> > @@ -12,6 +12,7 @@
> >  #include "qemu/osdep.h"
> >  #include "net/filter.h"
> >  #include "net/net.h"
> > +#include "net/colo.h"
> >  #include "qapi/error.h"
> >  #include "qom/object.h"
> >  #include "qemu/main-loop.h"
> > @@ -224,6 +225,16 @@ static void filter_mirror_setup(NetFilterState *nf=
,
> Error **errp)
> >          return;
> >      }
> >
> > +    if (!s->vnet_hdr &&
> > +        qemu_opts_foreach(qemu_find_opts("device"),
> > +                          vnet_driver_check, nf->netdev_id, NULL)) {
> > +        /*
> > +         * filter mirror needs 'vnet_hdr_support' when colo filter mod=
ules
> > +         * work on virtio-net, add 'vnet_hdr_support' automatically
> > +         */
> > +        s->vnet_hdr =3D true;
> > +    }
> > +
> >      qemu_chr_fe_init(&s->chr_out, chr, errp);  }
> >
> > @@ -252,6 +263,16 @@ static void filter_redirector_setup(NetFilterState
> *nf, Error **errp)
> >          }
> >      }
> >
> > +    if (!s->vnet_hdr &&
> > +        qemu_opts_foreach(qemu_find_opts("device"),
> > +                          vnet_driver_check, nf->netdev_id, NULL)) {
> > +        /*
> > +         * filter redirector needs 'vnet_hdr_support' when colo filter=
 modules
> > +         * work on virtio-net, add 'vnet_hdr_support' automatically
> > +         */
> > +        s->vnet_hdr =3D true;
> > +    }
> > +
> >      net_socket_rs_init(&s->rs, redirector_rs_finalize, s->vnet_hdr);
> >
> >      if (s->indev) {
> > diff --git a/net/filter-rewriter.c b/net/filter-rewriter.c index
> > cb3a96cde1..637ef4ce71 100644
> > --- a/net/filter-rewriter.c
> > +++ b/net/filter-rewriter.c
> > @@ -388,6 +388,16 @@ static void colo_rewriter_setup(NetFilterState
> > *nf, Error **errp)  {
> >      RewriterState *s =3D FILTER_REWRITER(nf);
> >
> > +    if (!s->vnet_hdr &&
> > +        qemu_opts_foreach(qemu_find_opts("device"),
> > +                          vnet_driver_check, nf->netdev_id, NULL)) {
> > +        /*
> > +         * filter rewriter needs 'vnet_hdr_support' when colo filter m=
odules
> > +         * work on virtio-net, add 'vnet_hdr_support' automatically
> > +         */
> > +        s->vnet_hdr =3D true;
> > +    }
> > +
> >      s->connection_track_table =3D
> g_hash_table_new_full(connection_key_hash,
> >                                                        connection_key_e=
qual,
> >                                                        g_free, diff
> > --git a/qapi/qom.json b/qapi/qom.json index a25616bc7a..5760107160
> > 100644
> > --- a/qapi/qom.json
> > +++ b/qapi/qom.json
> > @@ -241,6 +241,11 @@
> >  # @notify_dev: name of the character device backend to be used to
> communicate
> >  #              with the remote colo-frame (only for Xen COLO)
> >  #
> > +# @netdev: id of the network device backend to colo-compare. Although
> > +#          colo-compare doesn't depend on network device directly, thi=
s
> > +#          parameter helps colo-compare know what network driver it is
> > +#          working on.(since 6.2)
> > +#
> >  # @compare_timeout: the maximum time to hold a packet from
> @primary_in for
> >  #                   comparison with an incoming packet on @secondary_i=
n in
> >  #                   milliseconds (default: 3000)
> > @@ -264,6 +269,7 @@
> >              'outdev': 'str',
> >              'iothread': 'str',
> >              '*notify_dev': 'str',
> > +            '*netdev': 'str',
> >              '*compare_timeout': 'uint64',
> >              '*expired_scan_cycle': 'uint32',
> >              '*max_queue_size': 'uint32', diff --git a/qemu-options.hx
> > b/qemu-options.hx index 8f603cc7e6..250937fbbf 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -4964,12 +4964,14 @@ SRST
> >          stored. The file format is libpcap, so it can be analyzed with
> >          tools such as tcpdump or Wireshark.
> >
> > -    ``-object colo-
> compare,id=3Did,primary_in=3Dchardevid,secondary_in=3Dchardevid,outdev=3D=
chard
> evid,iothread=3Did[,vnet_hdr_support][,notify_dev=3Did][,compare_timeout=
=3D@
> var{ms}][,expired_scan_cycle=3D@var{ms}][,max_queue_size=3D@var{size}]``
> > +    ``-object
> > + colo-
> compare,id=3Did,primary_in=3Dchardevid,secondary_in=3Dchardevid,outde
> > + v=3Dchardevid,iothread=3Did[,netdev=3Dnetdevid][,vnet_hdr_support][,n=
otify
> > +
> _dev=3Did][,compare_timeout=3D@var{ms}][,expired_scan_cycle=3D@var{ms}][,
> m
> > + ax_queue_size=3D@var{size}]``
> >          Colo-compare gets packet from primary\_in chardevid and
> >          secondary\_in, then compare whether the payload of primary pac=
ket
> >          and secondary packet are the same. If same, it will output
> >          primary packet to out\_dev, else it will notify COLO-framework=
 to do
> > -        checkpoint and send primary packet to out\_dev. In order to
> > +        checkpoint and send primary packet to out\_dev. Although colo-
> compare
> > +        does not depend on network device directly, netdevid helps
> > +        colo-compare know what network driver it is working on. In
> > + order to
> >          improve efficiency, we need to put the task of comparison in
> >          another iothread. If it has the vnet\_hdr\_support flag,
> >          colo compare will send/recv packet with vnet\_hdr\_len.



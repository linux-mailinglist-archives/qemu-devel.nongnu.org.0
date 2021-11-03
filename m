Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A741443B22
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 02:51:23 +0100 (CET)
Received: from localhost ([::1]:37236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi5Qw-0000YM-8Z
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 21:51:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1mi5PW-0008Dw-Gk
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 21:49:54 -0400
Received: from mga12.intel.com ([192.55.52.136]:35469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1mi5PU-00041C-4w
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 21:49:53 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="211467833"
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; d="scan'208";a="211467833"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 18:49:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; d="scan'208";a="583931120"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga002.fm.intel.com with ESMTP; 02 Nov 2021 18:49:43 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 2 Nov 2021 18:49:42 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 2 Nov 2021 18:49:42 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 2 Nov 2021 18:49:42 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 2 Nov 2021 18:49:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n+UBP4mUrL3z1JYhytITA/jz2SGsgU6NZVddGkxRZTINTN2wUvZP638ZUr95i+B+fnx/OFmeRnE9v5MhKcTeOmPo3ci2Jewfgxr3XazJxTFwpxnUlzbe9bAZbaId1VFY2o4bC2w8OMys9oyOHNvxZ8UEPH7Gvy0NbwHQEfmxMw94PMRDoiWXCYvcnIFuKkOR/bzHq/l95llz3sEiDANtgzW4dniIG497a6WvjxnwAlZQSte/zyZcAXQ/LUDPsE0Qhj8SPm9YkZfBKldgwCPFz/WVld15krezHBn/ZRw7FXnE78E+Dmb6wgOc55dUU1lq7XTR5ncTw2F6lnfQFAG2wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SKEtk9gcRsY1hb1bhbBU4KsBVfzyfULzw96BsS2i/8w=;
 b=U3ztVaD+yV7xzrG/g1ZqK4/fKSrrWsMfEeaXJiDbL0eBQ9I8/BIBJ9B0cnEOCb31iaQ3RcRi92pGDvm+y0K4KcDcjE/ab1GA4nqFij13K+aItKNxanmmYutXj/S0WA77nImIR6rw4uxvVJuIzTqRUfLEdkBe+is0mjmFd8X1J85X0GwI5mVENV7bj2zQ5UcPuKMCX6R7NUyp9eTtppNg3RI8Pm22AFGFqHUEc44pWr68JCg9km6To4WXXKNLjAT+twM6XRgdY3naYn2f6e4dDg7BoGpOHLuZXMxomtEWcI7WtCAS6z58I94m9Dd2ewdxPSOZMvvSIM0OsAVFRBBPeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SKEtk9gcRsY1hb1bhbBU4KsBVfzyfULzw96BsS2i/8w=;
 b=gOb0lIPp0AQlv9IDAaLHxXILpClTB4oNC+DJpR1iMn7ZE/VajOJbAKW7GAxy2zmSXahAtzaSdhMLgRDMO2s+F2UlQN49n7RteZn+SSBjvOLPFH9JuyTkYmoPsxHHqx82LtRnUz+bWM+U62GFWKoiZRuSKCTV1iqMnwNcOhYwk2A=
Received: from DM8PR11MB5640.namprd11.prod.outlook.com (2603:10b6:8:3f::14) by
 DM8PR11MB5637.namprd11.prod.outlook.com (2603:10b6:8:33::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.10; Wed, 3 Nov 2021 01:49:41 +0000
Received: from DM8PR11MB5640.namprd11.prod.outlook.com
 ([fe80::9c4d:5c63:9fdd:53da]) by DM8PR11MB5640.namprd11.prod.outlook.com
 ([fe80::9c4d:5c63:9fdd:53da%3]) with mapi id 15.20.4669.010; Wed, 3 Nov 2021
 01:49:41 +0000
From: "Rao, Lei" <lei.rao@intel.com>
To: "quintela@redhat.com" <quintela@redhat.com>
Subject: RE: [PATCH v2 7/7] Optimized the function of fill_connection_key.
Thread-Topic: [PATCH v2 7/7] Optimized the function of fill_connection_key.
Thread-Index: AQHXzvdIBYwhJX2CjUmqhHHQq8ty1qvwcNFAgACWF9A=
Date: Wed, 3 Nov 2021 01:49:41 +0000
Message-ID: <DM8PR11MB5640E3DA278886F5F8B8AAEBFD8C9@DM8PR11MB5640.namprd11.prod.outlook.com>
References: <1635753425-11756-1-git-send-email-lei.rao@intel.com>
 <1635753425-11756-8-git-send-email-lei.rao@intel.com>
 <87cznih6ie.fsf@secure.mitica>
In-Reply-To: <87cznih6ie.fsf@secure.mitica>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8133b62a-af16-417a-c21a-08d99e6c341e
x-ms-traffictypediagnostic: DM8PR11MB5637:
x-microsoft-antispam-prvs: <DM8PR11MB56379E79F66CFB79ABCBC05FFD8C9@DM8PR11MB5637.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QM4k3AKolGZiWbsLCd5L6Qvi2HyXfC+Z0nYflrldL2A36xUaxiu8oxx5d6nDXdXKzcJltaYcqoNFN5Tto9p+Slvv5ZnT9SMmoaWQGw5pOgdb6szNRJ9kM8RLmUJWeVYfb3LOycZwRcU/CkvNKpemombHqysTPzgT9dGC2qoYWO7ZL8D26QLYHMmA9HuOMaev/0qqEDJNJ7Xl83WrnMS7ljISO4SwoGo+oUnMgFO7CoKTmDhE2wBiuETnM3yZShqJV8/EVoOe6kqHmewUWhuZ3orw6b/s5HN4IeMAVw31LvgBCepOI+nqFADpu+V3+Xs6MkoI6pHi3zgMRJHxkswN8ZIFgrV822wWdiWn58dNzKARXttXtcOIuEVG5t16xuDs7JH7HqgSVBnHOd+jyzmaAgXsSD3sxO7kAMVpkca9Y4t4g9odGxF/6voUp/Za9MxF5RLSCcU+o51pgX04hOn+lv8InnYY202b0CmXCJsnaqa1g5MSYcyTxY2hjzTZhhd4NjwTkd0MliZWPQ03HlgU27oJFP+UbS5p/cXqeG1mS6FSkHp+Y8cCIPSF3CaJsJRwe/sq5aeJiFMe4jLKShfG+wYKe5yc1o8J+H4pU9uPfSw/Nc8oC5HGFE5X+PgQSKGsoXgW+iv2+OpiSdslIKC8r7c6VuEJB6cX1YO5g8fP0X3nTv8x8ck8ReDC79hdhYrzirF7yHzTYpfCTMN851nfzA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5640.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(4326008)(71200400001)(82960400001)(66556008)(64756008)(66446008)(6916009)(5660300002)(38070700005)(86362001)(9686003)(52536014)(316002)(122000001)(53546011)(6506007)(186003)(508600001)(8676002)(54906003)(4744005)(8936002)(76116006)(83380400001)(7696005)(66946007)(38100700002)(55016002)(2906002)(26005)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TgftPBhr1iT7EpOFzIz7+dZYdtGyqKZ64KdCgUy1wShg1OJIkHCJwPUzT+nE?=
 =?us-ascii?Q?RDe24Ddpu/U2+d+N6nnw1LH5WHZIR5/IpbDngNfqoss4Q2F8GC5o2u6FOVIJ?=
 =?us-ascii?Q?a7LAjeiTu1xerhwoaa0HXxxx8k4lmRC7qk/Oqzw+RLniYU+1bSUiI/k7lMoA?=
 =?us-ascii?Q?Mf1f9QyL9etaRZHWcpWhxXvuhnZQynrwCdccH+Sv3SSWW94Ghpe/GEh5GqsH?=
 =?us-ascii?Q?5yt/+cSHkPYio+cOAYvSrFPO14NrRYUQGdGhlAw3ahIiQ8JYUTOf2qfwLwVG?=
 =?us-ascii?Q?+d+wM/sDpKI0wzwF2lIVXxbVKwx1/R/rlvJcB++dO9p1UGqfz9bNRKsB7iG7?=
 =?us-ascii?Q?cA+z8SIKCa8LzwhhfYYuYiBdGJG64DBLa9cRrAHzuV31lUJb3/3vh5iDdQXc?=
 =?us-ascii?Q?XRXHHgymrezzwMrOklA32KtCkepxZOwBfPOLip94I8hu/bJL/NQi/kz+ci8P?=
 =?us-ascii?Q?xFq7SduTaP5vrJ7ynwzpBSkwM0aO20hzlGxheKRPTMTfj+zh3dSl19Dbh0FQ?=
 =?us-ascii?Q?IhI0ZpN3/9Myh9S2rbFQr91r6vobG1xlyapikVLcq/dknpQ2pcftNhiByZmC?=
 =?us-ascii?Q?xsERmyimzskGqNF/zrbK0iJEldAlSPqY4KoHOS53hWeLYi5GVN3SpWMkPFRx?=
 =?us-ascii?Q?9lLh6zRD6IiUnnoB3Xn+PKw3Cb7FPq14rPv9//qCPgzgSDVyMfbI1Ip/pCr3?=
 =?us-ascii?Q?nZDdiYrzZ68x+9EH3vOWZlqLoMjgdWfIDkB27K5lfFKt/RrPKAwUDzeoKiMA?=
 =?us-ascii?Q?tMXf0BI1pbKg27oM8gxVa9ZBtiiBIB3yyPJtq8coL7d36eIbov0RML8hjqZu?=
 =?us-ascii?Q?g58G/1Q/m7K88a+/OiM1+dHCRkskkcStjfkx1ZPMYpfEFW9hHVi+16l/Xp5B?=
 =?us-ascii?Q?iF5BEJNkhtynOmjpTjJ3+VEBh0ASbHUlknprm6q/5hknGXDAw2UJGs/3LERb?=
 =?us-ascii?Q?AJkpVX5vYLK46I6IMyNYdivcHP7LZIX0o/ylr67MUQgRmUGc6dc+rWdtZs1H?=
 =?us-ascii?Q?BslmOPiMQM114DbAiYxCzESlhmOao+zkPerUOBqjE+b5oxdVhtKb16mepabM?=
 =?us-ascii?Q?FgnFRC1NDVh2m7MUeMYF49s/yGSrWZjQiKSoADt92h4s8T/1UPIh/WSPOBQ0?=
 =?us-ascii?Q?cYba7H214XCmmIU7vpVMMpHeZ1JtEyBYTGEkvM36CwYNECByx+USorraI1r1?=
 =?us-ascii?Q?lmVO2njsM047hHJkZwqOXzf6hV7JP9iBoacrfTyR3RCaNuPjzJ5gXqNMZtgI?=
 =?us-ascii?Q?Cr9S09BpdoQy26olDjgPT7Ag0hKI8Y75sCqxNMUPhkVTYZVTMOKXfD7uDrRt?=
 =?us-ascii?Q?eeDaaR7UeymfRW159uIOr/91A9YpxPJoGSmsq0l8Y2Ul7oF5BUAktHxMFN87?=
 =?us-ascii?Q?w8iHdjjvAvEWhPreRff26AmJM/Sr3mahlBhKxa+EXKS+5cZcTJCIN/rFgfC2?=
 =?us-ascii?Q?Tgtea5L1UrGHX6UdQYuyH2IWiHJhSx2sxUBuquE6kav3M33mX03IAFh7XMH+?=
 =?us-ascii?Q?iQpVtwW3kpaelV0PALnWLTRQekp8GAvjzy1aw83M4R6vH2QSolmwf0oGl5jO?=
 =?us-ascii?Q?2pViE81jcxLvxotsXSHb9qtkAJ+uu8B/ijJ159gPVkxoQW8QYZltAnFgk/Cw?=
 =?us-ascii?Q?Iw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5640.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8133b62a-af16-417a-c21a-08d99e6c341e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2021 01:49:41.6807 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QGEkgXvOMHfp/h9l++VGecW2TW7c0alc/LkGlA5KLp1vjWhXaRPhbdkj+WU43ZYEGINoa+5LkkTCAyP5IuGWdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5637
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.136; envelope-from=lei.rao@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: "lukasstraub2@web.de" <lukasstraub2@web.de>,
 "zhang.zhanghailiang@huawei.com" <zhang.zhanghailiang@huawei.com>,
 "lizhijian@cn.fujitsu.com" <lizhijian@cn.fujitsu.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Zhang,
 Chen" <chen.zhang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Will be changed and sent separately.

Thanks,
Lei

-----Original Message-----
From: Juan Quintela <quintela@redhat.com>=20
Sent: Wednesday, November 3, 2021 12:23 AM
To: Rao, Lei <lei.rao@intel.com>
Cc: Zhang, Chen <chen.zhang@intel.com>; lizhijian@cn.fujitsu.com; jasowang@=
redhat.com; zhang.zhanghailiang@huawei.com; lukasstraub2@web.de; dgilbert@r=
edhat.com; qemu-devel@nongnu.org
Subject: Re: [PATCH v2 7/7] Optimized the function of fill_connection_key.

"Rao, Lei" <lei.rao@intel.com> wrote:
> From: "Rao, Lei" <lei.rao@intel.com>
>
> Remove some unnecessary code to improve the performance of the=20
> filter-rewriter module.
>
> Signed-off-by: Lei Rao <lei.rao@intel.com>
> Reviewed-by: Zhang Chen <chen.zhang@intel.com>

As Chen has already reviewed it:

Reviewed-by: Juan Quintela <quintela@redhat.com>

But I think that you should change in a following patch:

s/int reverse/bool reverse/

Later, Juan.



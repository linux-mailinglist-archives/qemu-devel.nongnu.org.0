Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E91FA42B65B
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 08:07:58 +0200 (CEST)
Received: from localhost ([::1]:60246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maXQj-0002l7-Vq
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 02:07:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1maXPY-0001PP-3a
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 02:06:44 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:35266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1maXPW-0003Dx-3K
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 02:06:43 -0400
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19CMf0Mm026982; 
 Tue, 12 Oct 2021 23:06:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=3YRAMHXZr5yLFta0O5MyCFAGwpxQbTRx0ojbEGEQjCw=;
 b=oes51yGe2JHDH7O8so33zN1PhRW2Lum60lACqemzEBRBckUnnUoaVrDshh2HStiyffZk
 U7qtuJyJ22PSSMFlpMVRPXAXt4mGvn0wWo/btJErFCOSuTYaPJMqT6Vp+vwtA1O7wBaQ
 b91MIuRbP09WMhbjKpWkzZRGhSOgZkEqrhO5afAaenRfuc+LMgggFLUhKTrX/ISO9Hqt
 404FIH6FizqBuj9iRbuQU/UqA/UmtVdou7xh8LWFIiXkVbg2y7KZxUubmoV+kO7nlmu4
 RybOXUucrTIZQqtsPuJJ6yW7NuoZ72tj+XxkuobxLv6oggXqPf4MtpoRk/qIKDh92RYG uw== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2171.outbound.protection.outlook.com [104.47.73.171])
 by mx0b-002c1b01.pphosted.com with ESMTP id 3bnkc88kha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Oct 2021 23:06:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oF+UUAiuu0QZhrIOyjBAq3nhw2s286iVE/HwKW/ZR8BznfrGUPnqSMjnSqVxL5O9yozoZUvD6LGPf61//eeA3yxh27pS3hnOrNEUtUvQJ03KlIShKl1lv5FphtEEG3ldX0RelpKZG4kdTNWKEWjQxZv4HebYkUrAGDz5jc6wkeFqW5QbNul67vpD4EWxx/mcoqI+WBDlepT+klACu6TV9vJIpNdJZXW4vsEbpSI7HHCB6T6WOL6vAou+kyMIORZZQvyVp8P4Zu4O+3aEDCYxqsi7d5lBgiqWDSEvf1P6gLsgVnkf75ZKAHcqYTFNSGxVbEw/WIdLPwIZKoGVxvtc8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3YRAMHXZr5yLFta0O5MyCFAGwpxQbTRx0ojbEGEQjCw=;
 b=W4z/cPQQhpSbJdBADZbhUqyfrRPvmFfm/Pp0tKjWh8lmX7JI7wsKnDawhZld1WOlMFhos1iYEpP31s8ici/Kg2gdvYtpE0OV545p09Uu8H6wXNnwqdFV6taBKlsyG58VAi6u3hq8EiJISn4RjSFEkm9Fnec9unvQQ01uy9LEUUou1F65HFMk8wnneItf6JporQpT5MPi0OshSePKJkooJOGteXUfg+FpLEXj8gFzEIM3DzJf+pIOjvjafbodtiOuBAkD7tc9f2DaZ2xhnqOgcud4/bOsklJtujMlDiYkBxHMsUrKJqB+FpFd6wTisvsaaaNvX31S3jbaWYQJ3F5tFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from CH0PR02MB7947.namprd02.prod.outlook.com (2603:10b6:610:104::22)
 by CH2PR02MB6055.namprd02.prod.outlook.com (2603:10b6:610:3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Wed, 13 Oct
 2021 06:06:36 +0000
Received: from CH0PR02MB7947.namprd02.prod.outlook.com
 ([fe80::95a5:72e6:5a62:470c]) by CH0PR02MB7947.namprd02.prod.outlook.com
 ([fe80::95a5:72e6:5a62:470c%6]) with mapi id 15.20.4587.026; Wed, 13 Oct 2021
 06:06:36 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1] libvhost-user: fix VHOST_USER_REM_MEM_REG not closing
 the fd
Thread-Topic: [PATCH v1] libvhost-user: fix VHOST_USER_REM_MEM_REG not closing
 the fd
Thread-Index: AQHXv5h+sI2TRXPscUaomCe3odWO1avQccCA
Date: Wed, 13 Oct 2021 06:06:36 +0000
Message-ID: <20211013060633.GB8032@raphael-debian-dev>
References: <20211012183832.62603-1-david@redhat.com>
In-Reply-To: <20211012183832.62603-1-david@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8830ff15-81de-41fa-7e61-08d98e0f9d4b
x-ms-traffictypediagnostic: CH2PR02MB6055:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR02MB6055968AB4BBD19F4D19FDDFEAB79@CH2PR02MB6055.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FfR1zXPAbAwgTS//gpybUcJHXKbo5AOQN9+l+uNeZRKgr3G+Ok6VqSMit3eg/aMcOXRg8cWxOHkvUAJ4/XeDWuOCwNfGLLMzGgs7VS7/lJdIr+g5LQXrppx/ltOHGlgKwmqfSzII8dBW3Bf5aJDD5eEAELaNPGWgg6zbNRONSOuTslue8Sy9nGinefFMnRVpf3mMzAR4lAHGWhrPOd6uNkvo7wqBk3S6fyCsdNSCJqT1p1jJdzd3vCEhs5VUq7fRhdbCH0QsEbyhJW07g4i/p3d1LT4e6fMt7dhLXZOGYVZ9ps1Q5C16Ph4I/q9Fb6FZ5/Ystz+pUSHKanN7ZztUFo8IhgJWS4GYQFpfKjqfI4LhsI6EZ1yZ7poftkcUyCq7ivw7PWGgn5KHa+ciQieu/VeLJ6iWVv6xGW661vBKXVW03OTvwQV/dWHs4hI3YWWdGnp6k1avA04CuT5Jj82TO/75rNzQj+88IIzJePV5ssU9DhUGoUZg343McVe5ZN0bzK08zAKGZSjm2tA3d7mYkMUKyMWPazUzXaJTxmVbrxtbcmi5tH2GI+dB1LfXszt7e7OoPPLm9NkdT8NGamghgKq5q3PVSZZoYpzsnFYgSuQDd4fuCkBp3NWmxkHKJAF9YdEBIpZUggJQDMcO3MZMlRnOKcE75pIfCvCQIdXWuhS10lg2w8wAUtZrdpHMo6hWrznx+oNtnGSlkS2Wsk/Fgw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR02MB7947.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(64756008)(66556008)(66476007)(91956017)(38070700005)(66446008)(86362001)(66946007)(83380400001)(38100700002)(122000001)(33656002)(76116006)(5660300002)(6512007)(9686003)(508600001)(44832011)(33716001)(6486002)(1076003)(6916009)(4326008)(8936002)(4744005)(186003)(2906002)(26005)(8676002)(54906003)(316002)(71200400001)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?INmICCR/CFikOnQZ+J7wbbciL9uZlmufuPX7dEh4uKc9324NZHx8+QT6Ps?=
 =?iso-8859-1?Q?GQfLSBaqDt83JZcIShPw4K6vIIhsiQy4fQ+PVqjQtTsL911jczcUYNqhMO?=
 =?iso-8859-1?Q?F9DmAfBPiAWkHo/6Oy1yukMFYknv+CkAvhXnONUlIJCp09K0T9bskg/7tD?=
 =?iso-8859-1?Q?vxv6gP+WxTQpwuXejjxAnNQtsVv9CvGJ3LUG6ngUjr6Fa/cMbvO3tn14k1?=
 =?iso-8859-1?Q?+fTtUMgJs1lDO6YkwqXYxTfm0nNCJaDOCBq4FNgsYtGM9iLGm0mBCLQXX8?=
 =?iso-8859-1?Q?Vyzpz1qM5Bu1Ww7WQ79n8CXbpLlO5feRgNPbsxK+KGHxeBYJa6WGu9aZvK?=
 =?iso-8859-1?Q?AyIPYeCD3as3NVTRrvX1YSjHgYlUVjxt9gY8mSgbQ+MbpN2VdZdxGrR2uL?=
 =?iso-8859-1?Q?7hVhA8Jzyq5LlHT7O3MsZA3ArexRcRQhCs7wcFqOKlMEoWoprLP0OHsk6z?=
 =?iso-8859-1?Q?Ry9cHGuIeCSMPlxfZAKDBfeiZU9QiU6+Oj8HjJ4OMJ37jwptnompFlvfJi?=
 =?iso-8859-1?Q?l5cz/dm0FfyjAW1MQzd8OKS1tpgMmyR09mCb8E0a24Pvqxh+H7wKww4a2F?=
 =?iso-8859-1?Q?nGHIQ6YwKDwVzZhcSaPqpyPLNpRVubtswuBRQF88UMcvlqXTDLkbOmctEx?=
 =?iso-8859-1?Q?k9VsA7m4nLyNH/q7JpL/KRdJuyJP42IUGrjCFEGJSFecwBE1CSCYAS3oHD?=
 =?iso-8859-1?Q?c96WL75Q+YJlrLzB4z1OEwU/LL7D29HNNISm7pY5QSGtuQjJ2N78vNBs7Q?=
 =?iso-8859-1?Q?T1R3siy/M293thCNPzPokPg48XHrPKPAC7b4ewhXzFWw3hxQGafMsw4y4l?=
 =?iso-8859-1?Q?862y1BpPNGa9oF616ZZeXldtIOvAS/oa9aJ+1WHmoK/WOkuQuPlCUoOLRI?=
 =?iso-8859-1?Q?WygpTgpapOr2/PxkFLEDCN6yy7S2s6Z9aDvKlebWS4xEYDOb1PKgP/smOY?=
 =?iso-8859-1?Q?Ow8SKSorXZENgLnSeyO6YHfUIw9+6eMGeFiNdraGOXSh95cU9LQB+2R8/u?=
 =?iso-8859-1?Q?uzaBRZi7mJKXX1FTXg9izjVSUHK5crfcWVaCBs6CZP6SXNKU7CbPS66vzQ?=
 =?iso-8859-1?Q?JTcpvhSFu+uzZN5ZvUwsGapExIB4C8fVuuYAmC1IM4nIna2c59xZ5QOmzG?=
 =?iso-8859-1?Q?YTnN9Dxs2kojo8UiRgBmeRBr899MCv6U3pgVEqt6vUc4Jg0CH/7vC3GGuR?=
 =?iso-8859-1?Q?6miVqB2hOds/x9Dx4vgFoEns3uGbnpwHAhURP45FPoiqDn7JHYdeirL1mJ?=
 =?iso-8859-1?Q?bcL5+0fx/y7gF7p2kNcs1KYvDMibBCMXu0BaSqY1hrURMMiJnUSJg/SSY/?=
 =?iso-8859-1?Q?rEHiWYcdocVJWB1VXeNcMa+2muOFz8UCvL8Gd335KkJjIJZBaZFPIKzsoa?=
 =?iso-8859-1?Q?FJESsa/DR/?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <748ABA5963F6D44AA74E9E2266ADE533@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR02MB7947.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8830ff15-81de-41fa-7e61-08d98e0f9d4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2021 06:06:36.3065 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iWoht4Y3IODk2QYXRS/eh6S8ktk9tLZFRTz9ysE/HHk0mPwEQlPCbog3Mc4zW99u3EgBe2dJxiYVtE50t6LuipQEg/WZTnsuqywfp9L6SJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6055
X-Proofpoint-GUID: A8FDT8IzL5v-YypzZsPzePEXBSLxjRbr
X-Proofpoint-ORIG-GUID: A8FDT8IzL5v-YypzZsPzePEXBSLxjRbr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-13_01,2021-10-13_01,2020-04-07_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Coiby Xu <coiby.xu@gmail.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 12, 2021 at 08:38:32PM +0200, David Hildenbrand wrote:
> We end up not closing the file descriptor, resulting in leaking one
> file descriptor for each VHOST_USER_REM_MEM_REG message.
>=20
> Fixes: 875b9fd97b34 ("Support individual region unmap in libvhost-user")
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>
> Cc: "Marc-Andr=E9 Lureau" <marcandre.lureau@redhat.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Coiby Xu <coiby.xu@gmail.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>

> ---
>  subprojects/libvhost-user/libvhost-user.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libv=
host-user/libvhost-user.c
> index bf09693255..bb5c3b3280 100644
> --- a/subprojects/libvhost-user/libvhost-user.c
> +++ b/subprojects/libvhost-user/libvhost-user.c
> @@ -839,6 +839,8 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
>          vu_panic(dev, "Specified region not found\n");
>      }
> =20
> +    close(vmsg->fds[0]);
> +
>      return true;
>  }
> =20
> --=20
> 2.31.1
> =


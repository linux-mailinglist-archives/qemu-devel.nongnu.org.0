Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E023241F2A3
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 19:03:21 +0200 (CEST)
Received: from localhost ([::1]:35342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWLwO-0003Qn-E0
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 13:03:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1mWLtq-0002Rh-U3
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:00:44 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:63097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1mWLtk-0002oF-Fg
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:00:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1633107636; x=1633712436;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=9C44s+AhUSPpTvOsUhA2IRPmzYao4Osoy63kHZn46BA=;
 b=G3PpptLzq9ZgckA3CFmYMdIBGZrZ6J6ZGTIT/izoTIfQB3WPYKEjXXRh
 P0uZjr9A8PrexDBHUZz/jDyIDO9eGdmu73kfiLJnLACBGa8Ghw9/9j025
 2d6oK1GALpjhRCW62AmvUROt9+Wl8ylE4XeX1Q3gnCkDwQZIWHCteIvdd 0=;
Received: from mail-co1nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.171])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2021 16:59:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fs4YHyOLxiW7d+NdFLeeOOC+V7yTXvI8J6EfFwoSmqGdUtX1C7U3ndwME6vAJVkeuTOPlvyCIqi5kyDIp0hR2OeaahZCD9sDqr1X8u4jRVKR7HxkVeNYRt+b6qxuo58E1yFs8MFP/iniABz4AqFbdnJyEQGrbotlNdeXqvemSdM9MVundUTv+TInbdroEYmcjuxFfIyL6Bj1hjdeZMbWJcmT+5yL8PXk6GCXbZlGzrbmimGePtaAuzTf92Hs6g0M1l1ha2p33sXzCEi9pKb2THLYPUtvRNX8BfCTLiVTW0b3nhmveQGeL5ihPsb2bUPhOf3ociynz07tToXe09CGhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9C44s+AhUSPpTvOsUhA2IRPmzYao4Osoy63kHZn46BA=;
 b=CZPiCLse/ODOMs2vATLembi3Y/OaKZqx7G2K5u4PLV/cy1MVI/gctPafKqIcWFpgzm91lcheptRbLCIH7ns23Mm+os56F9WASlrrd7dteU7rLAqKPoZuJi0QPciRe0aXlth0FA9s0Q6mrSO4+zhglefl1wVrh21dSiD0pUmyVwNiCjRrFs52GVz+gtxHuu63JALGph+odpR+ZCLsEXNwwa9LDO9dK4uoRiLCOhsAoyshNVBxCsQ0DOpBFOlUYvHz51mFPq8BqO0fmj5FVBtE+XRBeWwlX/2qrVTdgHP6vh9fmB1mpe4bn5BAyq0TsmZgSQs/sq1ktPWfcRNqpzEY6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN6PR02MB4205.namprd02.prod.outlook.com (2603:10b6:805:35::17)
 by SA0PR02MB7164.namprd02.prod.outlook.com (2603:10b6:806:db::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Fri, 1 Oct
 2021 16:59:26 +0000
Received: from SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::5012:ec15:af97:2c90]) by SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::5012:ec15:af97:2c90%5]) with mapi id 15.20.4544.022; Fri, 1 Oct 2021
 16:59:26 +0000
From: Brian Cain <bcain@quicinc.com>
To: =?iso-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: hexagon container update
Thread-Topic: hexagon container update
Thread-Index: Ade25RCxllT+hUwlRb2vNrqCSUbc9Q==
Date: Fri, 1 Oct 2021 16:59:26 +0000
Message-ID: <SN6PR02MB42057F473618E661B72E1FF3B8AB9@SN6PR02MB4205.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5c7c326a-a221-4842-9c25-08d984fcd368
x-ms-traffictypediagnostic: SA0PR02MB7164:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR02MB7164390FCB826C6B1A31C510B8AB9@SA0PR02MB7164.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F4IU06oGOQeaWN09iHZP2bfZ4whGJMeZvANfJL1AH+WDmnAYyrbO95LqPYy4nxMUKK0hdTHqJK38NjqNFzENY51TGAs4SHuibje5jS2ptFTVUaNW3xXQIh92u1Wp21tyym43bAOQiAnGICTEoga8T9/F0KzfB1EAFo22BQRMzgw62e+CLCDF2cwI9WC7O4MHEVxkL6KV2P4GnROgmStkH43m2N/BYCxwy0OkeGtqafNLdz+y0ZLDcBKKl78cwQQywEenJSPAJQ5BFbnXwBorJ6D6/YSdN5TU1dkf2KezGxyBsuI15O/3C7aI9IDY5jmxKg48GXOOqk3Pser9VMQrmHQaP0o7zHIhL/5uIDg+xKAAIWMvBbVOrT0nylDzU5sp0XgjrcDBFN4ykRh9cYb4+BbzobGm9lnRnq/M5dyNyzFGn9F9az8X/yOTSv2nLxsY4k3zIxhivlvF8Qt3h2inBrvzJdgf/ZijJjSGoTVn1MkHmUXWi/DI9Lyp2kV4Nk2nn72uZxmWFE6eMQhngP0Zgtii4nMVBo74rFOAOXzQsk5BHjS6LBMwOB0ODcNj7omXn5YZmyDlFxlpAfBtHOHruno7aEdhn0BmmylUOqTqhtAv/FQTB8TFg3+k9lLns7uDMgfKbdhbUiFTeGNFBNwBmOWomX7J6iMWL9y/DkxwzZAxwDLfI/gOh4qrtosQINdSVrOJHEs3ZQsKv43XZb219Defk3J1wRvpCCFWrBSSGzCE2JapqWiyZH6m2xd/HBJ35ZbI8YZ+J7z09y+r8IhdmQBLAKiVFoxGgHUnErMKwzSeRzB425R6RhTURc7DBix/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4205.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(33656002)(66476007)(64756008)(8936002)(55016002)(66946007)(7116003)(86362001)(66446008)(66556008)(9686003)(7696005)(52536014)(83380400001)(8676002)(5660300002)(15650500001)(107886003)(122000001)(76116006)(508600001)(6506007)(3480700007)(186003)(316002)(110136005)(966005)(38070700005)(38100700002)(2906002)(4326008)(71200400001)(133083001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?sYRBSlVsISldF1rRPLTbFB4Hb/fPUnB11ceWONPU3EcPsK2j+IduSah04B?=
 =?iso-8859-1?Q?VhGQX83lnY5zMIzEQgC4MKwWJCMJJ1Jy3sWoTejtch64jnX0pgKeX4egYb?=
 =?iso-8859-1?Q?BVjw3JW/SMxHc548TjhQCaWQtpguC4+cufa6DBBxXuSQgO/aK3yuNGqJil?=
 =?iso-8859-1?Q?Ody6c3dE8G59Vm69N8AEyV+2l0s/ionBNv2dcT+fh0gMM/09zlPpdV7V9/?=
 =?iso-8859-1?Q?yeN2YULZCSDl3vkyz8p79AKdxSWBBf4B4/ILl7WhuWC/OiK8wS70aOI3MM?=
 =?iso-8859-1?Q?56RyqXiT5xGLtQNdH/hSRPk3Ewq9TNcjsTcbvJxMowhhCtqZPp9U21gmFS?=
 =?iso-8859-1?Q?1aHo8LdCiAgmbGL6M2XVPm1yUx10qQhfL22ZqvMOPJKH33d761FLb/pZyU?=
 =?iso-8859-1?Q?hxf7Z6FZlQj6J42Wm6x/rS8dIDCgBX+lcgkmLUv0vj/ZgP8cbpDExwrIbP?=
 =?iso-8859-1?Q?ba/zWpKeFVQjcQVxIcDD2/ekTwWPaBUF6loxUQ3aPyL1/Nb4xf86e60jIK?=
 =?iso-8859-1?Q?RJBw21a/ci0/kNEqFFFCb7PxGTmCTWxn+sGQUrUsi8RFixfxRhIS/acdcv?=
 =?iso-8859-1?Q?yW/0pHZtm8xpV24hFvgHWsNs6fCxCe4UJR8THoNXzBABwO0lrH7QoTL+u5?=
 =?iso-8859-1?Q?858qJCxrWF9Dv80GBvpMnIMj+h6HFP7U78AIYgQwWeSTBShazAlATXZIPR?=
 =?iso-8859-1?Q?ee7+e8rWfsvAjXUY8OfgL/4amc4/cjaWutanDxgdEirU+kFEoGw+AFuMrm?=
 =?iso-8859-1?Q?4d6/WVx3EbG37PDoPTNJEYrHOFPVWIOpGUsw9B2MozShlrFREmHWrshybu?=
 =?iso-8859-1?Q?fPltfuwN8n4OSzBOGYRwsEYVURoNTVHRoXuy7smbM6J8YjYKJFYq+cMi6i?=
 =?iso-8859-1?Q?n6MM2XtTqajXyI/2Vet1jv0ZklcxPBTa+SA0EkyTTaBhLQV7bVoe0As7cl?=
 =?iso-8859-1?Q?mYA3Xzg2ZtqcQonhIrRea2XUxNUMfajpaJs6J0yWEBmuGSTy2AFRk1Y0Gm?=
 =?iso-8859-1?Q?Ii+fJBrRt5gTv8j11RJ5jSB72XQSIrIuWIJekPH2WRAPdQqRA9JnXlUPrf?=
 =?iso-8859-1?Q?uWdjyUQ8ibqjO56ZfdbZ42XcpA18iqPWTjZDU9sObflGAbSEeFCNpS2XlS?=
 =?iso-8859-1?Q?nYD98haQdFhbxYxZ3T3oEX/pWSZLKqi3aTpH3f1Nk4KN6I6lGuN/fZyP/m?=
 =?iso-8859-1?Q?Hmz7ebrCRqJ1PlRlZt0cwB7pdBAH+XtIjeXzdW/bx3fiSsSUTXgupPEe2v?=
 =?iso-8859-1?Q?nlt+tCRlVhsTDO8X2K8yfpj9q423ATGijE9LK4n2YiSzIgnTZ/o+XkCqKo?=
 =?iso-8859-1?Q?PDFoTDy9i0MzLyLroQwl7mweHu5N95O44L+xSrpWJoyUsKB7L/MfceQ1yO?=
 =?iso-8859-1?Q?OzjCQp4Wy6?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4205.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c7c326a-a221-4842-9c25-08d984fcd368
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2021 16:59:26.1360 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NhyB6b/Yo4OCvrOjIim46elo4GXJGh7wNS6vXFiabExthqktWTVykrHplHGKsz2TlPSJC7JgSqPBWYvgICQGQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7164
Received-SPF: pass client-ip=216.71.142.165; envelope-from=bcain@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alex,

We need to update the docker container used for hexagon for new test cases =
proposed in Taylor's recent patch series under review.  Thankfully, CodeLin=
aro has provided a binary of the hexagon cross toolchain so now I think we =
can simplify the hexagon docker file to something like the below.  I hope t=
his also means that we can remove the exceptional handling for the hexagon =
container.

I can propose a patch but I'm not quite certain how to test it.

The "--no-check-certificate" argument to wget is very bad but I'm not quite=
 certain how to upgrade/change the container's certificate store to accept =
the apparently-legit-but-perhaps-newer-than-expected certificate presented =
by codelinaro.jfrog.io.

~~~

FROM qemu/debian10

RUN apt update && \
        DEBIAN_FRONTEND=3Dnoninteractive apt install -yy eatmydata && \
        DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
        apt install -y --no-install-recommends \
        xz-utils \
        wget

ENV CLANG_URL https://codelinaro.jfrog.io/artifactory/codelinaro-toolchain-=
for-hexagon/v2021.09.10/clang+llvm-Sept-2021-cross-hexagon-unknown-linux-mu=
sl.tar.xz

RUN cd /tmp && \
    wget --quiet --no-check-certificate ${CLANG_URL}
RUN cd /opt && \
    tar xf /tmp/clang+llvm-Sept-2021-cross-hexagon-unknown-linux-musl.tar.x=
z



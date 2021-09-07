Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA2B402E40
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 20:16:39 +0200 (CEST)
Received: from localhost ([::1]:57370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNfe8-0002pc-1H
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 14:16:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mNfXM-00011W-04
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 14:09:36 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:52086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mNfXK-0003gw-5P
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 14:09:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1631038173; x=1631642973;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iYr4meyOPic0xpfTtMNWFS9hG7BgLBJdgGNzqK0duP4=;
 b=MamVdEDx1/EMzCbexToOgFktX52crh2gFtQUn/cKEJEJvgo5i0ARhtcm
 faRmw+p0bokJSmi39izSIrtpgg1I6AHjsTUgecp7uLx23Ki2eqijr9glX
 IBjIuKI9qahKQpMqLBWV7r2GdPkgtE8UoTrDsT38W4O/+uReV2UOIqMK9 U=;
Received: from mail-mw2nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.107])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 18:09:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IbvuoVYjk8cIDfdki+qdDHGKbXhUGdfdEwJpUUcX/50zrk7a6p4CveaMDLs74en47aePm5Bl/pNF6P1k1dRDTm+5Ho4urJuSmzRAVMZdlC9O0pWxTwPtFJGzvp8N00YYDGtBKzp2uXZs0LEKLR+EQF51NpcZx5O9oj0jvb8owaA7QcyQgJWjW/J969lGm3a7jI/tV0K0U63Qo2LjH7TcVJMFOJcfCuuEooXPRrvrB0Mn5LsaHS+QSDRkI83L/uHM1+9zZZqKJlqUEpJtZcTMZm9QTA78yL1mpXNjx0qc15aY7S8Pqef4zsW9sCVBI7OnT6q8n7Sa0Uyp8jb0sFOOog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=iYr4meyOPic0xpfTtMNWFS9hG7BgLBJdgGNzqK0duP4=;
 b=ntlS97+H8jSCLCW3bnIO2M0Wa0p7BGFKm7umcFmIeICUAIXgKLtWL+6uYaQoqZageBIiM3SXyrbCWPYmxlpUwAXYy2omU/wxnG3E2MflULckpzduxhM2AEdcQW0S/iZlgSjGHnNyX+wX428ibwqTCB8rJq9nAPiv/FGWFQqBNjvH92s762ifhCA2Fh7lhxY8KLY0i6ItesmYIs2IBxhnYuPCadv4mwH83SSd7Ehu8Dfve51nE31zHnxiyHojDfX+ki/LF5FzXbF/f75vXez2mpqy2eYUmXSF2LtmysQdMqz8RtlJAKG/dXhdfE7FJzkALLdx7yDYuyVqrq2dlpRVhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BYAPR02MB4949.namprd02.prod.outlook.com (2603:10b6:a03:4b::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 7 Sep
 2021 18:09:29 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::d91d:e6d8:ee5d:77b5]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::d91d:e6d8:ee5d:77b5%6]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 18:09:29 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Alessandro Di Federico <ale.qemu@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v6 01/12] target/hexagon: update MAINTAINERS for
 idef-parser
Thread-Topic: [PATCH v6 01/12] target/hexagon: update MAINTAINERS for
 idef-parser
Thread-Index: AQHXfWMcWIgIqwbk1U+PRosv+3hQO6uXppRA
Date: Tue, 7 Sep 2021 18:09:29 +0000
Message-ID: <BYAPR02MB48861C0213DE9D8A887B48C9DED39@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <20210720123031.1101682-1-ale.qemu@rev.ng>
 <20210720123031.1101682-2-ale.qemu@rev.ng>
In-Reply-To: <20210720123031.1101682-2-ale.qemu@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: rev.ng; dkim=none (message not signed)
 header.d=none;rev.ng; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0a8a9345-13ee-421c-fed8-08d9722aa2d6
x-ms-traffictypediagnostic: BYAPR02MB4949:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB4949BB5BB7655785E03F9123DED39@BYAPR02MB4949.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:538;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LE9BQprZ9nO+J0GZ/8kIB8AImbyKm/Bz+uR46vrXGDGmtL2Mocos6PAA429u9qqHlFVKCQwgxuSzBnFAfnScRxpi0A5Fi/Ktre+k5Q6m9ZK23zFX8q8mniGuXqzYBx4fPsJFikpj2Y8zDPBM5rZyjkozP0l81CE80j20VdSRhQx1ImkwbavYosObWIAmxusJwd7o78JkuBU0igJ371JuCBW7u5sH57TzSyqkKhMDqaIhF7KyIbztKNELmJ2VK9N/mkyoK+M+CvPel9Io9eHsku/Pjlu/Fw5/0DIQEJZrhulsSbLfSELyPkeyVKevImjPe1l+aSiTmvay/8qbXGeo2kCYTtK1bVHaFF6sTUUstGHB+T7ZTRunGXr6OMQlIRHmgARNkYjCLjH/iHAexnEopUNDeDVEHegrN5JWP6RrYO/xUSWOgDFxMQrS+Veg/wbZsZXpxiPtJdet+E5ZxrjVVTt08uB45iRdSnY2aVu//outrmkecZebEeybKYTeQT0hUE6FFuE7CQpn1ewSJPNATF/O/6TViveUwRdx109DneR9GtbhhD4wNvf2omcmX5hSPrMgezSslJoB7GmwUH8NMneF4dcY9fSdU+3tWqaIpkBH2/8fwjELBHFdA+fKq8dGILb3j5LOHAaSbhioE+E8EZQ49/MLoc7mH84T545TmsHmqECshx//9lh24af3f+ymCcyAW7qWq0aHsvMQJgwd2A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(38100700002)(38070700005)(76116006)(6506007)(2906002)(53546011)(4744005)(66476007)(54906003)(15650500001)(66946007)(83380400001)(55016002)(7696005)(66446008)(66556008)(26005)(9686003)(122000001)(8936002)(5660300002)(110136005)(64756008)(316002)(186003)(33656002)(86362001)(4326008)(71200400001)(52536014)(478600001)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?at4CCcmhCmduJ4x2IeLBZUtk+ulAL3MZzbTgLs71caIqIRNJUT360C1uVFML?=
 =?us-ascii?Q?aavgzlYaGgbPq2UuujJ99gKoDTKIQg1fo6iAfQurWjBz28H5ScY1CnH0CHCH?=
 =?us-ascii?Q?6CEFW0y7osYpiA8uNMzE7khu1z35wdPpHUCDEs1nKZj6v7lYniT3U5wKCAo/?=
 =?us-ascii?Q?wj1LtEslXIYWHf7qvZzI7yLBQjM4w06Oy4ETy0ouED7OWz+hxSHXAM9RO3zK?=
 =?us-ascii?Q?2bIb0zEUmuoOTeSdbIjQ3ZG/2h2jjZXscLOzmhN7tvsVVBA/2moDmzncIa3i?=
 =?us-ascii?Q?hihd4Lm3mqUUU+aXwr5YP9DRvPECbdJsBzjCC3X/zZ8yhLvgXxL+/A8CzTUx?=
 =?us-ascii?Q?CooOGn2o80AfczQK9OmI0kFUolhqegEeYpzP38KZ8R9Rbuu51kPIXsu6vSHv?=
 =?us-ascii?Q?UhrQsvlfnbggJAbQse98b7OvDdUR3qAKKG7bq2EzrbqIKMfuBkps2fFL7Ks8?=
 =?us-ascii?Q?eTGxsRtwBJtYOLGnDSnPAkFL9QzGt7Exi/ba9AywnL+hfDriNz1LcilD7uV1?=
 =?us-ascii?Q?4GEar1Z7Ek15xP1HZh3z4OA4bh3cABf5zlVx+P/nRsJYt3sDDfipVU+7wDxx?=
 =?us-ascii?Q?YkcxdPcxYfmL05p8HyAVguI2y1MMM3JDkBMjHe63HJYhOnvVBE4C+t1bJP0V?=
 =?us-ascii?Q?HjeofCvFQVz/x8G4LliGXAI8UUXRDofQU05jXLF/FiDuTbRl9eFp8nT37jWu?=
 =?us-ascii?Q?NP7fA2uG5v4qn+j06KyU4wVH0WPLd2nWiSAYxyztzTI4F60Ml9X8VbrCvnwG?=
 =?us-ascii?Q?odZ9yG6cg2+dmchF1U0wYCLerdWWulinRflPudiTsn38fR7rFS82OWead1CZ?=
 =?us-ascii?Q?aotOYTxNyy/JnvMKtpvyS0siGXK/5vxbqjTpY/G6sukf/HRDvfuzyerUDUUI?=
 =?us-ascii?Q?sIQI0OQnzfoWHn/seddeceg62FeUAA8Paa6wquUelWP9oeXJUFqdMz2wTK7B?=
 =?us-ascii?Q?yPDgakabwCBQbrzE/RMg6Ep274ybX7WYl7LCrez1imIcGI2U86w6ZZjJYufP?=
 =?us-ascii?Q?1eEXQd5a8s41IlPFh25scYyFAw4I2+2KhV5oj40Mq6vinSdxnFWuwSkf2YWG?=
 =?us-ascii?Q?xG5XTqUFiSYYykFylyo28YrtsqSpjLjfvBf+2ABsx4gwKpxBRtf8dDJc+3Q2?=
 =?us-ascii?Q?qvibR33M/LWzp73YtpIREgMIiXZyl0LGiB+Jv/H08XlPoOerKRdHHzJqwWxf?=
 =?us-ascii?Q?qllZa2WrGSVnEiQkypIwYWsShXiNAkDD5diLrWKnbmepIUawuA5bjB9gY8ei?=
 =?us-ascii?Q?eeqaNUdnrX5owtxwpmhP3oueSCQlFUffHYD3H7ix/Y8XhtnpCwzvOJPDxBul?=
 =?us-ascii?Q?pkTUbZwQuUf+jXRlH5IW0D8C?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4886.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a8a9345-13ee-421c-fed8-08d9722aa2d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2021 18:09:29.4328 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nxTU3gKLBDcOBqqIC6jVJH57mrqvtWwOhJVuYNBJmw+R0TxxawIWGoMY4w+XRpwZ1ijX0nhYO/ci0XEyV07wuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4949
Received-SPF: pass client-ip=216.71.142.165; envelope-from=tsimpson@quicinc.com;
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
Cc: "babush@rev.ng" <babush@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "nizzo@rev.ng" <nizzo@rev.ng>, Alessandro Di Federico <ale@rev.ng>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Alessandro Di Federico <ale.qemu@rev.ng>
> Sent: Tuesday, July 20, 2021 7:30 AM
> To: qemu-devel@nongnu.org
> Cc: Taylor Simpson <tsimpson@quicinc.com>; Brian Cain
> <bcain@quicinc.com>; babush@rev.ng; nizzo@rev.ng;
> richard.henderson@linaro.org; Alessandro Di Federico <ale@rev.ng>
> Subject: [PATCH v6 01/12] target/hexagon: update MAINTAINERS for idef-
> parser
>=20
> From: Alessandro Di Federico <ale@rev.ng>
>=20
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>


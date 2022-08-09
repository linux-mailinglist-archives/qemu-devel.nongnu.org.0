Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 230D858E1D8
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 23:38:46 +0200 (CEST)
Received: from localhost ([::1]:47998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLWw0-0008Am-Gb
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 17:38:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sfotedar@nvidia.com>)
 id 1oLUYY-0000VM-8F
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 15:06:24 -0400
Received: from mail-dm6nam11on20609.outbound.protection.outlook.com
 ([2a01:111:f400:7eaa::609]:19040
 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sfotedar@nvidia.com>)
 id 1oLUYR-0004Sb-B8
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 15:06:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aL5A3H3pW10o6joYAtqheK1BfxC+NpZgOBYL29AlxJ6NyJBnmpNMAguj3f2Cwwf9KRbTp0iBGc0kzZQitreLMvqtnSAluCMl/BlLX0LZh+eWGKODMNeQSL5SBrH8mtAvhlwvflNNt7p+EDmaIim3pJ08zEaR8Csd6DmAU+lGlfUwbl/8CudVSm4t/1KPzQOlaujZt/F/HdBRbODIrYSCTY52FY8nkVWFYVlOMP2DONldzhq1WhKLVh64nVFj7WlgvSgm/KfloJ1E/xyTJyv87rTaMZPx56btqsqpiPErRNc1yKXLe7OXe2plusogH3G0Kbr20X/835Zq8R+qBtjgjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TO4aWm5BAi4cvdfDD5tBgXNPGm4gh235YXbXQx1G8Tc=;
 b=esJz61BUK9EtEz51go1fxYWJUqKWwe+bOqPkTKqEA8H3shwBryGcfl/qcq8raPv2dYsblvtRCjs9NKnz2/UD2FxWxVhnaXEfLk7ccs+fn9A9VRc80QUX5/5u981mDxJHjBm84jWohnxN6WhjeMbhSd+k8dmoEcHpemKuKFhqZAMWHwoqSzxWAAVEf4tiEVZ93VylNsnkWKgxI4g9mvR2gZXV/A7+8quFqOMEG6u+68ZjrPQGg3AQ6TiBlnV1pG1fudmLPLrBnqtiib6DkJgKIyt1VCK3vOd9lRO+qPXMF37XQ1b2P8DX7qSXuTzOkWmgQEryl8UYJEjIo64tSWkhXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TO4aWm5BAi4cvdfDD5tBgXNPGm4gh235YXbXQx1G8Tc=;
 b=ub2vCmFimjUxBVW5mg73tnZQZ70K1nDP12CxphJ1LxFdUyMJFGJAVs4YboAksijIKlFR0gX9sm13zO3NMPJmouLmuyjAs0/PavemdPAs9C+1+i3XDDKyLlei+rBoyJky2VQczoj47l7Q3JpoXbIu31nddMbnxlkHMuKVtnUu6M0qtyQNL0U4qLgh4bf6hAeoYsrLDXPtYoUKI/+wYFC9wPdHX9p5Pn4y/poCgpjXvcU08+8I/sWLs1qvauDrHjBGh9g4LJEsrAABlNaG7t91lJl9pON0URtuyEQL5iecNngAMvPGW8r3Ji2brEUYlIH4LnpaT4h6YkXGSjv1GkZkNA==
Received: from BY5PR12MB3891.namprd12.prod.outlook.com (2603:10b6:a03:1a3::10)
 by SN7PR12MB7132.namprd12.prod.outlook.com (2603:10b6:806:2a4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Tue, 9 Aug
 2022 19:01:09 +0000
Received: from BY5PR12MB3891.namprd12.prod.outlook.com
 ([fe80::f53d:bd4a:67e7:2090]) by BY5PR12MB3891.namprd12.prod.outlook.com
 ([fe80::f53d:bd4a:67e7:2090%4]) with mapi id 15.20.5504.020; Tue, 9 Aug 2022
 19:01:09 +0000
From: Shivi Fotedar <sfotedar@nvidia.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Andrew Jeffery
 <andrew@aj.id.au>
CC: "Amit Kumar (Engrg-SW)" <asinghal@nvidia.com>, Prasanna Karmalkar
 <pkarmalkar@nvidia.com>, "Tim Chen (SW-GPU)" <timch@nvidia.com>, Newton Liu
 <newtonl@nvidia.com>, Deepak Kodihalli <dkodihalli@nvidia.com>
Subject: AST2600 support in QEMU
Thread-Topic: AST2600 support in QEMU
Thread-Index: AdisIeSsY02sPIDTTCawmJGYit8mSg==
Date: Tue, 9 Aug 2022 19:01:09 +0000
Message-ID: <BY5PR12MB38917595B0306085EEBB1921B4629@BY5PR12MB3891.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 882a77cc-49ce-4355-39c4-08da7a398569
x-ms-traffictypediagnostic: SN7PR12MB7132:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WAluyXwCQi1Htsvqcp24LRp/MogKI4XJsC2o1eKHtACskdxvWOpAT1shiycou8lTme7e6bG90Tp/yjXzBzGxrRQDB9uAM7Uv6FK5myVfeHpRmBSuvpwNZGFbzs6Y0qG3171KWpjOibzaWzpNezjYjNehzLE1fQVYIPfGffe0iJiwoy0vG9ahocslMUf8Ykz7V3tY7oHSZngpKgnJ+scZbzt9KDP9ohQswhosxn7zeycvGbsm2mmn9ZC7XvyOXRD5DwDen8H5/2UfrwX3RIDTi9BcgMNfXnV2TqZ4F6T/Xq2jQyxhWKEo6WnrbwNC2mBwRAyvILMLFkw9doT4LadcIrASOwTn99PhlsZFRVA+K65hwjnx9lIE7vXr+sn2Fm5wjRwaggRqXN0vF3GOlxdvBtFgZ56aqZKRSky5zmanthuOtPY52pqsJRCIXlAa939Wq0JD9M2XLmPFPoHRhQz7gchE/7JFEg3CVwML/H2VVanb5yd8PXazgCUOzfta4oY3L2/hJ2Cvne7/I1Q61CrOR1UQ4e0RlHLDaLN6KFXle+ZiWnhjBzy1PEhmyIecADAfjxtfQhFiydSGM6uPS4VZptMGEvOOtKp9SoeMiLRdZJ9OI7yRQEBJY6yUbIhRJ8/60wBr6IDSDkUJLXrg8yawWiDG9wdxHXZ8OITapM9prhTKPjT/tPTLR5viWJdDselcfcXSGTzMcXOQMgCCNEqSKxQB72ENcWNJjfNQHDKvm04bHxtEGCMqOHpm5zr36V2ZVDT1dPZXFc3s/M6XAbqDPEgZCsX0C/Z7BzIGYOb1XHtxIgT2J/MoYk/4WUvk1AaD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB3891.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(39860400002)(396003)(136003)(346002)(366004)(110136005)(33656002)(54906003)(86362001)(38100700002)(26005)(316002)(107886003)(9686003)(186003)(66476007)(64756008)(66556008)(6506007)(66446008)(7696005)(8676002)(66946007)(76116006)(4326008)(55016003)(41300700001)(122000001)(2906002)(478600001)(71200400001)(52536014)(4744005)(5660300002)(8936002)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8HfRuzmlosMubmZ+iT/ORG5K13+CxZ5W5aFQEtcFDuHlvPzxTHXsx7hzpn+M?=
 =?us-ascii?Q?tVbCEA8fzHX076ySWTQSD1o5VdDy5HTximImd1KBmOnrbANL29g5nCpiC6FG?=
 =?us-ascii?Q?8QfEhybh8/do9mp6lJl4Offo/mLkHlnkTgmiy9dN+DkRnT+jjnk2m54ljgPS?=
 =?us-ascii?Q?eHBkQk/6KRZMqyEaXnbwBKgmLIs6mIKSawvodVA/6j/Wv6o1+ZwCScCxoaNp?=
 =?us-ascii?Q?byf1Sh+9cF5kcEBNamv9pNOYWKZtbgZo4iwQ6B8ieSCV9nE++S/VO/LQHkP4?=
 =?us-ascii?Q?EaOaLHCeMWNH31U1Nd4iGKVOMkIuZaunM1O/S5ex0kfPmtyPGrL0HV7VWDYq?=
 =?us-ascii?Q?GUw1rAPNsZX8a9+pN1FYmWdzQAuqBnZXk2AT/6YntZQWbyU0JrGQ0dZEDHEZ?=
 =?us-ascii?Q?IuSaF4UmTX31jDTFP5IkvUSvpA+qh7XzN69dSRVfYcXoMtJzGPVYY7h9bOVS?=
 =?us-ascii?Q?LuQGu8GmdnDfGHpoHxtZssl3hJTTzuRC1ZjJh6a8IaRLaU70QCayR7E+55Yq?=
 =?us-ascii?Q?Fs2c5UnwAjlFwwUyB7S3HySlfIc4K0LOTyPsSYeZVdezip6TA8zdvuyWBfKV?=
 =?us-ascii?Q?WM7VIOGLQzQYvIsyY26rCqTZMVQWR/7bkyQmOGzg82ffFM/Ze2qYagOa6ZvW?=
 =?us-ascii?Q?0RakUpldrqKO/tGAov0AfJs9IsEA/HaDm06l1MrbSBIVgEYMEykcbUyYgD/s?=
 =?us-ascii?Q?zuGulfWSF9Nf1WOo896an58y1jQg6k9cwJcBMeJYYoS/DuMIg0bz8S6315QM?=
 =?us-ascii?Q?sqnWetEV6WC7bL78Be/GvdWtg6YlUh3UwCIJsBp0h2UbMMJRplTa/X42aBFU?=
 =?us-ascii?Q?UnCLZ5GKgOHlnwmbcOhNI22+FYk1LgKruw13q/ygYclnot07oJUU1YgIzD9Q?=
 =?us-ascii?Q?38rote6bkkR39R5jr7Rvpd6VdAzMgdrvRiF1zqNr5foRO9BmPEF26keyEZRL?=
 =?us-ascii?Q?1J8u6kslpN3wAlxWiUW0WhgaMf2bjpqwVfc/qI9fAgvchDc1lgVPTIjnAD3W?=
 =?us-ascii?Q?qdRY3neOAhw3IclOAcG8uXo/yaDyLQYex4EwrYQg03gF3S6s3z0YDZBCxVEa?=
 =?us-ascii?Q?ePzs6ENURD+1P9IXOTch0SysZLE7tZKahrra+SzPqEc061pLqDUQsbYmNkaq?=
 =?us-ascii?Q?y7JVLUodQNd6gPiwaQF6bE72A8JjGjei9EbBT8AuwXafyVOCuo4ppg9i4oMf?=
 =?us-ascii?Q?IjwKlb5fD/oOVp7sL8nK5YyDxj5JC4WJk0A3ncEz+qb39HDCxU5J4cNWUSAa?=
 =?us-ascii?Q?S+nbWk3jCDOwS7M0g0WzdSANSwKf5dfAnAye2jCzZukCNrEapNOKdQUu2qRV?=
 =?us-ascii?Q?lzYSixQ2N3Q7dhaS8WImQ0oLGPPCSUmreZfrq0k84XxolBmvZ18mfGycXWsd?=
 =?us-ascii?Q?x2UH0t0f5Y9sA87LsgKl/+vh4uy4aulhx7m6ssnQzSNWCsz/heyBuBHgJlUP?=
 =?us-ascii?Q?kIlla8oR9goAJ51vNeB1wlKu0FetLxkzCyS+3j/WO4SV0XZuQCsTDQIPpBUW?=
 =?us-ascii?Q?8iGuW4zxk85NxvJ0WW+0soPZXFUNx9fz/jl3s+Jqv6ofV+gGcZ6E2SitilYD?=
 =?us-ascii?Q?8V7zcfpao+/aim/tqQNcqNYH4vCiF+AD4XpWZItb?=
Content-Type: multipart/alternative;
 boundary="_000_BY5PR12MB38917595B0306085EEBB1921B4629BY5PR12MB3891namp_"
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3891.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 882a77cc-49ce-4355-39c4-08da7a398569
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2022 19:01:09.5399 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HYgBGk+5BLGTsKYAgpA6a+qmynJ0WZxpJkywgyhJxmBWWCd16assq9Ic1r6gPO/U7v35CSEDqK9AM5NSgs9C3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7132
Received-SPF: softfail client-ip=2a01:111:f400:7eaa::609;
 envelope-from=sfotedar@nvidia.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 09 Aug 2022 17:36:43 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_BY5PR12MB38917595B0306085EEBB1921B4629BY5PR12MB3891namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello, we are looking for support for few features for AST2600 in QEMU, spe=
cifically

  *   PCIe RC support so BMC can talk to downstream devices for management =
functions.
  *   MCTP controller to run MCTP protocol on top of PCIe or I2C.
  *   I2C slave so BMC can talk to host CPU QEMU for IPMI

Can someone let us know if there is effort going on these areas? Appreciate=
 any help here.

Thanks

--_000_BY5PR12MB38917595B0306085EEBB1921B4629BY5PR12MB3891namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:947929911;
	mso-list-type:hybrid;
	mso-list-template-ids:-117517014 -1780694282 67698691 67698693 67698689 67=
698691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-start-at:6;
	mso-level-number-format:bullet;
	mso-level-text:-;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Calibri",sans-serif;
	mso-fareast-font-family:Calibri;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello, we are looking for support for few features f=
or AST2600 in QEMU, specifically<o:p></o:p></p>
<ul style=3D"margin-top:0in" type=3D"disc">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo1">PCIe RC support so BMC can talk to downstream devices for management =
functions.
<o:p></o:p></li><li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso=
-list:l0 level1 lfo1">MCTP controller to run MCTP protocol on top of PCIe o=
r I2C.<o:p></o:p></li><li class=3D"MsoListParagraph" style=3D"margin-left:0=
in;mso-list:l0 level1 lfo1">I2C slave so BMC can talk to host CPU QEMU for =
IPMI<o:p></o:p></li></ul>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Can someone let us know if there is effort going on =
these areas? Appreciate any help here.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks <o:p></o:p></p>
</div>
</body>
</html>

--_000_BY5PR12MB38917595B0306085EEBB1921B4629BY5PR12MB3891namp_--


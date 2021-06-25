Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B423B4A5F
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 00:02:36 +0200 (CEST)
Received: from localhost ([::1]:36628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwtuF-0004BH-4i
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 18:02:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lwtsY-0002v7-SL
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 18:00:50 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:11492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lwtsU-0003ab-Kk
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 18:00:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1624658446; x=1625263246;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1fejuK9dsTC7E9Fd2mNzu6Fwjj4SYustulO9JuCSPpo=;
 b=nOEylrVDpBxRcu3He7OR75l/rgXXLnTQSPp8NA/OdKEAfaJ814Ix4Pgt
 vkkefW5HT4Z/bTXdLVCsKYcdpkEdYXjwNlTZ9klWsJK6wxGTxUYZ60meC
 UQiFklrXzgasuYsfKeC4fcYevSsUPVY31sUOmnW/DGELA1f9Ctn6TiXdd 4=;
IronPort-SDR: Qh+tAWd/1EoY/RQISpKXlN+pCo/22/dEszqvAQHT3tWF7DKA/KDs41Ll/eEQydHFopZax32pUS
 P7u6dEyXhXbhZeRn8G1HySesU7dmUjJ8/r/882BawGNJZR760B668IPujLW+vLU1ZXSzctVaiH
 39VRgxIrx8FxUHcJ1+p9nhsBM1V3E2tqV4fSZLbvUQKr/yB3bpN3CtCijY/npvRX+Rrt97t28M
 euFlyg8BHEDqhX0MG9RNce7GLjJI7sAGA9z0Gn1pr0IDvr0xuGlDGeR2AQQl8QqcU+1see+ogV
 B1g=
Received: from mail-bn8nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.174])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2021 22:00:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eo1jTPdSMy3GS98HEYAHXih82IgsMnmE93epohBg9H1qWqirVD4/5AbpEJUZUTVjaoR04M9hXZkw7NZwaoVfcghUXScM0Spn62vNMiOvphNJwBWudNGE7AkfvDX/L6RjnryVFrpBZuxNVLMcSlJZza3eeIuuKB9cToB71fiBUUop1Y0U3S5Z60GadTgGt+aUhXX56oeH15n6QXGKYFItN67mxFO/sIMdDNiWs5Af9yXEWxt5Z1fHKLO+5zhpvRBmfpFem8Eud7dmquKqeE1urqgV5uifcjFYVIy8XGNKIGXosUFwzxXWdCGRsGWLcWeeIVgJ7aVViZhC1NP+0QqsUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fejuK9dsTC7E9Fd2mNzu6Fwjj4SYustulO9JuCSPpo=;
 b=JYBvHDaZSbcPc0SoIzLHwHa2S/Jgv64U30NTpPKmn6dEq2hP72oqWOEQ/tB+sRQE5hCK3zR3KUEeK3wepzTerw+ALEQoi2TRkdiOEwhgK0GJLeU/oZsgJts/g+xU4JehEqcFb2oXNNYLxsioElJvm/0/TvsJ6+1H4QRFhqgbCRobrZgyI1FA1AmEO0EAHYb3oPysJxaLeoNZMBZ8KF9R4sRWIiZTSPX3iVVmX+9cGKud/j4AwgSm9nnqZg26VpIDqvKl+3Mh5Yj2q4hr4zd/nZE2u9KpELs5SFUmFT0MY2FHzM1DCEMyxn3MObWOCika5S/AlMJSYrMwTsRKOgnoog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by SJ0PR02MB7309.namprd02.prod.outlook.com (2603:10b6:a03:2a0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Fri, 25 Jun
 2021 22:00:32 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::9533:5f34:8b3e:ed]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::9533:5f34:8b3e:ed%6]) with mapi id 15.20.4242.027; Fri, 25 Jun 2021
 22:00:32 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Alessandro Di Federico <ale.qemu@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v5 11/14] target/hexagon: call idef-parser functions
Thread-Topic: [PATCH v5 11/14] target/hexagon: call idef-parser functions
Thread-Index: AQHXZO7LfDM1AiJdx0S3J7ymSb7XkKslTR2w
Date: Fri, 25 Jun 2021 22:00:32 +0000
Message-ID: <BYAPR02MB4886EA85C436D84FE6E79DFFDE069@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <20210619093713.1845446-1-ale.qemu@rev.ng>
 <20210619093713.1845446-12-ale.qemu@rev.ng>
In-Reply-To: <20210619093713.1845446-12-ale.qemu@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: rev.ng; dkim=none (message not signed)
 header.d=none;rev.ng; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [76.120.51.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aea336f8-68a1-4d66-626c-08d93824a72c
x-ms-traffictypediagnostic: SJ0PR02MB7309:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR02MB73094DE2B0D9E13F4A945061DE069@SJ0PR02MB7309.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1148;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3JohC+NJfhk0Zt9K1/Lv/yUj9zJWUn9DvLcNPIkJXddz4XPwTwdRoi1tUWS416f68gucCvOLYkQNl3X89oRkcBRKv7QkPHff5q/myPlzTRLWFtxKIKcY857zu3lagVhP8cuORgDpGTwrlNN/K4xkTzggeM7Pq6MFAJsk/mQPBKmVIFcE3Fw+bTi/ce+Jda/tMnsAD68v5XAeb+M2/e0Hfel2II023IjKHji0mRMWio9ZCcKpmP/Hs2j/TloRArYDeh9FM/sZ9z//7kjj8fqOePDVLE1ferWCvI42Ytc3iuGuEicJkmEbVjGEt9+y19dNcDqSZdGuBHhCGN/Zbu3UPIjULWKnsNcQPK7Xhz/Nou4jdRhBFFWIF2dxKbJLm65UFZM+NoYSL+DYrabszbuVsRPaU6eXlbu5qP6xItP0FdCMOZ0cra5NEIPOobNBUI4W7Y3nNbDC0TgZlP4b90SgaPili7rgoUEtctQI/wbL9zgipFcwrSsNxBL/8ePEenehglxjcGzjv4kD7HVkB7U/OVh1uR5UnjUr0jtJ+RnZQFHGduLeplQ5r8DMzY0VllbP1igJWcgyqZRV8dleo4mdGf6Xducvqi/DlnPxsybX2ec=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(136003)(346002)(396003)(86362001)(186003)(2906002)(8936002)(33656002)(8676002)(7696005)(26005)(110136005)(54906003)(9686003)(316002)(55016002)(4744005)(6506007)(53546011)(478600001)(66946007)(76116006)(5660300002)(83380400001)(52536014)(71200400001)(122000001)(4326008)(66446008)(66556008)(66476007)(38100700002)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HHf8R/AA0FIypRJYItmZS/uCmjNtImDX7BDZ1kHHiF6jCT0pYAULOOIxhmoL?=
 =?us-ascii?Q?wj0wv1smQkFSJ6ulLOygYY6VsOhchFKOxbvxf8hF3nMNlVpPnEGO6dOMwwsH?=
 =?us-ascii?Q?rsb2y4EvZORKAWWLJpeWUpDED5EJ2MNYvDHJO9CBsePglUeRymRw/UT/ZuNR?=
 =?us-ascii?Q?wiGjllW2DD9TLpdXV5WBa+mmmYbi9zudScZ9jljIzn0P/v9V5P3ODBhv1eRL?=
 =?us-ascii?Q?FBTnCQiFWc+DEZwahP3NeORSQ37YiRTTxmDWcerIEv7DyfECV6Tt0nQUlidf?=
 =?us-ascii?Q?Tufa1Tdzu+PMphO5yxqLKtm5pUZMrWKdnDYqQo9MTHkoIiPLvghlCgExkogl?=
 =?us-ascii?Q?yBJ3PVc5D1LKdTwVxHrNX422Nf4RTW6o87oGG/0xMbT8lxkvpfRyH8z7/+uI?=
 =?us-ascii?Q?dtyoNlBdf0dZr03lLGuO0ckQC9xJ1h83BQAKgG+cxLtkbirO7+jHyYZIUDJW?=
 =?us-ascii?Q?hGT1vgYOQB70pU28CQGtYY3H92q60YXQ8Lf183yxjYGZ/seEPVbcZ6VgoYoz?=
 =?us-ascii?Q?8UATW84vUQRB+xO0dqxmqbcs6F3hs15gxGg/HZrG1J1RHTpT3ltzfcw3Tw8z?=
 =?us-ascii?Q?s9IZORh8L8+gWT5cjxeGsp2GHUIofgr3KSC0kBkFRrtP57nA91++Qfaz9TBV?=
 =?us-ascii?Q?X6K7Px+yIh0KNiOoD/A98avR6fdvlgHLqwtlBaJ37IpdZJsqU72GPoP9Iv3j?=
 =?us-ascii?Q?i0TPUYkB7VAHjnm5nYPsQPEiDjuBqFUq1RXiwNPxEsUSk7EEBmjmviyCtY4W?=
 =?us-ascii?Q?03b+byTpWM7Rf5VpeA6ld9y8g/8Chod1iz6ADCn2CrIgr888rkxa5O+6Ct1/?=
 =?us-ascii?Q?vY/Vc+wit+HfadndD2jYAGyjYn218C+jB3RS4jcoiDzoMkwA9EI0eKXqaoam?=
 =?us-ascii?Q?oV7R4Yy9q2box3FBCFPUHhKXsL1CPhjlHmE5lFDGxZv8D50YpSen0rEoEUgk?=
 =?us-ascii?Q?9PAfJkg0+5/C7xjEKr203bQUAT5aa3DkUhxgPQ+1flESzhd+hjD2lODKEICD?=
 =?us-ascii?Q?moBSprRryBBZQUo544SWrqfVqVtZ8kmxN+8kfiE5g+VsA8vP0zk9tj1OMKAH?=
 =?us-ascii?Q?us+B4ALjTua64+yCH9F9I6Y/YcH2ljUk8AW9/lYi0eDYNjggdG9kvLRoehXs?=
 =?us-ascii?Q?QUwYJBKIiHCaNF4K5HbHK+bfurmHSwy9gUkWxRxzCIvuT2DlgORC2Hty5Zyg?=
 =?us-ascii?Q?btkq5NTUJAYtbagbcBOoZTAakfEnir3ZoOExfe4ZfBYkDLJHMgnvSSn0CRsB?=
 =?us-ascii?Q?pM+tgJhmExjYAXZsNJ7vNfdOXsTxWqAXmem9BEUvg4kpq6ziJgF0fgaRM6rJ?=
 =?us-ascii?Q?EQgSfHq0aPTBjzeJw4EDF/oZ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4886.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aea336f8-68a1-4d66-626c-08d93824a72c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2021 22:00:32.1519 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: waZVUT5LzDA2QxTl52u3N0HK7YfXnBbMEPsxC4vQjE6mJHZOEQ1ZTY/iLPIMRFzcXR4sPFrdOhaAswVL081Xcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7309
Received-SPF: pass client-ip=216.71.142.165; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: Alessandro Di Federico <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "babush@rev.ng" <babush@rev.ng>, "nizzo@rev.ng" <nizzo@rev.ng>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Alessandro Di Federico <ale.qemu@rev.ng>
> Sent: Saturday, June 19, 2021 3:37 AM
> To: qemu-devel@nongnu.org
> Cc: Taylor Simpson <tsimpson@quicinc.com>; Brian Cain
> <bcain@quicinc.com>; babush@rev.ng; nizzo@rev.ng; philmd@redhat.com;
> richard.henderson@linaro.org; Alessandro Di Federico <ale@rev.ng>
> Subject: [PATCH v5 11/14] target/hexagon: call idef-parser functions
>=20
> From: Alessandro Di Federico <ale@rev.ng>
>=20
> Extend gen_tcg_funcs.py in order to emit calls to the functions emitted b=
y
> the idef-parser, if available.
>=20
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>


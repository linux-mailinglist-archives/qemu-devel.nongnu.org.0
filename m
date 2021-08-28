Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C69C53FA667
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Aug 2021 17:14:24 +0200 (CEST)
Received: from localhost ([::1]:46734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mK02J-0000N7-7d
	for lists+qemu-devel@lfdr.de; Sat, 28 Aug 2021 11:14:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8874121c5c=pdel@fb.com>)
 id 1mK01J-0007wP-G4; Sat, 28 Aug 2021 11:13:21 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:62948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8874121c5c=pdel@fb.com>)
 id 1mK01G-0003mM-T5; Sat, 28 Aug 2021 11:13:21 -0400
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17SF54xx015194; Sat, 28 Aug 2021 08:13:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=1cbla7nMtIWu1yhs6QBa4MJqMme0c0xSa4ibjSNNM7k=;
 b=F5yQFgcfw2XHk3QcXx8TfLB/QFEXz5E9yglvFdkliUWj3gvpRhB1cNBFiBHkh5DdLRLo
 vgfiJdCx1k9ThtkubMVFf045cs9cydYAgQk3UuVSJF760pumNP2EArLkqubjhmBhVZsz
 i4KTxXD6J/IZD8ER7why6xfcj4vLfWl851M= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 3aqmt2gpf1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Sat, 28 Aug 2021 08:13:05 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.172) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sat, 28 Aug 2021 08:13:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TWW0zgTEj3FrQhGAueG6Xc5NIJFIQt/NOU6yWqzWpGtY7YTj37/KocjvIEiT83bwajgx6P2o4NzKWdEIiIWnXR5tLCnIWUeyph7MfYPGo8yBreuvYwjJ9rmQczrVpnBQXH+5EsQhiOtLpZ8OsRIe08JXZ+W+ST3U2hna33tY3BAsZEY/ux3p8/BkcDyI6/Yr9stOvD+cypGJvmEvPUM4NvbsagnzSZw4h1q2ZwiAZ5aRD1uVUOe1YvlznIE1r1vhH3hw7Dr+iBaxNr5MyjYRUb3GTwe5bccI975RgG03j4oN1wGUexdVQkMBbjkLF0yI8ZXHGKG7yBNHpk1mhBUMhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1cbla7nMtIWu1yhs6QBa4MJqMme0c0xSa4ibjSNNM7k=;
 b=ndhfSPxnKyGv36Cgb1VTlC08EWgOxQeOaPdxH1256Prtubpr6yS688MyQwnOYR8BFHpKvbA6fjXjlVlus2mea5RqhiA5ZgxJ4MqSRueVQsfc3BvKyaxIQ9hs3RTPxccQpMjKvIqLi02oeoFPv0dqJTl7NXvBL9TnZq6HL0bNyRPoaE6BuvlhKbDU5mHIYyfQ6NQbO4MtpORri5Im4JB/klFydDhWyE4YwNxNSxIJbi5tfQSZ3YhvQlrJElFSb99IzEJtWHg+5l0y60kfI0iczdFMR/CZsS6zjz7RMcrHonZx0DiE+7hfGrB9w+BfICdmOGPjKGsg8ipXe5vPZogdAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by BY3PR15MB4929.namprd15.prod.outlook.com (2603:10b6:a03:3c4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Sat, 28 Aug
 2021 15:13:02 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::39cf:cf4c:885c:9368]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::39cf:cf4c:885c:9368%7]) with mapi id 15.20.4436.024; Sat, 28 Aug 2021
 15:13:02 +0000
From: Peter Delevoryas <pdel@fb.com>
To: =?Windows-1252?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
CC: "joel@jms.id.au" <joel@jms.id.au>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Subject: Re: [PATCH 4/5] hw/arm/aspeed: Fix AST2600_CLK_SEL3 address
Thread-Topic: [PATCH 4/5] hw/arm/aspeed: Fix AST2600_CLK_SEL3 address
Thread-Index: AQHXm4doKvWCEB9st06BNBQ5fVob6KuIksWAgAByooo=
Date: Sat, 28 Aug 2021 15:13:02 +0000
Message-ID: <BYAPR15MB30320F9D8973D92CA8FC6992ACC99@BYAPR15MB3032.namprd15.prod.outlook.com>
References: <20210827210417.4022054-1-pdel@fb.com>
 <20210827210417.4022054-5-pdel@fb.com>
 <a7740ed2-67ef-d0f8-09e6-c417c3904ade@kaod.org>
In-Reply-To: <a7740ed2-67ef-d0f8-09e6-c417c3904ade@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kaod.org; dkim=none (message not signed)
 header.d=none;kaod.org; dmarc=none action=none header.from=fb.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2b2e8e2e-4c09-4aad-a084-08d96a365451
x-ms-traffictypediagnostic: BY3PR15MB4929:
x-microsoft-antispam-prvs: <BY3PR15MB4929727256078C0140A56C93ACC99@BY3PR15MB4929.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OJZIHx/GFJSM9vB5OfQnmojyUhtZxeXcSHId0q47CZ7exdlB5Y9kx4v0jte7zJMuU5RsqJ6YGa01rCiCXkjLF9qkVBsllkJS0DX/IQr5/FAnAN0FcFFS0juEzwZQgtx8cwYt9Dt2RR9R8rvQ3hPgItkwUkvE4ZelG4bAOvfBB5fg0lsk+tuAoTFGS6CdMjZxxcQ2+XYzOO9HZ3x6EEFMcPUcn9ogMhgHlTR3471sRcMAW8XoJVNpaeNwbK0ZfLC8RFM59xEC5XiYBqCITxFgdb8p9giWDj6y5nGB8n+1D2mw3b5TqXSZsP+OXyEmPt4d8GhfaQjXBJB1qpPePu1/HGtwAf+J0Wk18qp2NZIuhlm79+CWVl/IE4ks9umK4nvll2wCKODKg5o/2vEwHnvMP67n2ViYtrQ77m0s/LsNZt2c6d+H/hrSpcFGskrlCdIICoQQ01+LLiGwDNVVtSEARWq7oOH5g6LaQ7WEtTa3rlTO0mhFs8PxtxNiiVegCMbIu07zwq83KkrAIqNKjhVS0G48q8xUDJLXVbKKXGtPCU/k0Q8zGfg5uLtbMZj26TDUIgpWgeOT0iDRAtOXZBuN4d4CI6gwnjNi7GhcABrqwIaJ/A+t4mHSoU03lCuBRURMe2aeCRjOWhsy9qbs5SW4BGQtEVx89evuPT+7QgHZmz3tNVPgh08HVeQGllX86/1ihKYcxrpSOKfv554M3G8C3mrJiwI+1nnl/5cokO+J+rwz+AASVdYMoCO5q7L/ukloJmARUFlliLw2We8SjH83da8xobghPzJhrhsFTPHlMOQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(366004)(396003)(376002)(346002)(4326008)(9686003)(53546011)(5660300002)(166002)(8676002)(7696005)(38100700002)(38070700005)(8936002)(55016002)(54906003)(33656002)(64756008)(52536014)(478600001)(6916009)(76116006)(66574015)(66946007)(66556008)(6506007)(186003)(66446008)(316002)(71200400001)(966005)(122000001)(86362001)(83380400001)(66476007)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?8NTN61emj/mOsj3xc60l3qk1ToNT6QH8j5UAi0Dl8kxXaVWY6XYY3sjI?=
 =?Windows-1252?Q?t/29XLH1x6KDMwIXRszAolI7Gd+o7RTz5JNgwYyWTPg+9BdjfYEO7Trg?=
 =?Windows-1252?Q?h4ShCRwtt7aGGEH4EPIYl+JP+acXuKGe9beRSMtUXjcbSlhI7sCcshcB?=
 =?Windows-1252?Q?eN+oTc98FXxWDbPqTCR+1Eb3mfSGFRnF8+HcKY4QaSX2eQ5Qa9NOrVMH?=
 =?Windows-1252?Q?WnfdVbVcJc8HJutXAMAQiMNpyAZLl7CGFZ2RQStQfXflvik91OoqT/7D?=
 =?Windows-1252?Q?+XswwpjPdSjQcku7NMx4MS7X2MZvxnWBawKIPqPpW9cXIN94NafdqH88?=
 =?Windows-1252?Q?qoe8+61tr2FMEp/9rcI13IDyRshzfaHXPnGLPcHIJREzF6T3Ot9QiFKj?=
 =?Windows-1252?Q?A+nYhPCtWGZ/13dgiDfrNT1l4ZMDCFA1v4mf+7xeFXFBdYF7KQJjfe7N?=
 =?Windows-1252?Q?slbBT/a1YBQPeMI66HnHDisfc3//wMSa++YCu/z0kEtYIV7dZByqCSYE?=
 =?Windows-1252?Q?WfdWnarK4COg0jPbXR2tgdgQyU/Ul6ANlJquYJibNEZ0c2Eh6cf0DpGa?=
 =?Windows-1252?Q?ANgdV1J7I4LlV5dFrWHxlwj6Fm3CY+Nm4zCGh0gFMYEKQwKcHNdrYI5h?=
 =?Windows-1252?Q?N9C3ABA06vkZxBgibqkHUC4y/+vOzKAXNJauqaHEIAigrURAdaKyW7Bv?=
 =?Windows-1252?Q?kJi5iN8ksKbEnBt0Ew7NAYzrG3OTlhi60WDnEbZ3ydkY13K8DxfFop/L?=
 =?Windows-1252?Q?3upVnQny5H9A4yoMk+qh4y+e5id+ID/MGCd6nJR/VpV756kmxpLXsFfM?=
 =?Windows-1252?Q?3BgCPvPP3cHYsxGAt0d2VlpQfglJHHas4KfsSer9KJGVpUfDnhWawS9h?=
 =?Windows-1252?Q?VQHvqymoJsCcocBqMkhH0IfEkeo6mNqA7N/uCAvdLO83oV3zW4GRBHU+?=
 =?Windows-1252?Q?9t4tDdR/uimed4+Of4p37yTE0hCtkQvkamQiQWVS/qnLoAGrGUk8ktZ+?=
 =?Windows-1252?Q?nVuNOUUqc2aYsjGS9jID70VxSnztbth8BCpM/cK/ALKQ4M8Utg2jo5QA?=
 =?Windows-1252?Q?pdqkXNeHC90XEu61IkUDBDZfxogrEzIzmwKO6563MMJ1mxkqoDTjob6G?=
 =?Windows-1252?Q?1VrQYpypaVRn2/iEw147/a7G3ER0b3bOLYQzKrOXb7qgW6kD0zNntxC1?=
 =?Windows-1252?Q?pEcalpkgqzk5KjY+IoTRGj+mDGep5xkxjwM2JGUVLcz71SpN6mhnSBym?=
 =?Windows-1252?Q?BZHxnp0Cl5GqpRWt1jl94G5DkBzLgCrGyrXv03FUIY5QC2sdFCYHr7ca?=
 =?Windows-1252?Q?79wslstg9V4xbkoKFHjf3XyO0lF7Lu821PB9aHGUnq3gwK3sRCvYp8gA?=
 =?Windows-1252?Q?edPAXIgVhlWSRyr57G2wjB9/7RqJt0Aerq7WQogwWhCuNomq1PNceNpQ?=
 =?Windows-1252?Q?lR0fje7H9Ewakx/5RqXq5CwQzMtFtvemXveLL58tLAc=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_BYAPR15MB30320F9D8973D92CA8FC6992ACC99BYAPR15MB3032namp_"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b2e8e2e-4c09-4aad-a084-08d96a365451
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2021 15:13:02.4190 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FsQn652H7a/ZtL2WYba2UhAmnQt+FiDAF9SyPep0pMEd4RCQHjomeL7rADn8TdFq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR15MB4929
X-OriginatorOrg: fb.com
X-Proofpoint-ORIG-GUID: z7kLuq-U4BOCYKqOOyZulphpgL5RAc30
X-Proofpoint-GUID: z7kLuq-U4BOCYKqOOyZulphpgL5RAc30
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-28_04:2021-08-27,
 2021-08-28 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 impostorscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=778 suspectscore=0 malwarescore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108280096
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=8874121c5c=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_BYAPR15MB30320F9D8973D92CA8FC6992ACC99BYAPR15MB3032namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Oh, thanks, I=92ll remove this part!

From: C=E9dric Le Goater <clg@kaod.org>
Date: Saturday, August 28, 2021 at 1:15 AM
To: Peter Delevoryas <pdel@fb.com>
Cc: joel@jms.id.au <joel@jms.id.au>, qemu-devel@nongnu.org <qemu-devel@nong=
nu.org>, qemu-arm@nongnu.org <qemu-arm@nongnu.org>
Subject: Re: [PATCH 4/5] hw/arm/aspeed: Fix AST2600_CLK_SEL3 address
On 8/27/21 11:04 PM, pdel@fb.com wrote:
> From: Peter Delevoryas <pdel@fb.com>
>
> This register address is not actually used anywhere, and the datasheet
> specifies that it's zero-initialized by default anyways, but the address
> is incorrect. This just corrects the address.
>
> Fixes: e09cf36321f6 ("hw: aspeed_scu: Add AST2600 support")
> Signed-off-by: Peter Delevoryas <pdel@fb.com>

This is covered by a patch already sent by Joel.

See https://github.com/legoater/qemu/commits/aspeed-6.2

Thanks,

C.

> ---
>  hw/misc/aspeed_scu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> index 40a38ebd85..c373e678f0 100644
> --- a/hw/misc/aspeed_scu.c
> +++ b/hw/misc/aspeed_scu.c
> @@ -108,7 +108,7 @@
>  #define AST2600_EPLL_EXT          TO_REG(0x244)
>  #define AST2600_CLK_SEL           TO_REG(0x300)
>  #define AST2600_CLK_SEL2          TO_REG(0x304)
> -#define AST2600_CLK_SEL3          TO_REG(0x310)
> +#define AST2600_CLK_SEL3          TO_REG(0x308)
>  #define AST2600_HW_STRAP1         TO_REG(0x500)
>  #define AST2600_HW_STRAP1_CLR     TO_REG(0x504)
>  #define AST2600_HW_STRAP1_PROT    TO_REG(0x508)
>

--_000_BYAPR15MB30320F9D8973D92CA8FC6992ACC99BYAPR15MB3032namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
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
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Oh, thanks, I=92ll remove this part!<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><b><span style=3D"fon=
t-size:12.0pt;color:black">From:
</span></b><span style=3D"font-size:12.0pt;color:black">C=E9dric Le Goater =
&lt;clg@kaod.org&gt;<br>
<b>Date: </b>Saturday, August 28, 2021 at 1:15 AM<br>
<b>To: </b>Peter Delevoryas &lt;pdel@fb.com&gt;<br>
<b>Cc: </b>joel@jms.id.au &lt;joel@jms.id.au&gt;, qemu-devel@nongnu.org &lt=
;qemu-devel@nongnu.org&gt;, qemu-arm@nongnu.org &lt;qemu-arm@nongnu.org&gt;=
<br>
<b>Subject: </b>Re: [PATCH 4/5] hw/arm/aspeed: Fix AST2600_CLK_SEL3 address=
<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">On 8/27/21 11:04 PM, =
pdel@fb.com wrote:<br>
&gt; From: Peter Delevoryas &lt;pdel@fb.com&gt;<br>
&gt; <br>
&gt; This register address is not actually used anywhere, and the datasheet=
<br>
&gt; specifies that it's zero-initialized by default anyways, but the addre=
ss<br>
&gt; is incorrect. This just corrects the address.<br>
&gt; <br>
&gt; Fixes: e09cf36321f6 (&quot;hw: aspeed_scu: Add AST2600 support&quot;)<=
br>
&gt; Signed-off-by: Peter Delevoryas &lt;pdel@fb.com&gt;<br>
<br>
This is covered by a patch already sent by Joel. <br>
<br>
See <a href=3D"https://github.com/legoater/qemu/commits/aspeed-6.2">https:/=
/github.com/legoater/qemu/commits/aspeed-6.2</a><br>
<br>
Thanks,<br>
<br>
C.<br>
<br>
&gt; ---<br>
&gt;&nbsp; hw/misc/aspeed_scu.c | 2 +-<br>
&gt;&nbsp; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c<br>
&gt; index 40a38ebd85..c373e678f0 100644<br>
&gt; --- a/hw/misc/aspeed_scu.c<br>
&gt; +++ b/hw/misc/aspeed_scu.c<br>
&gt; @@ -108,7 +108,7 @@<br>
&gt;&nbsp; #define AST2600_EPLL_EXT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; TO_REG(0x244)<br>
&gt;&nbsp; #define AST2600_CLK_SEL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; TO_REG(0x300)<br>
&gt;&nbsp; #define AST2600_CLK_SEL2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; TO_REG(0x304)<br>
&gt; -#define AST2600_CLK_SEL3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; TO_REG(0x310)<br>
&gt; +#define AST2600_CLK_SEL3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; TO_REG(0x308)<br>
&gt;&nbsp; #define AST2600_HW_STRAP1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; TO_REG(0x500)<br>
&gt;&nbsp; #define AST2600_HW_STRAP1_CLR&nbsp;&nbsp;&nbsp;&nbsp; TO_REG(0x5=
04)<br>
&gt;&nbsp; #define AST2600_HW_STRAP1_PROT&nbsp;&nbsp;&nbsp; TO_REG(0x508)<b=
r>
&gt; <o:p></o:p></p>
</div>
</div>
</body>
</html>

--_000_BYAPR15MB30320F9D8973D92CA8FC6992ACC99BYAPR15MB3032namp_--


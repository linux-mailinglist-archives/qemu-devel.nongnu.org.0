Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFFB4E6C8E
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 03:33:03 +0100 (CET)
Received: from localhost ([::1]:57676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXZl8-0003Ff-BE
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 22:33:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robhenry@microsoft.com>)
 id 1nXZk1-000265-NI; Thu, 24 Mar 2022 22:31:54 -0400
Received: from [2a01:111:f403:c111::] (port=1978
 helo=na01-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robhenry@microsoft.com>)
 id 1nXZjx-0003mA-EY; Thu, 24 Mar 2022 22:31:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=anku7QmcLY73/3FDhD6Dp9s18t2GP/XJZQowBAfywh0HuX8Ecrsq88cgC+FjZjyf21CWYkkVFC13SCRbHJTJlxQjvh1h2AnEz7Hooe8jSRFvj1dQq5yWOw3EMqiKMkqPTXCr63V1KeOUAJts0QI2enxYegzNBPAUlx4dmikVqt2zye/mgQFVQTxpmhZFc0wyUoUVtRxBowtoutYp24jXytARDINiT350HtJTzviCaqcc6I8rFgf8xbgbd+Pzxw+hJXigggfbcgKOXl/LYtsgzmrnjAibDcl8hqkISqaZFLYXhBY0Vlj11u+wJL/6osbJC4pcveSUDiw5+Rr364ywnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4yU1VCflOtwEwOPQYPh77H/s02osESAoFb836uftNh0=;
 b=HdhqnRFlfsiDwz7Hl4WYScaDfroYsDnUCmh6ET/g0cSLcTBYdqVZ0fd3qkRsMMUxB+A6s1/yMp1EvduCRCNUpmAjSc2MlK6xLOmeJ5YeHIq9Y7vDRe2fkys+EwMN+rQGZjkyKnE+1Y1TZj68jOmzTKFT89ZH4B3Se0r/AaXntMu/iDIH6vMUE3TrsiBLxQzAuJxBzTGxyeuBXV5W8KcP4Pf+NrfXHy1oIWwpyCDeO680NTs+GqkPYoBdnetE2KQ9XnZlfW4uzJxEA03A7cUgxYij1agFl2JUclf+vhy6YdTuYG7yND078jRaBWyf1HONBUNL+Vy2UX7IHdujLDv+Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4yU1VCflOtwEwOPQYPh77H/s02osESAoFb836uftNh0=;
 b=Eblj4hBww2nJEKf6U49L3wZ9fQQcvE5HFe072aYkeOGcF3whos0WzJMiCG4CmWENKERyWjxU3Y1d46Q+tsYIR8CtQyuvrrb8aLX5G7bDYU/5S9euCoR5TuD0a6CCcBEIuW8ZXXIrt6wq5BG4+gZXAHHbuCku4zoiqlZVet1e2Ic=
Received: from BY5PR21MB1426.namprd21.prod.outlook.com (2603:10b6:a03:232::23)
 by BL0PR2101MB1123.namprd21.prod.outlook.com (2603:10b6:207:30::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.4; Fri, 25 Mar
 2022 02:17:38 +0000
Received: from BY5PR21MB1426.namprd21.prod.outlook.com
 ([fe80::4c83:287f:f96c:43c8]) by BY5PR21MB1426.namprd21.prod.outlook.com
 ([fe80::4c83:287f:f96c:43c8%7]) with mapi id 15.20.5123.010; Fri, 25 Mar 2022
 02:17:38 +0000
From: Robert Henry <robhenry@microsoft.com>
To: Aaron Lindsay <aaron@os.amperecomputing.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
CC: =?iso-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>
Subject: Re: [EXTERNAL] Plugins Not Reporting AArch64 SVE Memory Operations
Thread-Topic: [EXTERNAL] Plugins Not Reporting AArch64 SVE Memory Operations
Thread-Index: AQHYP7xDf6/sFcMojUCJFmbHYBiEHazPXXV8
Date: Fri, 25 Mar 2022 02:17:38 +0000
Message-ID: <BY5PR21MB1426A0FBD14A5A04D1E22DA0D61A9@BY5PR21MB1426.namprd21.prod.outlook.com>
References: <YjzR3erB5ZhkAI2A@strawberry.localdomain>
In-Reply-To: <YjzR3erB5ZhkAI2A@strawberry.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-03-25T02:17:37.826Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b1b2c0e9-056d-4ea2-27c9-08da0e05a259
x-ms-traffictypediagnostic: BL0PR2101MB1123:EE_
x-ms-exchange-atpmessageproperties: SA|SL
x-microsoft-antispam-prvs: <BL0PR2101MB112384904FCC8B058C3A68DBD61A9@BL0PR2101MB1123.namprd21.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mOUR9IfGgYHL4apaaVRDBJetvQWS91gRCkkYmIN8pwHP0K/ftJXOomjEIyUSFbsPNz3wb44ZN9uHiZ+kbkp5j2qHOxhQLb+3kOmdzZGAT1YP5mKgD9GSwDFk+d5lKdfhgX0pDtWA2F8t92GtGiU6rU+2+auqi64zep992si7XAsShwJR+t8Z9A6qGIHfJ0YgmBBHJlBbc8+OqpUQZOrnZdKlAetpImoq3H6f2+DuxyDMXo4SWe8RfCyv2SDiQWN5YT+uSqO7OHRYK14PLmNiDQIEibI08oDAf07WhjwWRP591B2cVI4DK62i9f685MaVvB3Z1X0oz4wZmT1Owdj9c46voAAAXa9ux2yzuq2mlOUAQVsSMGI2bKbZpHX57P5FY981dQgAtbwG0C3D2o+Mfo1Z9y0GoVirwCyw1AIrhPQ11Inj+NDMGZHhFmSs/Kh/rbDmStZ4PRNsfezqAlf3BviEEosNQj1rBP2qzIALlrq31C5aoJRUu2WDf2ZVuMtDLslkSD0Fi2YNIxShmzjdzNC7rsbPKNh/aXBwDpRh3u8gnlqPAcKyLybSjfO+ESY5DFdkhl1lpbv8Nkw0MeAE50GgNFal+/WLEd/ULREMcDzA/lvj51PVuLKQVzgJ6xjR01gQciqg1WY5JiNy9asjZ7Sfra1RDyxLsSukE8/KE/EbO9B9PKCRd/bwCvS6fZzZutAjhkkPctJjrIFUQKAJCyWwG88CJJMWuPnKPNCILuO23kqIcZkzVICe8GTdk8BGjYVksE5v5q+QTSqjpRlWs5WGeceqPJIBSNswYwJ+MOEv7Xs7CochBe3oymZ24Ab36xdbXz3SvscWmPxgN6L+jA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR21MB1426.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(451199009)(66476007)(55016003)(83380400001)(71200400001)(19627405001)(66556008)(122000001)(76116006)(966005)(316002)(54906003)(66946007)(4326008)(64756008)(8676002)(8990500004)(38070700005)(110136005)(91956017)(82960400001)(86362001)(186003)(8936002)(9686003)(82950400001)(10290500003)(5660300002)(33656002)(66574015)(166002)(66446008)(52536014)(508600001)(53546011)(38100700002)(6506007)(2906002)(26005)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Swb0wuVVcaHy1o4CX0VynC+TpusL9Jm5od5Dl16m9S/PfkS8IAs59bcV2o?=
 =?iso-8859-1?Q?fxgw/BldRcB8tPzO/cd6oskUJaAll6zd7r3IZM4q3OCf5MrlQTEMbDzxv7?=
 =?iso-8859-1?Q?Z64sdrXnYR11A8wOtWvQD2vh/6sTMVcRIG9JG1DAPEfGOh+WExaRAupr3A?=
 =?iso-8859-1?Q?tL/hhMAqRawv3ofqXXEmCf0D8OxB+X+uiXDHonOEvVsoWHBM4l3iC5L70A?=
 =?iso-8859-1?Q?Krt1Hyqd/ekcW+4phIplcu5EZqN6oEPCGF8BmZGYvWtKzjK7R6JDr/nf87?=
 =?iso-8859-1?Q?gmNMLVvfgw8D6NAlYKAch4kfuxeHGmeP4Uaz5076x0cezaVsBQUReYgtr0?=
 =?iso-8859-1?Q?4/6ZuumDUc8Li1de4AuA3vSzA7bco0zc1Z8gJ87Tn0mig3RHo9HBgCwm0q?=
 =?iso-8859-1?Q?ytmwQjeemPDedwZZqkL9RIZY3eXObcNzvvkw/5i5AwAf/NAEWGYrEGuPy2?=
 =?iso-8859-1?Q?F/dw4uLMnzTVqtN6pgDQzGTjKbI6sTNKeBE+oGdkCptQxqqY9YaWs6ImGI?=
 =?iso-8859-1?Q?fDcFZfYk1mt6s6HTnQNjCP83iQcic1aZ5atqLnEPjNdbOGhSPBVFFjuZK5?=
 =?iso-8859-1?Q?UGPZC8qiFKu3HZqJk1Md5PTlJEa7fY59bYrE8pLvC/AOTDnFneviyWFXFt?=
 =?iso-8859-1?Q?JTwcvXOkrtz6xbjqVlHTnN3cAKlFAEJg2qTDQJ/+ZraGZnjatOCzZHJizV?=
 =?iso-8859-1?Q?BTUFY0uCxnTWWjqYNEsnj8elyaG0uy5De+MlIl6ws2UEilp9ErxXiVxHA/?=
 =?iso-8859-1?Q?xTIDREAmwvSEZL/lUt1StU3EBc7z0Zmq571wy0yqbrpTqy1hc6co0Uwh3t?=
 =?iso-8859-1?Q?vscB5kueeNusNO9BWc0JhHb/9DQ5IRlzNNx/F9VXqJWV5WRAA9fUzo11RK?=
 =?iso-8859-1?Q?vOrS0lzys0520kGXu4OPq9ZF2ymKoywT1I0LmUdxCPPZY+uPSF0QZ4p8xk?=
 =?iso-8859-1?Q?QpHJZ/wR3UpyOHjljIwKFDQ9Mfh07BrqWMrOW0JCWuP510B0bn09FGRxHt?=
 =?iso-8859-1?Q?iTuRjk8IcwSVvnt8hKFInacg6EkpsEREpJpDOSwjQmPw3t3suW5QDPTAOP?=
 =?iso-8859-1?Q?c1mvKYN0FF28DYP6pZ7D36t+GI1h2hR9y45KvMhQUYBXtGkh7Ihdtof3y5?=
 =?iso-8859-1?Q?X63M9C1qNtCVEEgGtE0QRATBG6y0t8netV1RYgYOeJXt7uU/2XXGVeZu6g?=
 =?iso-8859-1?Q?aQnkxJLZ/RJYTytbNiZdUu3L0/EIIrTGa9RDjJ2KMLZGbp/fkZVA1Ue/qA?=
 =?iso-8859-1?Q?DhECHt3GB5c4iVMatx/drAkrGryk6KtXXiAVY84LjwlWLB3OVBFqINNTbO?=
 =?iso-8859-1?Q?kXyttQ/vlaOAqWTzg2jCQcUl27Y10TthjlmzNgFuqoSIlS8hMyec6Lr4Gy?=
 =?iso-8859-1?Q?ZvZU9DuMT7wSpjC0s1me0cw3ZIigNUBIuXQyeHWMLppx4uaGLrF+wqa8Sl?=
 =?iso-8859-1?Q?8cWg8h4OmC6AMzwb9u7yCnpSZxxSTkXOYcSn+nVdEVOCA82Xy+5QSdGp2k?=
 =?iso-8859-1?Q?rT5y/DblMcJFe7fLJd853D9VZDx6+aXZEyYoGPTzxotXMw7+P+Vwau2u6U?=
 =?iso-8859-1?Q?9/+YGiFiOiKYxN7ev52I8kui2w/OicGCHBq3tO4NPUjI19blSEwsi4/rHf?=
 =?iso-8859-1?Q?ilSTchJhJg7N2r27H9cYcLBwnT1sif7nrttAsP/d0jUlDlV46gQTBFADNH?=
 =?iso-8859-1?Q?a/KKQgdtii9/G9/eNrax95qOh2WmLK7ug2UmoQ9XGhwbVYz2/vWFetMb8l?=
 =?iso-8859-1?Q?3VxsnhisTIJpIc2TeJ5mPgqHfXOVyLDoA94cKRil26A4M4pDtHrI0vSXH1?=
 =?iso-8859-1?Q?QwZF8xPEpQ=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BY5PR21MB1426A0FBD14A5A04D1E22DA0D61A9BY5PR21MB1426namp_"
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR21MB1426.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1b2c0e9-056d-4ea2-27c9-08da0e05a259
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2022 02:17:38.6524 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rcaGlNg1GryjeoXSw0321nNoIAw08ee50y9Wu4GhNh5gXfX2oqZzqZcU0OQ0NUg4eemeyY3MwChmjyAIuUA0Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR2101MB1123
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f403:c111::
 (failed)
Received-SPF: pass client-ip=2a01:111:f403:c111::;
 envelope-from=robhenry@microsoft.com;
 helo=na01-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_BY5PR21MB1426A0FBD14A5A04D1E22DA0D61A9BY5PR21MB1426namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I have not done anything on this front, alas.
________________________________
From: Aaron Lindsay <aaron@os.amperecomputing.com>
Sent: Thursday, March 24, 2022 1:17 PM
To: qemu-devel@nongnu.org <qemu-devel@nongnu.org>; qemu-arm@nongnu.org <qem=
u-arm@nongnu.org>
Cc: Alex Benn=E9e <alex.bennee@linaro.org>; richard.henderson@linaro.org <r=
ichard.henderson@linaro.org>; Robert Henry <robhenry@microsoft.com>
Subject: [EXTERNAL] Plugins Not Reporting AArch64 SVE Memory Operations

Hi folks,

I see there has been some previous discussion [1] about 1.5 years ago
around the fact that AArch64 SVE instructions do not emit any memory
operations via the plugin interface, as one might expect them to.

I am interested in being able to more accurately trace the memory
operations of SVE instructions using the plugin interface - has there
been any further discussion or work on this topic off-list (or that
escaped my searching)?

In the previous discussion [1], Richard raised some interesting
questions:

> The plugin interface needs extension for this.  How should I signal that =
256
> consecutive byte loads have occurred?  How should I signal that the contr=
olling
> predicate was not all true, so only 250 of those 256 were actually active=
?  How
> should I signal 59 non-consecutive (gather) loads have occurred?
>
> If the answer is simply that you want 256 or 250 or 59 plugin callbacks
> respectively, then we might be able to force the memory operations into t=
he
> slow path, and hook the operation there.  As if it were an i/o operation.

My initial reaction is that simply sending individual callbacks for each
access (only the ones which were active, in the case of predication)
seems to fit reasonably well with the existing plugin interface. For
instance, I think we already receive two callbacks for each AArch64
`LDP` instruction, right?

If this is an agreeable solution that wouldn't take too much effort to
implement (and no one else is doing it), would someone mind pointing me
in the right direction to get started?

Thanks!

-Aaron

[1] https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flis=
ts.nongnu.org%2Farchive%2Fhtml%2Fqemu-discuss%2F2020-12%2Fmsg00015.html&amp=
;data=3D04%7C01%7Crobhenry%40microsoft.com%7C4fbf9f5adeca457a475e08da0dd35d=
c4%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C637837498833440416%7CUnknow=
n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI=
6Mn0%3D%7C3000&amp;sdata=3DbTHMSkvOvvX7o7seFIbf7gDk5V%2BMBhC6YytOorHbNts%3D=
&amp;reserved=3D0

--_000_BY5PR21MB1426A0FBD14A5A04D1E22DA0D61A9BY5PR21MB1426namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I have not done anything on this front, alas.</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Aaron Lindsay &lt;aar=
on@os.amperecomputing.com&gt;<br>
<b>Sent:</b> Thursday, March 24, 2022 1:17 PM<br>
<b>To:</b> qemu-devel@nongnu.org &lt;qemu-devel@nongnu.org&gt;; qemu-arm@no=
ngnu.org &lt;qemu-arm@nongnu.org&gt;<br>
<b>Cc:</b> Alex Benn=E9e &lt;alex.bennee@linaro.org&gt;; richard.henderson@=
linaro.org &lt;richard.henderson@linaro.org&gt;; Robert Henry &lt;robhenry@=
microsoft.com&gt;<br>
<b>Subject:</b> [EXTERNAL] Plugins Not Reporting AArch64 SVE Memory Operati=
ons</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi folks,<br>
<br>
I see there has been some previous discussion [1] about 1.5 years ago<br>
around the fact that AArch64 SVE instructions do not emit any memory<br>
operations via the plugin interface, as one might expect them to.<br>
<br>
I am interested in being able to more accurately trace the memory<br>
operations of SVE instructions using the plugin interface - has there<br>
been any further discussion or work on this topic off-list (or that<br>
escaped my searching)?<br>
<br>
In the previous discussion [1], Richard raised some interesting<br>
questions:<br>
<br>
&gt; The plugin interface needs extension for this.&nbsp; How should I sign=
al that 256<br>
&gt; consecutive byte loads have occurred?&nbsp; How should I signal that t=
he controlling<br>
&gt; predicate was not all true, so only 250 of those 256 were actually act=
ive?&nbsp; How<br>
&gt; should I signal 59 non-consecutive (gather) loads have occurred?<br>
&gt; <br>
&gt; If the answer is simply that you want 256 or 250 or 59 plugin callback=
s<br>
&gt; respectively, then we might be able to force the memory operations int=
o the<br>
&gt; slow path, and hook the operation there.&nbsp; As if it were an i/o op=
eration.<br>
<br>
My initial reaction is that simply sending individual callbacks for each<br=
>
access (only the ones which were active, in the case of predication)<br>
seems to fit reasonably well with the existing plugin interface. For<br>
instance, I think we already receive two callbacks for each AArch64<br>
`LDP` instruction, right?<br>
<br>
If this is an agreeable solution that wouldn't take too much effort to<br>
implement (and no one else is doing it), would someone mind pointing me<br>
in the right direction to get started?<br>
<br>
Thanks!<br>
<br>
-Aaron<br>
<br>
[1] <a href=3D"https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Flists.nongnu.org%2Farchive%2Fhtml%2Fqemu-discuss%2F2020-12%2Fmsg000=
15.html&amp;amp;data=3D04%7C01%7Crobhenry%40microsoft.com%7C4fbf9f5adeca457=
a475e08da0dd35dc4%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C637837498833=
440416%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6=
Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;amp;sdata=3DbTHMSkvOvvX7o7seFIbf7gDk5V%2B=
MBhC6YytOorHbNts%3D&amp;amp;reserved=3D0">
https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.n=
ongnu.org%2Farchive%2Fhtml%2Fqemu-discuss%2F2020-12%2Fmsg00015.html&amp;amp=
;data=3D04%7C01%7Crobhenry%40microsoft.com%7C4fbf9f5adeca457a475e08da0dd35d=
c4%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C637837498833440416%7CUnknow=
n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI=
6Mn0%3D%7C3000&amp;amp;sdata=3DbTHMSkvOvvX7o7seFIbf7gDk5V%2BMBhC6YytOorHbNt=
s%3D&amp;amp;reserved=3D0</a><br>
</div>
</span></font></div>
</body>
</html>

--_000_BY5PR21MB1426A0FBD14A5A04D1E22DA0D61A9BY5PR21MB1426namp_--


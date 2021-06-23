Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 242C43B1D8B
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 17:21:30 +0200 (CEST)
Received: from localhost ([::1]:34570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw4gy-0005Go-O7
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 11:21:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lw4fv-0004Xf-QB
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 11:20:23 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:30230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lw4fs-0007n1-P2
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 11:20:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1624461617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ojcbZ50KSy3X54OCbVoNFOlBywiZQnvXFvB/Xg9gugo=;
 b=CDcOIUKwC+EIC7Vu68DZVzbZsFqop8d5Ce8BVnjOUTwtniYJQJ2+99hcSIXlfPTLanKGpj
 grvSlAnQrIdSp47c3VSPVrkovKz6Xjyy6ZTZ1GiiQjc7gQCJQ1FRqaPjFNdLwUY8QFJU/0
 dS6kcDupwELzKoQueLFao36LqQmSTa4=
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-6-cYc3ZnIbOMONeTNNnDkdDg-1;
 Wed, 23 Jun 2021 17:20:15 +0200
X-MC-Unique: cYc3ZnIbOMONeTNNnDkdDg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C6FGV7Kf2Nm6L/DUZ4sFR55vnoalLJnhLAQk96blxROlW2ODJ3vUiiVi+zAgMKvKKHKGTs7P6OoWMRGQQX/+cfQsd6grFiY3uNmLW/YPWJsJMXC8rvs0AAslSjCVLR2ssp4ZQmF0u7TpJ48cmg+WUOBWZkdh24MSsXUQUEl7U2Mm7gTFXfl2WbSb9j2c0NlKuHQsQerjTqITtoPp2k/Lc/OY2MmlGmK3OaCfDCrs9ps3zRCy0TNxHVYUwanmWUKTpb7U+lhVJB3rasl2th6B4qW0u+0k2Tv4dS9GRCBwwaXu0GABRCOKfMlyCV6kDwTUGKGSpTOhF7cQDXFXzHQxrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ojcbZ50KSy3X54OCbVoNFOlBywiZQnvXFvB/Xg9gugo=;
 b=VZWywKDDLcozcKUZDJqqNora2s6WHfKCpJSrWWNhyRU1h3lswGQcmkX+kkIcGS5u+SY60m1Gysx+ZWsT21y9PHYP5JwFzEmM3/5J+c022VxErqL38pWPvwTunFuMq0fDCy88uXE9h+GuTnsORMkpWl30ooJ3OzTX6GdOoC0eigCh3efLSEuR7EDNNXl60VsveUXE7SHBJtyMKE6gx3u2GCI1a6CoHJafb9Z9cPEBDo07X8LpivMSlxPH7RotEp+Yu0U9qNDJk1B6M5qUcO8EnmIB7XwXgDvSMh4Pj0NYBqX2shNRSxAr62IRS6QT2qkeqGDEV60aenzYNQyrSOf4Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from AM6PR0402MB3733.eurprd04.prod.outlook.com
 (2603:10a6:209:1c::25) by AM7PR04MB6949.eurprd04.prod.outlook.com
 (2603:10a6:20b:102::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Wed, 23 Jun
 2021 15:20:14 +0000
Received: from AM6PR0402MB3733.eurprd04.prod.outlook.com
 ([fe80::4b2:3e0:ef87:9557]) by AM6PR0402MB3733.eurprd04.prod.outlook.com
 ([fe80::4b2:3e0:ef87:9557%3]) with mapi id 15.20.4242.023; Wed, 23 Jun 2021
 15:20:14 +0000
From: Al Cho <ACho@suse.com>
To: Cornelia Huck <cohuck@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>
CC: Claudio Fontana <Claudio.Fontana@suse.com>, David Hildenbrand
 <david@redhat.com>
Subject: Re: [RFC v5 06/13] target/s390x: start moving TCG-only code to tcg/
Thread-Topic: [RFC v5 06/13] target/s390x: start moving TCG-only code to tcg/
Thread-Index: AQHXZ0/xcDGcXSHzwUSgESh/v0YGrqsf59yAgAHMIY4=
Date: Wed, 23 Jun 2021 15:20:14 +0000
Message-ID: <AM6PR0402MB373322979FF634D232D54290A0089@AM6PR0402MB3733.eurprd04.prod.outlook.com>
References: <20210622101726.20860-1-acho@suse.com>
 <20210622101726.20860-7-acho@suse.com>,<87czsenn6e.fsf@redhat.com>
In-Reply-To: <87czsenn6e.fsf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=suse.com;
x-originating-ip: [1.169.30.211]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ae0a97a0-c431-4946-5175-08d9365a6677
x-ms-traffictypediagnostic: AM7PR04MB6949:
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB694925C6D86F33A972DFEF02A0089@AM7PR04MB6949.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nSVu47sxTzINpW+wzotSU6l3kzgk5oXRKRyMr23lP+57sg6mEPySzDJg7X0h20Zqq6WGyGCtaCJ7+Fi9IOkATveDExHJyULTm60QJVlOhaaBAD6b7Pwq7HUHt5PL0cUZIxkSl256gpwT+uZLVm1+s06SxdWy4lxGDHBo+hOQBSNrnds1hGzMQukPvJc8Fabz/RHMLanqcI7ut66xvyeJmTFkoR2CwraN11zC2A3A/CA+IDBMO8MqBhdz7TOBaNqRWUJBC4Abd7BbZzyZOSaIlXY109dyemXHlqHCtdxYtTFLv4m+96Dof4qn9wJrFqgFifrnF7z/6zSU3nMtosVMeoLASs8CqzMu3JeYSSJTeYyyWttSMODy56bgusolWJ37Ddqgct/Hbqiu+pOFGv3dty/tZzNUhbfaejCeu0Lvj+509+tvYg7m/bfo8FRrqDJXpgAJYju7W5faZxWzdbG5hZeh4ediNGmP7GrHjWJ4+oJ32SLlqGF40lypgFIQyNg/msgcA49UQLBkEX5tSoLdBK4+OqwXXAjxk/QSFd5zP1q3Ub/8asRcTWMq2guNATyiHrNSRS9Vz9eDARDOQ5yo4qJAo+h9fdF41H/1GWbvPRk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR0402MB3733.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(366004)(39850400004)(136003)(396003)(478600001)(2906002)(19627405001)(53546011)(26005)(52536014)(7696005)(6506007)(71200400001)(66946007)(8936002)(186003)(76116006)(91956017)(55016002)(8676002)(9686003)(4326008)(38100700002)(86362001)(33656002)(66446008)(83380400001)(122000001)(316002)(5660300002)(64756008)(54906003)(66556008)(66476007)(110136005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OkNFKIeR6hOU26ybSL2p6KwhGyhjtZGO199O6fQH1N2OlZyuH79sQZgZxdH/?=
 =?us-ascii?Q?V8avYBQT9IblxBB9TFtSHVByN+XB0afqNzvpp5a819/a/81yx8y0NjKYU9lw?=
 =?us-ascii?Q?0s7T+qycqPzBprckG9dLGqiTgShgSJ22Bi5d5GuvlQzE0ojlqFYGuMxZyP4X?=
 =?us-ascii?Q?aHYnDuMk6rxzj7wmaHGroobIENadWLaKMlNhOoyVK62delKCQhVCv5SGTY3c?=
 =?us-ascii?Q?bnWLIXVB3zg+D5RYB7iNi03NeDTOeWVHO8wGY0fOgmxlzY+7r9KMrqe1sAxR?=
 =?us-ascii?Q?Jd5QwBWLjM0327sVba4mKB9OxDkaTfpfZFU9LS1LKdi3KhaBjkVu40yrexXz?=
 =?us-ascii?Q?JuOBMs4okSOf0TrZIfFNvytXxfOO+Bi6L3G/PC499s88F+B0RHkIjrtM+Who?=
 =?us-ascii?Q?pxtiG/GVn5PKjN55gWTT9H1BqoFyR4yIz++upUjqCc9OKGTnDYgKorKGQmmh?=
 =?us-ascii?Q?4lOVN39R45oHJgXa26BJlmY0KoExGyAsvay+vcrSPbwQoTBa1D5VTmBGrPjN?=
 =?us-ascii?Q?L51UzdNXsIn2/BLAnLkSURdrkiBcr3YzIfJswThuPvGj8KfwzMNqDfQGAAis?=
 =?us-ascii?Q?W7wBdUOPT+4SLVUzzB6ZpbgdRzyqHaJeBxSbRbBLbHbnJcPO/P4OEOqVjPJe?=
 =?us-ascii?Q?HQooDoCfVtLwLa2Gx5SHyr6ouYS5JA70BxtIu048/eAzlXSohghG1On+0NH+?=
 =?us-ascii?Q?trMZqEdqDdmgLGUJwbCDWgwgRfobsrAh+MEcnHWMk3AMCbhvjhVkB7zOxNa/?=
 =?us-ascii?Q?4y0OekGf4rO5r8P5251FxBIoJG0iIieWstM+Rc971Y+nhLbjz0U/T7VZcjYS?=
 =?us-ascii?Q?HYvu2W2nxXScJrxSfVzn7bSleLwOdKh65ZKRMSYsES0OaOCGxDBzoX0s8EJ0?=
 =?us-ascii?Q?ywL4mYwz4BtKj8nXd2fxjzKGU9W6H9UtKRn22n9PD4IEfJlhXlyUBJyENbgi?=
 =?us-ascii?Q?POtBKUHMc8DTSqu96QDOfAng28DUEW9wRLrtIZVf8fLCcwibxpBhmmsWA75J?=
 =?us-ascii?Q?PJCsgudfoVqDRlu6lFXkLGD8P2DMt/uF4DZx5o+HaEHl3je9x/B54CO3m1Ej?=
 =?us-ascii?Q?Q6Z5+5SxzTX4976NFY9Rw9eBfUNBZvYYf70OYJDZ4WwMWfTzixIJ15GH+qY8?=
 =?us-ascii?Q?AUA4tanwAp9SQSSQ596qQPojljRTXQ2bT1smHdDWNcB4rsdkS708DqtuzaFt?=
 =?us-ascii?Q?531fzB0uRfV9wnik2t9XH7VolD7w+23WPROULFyl9DaBkkZTRdYV1VzU5L/Q?=
 =?us-ascii?Q?x73OcP42IksMG2CYvpkjFFrwM6YEMfWX23N9BYGt8LXXh8+U9+cw/JqTaDeW?=
 =?us-ascii?Q?xG8=3D?=
Content-Type: multipart/alternative;
 boundary="_000_AM6PR0402MB373322979FF634D232D54290A0089AM6PR0402MB3733_"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR0402MB3733.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae0a97a0-c431-4946-5175-08d9365a6677
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2021 15:20:14.2708 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 81s0XB1dS+HYWQwjzlvlt6qk6sfSU0fVjuKyEdLBdgQwabNQMgp5JhtAE+EyBRU2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6949
Received-SPF: pass client-ip=194.104.111.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--_000_AM6PR0402MB373322979FF634D232D54290A0089AM6PR0402MB3733_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes, you are right.
I think keep the old pattern is better.
________________________________
From: Cornelia Huck <cohuck@redhat.com>
Sent: Tuesday, June 22, 2021 7:39 PM
To: Al Cho <ACho@suse.com>; qemu-devel@nongnu.org <qemu-devel@nongnu.org>; =
qemu-s390x@nongnu.org <qemu-s390x@nongnu.org>
Cc: Claudio Fontana <Claudio.Fontana@suse.com>; Al Cho <ACho@suse.com>; Cla=
udio Fontana <cfontana@suse.de>; David Hildenbrand <david@redhat.com>
Subject: Re: [RFC v5 06/13] target/s390x: start moving TCG-only code to tcg=
/

On Tue, Jun 22 2021, "Cho, Yu-Chen" <acho@suse.com> wrote:

> move everything related to translate, as well as HELPER code in tcg/
>
> mmu_helper.c stays put for now, as it contains both TCG and KVM code.
>
> The internal.h file is renamed to s390x-internal.h, because of the
> risk of collision with other files with the same name.
>
> After the reshuffling, update MAINTAINERS accordingly.
> Make use of the new directory:
>
> target/s390x/tcg/

(...)

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 636bf2f536..d05dcc22e0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -294,7 +294,7 @@ S390 TCG CPUs
>  M: Richard Henderson <richard.henderson@linaro.org>
>  M: David Hildenbrand <david@redhat.com>
>  S: Maintained
> -F: target/s390x/
> +F: target/s390x/tcg
>  F: hw/s390x/
>  F: disas/s390.c
>  F: tests/tcg/s390x/

This means that the pattern for tcg won't cover those files anymore that
are relevant for both tcg and kvm (e.g. cpu models). Maybe those files
need to be enumerated? Or keep the old pattern?


--_000_AM6PR0402MB373322979FF634D232D54290A0089AM6PR0402MB3733_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Yes, you are right.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I think keep the old pattern is better.<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Cornelia Huck &lt;coh=
uck@redhat.com&gt;<br>
<b>Sent:</b> Tuesday, June 22, 2021 7:39 PM<br>
<b>To:</b> Al Cho &lt;ACho@suse.com&gt;; qemu-devel@nongnu.org &lt;qemu-dev=
el@nongnu.org&gt;; qemu-s390x@nongnu.org &lt;qemu-s390x@nongnu.org&gt;<br>
<b>Cc:</b> Claudio Fontana &lt;Claudio.Fontana@suse.com&gt;; Al Cho &lt;ACh=
o@suse.com&gt;; Claudio Fontana &lt;cfontana@suse.de&gt;; David Hildenbrand=
 &lt;david@redhat.com&gt;<br>
<b>Subject:</b> Re: [RFC v5 06/13] target/s390x: start moving TCG-only code=
 to tcg/</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Tue, Jun 22 2021, &quot;Cho, Yu-Chen&quot; &lt;=
acho@suse.com&gt; wrote:<br>
<br>
&gt; move everything related to translate, as well as HELPER code in tcg/<b=
r>
&gt;<br>
&gt; mmu_helper.c stays put for now, as it contains both TCG and KVM code.<=
br>
&gt;<br>
&gt; The internal.h file is renamed to s390x-internal.h, because of the<br>
&gt; risk of collision with other files with the same name.<br>
&gt;<br>
&gt; After the reshuffling, update MAINTAINERS accordingly.<br>
&gt; Make use of the new directory:<br>
&gt;<br>
&gt; target/s390x/tcg/<br>
<br>
(...)<br>
<br>
&gt; diff --git a/MAINTAINERS b/MAINTAINERS<br>
&gt; index 636bf2f536..d05dcc22e0 100644<br>
&gt; --- a/MAINTAINERS<br>
&gt; +++ b/MAINTAINERS<br>
&gt; @@ -294,7 +294,7 @@ S390 TCG CPUs<br>
&gt;&nbsp; M: Richard Henderson &lt;richard.henderson@linaro.org&gt;<br>
&gt;&nbsp; M: David Hildenbrand &lt;david@redhat.com&gt;<br>
&gt;&nbsp; S: Maintained<br>
&gt; -F: target/s390x/<br>
&gt; +F: target/s390x/tcg<br>
&gt;&nbsp; F: hw/s390x/<br>
&gt;&nbsp; F: disas/s390.c<br>
&gt;&nbsp; F: tests/tcg/s390x/<br>
<br>
This means that the pattern for tcg won't cover those files anymore that<br=
>
are relevant for both tcg and kvm (e.g. cpu models). Maybe those files<br>
need to be enumerated? Or keep the old pattern?<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_AM6PR0402MB373322979FF634D232D54290A0089AM6PR0402MB3733_--



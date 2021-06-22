Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8670D3B075C
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 16:26:27 +0200 (CEST)
Received: from localhost ([::1]:32926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvhMA-0006Ua-IH
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 10:26:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lvhL4-0005mV-6p
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 10:25:18 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:56281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lvhL1-0002pv-91
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 10:25:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1624371913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WqFqGx3HL6tKDw3tOobwkuzu46F0fPAJWd0h9nRMIGI=;
 b=Ws8Zr3Ai1Ma2ihaANYxGgkBRJo1R8rWEPLZGq4pNXyyGfD5jClbxY+Z4tCt9wl2+myghbt
 HugEwLr5+fd/Abd9UUqbBMGM3ykOiOhkZkZ48PqHspMqy3vX6UxZx/h82UoZuai6UqJv8g
 FdN5/q7hkawaT+A66sn0aG5pJKJWC+E=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-s1CGybPRM9mqfaMo37iVvA-2; Tue, 22 Jun 2021 16:25:12 +0200
X-MC-Unique: s1CGybPRM9mqfaMo37iVvA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lbOGBBXtZF4to3Mr4LWp+pDO2JQiiLIWFjXydOCypBtnjIRxOTKL9BZEB6BNf5z2qQiAcliZazj2nhgBKT1FSmip+tM528SaU1a37P4ezYvHJZrLjfAUWXkTw+StrtJWprIUPguxBnOhg0X9LuSDsMChSQ7UAlifJFeJFKf0A8HlXwhOXHizVEKxWnQ3Ov9MM2MaQs8TfO6LlHXGZ6BOAfQZO10lk27YOV69wm1+vkOn1VffN6lq9bdwuQnyDJbMN/2TjD38+CJHnWNSIx6zFJKKfpwI/vwfc35UGGSo0HF+qEW0WGRFOSemIePEgk+1PE0owr3J+rfgMGU2AGYegQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqFqGx3HL6tKDw3tOobwkuzu46F0fPAJWd0h9nRMIGI=;
 b=cgYGasDJk/oojjOMoXhcqLR/bogToqr6i9MhAcb68MMLqJ7l208MRbJiKrwrM/zmnuO9+UI8s9GSl6yTTpc56IwZKM+yjAKNKLHwjNLMfzECxU3ZkcHXx7DbTsmpetgR8ZQ5u6ZX3Qd/IMyhECVxFgrM8fpw2N0s2WWYBfV09KMDcRKH3hkWBu+9ck2cGAPQ95qRaEbUPDWV3DTCnDMhUjfDSKrOx5SDs9zNT4dxi12T2juqigAB5hvPL3THq5izE9q9MNZn/rBw/oVjV15HX8Sgo08sGmwQd0LXO7FfJph9+Ty49LHevHuZNrflp4gyGzVnaz0ALoKNvjlyiHi+DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB6319.eurprd04.prod.outlook.com
 (2603:10a6:803:f5::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.22; Tue, 22 Jun
 2021 14:25:07 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::28dc:6111:d2dd:4777]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::28dc:6111:d2dd:4777%3]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 14:25:07 +0000
From: Al Cho <ACho@suse.com>
To: Cornelia Huck <cohuck@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>
CC: Claudio Fontana <Claudio.Fontana@suse.com>
Subject: Re: [RFC v5 09/13] target/s390x: make helper.c sysemu-only
Thread-Topic: [RFC v5 09/13] target/s390x: make helper.c sysemu-only
Thread-Index: AQHXZ0/8V4AtPUsDkUWbElf6hG59o6sf6LYAgAAq+h4=
Date: Tue, 22 Jun 2021 14:25:07 +0000
Message-ID: <VI1PR0402MB3744FB77876CACA6EADDE4BAA0099@VI1PR0402MB3744.eurprd04.prod.outlook.com>
References: <20210622101726.20860-1-acho@suse.com>
 <20210622101726.20860-10-acho@suse.com>,<87a6ninn1b.fsf@redhat.com>
In-Reply-To: <87a6ninn1b.fsf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=suse.com;
x-originating-ip: [1.169.30.211]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 357af9e5-6262-4b00-6cc9-08d9358988cd
x-ms-traffictypediagnostic: VI1PR04MB6319:
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB63196F94A5B8B990F1A6686DA0099@VI1PR04MB6319.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1417;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EEaUQ0zTIwfCA4gnV/t8xfnqX0cjVDed0W5PDSFC/3NCg+u9r99X3xxAqKTgsRSXaYBEJiORbclK5teHBjzfzJEQWRZzaaursUtR1jKrpst2ZjrUKkbrHzdtx3zMtbBEae74i2EF1OEkh6o8zoqFSCPmv7ZCjEaiJp4Fr9mcBEkU2zwsktNN1aEjlFXXkCvTIDN/pRdNr+QipMW9o18Xwjqojuw9CQYBGNYY06iG8KswWpeq7gLJRxIeEqdjAeptuHiZVjlS9uKzbdvl/v0A3c1nSWZPMF6TysmP9+DNrduq9fCvSvWbUsGmLztjoXRdH2mLXEtif6dI+EEyqOWEUmHMjtx7JfqjAca/0ITJqeilhnVIXDYgO1Ult3ryOxpdEZUAP33zm2x9v4ZiQlVU3Nc6Uc/7A+4yuR7IacZAfNnvq+ajrqZdpMr3N/75wbK82KK7UwYmiLl6SoufAXBZ0ZraW1dwMB48wmLK+LdTtvwJB14RENqewY5Ub5qRx+HugkzCjpgYC3g/mIIVMOwyTkfzU8We1jHdAKsaqedZroMfJkD8iWnm50kc9JHXjEP0ohawFjPMzSFT4a3ByhyAhdkLqBbJYwpT/uch1gR3LW4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39850400004)(136003)(376002)(346002)(366004)(396003)(2906002)(19627405001)(86362001)(8936002)(110136005)(7696005)(26005)(38100700002)(316002)(186003)(53546011)(4326008)(8676002)(55016002)(122000001)(64756008)(6506007)(33656002)(9686003)(107886003)(478600001)(5660300002)(66446008)(83380400001)(66476007)(66556008)(91956017)(76116006)(71200400001)(52536014)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YRFh/NP+bLNuFUKK4MtI/aeo12OUBj/bFABPetpUmEEBLJKNQ+Z3vBE4YuIA?=
 =?us-ascii?Q?8EvLtiJAum+0AO2sOgH510dGWSshQr1PpNFP8UrIyH4CUTbqanhR2tA/+I8A?=
 =?us-ascii?Q?Ghhf9zNwwHND4YnnAqhPnKeqkNJlDNMrb4lgOa6aC+MhrFbICp0Ts5MTncZT?=
 =?us-ascii?Q?408RzH+8mI+qNkEVbollNaK1nV+THk434/I3lBHOjvJqCofOh4+XGUqb4u1o?=
 =?us-ascii?Q?9vLnVy5RaqqnNBr5HW779mheWbulZKNtaLzC1Pn1iVogVU8DUH83oNr7hcZf?=
 =?us-ascii?Q?nm8TN+r9/cLjY07DiXN3FHvcEKTyQ5AWW1s4QawaZ4ENDet+6JIj2gQaFQYv?=
 =?us-ascii?Q?/ReSNOo6ONWic5FMYmL6UIDlCouvRyk0KkDoQi+2MxHZ5l/aWe6uFbTYtM9q?=
 =?us-ascii?Q?ykLJRq8c6O8UsGbhQBc5adtmr4Tq0D0ZsFNrD9XpzgX9OnHh4Rjj4fVR9AU3?=
 =?us-ascii?Q?6QbyXL60ZmcvOsCTZtQ1+Fr9R/C9qz03hUqtz8sbtGCilicXVOUrKRFcBVdf?=
 =?us-ascii?Q?Lq3X1L2lhrWQPlQ6oejBxlNGZnsm5nx2TWZ0F/yIhtlUs13/fE8bjNTMuanF?=
 =?us-ascii?Q?p63Ho6QysPcRlN7mrTQHiVyr+j1Ose4s0fsoUKuakjXoaPzwh7tIbuh/b1Iq?=
 =?us-ascii?Q?726ZOTz1lAAhzxegjfnQfh76ZIxMMxLDLlzqK1PnEyKnuu1/N84k6M8Vb+y4?=
 =?us-ascii?Q?tdXM0gtqqcdtMVVb2UqZAUi6EZ/cWwiQrZsQP59Oa/chJcTWp7dTnzplgtz1?=
 =?us-ascii?Q?cGW3ClZu7vWO9cNWFeSOVxeMDQc/i4veEF5RltAIKlfQb2nQihNN0O3vS03V?=
 =?us-ascii?Q?ABLj4KMCJF1NLfiVIHF5DIbPpEUogNnuN1NJGNTyelHDSzMAiPQHF8NfpH8H?=
 =?us-ascii?Q?I8vKuuCvDQIh4d4YT02BSig1UHLXH4zYD80dX5JoJ6HISZP/YCI51A0L1xvi?=
 =?us-ascii?Q?4DL2GOQ9z7YQrC8nUC3XZoTVLORCanw/4Z98h1Dc+SLpd/E18o5L3Dmo4038?=
 =?us-ascii?Q?kixmE3TAWn9wo39cY7YtgqFmvgaOYMO1SFBjoho3YxIwP2EsycXU8/czyzqG?=
 =?us-ascii?Q?GQRfUkEAqZTEGgwQOJPe0h7/1TNkRP60jRHaE8QPVILdgN1dNoloC/FBdn6F?=
 =?us-ascii?Q?wdQlKmAhhpaHb/KS7jCjfAM4WdmFPAjnS8fWVCSumPaYocq2mma3PD8SxjDN?=
 =?us-ascii?Q?b0uQg1zTAfKDoQsOaYVHx4m+vmDHxwSdSVE0HUI/IZC+RvkzPIe+/oLiwIBa?=
 =?us-ascii?Q?xzqSvUaAr/O1+jARpr8AL0j/oJWJe5qORWpJrK2thIGwUlPWWprbM0mZZCP+?=
 =?us-ascii?Q?PQI=3D?=
Content-Type: multipart/alternative;
 boundary="_000_VI1PR0402MB3744FB77876CACA6EADDE4BAA0099VI1PR0402MB3744_"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 357af9e5-6262-4b00-6cc9-08d9358988cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2021 14:25:07.0702 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ER95gsClHT4oFcmX5RFnbYZ7Ea5lZTcn1rl/yjTwm6gn1m2IVePzmTSOOUNs2UHV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6319
Received-SPF: pass client-ip=194.104.111.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

--_000_VI1PR0402MB3744FB77876CACA6EADDE4BAA0099VI1PR0402MB3744_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes, it should be "sysemu", it's a typo.
________________________________
From: Cornelia Huck <cohuck@redhat.com>
Sent: Tuesday, June 22, 2021 7:42 PM
To: Al Cho <ACho@suse.com>; qemu-devel@nongnu.org <qemu-devel@nongnu.org>; =
qemu-s390x@nongnu.org <qemu-s390x@nongnu.org>
Cc: Claudio Fontana <Claudio.Fontana@suse.com>; Al Cho <ACho@suse.com>; Cla=
udio Fontana <cfontana@suse.de>
Subject: Re: [RFC v5 09/13] target/s390x: make helper.c sysemu-only

On Tue, Jun 22 2021, "Cho, Yu-Chen" <acho@suse.com> wrote:

> Now that we have moved cpu-dump functionality out of helper.c,
> we can make the module sysemu-only.
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Cho, Yu-Chen <acho@suse.com>
> Acked-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  target/s390x/helper.c    | 6 +-----
>  target/s390x/meson.build | 2 +-
>  2 files changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/target/s390x/helper.c b/target/s390x/helper.c
> index 41ccc83d11..b9d18325bc 100644
> --- a/target/s390x/helper.c
> +++ b/target/s390x/helper.c
> @@ -1,5 +1,5 @@
>  /*
> - *  S/390 helpers
> + *  S/390 helpers - systemu only

Typo -- you probably meant "sysemu"? (Although I'd probably spell it out
as "system emulation".)

>   *
>   *  Copyright (c) 2009 Ulrich Hecht
>   *  Copyright (c) 2011 Alexander Graf


--_000_VI1PR0402MB3744FB77876CACA6EADDE4BAA0099VI1PR0402MB3744_
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
Yes, it should&nbsp;be &quot;<font size=3D"2"><span style=3D"font-size:11pt=
">sysemu</span></font>&quot;, it's a typo.</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Cornelia Huck &lt;coh=
uck@redhat.com&gt;<br>
<b>Sent:</b> Tuesday, June 22, 2021 7:42 PM<br>
<b>To:</b> Al Cho &lt;ACho@suse.com&gt;; qemu-devel@nongnu.org &lt;qemu-dev=
el@nongnu.org&gt;; qemu-s390x@nongnu.org &lt;qemu-s390x@nongnu.org&gt;<br>
<b>Cc:</b> Claudio Fontana &lt;Claudio.Fontana@suse.com&gt;; Al Cho &lt;ACh=
o@suse.com&gt;; Claudio Fontana &lt;cfontana@suse.de&gt;<br>
<b>Subject:</b> Re: [RFC v5 09/13] target/s390x: make helper.c sysemu-only<=
/font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Tue, Jun 22 2021, &quot;Cho, Yu-Chen&quot; &lt;=
acho@suse.com&gt; wrote:<br>
<br>
&gt; Now that we have moved cpu-dump functionality out of helper.c,<br>
&gt; we can make the module sysemu-only.<br>
&gt;<br>
&gt; Signed-off-by: Claudio Fontana &lt;cfontana@suse.de&gt;<br>
&gt; Signed-off-by: Cho, Yu-Chen &lt;acho@suse.com&gt;<br>
&gt; Acked-by: Cornelia Huck &lt;cohuck@redhat.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; target/s390x/helper.c&nbsp;&nbsp;&nbsp; | 6 +-----<br>
&gt;&nbsp; target/s390x/meson.build | 2 +-<br>
&gt;&nbsp; 2 files changed, 2 insertions(+), 6 deletions(-)<br>
&gt;<br>
&gt; diff --git a/target/s390x/helper.c b/target/s390x/helper.c<br>
&gt; index 41ccc83d11..b9d18325bc 100644<br>
&gt; --- a/target/s390x/helper.c<br>
&gt; +++ b/target/s390x/helper.c<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt;&nbsp; /*<br>
&gt; - *&nbsp; S/390 helpers<br>
&gt; + *&nbsp; S/390 helpers - systemu only<br>
<br>
Typo -- you probably meant &quot;sysemu&quot;? (Although I'd probably spell=
 it out<br>
as &quot;system emulation&quot;.)<br>
<br>
&gt;&nbsp;&nbsp; *<br>
&gt;&nbsp;&nbsp; *&nbsp; Copyright (c) 2009 Ulrich Hecht<br>
&gt;&nbsp;&nbsp; *&nbsp; Copyright (c) 2011 Alexander Graf<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_VI1PR0402MB3744FB77876CACA6EADDE4BAA0099VI1PR0402MB3744_--



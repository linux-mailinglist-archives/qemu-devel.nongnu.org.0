Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BA4412699
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 21:06:11 +0200 (CEST)
Received: from localhost ([::1]:55940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSOcE-0006oV-IP
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 15:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robhenry@microsoft.com>)
 id 1mSOZJ-00050d-Il; Mon, 20 Sep 2021 15:03:09 -0400
Received: from mail-eastus2namln1005.outbound.protection.outlook.com
 ([40.93.3.5]:42384 helo=na01-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robhenry@microsoft.com>)
 id 1mSOZH-0002eT-AM; Mon, 20 Sep 2021 15:03:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oi6cgJ5sUO3Q3fA6XYW+lWyVYnrY7RgP8uvKXmUoJqXvOePbtZlKScKVIGpmKi8GqEpjM3RgDvGrZKwAHALahqjBuChACeIGqCvlVPRn86keyCQhL3XEy8wNZFILr01D4UF4EOhcnjlhyGrMiQBE7jivNWXOZiaPZDs2RigbBVHtakdutiPCEhH/yKAh7DZsjtt6e0G3pjScoo2TIEhNh77Xpzm9PJvDKH3qgwNPubjJGNblRlHeecdAuHZDhsKdUovy4T6SRcM9Jjei8AGMaQqCUbymIZVcIL6YGyRCmJ/JjHz2B9x1VCEy4AHCPX2v4XhdS9R2mK2ygkyA6mF2Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=ySRH/r4MVULXcts17vkOvUMfsWjGZdYSN4YM82ztt08=;
 b=hMl1wMt9a63cx7v0ygJWba0K7BhmcIGXKZvAoNqbWDZvWi2ZtH301/IE6VmTgsMX3jyvOUIElP35RiSTXeeb+LzApDaRpDeuHcqLMvrLHLKM+pNpvknrOVZJ+zohCzrGld+Gm+u9FfCuBapoSwUG1I9J44fyrSQO3Rb85RreT/IrOy91YkwmH7eFB/uSyjveDx9d8tdD96FVpYb06imcJcneI30d5fVq+Ut/rhV4Tatir5uhQCHGqyK9lwwo0kfelouZRjlX6RV8uUjloSDFjug2+D+c+rUGLHUWyGFdU8szFHtRqwn+28q7wZMk3hT088nfO1MPDjKUZdqngV+HTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ySRH/r4MVULXcts17vkOvUMfsWjGZdYSN4YM82ztt08=;
 b=QbqVoFyb0ahU6xgMUrCziMLpE7xWmGz5AmVTk4TR1qwnnDoKHI3IUXdzbnIy01wesLffdJEt9ZOKPj/l4d7FJjA9QhZEudKdJ8qk/UAY5MqQQlAqzw0FnEAJemNjrlK+iX9VAenGrooG1TycLvFQjVhw6XTkPaUie/VBR6V7EK8=
Received: from MWHPR2101MB0811.namprd21.prod.outlook.com
 (2603:10b6:301:7b::39) by MW2PR2101MB0891.namprd21.prod.outlook.com
 (2603:10b6:302:10::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.6; Mon, 20 Sep
 2021 19:03:02 +0000
Received: from MWHPR2101MB0811.namprd21.prod.outlook.com
 ([fe80::941:c1eb:8006:bb76]) by MWHPR2101MB0811.namprd21.prod.outlook.com
 ([fe80::941:c1eb:8006:bb76%3]) with mapi id 15.20.4544.003; Mon, 20 Sep 2021
 19:03:02 +0000
From: Robert Henry <robhenry@microsoft.com>
To: =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>, rrh.henry
 <rrh.henry@gmail.com>, "qemu-discuss@nongnu.org" <qemu-discuss@nongnu.org>
CC: =?iso-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>, qemu-devel
 <qemu-devel@nongnu.org>
Subject: Re: [EXTERNAL] Re: Range of vcpu_index to plugin callbacks
Thread-Topic: [EXTERNAL] Re: Range of vcpu_index to plugin callbacks
Thread-Index: AQHXrX9t9AHLkYw/1U21gicy3MpcB6utSNVY
Date: Mon, 20 Sep 2021 19:03:02 +0000
Message-ID: <MWHPR2101MB0811A89D36BB3E0A0A91EA74D6A09@MWHPR2101MB0811.namprd21.prod.outlook.com>
References: <CAEYr_8=uH3=BGbVQrbjijoE5xB7jRch=35hjD0g0v91u_cXUog@mail.gmail.com>
 <6ab9eb4d-5835-df61-b27f-932af7e64889@amsat.org>
In-Reply-To: <6ab9eb4d-5835-df61-b27f-932af7e64889@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2021-09-20T19:03:01.382Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c410ea2b-6bd8-483e-13cc-08d97c694571
x-ms-traffictypediagnostic: MW2PR2101MB0891:
x-ld-processed: 72f988bf-86f1-41af-91ab-2d7cd011db47,ExtAddr
x-microsoft-antispam-prvs: <MW2PR2101MB0891B4A81D697C615AEAA44DD6A09@MW2PR2101MB0891.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pKUHj56bGtFIEBESuJ0RKf40//AtDQGmS0eLkTwajZAKHVO5/ULF9elIzX9H4pCRW5v/lYWuRgl+rNnU6/3qADFg/Ne4wRKrxM6qNDTUq6iq5qpiT1tKkACOkWxK1FM1Q2MH/HA6vp3MYN7bi1WQBymoxJIemmhd99lGwsZsGDAd11JpM919BxDjXlo6ZKmrbtUikYiT7qcVhm73cR3QvTSZdKYOMw3mh3Wcm8eik+hDNlLgZ2WsjF8cIYhks/gUHll6po5DB0yjvwIbdnOUR5YAo4ZNHm/prZGdPb23I3Bdl9yJhS7IRuDOtS+htq5SJeHO10PpRpi/kSlmFB9jvK2M3gKN3PZWvpN2iQOlO1hI7RJYiKtgNuJvSwHvk0WYz5A9YTEZFoRtxkBkrHiwI0hn7odmoNlCY7usccLjzxsrZUXNVitTlrcqzqL9IaasPvtOgnFj9MRN6WAeD2787DCsT+v5XXXI/vPaMxPXAUgQxyNEHgyRhqNRoU3YS0fiF8CYYAIVt5E8Y4EHR1cslJ5FOSLR5qUzvFA5vNaeC52IYphutzeO2Y7YgBZWcEYEPnZtruC6HWlyK9DSVVTWz11wTfsCJ5WRBZ0sO80SMKsRUH+1ArDDh5qOKIMDw7Gmb1Vyuegm0lmckZjto5Wwgz6BL2jTTJuUydgjHmZGbC/1BG7dBixVvk78Tu1ixhGxDPs/SsZ25W2u7Oi5hYMb4g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR2101MB0811.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(4326008)(52536014)(76116006)(66946007)(66556008)(64756008)(186003)(5660300002)(33656002)(38070700005)(54906003)(19627405001)(55016002)(8990500004)(38100700002)(71200400001)(508600001)(110136005)(53546011)(6506007)(8676002)(26005)(82950400001)(66574015)(82960400001)(9686003)(8936002)(122000001)(86362001)(10290500003)(316002)(66476007)(66446008)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?+0VpZdOhtyL1JM/SosxsWZTU1/ztHxKJuXxOLitIzZYjCQo9siykR1O0Nk?=
 =?iso-8859-1?Q?zMU2qu3codZiMU59AedRMk4Avp8491p+Em0zLoTEFkTvV/+JZKZDqdkSju?=
 =?iso-8859-1?Q?BrdOtTVaEfLBJD1WntODXsJKNNdvi5QguxIjQxtwJEhzJVzTCR2x5q2fm1?=
 =?iso-8859-1?Q?r9gaKQLIY4ILMiwJMPfCj3j4AhW8LD0OCLR/OzsaXUMLhM8D9BZ1sWQkKZ?=
 =?iso-8859-1?Q?pPis/8lCND4YqD56q4ehdDwqMtPfuD+5j8o9/pU/yK5r9p+u3R7jYubloL?=
 =?iso-8859-1?Q?V+6T3ESt4yJpcL143p3Bh0lk4tosCz2OfFWX5RKIv+OrPWZPuaZYkVuMIU?=
 =?iso-8859-1?Q?pvcRkazmO/k112USJRxKVOnTu7+org0tiTV7PI3yU6t23V+qll5V4+5YU0?=
 =?iso-8859-1?Q?Opz49upJZGIY1Tf8gP1pGqgqweLQmI2DoCQvBPSDJnQPMjgX20GvzYZYiQ?=
 =?iso-8859-1?Q?+Crw+2Da5pzq0tun18OoiuBM2ITsd/9UkrWb+X6h7xDN9HKe6LTE4aJeAg?=
 =?iso-8859-1?Q?SKAvarMd6tKNPx1/JvI8l96NSg8/b5UH0arf+SPfdpZVOblN7ZJHTwePzK?=
 =?iso-8859-1?Q?O8zY8ePjPBmPlfGeTnRjIUIL2w7NwsPYOpnyjZevPKXDA13wB82pOGHJjA?=
 =?iso-8859-1?Q?bD3dDGdB/GcLcfFmYzdFqU1odsdnn2k3d++P0L0DPPK0B2nDHglx+qsuYp?=
 =?iso-8859-1?Q?RWxxilTrGRdmCtcyA9UBtbLe58ga24lN04wLAvkdYR4wskA6YHDGIIFUPX?=
 =?iso-8859-1?Q?D9Fb0xWvsTcdywUmm4KK1xsVIsAhcpllO03NAene3lstn1jT+2vHOc9erm?=
 =?iso-8859-1?Q?cjrSourfnErmdri37cpuLeSkYwkPDVutB+1WVWy4lmDQOaortFL3Hm3KGI?=
 =?iso-8859-1?Q?diRU+KqSC19ExAW/5gtI4hYH3Dq07lqNmvVxNJjqXEitZyJRioEpBmT7Dh?=
 =?iso-8859-1?Q?4WJFiYghn+dAwvm7mobwdKOkp58Ki2FFC4bZqHYVi0WSn13Qws8Q/gy4YY?=
 =?iso-8859-1?Q?dC5dXwk78OBeQAJtu/5OmeAiBB6nX2fQQPCg/kZxXrLmmDGx2k9dfyWs5w?=
 =?iso-8859-1?Q?DNvTcLvqIHduqssKMmPzRYv9Wtbc7pcpAIVoH+sYjVGEbJ81V7jFwiVL8s?=
 =?iso-8859-1?Q?c3Vfbb8VKFvVeiaRsStLnG2oMa23PxahlMN1mlHn/m5BOBtsxFXAmrGfC+?=
 =?iso-8859-1?Q?9zZi62jCpKeebafzYI0+4oB/W9JvS/OUsUDB+j8luIt4Btt9rX5pc/9895?=
 =?iso-8859-1?Q?7Vc7y7TXuUYzXobUo92SrhrESFLCiC6qldjdgn7SPaZUQ86jqwxwfOHJ+h?=
 =?iso-8859-1?Q?GLcGdSldm/99qGDHi2XeI4V8UU44y2pfUYiw2FxczDANUec=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_MWHPR2101MB0811A89D36BB3E0A0A91EA74D6A09MWHPR2101MB0811_"
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR2101MB0811.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c410ea2b-6bd8-483e-13cc-08d97c694571
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2021 19:03:02.6865 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yFjGShftGhtNmyxrzE/cE5lpV1VwwmPcbFMhv1Xl5HDiiOJQUL+PgXxiIXdaAGR5aL8J5+hZ6ihNJkefumjSoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR2101MB0891
Received-SPF: pass client-ip=40.93.3.5; envelope-from=robhenry@microsoft.com;
 helo=na01-obe.outbound.protection.outlook.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--_000_MWHPR2101MB0811A89D36BB3E0A0A91EA74D6A09MWHPR2101MB0811_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Yes, the value of the cpu_index seems to track the number of clone() syscal=
ls.  (I did strace the process, but forgot to look for clone() syscalls... =
I still have vfork()/execve() on the brain.)
________________________________
From: Qemu-discuss <qemu-discuss-bounces+robhenry=3Dmicrosoft.com@nongnu.or=
g> on behalf of Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
Sent: Sunday, September 19, 2021 10:54 AM
To: rrh.henry <rrh.henry@gmail.com>; qemu-discuss@nongnu.org <qemu-discuss@=
nongnu.org>
Cc: Alex Benn=E9e <alex.bennee@linaro.org>; qemu-devel <qemu-devel@nongnu.o=
rg>
Subject: [EXTERNAL] Re: Range of vcpu_index to plugin callbacks

(Cc'ing qemu-devel@ mailing list since this is a development question).

On 9/19/21 19:44, Robert Henry wrote:
> What is the range of the values for vcpu_index given to callbacks, such a=
s:
>
> typedef void (*qemu_plugin_vcpu_udata_cb_t)(unsigned int vcpu_index,
> void *userdata);
>
> Empirically, when QEMU is in system mode, the maximum vcpu_index is 1
> less than the -smp cpus=3D$(NCPUS) value.
>
> Empirically, when QEMU is in user mode, the values for vcpu_index slowly
> increase without an apparent upper bound known statically (or when the
> plugin is loaded?).

Isn't it related to clone() calls? I'd expect new threads use
a new vCPU, incrementing vcpu_index. But that is just a guess
without having looked at the code to corroborate...

Regards,

Phil.


--_000_MWHPR2101MB0811A89D36BB3E0A0A91EA74D6A09MWHPR2101MB0811_
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
Yes, the value of the cpu_index seems to track the number of clone() syscal=
ls.&nbsp; (I did strace the process, but forgot to look for clone() syscall=
s... I still have vfork()/execve() on the brain.)</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Qemu-discuss &lt;qemu=
-discuss-bounces+robhenry=3Dmicrosoft.com@nongnu.org&gt; on behalf of Phili=
ppe Mathieu-Daud=E9 &lt;f4bug@amsat.org&gt;<br>
<b>Sent:</b> Sunday, September 19, 2021 10:54 AM<br>
<b>To:</b> rrh.henry &lt;rrh.henry@gmail.com&gt;; qemu-discuss@nongnu.org &=
lt;qemu-discuss@nongnu.org&gt;<br>
<b>Cc:</b> Alex Benn=E9e &lt;alex.bennee@linaro.org&gt;; qemu-devel &lt;qem=
u-devel@nongnu.org&gt;<br>
<b>Subject:</b> [EXTERNAL] Re: Range of vcpu_index to plugin callbacks</fon=
t>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">(Cc'ing qemu-devel@ mailing list since this is a d=
evelopment question).<br>
<br>
On 9/19/21 19:44, Robert Henry wrote:<br>
&gt; What is the range of the values for vcpu_index given to callbacks, suc=
h as:<br>
&gt; <br>
&gt; typedef void (*qemu_plugin_vcpu_udata_cb_t)(unsigned int vcpu_index,<b=
r>
&gt; void *userdata);<br>
&gt; <br>
&gt; Empirically, when QEMU is in system mode, the maximum vcpu_index is 1<=
br>
&gt; less than the&nbsp;-smp cpus=3D$(NCPUS) value.<br>
&gt; <br>
&gt; Empirically, when QEMU is in user mode, the values for vcpu_index slow=
ly<br>
&gt; increase without an apparent upper bound known statically (or when the=
<br>
&gt; plugin is loaded?).<br>
<br>
Isn't it related to clone() calls? I'd expect new threads use<br>
a new vCPU, incrementing vcpu_index. But that is just a guess<br>
without having looked at the code to corroborate...<br>
<br>
Regards,<br>
<br>
Phil.<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MWHPR2101MB0811A89D36BB3E0A0A91EA74D6A09MWHPR2101MB0811_--


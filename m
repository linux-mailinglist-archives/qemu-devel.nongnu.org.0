Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0887A475AAF
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 15:32:43 +0100 (CET)
Received: from localhost ([::1]:46356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxVKk-0003Vz-4V
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 09:32:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1mxTTE-00078l-Lq
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 07:33:22 -0500
Received: from mail-eopbgr10124.outbound.protection.outlook.com
 ([40.107.1.124]:50049 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1mxTTB-00046S-E1
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 07:33:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HLtjpBneoDhDsKYttyc/CBkC5QB+gpx/xy67OU1zZKnr0aTDXXocYCe3j+WHqgRwg5RhxBwOaqXZR6zHgeEtVWQfTjuvx9qqbfY00XaRsrXjS2YH0uWjD+W+NGESveDWElXwuRSC7aRtQE3nMOupX0OH1rJSNaOnAFOY4aOIsDGy5CVQ9Pw5ocMbkpiGN7siP1KY4Za4trBxL77CV89D8rpfaCX5Xe1aGcXdivUWtYFXxtNGtECOMQPjH97wrYPqIX5KjPCMfRN8bBOmFaC+MSFYfQsNPuM0i4mMIaBd1acMWpZQ1dU7PLk3ToN0MrDsq1JSPH/iFsQdSOmuzX8GBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vOLgICutmh+8oHgd3OSXevWUXAFLn9jZfBco3M7m+Mc=;
 b=NgKEDnfwZt/bs+jv4QDud/pKDf+loFKZqk9fE4uVkVgPlonXI0FVjujQETWD8nX/EfDjW2M8MZ5tCa77USonxv0jgLRVnBF3RMAFMolcq8dA2p/5tc8ezn9ao/VoOKt+AZ31bxuh90EtYrp+6FLKT1a0eoRmbmFfNMCyBSzYUoU1dQhnkhbP2vneMcLQyHdc/f88iIwC/U46WbbkvAfMNl0mNs+R+GJdMLJURXCjI0yjdsSzRT1sXlz07BsEcmStvw/smb3Ps3+nS9uBTU6CdBTL3xkINxPNZpP0FmSFVvYZ4azSVM3BjYQZyN4WxQ/57ka2xTrXk4Kw2tY2ICpmCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=neuroblade.ai; dmarc=pass action=none
 header.from=neuroblade.ai; dkim=pass header.d=neuroblade.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NeuroBlade.onmicrosoft.com; s=selector2-NeuroBlade-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vOLgICutmh+8oHgd3OSXevWUXAFLn9jZfBco3M7m+Mc=;
 b=G6HxkuOpNfuIhDLuyHgsAgGn4iaHRP9S1t4HQ+MqaR3M/aqQBNTnsS1j+QW9CHPCBM/0hkDALPeeZPTwcS5kS5LdH5gGycAt4ogwt53kovQZhjIitbBomMUTlYJb71I12c57Xc1Kwtre6nzKOVCg0b6hLBw70U7mjk8Nd0irE/0=
Received: from PA4PR09MB4880.eurprd09.prod.outlook.com (2603:10a6:102:e0::15)
 by PR2PR09MB3017.eurprd09.prod.outlook.com (2603:10a6:101:1a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Wed, 15 Dec
 2021 12:18:16 +0000
Received: from PA4PR09MB4880.eurprd09.prod.outlook.com
 ([fe80::e5bc:be6b:e872:f996]) by PA4PR09MB4880.eurprd09.prod.outlook.com
 ([fe80::e5bc:be6b:e872:f996%7]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 12:18:16 +0000
From: Amir Gonnen <amir.gonnen@neuroblade.ai>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: RE: Building QEMU as a shared library
Thread-Topic: Building QEMU as a shared library
Thread-Index: AdfxivDZBdr179rLSragepxByLQioAADZ24AAAVR5aA=
Date: Wed, 15 Dec 2021 12:18:16 +0000
Message-ID: <PA4PR09MB48800B35FDFF21C49D45E895EB769@PA4PR09MB4880.eurprd09.prod.outlook.com>
References: <PA4PR09MB4880FF47C3A6E249E55B80E2EB769@PA4PR09MB4880.eurprd09.prod.outlook.com>
 <Ybm5VNnZDtPzku3m@stefanha-x1.localdomain>
In-Reply-To: <Ybm5VNnZDtPzku3m@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=neuroblade.ai;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 42f43d48-969e-4d9d-47d1-08d9bfc4f950
x-ms-traffictypediagnostic: PR2PR09MB3017:EE_
x-microsoft-antispam-prvs: <PR2PR09MB301707505DC46CC481103636EB769@PR2PR09MB3017.eurprd09.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7fKg7EpfQumzlEg182soqgA0Sa0KMSaeW/+RYCaHa8wxYqd3dPB9NUan8D4G/8ypGO2exdjkSPmkBEhzb8PA1HERd+vqEsUtjvX+/Cawz/bJUskK9UtP7MAO2Gb7dX243JdRgMCDQdaB1XqiDw0ITJwYPFktxnoRC77lGPX84rMi8TskVI35zrirduah7GmDFMrUezaMaTSkFqnaC5tUiVPwouv+A+YaoVSkoDmvLPokTaz5G/FFxEFf+WDxvvHd4sZd9Nnuguv3hgrBXrFsYPorml826RZtOdrmkfXgsVly3OODpbcpcnUJhQkZ5ZNlOiUDaqfKQ0fLX2fGlgb89kjstnmJSre2XQJ1SHB8uwGRtyDKnAEpERwd5XN//0TWezpCDNIWxHL8q8xcFOgwWZps+IRe5hOAEhnDhJD6qCjDhyqHJ4ql2Rj0W3PDfCES2uj+Z3F6f0WH7MznlHocPNKrPmelkXbJwvJG3Fp9eYGClCzmkH4WOR7XqUPbJD4ud7qMxsstRsJO2MfVCvCgywWu3JE9jbxX/0XxHGr8vFVJMEZ9Y4amt9CAXO62N+59Ku+lKvsWZiVrLtdh7d87D6x/TNG/trFrdWSva6V3yoSmzQSzwdMKzh4pmemH31ChDf86Bc3cMN43DhADTrzCI7vALWvKsWDnoUwVgmreEbIb8rVKxqNJ/5rO+ZnI8ZbUHk0/ciEDJ0nG3qKlTttqDPrhhaCrZgEtAtEGEzSbWBtfaO4alBXYUjTJA6jkq3tneWZkfOq3ZMzLHVUnT5l8qG57gVmxy77904iOV2k34e4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR09MB4880.eurprd09.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(39840400004)(396003)(346002)(136003)(366004)(76116006)(83380400001)(38100700002)(2906002)(122000001)(6916009)(54906003)(9686003)(44832011)(55016003)(4326008)(508600001)(5660300002)(52536014)(64756008)(66556008)(66476007)(66946007)(8936002)(316002)(33656002)(966005)(86362001)(53546011)(38070700005)(7696005)(186003)(71200400001)(66446008)(8676002)(6506007)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?N0mweOX9b+8vD2Jz8Rk38bQqOezwSYE+grfPQ/qaliAF+pQv9OpJj3LjS1Op?=
 =?us-ascii?Q?2rWVf7QnnaUtFEA8m9w0GrdZYYfrRLqLpf8PjXYOT4cZC7oWfRs3bzHzba6H?=
 =?us-ascii?Q?ctyTQ82eGKbd1jk3UnBDMHQWX2uoagkyuemyf25xs3zwY7cwCnLBX0yI+Jh2?=
 =?us-ascii?Q?KhrhAfHVANO5CSPBJ8pmzYo1yWjQQnI4R+8PXFfPefh2WWGzUn4uxspjLYN/?=
 =?us-ascii?Q?rXKkr2t4RqDajw26a5yuUj2GQtr08bzcVDEZoPwEMZP5sm/qOfYKV0Pevj6B?=
 =?us-ascii?Q?Q4eHb7YPbWTGNSXUHaQeoo5Ysdq6dZLYwKGr86ubJcd71nkuIHh6qRMANCRP?=
 =?us-ascii?Q?POI6TCdZucAcA9UrBYa746neeG65sKAUl+dpagnyt3DW7+HlGTczn6kUO/9A?=
 =?us-ascii?Q?lX4JTc7Q3slgvuaOGXsfEac3XuZnub3e6Mcjas/rw1+0kuoLzPSN83tFV6kD?=
 =?us-ascii?Q?zWsKhoYq3XV3sFauFsE62CspOXAATboUSHE/oZ2+aUckMrk8Jr5kdS6VzXTW?=
 =?us-ascii?Q?QZtkZGClfXFhGEKBrmIaslYdK7GNsxCUWGqdXgQAxjTpKOmxZ/74hzd7TVra?=
 =?us-ascii?Q?TcIV+BWg46g8dTnvYo0VAT2NtYWyR4gJscNlAM9ABF/PRgKXDfs11/JsRr0+?=
 =?us-ascii?Q?Ubf15WWfexlghHguU5h7O3qnKqWuRwD3kvKpNe1kdUzeJnHD9x0x76QoUDWP?=
 =?us-ascii?Q?CoWlWUHMCz+MBlOhTFYYXeavb1tNW6/o+jMhs6CFu830+yyZHvfyivs1Z8df?=
 =?us-ascii?Q?7pt4gTwdNR+PbWfMhqIaqGmDC4uaDHTet0Gee7UzzQGMk35jAYeZj4Wes2J5?=
 =?us-ascii?Q?Zz8PfElXY14cvjEwiw+sx3LX/vF4sEZlNfAD3P2HVd3jzu/a8vuOQgBI+zOC?=
 =?us-ascii?Q?hns3h/y7RssxB+pql65QDaTyVuKvGHSRLSDwyYo/PZHF4KvinYJXhijMFZlr?=
 =?us-ascii?Q?vOtghTIll5CyniMfTmQNG/scbTHHyvFVWC3iSMqLFaE41lcjwO1vNA8wZcY+?=
 =?us-ascii?Q?Hq8VQ3wI0gNONF2pdNyNY4JmrIVOy8wlxaudhnJUA8ji6IHE3fTgFMH23ikM?=
 =?us-ascii?Q?+wbtGXRnCxP+mLdHN0vwh2AnR6PD3ulRMYfYE/ceeC6zTGfgpky2tWMUOtZS?=
 =?us-ascii?Q?zkFF7N8GQLMKfHPz37uBnOZjCOnvvj6ZihwMKaBSn+rm6d5DQq7LoBVrRdnp?=
 =?us-ascii?Q?8xvE48UMO/Btpy+0wDYYmK++9jZIAJQI6tNekpp/+di/1c/glxlfrBOmvsLH?=
 =?us-ascii?Q?qMofDSIczkBD7H2OaH0wZY9j7CJCZLZWoIgdM01lKv0b9yHaG7ztDOq7I5AM?=
 =?us-ascii?Q?IuhwAS5es9ZECOf1zVsD4NuZnB4F7qgfrLROUrpqq7FsgYjjNgdXyoWtS15C?=
 =?us-ascii?Q?MniwB9DVSbnqOPXx3WMld6/Osxiv6Owb9qAoWkQVMrLBH4aIZ4+jtcX9IYA2?=
 =?us-ascii?Q?imehAveJTiGiOvC8yjO6bHwSbfJUTKHJ1FQmlse3GDhwObuils9Zsu75MSys?=
 =?us-ascii?Q?ciSO9wlaCNONedwwMy6PvtF0OHwSVi02VaR3SY0V639R3pnUGLJVfrtNiCbg?=
 =?us-ascii?Q?pDjcLJi5yG++497CeUds3hM/jZ0GG3eesNjO24kIa7pTd4dvduVXzTTFSfHM?=
 =?us-ascii?Q?/Ev5UQaVWZV8JipzXGQNCv0dZDU9eh5CxIogZ5sP2GIimSkgWOM+RorKuvrF?=
 =?us-ascii?Q?ief2qg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: neuroblade.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR09MB4880.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f43d48-969e-4d9d-47d1-08d9bfc4f950
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 12:18:16.5405 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 63c61203-65af-4cf8-98e5-d12f35edaefa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JPme4QWD+T8GZBa8SVR9DpMY8aso1KgCe/6kfrCLl1ecmJrFxGcqjPZoMzWU3r/9DMlSerKBl7GHbtkFu0lciyaSWZmHaZGePSSRhvujVq0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR09MB3017
Received-SPF: pass client-ip=40.107.1.124;
 envelope-from=amir.gonnen@neuroblade.ai;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 15 Dec 2021 09:13:25 -0500
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "f4bug@amsat.org" <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Stefan,

Easier/faster synchronization is just one side of the issue.
It's much easier to debug a single process or profile it, for example. It's=
 also easier to deploy and maintain a single process.

For now, the only "global state" problem I had to fix was Glib global conte=
xt.
I didn't see an issue with posix signals. Any other global state you think =
I should take care of?
Of course, I only tested it for my own simple use case (qemu-system-nios2 +=
 qemu-system-x86_64 with no GUI)

As a first step , I intend to send a patch that removes the Glib context gl=
obal state.

Thanks,
Amir

-----Original Message-----
From: Stefan Hajnoczi <stefanha@redhat.com>
Sent: Wednesday, December 15, 2021 11:46 AM
To: Amir Gonnen <amir.gonnen@neuroblade.ai>
Cc: qemu-devel@nongnu.org; peter.maydell@linaro.org; f4bug@amsat.org
Subject: Re: Building QEMU as a shared library

On Wed, Dec 15, 2021 at 08:18:53AM +0000, Amir Gonnen wrote:
> Before sending a patch, I would like to check if it's of interest to the =
community.
>
> My goal is to simulate a mixed architecture system.
> Today QEMU strongly assumes that the simulated system is a *single archit=
ecture*.
> Changing this assumption and supporting mixed architecture in QEMU
> proved to be non-trivial and may require significant development
> effort. Common code such as TCG and others explicitly include architectur=
e specific header files, for example.

Hi Amir,
Simulating heterogenous machines comes up from periodically. So far no one =
has upstreamed a solution but there is definitely interest.

I suggest going ahead and posting the code even if it's not cleaned up.

> A possible solution, discussed on
> https://stackoverflow.com/q/63229262/619493 is to separate the
> simulation to multiple processes (as done by Xilinx) and to use some form=
 of Interprocess Communication channel between them.
> Such solution has several disadvantages:
>
> - Harder to synchronize simulation between processes
> - Performance impact of Interprocess Communication
> - Harder to debug, profile and maintain
>
> Instead, I would like to suggest a new approach we use at Neuroblade to a=
chieve this:
> Build QEMU as a shared library that can be loaded and used directly in a =
larger simulation.
> Today we build qemu-system-nios2 shared library and load it from
> qemu-system-x86_64 in order to simulate an x86_64 system that also consis=
ts of multiple nios2 cores.
> In our simulation, two independent "main" functions are running on
> different threads, and simulation synchronization is reduced to synchroni=
zing threads.
>
> To achieve this, I needed to do the following changes in QEMU:
>
> 1. Avoid Glib global context. Use a different context (g_main_context_new=
) for each QEMU instance.
> 2. Change meson.build to build QEMU as a shared library (with PIC
> enabled for static libraries) 3. Define a C API for the library and
> export it (with a -Wl,--version-script)
>
> These changes seem enough for simulating mixed architecture system on a s=
ingle process.
>
> If this approach sounds useful, I'll be happy to send patches.
> I'd appreciate if you could provide your feedback!

I'm curious how much synchronization and IPC there is between the QEMU shar=
ed libraries? I would have guessed that the pain of making communication wo=
rk efficiently between processes would be less than the pain of solving glo=
bal state bugs related to shared libraries within a single process.

Were there issues with POSIX signal handlers?

Stefan

The contents of this email message and any attachments are intended solely =
for the addressee(s) and may contain confidential and/or privileged informa=
tion and may be legally protected from disclosure. If you are not the inten=
ded recipient of this message or their agent, or if this message has been a=
ddressed to you in error, please immediately alert the sender by reply emai=
l and then delete this message and any attachments. If you are not the inte=
nded recipient, you are hereby notified that any use, dissemination, copyin=
g, or storage of this message or its attachments is strictly prohibited.


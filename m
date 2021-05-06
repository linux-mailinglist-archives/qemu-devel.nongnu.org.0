Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A9D3750AC
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 10:25:09 +0200 (CEST)
Received: from localhost ([::1]:56642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leZJl-0004uS-2U
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 04:25:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1leZHr-0003ng-A6
 for qemu-devel@nongnu.org; Thu, 06 May 2021 04:23:11 -0400
Received: from 4.mo52.mail-out.ovh.net ([178.33.43.201]:33348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1leZHi-0001H8-TJ
 for qemu-devel@nongnu.org; Thu, 06 May 2021 04:23:11 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.42])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 5F42E274CD6;
 Thu,  6 May 2021 10:22:58 +0200 (CEST)
Received: from kaod.org (37.59.142.106) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 6 May 2021
 10:22:57 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R0065b457c76-ee48-4199-ad70-0c158ea79f6f,
 A011F864E236C67B2AFE342ECDF08F9E86568858) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Thu, 6 May 2021 10:22:56 +0200
From: Greg Kurz <groug@kaod.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH 11/23] hw/intc/xics: Avoid dynamic stack allocation
Message-ID: <20210506102256.1284c2e8@bahia.lan>
In-Reply-To: <20210505211047.1496765-12-philmd@redhat.com>
References: <20210505211047.1496765-1-philmd@redhat.com>
 <20210505211047.1496765-12-philmd@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: c792ca70-affe-4adc-85c2-080234a3744e
X-Ovh-Tracer-Id: 12061202752103946674
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrvdegtddgtddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeevlefhtddufffhieevhefhleegleelgfetffetkedugeehjeffgfehhfefueduffenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=178.33.43.201; envelope-from=groug@kaod.org;
 helo=4.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 qemu-block@nongnu.org, Richard
 Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, Gerd
 Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed,  5 May 2021 23:10:35 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> Use autofree heap allocation instead of variable-length
> array on the stack.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/intc/xics.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/intc/xics.c b/hw/intc/xics.c
> index 68f9d44feb4..c293d00d5c4 100644
> --- a/hw/intc/xics.c
> +++ b/hw/intc/xics.c
> @@ -566,8 +566,8 @@ static void ics_reset_irq(ICSIRQState *irq)
>  static void ics_reset(DeviceState *dev)
>  {
>      ICSState *ics =3D ICS(dev);
> +    g_autofree uint8_t *flags =3D g_malloc(ics->nr_irqs);

I would have made it g_new(uint8_t, ics->nr_irqs) so that changes
in the type of 'flags' that could potentially change the allocated
size are safely detected.

This is unlikely though, so:

Reviewed-by: Greg Kurz <groug@kaod.org>

>      int i;
> -    uint8_t flags[ics->nr_irqs];
> =20
>      for (i =3D 0; i < ics->nr_irqs; i++) {
>          flags[i] =3D ics->irqs[i].flags;



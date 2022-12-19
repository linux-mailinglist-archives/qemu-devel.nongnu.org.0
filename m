Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6EB650943
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 10:19:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7CJC-0007vZ-K0; Mon, 19 Dec 2022 04:19:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1p7CJB-0007vH-01
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 04:19:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1p7CJ9-00058F-GL
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 04:19:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671441578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pk7B9eT2RIECPCME+qOZKZ8hMnGKlWNseyh61DTIahQ=;
 b=fdLuiioDVVGMhZygy8wq7w1GNsFEgOaulzzijyBD34C3jKmL8rRA2ZK51JWFInjdFIjt8L
 SHZ6IWmaDLt/KGcTcN581zy4cgZNiFL6TM57T+r9Y2OOdiZnuvFJcjdqNHjABBR92ycInF
 ljsJCx0axVpEZkjx3k2dOLl00uZ6kdo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-84-oiZ5JjA6PmmhEEhM5l3AOw-1; Mon, 19 Dec 2022 04:19:36 -0500
X-MC-Unique: oiZ5JjA6PmmhEEhM5l3AOw-1
Received: by mail-ej1-f72.google.com with SMTP id
 gb10-20020a170907960a00b007c192c5482eso5696741ejc.7
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 01:19:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pk7B9eT2RIECPCME+qOZKZ8hMnGKlWNseyh61DTIahQ=;
 b=Aa97ucfCJUoCSvqpcjNDcwuGqihwbLMII2MIeQSx20Q3cWO6sZ8xzoPnw8KC+YHoQQ
 UdPXK+sWSR9Us9DOZx+jHqPGAjV0n6I95Z4GVlDkErlaxCZ0PvkCaRGwEDk74s6X7YEU
 Stwcxo8GcF7xXba/rTNmTzjFl1dZ7NNa0XD9lryzYqLLqyG8It1zOskflWXRTkXpOkfe
 J5mKiIIsf12davUJDJFCSXoDsRhvSnIS7lJ6Xwz2r3WcJnKHKc5B9JG4b2qzIe9WKf2e
 SSOBm5sjeo6XSxRF3SL4V+7wrIyOg3oCpAfAERlut7iII7wks2HgLuDoTGAMkQoNlwHW
 dt/w==
X-Gm-Message-State: ANoB5plrxZ0QcIPTbJEDWpK2xMKm4MB9JER+6Kb6x3G1QhN6DvgKnpkr
 T6p5w4Rh6DXh/W/Fwg6xk2zyPum5sbHRwQPh32ha4I1gegWDChIdqtLJ3bofsgihIguufdNwicF
 gS5ZvHU4s8yBDz1w=
X-Received: by 2002:a17:906:2209:b0:7c1:1b89:1fe0 with SMTP id
 s9-20020a170906220900b007c11b891fe0mr35737328ejs.65.1671441575753; 
 Mon, 19 Dec 2022 01:19:35 -0800 (PST)
X-Google-Smtp-Source: AA0mqf65VUv6PgNyXwNf4YK5Z0niBdNl3LGFRdsrW8T7uX8ujdQNpQfEsGIxd3wODgsiFlAw6qTr6g==
X-Received: by 2002:a17:906:2209:b0:7c1:1b89:1fe0 with SMTP id
 s9-20020a170906220900b007c11b891fe0mr35737311ejs.65.1671441575470; 
 Mon, 19 Dec 2022 01:19:35 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 gu23-20020a170906f29700b00779cde476e4sm4104556ejb.62.2022.12.19.01.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 01:19:35 -0800 (PST)
Date: Mon, 19 Dec 2022 10:19:33 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?SGVydsOp?= Poussineau
 <hpoussin@reactos.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, John
 Snow <jsnow@redhat.com>, qemu-block@nongnu.org, Gerd Hoffmann
 <kraxel@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>, Richard
 Henderson <richard.henderson@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>, Philippe
 =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>, Eduardo Habkost
 <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 01/32] hw/mips/malta: Introduce PIIX4_PCI_DEVFN definition
Message-ID: <20221219101933.3ce13271@imammedo.users.ipa.redhat.com>
In-Reply-To: <20221204190553.3274-2-shentey@gmail.com>
References: <20221204190553.3274-1-shentey@gmail.com>
 <20221204190553.3274-2-shentey@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun,  4 Dec 2022 20:05:22 +0100
Bernhard Beschow <shentey@gmail.com> wrote:

> From: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>=20
> The PIIX4 PCI-ISA bridge function is always located at 10:0.
> Since we want to re-use its address, add the PIIX4_PCI_DEVFN
> definition.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Message-Id: <20221027204720.33611-2-philmd@linaro.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/mips/malta.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> index c0a2e0ab04..9bffa1b128 100644
> --- a/hw/mips/malta.c
> +++ b/hw/mips/malta.c
> @@ -71,6 +71,8 @@
> =20
>  #define FLASH_SIZE          0x400000
> =20
> +#define PIIX4_PCI_DEVFN     PCI_DEVFN(10, 0)
> +
>  typedef struct {
>      MemoryRegion iomem;
>      MemoryRegion iomem_lo; /* 0 - 0x900 */
> @@ -1401,7 +1403,7 @@ void mips_malta_init(MachineState *machine)
>      empty_slot_init("GT64120", 0, 0x20000000);
> =20
>      /* Southbridge */
> -    piix4 =3D pci_create_simple_multifunction(pci_bus, PCI_DEVFN(10, 0),=
 true,
> +    piix4 =3D pci_create_simple_multifunction(pci_bus, PIIX4_PCI_DEVFN, =
true,
>                                              TYPE_PIIX4_PCI_DEVICE);
>      isa_bus =3D ISA_BUS(qdev_get_child_bus(DEVICE(piix4), "isa.0"));
> =20



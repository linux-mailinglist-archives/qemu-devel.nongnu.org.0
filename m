Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3344652CE4
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 07:34:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7sfX-00039M-Au; Wed, 21 Dec 2022 01:33:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7sfV-00038v-FE
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 01:33:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7sfT-0001Lc-P7
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 01:33:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671604411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TOtYSI9j1IXqesYdn2lI0JZEo5L715hj/lcpEeX6tfc=;
 b=Rti73A2Ar/BGfgyekqBosFgC2oEuPfUslhwCtl/Us3ZyfIjINsub1g/x1JkUm1ukZvwSiE
 ZkVRLsx4bCLaSS/r1q2D8Tf8V43MCGXuEe717HtDZTKHDV4HHzIcQ+vybdKDmBw86TUfKC
 ah3HCpp0Xg2n1aJQX1N2tRHMRAEdIo0=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-563-OgHq5TQeMnqlAN4_kBwlqA-1; Wed, 21 Dec 2022 01:33:29 -0500
X-MC-Unique: OgHq5TQeMnqlAN4_kBwlqA-1
Received: by mail-qv1-f70.google.com with SMTP id
 ng1-20020a0562143bc100b004bb706b3a27so8317338qvb.20
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 22:33:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TOtYSI9j1IXqesYdn2lI0JZEo5L715hj/lcpEeX6tfc=;
 b=Tqa1famihiBssLko/sM83NP4uz5VIvf5AzK80us7ixgkelXNJ1hruLFZb5iGpbLBn2
 jXCtAAitZMxKINxTTv8KjbXFcvMvrvacWFfUQLfbEfkFo7xl3AuL4HFDU8YkGKPcZNAF
 Oupec2KeHAa+Vcnz0HgcZc7fBfUSu0x6PPQDlRq1rp/iVKJgJmbKk6dUt39d2/f/HyX/
 Fme3L7FnheyQNfHGIZn1ClLkhxuscyuHwNuYEEnKr8oDZoZ/uZfUTCsqKIMEhMFNnw6N
 jE/PM1eLJwrz3EwzxdlF5cl+lInA1UljV59X+Tfwvh8DQeum4wg8/l+P+6YCkwLA49ba
 FqGg==
X-Gm-Message-State: AFqh2kqBgSQuEyCgLvc6oWPr8bYnTcCb8aP3XSbjBubgJkFxI2raDveR
 HpHBqfDnUgl3kNNr75D9Qvsud08UsihjsxZjPOJZAaamTH7GPPw4e7YjvCRtifsCb5gD7DoueED
 7lVHHCIzAT+47MRs=
X-Received: by 2002:a0c:8070:0:b0:512:3228:dc07 with SMTP id
 103-20020a0c8070000000b005123228dc07mr953155qva.22.1671604408474; 
 Tue, 20 Dec 2022 22:33:28 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvLJsrYUHbN4HjhGFogzKntHauji13tdsrPprhP05x8TKezQ9m7uotly2XLYBfVEKsS9swgSA==
X-Received: by 2002:a0c:8070:0:b0:512:3228:dc07 with SMTP id
 103-20020a0c8070000000b005123228dc07mr953145qva.22.1671604408219; 
 Tue, 20 Dec 2022 22:33:28 -0800 (PST)
Received: from redhat.com ([37.19.199.117]) by smtp.gmail.com with ESMTPSA id
 bn35-20020a05620a2ae300b006ce76811a07sm10149201qkb.75.2022.12.20.22.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 22:33:27 -0800 (PST)
Date: Wed, 21 Dec 2022 01:33:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, John G Johnson <john.g.johnson@oracle.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v2 0/3] Decouple INTx-to-LNKx routing from south bridges
Message-ID: <20221221013309-mutt-send-email-mst@kernel.org>
References: <20221120150550.63059-1-shentey@gmail.com>
 <17a7d714-8a1e-8a17-f657-2172060d02e5@linaro.org>
 <3F5A5F52-5815-4CB2-9DE8-894D59B0EB8C@gmail.com>
 <20221220181024-mutt-send-email-mst@kernel.org>
 <B8EAD0D4-F86D-4FDB-A1B9-D4A1612CE40C@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <B8EAD0D4-F86D-4FDB-A1B9-D4A1612CE40C@gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Tue, Dec 20, 2022 at 11:26:42PM +0000, Bernhard Beschow wrote:
> 
> 
> Am 20. Dezember 2022 23:10:45 UTC schrieb "Michael S. Tsirkin" <mst@redhat.com>:
> >On Sun, Dec 18, 2022 at 10:21:49AM +0000, Bernhard Beschow wrote:
> >> 
> >> 
> >> Am 9. Dezember 2022 15:23:59 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
> >> >On 20/11/22 16:05, Bernhard Beschow wrote:
> >> >> v1:
> >> >> ===
> >> >> 
> >> >> During my PIIX consolidation work [1] I've noticed that both PIIX models have
> >> >> quite different pci_slot_get_pirq() implementations. These functions seem to
> >> >> map PCI INTx pins to input pins of a programmable interrupt router which is
> >> >> AFAIU board-specific. IOW, board-specific assumptions are baked into the device
> >> >> models which prevent e.g. the whole PIIX4 south bridge to be reusable in the PC
> >> >> machine.
> >> >> 
> >> >> This series first factors out pci_bus_map_irqs() from pci_bus_irqs() which
> >> >> then allowes for moving the two board-specific PIIX pci_slot_get_pirq()
> >> >> funtions into their respective boards. With these changes, the PIIX4 south
> >> >> bridge could eventually become an alternative to the PIIX3-Frankenstein
> >> >> solution in the PC machine.
> >> >
> >> >Series:
> >> >Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> >> 
> >> Ping
> >> 
> >> Who will pull this?
> >
> >To clarify, you want this dropped for now?
> 
> Yeah, let's merge via mips-next since this series is related to the PIIX consolidation series (see above) and mips-next is planned to be pulled soon.
> 
> Thanks,
> Bernhard


For that

Acked-by: Michael S. Tsirkin <mst@redhat.com>




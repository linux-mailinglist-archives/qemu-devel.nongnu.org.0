Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 073F96448A2
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 17:03:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2aPH-0007HT-6h; Tue, 06 Dec 2022 11:02:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p2aPF-0007HE-LV
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 11:02:53 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p2aPC-0007Pw-Sq
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 11:02:53 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 3-20020a17090a098300b00219041dcbe9so15199056pjo.3
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 08:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vjNnROPnToPUHWfjJSvsYOtRM3niVfpLhQDscfqDb0o=;
 b=QocGN2J13BNyB3Tek2pncLMiX/JkmjyqzlY9l6Yh9Eanyndm9zd6BxRh/jq/8Ny1fg
 TxuRHWSOp/Fww/d5WvzeKkyu36JiPnYPjoZRv/xmFP2Ei9e5gBDJQW7lDHeAESeY/DFX
 1/rJlbsURASULUYSIc+5XCN4PNUNH7v+PGAlQA2FCdiaM4oQ3XmUzzB5/8QLQd7ZDN3h
 yOTA7cVPScwCXv2NHqJON327QYQ/iJ3D+XG+qyy7X8hTeSCrmNDiNbL3FkmXqkz6iZ26
 kcDVMQb1+kWt9scbdY6BHGO2OT9ZBa3Jt+gdqgQ4IMJqOpZuAvVX2Jrb7wj+gClOQ10S
 G7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vjNnROPnToPUHWfjJSvsYOtRM3niVfpLhQDscfqDb0o=;
 b=Weh8jdTSfeKSRzsCBki3VcSM+yAApKAa9aA6tSiE/ua1lsYpe3JOikbLavElNu/v3W
 iHcjSKP0K0bPQ0OqFbS4KREUD/QG4FrkjYx4wn0egzq5J5ohmVlEYK/u1hcccBeyOnZr
 N6dTG6zkWVt2Fuwnr5fsYmtZ1PvKpEll5wM1bDenzjT1qNih+wm5w4B3OuapZNXJ9tS0
 uUgF2Azixp/Y/IJcrD1+/bO9jHOipIwvOIfQVcNVASYn2iyMCm0EzTPKhMw0hsmOnSRQ
 JIQSSyUbCpU59/7qBk8JM8Vc5xfXBAp5AShyYMwwsx/mG2HH6kMnzuLJ6C9mJZ3zyfjK
 6Iwg==
X-Gm-Message-State: ANoB5pkBTjwSjroYnEngS1ZFU8sNeG7aScKY+l6GwcGz3AzNTYV8hgTk
 EjhsqHnnNa0elPV54O2aE0AkK+E0u7I1LAlNtVgN+w==
X-Google-Smtp-Source: AA0mqf4ZP0j3bfOmhJAUgFuC8KpojVamNtcPo/b9jhnoz0kH3nOaMyhKl6kehZuxWo2Ffh+4kFntnB0QEQG1hRipdv4=
X-Received: by 2002:a17:902:f292:b0:189:91b8:bf92 with SMTP id
 k18-20020a170902f29200b0018991b8bf92mr40000022plc.19.1670342569185; Tue, 06
 Dec 2022 08:02:49 -0800 (PST)
MIME-Version: 1.0
References: <fb95bd97-8d5f-b0eb-008b-47a96808a74f@linaro.org>
 <Y4818KfGO7Y9Tsn/@work-vm> <3201e3f9-8b98-613d-5516-e0c6d89a9b9a@linaro.org>
In-Reply-To: <3201e3f9-8b98-613d-5516-e0c6d89a9b9a@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Dec 2022 16:02:37 +0000
Message-ID: <CAFEAcA-WeEaMnL3CB1tGGM8jdscGBG+i_si0k86358kHaqdrsA@mail.gmail.com>
Subject: Re: Thoughts on removing the TARGET_I386 part of
 hw/display/vga/vbe_portio_list[]
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
 Fabrice Bellard <fabrice@bellard.org>, Michael Tokarev <mjt@tls.msk.ru>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Bin Meng <bmeng.cn@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 BALATON Zoltan <balaton@eik.bme.hu>, QEMU Developers <qemu-devel@nongnu.org>, 
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, 6 Dec 2022 at 15:56, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> On 6/12/22 13:30, Dr. David Alan Gilbert wrote:
> > I don't know that bit of qemu well enough to know whether the cpu part
> > of qemu should be splitting the unaligned accesses or not.
> All I/O accesses are gated thru access_with_adjusted_size() in
> softmmu/memory.c.
>
> There is an old access_with_adjusted_size_unaligned() version [1] from
> Andrew and a more recent series [2] from Richard. Maybe the latter fixes
> some long-standing bug [3] we have here?

There definitely are some unaddressed bugs there -- maybe this
is the time to work through what semantics we want that
softmmu code to provide and fix the bugs...

-- PMM


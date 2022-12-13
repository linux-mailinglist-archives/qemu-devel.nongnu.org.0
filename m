Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D9964B8BD
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 16:42:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p57Pw-0002wL-T8; Tue, 13 Dec 2022 10:42:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1p57Pt-0002ne-Ly; Tue, 13 Dec 2022 10:42:01 -0500
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1p57Pr-0004BK-Tw; Tue, 13 Dec 2022 10:42:01 -0500
Received: by mail-lf1-x12d.google.com with SMTP id 1so5562563lfz.4;
 Tue, 13 Dec 2022 07:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zztQlmAHWpKKr1LjTiKfDtrHqx9E2dILpgSGg93n8e8=;
 b=SLpTkc4K7UYPvJpfGlroQ+y76arQkS/iCaXWoVD3SihfJAapNkLWlI5p+XwF6U0Viv
 9v5Ty13PoEBMWqF7X3LLYMyeTgmETxx6cJsmbbjESfr1repTwXfSEMZbXD+JCCb7tyRW
 tiFnh77l3fp0WFPFXcyihs96lp8R0Vxg5dBDMZhHs/AJuC/rUahvfyAKRAomaUdki1kI
 D0HZ2sOtN6BekpMttKLWKIi3CpEEpCnVSxyR7lNa9Zl24/xzsm2dEMEAQ2qRGo6DXflq
 rNHX7VkFeMlmAJANm9Imt+AY1XbIMVqLiLUcLF+B/qVdEnQqAWfdie13lGw8FFCiQMY6
 opOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zztQlmAHWpKKr1LjTiKfDtrHqx9E2dILpgSGg93n8e8=;
 b=qwYOpIuT4X/3/olA4mq4CqODHFONt5aMGvV8+5PdwZrSeM/u0PkDZv9AazOqS1//Qe
 3T2q/B5nUCvtXJSTHi602b7j8unvR2tolor3CNnto+aHhnK6taAl5HXuzDteuFJ5kiyN
 oYs4rEPy48YxTVB7s3g0h321U8zNGq4hWKnIMFXSF3AUhVSMPGazi541qm3qXBmCsSAN
 zjy/rPnhqR6JMgdsdmyy5Su4K24qGQHkF/T7dkyI8vh8tBKUadhUTHvRMUKqhsZWa1Qp
 J3Y8RDzvSEzGZ+UfogBldNMtiQ6noQDWyWBuR36avxbs5SJh6GfytHz+LnLdvKkRs1TY
 co9Q==
X-Gm-Message-State: ANoB5pmRthrdFURWK2Lm7BNsVDXkKp6T2Lc+2ejd+sRJx9it1eN3POru
 C7BSnQ1Q7BlPSBygNq/a8QQ=
X-Google-Smtp-Source: AA0mqf6HIImPLLRGoRAfk0c15lnCWfNdAjurb7oKMRn0ipNES00Jtm5L+ZIYv4xptudorJ+5zPlzuQ==
X-Received: by 2002:a05:6512:68f:b0:4b6:f595:cfde with SMTP id
 t15-20020a056512068f00b004b6f595cfdemr1431570lfe.12.1670946117128; 
 Tue, 13 Dec 2022 07:41:57 -0800 (PST)
Received: from gmail.com (81-232-4-135-no39.tbcn.telia.com. [81.232.4.135])
 by smtp.gmail.com with ESMTPSA id
 o4-20020ac24e84000000b00492ceda336fsm406317lfr.278.2022.12.13.07.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 07:41:56 -0800 (PST)
Date: Tue, 13 Dec 2022 16:41:56 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 David Gibson <david@gibson.dropbear.id.au>,
 Jason Wang <jasowang@redhat.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [RFC PATCH-for-8.0 3/3] hw/net/xilinx_ethlite: Replace tswap32()
 by be32_to_cpu()
Message-ID: <Y5idRFBkHSXIdnCM@toto>
References: <20221213125218.39868-1-philmd@linaro.org>
 <20221213125218.39868-4-philmd@linaro.org>
 <CAFEAcA-iouFJgu_2cG2TapxYVr-_ZK1Uuwa4mqSL5zNKg6Jq+Q@mail.gmail.com>
 <Y5iEL5YexYliX+cG@toto>
 <CAFEAcA8=fePrpR4LOp6qQznz58kNGgy8ZuiZaEE6Dy43hLvH3g@mail.gmail.com>
 <Y5iK7VFi9B1HwHf/@toto>
 <CAFEAcA9-XbeREaoOL=MKxmBmK1V9n9r1cNTjyXZKo3ujdJu8xQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA9-XbeREaoOL=MKxmBmK1V9n9r1cNTjyXZKo3ujdJu8xQ@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Tue, Dec 13, 2022 at 03:22:54PM +0000, Peter Maydell wrote:
> On Tue, 13 Dec 2022 at 14:23, Edgar E. Iglesias
> <edgar.iglesias@gmail.com> wrote:
> >
> > On Tue, Dec 13, 2022 at 02:18:42PM +0000, Peter Maydell wrote:
> > > On Tue, 13 Dec 2022 at 14:14, Edgar E. Iglesias
> > > <edgar.iglesias@gmail.com> wrote:
> > > >
> > > > On Tue, Dec 13, 2022 at 01:53:15PM +0000, Peter Maydell wrote:
> > > > > On Tue, 13 Dec 2022 at 12:52, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
> > > > > >
> > > > > > This partly revert commit d48751ed4f ("xilinx-ethlite:
> > > > > > Simplify byteswapping to/from brams") which states the
> > > > > > packet data is stored in big-endian.
> 
> > > > > This is a change of behaviour for this device in the
> > > > > qemu-system-microblazeel petalogix-s3adsp1800 board, because
> > > > > previously on that system the bytes of the rx buffer would
> > > > > appear in the registers in little-endian order and now they
> > > > > will appear in big-endian order.
> > > > >
> > > > > Edgar, do you know what the real hardware does here ?
> > >
> > > > Yeah, I think these tx/rx buffers (the default case with tswap32)
> > > > should be modelled as plain RAM's (they are just RAM's on real HW).
> > > > Because we're modeling as MMIO regs, I think we get into endianness
> > > > trouble when the ethernet output logic treats the content as a blob
> > > > (thus the need for byteswaps). Does that make sense?
> > >
> > > As a concrete question: if I do a 32-bit load from the buffer
> > > register into a CPU register, do I get a different value
> > > on the BE microblaze hardware vs LE microblaze ?
> >
> > Yes, I beleive so.
> >
> > If the CPU stores the value and reads it back, you get the same. But
> > the representation on the RAM's is different between LE/BE.
> > But if the Ethernet logic writes Ethernet packet data into the buffer,
> > LE and BE MicroBlazes will read differient values from the buffers.
> > These buffer "registers" are just RAM's I beleive.
> 
> Thanks. That suggests that the current code for this device
> is correct, and we would be breaking it on the LE platform
> if we applied this patch.
> 
> I don't suppose you have a guest image for the boards which
> uses ethernet ?

Yes, I do, both little and big endian with ethlite working. Do you have a suggestion where to upload?

Best regards,
Edgar


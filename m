Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE08A64B718
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 15:16:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p563Y-0005M3-A4; Tue, 13 Dec 2022 09:14:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1p563T-0005LW-PZ; Tue, 13 Dec 2022 09:14:48 -0500
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1p563S-0007qw-6d; Tue, 13 Dec 2022 09:14:47 -0500
Received: by mail-lf1-x12c.google.com with SMTP id y25so5079122lfa.9;
 Tue, 13 Dec 2022 06:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ffi4iYpsADx0RphIyE6y/SThpfQghkBcEN/v45tCSu8=;
 b=aHZQ2sYn1nesw0JylWao1NOuzsMKupEFLmyGRmhJyIut6/D795YpIfNv9nLDo9E8hP
 z8+PFPWuh7ZsRWKPqCqo7zRFJVmMooA3JUtp8G6NE/9S7m9uHN5fp1r9gJ+aMpou5Jz7
 +3Uwk/0NXAofRDSqeg9HVxSaOdR7zd4demCM+g+5ytHoeGjcbb8zw4k2Kc0x2J+QVVJ5
 BzPW0EDXur3jJdebZMOM8xR+hjaZ7o6wjntQFxdzi3wQRpoy4OgIBM0gRnPCUY6mBMaw
 k9zkAwSdcdFQRHA86bALLQ7+6uAESmUDisFFyPsFzdvArSK+QMGOZSNbLzsjo5Clkn3V
 VLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ffi4iYpsADx0RphIyE6y/SThpfQghkBcEN/v45tCSu8=;
 b=go6laV2VYH/kGFoGXArPaBizbd9fWOnKfubwFRE4IsedOXb0WIUMWQUeMNEwGyv6cH
 YDdbClNF8jzQXYz6SH+H33K6MPR/NlrhmYLFpNk6oHr1iMpjAfxVvwOcxYEmAFLH5+2l
 YTXHRu/5XkE2ejuEsQCpuqVEDdybJS/j4Q8m8Si78LuS0oENOVHwQdKacWL5oCLIUfuK
 ZCaB743Xu8sLCiVoFtZC7nqEUMtR3F3jEPjyENjmjGzu8FwfgMkIeiwiW13SlbHAGMHl
 TKZCKPGso2yh8R5BaZJmqmN+92KdCxJHTNCgOF/x1G3UglVAO0eH25cllmu0ObBa80yP
 RAew==
X-Gm-Message-State: ANoB5plzNiR180jDu+mkAsEtcTnmF8r/grX8addad8CAtMZLTu/IhSLy
 nt8NhlXqElvpqnJYfs8dcUU=
X-Google-Smtp-Source: AA0mqf5yWk+TEo9M7LmIlKncM6V1GWxga3Ziyam4jG+fVyWjN2JpwMYCdg40zJCa2Wm/0jnMfDDFhg==
X-Received: by 2002:a05:6512:682:b0:4a4:68b8:f4db with SMTP id
 t2-20020a056512068200b004a468b8f4dbmr7947288lfe.33.1670940883194; 
 Tue, 13 Dec 2022 06:14:43 -0800 (PST)
Received: from gmail.com (81-232-4-135-no39.tbcn.telia.com. [81.232.4.135])
 by smtp.gmail.com with ESMTPSA id
 v14-20020a19740e000000b0048b365176d9sm379457lfe.286.2022.12.13.06.14.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 06:14:42 -0800 (PST)
Date: Tue, 13 Dec 2022 14:54:55 +0100
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
Message-ID: <Y5iEL5YexYliX+cG@toto>
References: <20221213125218.39868-1-philmd@linaro.org>
 <20221213125218.39868-4-philmd@linaro.org>
 <CAFEAcA-iouFJgu_2cG2TapxYVr-_ZK1Uuwa4mqSL5zNKg6Jq+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA-iouFJgu_2cG2TapxYVr-_ZK1Uuwa4mqSL5zNKg6Jq+Q@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x12c.google.com
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

On Tue, Dec 13, 2022 at 01:53:15PM +0000, Peter Maydell wrote:
> On Tue, 13 Dec 2022 at 12:52, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
> >
> > This partly revert commit d48751ed4f ("xilinx-ethlite:
> > Simplify byteswapping to/from brams") which states the
> > packet data is stored in big-endian.
> >
> > Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> > @@ -102,8 +102,8 @@ eth_read(void *opaque, hwaddr addr, unsigned int size)
> >              D(qemu_log("%s " TARGET_FMT_plx "=%x\n", __func__, addr * 4, r));
> >              break;
> >
> > -        default:
> > -            r = tswap32(s->regs[addr]);
> > +        default: /* Packet data */
> > +            r = be32_to_cpu(s->regs[addr]);
> >              break;
> >      }
> >      return r;
> > @@ -160,8 +160,8 @@ eth_write(void *opaque, hwaddr addr,
> >              s->regs[addr] = value;
> >              break;
> >
> > -        default:
> > -            s->regs[addr] = tswap32(value);
> > +        default: /* Packet data */
> > +            s->regs[addr] = cpu_to_be32(value);
> >              break;
> >      }
> >  }
> 
> This is a change of behaviour for this device in the
> qemu-system-microblazeel petalogix-s3adsp1800 board, because
> previously on that system the bytes of the rx buffer would
> appear in the registers in little-endian order and now they
> will appear in big-endian order.
> 
> Edgar, do you know what the real hardware does here ?
> 

Yeah, I think these tx/rx buffers (the default case with tswap32) should be modelled as plain RAM's (they are just RAM's on real HW).
Because we're modeling as MMIO regs, I think we get into endianness trouble when the ethernet
output logic treats the content as a blob (thus the need for byteswaps). Does that make sense?

Cheers,
Edgar


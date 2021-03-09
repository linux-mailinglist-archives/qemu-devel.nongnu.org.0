Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D005A332F84
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 21:03:53 +0100 (CET)
Received: from localhost ([::1]:38708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJia8-0006qP-R9
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 15:03:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJgVt-0005Nj-BH
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 12:51:21 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:53493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJgVr-0008Nv-4w
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 12:51:21 -0500
Received: by mail-wm1-x32d.google.com with SMTP id e23so3032210wmh.3
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 09:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=pwSvuLUJv5wrtVTBYBxls5fXoDCVF6+nRh8UPGRMic4=;
 b=Nvv5NsVyTuokT/8YqSea15iJGRoQVRNE9lLp/1aVtdY+rKJ8zXaWe6jJW4ujnahHJZ
 9HPTvOnL0C4EG9JbSF/XRyOmbfplcyCqbWnLnOe01bXZCEOsxiVsegi+/t8JmIvHAazX
 g3Qn+/zXr0DbFBKWh3sH9ucU8RpS8h/oNBBDkQLVM4yb8WX47JLPbIjvsZqfBIPQ/l/K
 g2P4tNkBOr6iZTu1NVaHW/08wrD4H7p5e5Zcqc+J0JMoWDDFf/zsm531L40uN0/f0IC4
 ZGPCxCU7Jad4CDnN0Uli6UCNTpO1d+idgusSX8iKSo4L/xx3NNUEPfnoYxfyfUQttf0n
 cf9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=pwSvuLUJv5wrtVTBYBxls5fXoDCVF6+nRh8UPGRMic4=;
 b=JbxfWDbdClM0dR1T3mPqa9T67CII9NsKSq85ernyREZjJJcywFU1rEphr3yNWE+NXZ
 tQ4EKxXtJjJoiVxyDVf7gM8rC88e/bRKhww03HWpAoC/kU/eE35jzVcrRW8wt0CZPmIA
 ZJtKkxd7FtyJm5QW1tApEUJlKkscbQM3IfaP0KD0M/B8eR4m86tkvcrvevXe+mg+yGtG
 lKL3WUp0ZnF/kuS8ko2QOcYLCfvLVGVluzH90tg0U55oMlCYH8IxIrkLWiCK1ITNYBEX
 oCYrGQ3BY9RfsIPIlctfkLZ4QCZN8/bU3RpcF05uLvOF8rVo2TfxCyhKwd3A1+2VHFl4
 CEyw==
X-Gm-Message-State: AOAM533qHB35fu91UtpMvr6hGz4zsJn9RfnUUV/RhTMH6762zq42xcu8
 txfg6bkUMkMiBiItmYCJDaVsqQ==
X-Google-Smtp-Source: ABdhPJwhOrlFaNQvHwEvZabGYhjoCWBehS4h4hVXWn7kloDjOJ2Itjkl4+TaAswSoEl9C/TTT/Vnzg==
X-Received: by 2002:a7b:cf16:: with SMTP id l22mr5225919wmg.26.1615312277467; 
 Tue, 09 Mar 2021 09:51:17 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o11sm26545640wrq.74.2021.03.09.09.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 09:51:16 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BAB691FF7E;
 Tue,  9 Mar 2021 17:51:15 +0000 (GMT)
References: <20210308201406.1240023-1-aaron@os.amperecomputing.com>
 <CAFEAcA-x=FPqFMi7=RkPj4sU7nPgqZCnRf4x7k5_e2AcryGJ+A@mail.gmail.com>
 <YEeI0GLdvRFAB+FV@strawberry.localdomain>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: Re: [PATCH] plugins: Expose physical addresses instead of device
 offsets
Date: Tue, 09 Mar 2021 17:45:47 +0000
In-reply-to: <YEeI0GLdvRFAB+FV@strawberry.localdomain>
Message-ID: <87lfaw8bcc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, "Emilio G. Cota" <cota@braap.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Aaron Lindsay <aaron@os.amperecomputing.com> writes:

> On Mar 09 10:08, Peter Maydell wrote:
>> On Mon, 8 Mar 2021 at 20:14, Aaron Lindsay <aaron@os.amperecomputing.com=
> wrote:
>> >
>> > This allows plugins to query for full virtual-to-physical address
>> > translation for a given `qemu_plugin_hwaddr` and stops exposing the
>> > offset within the device itself. As this change breaks the API,
>> > QEMU_PLUGIN_VERSION is incremented.
>> >
>> > Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
>> > ---
>>=20
>>=20
>> > diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
>> > index c66507fe8f..2252ecf2f0 100644
>> > --- a/include/qemu/qemu-plugin.h
>> > +++ b/include/qemu/qemu-plugin.h
>> > @@ -47,7 +47,7 @@ typedef uint64_t qemu_plugin_id_t;
>> >
>> >  extern QEMU_PLUGIN_EXPORT int qemu_plugin_version;
>> >
>> > -#define QEMU_PLUGIN_VERSION 0
>> > +#define QEMU_PLUGIN_VERSION 1
>> >
>> >  typedef struct {
>> >      /* string describing architecture */
>> > @@ -328,7 +328,7 @@ struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(=
qemu_plugin_meminfo_t info,
>> >   * offset will be into the appropriate block of RAM.
>> >   */
>> >  bool qemu_plugin_hwaddr_is_io(const struct qemu_plugin_hwaddr *haddr);
>> > -uint64_t qemu_plugin_hwaddr_device_offset(const struct qemu_plugin_hw=
addr *haddr);
>> > +uint64_t qemu_plugin_hwaddr_phys_addr(const struct qemu_plugin_hwaddr=
 *haddr);
>>=20
>>=20
>> This should have a documentation comment, since this is the public-facin=
g API.
>
> I now see I neglected to update the comment right here the function
> declaration, and will do so for v2.
>
> But are you asking for additional documentation beyond that change? If
> so, where is the right place to add this? docs/devel/tcg-plugins.rst
> doesn't seem to have much in the way of documentation for the actual
> calls.

The calls should be documented in @kerneldoc style comments in the main
plugin header. Which reminds me I should be able to extract them into
the tcg-plugins.rst document via sphinx.

>
>> Also, physical addresses aren't uniquely identifying, they're only valid
>> in the context of a particular address space (think TrustZone, for insta=
nce),
>> so the plugin-facing API should probably have some concept of how it
>> distinguishes "this is an access for Secure 0x4000" from "this is an
>> access for Non-Secure 0x4000".
>
> I agree it could be handy to expose address spaces in addition to the
> addresses themselves. Do you believe doing so would change the form of
> the interface in this patch, or could that be a logically separate
> addition?

I think information about address spaces should extracted be a separate
query.

> I have a secondary concern that it might be hard to expose address
> spaces in an architecture-agnostic yet still-helpful way, but haven't
> thought through that enough for it to be a firm opinion.

Indeed - so I don't think we need to rush this without giving it some
thought. As soft-freeze is only a few days away I don't think we want to
rush an address space query API into 6.0. For most users I expect a
assuming physical address is unique will work for the most part. But
it's worth mentioning it might not be in the comment.

>
> -Aaron


--=20
Alex Benn=C3=A9e


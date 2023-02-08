Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F46468EE95
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 13:09:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPjFa-0004lR-Cl; Wed, 08 Feb 2023 07:08:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pPjFW-0004kq-33
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 07:08:32 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pPjFU-0004gA-GG
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 07:08:29 -0500
Received: by mail-wr1-x42c.google.com with SMTP id d14so16507018wrr.9
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 04:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Q4rbePfwHcTQS8Q3p4+GaUBlxWCk6uuCllBf0wNPDsA=;
 b=i5HeK+Hl/RX7/TYppxtRahC2bt3iV0eoaCNNNmlf7fKjSdvwUvxmLZ/mooRJvgjvcN
 IVzS76XgY+l2t5+ZQo/dBwuhe5bVu8aF1U3Ug63+Xc+JLUpYLrJh7DgSPiJ9TbN/8nEA
 oQxc3QUxgWmPJTN2F3k6v4H+ppXqg29PD5TUwBhlV6Kxj2b1L8VXFnobQt3HwODM7vG4
 v1D/oilmFPekV/OovcuSdxyZPRv/agSJhkrdSyJ5UEewDQ51dxuddiHTZuBsgbX4No8A
 WE4gS6ju6kQU7r+jz2dfolunQpabWn8/SqnrMnD1GGMipLgRmhcr+IEfWVaPcPoWMuRp
 qOJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q4rbePfwHcTQS8Q3p4+GaUBlxWCk6uuCllBf0wNPDsA=;
 b=7pETYc+uy8qwB1NxFDE247MlxcbET40gYy7twClpVtOfvYnSk76w84VoPDOHasUb3h
 JrVYQThYPea1ONwWJI6SNjV2RsAI7aNt4+n1yQKTuWtdEURObQS+pGnR3mUJxeUwgcth
 fHHP01uviWjWBuv46M4VCpt3C2Negkti22FXZcvmauA8fLUvhnsoTNB75pZ2sPrVLvxL
 g9dvfXpaYshP5QFWpAktR8taB+opCdouWdYh45andxwBm1X0Fh3gneUZgZ/tAUV7K/uz
 8NyC5D/lilvkUxKtI5sx76PY48490dQyNZuaqYowNWQr2F2MrAXwBBxeX8t0ryEkKftf
 Lvbg==
X-Gm-Message-State: AO0yUKXSsh+SG757OogPFDs+5zgViNzzVamFf3xDfwFBAmZ1iJNd5IXi
 1NeBbwSvuDmYKtyR6qgcrYR63g==
X-Google-Smtp-Source: AK7set+yD8n4U+WP5rpf4tYpIV9TuDBVNjdlsyBLpIgk8ZQAmd3XCttjjI3xkwdLDikGtGile1gKqQ==
X-Received: by 2002:a5d:6e06:0:b0:2c3:e4eb:3c12 with SMTP id
 h6-20020a5d6e06000000b002c3e4eb3c12mr5574176wrz.64.1675858107755; 
 Wed, 08 Feb 2023 04:08:27 -0800 (PST)
Received: from myrica (054592b0.skybroadband.com. [5.69.146.176])
 by smtp.gmail.com with ESMTPSA id
 d13-20020adffbcd000000b002c3f6cd1f0fsm3366884wrs.83.2023.02.08.04.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 04:08:27 -0800 (PST)
Date: Wed, 8 Feb 2023 12:08:23 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 pbonzini@redhat.com, eblake@redhat.com, armbru@redhat.com,
 berrange@redhat.com, eduardo@habkost.net, alex.bennee@linaro.org
Subject: Re: [RFC PATCH 04/16] hw/arm/virt: Add support for Arm RME
Message-ID: <Y+OQt1r2f9hATsMQ@myrica>
References: <20230127150727.612594-1-jean-philippe@linaro.org>
 <20230127150727.612594-5-jean-philippe@linaro.org>
 <6b7d1132-9274-c019-440a-8deb84189b21@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b7d1132-9274-c019-440a-8deb84189b21@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42c.google.com
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

On Fri, Jan 27, 2023 at 11:07:35AM -1000, Richard Henderson wrote:
> > +    /*
> > +     * Since the devicetree is included in the initial measurement, it must
> > +     * not contain random data.
> > +     */
> > +    if (virt_machine_is_confidential(vms)) {
> > +        vms->dtb_randomness = false;
> > +    }
> 
> This property is default off, and the only way it can be on is user
> argument.  This should be an error, not a silent disable.

This one seems to default to true in virt_instance_init(), and I did need
to disable it in order to get deterministic measurements. Maybe I could
throw an error only when the user attempts to explicitly enables it.

> > +    if (virt_machine_is_confidential(vms)) {
> > +        /*
> > +         * The host cannot write into a confidential guest's memory until the
> > +         * guest shares it. Since the host writes the pvtime region before the
> > +         * guest gets a chance to set it up, disable pvtime.
> > +         */
> > +        steal_time = false;
> > +    }
> 
> This property is default on since 5.2, so falls into a different category.
> Since 5.2 it is auto-on for 64-bit guests.  Since it's auto-off for 32-bit
> guests, I don't see a problem with it being auto-off for RME guests.
> 
> I do wonder if we should change it to an OnOffAuto property, just to catch silly usage.

I'll look into that

Thanks,
Jean


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF885EE329
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 19:31:07 +0200 (CEST)
Received: from localhost ([::1]:43024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odatm-00006s-4P
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 13:31:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <awilliam@redhat.com>)
 id 1odakw-0005Qm-JN
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 13:22:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <awilliam@redhat.com>)
 id 1odakr-00081V-E8
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 13:21:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664385712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LDwROmfkxGv17dJGybdu4VJ1CelkqKakDb5EIIMnAUo=;
 b=ZSJBDMhNTW4W9XGTzDpokqnoKo2cRbpYmz3bny+CSRM8IaTKeahx8L4VoBsEKNq1lQSn4t
 VnDjC/Gdoib758U2Vcahd5vupV3FDeDx/WrtXWp1Iws7rK4LgSxlCtFdYCTLNZzry0DgFy
 hVGjkgvLPGaiDxBRlqfudUSXb4UKuXo=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-54-C2wuU5VcPie6CuPwR97E9g-1; Wed, 28 Sep 2022 13:21:50 -0400
X-MC-Unique: C2wuU5VcPie6CuPwR97E9g-1
Received: by mail-pj1-f71.google.com with SMTP id
 u6-20020a17090a1f0600b002039826d478so1329613pja.4
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 10:21:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date;
 bh=LDwROmfkxGv17dJGybdu4VJ1CelkqKakDb5EIIMnAUo=;
 b=myISbXVRRkkCM/CJqQE0WLX2DVvXE6M8mfwQZURKOiBo7qhkpAX+8UWaYPFFGhiAWT
 lTOdcsPS8AzlHH3CJVxBxV/vuk694IQbsfbRs0YJwVNe77Hie1zvVCfVN4meiJ3kuAhC
 MQpSwHAIP/C/dKJptbUNGdVgHSBk+sHhqShrF+dbSrPzmhCz8C/sKIGKZMFxoElxiHEq
 nXcULM2BspyI92mycg3AYH+q5iZc4/5E0sqCNrFpZ8bi3798zfL2L9CBIRru2QlV+Pzm
 oLF4yoa7mKC2JBitNuCC+bdPVraGsB024WvtLcpqM65prczzOGwvERPYSoKeP5+Q7FfK
 MvWQ==
X-Gm-Message-State: ACrzQf2jFx1TIZ4aq9snbe7lM68z/rxpAJ4R88uvR8DmZXk+gzHPpG8x
 qNk0E0NTQghpqG6GpUU7By3zyvonnwbEszbDCtapsFv7W0Z1C2x9za6oib4UIjdTlmWJIR45m9m
 jUbh3E3kSyZ5/gw==
X-Received: by 2002:a17:902:b10f:b0:179:dee4:d2c5 with SMTP id
 q15-20020a170902b10f00b00179dee4d2c5mr847886plr.130.1664385709774; 
 Wed, 28 Sep 2022 10:21:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6bqk07QQjZQR4aPTXHaKHP/bAbV+8sIIbnsCb5QCLSRtLlNn073qsrPB7WKvzZmLP22dCJgQ==
X-Received: by 2002:a17:902:b10f:b0:179:dee4:d2c5 with SMTP id
 q15-20020a170902b10f00b00179dee4d2c5mr847868plr.130.1664385709556; 
 Wed, 28 Sep 2022 10:21:49 -0700 (PDT)
Received: from t16.happyassassin.net (d172-218-245-5.bchsia.telus.net.
 [172.218.245.5]) by smtp.gmail.com with ESMTPSA id
 z27-20020aa79e5b000000b0053617cbe2d2sm4299212pfq.168.2022.09.28.10.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 10:21:49 -0700 (PDT)
Message-ID: <73db038d24e8b631e208a0f9946d004c24b6d32b.camel@redhat.com>
Subject: Re: qemu and -vga vs. -device
From: Adam Williamson <awilliam@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>, Gerd Hoffmann
 <kraxel@redhat.com>
Cc: qemu-ppc@nongnu.org, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Date: Wed, 28 Sep 2022 10:21:48 -0700
In-Reply-To: <d8f07d3c-933c-adbe-8f83-08a9f45ba631@gmail.com>
References: <b773b085e1a3bda7aae1b6498216c416b30843bc.camel@redhat.com>
 <20220919044209.u7iy4c6zaibgtlpc@sirius.home.kraxel.org>
 <3aae1641f95503b40341c1130194a19e5e156b51.camel@redhat.com>
 <20220926092649.yjly7pkejttcqdlc@sirius.home.kraxel.org>
 <c6897368-1d0c-dca9-218c-91709a4b27fc@gmail.com>
 <c54fcd41ece548c72e9058300d0fc19f022cd7f0.camel@redhat.com>
 <d8f07d3c-933c-adbe-8f83-08a9f45ba631@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.0 (by Flathub.org)) 
MIME-Version: 1.0
Received-SPF: pass client-ip=170.10.133.124; envelope-from=awilliam@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2022-09-28 at 06:00 -0300, Daniel Henrique Barboza wrote:
> > Note, it looks like I was just a bit impatient in my manual trials;
> > looking at some jobs that ran today, they did eventually clear to
> > the
> > Fedora installer GUI after about 90-120 seconds. But they
> > definitely
> > don't show the bootloader (which our test system expects to see, so
> > the
> > test fails). When run without the `-vga none` part, the bootloader
> > is
> > shown at the same resolution and using the same fonts as the OFW
> > interface.
>=20
>=20
> By "bootloader" you mean grub, correct?

Yeah, exactly, the grub menu. On our installer images we use it to
offer various choices (install, run a media check and install, run
rescue mode...)
--=20
Adam Williamson
Fedora QA
IRC: adamw | Twitter: adamw_ha
https://www.happyassassin.net




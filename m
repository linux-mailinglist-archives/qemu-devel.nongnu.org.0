Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD356FA758
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 12:29:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvy6Z-0000kx-4Z; Mon, 08 May 2023 06:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pvy6V-0000kW-I2
 for qemu-devel@nongnu.org; Mon, 08 May 2023 06:28:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pvy6S-0002hM-Af
 for qemu-devel@nongnu.org; Mon, 08 May 2023 06:28:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683541703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8CSQU7q8v2C6dLNLtEXDHV7t6O6HfpA/FaJMOy1UMp8=;
 b=hc5bRbrbfhKpxYPCxYz3uripxxGLHddg5mktG8Y45gGVbsT04H693zcIJaJPVHWZThngiL
 LonnSwVelEB90/ztqamr0DpPNQUuEV6Dn2OUAIQSPMSYXUrQi2bcsLLvWjcj23a7nqrU5J
 fCJkYS0PBMCNJXf+6dVIoCKXK67cHaQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-oH3ts2o7NxqldR8FIdXNTQ-1; Mon, 08 May 2023 06:28:22 -0400
X-MC-Unique: oH3ts2o7NxqldR8FIdXNTQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f41efd04dfso9214305e9.1
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 03:28:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683541701; x=1686133701;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8CSQU7q8v2C6dLNLtEXDHV7t6O6HfpA/FaJMOy1UMp8=;
 b=d91BZ5yY8LlrP+lr/fbmgBNNhBbGudHnIgbloYRCms7/efKonwgmGofmFxbYVJV39V
 /ddZHxTKiGb+BhvluCOJ3lv9oFjqiPH2Xa1Ir0+UtL/ZPlWNav/W878f4K1RKwtdsQ8t
 Pz/2r9DZMOC5mAh0Ts2lLr//M8bkJB4L2lFEHehdgOAeqV8Y5EqGkSofvit8MWH93pov
 ttcx+D2yyQMq7iSaZYkfW6jLReTP/CsLMlyj/nrnm4FmIMt/tispboLLoiTHj2pf8ht+
 SRnUZIrTls1KB7Nsvr7PibzWwpH1SsKFwp/TPtfW3RiMqRZChS2bjNIkGzkh5h5DQldO
 XR1A==
X-Gm-Message-State: AC+VfDxeYMdjJVJBhKMbvgZ4gVRQzK5Vf7krFBVJCZkQVibzcnQe9Urd
 QuMXsmGyZ6bWu5dvWEUqLSvMcHNUahK7lkz7S2SGC31tNsLc5We+SvnPtYhFA+UeMya7E1aD02p
 rCiTCC7764EFxKNY=
X-Received: by 2002:a05:600c:2213:b0:3f4:1cd8:3e99 with SMTP id
 z19-20020a05600c221300b003f41cd83e99mr4114594wml.28.1683541700824; 
 Mon, 08 May 2023 03:28:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6LrBXlhbK3WGJmJVumBMNzxItSpD7PJFq96Z8VFTd52yyQJFrTO8g+YMyK8+sVcofw6wnWog==
X-Received: by 2002:a05:600c:2213:b0:3f4:1cd8:3e99 with SMTP id
 z19-20020a05600c221300b003f41cd83e99mr4114584wml.28.1683541700500; 
 Mon, 08 May 2023 03:28:20 -0700 (PDT)
Received: from redhat.com ([31.187.78.15]) by smtp.gmail.com with ESMTPSA id
 d6-20020a056000114600b00306344eaebfsm10914024wrx.28.2023.05.08.03.28.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 May 2023 03:28:20 -0700 (PDT)
Date: Mon, 8 May 2023 06:28:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Marcel Apfelbaum <marcel.a@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: missing boot rom: is it really a fatal error?
Message-ID: <20230508062407-mutt-send-email-mst@kernel.org>
References: <d6f3e06c-ee84-5101-c583-220aa90c0c12@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6f3e06c-ee84-5101-c583-220aa90c0c12@msgid.tls.msk.ru>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Sun, May 07, 2023 at 08:56:23PM +0300, Michael Tokarev wrote:
> Hi!
> 
> In old good world ;), there was qemu which didn't require boot roms to be present
> for all devices for which bootrom file is defined, missing rom was just a warning.
> But this changed in 2014, 9 years ago, with this commit:
> 
> commit 178e785fb4507ec3462dc772bbe08303416ece47
> From: Marcel Apfelbaum <marcel.a@redhat.com>
> Date: Mon, 27 Oct 2014 19:34:41 +0200
> Subject: [PATCH] hw/pci: fixed error flow in pci_qdev_init
> 
>   Verify return code for pci_add_option_rom.
> 
> where inability to load rom file started being treated as an error.
> Up until now I didn't even know about this change, until today when someone bugged
> me about non-working qemu on debian, due to missing network boot roms (this a
> packaging issue due to me being unaware of the above change).
> 
> What is the reason to require boot roms to be present and throw an error if not?
> 
> I'm about to revert that old change on debian, to make it just a warning instead
> of an error (the code is different now, but the same principle applies), - because
> I dislike dependencies which are useless 99.9% of the time and are trivial to
> install when actually needed.
> 
> Thanks,
> 
> /mjt
> 

I advise against it.
If you boot guest on a system with boot rom not installed you will not
be able to migrate to a system with boot rom installed.
why not? because we don't know how big to make the rom BAR.
And users will not discover until much much later after they have
painted themselves into a corner.

-- 
MST



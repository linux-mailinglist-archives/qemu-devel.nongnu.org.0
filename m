Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEF82BC065
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 16:59:42 +0100 (CET)
Received: from localhost ([::1]:36452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgVIb-0003RW-9O
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 10:59:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1kgVHj-0002w3-Bc
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 10:58:47 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:43146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1kgVHh-0003q7-4W
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 10:58:46 -0500
Received: by mail-ed1-f65.google.com with SMTP id q16so12615896edv.10
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 07:58:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZswFCGWIYFjeBvT7IfSVHRjlfwFAnDSv9e0QLE2Oaqw=;
 b=nm5we5uPPAAEvpdRKX1vdd5iuD9fU/6XbU9WWv+m2WUqcuerL+FK3aGpWlVl0Il5zF
 SecpGyCGwylUc11oGYtS+QcPz+FTCsUzeMpVUn/8mV0lOFx2ntPgdBFIxJOZdeBN5649
 3HYqlNelilje6pt0YYIiVHs1W11ZRD4dfkoQ6Ocf5owPSt+HFbpJ6Qel92g8wnv32212
 HWg9F/Sc9JsrZNk7pJhVZwP/Fw/Qg035mTEoIjEYpBjZSOquylIAcC2sIlWRLRiFUtq7
 FNGvhevfqW3ad8/LelVlZDozbkqLRqJarNpxqLElG0ELmPJZYuBaS+SJTKGK6U1gpgR/
 PfEw==
X-Gm-Message-State: AOAM530cgsnWGczNm2kP5/BlstX1RfRg4/SPkDWNr2l1UI77m/dW232V
 LhguCMAtNLzWUy7qTejHkXM=
X-Google-Smtp-Source: ABdhPJxEHfcRvLlBC3/eJN+leeBdUAnnAjRNY4D7obxPL6laHamXJlklXOreXEBhGwUkbIssjFzjMA==
X-Received: by 2002:a50:a105:: with SMTP id 5mr39062270edj.165.1605974323389; 
 Sat, 21 Nov 2020 07:58:43 -0800 (PST)
Received: from thl530.multi.box (pd9575ca7.dip0.t-ipconnect.de.
 [217.87.92.167])
 by smtp.gmail.com with ESMTPSA id c8sm2641857edr.29.2020.11.21.07.58.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2020 07:58:42 -0800 (PST)
Date: Sat, 21 Nov 2020 16:58:39 +0100
From: Thomas Huth <huth@tuxfamily.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/m68k/mcf5206: Don't leak IRQs in mcf5206_mbar_realize()
Message-ID: <20201121165839.01380a44@thl530.multi.box>
In-Reply-To: <20201120172314.14725-1-peter.maydell@linaro.org>
References: <20201120172314.14725-1-peter.maydell@linaro.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=209.85.208.65; envelope-from=th.huth@gmail.com;
 helo=mail-ed1-f65.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am Fri, 20 Nov 2020 17:23:14 +0000
schrieb Peter Maydell <peter.maydell@linaro.org>:

> Coverity points out that the realize function for the
> TYPE_MCF5206_MBAR device leaks the IRQ array it allocates with
> qemu_allocate_irqs(). Keep a pointer to it in the device state struct
> to avoid the leak. (Since it needs to stay around for the life of the
> simulation there is no need to actually free it, and the leak was
> harmless.)
> 
> Fixes: Coverity CID 1432412
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Thomas Huth <huth@tuxfamily.org>


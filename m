Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBEC6F652E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 08:43:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puSgL-0003lF-Cq; Thu, 04 May 2023 02:43:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dkovalev@compiler-toolchain-for.me>)
 id 1puSgI-0003l6-Hj
 for qemu-devel@nongnu.org; Thu, 04 May 2023 02:43:10 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dkovalev@compiler-toolchain-for.me>)
 id 1puSgG-0006nW-8k
 for qemu-devel@nongnu.org; Thu, 04 May 2023 02:43:10 -0400
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4eff50911bfso107141e87.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 23:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=compiler-toolchain-for-me.20221208.gappssmtp.com; s=20221208; t=1683182583;
 x=1685774583; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IbIZK2vQrvIq+rkE6352SYpKeFdsSPYl10VyCPhZbAE=;
 b=F3dtKJpQXIFoHGpqunLRz65XLs74h0jInCsESiwJQfPO5D9cqqa/u5152R71GCvS4o
 79QqGQpA4LuXSLJP6YcO9RvEoAD5FX4gUMZI7tWxwj7ljAhEJNL44Uvi1SuCyE5seU3V
 oWkaT2hgWptx+F82Kt9uoCkgGnaej/ypxcnaHLkvEYQOdW25ia1Kl+wAqDhUdutI+q9s
 Lr7ayf0hagnRXBXUI87nSunxpsj+gor26fpQO00nIZsQev/lQ3UDqngI7E+jcY9lCMxB
 OHqz1Tkd6dIP5tl7Hp9AFjgdXJuutJhWRmCYoXzmgs46M0zi4f+1GG/f3bqgxPTXScNw
 Quxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683182583; x=1685774583;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IbIZK2vQrvIq+rkE6352SYpKeFdsSPYl10VyCPhZbAE=;
 b=bqeYPPAazakwLmeQobAmkhQgfc/rTxif4vTUypFOcO7GwNIDGrzmNfOY8KEz6PVM/j
 pfhG406nfc8noInJrnD49MPLspktWmHcSoHF/ZZaFVcqzCJa61lseyBxMspg6iYOKzAp
 ut2GH7Xcn59Kc8xm4YEu7DllqMH2PBzcPpOp3LK88mpudP1n38XKYANXnj+ECuMI/icB
 nZHJuOVgfljOFn0P5j3jraA7rRGhja+1/l+ubwewsTBCHo8IHWq0Q8FWwlwEZoyqLQdz
 YAietlMt1t/9WthxL2CQuvdX582wsD415s4cAsbJ5R7XI+d7hl5xy2YX8Zcpmzoc1HrS
 a+kA==
X-Gm-Message-State: AC+VfDzz09Pz9RIUlHqZ+eE0s07jJ7MfBL13wYcDIhvt7cao7HnJDx5P
 qOnp8YqrL1K4Ayjn7uUAjORVXA==
X-Google-Smtp-Source: ACHHUZ5RgfMmrsos+DnB7/nYw4IMh3wS2dmVl5KiReVQnh40BsJ8VTilKyTNvlTB0dmhVvRAbIogTQ==
X-Received: by 2002:a05:6512:484:b0:4dc:84dd:eb91 with SMTP id
 v4-20020a056512048400b004dc84ddeb91mr1442762lfq.22.1683182582713; 
 Wed, 03 May 2023 23:43:02 -0700 (PDT)
Received: from arch-pc.localdomain ([89.19.180.108])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a197004000000b004f11de71aa6sm2259231lfc.95.2023.05.03.23.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 23:43:02 -0700 (PDT)
Date: Thu, 4 May 2023 09:43:00 +0300
From: Daniil Kovalev <dkovalev@compiler-toolchain-for.me>
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Philippe Mathieu-Daude
 <philmd@linaro.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH] linux-user: Fix mips fp64 executables loading
Message-ID: <20230504094300.5125dc11@arch-pc.localdomain>
In-Reply-To: <28135abf-407f-2d62-7101-ab5488a8c61b@msgid.tls.msk.ru>
References: <20230404052153.16617-1-dkovalev@compiler-toolchain-for.me>
 <28135abf-407f-2d62-7101-ab5488a8c61b@msgid.tls.msk.ru>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2a00:1450:4864:20::12d;
 envelope-from=dkovalev@compiler-toolchain-for.me;
 helo=mail-lf1-x12d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hello,

On Tue, 2 May 2023 14:41:31 +0300
Michael Tokarev <mjt@tls.msk.ru> wrote:

> Is it a -stable material?

Yes, this `else if` branch is present in the latest linux-stable. It was
actually introduced in 46490b572544fa908be051f7872beb2941e55ede in 2015 and
never changed since then. I suppose that just a dummy typo error occurred when
copying that to qemu-user loader: this piece of code never changed in the linux
kernel since initially committed, so this particular `else if` branch just
seems to be forgotten when copying.

Best regards, Daniil Kovalev


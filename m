Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8441E60038F
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Oct 2022 23:58:11 +0200 (CEST)
Received: from localhost ([::1]:58192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okBe5-00080a-Fa
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 17:58:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1okBc7-00064X-Ay; Sun, 16 Oct 2022 17:56:08 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:43889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1okBc1-0005nd-4t; Sun, 16 Oct 2022 17:56:06 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 r3-20020a05600c35c300b003b4b5f6c6bdso8632126wmq.2; 
 Sun, 16 Oct 2022 14:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RmUvNVt3cWeK/FAqv9JdsMt5wGe1852dfTJg2QOE830=;
 b=f5SAbn6J1SekRPqcJIOlUmYfGEXplhJ1kK3pvaTe+jWl9rKs22/nQuoO9OWqMWTWQ0
 xdKWPlJlheK4odcvoCTQABqa81I8JiYZgqqq9aDtWH6qEd1HokTP3Y65ixnXCeTkK6iE
 PASm7bLeGkT/mJVDWJmio7z33+q3NKKTT9bFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RmUvNVt3cWeK/FAqv9JdsMt5wGe1852dfTJg2QOE830=;
 b=Ls/PmXEhgN5jSD8J2Skmgxs4m8WsYDrU2TGye2VXt+MXqT8Uh0wEWPGD24lqs191um
 sZRXxQOIiD4v3jtlxiogk/ky6g1ocY4/aXmVFY6en1OUsWfFh9okPHHp4WcC5P6KScYA
 d78L+itXFSrvjWjh7pNA/6hwP+JuGeblqT74WAlvDqk3gMVKczLvKXbMkKfG+n2i0Hzj
 pS+PBbsse2d0uwjUxsz0vjsYBs9381vfWQX6B11y9pDFXW3cl2PzTwVEL5RorKkfkn7/
 94maCNSPc7DZ9/CXaispZq4rjQMRuus1SGP1BD0mjIzRns5hX9Hx7TmDDZ6fe2cdffVL
 zayA==
X-Gm-Message-State: ACrzQf0Ulj30fPeEXQ3Y4wGhoqA02dwzlEXp29W1cpKpNEuKFJaPApz3
 +hGAwuC36Azp3GmrANrCERupsD10+Uw0VuDFv0s=
X-Google-Smtp-Source: AMsMyM50C295L5NjoCJul/hu7tKSoOoXOhRlv5Xiga9jdp77zzWR77a8Hks4Op0VmXRlQcDeWT7JQe6Xh6EVJ3saXBo=
X-Received: by 2002:a05:600c:1d97:b0:3c6:bc3c:9890 with SMTP id
 p23-20020a05600c1d9700b003c6bc3c9890mr17931851wms.190.1665957358216; Sun, 16
 Oct 2022 14:55:58 -0700 (PDT)
MIME-Version: 1.0
References: <20221013161241.2805140-1-clg@kaod.org>
In-Reply-To: <20221013161241.2805140-1-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Sun, 16 Oct 2022 21:55:46 +0000
Message-ID: <CACPK8XdGvayUXXog0mWAJm7V3fBJ0jUJ7pr7SbCT4v2=p63NFw@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] m25p80: Add SFDP support
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, 
 Alistair Francis <alistair@alistair23.me>,
 Francisco Iglesias <frasse.iglesias@gmail.com>, 
 Iris Chen <irischenlj@fb.com>, Michael Walle <michael@walle.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=joel.stan@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Thu, 13 Oct 2022 at 16:12, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Hello,
>
> This patchset adds support for JEDEC STANDARD JESD216 Serial Flash
> Discovery Parameters (SFDP). SFDP describes the features of a serial
> flash device using a set of internal parameter tables. Support in
> Linux has been added some time ago and the spi-nor driver is using it
> more often to detect the flash settings and even flash models.

Reviewed-by: Joel Stanley <joel@jms.id.au>
Tested-by: Joel Stanley <joel@jms.id.au>

Thanks C=C3=A9dric!


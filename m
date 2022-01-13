Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7353548DCB1
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 18:11:19 +0100 (CET)
Received: from localhost ([::1]:47894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n83d8-0008Ee-1M
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 12:11:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n83TJ-0007xz-Ah
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 12:01:14 -0500
Received: from [2a00:1450:4864:20::42d] (port=41935
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n83TH-0005go-5G
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 12:01:08 -0500
Received: by mail-wr1-x42d.google.com with SMTP id v6so11261481wra.8
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 09:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TckEmQgUy7GvBfpLfv65VlVT/rlMlwphu8gr19zZROw=;
 b=TuBPU5cs3udMh4eCUNMHVI7x9dqJR4BQUFH6WbhxVygsUF+L3le4wHQcejSMRCcrSx
 dlYw3OLc1AJiQSh0jDuHi/uIqLmIgJwBcr6rwLe4emRx6n7NdDkM9+yoI/K+QI5JaLuc
 Lxh3zcZXmlbFhuW8FFpqZ6u5qBgdAmnhvKTs1f/WIiyYAszzNc6zNkIPVQR6+pPixaX9
 yW2QTMTFf2VmeuAmZ6fiKb+Z+NNTQzDN98gzPRf5HZ6wsfgtDaeTMPecld/oVQ3E6Fq9
 lJ7lZ5hjl53TdZYPW7saDCPFP1ComWH8hfFe56dKy7gxX4hTIZqXEjax4PCBDdB9VCeo
 SuCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TckEmQgUy7GvBfpLfv65VlVT/rlMlwphu8gr19zZROw=;
 b=0mLcpjMT7JKjI52O7P5EGxOkc6pH1yuiR+xbyFPDNhGNGgK+Oz9gkQrDJpBF8d5/sh
 kl2cnCtlViYXBJEIXxbBBj0vdaqRfWrpIs9iSupyIoxbz3jUyu5WznBIuz2B1K9c7B5y
 qB96aONWHiKohUFDWPSGPuu2PZ+CqY3NMhPNRmNNYKJqcmr5YDuqLTrOOA0odsVWLlz1
 +3q597H2rtSTtEU2PgAWiwr3bcZglRKCdRowaCmqT7vzXCoy9u/+UsifqTIKAfnjrq9B
 8iStIF6d/VSfN1Dc4tsDx87HUny6EM3jI7D7zkYekdTMUsx+5pucNMZfo6RmPivuflSF
 Na5Q==
X-Gm-Message-State: AOAM5323IERnTh9cvgzJuX7kB04l9JuRWiKSuLgpJOYdvEu9iQbyOvL2
 FfjWj5eE0QPJ8Q89cJlaaUmgFMSzn6+RkR3PeiUp8A==
X-Google-Smtp-Source: ABdhPJzMJ58EhGPGmGmRwE79EWhddTp8sfdj/CQKNo5AzBSNgR6K3skMRzZXOw2HvdrypwizAKAWQAlgKY/wmycixsM=
X-Received: by 2002:adf:e907:: with SMTP id f7mr4734318wrm.319.1642093265617; 
 Thu, 13 Jan 2022 09:01:05 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-5-imp@bsdimp.com>
In-Reply-To: <20220109161923.85683-5-imp@bsdimp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jan 2022 17:00:54 +0000
Message-ID: <CAFEAcA8v68NXB58rvjH-D_JZCrAqz3ep2iZgpeqjAL16cf1ZFA@mail.gmail.com>
Subject: Re: [PATCH 04/30] bsd-user/signal.c: implement cpu_loop_exit_sigbus
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@freebsd.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 9 Jan 2022 at 16:26, Warner Losh <imp@bsdimp.com> wrote:
>
> First attempt at implementing cpu_loop_exit_sigbus, mostly copied from
> linux-user version of this function.
>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Kyle Evans <kevans@freebsd.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 758214A8353
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 12:51:50 +0100 (CET)
Received: from localhost ([::1]:58796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFaeT-0006iM-Ji
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 06:51:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.griffin@linaro.org>)
 id 1nFaWn-0002zh-0O
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 06:43:56 -0500
Received: from [2a00:1450:4864:20::32d] (port=43797
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.griffin@linaro.org>)
 id 1nFaWj-0003KZ-4U
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 06:43:51 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 k6-20020a05600c1c8600b003524656034cso1635369wms.2
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 03:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=foYFvqTmGZu2tjPqIbab/RjvNZrrTwY6/MSbDpDbhi0=;
 b=JJ7nTzyi9/q2pJw31SzQFntTHPwDZ6sBY7XCna8rZu46/gipIv/LA0mw5wu0e886nK
 bZeAlR5gdK6jZB2PltLQ4dwcp4rn8KW1oDN+363qOibOCivMtMT3nWKgyjc+JoMYaVM7
 ajXWM3bUtcdhBt9kw2y7vRlgtoBKv8TwHxDh+7TdY77A11HurNhLTF1KvFlcOHhQIJEd
 Md5w7r9jri5dJlVSuhKBu1ZWULv4LREm9HSmhi1i1RY5brRAyKT3qAE1Up51WzZRDW1P
 A6/4OSyHEv2mvkK3/nbozwW1HzFN84aF7j8FPNTV4LFn/7z4UubKtfI5VhzgHH7srw+9
 JnFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=foYFvqTmGZu2tjPqIbab/RjvNZrrTwY6/MSbDpDbhi0=;
 b=oj4kk5gZjZ7TMq5UAdKaj8yrJnLsqWaI+buh0iV9STVZB1lRLf+2EEDUhXEHLf50En
 dW4UKOO9ZrgUq5gqU9TNzTlc3xM+Qpb6tGoD9BttEbJv1FnS8ODvP/6yWRgL52u9M9pu
 dP5/BSsqOWq8nkqj92BLMqJpIoYDkuzFEPca725UrUaxPrVglQ17Y2XIF5iBgOEwQFir
 Qy5Po7p7Hwvas8LYYGr+iJQBh+9DoVJ4bxvhlxGW/Y5LuvhzzMayMciOWMUJ9aohYrXU
 X0M+85zdq//2t9XEzcYmVNYhLkH0Il4ASyrwfzz2eps/vBvy/WMVT18u0c2Yo6Q0QB4N
 1BdA==
X-Gm-Message-State: AOAM530/ie62+ZuTi+/2/g42dZAYnDx3O+YComz2HfioCz2v3IQGOisX
 kW5V4iFwssogT5CrPy+66M7k3w==
X-Google-Smtp-Source: ABdhPJx2PKcjTeVtJvsmbU1Oyb05eClEs7So8nXwsLcefayV2Ca2YAsU/zGCnLoRkx1TXT7j5BssrQ==
X-Received: by 2002:a1c:4e09:: with SMTP id g9mr10081378wmh.188.1643888623519; 
 Thu, 03 Feb 2022 03:43:43 -0800 (PST)
Received: from xps15-9570.lan ([85.210.223.90])
 by smtp.gmail.com with ESMTPSA id k32sm8992218wms.14.2022.02.03.03.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 03:43:42 -0800 (PST)
Date: Thu, 3 Feb 2022 11:43:40 +0000
From: Peter Griffin <peter.griffin@linaro.org>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 0/8] virtio: Add vhost-user based Video decode
Message-ID: <20220203114340.GD371411@xps15-9570.lan>
References: <20211209145601.331477-1-peter.griffin@linaro.org>
 <87k0f6b5nh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87k0f6b5nh.fsf@linaro.org>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.griffin@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marcandre.lureau@redhat.com, stratos-dev@op-lists.linaro.org,
 qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

On Tue, 11 Jan 2022, Alex Bennée wrote:

> 
> Peter Griffin <peter.griffin@linaro.org> writes:
> 
> > This series adds support for virtio-video decoder devices in Qemu
> > and also provides a vhost-user-video vmm implementation.
> 
> This brings up a bunch of failures in CI:
> 
>   https://gitlab.com/stsquad/qemu/-/pipelines/445691849/failures
> 
> A bunch are probably solved with masking the build when VHOST_USER is
> not available but there seem to be some compiler warnings as well which
> are probably worth looking into.
> 
> Sorry I took so long to get to the review!

No worries, thanks for reviewing the series :) I will take a look at the warnings in the
link above and fix them up for v2.

Thanks,

Peter.


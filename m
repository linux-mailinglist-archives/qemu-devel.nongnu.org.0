Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE9B48DF3D
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 21:55:53 +0100 (CET)
Received: from localhost ([::1]:52070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n878S-0004Zz-2T
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 15:55:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n86vd-0000jM-Ii
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 15:42:37 -0500
Received: from [2a00:1450:4864:20::436] (port=39889
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n86vc-0007Pt-3a
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 15:42:37 -0500
Received: by mail-wr1-x436.google.com with SMTP id s1so12295837wra.6
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 12:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CoaLu43elccALwCHXzpuO4nzUYickoBqp5U/up3e2gU=;
 b=cH6Dmq31LJrj4KmGmpA/dHBWzPb6210f9eQnfmtql9jlSei42N6ibroS2bcg2EutnV
 mGaPjAqIGak4gLP2rt0ahbXLVXtu3v1X8+wfYd1Gj3zAltzBhQ9H+4cJYYAWw33m6Psx
 +pAHkhSgucSsrmm3Lk20HgG4xEVEavH1UCglZkEJzHXYaYLE1Twt1BBk80LVHst517le
 soBT1iEKbQNxpSgZjOorfY0IsC3LjYnH5Hol54HpnRgJlmttFLZa6Ge6rhrxC5fQICIx
 2tLdoJcD5RYReOJr4+uyigpsU3j/zkjmFtAfvV623WyrczjMU2wP+EdU7ZqwWY4AOA6s
 Gh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CoaLu43elccALwCHXzpuO4nzUYickoBqp5U/up3e2gU=;
 b=XjenlvF6hT62u4A3qGuHERWa4ODpC7u10jbUZoxmvN3XUrOYOSh/CG+XN4PfQY7o6D
 gc9hOcJpEauilc5gaVWv30lYqiwpm4dH3b0i0YOj5qxH+Cqz4JMkY5yDuww4USHJUd8Q
 QqJXItUN5rCNYLW+OX+MqMSUoSPunvgF7GnQ/qS3zYkFaVS9IWJJSeGYIq4564juHu7G
 3p0Ju16tSNpBTEWToQHQKEulhWP6p3DS4YUFvuKfO9oxsFxdp4y8bku1NCZdUSdfwrY7
 ZhyEH4IB03kADcLwc70DEgV615lmX5hiEELmzIEAjP6xPfTxHVgVj4uykjLAxJlothuU
 FOmQ==
X-Gm-Message-State: AOAM5329yx3QbM113VQeJpHFBbVTLJSyuiOFW3sQg52y/Qhaz32VyDxV
 eRNwb7rrFB53WCljNzod+SQ6KcU7qCiX8KD4vUJimg==
X-Google-Smtp-Source: ABdhPJwaf9xs7tGxsl/jFLR8tpi9IUW/vECxILxbZHhgPTcbvWvpgtvr5v4sJwySdcUZi4kky0kgCHccnDNcj3E8/GU=
X-Received: by 2002:adf:ee0e:: with SMTP id y14mr5643995wrn.172.1642106554746; 
 Thu, 13 Jan 2022 12:42:34 -0800 (PST)
MIME-Version: 1.0
References: <20220113194452.254011-1-dgilbert@redhat.com>
 <20220113194452.254011-4-dgilbert@redhat.com>
In-Reply-To: <20220113194452.254011-4-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jan 2022 20:42:23 +0000
Message-ID: <CAFEAcA9jCftRcZN4HGgKP=d-ZFiBKfCp=KmRRSv2S=+5Wgc-RQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] migration: Perform vmsd structure check during
 tests
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: lsoaresp@redhat.com, marcandre.lureau@gmail.com, qemu-devel@nongnu.org,
 peterx@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 13 Jan 2022 at 19:45, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> Perform a check on vmsd structures during test runs in the hope
> of catching any missing terminators and other simple screwups.
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  migration/savevm.c | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


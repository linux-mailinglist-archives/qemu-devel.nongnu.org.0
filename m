Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A965489F55
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 19:37:55 +0100 (CET)
Received: from localhost ([::1]:58174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6zYI-0006pP-ES
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 13:37:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n6zTG-0001HS-R5
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 13:32:42 -0500
Received: from [2a00:1450:4864:20::433] (port=33328
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n6zTF-0005WD-3D
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 13:32:42 -0500
Received: by mail-wr1-x433.google.com with SMTP id r9so26715337wrg.0
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 10:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wfJmC+UfR/XAciMGkW2brPXHn1ce2agj9EgCQW+xx3Q=;
 b=gd+kiw8OPlItMoqZC716gmDPukn+f8b+Fq6AG3tIaGyS7PKykX4jTJhLFgTWXNKC22
 TZa2yiv5AJdb6b8I6Ar+wLzox+SLfrNF3YiNcmxs4yzsLYlj597eRD/mOpocRiTro7ec
 34IkyCDacLpIdiy9kPnpWLKjCRpll+e/yIqnMMsnjQ8vCgaRZ2B81BcuU5wcMY3qc0MT
 RuN8+rAb0folzJwOu3uX+dsD2q0kd1pbchcJWN3AGDL0yJc0ebKDw6d136ORr6bsJhj1
 GJ9P7zYSxbAEobPFrYa8K8aLDvb6tji2V6F7upCx/rGuOOfGJEegnPSJwgJFM5jjikSV
 wHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wfJmC+UfR/XAciMGkW2brPXHn1ce2agj9EgCQW+xx3Q=;
 b=5E1r1cNMWflBmBE0bWNwY4oXIg/meV9V6PtqTqQxQUE8dLJRZafE9HnEjRKIztbKiJ
 0ZtOsFoNeqsT+4SxuOXCC402qs9CBduZXZxPaDKyt1TNinC/yIT0PvRTg6BUQtFzYBOP
 8DkQNNTnCX2eoumQaWZ+gyZpB8nLdNaOXzxoRiy5a1oFG4JRiNPLqz+YFHRtgEl3p2R+
 4cH/ZT2SW2XC4Txd7eHE3bilDz843Y7RoJOpoD/7zkPxxdnmmUiMfO54yAGAHxUO/Uin
 h6BsGWVKxAePP3OqocdaJjmJ8dh8Y52wDzOP9QX3mrRcAHXB+fQbyyJH9m2P/tF4sbss
 wTVw==
X-Gm-Message-State: AOAM533UcfOZ0N+wbEQkdOraFJZ1qASKD1OeCy4CwJH6HSV6CPA04XLZ
 aXGzUfhDrWg3wp3L6bcsnn86UgSplqcs4MO1PXZxcg==
X-Google-Smtp-Source: ABdhPJw8Yl/pq+JUByde7qGcg9e3GjEreoXoBxc3SOWghWnLwktIPA5OyS91LNu5H4/mgcFdsuL6qwTWcleyrGNDSMI=
X-Received: by 2002:a5d:6848:: with SMTP id o8mr792883wrw.2.1641839559078;
 Mon, 10 Jan 2022 10:32:39 -0800 (PST)
MIME-Version: 1.0
References: <20220110071547.195669-1-mst@redhat.com>
In-Reply-To: <20220110071547.195669-1-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Jan 2022 18:32:27 +0000
Message-ID: <CAFEAcA83V+pCd-n0DW4XVJc2-x87UptX+p9fSRnvOjU4VzC5Ag@mail.gmail.com>
Subject: Re: [PULL 00/10] virtio: revert config interrupt changes
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 10 Jan 2022 at 07:16, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> The following changes since commit ca745d2277496464b54fd832c15c45d0227325bb:
>
>   tests: acpi: Add updated TPM related tables (2022-01-07 19:30:13 -0500)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
>
> for you to fetch changes up to ab9f51a29ca84cfcecc2d18574794b650ce4bb28:
>
>   Revert "virtio: introduce macro IRTIO_CONFIG_IRQ_IDX" (2022-01-10 00:47:56 -0500)
>
> ----------------------------------------------------------------
> virtio: revert config interrupt changes
>
> Lots of fallout from config interrupt changes. Author wants to rework
> the patches. Let's revert quickly so others don't suffer meanwhile.
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Looks like you forgot to add the Signed-off-by tags on these commits,
so the check-dco CI job fails:
https://gitlab.com/qemu-project/qemu/-/jobs/1959092585

Could you fix and resend, please?

thanks
-- PMM


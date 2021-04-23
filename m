Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E73133692FC
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 15:24:20 +0200 (CEST)
Received: from localhost ([::1]:60840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZvnA-0006ni-19
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 09:24:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZvl3-0004xq-Fv
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 09:22:09 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:42531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZvkx-00049v-ET
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 09:22:08 -0400
Received: by mail-ej1-x632.google.com with SMTP id w23so58092335ejb.9
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 06:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LIZ3yLB7XNQvuDaOAwAlvalBiV7I/3sIK0WZvkHlMis=;
 b=pc7nacxxYs6dQxFT24rHQa7/mNyeIs5qF0k9aHM6GaMBSOj7B6LSfD7WsU4Qsntinu
 ykdYTNfSmGzAIw7gdCyA7tj6Wcq2eIfFx0520lj8yCCM7lfJxARk7JDGqHDor1wykkT+
 EPtLKic0yVgdqTCzG546okpO3qWjcF+kGzLJ6uZ1cn+3+T0Ddc8sNCDcEcnKR7tXZrKv
 lqToN3JKe9LBHS+Y7PFzz4ALZyE+OvM6JRAQKdWh8bueKHBLWBDRq3vC5NI3YHyULlux
 y+hDVgO9Xi/jG/2Rvn0dRInWbM2W3oRLAAYLoP2ElHBVNOW23BHDKVd0+kRmhZyw4uKH
 YBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LIZ3yLB7XNQvuDaOAwAlvalBiV7I/3sIK0WZvkHlMis=;
 b=XoS+g4wWoTlFPOzRabKCyA1f8dBKwvrlVvb5Q2cky+K1W/2AJ7kayj8l+HLhAARw3s
 fKg4fB9W3GRyFnyW/y7iT6SBM35nU4ed2VH7LwMWkJzjGP7cF46lHQCuHmux8ndISFED
 XvxVXLkHhFpThQ4CJh/7idOjQNX0+8IOFjdOH6eTeip73Q1D+vVVvjKOA/Wo/aSTapre
 bh83EkhaVwZOdVDiG8a57tH90JxdyI4JJ2UDpeKrC2Y0Ab2uZZM+dUZmErw198wEQxNH
 8Wke7BWmwHgaAZebb7bd9v8KbxQtDIncPlLWU7UI/cF8bKKtcgw7Muq/YZjqYCsDHBTD
 fRAg==
X-Gm-Message-State: AOAM533pU3CuQ3+HEfk4mQ0jCRaLKL3SCgMcdXAJz38UNe+JWbQ6JNAS
 LRDSIYWLNylgO+ZSNYxrUIW4aHWsvux+0LVHcM02iw==
X-Google-Smtp-Source: ABdhPJwbdZg9+tIHafnsihndM72Wuj2kfw1cZukgxPinNmQ1vSO7keQTP6gOUJth+H7PZ0fIKGs88rwND4bDx82igfg=
X-Received: by 2002:a17:906:29ca:: with SMTP id
 y10mr4325721eje.250.1619184120718; 
 Fri, 23 Apr 2021 06:22:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210423052127.512489-1-its@irrelevant.dk>
 <20210423052127.512489-3-its@irrelevant.dk>
In-Reply-To: <20210423052127.512489-3-its@irrelevant.dk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Apr 2021 14:21:05 +0100
Message-ID: <CAFEAcA8xS6Hoqd+Y96FxhrDabsotYURsHHvEeN9yDLDHzzVf+g@mail.gmail.com>
Subject: Re: [PATCH for-6.0 v2 2/2] hw/block/nvme: disable hotplugging for
 subsystem-linked controllers
To: Klaus Jensen <its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Klaus Jensen <k.jensen@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 23 Apr 2021 at 06:21, Klaus Jensen <its@irrelevant.dk> wrote:
>
> From: Klaus Jensen <k.jensen@samsung.com>
>
> If a controller is linked to a subsystem, do not allow it to be
> hotplugged since this will mess up the (possibly shared) namespaces.
>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/block/nvme.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 5fe082ec34c5..7606b58a39b9 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -6140,12 +6140,16 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
>
>  static int nvme_init_subsys(NvmeCtrl *n, Error **errp)
>  {
> +    DeviceClass *dc;
>      int cntlid;
>
>      if (!n->subsys) {
>          return 0;
>      }
>
> +    dc = DEVICE_GET_CLASS(n);
> +    dc->hotpluggable = false;
> +
>      cntlid = nvme_subsys_register_ctrl(n, errp);
>      if (cntlid < 0) {
>          return -1;

I'm not sure this is right -- the DeviceClass is the
class struct, which there's only one of for every instance
of the device in the system. So this is saying "if this instance
is linked to a subsystem, don't let any *future* instances ever
be hotpluggable". I'm not even sure if it will do the right
thing for the current device, because this function is called
from the device's realize method, and the device_set_realized()
function does the "forbid if dc->hotpluggable is false" check
before calling the realize method.

Possibly what you want to do here is to call the
device_get_hotplugged() function and just make the realize
method fail with a suitable error if the device is both (a) being
hotplugged and (b) has a subsystem link; but I'm not an expert on
hotplug, so I might be wrong.

thanks
-- PMM


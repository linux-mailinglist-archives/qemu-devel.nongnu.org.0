Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F06831EB0D
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 15:43:04 +0100 (CET)
Received: from localhost ([::1]:53006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCkWE-0000Kp-9O
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 09:43:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lCkUc-0008E4-1j
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 09:41:22 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:34110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lCkUa-0001Jw-5z
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 09:41:21 -0500
Received: by mail-ej1-x629.google.com with SMTP id hs11so6068269ejc.1
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 06:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wImHOUOF05rhEmadJ/N1IrMSOrMt95O5c6FQ3Gp5v/w=;
 b=uPwzJy+JhkrG9cfLT367R2AXv5AuF+RKPmyhAFjs3wv7nxDNK3nEBvCbRI3nNkWo8J
 3gimviJJkYOH8sY6lvKlmU3kVXH6c+cCDSupiee4OpOpr+2/hU8WL6YbSi+VU0/wCIK8
 /44UGVxO8192g7Q2PzvbR/0w7IyAtU26dEyK36OH7j9RHkRkmKNXEAEEycOs1Koj1lrW
 BeBM/7AJiG639O6bdM/vcw4OF3TPcGnK0giXvlNgubHhRw6g9r6LBz+qtleAOK2RWK3t
 RrL90UGnaHtg8I//1nqss4hmAmjt8goC410K8OAxXk82+ztRl1k5MC6C8WCQqik9TQVS
 SQEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wImHOUOF05rhEmadJ/N1IrMSOrMt95O5c6FQ3Gp5v/w=;
 b=Hswd8O/pFcpJffARACUI+MM4lxmF6y4WiWt3OemPC7Oo0KDJU6jCGrXUDOrgvoo34n
 oPTPfCSofD4ze9u/QzEBTlwF9UwjVW3EwZZ60QU00AlyhY4izFKHUZ7xpeb5AjRRvpL3
 u8owMLicGrOjC5FdDsStX8l9if6wgaz9g+AHmnoiToWDFPY6N68s8QWKzYP2Gq96Lg+1
 MikSKcSWEKUl1GYBN8900qsnOvhYdW2+jsxaslxt77IpM7Ypt21g9+lF+Rqyo6EmJmR5
 +NQWWNWdq51cxv4heB3krgBIQe8RjaJ/OUVq+oZBSQjv4Qx1rJcYEBu43Rsin6x2FKyq
 2kJQ==
X-Gm-Message-State: AOAM530e3tik1zIUhG4Ws4BmOx4MJ/XkH4DbBNjkPJw5KxXzMnkRVCJM
 yCWoEQT4+9u4Kn5a0Asa4teAXu6CYEBtcGBqP8Z2Vg==
X-Google-Smtp-Source: ABdhPJwvzKd+J8wmbkAt1tdN8wR1I0HkIiNmYkd+OZJzZ474aYUZsyD5tvXG8P77AHCAoFaswPpHtqbTJInM2XkchG4=
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr4467832ejd.250.1613659278338; 
 Thu, 18 Feb 2021 06:41:18 -0800 (PST)
MIME-Version: 1.0
References: <20210218140629.373646-1-ppandit@redhat.com>
In-Reply-To: <20210218140629.373646-1-ppandit@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Feb 2021 14:41:07 +0000
Message-ID: <CAFEAcA_8sUX5nbg5+DR8Z6F3t1Y3o=tgZY56dFTKLgA7XVWOcw@mail.gmail.com>
Subject: Re: [PATCH] net: eepro100: validate various address values
To: P J P <ppandit@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: Stefan Weil <sw@weilnetz.de>, Jason Wang <jasowang@redhat.com>,
 Ruhr-University Bochum <bugs-syssec@rub.de>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Feb 2021 at 14:13, P J P <ppandit@redhat.com> wrote:
>
> From: Prasad J Pandit <pjp@fedoraproject.org>
>
> While processing controller commands, eepro100 emulator gets
> command unit(CU) base address OR receive unit (RU) base address
> OR command block (CB) address from guest. If these values are not
> checked, it may lead to an infinite loop kind of issues. Add checks
> to avoid it.
>
> Reported-by: Ruhr-University Bochum <bugs-syssec@rub.de>
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> ---
>  hw/net/eepro100.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
> index 16e95ef9cc..afa1c9b2aa 100644
> --- a/hw/net/eepro100.c
> +++ b/hw/net/eepro100.c
> @@ -843,7 +843,8 @@ static void action_command(EEPRO100State *s)
>          bool bit_i;
>          bool bit_nc;
>          uint16_t ok_status = STATUS_OK;
> -        s->cb_address = s->cu_base + s->cu_offset;
> +        s->cb_address = s->cu_base + s->cu_offset;  /* uint32_t overflow */
> +        assert (s->cb_address >= s->cu_base);

We get these values from the guest; you can't just assert() on them.
You need to do something else.

My reading of the 8255x data sheet is that there is nothing
in the hardware that forbids the guest from programming the
device such that the cu_base + cu_offset wraps around:
http://www.intel.com/content/dam/doc/manual/8255x-10-100-mbps-ethernet-controller-software-dev-manual.pdf
-- page 30 says that this is all doing 32-bit arithmetic
on addresses and doesn't say that there is any special case
handling by the device of overflow of that addition.

Your commit message isn't very clear about what the failure
case is here, but I think the fix has to be something
different from this.

thanks
-- PMM


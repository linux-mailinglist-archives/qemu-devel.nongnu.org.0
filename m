Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F55E586681
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 10:43:15 +0200 (CEST)
Received: from localhost ([::1]:44698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIR17-000104-MN
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 04:43:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oIQxo-0006b1-8g
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 04:39:48 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:41496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oIQxm-00030I-14
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 04:39:47 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id y127so17838197yby.8
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 01:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=FHdpkBuUOJNob58ME1K1WMZgWglb4BWx5RsCqArPqlk=;
 b=b1h8g+tj/x1W+zfqX4kNwk3xvP/8wCYBU+ElCHkPPN4lwI65V0ae/3cbCYJw803H6r
 PmTUEbdXQCKyC4aRu6snawXwSRrItSBAtFF/SOCpIT9LcVcG06EwPt6vLc9qTX1pL7nr
 quGOWxOQx1fYuYkZ1wYgwDXJhmhyLL5HdFB4q+0yVpwSLZTfhj1XtrSXfZOqsxF5FCTR
 YEgrojYsdUcd6ggRXIBdDL2bQp7nUpQ6mRkE3dXebHgcPNZxcDgC085/n2zYkh6QLJWg
 2Ys7y+H5ooui741P8xRXA9aaIskxcSw5B+b8K3TimLwx57JtDdX0oLfkHVLM2G5f+PiX
 K//Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=FHdpkBuUOJNob58ME1K1WMZgWglb4BWx5RsCqArPqlk=;
 b=mM26FPvL5XtUMcZ/Igq6YAzwIkY72D2c8UuPN08cIaBZymvjV4jDO/872eYkXsysLC
 KHezk2xIgVNmGvw007ZMz1RbL7uatEd8JdIcsuc+RuI82ague1Pm8o/RAPVgJPlElxO2
 p9xqfWFpttHemqjGaOyB8sVSkYYVlE/ufDiSt7w8T3o95IIdAtGrZHo2y0h7ARejR/bP
 RvDMCAI3DTbKLjqPHion83Cd+JTLPm9a96zTyp2vm/nWllcqedBW8xQe+5MTry8fKtcl
 YZnkDs1sesXdNLW88uauf/L0A8tDzl7w/VjHixGEjhab0KMXhDZJ74M0Es+lgu4+JcYX
 26dQ==
X-Gm-Message-State: ACgBeo3egWtAdZQ5I0XyaGfRl0kn7nkispL+FCc6j1vMfP6YvajZSj7g
 kP3JKPHnVCOMLdK/SM4FX8JkXNVrPivuoU/xyo51Ow==
X-Google-Smtp-Source: AA6agR52iohe+wHuBzZpuBmYjJl8k2ddYuqgDhBC7hn5g8QtZ5kZZwDH+HgljpGearYZCSI5moeGcGBk1+KKc8wURYk=
X-Received: by 2002:a25:820b:0:b0:677:3a88:48ff with SMTP id
 q11-20020a25820b000000b006773a8848ffmr2087482ybk.39.1659343185136; Mon, 01
 Aug 2022 01:39:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220731230245.1216949-1-minyard@acm.org>
In-Reply-To: <20220731230245.1216949-1-minyard@acm.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Aug 2022 09:39:04 +0100
Message-ID: <CAFEAcA9aTcc_wNJvf=vyRnBL5vqr9DjeUtxPY-11Ejoyry4iFQ@mail.gmail.com>
Subject: Re: [PATCH] ipmi:smbus: Add a check around a memcpy
To: minyard@acm.org
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>,
 "M : Marcel Apfelbaum" <marcel.apfelbaum@gmail.com>, 
 David Gibson <david@gibson.dropbear.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Corey Minyard <cminyard@mvista.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, 1 Aug 2022 at 00:03, <minyard@acm.org> wrote:
>
> From: Corey Minyard <cminyard@mvista.com>
>
> In one case:
>
>   memcpy(sid->inmsg + sid->inlen, buf, len);
>
> if len == 0 then sid->inmsg + sig->inlen can point to one past the inmsg
> array if the array is full.  We have to allow len == 0 due to some
> vagueness in the spec, but we don't have to call memcpy.
>
> Found by Coverity.  This is not a problem in practice, but the results
> are technically (maybe) undefined.  So make Coverity happy.
>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Corey Minyard <cminyard@mvista.com>
> ---
>  hw/ipmi/smbus_ipmi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> I think this should do it.
>
> diff --git a/hw/ipmi/smbus_ipmi.c b/hw/ipmi/smbus_ipmi.c
> index 9ef9112dd5..d0991ab7f9 100644
> --- a/hw/ipmi/smbus_ipmi.c
> +++ b/hw/ipmi/smbus_ipmi.c
> @@ -281,7 +281,9 @@ static int ipmi_write_data(SMBusDevice *dev, uint8_t *buf, uint8_t len)
>               */
>              send = true;
>          }
> -        memcpy(sid->inmsg + sid->inlen, buf, len);
> +        if (len > 0) {
> +            memcpy(sid->inmsg + sid->inlen, buf, len);
> +        }
>          sid->inlen += len;
>          break;
>      }
> --
> 2.25.1
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


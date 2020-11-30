Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CE72C827F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 11:46:14 +0100 (CET)
Received: from localhost ([::1]:43562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjghA-0001R5-K5
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 05:46:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kjgfP-0000jm-DW
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 05:44:23 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:52296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kjgfN-0001V9-Jb
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 05:44:23 -0500
Received: by mail-wm1-x341.google.com with SMTP id a6so4412413wmc.2
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 02:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=i+/5b63X0noQSNRzVjHr8SpjbvRILMIO+VJ8HzX8lNk=;
 b=moFRM7Qr1FKa2g2BxIVOwIU23APaTyucy4w1eR/WNVQdN59npeTxgYXH7dM0ea0t2z
 /MBP1GM24+OZ23F6fDeV0Zj+6ppHDmeKNJEt2l3vYqWTqaR++xqZ8WIrUGLRPGpM8gNo
 MzBJEL87gBMwFLW4Hf5Md5vJTAzrFaipReEdhm+DD04k5irWm/rMk4I4W6lsPC7eUg9S
 P/3oGcPzrA2WJZbzgwYG/QmNVSfJ/0rIBBLhxJCDUDRQu1LcbgfbmQ4XGWsQhdkIlU1P
 OFwJyONfxIYcjlJjuN3+1cz+rwb1ZXzl8kmtVVKAdkOKRAIKsR/AjFQpmPi4Ru+x928J
 SdTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i+/5b63X0noQSNRzVjHr8SpjbvRILMIO+VJ8HzX8lNk=;
 b=YoOQOsaGoZzaJYkOxbDLLUeF+h3DOIfPFBANBu/isLul2Jcb0C/MqYaDhtETAySAbe
 kV+AOPJCDU2Owwfb74PgCiC70ZgGwDbyBMYoI8ffpdRl1KOyDIyezypFXpkNcBJcWaIQ
 J25dooAf7G9gLYuMki6iBZxXN1B3dfdOlMzAzFXpSqdR5ZFF+54VdiVD+pKpIcL/+Pfm
 CwwREsbkmeLpja/CGn8JfaA80z+cV+Hf8voA9/B5Q7/lz22AIxC4TZQX1UaogeH1Bype
 WuXynnhFMeZRmqxBM2mjZ7GNozUTeuiDBlAVPmKXUDFjswqQhGxMhhgxynMBtKAQ9Kl+
 g4Ww==
X-Gm-Message-State: AOAM532OPpTDNE3PPyKfz5WPRgAOJv6HNI7ZjxgNyzuEOvXkuPHVRze4
 qNqeMT8YWdgxvIDQ1nSIQto=
X-Google-Smtp-Source: ABdhPJzTrGvvgLQCcPKNGc8c9qJPBCQbab4/FXi/CD9Ig9HC41p4M7ECjvg6SJPk8WvChENM/ZKhhg==
X-Received: by 2002:a1c:b78a:: with SMTP id h132mr8113765wmf.141.1606733057988; 
 Mon, 30 Nov 2020 02:44:17 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id a9sm25942094wrp.21.2020.11.30.02.44.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Nov 2020 02:44:17 -0800 (PST)
Subject: Re: [PATCH] hw/net/dp8393x: fix integer underflow in
 dp8393x_do_transmit_packets()
To: Mauro Matteo Cascella <mcascell@redhat.com>, qemu-devel@nongnu.org
References: <20201124092445.658647-1-mcascell@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <48d8ae85-3292-921a-f249-3b88a1141cc9@amsat.org>
Date: Mon, 30 Nov 2020 11:44:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201124092445.658647-1-mcascell@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: jasowang@redhat.com, pgn@zju.edu.cn, Laurent Vivier <laurent@vivier.eu>,
 Finn Thain <fthain@telegraphics.com.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Laurent/Finn

On 11/24/20 10:24 AM, Mauro Matteo Cascella wrote:
> An integer underflow could occur during packet transmission due to 'tx_len' not
> being updated if SONIC_TFC register is set to zero. Check for negative 'tx_len'
> when removing existing FCS.
> 
> RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=1899722
> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> Reported-by: Gaoning Pan <pgn@zju.edu.cn>
> ---
>  hw/net/dp8393x.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
> index 674b04b354..205c0decc5 100644
> --- a/hw/net/dp8393x.c
> +++ b/hw/net/dp8393x.c
> @@ -495,6 +495,10 @@ static void dp8393x_do_transmit_packets(dp8393xState *s)
>          } else {
>              /* Remove existing FCS */
>              tx_len -= 4;
> +            if (tx_len < 0) {
> +                SONIC_ERROR("tx_len is %d\n", tx_len);
> +                break;
> +            }
>          }
>  
>          if (s->regs[SONIC_RCR] & (SONIC_RCR_LB1 | SONIC_RCR_LB0)) {
> 

Doesn't it make more sense to check 'tx_len >= 4'
and skip tx/rx when 'tx_len == 0'?

-- >8 --
@@ -488,25 +488,29 @@ static void
dp8393x_do_transmit_packets(dp8393xState *s)
             }
         }

-        /* Handle Ethernet checksum */
-        if (!(s->regs[SONIC_TCR] & SONIC_TCR_CRCI)) {
-            /* Don't append FCS there, to look like slirp packets
-             * which don't have one */
-        } else {
-            /* Remove existing FCS */
-            tx_len -= 4;
+        if (tx_len >= 4) {
+            /* Handle Ethernet checksum */
+            if (!(s->regs[SONIC_TCR] & SONIC_TCR_CRCI)) {
+                /* Don't append FCS there, to look like slirp packets
+                 * which don't have one */
+            } else {
+                /* Remove existing FCS */
+                tx_len -= 4;
+            }
         }

-        if (s->regs[SONIC_RCR] & (SONIC_RCR_LB1 | SONIC_RCR_LB0)) {
-            /* Loopback */
-            s->regs[SONIC_TCR] |= SONIC_TCR_CRSL;
-            if (nc->info->can_receive(nc)) {
-                s->loopback_packet = 1;
-                nc->info->receive(nc, s->tx_buffer, tx_len);
+        if (tx_len > 0) {
+            if (s->regs[SONIC_RCR] & (SONIC_RCR_LB1 | SONIC_RCR_LB0)) {
+                /* Loopback */
+                s->regs[SONIC_TCR] |= SONIC_TCR_CRSL;
+                if (nc->info->can_receive(nc)) {
+                    s->loopback_packet = 1;
+                    nc->info->receive(nc, s->tx_buffer, tx_len);
+                }
+            } else {
+                /* Transmit packet */
+                qemu_send_packet(nc, s->tx_buffer, tx_len);
             }
-        } else {
-            /* Transmit packet */
-            qemu_send_packet(nc, s->tx_buffer, tx_len);
         }
         s->regs[SONIC_TCR] |= SONIC_TCR_PTX;

---


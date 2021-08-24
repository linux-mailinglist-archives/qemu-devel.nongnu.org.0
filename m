Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB603F5C27
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 12:31:03 +0200 (CEST)
Received: from localhost ([::1]:49426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIThu-0004TT-Iu
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 06:31:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mITgG-00029W-67; Tue, 24 Aug 2021 06:29:20 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:33394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mITgE-0005yY-Ql; Tue, 24 Aug 2021 06:29:19 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 j14-20020a1c230e000000b002e748b9a48bso1544302wmj.0; 
 Tue, 24 Aug 2021 03:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=o8FkZtJ5MtYHYuML9kl6+WUmizJOZYKccq19D9/Z24o=;
 b=LotD1cc4Cn32Yn1nGwdsY5PWcYPyjeNN1V/qN0H0jWTQQLGw6pzv7cZC8eX+tqYgic
 co6sOaG3zccr4gUKTXIOZVuFfFfQ72MS9ocpyhQX9JxDjnln4rlIeWtSW2FargmMvZux
 DI4kpFv0PfyBs0oF+K3XKa9usxgLwx3E1JG+S5sDeQFQFDdVAk54VBhK0BhzVn1C352S
 h/evgOIyx+x2UDH3NtN2T6CcueD3EUp4upPe+hzfgl70Xwn6MIm30gaWFh2jEZMZGEAh
 IfK5APbIF22sgHgpE1y/x5/XMF0AG3WX+bicCI7fdgsI1toQ9JNXg9sdIXdr/fupzjad
 5foA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=o8FkZtJ5MtYHYuML9kl6+WUmizJOZYKccq19D9/Z24o=;
 b=UVP27felzisVv1hc2sWEGvVKIYRDipPl3r/6JIVdcG68F3ncXkZ8x2dGfEwFUdd9Wt
 9+CGLmiIyIFWx9+OuT+RAx63fN4ANeD+vdr5KSfromeZDpHeFyLV5OKr748gwIvA/CPl
 QQdAdaQfXgTLsSfeJIZ37YIHLN2aY3fqEce0bpyaz64CHNMPwvdWibSqr4gXnVDLYcTE
 GU2vKb55BD0G/m+exxxNl/hYpQL67ZuJMjVChbIfXcm8o2uxK+r7pn3IwXvko7ZU5MbS
 O751z7Eh5k2wl1dXd6ppJuDEIWspHorwPSwoKcez6cKJlwwDOQ/FgwcfZuBNo1FMX64D
 zJYA==
X-Gm-Message-State: AOAM5331qVGZ1dd9ocPG+z+MhGVAxMAPe3WXQsm8fz2HNO/C3+4SBM2y
 S6zR1jQcXHHYkdH0s/OO4UHO0gBBqFM=
X-Google-Smtp-Source: ABdhPJwXEAFMjULUTM30fmM30VGEiJufttzOm36iy+uNI1+On/mBYTBgUFKvYmOcNdO7KoMsbE2dCw==
X-Received: by 2002:a1c:6a04:: with SMTP id f4mr3394748wmc.54.1629800957001;
 Tue, 24 Aug 2021 03:29:17 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id r4sm1740567wmq.10.2021.08.24.03.29.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 03:29:16 -0700 (PDT)
Subject: Re: [RFC 01/10] hw/mos6522: Remove get_load_time() methods and
 functions
To: Finn Thain <fthain@linux-m68k.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <cover.1629799776.git.fthain@linux-m68k.org>
 <9b78e8c6e453feab6275d04bf503051645770d85.1629799776.git.fthain@linux-m68k.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f3fe703f-106e-041d-fc13-22825b3b612a@amsat.org>
Date: Tue, 24 Aug 2021 12:29:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <9b78e8c6e453feab6275d04bf503051645770d85.1629799776.git.fthain@linux-m68k.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.023,
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
Cc: qemu-ppc@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/24/21 12:09 PM, Finn Thain wrote:
> This code appears to be unnecessary.
> 
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> ---
>  hw/misc/mos6522.c | 22 +---------------------
>  1 file changed, 1 insertion(+), 21 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


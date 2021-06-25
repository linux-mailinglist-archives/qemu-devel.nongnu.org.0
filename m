Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F483B3F70
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 10:39:15 +0200 (CEST)
Received: from localhost ([::1]:52754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwhMo-0004Em-Hc
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 04:39:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwhLL-0002oY-H2
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 04:37:43 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:36466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwhLJ-0007b3-0H
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 04:37:43 -0400
Received: by mail-wr1-x431.google.com with SMTP id l12so8956841wrt.3
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 01:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GRqqM54x9Miv4hh3u6V+iJZEjbkHbzXGULiGFCgyYlA=;
 b=Ja41/SpS20zgdg0C9ZHvOcimvxi4TGkJQAK/eCMWsyzmMKWFTA6YnFFRxDZyg5ewpV
 X3vjvkhsdO7WqnfvbY7b1Mq3gazRl73126QBCV1yhnfel78DabMTBp5kz8LHXZME7ZsJ
 2zMhsGBpdhp068lCKn2EKMWxreQed6laT/X8wVtj5rmIKw715RALRQvu+0jFus9jEpMq
 9jN6spyW7AqKjpeU6lkuyXzn35wPFP9vKVAiPyd3lM5/SOLA7DFQ5MkDyDDnQlA7RL+q
 oeIlegGc3TqnnGuIvRmncdvm/O2Qf4suO0rzZ8O+55gsp4jZDL6cewqXwJ+A0JHk84yO
 aMIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GRqqM54x9Miv4hh3u6V+iJZEjbkHbzXGULiGFCgyYlA=;
 b=c+eUwv/BHEkIKQvvQ2Reba7p4m1MxST90368pn4w4FzzeNKWMC4tmUzWBCd7f7obNs
 TxC3ts7PhW4Pz03hdCOurMdOa4turDhl7BOegdRm5WT5igS5+y6nFKe+l7+abh6Xafk/
 RMapGmTjU6Xi1lnsY2iNHm/JcXX5IU510ZA3XCCRDTnxSrOgTHW685pk5qpv1FI5WFAr
 Ql4VsckS2WK0pjDS2f2pyOtv9ezvft+DO69o40bp1Pf1wIV2BSGwzTboIrTdN24NBjAK
 RgnJX7LLUnVaiL6XWWPg5I88jsQxTfB1C1HUsu7f/TsPc8aVeAi7uWW2Ga7kKbNy2jAP
 VZtA==
X-Gm-Message-State: AOAM5327+qGHZae4cCN4nuxgNAbqcvjU4vS5OMuDYRkPVZpXWxQ4boF7
 xxsrjQo902gcyytu7g6eZXg=
X-Google-Smtp-Source: ABdhPJwRlXWI1pE1i7SW6FmUfogVTuU/uFGbcbO0ZL29+9syEUO9KoMfyWgdKZq5RvYYkVbzIj5qGQ==
X-Received: by 2002:a5d:4cd1:: with SMTP id c17mr9690012wrt.295.1624610259299; 
 Fri, 25 Jun 2021 01:37:39 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id e3sm5503134wro.26.2021.06.25.01.37.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 01:37:38 -0700 (PDT)
Subject: Re: [PATCH 1/2] g364fb: use RAM memory region for framebuffer
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 hpoussin@reactos.org, fthain@telegraphics.com.au
References: <20210625073844.1229-1-mark.cave-ayland@ilande.co.uk>
 <20210625073844.1229-2-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8a788aba-6914-163d-e98a-20dc088024e1@amsat.org>
Date: Fri, 25 Jun 2021 10:37:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625073844.1229-2-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/25/21 9:38 AM, Mark Cave-Ayland wrote:
> Since the migration stream is already broken, we can use this opportunity to
> change the framebuffer so that it is migrated as a RAM memory region rather
> than as an array of bytes.
> 
> In particular this helps the output of the analyze-migration.py tool which
> no longer contains a huge array representing the framebuffer contents.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/display/g364fb.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)

> @@ -454,7 +457,6 @@ static const VMStateDescription vmstate_g364fb = {
>      .minimum_version_id = 1,

Even if broken, I'd increase to version as good practice.

>      .post_load = g364fb_post_load,
>      .fields = (VMStateField[]) {
> -        VMSTATE_VBUFFER_UINT32(vram, G364State, 1, NULL, vram_size),
>          VMSTATE_BUFFER_UNSAFE(color_palette, G364State, 0, 256 * 3),
>          VMSTATE_BUFFER_UNSAFE(cursor_palette, G364State, 0, 9),
>          VMSTATE_UINT16_ARRAY(cursor, G364State, 512),

The vram pointer is now unused, we can remove it:

-- >8 --
diff --git a/hw/display/g364fb.c b/hw/display/g364fb.c
index 990ef3afdd8..11ad61fa73a 100644
--- a/hw/display/g364fb.c
+++ b/hw/display/g364fb.c
@@ -34,7 +34,6 @@

 typedef struct G364State {
     /* hardware */
-    uint8_t *vram;
     uint32_t vram_size;
     qemu_irq irq;
     MemoryRegion mem_vram;
---

Removing 'uint8_t *vram':
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


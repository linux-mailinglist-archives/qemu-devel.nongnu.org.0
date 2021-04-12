Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A3835C481
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 12:58:50 +0200 (CEST)
Received: from localhost ([::1]:45680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVuHJ-0002D6-Hp
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 06:58:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVuGM-0001mj-Uo
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 06:57:50 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:40656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVuGK-0007cW-I4
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 06:57:50 -0400
Received: by mail-ej1-x636.google.com with SMTP id n2so19493685ejy.7
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 03:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M5zFLxIy42+ES/YBiJE3zF1p/FVV4cQad69fb7FiB2Q=;
 b=czCwzfwFkwE62FverTne7skMDk40P/DCy0GesfulJZ8SWDDVbqwP1IeO5uv0G7zRY3
 IYxLPua7uZyDf5mSgHBnRHX4plFXmvuSY0ptoe68EBmnPCe6Ps7Oe4u6sDsYUhMG6Anc
 UEzxHuwe1StLliQ8Hulbt3EUb0I+HrbTL5mmzESGXeif59HU60k+4NH/W0q77dlkg+xz
 F0rwSVz3sVnN5dod1FwC8wC2Zhqxs9zLKGoHSGrnj/do8H6Y/n3RiLeBtB0zeT5YgAkg
 btKzsCZzSze9O8HZ/1lsfktSIFP/ufAEPDQFY/7m9PBR73V/qkFlEKQ3zZFeVRDq9jc5
 042w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M5zFLxIy42+ES/YBiJE3zF1p/FVV4cQad69fb7FiB2Q=;
 b=PPNCF7WSteDgimYlkxo/D6Qsqvh3BhbilaCwEpP531Raq2bfJKRPq6I8feuKauwKQN
 F2il4ySoNMBSTgQlxeNSqfUhVHN4b3ydk1Eh/7H9TBrhaO1URdxCtotkitsl6LSWIgS+
 ShgawWMw8F38SXzKOBjwG8ecW0MlWIivFBQhzZt/5SR7U5kAegZ24hBqvkY7XUHvnSg2
 NDTdEB2jH8C3jsx2ZO33P0755yXbng6x6JJPiSSdIhZnLm/4+/o2EZYhUO3hCe94bscC
 +edPki4tAsbj9PvGLeimkKuriBKSVraX6OQ/me8WFjI3SHaBEfPBT2ZLlTH1y3+seCT/
 6UgQ==
X-Gm-Message-State: AOAM5324mrTR/vU28Fsn4qfdvrMDyEMtqwVHDYUqcQanTak9GE8bRAnE
 4l5tEHpgSvHW+NmLBOinOGOLRZb5zfjw+9pts2uztg==
X-Google-Smtp-Source: ABdhPJw7ykcWmeTO5lKO7VR8mWsuf/99cBK+y4pu1JLlYqkc8HFCOxb1yPDzfI7pU8BACkf1cxmMgp1pu1XoEDd54p8=
X-Received: by 2002:a17:907:629e:: with SMTP id
 nd30mr26713880ejc.407.1618225063950; 
 Mon, 12 Apr 2021 03:57:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210407195801.685-1-mark.cave-ayland@ilande.co.uk>
 <20210407195801.685-6-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20210407195801.685-6-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Apr 2021 11:56:59 +0100
Message-ID: <CAFEAcA9=pA36ZZJqsrUkbBo8yBJn-EOq5nM9GW9hdM9POw4ruQ@mail.gmail.com>
Subject: Re: [PATCH v4 for-6.0 05/12] esp: introduce esp_fifo_pop_buf() and
 use it instead of fifo8_pop_buf()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 7 Apr 2021 at 21:02, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> The const pointer returned by fifo8_pop_buf() lies directly within the array used
> to model the FIFO. Building with address sanitizers enabled shows that if the
> caller expects a minimum number of bytes present then if the FIFO is nearly full,
> the caller may unexpectedly access past the end of the array.
>
> Introduce esp_fifo_pop_buf() which takes a destination buffer and performs a
> memcpy() in it to guarantee that the caller cannot overwrite the FIFO array and
> update all callers to use it. Similarly add underflow protection similar to
> esp_fifo_push() and esp_fifo_pop() so that instead of triggering an assert()
> the operation becomes a no-op.
>
> Buglink: https://bugs.launchpad.net/qemu/+bug/1909247
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Tested-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  hw/scsi/esp.c | 40 ++++++++++++++++++++++++++++------------
>  1 file changed, 28 insertions(+), 12 deletions(-)
>
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index ff8fa73de9..1aa2caf57d 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -117,6 +117,23 @@ static uint8_t esp_fifo_pop(Fifo8 *fifo)
>      return fifo8_pop(fifo);
>  }
>
> +static uint32_t esp_fifo_pop_buf(Fifo8 *fifo, uint8_t *dest, int maxlen)
> +{
> +    const uint8_t *buf;
> +    uint32_t n;
> +
> +    if (maxlen == 0) {
> +        return 0;
> +    }
> +
> +    buf = fifo8_pop_buf(fifo, maxlen, &n);
> +    if (dest) {
> +        memcpy(dest, buf, n);
> +    }
> +
> +    return n;
> +}
> +
>  static uint32_t esp_get_tc(ESPState *s)
>  {
>      uint32_t dmalen;
> @@ -241,11 +258,11 @@ static uint32_t get_cmd(ESPState *s, uint32_t maxlen)
>          if (dmalen == 0) {
>              return 0;
>          }
> -        memcpy(buf, fifo8_pop_buf(&s->fifo, dmalen, &n), dmalen);
> -        if (dmalen >= 3) {
> +        n = esp_fifo_pop_buf(&s->fifo, buf, dmalen);
> +        if (n >= 3) {
>              buf[0] = buf[2] >> 5;
>          }
> -        fifo8_push_all(&s->cmdfifo, buf, dmalen);
> +        fifo8_push_all(&s->cmdfifo, buf, n);
>      }
>      trace_esp_get_cmd(dmalen, target);

This bit could be tidied up further -- it currently sets
   dmalen = MIN(fifo8_num_used(&s->fifo), maxlen);
in order not to pull more bytes out of the FIFO than it has in it;
but now we are making that check in esp_fifo_pop_buf() I think you
could just do
    dmalen = esp_fifo_pop_buf(&s->fifo, buf, maxlen);
and drop the
        dmalen = MIN(fifo8_num_used(&s->fifo), maxlen);
        if (dmalen == 0) {
            return 0;
        }
part and the use of 'n' entirely.

But this code isn't wrong, so we can do that later to avoid having
to respin here.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


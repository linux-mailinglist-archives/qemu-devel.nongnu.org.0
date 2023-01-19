Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3C5673AA8
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 14:46:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIVEe-0000F9-Py; Thu, 19 Jan 2023 08:45:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIVEN-0000Bp-Nj
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 08:45:28 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIVEK-0003wk-69
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 08:45:26 -0500
Received: by mail-pg1-x52d.google.com with SMTP id r18so1520133pgr.12
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 05:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JpdmuGJz6c4TFCGymwgX2VJ4qEcxJKG4Vuqdz37LPk0=;
 b=g3Xuju5m8U8VcFaJIfXYJvYT974BDB4gxgk6G6fYne/leT+8Q7itGI/oyB0yOGJTgF
 6cpNFFBZgHLC0Cf5TbDbB/UIeazfmiSwVN3tX5sTkJe2oRSTRfsTVd0o10Vsk+1K5DQ+
 oxdnrNziU9U/oArY7a06+QEuAuF8kqJS0C84MeLH/nvvlHnRDrvvGJDqrRF18C76u3wy
 XsWN6c2dKEb4uUY4f5XD7J4tvc3T7Gwk50HLY/pB6EjObTf0Lmlggw0v18DO7v4u69Aa
 8Gc2O/rtCXmpx73HdfClHB5WLkyYF5HX1kEeKHnZeSCw2Y/T0vDqZJNIInzeo9CXihaX
 pjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JpdmuGJz6c4TFCGymwgX2VJ4qEcxJKG4Vuqdz37LPk0=;
 b=YTXjzPQJQkr3pbhK54Yu9eeZ6dWaS7PjgEahHVk2kqotrNt1UtO0psn2JiDiLPn92Y
 /iLFLUZ7F6mLp0hNXcm3UCjtMaZ+0aFq56A7tLIxZdbtYIaNmYIDq93FuXZgtKDVvD/v
 GK0/SEX8htBmB0nNguOyJma0Q/mIq023IIt2NBqsob6yl/rmItBhJDPROv+ETCH1WXbi
 LHhpfNIQV+QZ/1XfSrACkqxBQecBEGKoX81dg/KnCK5oeg7KKfsmRojXfIEGyNekKcU7
 cG+q7trUQnhLhFDagFEoVG/BCSC7R9uR0GAui5DrjaQ03brTjnjHYKWzFVYcZV0g5jjt
 d68Q==
X-Gm-Message-State: AFqh2krYNAnRIa/6XRwnmYGJ2SlOMeqXtCsbx0GHTb9LjvWaVK4jyldQ
 CUPDymaEnDMLcd8rJf5/i1Rh6omPktt7/rwVaAfmCQ==
X-Google-Smtp-Source: AMrXdXthyVtAOaGF+8EpvatTUyC8aUw1FAGEol0xQCT/IYvteGY1vTBtAJqF9+2fqA+5sVfb7xGPFFUIXloeSknlnQA=
X-Received: by 2002:a63:5410:0:b0:4d1:96f6:8edd with SMTP id
 i16-20020a635410000000b004d196f68eddmr276853pgb.253.1674135922318; Thu, 19
 Jan 2023 05:45:22 -0800 (PST)
MIME-Version: 1.0
References: <20230117220523.20911-1-eiakovlev@linux.microsoft.com>
 <20230117220523.20911-2-eiakovlev@linux.microsoft.com>
In-Reply-To: <20230117220523.20911-2-eiakovlev@linux.microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Jan 2023 13:45:11 +0000
Message-ID: <CAFEAcA9EndzEQA7CPszBCFJyzSgD7=FqeFFK-LHxucTA=CSimA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] hw/char/pl011: refactor FIFO depth handling code
To: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 17 Jan 2023 at 22:05, Evgeny Iakovlev
<eiakovlev@linux.microsoft.com> wrote:
>
> PL011 can be in either of 2 modes depending guest config: FIFO and
> single register. The last mode could be viewed as a 1-element-deep FIFO.
>
> Current code open-codes a bunch of depth-dependent logic. Refactor FIFO
> depth handling code to isolate calculating current FIFO depth.
>
> One functional (albeit guest-invisible) side-effect of this change is
> that previously we would always increment s->read_pos in UARTDR read
> handler even if FIFO was disabled, now we are limiting read_pos to not
> exceed FIFO depth (read_pos itself is reset to 0 if user disables FIFO).
>
> Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
> ---
>  hw/char/pl011.c         | 25 +++++++++++++------------
>  include/hw/char/pl011.h |  5 ++++-
>  2 files changed, 17 insertions(+), 13 deletions(-)

Looking at this again, I realised that there's a subtle point
here about migration compatibility. If we do a VM migration
from an older version of QEMU without this change to a newer
version that does have this change, the incoming migration state
might indicate that we have FIFOs disabled, and there's a character
in read_fifo[] that isn't in array element 0 (because the old
code doesn't put it there). I think this works out OK because
the codepath in the UARTDR read-from-FIFO will first read the
character from read_fifo[read_pos], which will be the non-zero
read_pos as set by the old QEMU, before constraining it to be
0 when it does the advance of read_pos; and the pl011_put_fifo
code doesn't care about the actual value of read_pos.

But this is kind of tricky to reason about, and fragile to
future changes in the code, so I feel like it would be better
to have a migration post_load function that sanitizes the
incoming state to enforce the invariant assumed by the new code, i.e.

  if (pl011_fifo_depth(s) == 1 && s->read_count > 0 && s->read_pos > 0) {
      /*
       * Older versions of QEMU didn't ensure that the single
       * character in the FIFO in FIFO-disabled mode is in
       * element 0 of the array; convert to follow the current
       * code's assumptions.
       */
      s->read_fifo[0] = s->read_fifo[s->read_pos];
      s->read_pos = 0;
  }

If we're putting in a post-load function we can also sanitize
the incoming migration stream to fail the migration on bogus
(possibly malicious) data like read_pos > ARRAY_SIZE(read_fifo)
or read_count > fifo depth.

> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
> index c076813423..329cc6926d 100644
> --- a/hw/char/pl011.c
> +++ b/hw/char/pl011.c
> @@ -81,6 +81,12 @@ static void pl011_update(PL011State *s)
>      }
>  }
>
> +static inline unsigned pl011_get_fifo_depth(PL011State *s)
> +{
> +    /* Note: FIFO depth is expected to be power-of-2 */
> +    return s->lcr & 0x10 ? PL011_FIFO_DEPTH : 1;
> +}
> +
>  static uint64_t pl011_read(void *opaque, hwaddr offset,
>                             unsigned size)
>  {
> @@ -94,8 +100,7 @@ static uint64_t pl011_read(void *opaque, hwaddr offset,
>          c = s->read_fifo[s->read_pos];
>          if (s->read_count > 0) {
>              s->read_count--;
> -            if (++s->read_pos == 16)
> -                s->read_pos = 0;
> +            s->read_pos = (s->read_pos + 1) & (pl011_get_fifo_depth(s) - 1);
>          }
>          if (s->read_count == 0) {
>              s->flags |= PL011_FLAG_RXFE;
> @@ -273,11 +278,7 @@ static int pl011_can_receive(void *opaque)
>      PL011State *s = (PL011State *)opaque;
>      int r;
>
> -    if (s->lcr & 0x10) {
> -        r = s->read_count < 16;
> -    } else {
> -        r = s->read_count < 1;
> -    }
> +    r = s->read_count < pl011_get_fifo_depth(s);
>      trace_pl011_can_receive(s->lcr, s->read_count, r);
>      return r;
>  }
> @@ -286,15 +287,15 @@ static void pl011_put_fifo(void *opaque, uint32_t value)
>  {
>      PL011State *s = (PL011State *)opaque;
>      int slot;
> +    unsigned pipe_depth;
>
> -    slot = s->read_pos + s->read_count;
> -    if (slot >= 16)
> -        slot -= 16;
> +    pipe_depth = pl011_get_fifo_depth(s);
> +    slot = (s->read_pos + s->read_count) & (pipe_depth - 1);
>      s->read_fifo[slot] = value;
>      s->read_count++;
>      s->flags &= ~PL011_FLAG_RXFE;
>      trace_pl011_put_fifo(value, s->read_count);
> -    if (!(s->lcr & 0x10) || s->read_count == 16) {
> +    if (s->read_count == pipe_depth) {
>          trace_pl011_put_fifo_full();
>          s->flags |= PL011_FLAG_RXFF;
>      }

thanks
-- PMM


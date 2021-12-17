Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF6D47973C
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 23:36:28 +0100 (CET)
Received: from localhost ([::1]:48752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myLpz-0004zM-HF
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 17:36:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1myLoK-00040H-Mq
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 17:34:45 -0500
Received: from [2a00:1450:4864:20::433] (port=43619
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1myLoJ-0000Hz-3O
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 17:34:44 -0500
Received: by mail-wr1-x433.google.com with SMTP id v11so6621836wrw.10
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 14:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UlftqpMsBSng1bdVgYdeQvpbHbf+X72OR+GsWsjEswg=;
 b=l0dmQ3zsAIQqVCAadYlJD/h6dMUaLGJstdbfOOvmooEk411Mt8zIRPr52GHfdUFW6B
 7DHlk6VV9cQVeM8/DYRZ1vAFJBiDcWZSrJb0HdX1k2wWIiNdO8d0cpARC8SPzE5UugOj
 IjZxEdDq/EAdBjDkfuNJv8GT4RztlrErZvT70sADcZKP10mNN6vF4Yor6G3hA5peeI1f
 2ZsVlvMOR1a8iPNCK9WP3ajMii7Bojv3JWHyQ6rEQXUfAlQW5EVuiS7FBW8+/bCewduE
 MLgckEzLZezxL9dcC1Bh9K+tfCYMypgPDI5UTd4BKXl5QktIIzrBGaDnXL3yBppQe7bb
 v7rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UlftqpMsBSng1bdVgYdeQvpbHbf+X72OR+GsWsjEswg=;
 b=xm78LHqFJ7t0xztdtsNuar4HB3vCrJ+A/MRZFb9CNgPPAAPN8I7r7HsHXt/q99BoG7
 wWBBPtSrcPolDf/7ZypUxASmQaMBs0roSpqj2P8FipKLdP6sQGJzFT509S9Tn7cdV6OF
 59cajjLW2vXOkDZzfIfum0sNegStbTLYMqAzw9OM3LUXC+gv8rldn1tLXUfW9JQhoDdb
 8ccS1BKti6ailKRu2yFaJ2I0Sj3gF+HgWLbjrc+YtpsqZBDRljxHEkaFwKqoiNfjbSFU
 DdZm7cywgIo25s75IRkjIleLZi5hskNZkS9JkY/pOaxEZfxsWHTUStpQqb2KTUDhWQ2T
 jtSw==
X-Gm-Message-State: AOAM532LoaJxuJFCgP7xo6+Z7w+rFcCgc1satRRoA6zRBpWsIFucO1Rz
 W57ebnpjs+9gLKFK+XugRiqNVzEl5JsT7wataT05fw==
X-Google-Smtp-Source: ABdhPJytZCkSViQ8IS2Yl3BM3AbOgZalY/IcQM4cF4RrC2Sj5o0M3Pnlj9+7j/zkyqjdjT5IACv196en7TD4RkrhCck=
X-Received: by 2002:a05:6000:3c4:: with SMTP id
 b4mr4206740wrg.172.1639780481107; 
 Fri, 17 Dec 2021 14:34:41 -0800 (PST)
MIME-Version: 1.0
References: <20211215182421.418374-1-philmd@redhat.com>
 <20211215182421.418374-4-philmd@redhat.com>
In-Reply-To: <20211215182421.418374-4-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Dec 2021 22:34:29 +0000
Message-ID: <CAFEAcA_UKFHT=PbwNtyqV4G2Vdw7LVUjUj_X_DZ5Kk6=yF+EBg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 3/3] softmmu/physmem: Introduce MemTxAttrs::memory
 field and MEMTX_BUS_ERROR
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 15 Dec 2021 at 18:24, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Add the 'memory' bit to the memory attributes to restrict bus
> controller accesses to memories.
>
> Introduce flatview_access_allowed() to check bus permission
> before running any bus transaction.
>
> Have read/write accessors return MEMTX_BUS_ERROR if an access is
> restricted.
>
> There is no change for the default case where 'memory' is not set.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  include/exec/memattrs.h |  9 +++++++++
>  softmmu/physmem.c       | 43 +++++++++++++++++++++++++++++++++++++++--
>  2 files changed, 50 insertions(+), 2 deletions(-)
>
> diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
> index 95f2d20d55b..f0063583ee2 100644
> --- a/include/exec/memattrs.h
> +++ b/include/exec/memattrs.h
> @@ -35,6 +35,14 @@ typedef struct MemTxAttrs {
>      unsigned int secure:1;
>      /* Memory access is usermode (unprivileged) */
>      unsigned int user:1;
> +    /*
> +     * Bus interconnect and peripherals can access anything (memories,
> +     * devices) by default. By setting the 'memory' bit, bus transaction
> +     * are restricted to "normal" memories (per the AMBA documentation)
> +     * versus devices. Access to devices will be logged and rejected
> +     * (see MEMTX_BUS_ERROR).
> +     */
> +    unsigned int memory:1;
>      /* Requester ID (for MSI for example) */
>      unsigned int requester_id:16;
>      /* Invert endianness for this page */
> @@ -66,6 +74,7 @@ typedef struct MemTxAttrs {
>  #define MEMTX_OK 0
>  #define MEMTX_ERROR             (1U << 0) /* device returned an error */
>  #define MEMTX_DECODE_ERROR      (1U << 1) /* nothing at that address */
> +#define MEMTX_BUS_ERROR         (1U << 2) /* bus returned an error */

This is kind of odd naming, because MEMTX_DECODE_ERROR already means
"bus/interconnect returned an error" and it generally translates
into what at the OS level gets called a "bus error"...

-- PMM


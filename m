Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 667EE42E4E6
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 01:51:06 +0200 (CEST)
Received: from localhost ([::1]:52336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbAV7-00007d-Hp
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 19:51:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mbAQj-00038s-Qo
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 19:46:34 -0400
Received: from mail-ot1-f43.google.com ([209.85.210.43]:39916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mbAQi-0007Sm-4P
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 19:46:33 -0400
Received: by mail-ot1-f43.google.com with SMTP id
 e59-20020a9d01c1000000b00552c91a99f7so1131140ote.6
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 16:46:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aUggimiykY2SRZOntg9EEmrXLM7xzWb1Zrt8eGqF/0w=;
 b=6dt+f3CukkVWolwrLtI7HEWPi31TOoIMVmeq/vIs+c+FfQ1BSgCSETqP64kgBtGEqn
 sjIZadc27kTTSOXuBJ+EC5Mftpf5zs2bXeEFVW7ybxBmzVbfaabXUFDisMN3qXSWyubp
 IMnMiIg9UzwTb4B4yQG+cWm4rEqkKL7odqenzU8NQzRmsQyS1JAi4tRgsneForqu163y
 h6VLnRS0LMaGbeW9i6TA2MqArJJWBIS/9nwo4M2B85eh8DNXqDDCv6nqy8WfjVQ3HcdF
 1Q7zHrgJjj2GY+uuiKT3egFmyDRVZ+P929UIN50LITXAoLmb0mLmS1hmMPVw4cMMkNf1
 Rl8w==
X-Gm-Message-State: AOAM532mHFMs9xnGx6KXzBm1tRjDSp9pH44L99kiY7G2bMi1B8VCPLoC
 /QLrXMoEBeDDkS9cKVrC8LelkdmMGnXHJI1uqEMncyCq
X-Google-Smtp-Source: ABdhPJxSkS36JdcNCh5hboakwOV2gC4Ggt9QQmwpntcv9y/+XFfui1uqfmJwO+Q5G/xbGl4AU29MFGNKf7cqDTYBIzE=
X-Received: by 2002:a05:6830:2649:: with SMTP id
 f9mr1435660otu.13.1634255189786; 
 Thu, 14 Oct 2021 16:46:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210418055708.820980-1-f4bug@amsat.org>
In-Reply-To: <20210418055708.820980-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Fri, 15 Oct 2021 01:46:17 +0200
Message-ID: <CAAdtpL7VaxMrbzFywm_q8q5vJ-07yPG8x+ow08xwzROvp2NUag@mail.gmail.com>
Subject: Re: [PATCH v4] memory: Directly dispatch alias accesses on origin
 memory region
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.210.43;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ot1-f43.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

On Sun, Apr 18, 2021 at 7:57 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Since commit 2cdfcf272d ("memory: assign MemoryRegionOps to all
> regions"), all newly created regions are assigned with
> unassigned_mem_ops (which might be then overwritten).
>
> When using aliased container regions, and there is no region mapped
> at address 0 in the container, the memory_region_dispatch_read()
> and memory_region_dispatch_write() calls incorrectly return the
> container unassigned_mem_ops, because the alias offset is not used.
>
> Consider the following setup:
>
>     +--------------------+ < - - - - - - - - - - - +
>     |     Container      |  mr
>     |  (unassigned_mem)  |                         |
>     |                    |
>     |                    |                         |
>     |                    |  alias_offset
>     +                    + <- - - - - - +----------+---------+
>     | +----------------+ |              |                    |
>     | |  MemoryRegion0 | |              |                    |
>     | +----------------+ |              |       Alias        |  addr1
>     | |  MemoryRegion1 | | <~ ~  ~  ~ ~ |                    | <~~~~~~
>     | +----------------+ |              |                    |
>     |                    |              +--------------------+
>     |                    |
>     |                    |
>     |                    |
>     |                    |
>     | +----------------+ |
>     | |  MemoryRegionX | |
>     | +----------------+ |
>     | |  MemoryRegionY | |
>     | +----------------+ |
>     | |  MemoryRegionZ | |
>     | +----------------+ |
>     +--------------------+
>
> The memory_region_init_alias() flow is:
>
>   memory_region_init_alias()
>   -> memory_region_init()
>      -> object_initialize(TYPE_MEMORY_REGION)
>         -> memory_region_initfn()
>            -> mr->ops =3D &unassigned_mem_ops;
>
> Later when accessing offset=3Daddr1 via the alias, we expect to hit
> MemoryRegion1. The memory_region_dispatch_read() flow is:
>
>   memory_region_dispatch_read(addr1)
>   -> memory_region_access_valid(mr)   <- addr1 offset is ignored
>      -> mr->ops->valid.accepts()
>         -> unassigned_mem_accepts()
>         <- false
>      <- false
>    <- MEMTX_DECODE_ERROR
>
> The caller gets a MEMTX_DECODE_ERROR while the access is OK.
>
> Fix by dispatching aliases recursively, accessing its origin region
> after adding the alias offset.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> v4:
> - added ASCII schema
> v3:
> - reworded, mentioning the "alias to container" case
> - use recursive call instead of while(), because easier when debugging
>   therefore reset Richard R-b tag.
> v2:
> - use while()
> ---
>  softmmu/memory.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index d4493ef9e43..b899ca6a6b7 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -1442,6 +1442,11 @@ MemTxResult memory_region_dispatch_read(MemoryRegi=
on *mr,
>      unsigned size =3D memop_size(op);
>      MemTxResult r;
>
> +    if (mr->alias) {
> +        return memory_region_dispatch_read(mr->alias,
> +                                           mr->alias_offset + addr,
> +                                           pval, op, attrs);
> +    }
>      if (!memory_region_access_valid(mr, addr, size, false, attrs)) {
>          *pval =3D unassigned_mem_read(mr, addr, size);
>          return MEMTX_DECODE_ERROR;
> @@ -1486,6 +1491,11 @@ MemTxResult memory_region_dispatch_write(MemoryReg=
ion *mr,
>  {
>      unsigned size =3D memop_size(op);
>
> +    if (mr->alias) {
> +        return memory_region_dispatch_write(mr->alias,
> +                                            mr->alias_offset + addr,
> +                                            data, op, attrs);
> +    }
>      if (!memory_region_access_valid(mr, addr, size, true, attrs)) {
>          unassigned_mem_write(mr, addr, data, size);
>          return MEMTX_DECODE_ERROR;
> --
> 2.26.3
>


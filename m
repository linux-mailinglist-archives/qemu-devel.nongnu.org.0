Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B88824F56D4
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 09:30:00 +0200 (CEST)
Received: from localhost ([::1]:34900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc075-0003bW-94
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 03:29:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nc01q-0001TU-Il
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 03:24:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nc01o-0001qy-M0
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 03:24:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649229872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xqhkvLRcfgXx8pzzlFGiWEDqlKRT53IAPGWQ74H45yY=;
 b=XtE6XUgFazcNqMQqQY2V6y19yXc6jZKDRTSlcHiUY1qqK6ilbxiXNYeJ0ZmmwpvKOs1SYp
 aOr6vqZI8ojwvUlr6FYGsbfAwnxLqO29C10E/lQgORfF5XWfm8o9OxJQUxwRsVyZQbufH9
 /CwnIbDVjGpDQr+6mGYSVb5Vigif+2g=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-kUqL8NW0OzWyHa1WTQ7cmw-1; Wed, 06 Apr 2022 03:24:31 -0400
X-MC-Unique: kUqL8NW0OzWyHa1WTQ7cmw-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-2eb645be8dbso14181897b3.11
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 00:24:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xqhkvLRcfgXx8pzzlFGiWEDqlKRT53IAPGWQ74H45yY=;
 b=3rDw7MravCoRYnr3Fs/aXySnjaC+q0acqCZ2fLJt/KU5dR21To96l6wqaj+7Ra0MMO
 +Rv0fk/Ryv7tY5+DtipXjRz/tIJph/LqmlIrse7inQm/QB8wEv8KFSJuomgMrk8L+jCy
 yIcTXEUqoPbrWu6SgiPun9tka6lpcNmfZsrl74fCHyUCDEf6PPr5VCVvopaBj3tDnkRg
 qzpTge6g+bQYJOO0TySD9cPMDsCv5tPdvPp8YbXvvHSGwgftM4JajXICS3C8WuG0rUEK
 WNHjMfcn9TVNVyOWRzwAwWiPuCJK9RqsYDV/XpOs/M0ZZvFcETskS2lRRSmNp4ZjfxVM
 Y5mQ==
X-Gm-Message-State: AOAM532+h+n43TrUmBSfMMSlN43qc3SUfiB59EsdvhmHCq6luGsmqvXr
 V0gSb3rKycX4QJvWTZbdaX1XYM/Z8z7CxoPo7ldz4/LKRw/z20Hbf6jpFl+DXIptYRfYFPD3NRY
 JBbd0mARMAQiU6Lh8BXf+crVNDUOR270=
X-Received: by 2002:a81:d42:0:b0:2eb:6e52:15c5 with SMTP id
 63-20020a810d42000000b002eb6e5215c5mr5938609ywn.312.1649229869786; 
 Wed, 06 Apr 2022 00:24:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcSPWBzQa+K95l940i7vFzDQKN+FQm7HqOIa4TMXIqOuruMdkRj2v9p817fde/1KN3/em7DQZkMgz/A6qzYO0=
X-Received: by 2002:a81:d42:0:b0:2eb:6e52:15c5 with SMTP id
 63-20020a810d42000000b002eb6e5215c5mr5938602ywn.312.1649229869553; Wed, 06
 Apr 2022 00:24:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220325195130.62090-1-viktor.prutyanov@redhat.com>
 <20220325195130.62090-3-viktor.prutyanov@redhat.com>
In-Reply-To: <20220325195130.62090-3-viktor.prutyanov@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 6 Apr 2022 11:24:18 +0400
Message-ID: <CAMxuvaxyF88NcMz7YJK+hYvp50JB3LkMhY+Xb5E1cOQJagQt0A@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] dump/win_dump: add helper macros for Windows dump
 header access
To: Viktor Prutyanov <viktor.prutyanov@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "Vugenfirer, Yan" <yan@daynix.com>,
 =?UTF-8?B?TWF0aGlldS1EYXVkw6ksIFBoaWxpcHBl?= <f4bug@amsat.org>,
 viktor.prutyanov@phystech.edu, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 25, 2022 at 11:51 PM Viktor Prutyanov
<viktor.prutyanov@redhat.com> wrote:
>
> Perform read access to Windows dump header fields via helper macros.
> This is preparation for the next 32-bit guest Windows dump support.
>
> Signed-off-by: Viktor Prutyanov <viktor.prutyanov@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  dump/win_dump.c | 100 +++++++++++++++++++++++++++++++-----------------
>  1 file changed, 65 insertions(+), 35 deletions(-)
>
> diff --git a/dump/win_dump.c b/dump/win_dump.c
> index 29b6e4f670..df3b432ca5 100644
> --- a/dump/win_dump.c
> +++ b/dump/win_dump.c
> @@ -24,11 +24,25 @@
>  #include "hw/misc/vmcoreinfo.h"
>  #include "win_dump.h"
>
> -static size_t write_run(WinDumpPhyMemRun64 *run, int fd, Error **errp)
> +#define WIN_DUMP_PTR_SIZE sizeof(uint64_t)
> +
> +#define _WIN_DUMP_FIELD(f) (h->f)
> +#define WIN_DUMP_FIELD(field) _WIN_DUMP_FIELD(field)
> +
> +#define _WIN_DUMP_FIELD_PTR(f) ((void *)&h->f)
> +#define WIN_DUMP_FIELD_PTR(field) _WIN_DUMP_FIELD_PTR(field)
> +
> +#define _WIN_DUMP_FIELD_SIZE(f) sizeof(h->f)
> +#define WIN_DUMP_FIELD_SIZE(field) _WIN_DUMP_FIELD_SIZE(field)
> +
> +#define WIN_DUMP_CTX_SIZE sizeof(WinContext64)
> +
> +static size_t write_run(uint64_t base_page, uint64_t page_count,
> +        int fd, Error **errp)
>  {
>      void *buf;
> -    uint64_t addr =3D run->BasePage << TARGET_PAGE_BITS;
> -    uint64_t size =3D run->PageCount << TARGET_PAGE_BITS;
> +    uint64_t addr =3D base_page << TARGET_PAGE_BITS;
> +    uint64_t size =3D page_count << TARGET_PAGE_BITS;
>      uint64_t len, l;
>      size_t total =3D 0;
>
> @@ -59,13 +73,14 @@ static size_t write_run(WinDumpPhyMemRun64 *run, int =
fd, Error **errp)
>
>  static void write_runs(DumpState *s, WinDumpHeader64 *h, Error **errp)
>  {
> -    WinDumpPhyMemDesc64 *desc =3D &h->PhysicalMemoryBlock;
> -    WinDumpPhyMemRun64 *run =3D desc->Run;
> +    uint64_t BasePage, PageCount;
>      Error *local_err =3D NULL;
>      int i;
>
> -    for (i =3D 0; i < desc->NumberOfRuns; i++) {
> -        s->written_size +=3D write_run(run + i, s->fd, &local_err);
> +    for (i =3D 0; i < WIN_DUMP_FIELD(PhysicalMemoryBlock.NumberOfRuns); =
i++) {
> +        BasePage =3D WIN_DUMP_FIELD(PhysicalMemoryBlock.Run[i].BasePage)=
;
> +        PageCount =3D WIN_DUMP_FIELD(PhysicalMemoryBlock.Run[i].PageCoun=
t);
> +        s->written_size +=3D write_run(BasePage, PageCount, s->fd, &loca=
l_err);
>          if (local_err) {
>              error_propagate(errp, local_err);
>              return;
> @@ -73,11 +88,24 @@ static void write_runs(DumpState *s, WinDumpHeader64 =
*h, Error **errp)
>      }
>  }
>
> +static int cpu_read_ptr(CPUState *cpu, uint64_t addr, uint64_t *ptr)
> +{
> +    int ret;
> +    uint64_t ptr64;
> +
> +    ret =3D cpu_memory_rw_debug(cpu, addr, &ptr64, WIN_DUMP_PTR_SIZE, 0)=
;
> +
> +    *ptr =3D ptr64;
> +
> +    return ret;
> +}
> +
>  static void patch_mm_pfn_database(WinDumpHeader64 *h, Error **errp)
>  {
>      if (cpu_memory_rw_debug(first_cpu,
> -            h->KdDebuggerDataBlock + KDBG_MM_PFN_DATABASE_OFFSET64,
> -            (uint8_t *)&h->PfnDatabase, sizeof(h->PfnDatabase), 0)) {
> +            WIN_DUMP_FIELD(KdDebuggerDataBlock) + KDBG_MM_PFN_DATABASE_O=
FFSET64,
> +            WIN_DUMP_FIELD_PTR(PfnDatabase),
> +            WIN_DUMP_FIELD_SIZE(PfnDatabase), 0)) {
>          error_setg(errp, "win-dump: failed to read MmPfnDatabase");
>          return;
>      }
> @@ -87,16 +115,17 @@ static void patch_bugcheck_data(WinDumpHeader64 *h, =
Error **errp)
>  {
>      uint64_t KiBugcheckData;
>
> -    if (cpu_memory_rw_debug(first_cpu,
> -            h->KdDebuggerDataBlock + KDBG_KI_BUGCHECK_DATA_OFFSET64,
> -            (uint8_t *)&KiBugcheckData, sizeof(KiBugcheckData), 0)) {
> +    if (cpu_read_ptr(first_cpu,
> +            WIN_DUMP_FIELD(KdDebuggerDataBlock) +
> +                KDBG_KI_BUGCHECK_DATA_OFFSET64,
> +            &KiBugcheckData)) {
>          error_setg(errp, "win-dump: failed to read KiBugcheckData");
>          return;
>      }
>
> -    if (cpu_memory_rw_debug(first_cpu,
> -            KiBugcheckData,
> -            h->BugcheckData, sizeof(h->BugcheckData), 0)) {
> +    if (cpu_memory_rw_debug(first_cpu, KiBugcheckData,
> +            WIN_DUMP_FIELD(BugcheckData),
> +            WIN_DUMP_FIELD_SIZE(BugcheckData), 0)) {
>          error_setg(errp, "win-dump: failed to read bugcheck data");
>          return;
>      }
> @@ -105,8 +134,8 @@ static void patch_bugcheck_data(WinDumpHeader64 *h, E=
rror **errp)
>       * If BugcheckCode wasn't saved, we consider guest OS as alive.
>       */
>
> -    if (!h->BugcheckCode) {
> -        h->BugcheckCode =3D LIVE_SYSTEM_DUMP;
> +    if (!WIN_DUMP_FIELD(BugcheckCode)) {
> +        *(uint32_t *)WIN_DUMP_FIELD_PTR(BugcheckCode) =3D LIVE_SYSTEM_DU=
MP;
>      }
>  }
>
> @@ -155,7 +184,7 @@ static void check_kdbg(WinDumpHeader64 *h, Error **er=
rp)
>  {
>      const char OwnerTag[] =3D "KDBG";
>      char read_OwnerTag[4];
> -    uint64_t KdDebuggerDataBlock =3D h->KdDebuggerDataBlock;
> +    uint64_t KdDebuggerDataBlock =3D WIN_DUMP_FIELD(KdDebuggerDataBlock)=
;
>      bool try_fallback =3D true;
>
>  try_again:
> @@ -174,7 +203,7 @@ try_again:
>               * we try to use KDBG obtained by guest driver.
>               */
>
> -            KdDebuggerDataBlock =3D h->BugcheckParameter1;
> +            KdDebuggerDataBlock =3D WIN_DUMP_FIELD(BugcheckParameter1);
>              try_fallback =3D false;
>              goto try_again;
>          } else {
> @@ -197,20 +226,21 @@ static void patch_and_save_context(WinDumpHeader64 =
*h,
>                                     struct saved_context *saved_ctx,
>                                     Error **errp)
>  {
> +    uint64_t KdDebuggerDataBlock =3D WIN_DUMP_FIELD(KdDebuggerDataBlock)=
;
>      uint64_t KiProcessorBlock;
>      uint16_t OffsetPrcbContext;
>      CPUState *cpu;
>      int i =3D 0;
>
> -    if (cpu_memory_rw_debug(first_cpu,
> -            h->KdDebuggerDataBlock + KDBG_KI_PROCESSOR_BLOCK_OFFSET64,
> -            (uint8_t *)&KiProcessorBlock, sizeof(KiProcessorBlock), 0)) =
{
> +    if (cpu_read_ptr(first_cpu,
> +            KdDebuggerDataBlock + KDBG_KI_PROCESSOR_BLOCK_OFFSET64,
> +            &KiProcessorBlock)) {
>          error_setg(errp, "win-dump: failed to read KiProcessorBlock");
>          return;
>      }
>
>      if (cpu_memory_rw_debug(first_cpu,
> -            h->KdDebuggerDataBlock + KDBG_OFFSET_PRCB_CONTEXT_OFFSET64,
> +            KdDebuggerDataBlock + KDBG_OFFSET_PRCB_CONTEXT_OFFSET64,
>              (uint8_t *)&OffsetPrcbContext, sizeof(OffsetPrcbContext), 0)=
) {
>          error_setg(errp, "win-dump: failed to read OffsetPrcbContext");
>          return;
> @@ -223,17 +253,17 @@ static void patch_and_save_context(WinDumpHeader64 =
*h,
>          uint64_t Context;
>          WinContext64 ctx;
>
> -        if (cpu_memory_rw_debug(first_cpu,
> -                KiProcessorBlock + i * sizeof(uint64_t),
> -                (uint8_t *)&Prcb, sizeof(Prcb), 0)) {
> +        if (cpu_read_ptr(first_cpu,
> +                KiProcessorBlock + i * WIN_DUMP_PTR_SIZE,
> +                &Prcb)) {
>              error_setg(errp, "win-dump: failed to read"
>                               " CPU #%d PRCB location", i);
>              return;
>          }
>
> -        if (cpu_memory_rw_debug(first_cpu,
> +        if (cpu_read_ptr(first_cpu,
>                  Prcb + OffsetPrcbContext,
> -                (uint8_t *)&Context, sizeof(Context), 0)) {
> +                &Context)) {
>              error_setg(errp, "win-dump: failed to read"
>                               " CPU #%d ContextFrame location", i);
>              return;
> @@ -284,13 +314,13 @@ static void patch_and_save_context(WinDumpHeader64 =
*h,
>          };
>
>          if (cpu_memory_rw_debug(first_cpu, Context,
> -                (uint8_t *)&saved_ctx[i].ctx, sizeof(WinContext64), 0)) =
{
> +                &saved_ctx[i].ctx, WIN_DUMP_CTX_SIZE, 0)) {
>              error_setg(errp, "win-dump: failed to save CPU #%d context",=
 i);
>              return;
>          }
>
>          if (cpu_memory_rw_debug(first_cpu, Context,
> -                (uint8_t *)&ctx, sizeof(WinContext64), 1)) {
> +                &ctx, WIN_DUMP_CTX_SIZE, 1)) {
>              error_setg(errp, "win-dump: failed to write CPU #%d context"=
, i);
>              return;
>          }
> @@ -304,9 +334,9 @@ static void restore_context(WinDumpHeader64 *h,
>  {
>      int i;
>
> -    for (i =3D 0; i < h->NumberProcessors; i++) {
> +    for (i =3D 0; i < WIN_DUMP_FIELD(NumberProcessors); i++) {
>          if (cpu_memory_rw_debug(first_cpu, saved_ctx[i].addr,
> -                (uint8_t *)&saved_ctx[i].ctx, sizeof(WinContext64), 1)) =
{
> +                &saved_ctx[i].ctx, WIN_DUMP_CTX_SIZE, 1)) {
>              warn_report("win-dump: failed to restore CPU #%d context", i=
);
>          }
>      }
> @@ -338,7 +368,7 @@ void create_win_dump(DumpState *s, Error **errp)
>       * should be made from system context.
>       */
>
> -    first_x86_cpu->env.cr[3] =3D h->DirectoryTableBase;
> +    first_x86_cpu->env.cr[3] =3D WIN_DUMP_FIELD(DirectoryTableBase);
>
>      check_kdbg(h, &local_err);
>      if (local_err) {
> @@ -348,7 +378,7 @@ void create_win_dump(DumpState *s, Error **errp)
>
>      patch_header(h);
>
> -    saved_ctx =3D g_new(struct saved_context, h->NumberProcessors);
> +    saved_ctx =3D g_new(struct saved_context, WIN_DUMP_FIELD(NumberProce=
ssors));
>
>      /*
>       * Always patch context because there is no way
> @@ -361,7 +391,7 @@ void create_win_dump(DumpState *s, Error **errp)
>          goto out_free;
>      }
>
> -    s->total_size =3D h->RequiredDumpSpace;
> +    s->total_size =3D WIN_DUMP_FIELD(RequiredDumpSpace);
>
>      s->written_size =3D qemu_write_full(s->fd, h, sizeof(*h));
>      if (s->written_size !=3D sizeof(*h)) {
> --
> 2.35.1
>



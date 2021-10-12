Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C614442A7F3
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 17:11:18 +0200 (CEST)
Received: from localhost ([::1]:36758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maJQz-0008Jc-Is
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 11:11:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1maJOP-000601-8n
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 11:08:37 -0400
Received: from smtpout140.security-mail.net ([85.31.212.143]:6983
 helo=fx403.security-mail.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1maJOM-00051f-0W
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 11:08:36 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx403.security-mail.net (Postfix) with ESMTP id 9DDB8183DA7
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 17:08:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1634051308;
 bh=qhwmJozwUk5PsjUpqxumphytH4Ao0omzBHBwVKygyYs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=h2HbHTrBnJirZ4C1EYYn+qEOwrCywPN+41LOpq7B8t0wmJs/aCZOfgSC9rboJSnjg
 GBtsQLP957HxItuIXDBZY757L484140d72/hT1RhiFobBGRR4n1P6JM326IC8f1ZG4
 sKt/i9tN1CD+NKCKKq48bT5Y7wxeLV9fjcX+kuP0=
Received: from fx403 (localhost [127.0.0.1]) by fx403.security-mail.net
 (Postfix) with ESMTP id BF6C3183D77; Tue, 12 Oct 2021 17:08:26 +0200 (CEST)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx403.security-mail.net (Postfix) with ESMTPS id 395EC183D47; Tue, 12 Oct
 2021 17:08:24 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 47C3427E0350; Tue, 12 Oct 2021
 17:08:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 2FF5E27E035A; Tue, 12 Oct 2021 17:08:24 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 RP2Vy3r5HZdI; Tue, 12 Oct 2021 17:08:24 +0200 (CEST)
Received: from localhost (unknown [192.168.36.68]) by zimbra2.kalray.eu
 (Postfix) with ESMTPSA id 1562227E0350; Tue, 12 Oct 2021 17:08:24 +0200
 (CEST)
X-Virus-Scanned: E-securemail, by Secumail
Secumail-id: <d207.6165a4e8.6188a.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 2FF5E27E035A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1634051304;
 bh=GR2zSe8966XQPWUR4XFkNuznXor+Is+FAubIWt2TGyc=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=dj5U3728aDILdfBdsiySZswYeaW3JOxbHWN+ZkTp7ou3isc+oQaH+bAfR631+/SpI
 pGUBhoL0DdKz7TD+ZarqMpZOuCAV0U7tGbJQ0qXfsQobXCvw/0ej2V94pBGI8XUiL4
 85et9zZAu1THqTGKTYHilYu2j7KgxVLVcQLi6nUc=
Date: Tue, 12 Oct 2021 17:08:23 +0200
From: Luc Michel <lmichel@kalray.eu>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Philippe =?utf-8?b?TWF0aGlldS1EYXVkw6k=?=
 <f4bug@amsat.org>, Stefano Garzarella <sgarzare@redhat.com>,
 qemu-trivial@nongnu.org
Subject: Re: [PATCH] hw/elf_ops.h: switch to ssize_t for elf loader return type
Message-ID: <20211012150823.zoown5oxlbhuu7bl@ws2101.lin.mbt.kalray.eu>
References: <20211006192839.17720-1-lmichel@kalray.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211006192839.17720-1-lmichel@kalray.eu>
User-Agent: NeoMutt/20171215
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ALTERMIMEV2_out: done
Received-SPF: pass client-ip=85.31.212.143; envelope-from=lmichel@kalray.eu;
 helo=fx403.security-mail.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21:28 Wed 06 Oct     , Luc Michel wrote:
> Until now, int was used as the return type for all the ELF
> loader related functions. The returned value is the sum of all loaded
> program headers "MemSize" fields.
> 
> Because of the overflow check in elf_ops.h, trying to load an ELF bigger
> than INT_MAX will fail. Switch to ssize_t to remove this limitation.
> 
> Signed-off-by: Luc Michel <lmichel@kalray.eu>

Ping?
Cc'ing qemu-trivial. I guess it's simple enough.

Thanks.

-- 
Luc

> ---
>  include/hw/elf_ops.h | 25 +++++++++---------
>  include/hw/loader.h  | 60 ++++++++++++++++++++++----------------------
>  hw/core/loader.c     | 60 +++++++++++++++++++++++---------------------
>  3 files changed, 74 insertions(+), 71 deletions(-)
> 
> diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
> index 1c37cec4ae..5c2ea0339e 100644
> --- a/include/hw/elf_ops.h
> +++ b/include/hw/elf_ops.h
> @@ -310,24 +310,25 @@ static struct elf_note *glue(get_elf_note_type, SZ)(struct elf_note *nhdr,
>      }
>  
>      return nhdr;
>  }
>  
> -static int glue(load_elf, SZ)(const char *name, int fd,
> -                              uint64_t (*elf_note_fn)(void *, void *, bool),
> -                              uint64_t (*translate_fn)(void *, uint64_t),
> -                              void *translate_opaque,
> -                              int must_swab, uint64_t *pentry,
> -                              uint64_t *lowaddr, uint64_t *highaddr,
> -                              uint32_t *pflags, int elf_machine,
> -                              int clear_lsb, int data_swab,
> -                              AddressSpace *as, bool load_rom,
> -                              symbol_fn_t sym_cb)
> +static ssize_t glue(load_elf, SZ)(const char *name, int fd,
> +                                  uint64_t (*elf_note_fn)(void *, void *, bool),
> +                                  uint64_t (*translate_fn)(void *, uint64_t),
> +                                  void *translate_opaque,
> +                                  int must_swab, uint64_t *pentry,
> +                                  uint64_t *lowaddr, uint64_t *highaddr,
> +                                  uint32_t *pflags, int elf_machine,
> +                                  int clear_lsb, int data_swab,
> +                                  AddressSpace *as, bool load_rom,
> +                                  symbol_fn_t sym_cb)
>  {
>      struct elfhdr ehdr;
>      struct elf_phdr *phdr = NULL, *ph;
> -    int size, i, total_size;
> +    int size, i;
> +    ssize_t total_size;
>      elf_word mem_size, file_size, data_offset;
>      uint64_t addr, low = (uint64_t)-1, high = 0;
>      GMappedFile *mapped_file = NULL;
>      uint8_t *data = NULL;
>      int ret = ELF_LOAD_FAILED;
> @@ -480,11 +481,11 @@ static int glue(load_elf, SZ)(const char *name, int fd,
>                          }
>                      }
>                  }
>              }
>  
> -            if (mem_size > INT_MAX - total_size) {
> +            if (mem_size > SSIZE_MAX - total_size) {
>                  ret = ELF_LOAD_TOO_BIG;
>                  goto fail;
>              }
>  
>              /* address_offset is hack for kernel images that are
> diff --git a/include/hw/loader.h b/include/hw/loader.h
> index 81104cb02f..4fa485bd61 100644
> --- a/include/hw/loader.h
> +++ b/include/hw/loader.h
> @@ -88,11 +88,11 @@ int load_image_gzipped(const char *filename, hwaddr addr, uint64_t max_sz);
>  #define ELF_LOAD_FAILED       -1
>  #define ELF_LOAD_NOT_ELF      -2
>  #define ELF_LOAD_WRONG_ARCH   -3
>  #define ELF_LOAD_WRONG_ENDIAN -4
>  #define ELF_LOAD_TOO_BIG      -5
> -const char *load_elf_strerror(int error);
> +const char *load_elf_strerror(ssize_t error);
>  
>  /** load_elf_ram_sym:
>   * @filename: Path of ELF file
>   * @elf_note_fn: optional function to parse ELF Note type
>   *               passed via @translate_opaque
> @@ -126,52 +126,52 @@ const char *load_elf_strerror(int error);
>   * ELF header and no checks will be carried out against the machine type.
>   */
>  typedef void (*symbol_fn_t)(const char *st_name, int st_info,
>                              uint64_t st_value, uint64_t st_size);
>  
> -int load_elf_ram_sym(const char *filename,
> +ssize_t load_elf_ram_sym(const char *filename,
> +                         uint64_t (*elf_note_fn)(void *, void *, bool),
> +                         uint64_t (*translate_fn)(void *, uint64_t),
> +                         void *translate_opaque, uint64_t *pentry,
> +                         uint64_t *lowaddr, uint64_t *highaddr,
> +                         uint32_t *pflags, int big_endian, int elf_machine,
> +                         int clear_lsb, int data_swab,
> +                         AddressSpace *as, bool load_rom, symbol_fn_t sym_cb);
> +
> +/** load_elf_ram:
> + * Same as load_elf_ram_sym(), but doesn't allow the caller to specify a
> + * symbol callback function
> + */
> +ssize_t load_elf_ram(const char *filename,
>                       uint64_t (*elf_note_fn)(void *, void *, bool),
>                       uint64_t (*translate_fn)(void *, uint64_t),
>                       void *translate_opaque, uint64_t *pentry,
>                       uint64_t *lowaddr, uint64_t *highaddr, uint32_t *pflags,
> -                     int big_endian, int elf_machine,
> -                     int clear_lsb, int data_swab,
> -                     AddressSpace *as, bool load_rom, symbol_fn_t sym_cb);
> -
> -/** load_elf_ram:
> - * Same as load_elf_ram_sym(), but doesn't allow the caller to specify a
> - * symbol callback function
> - */
> -int load_elf_ram(const char *filename,
> -                 uint64_t (*elf_note_fn)(void *, void *, bool),
> -                 uint64_t (*translate_fn)(void *, uint64_t),
> -                 void *translate_opaque, uint64_t *pentry, uint64_t *lowaddr,
> -                 uint64_t *highaddr, uint32_t *pflags, int big_endian,
> -                 int elf_machine, int clear_lsb, int data_swab,
> -                 AddressSpace *as, bool load_rom);
> +                     int big_endian, int elf_machine, int clear_lsb,
> +                     int data_swab, AddressSpace *as, bool load_rom);
>  
>  /** load_elf_as:
>   * Same as load_elf_ram(), but always loads the elf as ROM
>   */
> -int load_elf_as(const char *filename,
> -                uint64_t (*elf_note_fn)(void *, void *, bool),
> -                uint64_t (*translate_fn)(void *, uint64_t),
> -                void *translate_opaque, uint64_t *pentry, uint64_t *lowaddr,
> -                uint64_t *highaddr, uint32_t *pflags, int big_endian,
> -                int elf_machine, int clear_lsb, int data_swab,
> -                AddressSpace *as);
> +ssize_t load_elf_as(const char *filename,
> +                    uint64_t (*elf_note_fn)(void *, void *, bool),
> +                    uint64_t (*translate_fn)(void *, uint64_t),
> +                    void *translate_opaque, uint64_t *pentry, uint64_t *lowaddr,
> +                    uint64_t *highaddr, uint32_t *pflags, int big_endian,
> +                    int elf_machine, int clear_lsb, int data_swab,
> +                    AddressSpace *as);
>  
>  /** load_elf:
>   * Same as load_elf_as(), but doesn't allow the caller to specify an
>   * AddressSpace.
>   */
> -int load_elf(const char *filename,
> -             uint64_t (*elf_note_fn)(void *, void *, bool),
> -             uint64_t (*translate_fn)(void *, uint64_t),
> -             void *translate_opaque, uint64_t *pentry, uint64_t *lowaddr,
> -             uint64_t *highaddr, uint32_t *pflags, int big_endian,
> -             int elf_machine, int clear_lsb, int data_swab);
> +ssize_t load_elf(const char *filename,
> +                 uint64_t (*elf_note_fn)(void *, void *, bool),
> +                 uint64_t (*translate_fn)(void *, uint64_t),
> +                 void *translate_opaque, uint64_t *pentry, uint64_t *lowaddr,
> +                 uint64_t *highaddr, uint32_t *pflags, int big_endian,
> +                 int elf_machine, int clear_lsb, int data_swab);
>  
>  /** load_elf_hdr:
>   * @filename: Path of ELF file
>   * @hdr: Buffer to populate with header data. Header data will not be
>   * filled if set to NULL.
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index c623318b73..c7f97fdce8 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -324,11 +324,11 @@ static void *load_at(int fd, off_t offset, size_t size)
>  #define elf_sword        int64_t
>  #define bswapSZs	bswap64s
>  #define SZ		64
>  #include "hw/elf_ops.h"
>  
> -const char *load_elf_strerror(int error)
> +const char *load_elf_strerror(ssize_t error)
>  {
>      switch (error) {
>      case 0:
>          return "No error";
>      case ELF_LOAD_FAILED:
> @@ -400,62 +400,64 @@ void load_elf_hdr(const char *filename, void *hdr, bool *is64, Error **errp)
>  fail:
>      close(fd);
>  }
>  
>  /* return < 0 if error, otherwise the number of bytes loaded in memory */
> -int load_elf(const char *filename,
> -             uint64_t (*elf_note_fn)(void *, void *, bool),
> -             uint64_t (*translate_fn)(void *, uint64_t),
> -             void *translate_opaque, uint64_t *pentry, uint64_t *lowaddr,
> -             uint64_t *highaddr, uint32_t *pflags, int big_endian,
> -             int elf_machine, int clear_lsb, int data_swab)
> +ssize_t load_elf(const char *filename,
> +                 uint64_t (*elf_note_fn)(void *, void *, bool),
> +                 uint64_t (*translate_fn)(void *, uint64_t),
> +                 void *translate_opaque, uint64_t *pentry, uint64_t *lowaddr,
> +                 uint64_t *highaddr, uint32_t *pflags, int big_endian,
> +                 int elf_machine, int clear_lsb, int data_swab)
>  {
>      return load_elf_as(filename, elf_note_fn, translate_fn, translate_opaque,
>                         pentry, lowaddr, highaddr, pflags, big_endian,
>                         elf_machine, clear_lsb, data_swab, NULL);
>  }
>  
>  /* return < 0 if error, otherwise the number of bytes loaded in memory */
> -int load_elf_as(const char *filename,
> -                uint64_t (*elf_note_fn)(void *, void *, bool),
> -                uint64_t (*translate_fn)(void *, uint64_t),
> -                void *translate_opaque, uint64_t *pentry, uint64_t *lowaddr,
> -                uint64_t *highaddr, uint32_t *pflags, int big_endian,
> -                int elf_machine, int clear_lsb, int data_swab, AddressSpace *as)
> +ssize_t load_elf_as(const char *filename,
> +                    uint64_t (*elf_note_fn)(void *, void *, bool),
> +                    uint64_t (*translate_fn)(void *, uint64_t),
> +                    void *translate_opaque, uint64_t *pentry, uint64_t *lowaddr,
> +                    uint64_t *highaddr, uint32_t *pflags, int big_endian,
> +                    int elf_machine, int clear_lsb, int data_swab,
> +                    AddressSpace *as)
>  {
>      return load_elf_ram(filename, elf_note_fn, translate_fn, translate_opaque,
>                          pentry, lowaddr, highaddr, pflags, big_endian,
>                          elf_machine, clear_lsb, data_swab, as, true);
>  }
>  
>  /* return < 0 if error, otherwise the number of bytes loaded in memory */
> -int load_elf_ram(const char *filename,
> -                 uint64_t (*elf_note_fn)(void *, void *, bool),
> -                 uint64_t (*translate_fn)(void *, uint64_t),
> -                 void *translate_opaque, uint64_t *pentry, uint64_t *lowaddr,
> -                 uint64_t *highaddr, uint32_t *pflags, int big_endian,
> -                 int elf_machine, int clear_lsb, int data_swab,
> -                 AddressSpace *as, bool load_rom)
> +ssize_t load_elf_ram(const char *filename,
> +                     uint64_t (*elf_note_fn)(void *, void *, bool),
> +                     uint64_t (*translate_fn)(void *, uint64_t),
> +                     void *translate_opaque, uint64_t *pentry,
> +                     uint64_t *lowaddr, uint64_t *highaddr, uint32_t *pflags,
> +                     int big_endian, int elf_machine, int clear_lsb,
> +                     int data_swab, AddressSpace *as, bool load_rom)
>  {
>      return load_elf_ram_sym(filename, elf_note_fn,
>                              translate_fn, translate_opaque,
>                              pentry, lowaddr, highaddr, pflags, big_endian,
>                              elf_machine, clear_lsb, data_swab, as,
>                              load_rom, NULL);
>  }
>  
>  /* return < 0 if error, otherwise the number of bytes loaded in memory */
> -int load_elf_ram_sym(const char *filename,
> -                     uint64_t (*elf_note_fn)(void *, void *, bool),
> -                     uint64_t (*translate_fn)(void *, uint64_t),
> -                     void *translate_opaque, uint64_t *pentry,
> -                     uint64_t *lowaddr, uint64_t *highaddr, uint32_t *pflags,
> -                     int big_endian, int elf_machine,
> -                     int clear_lsb, int data_swab,
> -                     AddressSpace *as, bool load_rom, symbol_fn_t sym_cb)
> +ssize_t load_elf_ram_sym(const char *filename,
> +                         uint64_t (*elf_note_fn)(void *, void *, bool),
> +                         uint64_t (*translate_fn)(void *, uint64_t),
> +                         void *translate_opaque, uint64_t *pentry,
> +                         uint64_t *lowaddr, uint64_t *highaddr,
> +                         uint32_t *pflags, int big_endian, int elf_machine,
> +                         int clear_lsb, int data_swab,
> +                         AddressSpace *as, bool load_rom, symbol_fn_t sym_cb)
>  {
> -    int fd, data_order, target_data_order, must_swab, ret = ELF_LOAD_FAILED;
> +    int fd, data_order, target_data_order, must_swab;
> +    ssize_t ret = ELF_LOAD_FAILED;
>      uint8_t e_ident[EI_NIDENT];
>  
>      fd = open(filename, O_RDONLY | O_BINARY);
>      if (fd < 0) {
>          perror(filename);
> -- 
> 2.17.1
> 

-- 






Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCA929CB18
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 22:20:15 +0100 (CET)
Received: from localhost ([::1]:37556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXWO6-0001F9-B7
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 17:20:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kXWLa-00086o-Vf
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 17:17:38 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:41130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kXWLX-0003SP-Rc
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 17:17:38 -0400
Received: by mail-io1-xd41.google.com with SMTP id u62so3135176iod.8
 for <qemu-devel@nongnu.org>; Tue, 27 Oct 2020 14:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZSnAwrAd1wQA6wUgjxg+ZVGA606Y/TvmH9nSuMEtqZ0=;
 b=hYBcoUpGBrkkR1xyI6PyaULjEHLIZdPDB/ZRF84egA0eu2J2Q7XV+Hp85BuMwR9rCR
 D7kAAzuId8/I9+fzfjWFFe0OIdJR4YSjZ7rGUIKXXm5k7mZsbFdqP+36ppq9+jLRDrT9
 aKn5BtGOX+MetH9SUlUONfpf2y78o0PnaaZ9fXBovbYJsFJDxGOomKkkNaRQ6k0rwFa5
 hk6emA2/bh1AKmWqvG7zgG2ZVIABHNT6Mjacw6b0uXUHlgaMKPvRfLJzU0TAwKury3QI
 jf0orKfJaL/aDaiWVhnCn96OSHeGKPklVMSiC0o3Tv03TD4nXQvL1TB9fxyuZYZ3DnOK
 NwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZSnAwrAd1wQA6wUgjxg+ZVGA606Y/TvmH9nSuMEtqZ0=;
 b=SSewrLGfjvXf38oM5DtZeHS9ynGiEnSY76lviCDjzL1Mghg4VbxMIOPoNuCTLiYDVO
 1YW/li3gdESg9QTdSnyxVGIIn96evNT2xb3QCuJzYF/0ZCubeAntvWRCfRPU57xrEhMK
 F+tXJczh/sWPIPhC3ZTP3396MSEzv97xDLrqMkvbuEN73YHhdpztNnDaHj6WfbI8HzyR
 WBhxwAYSBXbSJy+fAKlHV8whvl0aI3OJLDLcF7RSZV1FRgWOidWBJ+5FEsllxCNSnxGW
 9IQDgWbJE7XENo9Z1Oo3HEV7+tclWQvIhNJZuQpxRalc0PqQv++mSf6fvpc6+w6U6paK
 a8Kw==
X-Gm-Message-State: AOAM532eob0o8ip6P1beAEn1TVVbJzg7ox9g9HnYQE3CCitb5PTuIRJl
 C0Cwm6yKTpof3YONsicaGuPq499c78OvHfovhwI=
X-Google-Smtp-Source: ABdhPJzlJf5hZuAxExFBRYvD3deOdu0wNMlBL/TsLjkcSv8ztMxj0e9UXBha16OlmTWwm6ssE9RmAEh+yeuVYSuS2ZA=
X-Received: by 2002:a5d:9a8d:: with SMTP id c13mr3669679iom.176.1603833454016; 
 Tue, 27 Oct 2020 14:17:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200827123859.81793-1-ysato@users.sourceforge.jp>
 <20200827123859.81793-2-ysato@users.sourceforge.jp>
In-Reply-To: <20200827123859.81793-2-ysato@users.sourceforge.jp>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 27 Oct 2020 14:05:44 -0700
Message-ID: <CAKmqyKOi3a2+krV5v_gnedUcVB_37607UjkFa1r8ZTVUTZmVYA@mail.gmail.com>
Subject: Re: [PATCH 01/20] loader.c: Add support Motrola S-record format.
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d41;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 27, 2020 at 5:39 AM Yoshinori Sato
<ysato@users.sourceforge.jp> wrote:
>
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>  include/hw/loader.h |  14 +++
>  hw/core/loader.c    | 208 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 222 insertions(+)
>
> diff --git a/include/hw/loader.h b/include/hw/loader.h
> index a9eeea3952..6f1fb62ded 100644
> --- a/include/hw/loader.h
> +++ b/include/hw/loader.h
> @@ -55,6 +55,20 @@ int load_image_targphys_as(const char *filename,
>   */
>  int load_targphys_hex_as(const char *filename, hwaddr *entry, AddressSpace *as);
>
> +/*
> + * load_targphys_srec_as:
> + * @filename: Path to the .hex file
> + * @entry: Store the entry point given by the .hex file
> + * @as: The AddressSpace to load the .hex file to. The value of
> + *      address_space_memory is used if nothing is supplied here.
> + *
> + * Load a fixed .srec file into memory.
> + *
> + * Returns the size of the loaded .hex file on success, -1 otherwise.
> + */
> +int load_targphys_srec_as(const char *filename,
> +                          hwaddr *entry, AddressSpace *as);
> +
>  /** load_image_targphys:
>   * Same as load_image_targphys_as(), but doesn't allow the caller to specify
>   * an AddressSpace.
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index 8bbb1797a4..6964b04ec7 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -1618,3 +1618,211 @@ int load_targphys_hex_as(const char *filename, hwaddr *entry, AddressSpace *as)
>      g_free(hex_blob);
>      return total_size;
>  }
> +
> +typedef enum {
> +    SREC_SOH,
> +    SREC_TYPE,
> +    SREC_LEN,
> +    SREC_ADDR,
> +    SREC_DATA,
> +    SREC_SKIP,
> +    SREC_SUM,
> +} srec_state;
> +
> +typedef struct {
> +    srec_state state;
> +    int nibble;
> +    int total_size;
> +    uint32_t address;
> +    uint32_t topaddr;
> +    uint32_t bufremain;
> +    int length;
> +    int addr_len;
> +    int record_type;
> +    uint8_t byte;
> +    uint8_t data[DATA_FIELD_MAX_LEN];
> +    uint8_t *datap;
> +    uint8_t *bufptr;
> +    uint8_t sum;
> +} SrecLine;
> +
> +static bool parse_srec_line(SrecLine *line, char c)
> +{
> +    if (!g_ascii_isxdigit(c)) {
> +        return false;
> +    }
> +    line->byte <<= 4;
> +    line->byte |= g_ascii_xdigit_value(c);
> +    line->nibble++;
> +    if (line->nibble == 2) {
> +        line->nibble = 0;
> +        line->length--;
> +        line->sum += line->byte;
> +        switch (line->state) {
> +        case SREC_SOH:
> +        case SREC_TYPE:
> +            /* first 2chars ignore parse */
> +            break;
> +        case SREC_LEN:
> +            line->sum = line->length = line->byte;
> +            if (line->addr_len > 0) {
> +                line->state = SREC_ADDR;
> +                line->address = 0;
> +            } else {
> +                line->state = SREC_SKIP;
> +            }
> +            break;
> +        case SREC_ADDR:
> +            line->address <<= 8;
> +            line->address |= line->byte;
> +            if (--line->addr_len == 0) {
> +                if (line->length > 1) {
> +                    if (line->record_type != 0) {
> +                        line->state = SREC_DATA;
> +                    } else {
> +                        line->state = SREC_SKIP;
> +                    }
> +                    line->datap = line->data;
> +                } else {
> +                    line->state = SREC_SUM;
> +                }
> +            }
> +            break;
> +        case SREC_DATA:
> +            *line->datap++ = line->byte;
> +            /* fail through */

s/fail/fall/g

> +        case SREC_SKIP:
> +            if (line->length == 1) {
> +                line->state = SREC_SUM;
> +            }
> +            break;
> +        case SREC_SUM:
> +            if ((line->sum & 0xff) != 0xff) {
> +                return false;
> +            }
> +        }
> +    }
> +    return true;
> +}
> +
> +#define SRECBUFSIZE 0x40000
> +
> +/* return size or -1 if error */
> +static int parse_srec_blob(const char *filename, hwaddr *addr,
> +                           uint8_t *hex_blob, size_t hex_blob_size,
> +                           AddressSpace *as)
> +{
> +    SrecLine line;
> +    size_t len;
> +    int total_len = 0;
> +    uint8_t *end = hex_blob + hex_blob_size;
> +    rom_transaction_begin();
> +    line.state = SREC_SOH;
> +    line.bufptr = g_malloc(SRECBUFSIZE);
> +    line.bufremain = SRECBUFSIZE;
> +    line.topaddr = UINT32_MAX;
> +    for (; hex_blob < end; ++hex_blob) {
> +        switch (*hex_blob) {
> +        case '\r':
> +        case '\n':
> +            if (line.state == SREC_SUM) {
> +                switch (line.record_type) {

What if a file starts with a new line, won't line.record_type be invalid?

Alistair

> +                case 1:
> +                case 2:
> +                case 3:
> +                    len = line.datap - line.data;
> +                    if (line.topaddr == UINT32_MAX) {
> +                        line.topaddr = line.address;
> +                    }
> +                    if (line.bufremain < len || line.address < line.topaddr) {
> +                        rom_add_blob_fixed_as(filename, line.bufptr,
> +                                              SRECBUFSIZE - line.bufremain,
> +                                              line.topaddr, as);
> +                        line.topaddr = line.address;
> +                        line.bufremain = SRECBUFSIZE;
> +                    }
> +                    memcpy(line.bufptr + (line.address  - line.topaddr),
> +                           line.data, len);
> +                    line.bufremain -= len;
> +                    total_len += len;
> +                    break;
> +                case 7:
> +                case 8:
> +                case 9:
> +                    *addr = line.address;
> +                    break;
> +                }
> +                line.state = SREC_SOH;
> +            }
> +            break;
> +        /* start of a new record. */
> +        case 'S':
> +            if (line.state != SREC_SOH) {
> +                total_len = -1;
> +                goto out;
> +            }
> +            line.state = SREC_TYPE;
> +            break;
> +        /* decoding lines */
> +        default:
> +            if (line.state == SREC_TYPE) {
> +                if (g_ascii_isdigit(*hex_blob)) {
> +                    line.record_type = g_ascii_digit_value(*hex_blob);
> +                    switch (line.record_type) {
> +                    case 1:
> +                    case 2:
> +                    case 3:
> +                        line.addr_len = 1 + line.record_type;
> +                        break;
> +                    case 0:
> +                    case 5:
> +                        line.addr_len = 2;
> +                        break;
> +                    case 7:
> +                    case 8:
> +                    case 9:
> +                        line.addr_len = 11 - line.record_type;
> +                        break;
> +                    default:
> +                        line.addr_len = 0;
> +                    }
> +                }
> +                line.state = SREC_LEN;
> +                line.nibble = 0;
> +            } else {
> +                if (!parse_srec_line(&line, *hex_blob)) {
> +                    total_len = -1;
> +                    goto out;
> +                }
> +            }
> +            break;
> +        }
> +    }
> +    if (line.bufremain < SRECBUFSIZE) {
> +        rom_add_blob_fixed_as(filename, line.bufptr,
> +                              SRECBUFSIZE - line.bufremain,
> +                              line.topaddr, as);
> +    }
> +out:
> +    rom_transaction_end(total_len != -1);
> +    g_free(line.bufptr);
> +    return total_len;
> +}
> +
> +/* return size or -1 if error */
> +int load_targphys_srec_as(const char *filename, hwaddr *entry, AddressSpace *as)
> +{
> +    gsize hex_blob_size;
> +    gchar *hex_blob;
> +    int total_size = 0;
> +
> +    if (!g_file_get_contents(filename, &hex_blob, &hex_blob_size, NULL)) {
> +        return -1;
> +    }
> +
> +    total_size = parse_srec_blob(filename, entry, (uint8_t *)hex_blob,
> +                                 hex_blob_size, as);
> +
> +    g_free(hex_blob);
> +    return total_size;
> +}
> --
> 2.20.1
>
>


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 309791D9183
	for <lists+qemu-devel@lfdr.de>; Tue, 19 May 2020 09:59:33 +0200 (CEST)
Received: from localhost ([::1]:41124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jax9v-00036J-PY
	for lists+qemu-devel@lfdr.de; Tue, 19 May 2020 03:59:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1jax8g-0002YS-Ik
 for qemu-devel@nongnu.org; Tue, 19 May 2020 03:58:14 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:57748
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1jax8f-0000j8-A6
 for qemu-devel@nongnu.org; Tue, 19 May 2020 03:58:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589875091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uTfCPjwos9E9Arm4ZTHKbf7WftHbOWMD5NuyobRUt6M=;
 b=i1nXF0l5YqcdnwlK6APKA9gkXItbOWB6qHjBI5/rAQcQFH22gQldLyJoD3VQ67c5NBKg7x
 H+RL3DLqZf8TSFcFiY7+KVCFs+XpZ3NLxuO54nZ4iU9bufPIv2tE6VnJIQ5f/3qyp1+8Nh
 F4o8rlzpbeXgieFWMLV2UuXFkxXmqCk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-aemg936SMUScx9pgsJ_wMw-1; Tue, 19 May 2020 03:58:09 -0400
X-MC-Unique: aemg936SMUScx9pgsJ_wMw-1
Received: by mail-wm1-f72.google.com with SMTP id t82so637549wmf.4
 for <qemu-devel@nongnu.org>; Tue, 19 May 2020 00:58:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=a4VuYgpozh5k2UbrW8UQBTZQVsj6kKrTwTGf6FkRTGs=;
 b=DxxgM/MH2YA69OwmJ3NXocsjqjzKb37gsyC21SineuGWbItktaqWtGwejhcA3ivHZD
 pnzJ3s7GLyD8HitEv8EYKu/JGDEutc7LnynxfSITBWhSHW0cKpT5bmc0eevT2+WapmcF
 bchbjOlDFaMIvBltag0Wm07Pqfd5MCh82obGQa0gHCR8tb6hW7fH9NLPrIZ7tpXhEUJr
 kZCs3rg6nrP2dXVQDAdsPj4euFQA4ttmEVFTGF7htikP9oI7eV6PnT68mqGgxxFDWJRt
 XQyZYtnRyM6HDptumOWUErtelERFXYm5xgDHM/O97F1TTXAgYRyZmY231A77LglkSi5o
 mjaw==
X-Gm-Message-State: AOAM5317uK+iJtKdnlw7uVyE0evL21gKGfxWmTBEwpBKsuf/OGEX8w3x
 kUe+r7Fwt4I7W30XUBm6Y8DjMvUG1zTT4omTbev6khjTJUJPc30Cnn2Kcjm9L71L19opdP4GR+m
 70a6tWxBNeWAazz0=
X-Received: by 2002:a1c:81d0:: with SMTP id c199mr3722634wmd.125.1589875088195; 
 Tue, 19 May 2020 00:58:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4zUWIr5Vf/tlEhDR0rq0R/jTKJhRvXHGdvGcm88dpkx7Sw27ojPyqT3C/AlRhCE4+C7dpxA==
X-Received: by 2002:a1c:81d0:: with SMTP id c199mr3722606wmd.125.1589875087928; 
 Tue, 19 May 2020 00:58:07 -0700 (PDT)
Received: from steredhat (host108-207-dynamic.49-79-r.retail.telecomitalia.it.
 [79.49.207.108])
 by smtp.gmail.com with ESMTPSA id l19sm2876436wmj.14.2020.05.19.00.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 00:58:07 -0700 (PDT)
Date: Tue, 19 May 2020 09:58:05 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 4/7] hw/elf_ops: Do not ignore write failures when
 loading ELF
Message-ID: <20200519075805.tgrzbz2qscco5thh@steredhat>
References: <20200518155308.15851-1-f4bug@amsat.org>
 <20200518155308.15851-5-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20200518155308.15851-5-f4bug@amsat.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/19 00:34:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 18, 2020 at 05:53:05PM +0200, Philippe Mathieu-Daudé wrote:
> Do not ignore the MemTxResult error type returned by
> address_space_write().
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/hw/elf_ops.h | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

> 
> diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
> index 398a4a2c85..6fdff3dced 100644
> --- a/include/hw/elf_ops.h
> +++ b/include/hw/elf_ops.h
> @@ -553,9 +553,14 @@ static int glue(load_elf, SZ)(const char *name, int fd,
>                      rom_add_elf_program(label, mapped_file, data, file_size,
>                                          mem_size, addr, as);
>                  } else {
> -                    address_space_write(as ? as : &address_space_memory,
> -                                        addr, MEMTXATTRS_UNSPECIFIED,
> -                                        data, file_size);
> +                    MemTxResult res;
> +
> +                    res = address_space_write(as ? as : &address_space_memory,
> +                                              addr, MEMTXATTRS_UNSPECIFIED,
> +                                              data, file_size);
> +                    if (res != MEMTX_OK) {
> +                        goto fail;
> +                    }
>                  }
>              }
>  
> -- 
> 2.21.3
> 



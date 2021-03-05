Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2655E32EE80
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 16:21:35 +0100 (CET)
Received: from localhost ([::1]:41706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lICGk-0003Qc-6J
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 10:21:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan.a.melnikov@gmail.com>)
 id 1lIC1q-0000RR-PP
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:06:10 -0500
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:33626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ivan.a.melnikov@gmail.com>)
 id 1lIC1o-0006aM-MH
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:06:10 -0500
Received: by mail-lf1-x129.google.com with SMTP id u4so4207117lfs.0
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 07:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=iGNI6QqgzYKBgAnwrXIvxKxBgbyjleDjc75acaqqh7g=;
 b=qx4w9k383b35ALGtNLwuWhI5AYdZCw3EOxgyRfpyCCJVMiEYjUnptrgUf2kTiYJ11G
 1gVd+yXbGipuiVsSXnJgK4uhUJParfAJG8e6KoYG7CMa+Fq1au2Na/XLz/AWytlc8hWz
 ZNIpB8xwi9KoxX5rg8zKU7VcuE7/EPw4yRghsmGmOlqh8VKurB/ZFgkQs0FDSYjJ1YnA
 ss8ewGue4Cnj7qN3wJ3feWklxsYoJWa5poxoFOA3CwnwBKjjj8ZpFLHolWYoPOCMPooA
 mq8S408rvvtsyx29F08h6PL9gmluayTk+xjrArq9nwUeJJYecQwznktPFXZ7T/evaatj
 A5jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=iGNI6QqgzYKBgAnwrXIvxKxBgbyjleDjc75acaqqh7g=;
 b=MmAhVzraxxp94e3wF6fSv9qe0JcNbMamj5Xccxca6DJg9TzxaiJyEjOLy3+YRA2cb/
 rVU3LKrImm6rA2JPx7VLuk9+JU7Rc7eLTZ3rJGnzlV9dRNRuXCRdv35nbQpDR79/eIif
 iqmBmV7leQqRB1vu54b/D+ddrcBVkDDU/sCqjApSwv+wRovQT0bmlvlYm9HGFI0iDTEq
 BCk/Hlx9QeYQqJrzXretLsdoJxsg1W1vCfffL/6nDpfWQp9HbAymHUKRLUyjT103/7V9
 449LCMZA7oxwkB0motAarIfqHXlLR+Rg5g58+dHWgaEHgyYS8kYY+5n+dQTYurnQqdXg
 8VxQ==
X-Gm-Message-State: AOAM531LR5N1k+KBH9IK5iWvbc3+kjJ6D1WcwIaP3JeLjPQUu6oHoJ/D
 WApiyE9gwzQhAbsLZcDyvhw=
X-Google-Smtp-Source: ABdhPJx0e04wA0XM3U+j6Iw8iWofqo6FszglbL/WGEz28RCECFdrQnqxXVCHqApdPra0vpOsktCLig==
X-Received: by 2002:a19:ae07:: with SMTP id f7mr5843200lfc.551.1614956765308; 
 Fri, 05 Mar 2021 07:06:05 -0800 (PST)
Received: from titan.localdomain ([193.43.9.4])
 by smtp.gmail.com with ESMTPSA id j2sm337668lfe.47.2021.03.05.07.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 07:06:04 -0800 (PST)
Date: Fri, 5 Mar 2021 19:06:03 +0400
From: "Ivan A. Melnikov" <iv@altlinux.org>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] linux-user: Adjust pgd_find_hole_fallback result with
 guest_loaddr
Message-ID: <20210305150603.5dgwt27l6agqtacn@titan.localdomain>
References: <20210303094919.x6wnlh6qulx72fz6@titan.localdomain>
 <87eegtg05n.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87eegtg05n.fsf@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=ivan.a.melnikov@gmail.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alex, thank you for the review.

On Fri, Mar 05, 2021 at 02:03:43PM +0000, Alex Bennée wrote:
> 
> Ivan A. Melnikov <iv@altlinux.org> writes:
> 
> > While pgd_find_hole_fallback returns the beginning of the
> > hole found, pgb_find_hole returns guest_base, which
> > is somewhat different as the binary qemu-user is loading
> > usually has non-zero load address.
> >
> > Failing to take this into account leads to random crashes
> > if the hole is "just big enough", but not bigger:
> > in that case, important mappings (e.g. parts of qemu-user
> > itself) may be replaced with the binary it is loading
> > (e.g. the guest elf interpreter).
> >
> > This patch also fixes the return type of pgd_find_hole_fallback:
> > it returns -1 if no hole is found, so a signed return type
> > should be used.
> 
> I don't think it should. For one thing the type is preserved as
> uintptr_t all the way up the call chain so just changing it here doesn't
> help much. -1 is really just a quick way of saying all bits are set
> which is the one "fail" value we check for. The address space is big
> enough we could theoretically return a chunk of space that otherwise has
> the top bit set.

I see your point. I'd only suggest to be explicit about using all-ones
as a spectial value, something like this:

static const uintptr_t invalid_poitner = ~0ULL;

and then using it as a return value. Especially since, as far
as I remeber, comparing unsigned value with -1 (which is int)
is UB.

Makes sense?

> > Downstream issue (in Russian): https://bugzilla.altlinux.org/39141
> > Signed-off-by: Ivan A. Melnikov <iv@altlinux.org>
> > ---
> >  linux-user/elfload.c | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> >
> > diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> > index bab4237e90..acd510532c 100644
> > --- a/linux-user/elfload.c
> > +++ b/linux-user/elfload.c
> > @@ -2205,9 +2205,11 @@ static void pgb_have_guest_base(const char *image_name, abi_ulong guest_loaddr,
> >   * /proc/self/map. It can potentially take a very long time as we can
> >   * only dumbly iterate up the host address space seeing if the
> >   * allocation would work.
> > + *
> > + * Returns the start addres of the hole found, or -1 if no hole found.
> >   */
> > -static uintptr_t pgd_find_hole_fallback(uintptr_t guest_size, uintptr_t brk,
> > -                                        long align, uintptr_t offset)
> > +static intptr_t pgd_find_hole_fallback(uintptr_t guest_size, uintptr_t brk,
> > +                                       long align, uintptr_t offset)
> >  {
> >      uintptr_t base;
> >  
> > @@ -2235,7 +2237,7 @@ static uintptr_t pgd_find_hole_fallback(uintptr_t guest_size, uintptr_t brk,
> >                  munmap((void *) align_start, guest_size);
> >                  if (MAP_FIXED_NOREPLACE != 0 ||
> >                      mmap_start == (void *) align_start) {
> > -                    return (uintptr_t) mmap_start + offset;
> > +                    return (intptr_t) mmap_start + offset;
> >                  }
> >              }
> >              base += qemu_host_page_size;
> > @@ -2259,7 +2261,8 @@ static uintptr_t pgb_find_hole(uintptr_t guest_loaddr, uintptr_t guest_size,
> >      brk = (uintptr_t)sbrk(0);
> >  
> >      if (!maps) {
> > -        return pgd_find_hole_fallback(guest_size, brk, align, offset);
> > +        ret = pgd_find_hole_fallback(guest_size, brk, align, offset);
> > +        return (ret > guest_loaddr) ? (ret - guest_loaddr) : -1;
> 
> So I think we just want:
> 
>     return ret == -1 ? -1 : (ret - guest_loaddr);

This will work for me as well. I'm just a bit hesitant with putting
in some kind of integer underflow when it seems easily avoidable;
but if we stick with uintptr_t that should non matter.

> do we have a test case that triggers this?

I don't think there are test cases that cover the 
pgd_find_hole_fallback code path, at least when
the test suite is run on a system with /proc mounted.

-- 
  wbr,
    iv m.


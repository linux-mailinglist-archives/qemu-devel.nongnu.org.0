Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B985F2A9B
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 09:38:20 +0200 (CEST)
Received: from localhost ([::1]:37288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofG1q-00037B-Rr
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 03:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1ofFxm-0007zx-00
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 03:34:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1ofFxi-0008Rd-Ji
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 03:34:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664782441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iL3fab5ZauitX2hi6w/Xtns+xEU+sop91v0WZfVEfk4=;
 b=Usoy/uBDr/mwKl/oL8TsvX++DTWmBpBxgcoPQ0PUzgSeiu9JCnKzFnE5pMDm40GwqcIzy0
 Ja3xfh0AkT43FlocDvSg5lJ6LBmhzUcYUI5+NWraVYJEOJ/ca3OUbfnStcbtibXvi7yHqh
 Uaa6Sgl1U7Z2sBQh++0BYhVdAsz9J2w=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-54-uRWNipRdPvSSa6T4_xvVnQ-1; Mon, 03 Oct 2022 03:34:00 -0400
X-MC-Unique: uRWNipRdPvSSa6T4_xvVnQ-1
Received: by mail-oo1-f70.google.com with SMTP id
 a21-20020a4ad1d5000000b004757a8a97ddso5780616oos.6
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 00:34:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=iL3fab5ZauitX2hi6w/Xtns+xEU+sop91v0WZfVEfk4=;
 b=FLdYKo/e42oV/ikPrLdZvahuRXRGn2El75VoO3exCedzYjxh1zZgbg0rl7/bCg05OQ
 6dbVdauMFB5PSLtEUQPfRkzqPueU+wCX+8neWyKAlwIlK5iUCJFWrSpNnN7tEQN9Op6l
 FU9r2vosLMOyoSjsifmuA+LCQpcV/e1qr5skCWymwD01ambo0ca0LdvpeLP5oVPaaMCl
 uxPV2/DqIyjlUwGExTXzoGFHBIiuFp3BVz5aQc1+vjM+Umz0P/TenDHHnfB5pNRw3Ww7
 8t+ic++K5yfAAD7EmZaGpIzTpS3P8twlCPgljKLhQeejicQ7QhjeIMYo2Y6PJxIwL5eW
 2/YQ==
X-Gm-Message-State: ACrzQf2ggqonqcedIDuSmaALkIxRkPw8h9DYnH47xneYmQEXQzANG6qX
 8pDMcMW6QNvgQYGk5Bs16JtNTqnbM2rhF532B12VVCdlU+c7AaVrL9NC08boCxLKzQNughfpE/4
 x4kSAmmut/k3tIPtDkaMGaCU6VnEVbR8=
X-Received: by 2002:a4a:928e:0:b0:476:6c03:f0c5 with SMTP id
 i14-20020a4a928e000000b004766c03f0c5mr7245294ooh.78.1664782439587; 
 Mon, 03 Oct 2022 00:33:59 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM62oHnUreRD21BYsjr+4NaxphwPoRqgU9vfrr3jBq/ioTczbxk9yAMFNjhID8ZEMtrq1sCYEg9BBZq+6klO+CY=
X-Received: by 2002:a4a:928e:0:b0:476:6c03:f0c5 with SMTP id
 i14-20020a4a928e000000b004766c03f0c5mr7245290ooh.78.1664782439396; Mon, 03
 Oct 2022 00:33:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220930140354.1684652-1-marcandre.lureau@redhat.com>
 <80e410e5-f151-65ce-63a0-956fae528700@linaro.org>
In-Reply-To: <80e410e5-f151-65ce-63a0-956fae528700@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 3 Oct 2022 11:33:48 +0400
Message-ID: <CAMxuvazpsWDk8Bz4dLSyXHmAx=ZZxvf5n+5w_NBY8me5NazFHA@mail.gmail.com>
Subject: Re: [PATCH v3] win32: set threads name
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, bin.meng@windriver.com, 
 Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard

On Fri, Sep 30, 2022 at 6:10 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/30/22 07:03, marcandre.lureau@redhat.com wrote:
> > +static bool
> > +set_thread_description(HANDLE h, const char *name)
> > +{
> > +  HRESULT hr;
> > +  g_autofree wchar_t *namew = NULL;
> > +
> > +  if (!load_set_thread_description()) {
> > +      return false;
> > +  }
>
> I don't understand why you're retaining this.
> What is your logic?

The function should be MT-safe that way (load_set_thread_description
should be too). But since we changed the way we invoke it, by relying
on non-protected "name_threads" and we set it to false when the
function cannot be loaded, we can just drop this. We can also drop
g_once usage from load_set_thread_description. There is no explicit
guarantee on when qemu_thread_naming() is called, and I am pretty sure
qemu_thread_create() is called from different threads too.



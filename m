Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 276B7520658
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 23:03:03 +0200 (CEST)
Received: from localhost ([::1]:40132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noAX0-0001xT-AF
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 17:03:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1noAWB-0001Gp-RL
 for qemu-devel@nongnu.org; Mon, 09 May 2022 17:02:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1noAW9-0005eC-7D
 for qemu-devel@nongnu.org; Mon, 09 May 2022 17:02:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652130127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=twbSaqifMDbt9JUeiUjF/x9Q81cBrUVB9B/Jvw+GSrI=;
 b=CYdThmgWAAa6y0Ll5LlCXomx+QQPpvURmYmtvoeLy6rr2+ZFp/pzpFwMD20hX3ONMGhqFg
 FpF9om2unJtYBmCxokHrF4RkxwmtFVmeDyeymLOR9xLEQoMq7FJxf5i4qGNhTzFhYJJ0vv
 g+KefGSzLWzgrZvoHdlPomrHjbRw5sM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-ocUrGkjjNSCbCvpVzWnEkA-1; Mon, 09 May 2022 17:02:04 -0400
X-MC-Unique: ocUrGkjjNSCbCvpVzWnEkA-1
Received: by mail-ed1-f72.google.com with SMTP id
 ch28-20020a0564021bdc00b00425cb227ab4so8984430edb.4
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 14:02:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=twbSaqifMDbt9JUeiUjF/x9Q81cBrUVB9B/Jvw+GSrI=;
 b=MXFSPJ8Bqz0IPmZW/S5XFyh99S5MATpCq8BAkce9vW6LYbxVTvltbu5MeKWpS5l2qS
 Rj+G7TibsWF0QpNq37F5niA4apkKFldJOEB3l+vR8690Fc3uln3svs+OEuriCptg9dWh
 i3mTGyUeIVc/ua6tDQij/LRTuf8cxOTOeTXncCJROtPc6IdULep2+08XsaM5l0we4oHC
 4aNq862m6eTdn3HoFpREOD7rJIOLz4p94Ttr/NB1ildyD5pyI185xq2eRJDj8r1oAbju
 BDHQ97p90TSV7wuO7YKS3WN1g1HAEqIxx3ag9/HIChvvZmZb4msIeMbU5VzSWi2ggJ57
 9gUA==
X-Gm-Message-State: AOAM531b/sDEhwqwISNK/Mq6OgRaXxU3gc4yuODrB2tSuGRUvZg6E3LK
 m16CgMJLGhKEl8evvN6bSIb3Ce6BRb3IynUo/ZSZ/37EclsC80nbnLt9cayYWCh0TwLg38t+n5S
 tXtuWrJbrBVKW1xfSXIaGshDy+5+yUKo=
X-Received: by 2002:a05:6402:5255:b0:427:de81:6af with SMTP id
 t21-20020a056402525500b00427de8106afmr19633259edd.269.1652130122609; 
 Mon, 09 May 2022 14:02:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSbAGVxvRoH4RmRhOW9xGxb42hPcbTkzlo1WVsZDpDON7G2ZxC2j5m83KWilwAtO+U2csxVzPF3koe0jL1zzk=
X-Received: by 2002:a05:6402:5255:b0:427:de81:6af with SMTP id
 t21-20020a056402525500b00427de8106afmr19633238edd.269.1652130122361; Mon, 09
 May 2022 14:02:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220509150253.218715-1-dgilbert@redhat.com>
 <20220509150253.218715-13-dgilbert@redhat.com>
 <3628fa0b-165a-863a-ffa1-f939d092f79f@linaro.org>
In-Reply-To: <3628fa0b-165a-863a-ffa1-f939d092f79f@linaro.org>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Mon, 9 May 2022 18:01:51 -0300
Message-ID: <CAJ6HWG6Ew7v28aRPYRHH2ZE_j_5_YagFnD6RNpcogm8dbDaNcw@mail.gmail.com>
Subject: Re: [PULL 12/16] migration: Add zero-copy-send parameter for QMP/HMP
 for Linux
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, 
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>, 
 Daniel Berrange <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 9, 2022 at 4:45 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/9/22 10:02, Dr. David Alan Gilbert (git) wrote:
> > diff --git a/roms/skiboot b/roms/skiboot
> > index 24a7eb3596..820d43c0a7 160000
> > --- a/roms/skiboot
> > +++ b/roms/skiboot
> > @@ -1 +1 @@
> > -Subproject commit 24a7eb35966d93455520bc2debdd7954314b638b
> > +Subproject commit 820d43c0a7751e75a8830561f35535dfffd522bd
>
> This is an error, probably in rebasing.

Yeah, that's odd. Should not be there.

David, could you please remove that?
Thanks!

>
>
> r~
>



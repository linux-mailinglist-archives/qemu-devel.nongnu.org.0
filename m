Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0E74AB050
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 16:41:20 +0100 (CET)
Received: from localhost ([::1]:40806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGjfC-000308-Tq
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 10:41:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGjcj-00029p-3N
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 10:38:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGjcf-0006dI-2x
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 10:38:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644161918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iEjUmEeAvALaKPMKi/drjDKwoyBmJV3tjFgYyskkWho=;
 b=ZsKU8/qOWMU6sar7gDodRZRzY0IAYcaDwQsj0wdhE6TkP2xaG2nU0u22IrqXyGScZwW3r/
 YlP/MBq7By/tDECCb8vRh2hBoZ4WQtJf4eBuo8cjsYLyEcEhQd4pTQDTMELwNfxOKyMd7a
 GVKxaMcK/1AF5LFtJwivpz8IvqM+YK4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-458-hmcm-zG0OoWvpnmOVFxkIQ-1; Sun, 06 Feb 2022 10:38:37 -0500
X-MC-Unique: hmcm-zG0OoWvpnmOVFxkIQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 w15-20020a056402268f00b00408234dc1dfso6195342edd.16
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 07:38:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iEjUmEeAvALaKPMKi/drjDKwoyBmJV3tjFgYyskkWho=;
 b=eYYk5nu2vk4ZqbgzqeBBuILL34fSZU2l16jbk+scK6e+O4M0DUI7W9AGpPVyizeenr
 jZ9Fu2jPZPGv7APRZtVel9sE/h7T09KvWYJFF+4gaTPC0WgyjcqgI7kvRq2situ34q9K
 3CYeGd91Vc5dISnIuhADJGxyzo+ZOYhACSN7UIHfHgpKvf3PrNL+Oih8K13qTZ2aiFG+
 MNGqYmn2CLZ6YfWeoOU5rcqKHre5C0yFtAkBPe22NQnNCIRCgojtCaNFGwcZXD2x12aU
 UTb5+1xSf0f7uFkDXehyGtqPE8RZAb3bBDfO8x0SekhyL8UEmfAfLAEw9A7iLoMzGsGm
 y4cA==
X-Gm-Message-State: AOAM531j0uUENEoZNs6LYrclG0PnInWc0ijAmAVYdUfL7nclhe+z+GXz
 4FBIZWTkGqwxijixrHcAuNiopWQKHK5WdfxWyvr6tENYssbVo22Vp4c4v/6oj96lNaoyX3HC/A6
 60NfgLLzXQGRGays=
X-Received: by 2002:a50:f099:: with SMTP id v25mr6623700edl.50.1644161915366; 
 Sun, 06 Feb 2022 07:38:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzSM34ebsSGRZCtTnxxED0W3zp2hfuY1U7NG5knGxuw215P8arQcLAuLnH4I2sKoDa5MBIVng==
X-Received: by 2002:a50:f099:: with SMTP id v25mr6623689edl.50.1644161915173; 
 Sun, 06 Feb 2022 07:38:35 -0800 (PST)
Received: from redhat.com ([2.52.12.81])
 by smtp.gmail.com with ESMTPSA id ku15sm1393752ejc.25.2022.02.06.07.38.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 07:38:34 -0800 (PST)
Date: Sun, 6 Feb 2022 10:38:30 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/32] virtio,pc: features, cleanups, fixes
Message-ID: <20220206103806-mutt-send-email-mst@kernel.org>
References: <20220205014149.1189026-1-mst@redhat.com>
 <CAFEAcA91cVDym5fVCXgHFHJ8fkt8GhrOis-EPHN6YWpVn9TOCA@mail.gmail.com>
 <20220205072452-mutt-send-email-mst@kernel.org>
 <CAFEAcA-RJ8OkwaXWx=bRHJCDoWrQvZbdSEuuyz1j9ZFod0kcfg@mail.gmail.com>
 <20220205124235-mutt-send-email-mst@kernel.org>
 <CAFEAcA_kbt0HOp=8w--ZR9g+EgZvownyrbWYseSxuArd1g4CBw@mail.gmail.com>
 <20220206042826-mutt-send-email-mst@kernel.org>
 <CAFEAcA8gGj-QQRtRze4vq=cM4nges32QL5ac6vddEXC=GQ0TeQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8gGj-QQRtRze4vq=cM4nges32QL5ac6vddEXC=GQ0TeQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Feb 06, 2022 at 10:44:47AM +0000, Peter Maydell wrote:
> On Sun, 6 Feb 2022 at 09:29, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Sat, Feb 05, 2022 at 09:05:12PM +0000, Peter Maydell wrote:
> > > On the build-tsan and build-cfi-x86_64 jobs and also on macos
> > > (this is a "clang is pickier than gcc about unused functions" one):
> > > https://gitlab.com/qemu-project/qemu/-/jobs/2058536617
> > > https://gitlab.com/qemu-project/qemu/-/jobs/2058536571
> > >
> > > ../tests/qtest/erst-test.c:91:20: error: unused function 'out_reg64'
> > > [-Werror,-Wunused-function]
> > > static inline void out_reg64(ERSTState *s, unsigned reg, uint64_t v)
> > > ^
> >
> >
> > That's a weird one - it's static inline, compiler should not warn I
> > think. compiler bug? I can drop this for sure but still. Is this
> > what we should be doing?
> 
> This is a gcc-vs-clang difference. gcc will not warn about any
> unused "static inline" function. clang will not warn for them
> in .h files but will warn for them in .c files.
> 
> In this case clang is entirely correct -- the function is defined
> and never used, not even conditionally depending on #ifdefs.
> 
> thanks
> -- PMM

I fixed it in pull v2, pls let me know.

-- 
MST



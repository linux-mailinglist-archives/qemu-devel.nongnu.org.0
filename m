Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B405EE660
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 22:02:46 +0200 (CEST)
Received: from localhost ([::1]:55072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oddGX-00032t-DK
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 16:02:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oddDr-00013F-GL
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 15:59:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oddDo-0001i5-LN
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 15:59:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664395195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AaXhWAfuc4uQu1v3VzEL10bKR6IA3jmwBDF4xHfstO0=;
 b=f5frtmx6hx/3mO7CmnIjTaHDwLdCw5TIEQVtDc8ykfD5Vg//6P0m7jYib65AADwehnSNrO
 pGmUmRcJIgQM3w5hBPg5wi+yQ3bYPOxMjNggadGnnzV8KmIrvzNxpHoGL6oxT4BARJq+oE
 OJeTo5J38wnsmeXqfp9oYepww+HzZSA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-651-RagjLNt7Mk6vbGWzcE8m3g-1; Wed, 28 Sep 2022 15:59:54 -0400
X-MC-Unique: RagjLNt7Mk6vbGWzcE8m3g-1
Received: by mail-wm1-f72.google.com with SMTP id
 e3-20020a05600c218300b003b4e4582006so913275wme.6
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 12:59:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=AaXhWAfuc4uQu1v3VzEL10bKR6IA3jmwBDF4xHfstO0=;
 b=qMZhyt3AqkRe/im0O886N4CflVW45nGMJ8IaDuBTfIMspyBH2B458gf0hbiFSbIrco
 hmF5BsyyxOEnZKrAlQPZEza1Nf+uD52RbJPc01DdLYLedZgv6+lTXeqSeJ0/AAyNF0K4
 nh/Ol+56c9HodEeNyH3HCnpuGl+PGjaBzY6o5lf4mNukhsMSHNDAHkv2Gl/JibtO6ZH+
 XiY1wcjkZiSMYWsdgOH1df6tnUK+g8duyAVJCr2bdPTsTst+Djg1QoQEJknhrDXxiJJH
 +M3v14toplRGPqspFSIB4fwhVNAuP/+OCVJ/Qcj0K+E7dSJV0wbXLNXdDY+6FJBR0Uz5
 OJvg==
X-Gm-Message-State: ACrzQf0VQQ9ICcV8rJ7B7ZSJ4oo/qgOrykoF5mgGcQjNk3gltbKWanRv
 WyX3A060KOyY4zoGcl57Fci43PjSoGP1E1wWWVH53yapYC3SxJAK9KeHuMxEsa2CItAmlBgIBhP
 MWPJS9hIbk0DWBFE=
X-Received: by 2002:a05:600c:524b:b0:3b4:8c0c:f3b6 with SMTP id
 fc11-20020a05600c524b00b003b48c0cf3b6mr8487254wmb.50.1664395193012; 
 Wed, 28 Sep 2022 12:59:53 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5jijrXZFOHc7PipLzr8syeYuWXLnWlL69GvuMX2CydcuHZRWhitnyVYpZ7PY82yGOHvrMhHQ==
X-Received: by 2002:a05:600c:524b:b0:3b4:8c0c:f3b6 with SMTP id
 fc11-20020a05600c524b00b003b48c0cf3b6mr8487236wmb.50.1664395192773; 
 Wed, 28 Sep 2022 12:59:52 -0700 (PDT)
Received: from redhat.com ([2.55.17.78]) by smtp.gmail.com with ESMTPSA id
 s11-20020adfbc0b000000b0022b0214cfa6sm6673714wrg.45.2022.09.28.12.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 12:59:52 -0700 (PDT)
Date: Wed, 28 Sep 2022 15:59:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: Why we should avoid new submodules if possible
Message-ID: <20220928154707-mutt-send-email-mst@kernel.org>
References: <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <CAARzgwxcjppQuO65aFzyzNBaFvJer7JEWoJeALaoKON=3XAQhg@mail.gmail.com>
 <20220628060210-mutt-send-email-mst@kernel.org>
 <d7a7b28f-a665-2567-0fb6-e31e7ecbb5c8@redhat.com>
 <20220928052352-mutt-send-email-mst@kernel.org>
 <YzQVyj5ouhGshZ2+@redhat.com>
 <20220928061303-mutt-send-email-mst@kernel.org>
 <YzQfah9Iu/MB0Zh/@redhat.com>
 <20220928062623-mutt-send-email-mst@kernel.org>
 <CAFEAcA9r9-WRV+WL_cLf5oomRPj8xke9y=JyVshw4Ff1FY4P7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA9r9-WRV+WL_cLf5oomRPj8xke9y=JyVshw4Ff1FY4P7Q@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On Wed, Sep 28, 2022 at 04:07:40PM +0100, Peter Maydell wrote:
> On Wed, 28 Sept 2022 at 15:29, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Wed, Sep 28, 2022 at 11:18:18AM +0100, Daniel P. Berrangé wrote:
> > > On Wed, Sep 28, 2022 at 06:13:45AM -0400, Michael S. Tsirkin wrote:
> > > > On Wed, Sep 28, 2022 at 10:37:14AM +0100, Daniel P. Berrangé wrote:
> > > > > There's also the perenial problem that developers frequently send
> > > > > patches that mistakenly include submodule changes, which is related to the
> > > > > way that 'git checkout' doesn't sync submodule state when switching branches.
> > > >
> > > > Do you happen to know how exactly that happens?
> > >
> > > For any given branch the submodule is synced to a given git commit hash.
> > > If the submodule checkout is not synced to the same commit hash it will
> > > show as dirty, and if you git add this pending change, it'll record that
> > > new submodule commit hash.  Seeing dirty state is common when you switch
> > > between branches, either side of a git master change that updated a
> > > submodule.
> > I see. It is interesting.
> >
> > So apparently what you want is ignore submodule
> > changes, right? If yes this is close to what we want:
> >
> > git submodule update --checkout testsub
> > git update-index --skip-worktree testsub
> >
> > A script checking out the submodule can just run this
> > command.
> 
> The problem happens not when you check out the submodule, but when
> you do basic not-submodule-related git operations like
> "git checkout my-working-branch". The fix would be if git itself
> automatically kept submodule state in sync with the main repo's
> branch. But it doesn't, so the UI is a massive beartrap.
> 
> -- PMM

If this is what you want, you can make it do that too:

$ cat .gitmodules 
[submodule "testsub"]
        path = testsub
        recurse = true
        url = /tmp/testsub/


git checkout (and a bunch of other commands) will now recurse into this
submodule.


-- 
MST



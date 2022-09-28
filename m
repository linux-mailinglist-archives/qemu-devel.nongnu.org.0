Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B3C5EDECB
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 16:29:36 +0200 (CEST)
Received: from localhost ([::1]:44878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odY46-0002ZY-1o
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 10:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1odWrg-0007mE-5C
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 09:12:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1odWrb-0005sp-WB
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 09:12:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664370754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AuHT8PtyiD7aagp0yWNdxsI8RGAMvLkF7dBAn6JuQ+Y=;
 b=MtzG/mTTwOLyaQxvHHMPRUNp9hmd5yDURAj9LiaPrUL/1W/Bf3j9+bzE4MF+QAdHrtOQR5
 hIlIrcFnCsJ3qkOWyFUz8KIeieh2GoQuuHrxgT6EtsXyl1bOKExxhjHootyIGXzo+6OVa9
 QDfbnTexktMc45IQ70ZFUot19SSifuE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-614-_i5cxo0-OhmXfD9xd6WhUQ-1; Wed, 28 Sep 2022 09:12:33 -0400
X-MC-Unique: _i5cxo0-OhmXfD9xd6WhUQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 n7-20020a1c2707000000b003a638356355so7098215wmn.2
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 06:12:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=AuHT8PtyiD7aagp0yWNdxsI8RGAMvLkF7dBAn6JuQ+Y=;
 b=NhDbJA2D4P8YSyedhz77dqGJD/UJtcAfj29Qr8UFwvIq4ulv5E8lbITuK3lAfqeowA
 qpk52aIOBnV2oa0faFQRelYrn81CYRnDDSOs1QP9nEAM4W8USKOPWZ7eGLIQ8UbauXTr
 ck2Rmi1FuCQ1l9DY4lkWqpzbM4NI1kxwUumeXtWZ9Qpk78XeQRHBbTZFjQF6v1EBCeJl
 kP6vztrojyssxKdtedIngFOh3lSNdjiI1Qb+oquqFnoDlYmVUIpf37o/FU8KyUiPFDDX
 QuVOFDqdSXaJyyao/FQmp2dDmvjBtIyDebF68IiWB0aNmewYSVJ6kdvhqPN30cNh7laA
 ID3g==
X-Gm-Message-State: ACrzQf3DLDOjRDiYBKIPEXLK8KfkA/RnXSbm+WouYHCVGbFYMVotb0l4
 C0vDDdRObf2FI301Q50lBwWQ+8WNEehhJDgYnn7z7EjRpoDmNJOEPtS/wdEF5My2m5hMyNPTeIS
 6GscPp3oiIuuQqyE=
X-Received: by 2002:a7b:cc99:0:b0:3b4:76f2:192b with SMTP id
 p25-20020a7bcc99000000b003b476f2192bmr6955582wma.138.1664370751875; 
 Wed, 28 Sep 2022 06:12:31 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5alVuWy3rwRpQ9u35kFkJDfyPPHupQkqPM07uJFwONj3DXwK+w2weGdGQjt46nUnAGRufx4Q==
X-Received: by 2002:a7b:cc99:0:b0:3b4:76f2:192b with SMTP id
 p25-20020a7bcc99000000b003b476f2192bmr6955571wma.138.1664370751668; 
 Wed, 28 Sep 2022 06:12:31 -0700 (PDT)
Received: from redhat.com ([2.55.47.213]) by smtp.gmail.com with ESMTPSA id
 7-20020a05600c020700b003b492753826sm1647109wmi.43.2022.09.28.06.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 06:12:30 -0700 (PDT)
Date: Wed, 28 Sep 2022 09:12:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: Why we should avoid new submodules if possible
Message-ID: <20220928062623-mutt-send-email-mst@kernel.org>
References: <Yrq6anPW60FkjmK6@redhat.com>
 <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
 <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <CAARzgwxcjppQuO65aFzyzNBaFvJer7JEWoJeALaoKON=3XAQhg@mail.gmail.com>
 <20220628060210-mutt-send-email-mst@kernel.org>
 <d7a7b28f-a665-2567-0fb6-e31e7ecbb5c8@redhat.com>
 <20220928052352-mutt-send-email-mst@kernel.org>
 <YzQVyj5ouhGshZ2+@redhat.com>
 <20220928061303-mutt-send-email-mst@kernel.org>
 <YzQfah9Iu/MB0Zh/@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YzQfah9Iu/MB0Zh/@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On Wed, Sep 28, 2022 at 11:18:18AM +0100, Daniel P. Berrangé wrote:
> On Wed, Sep 28, 2022 at 06:13:45AM -0400, Michael S. Tsirkin wrote:
> > On Wed, Sep 28, 2022 at 10:37:14AM +0100, Daniel P. Berrangé wrote:
> > > There's also the perenial problem that developers frequently send
> > > patches that mistakenly include submodule changes, which is related to the
> > > way that 'git checkout' doesn't sync submodule state when switching branches.
> > 
> > Do you happen to know how exactly that happens?
> 
> For any given branch the submodule is synced to a given git commit hash.
> If the submodule checkout is not synced to the same commit hash it will
> show as dirty, and if you git add this pending change, it'll record that
> new submodule commit hash.  Seeing dirty state is common when you switch
> between branches, either side of a git master change that updated a
> submodule.
> 
> With regards,
> Daniel

I see. It is interesting.

So apparently what you want is ignore submodule
changes, right? If yes this is close to what we want:

git submodule update --checkout testsub
git update-index --skip-worktree testsub

A script checking out the submodule can just run this
command.



> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



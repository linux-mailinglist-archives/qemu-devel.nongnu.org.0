Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8CE3022A6
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 09:07:00 +0100 (CET)
Received: from localhost ([::1]:45044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3wtn-0001Cp-Qp
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 03:06:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3wre-0000km-5n
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 03:04:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3wra-0006ZX-Nd
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 03:04:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611561881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bVUBMf1X81PrnqblBtHI/9kKSNmKX6r1PpNBWF4wDeU=;
 b=i92NDKjVX8qNqDJDvzTCzRQwHK84EfS0mDxxR61wm+mtaXSIbvmNlLtSnXUS0b7z+bY2D9
 VfU6sdhh7LS9PjeUN+xU1xTZsdkrrhEE6FKEQuKulA8HyDInJctBKDG9tGLCwmhngG6uVm
 W41Cp23XWpCHxs83NZSKF2iazZJNtHg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-hBBZ7FUjNxOov0PNt1X3HA-1; Mon, 25 Jan 2021 03:04:38 -0500
X-MC-Unique: hBBZ7FUjNxOov0PNt1X3HA-1
Received: by mail-ed1-f70.google.com with SMTP id f4so6916395eds.5
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 00:04:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bVUBMf1X81PrnqblBtHI/9kKSNmKX6r1PpNBWF4wDeU=;
 b=nnBYNpxCFCSnn6c/IDNN1kwGfQEiBxmIGP8b/FIuy6HjMpnBZxYsIDr1V+VI0iYe/X
 HB56tjvH88qFxBKiuerz1d9AcOmVM6X2pA5mCh96xOY6n9abaNy/vOYfyQqCDr60nTOq
 L++DIYkhI7BGafeZ3JKzhvf1taMEcQ3Pxo+Ofpo/tdXnbVBh812UXGlHbcXydPj3IGPq
 KUBz/LuvxSxOLpEvSJOTPJ+yAKR2S9cUrFzxTyeFKEz6ouggKrLJMoAhoiRzvsE3AOdc
 Vjy6ubEFvad6pvrh4hQwDEgKJNgUp8x28M+wDb4dXlebOVO98JOqM4oeWtxjzT6ACL5R
 2/dA==
X-Gm-Message-State: AOAM530mlUt/G6abEQyA315ZbaDtikd8my/PiHue1rfA7R8NByhwxvP/
 W1I+mLN73FbIGJLdQ2+d8X5Vg9mnP5gHf9IjzrL8QalhlwmWTwB6nvcJBMi7KDZCaA/vwA8V3CE
 TFFjyjMOdiqGSIG0uVBMrhsLyYNYaSkdh3V0WYIGooZu0l3chq99fZ9hUX6hAabVkz9U=
X-Received: by 2002:a17:906:f98f:: with SMTP id
 li15mr84668ejb.123.1611561876800; 
 Mon, 25 Jan 2021 00:04:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwldh8M3qWId6aaIAgEVf2uJZMiH6QcALlhwcTA1ymDXo+zhylfAaurq1QDmAjgMkqQMxIgHA==
X-Received: by 2002:a17:906:f98f:: with SMTP id
 li15mr84658ejb.123.1611561876597; 
 Mon, 25 Jan 2021 00:04:36 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t19sm7868809ejc.62.2021.01.25.00.04.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 00:04:35 -0800 (PST)
Subject: Re: [PATCH v7 05/11] osdep: build with non-working system() function
To: Peter Maydell <peter.maydell@linaro.org>, Joelle van Dyne <j@getutm.app>
References: <20210122201113.63788-1-j@getutm.app>
 <20210122201113.63788-6-j@getutm.app>
 <CAFEAcA8V1nv1VV6t8UN25JoA7bw96xSBamaw6VnfBavOQjj44A@mail.gmail.com>
 <CAFEAcA8hA7_isLsAtyS8oSwcfL9nRjdSehL+qLj5C2MycbzLoA@mail.gmail.com>
 <CA+E+eSAhNNBxY06a5iQj9ANpgmYZk0Kf6LYQPduCLwNmr1UQvA@mail.gmail.com>
 <CAFEAcA8KZqxjDd0H7faF=YtkyY-XFB2WoP31qv_2ecFij_rLqQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <59a773e4-b277-a8a2-b496-d95b515718e2@redhat.com>
Date: Mon, 25 Jan 2021 09:04:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8KZqxjDd0H7faF=YtkyY-XFB2WoP31qv_2ecFij_rLqQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/01/21 14:45, Peter Maydell wrote:
> On Sat, 23 Jan 2021 at 03:18, Joelle van Dyne <j@getutm.app> wrote:
> On Fri, Jan 22, 2021 at 3:17 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>>> Can we do the "does system() exist?" check in meson.build ?
> 
>>> config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system'))
> 
>> Unfortunately, this doesn't work for iOS, which defines system() but
>> throws a compile time error if you try to call it.
> 
> That's odd -- as far as I can tell the meson implementation
> of has_function() does what I expected it to do, ie
> "try to compile and link a little program that uses the
> function, and see if it successfully links":
> https://github.com/mesonbuild/meson/blob/39ede12aa5b27376341df85bc9ec254913f044bd/mesonbuild/compilers/mixins/clike.py#L791
> There's some initial cleverness there too, so I guess some
> part of that must be what's tripping us up.
> 
> In any case, I think we should be doing new checks in
> meson.build, not configure.  Paolo, what's the right
> way to do a meson "really compile this program and
> check it built" test?

One possibility is that you have to specify the #include in the "prefix" 
argument of cc.has_function for the test to behave as the QEMU code?

If cc.has_function doesn't work, there's cc.compiles() and cc.links().

Paolo



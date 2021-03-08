Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DD43310C2
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 15:28:38 +0100 (CET)
Received: from localhost ([::1]:54450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJGs7-0007JQ-HP
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 09:28:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJGVK-0007X9-OE
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 09:05:02 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:39527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJGVD-0007Jd-QN
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 09:04:59 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 124-20020a1c00820000b029010b871409cfso3867441wma.4
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 06:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=XbZDs1VhTHGtO9BVxsEBkTSFPcrlMKAaA/BAg1voT5Q=;
 b=QiPQmykFuwYkXHQUPlAk2PwWEcK16naEFFr4GQWMr430tDRXo+MGj4GMRZUuzs9bju
 /wHXEamo1SKyoUNzqFV5fe4Gr5yIsBFCRZwqRkly/271XdtHw9/wmh6x4eGly2clryz6
 6zdtmPvU8W8mOYufMXTgjTCTOYqP8C7OHdayxOWY3lqUZUSe95BUEVOA3zdjuqqfuvyM
 rvXkuTWaWRZEhLf7bePzyzEEbrJOHQAjMgnSjdCPkQ1ypTK8XDtcarHYhFUfYAJ/JD5t
 FAn5U98QkZP0SSGRbW1E6U+W3yEXeCydoLT0bsXM8tAVWd3k45o0wwNP0bhO9UwGEACp
 tFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=XbZDs1VhTHGtO9BVxsEBkTSFPcrlMKAaA/BAg1voT5Q=;
 b=GrtOsmipgNV8x0GVKLGRYjNKGfGGjaIB7D8Z7AsvyxUTf8lqQQGWfU5DzyXQcT835F
 oID7XAOYm69VsuUxeeRP73Kp8i3sc6UVbfAIePR7YtwxYHn/VsHSMrX5mdcFopARIbQp
 CbsazLcy88YkmMIw5plxzxkWSuCf/DATCFqTHDXK62SWUBHL7vj6wNjZZMkioWbXr31y
 n/Z1fPrXwwQrBKyd+0zb0AeGKfHBVMHemjl9K63r1URUNCcN31t0Troa/OgKrcJxUbEZ
 MbEEb5y2OFm9XpL4PVraNY9s1DAgJa4GMGsKjM3UPiswsp+FbCkH4OoELifD4pPrStIr
 hzMQ==
X-Gm-Message-State: AOAM530FlzxJqh154eLSgCNWLFGgX70B39bw3IGcCRQFXym3rHfUyqWW
 vLkcBKv7TlF3t+P/xa6FLvMkTA==
X-Google-Smtp-Source: ABdhPJwmcERIHXcY2SNn2iRcnuZLtWgDe40rttBksbE27vPfoKWpkkh3cCgEw371rtNQmJ+lORMkHA==
X-Received: by 2002:a1c:bad6:: with SMTP id k205mr13726929wmf.16.1615212294102; 
 Mon, 08 Mar 2021 06:04:54 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f7sm21207972wrm.36.2021.03.08.06.04.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 06:04:53 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 762921FF7E;
 Mon,  8 Mar 2021 14:04:52 +0000 (GMT)
References: <20210301085450.1732-1-cfontana@suse.de>
 <cfeead83-4890-bdd8-c5cb-9bdb2ca24abb@suse.de>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH v26 00/20] i386 cleanup PART 2
Date: Mon, 08 Mar 2021 14:02:48 +0000
In-reply-to: <cfeead83-4890-bdd8-c5cb-9bdb2ca24abb@suse.de>
Message-ID: <875z21aghn.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> Hi,
>
> anything else for me to do here?

It looks to me that this series is looking pretty good. Every patch has
at least one review so I think it's just waiting on the maintainers to
pick it up.

Paolo/Richard - are you intending to take the series as is or are you
waiting for something else? I'd like to see the patch delta reduced for
the ARM cleanup work which is still ongoing.

>
> The latest rebased state of this series should be always available here:
>
> https://gitlab.com/hw-claudio/qemu/-/tree/i386_cleanup_8
>
> When it comes to the ARM cleanup series,
> I would like to have the tests pass for ARM, before doing even more chang=
es, could you help me there Philippe?
>
> Maybe applying some of your changes on top would fix the failures? I trie=
d, for example with the arm-cpu-features ones, but it didn't work for me..
>
<snip>

--=20
Alex Benn=C3=A9e


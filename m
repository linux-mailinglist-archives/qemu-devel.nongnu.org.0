Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AEF2937BD
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 11:13:28 +0200 (CEST)
Received: from localhost ([::1]:41542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUnhv-0003jP-V0
	for lists+qemu-devel@lfdr.de; Tue, 20 Oct 2020 05:13:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kUnhD-0003Is-DO
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 05:12:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kUnhB-0006Jq-Ei
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 05:12:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603185160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Y1IgY+uTgKZFahUUPDO0BP1mWVvZAYg9U4d7pys5gk=;
 b=SBN1QErUmd+0/4JJP0Z6w+jUfCeDXM+1oDFxVgBUDTJlierGBrPpejNKzdsv153Adqm8m5
 LVbX/o2p2YRhtzYziWySJNhNv5YR4gOk/515DmQ0RyW4t/yhi/pkILTFXAe5mU0nj47iQF
 3SjwKgmJUZX0MLHxo5QSjziEBDJnQDI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-f3DMHkKuODGu1H36vDiCAw-1; Tue, 20 Oct 2020 05:12:39 -0400
X-MC-Unique: f3DMHkKuODGu1H36vDiCAw-1
Received: by mail-wm1-f71.google.com with SMTP id m14so186531wmi.0
 for <qemu-devel@nongnu.org>; Tue, 20 Oct 2020 02:12:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8Y1IgY+uTgKZFahUUPDO0BP1mWVvZAYg9U4d7pys5gk=;
 b=jWsgRX6wN7pVv3wG3H7hTxhNuANVswTXiq64jyiTKd8ZP613wb7UcexgKlOGH6oL1L
 dZJ5e2NyPb91uecorZnAOLIqX2Dk+NSsHvpyDjvksONBJjEinN2aI87peh0fHwJwXOkR
 HZNvosZHitEDygy+TM8jswK9O0pY3XLsZSnZN5xpnBwHPdykVqKY8PGMnwJ1NM9XsvjS
 x8p1oXLkEkW0s9dMOrRnrbYFPRwBN3vtPPIlHtUq/qRZ771uSrC0w2qp+YNQ5heOmwMP
 x8kbyZSf7X8++5JKrsjXdLMivCqSzNqvPzQCD6xcP+Xt1Zt2NQbOqPhrpIAPhZ4Yr4vq
 ROqQ==
X-Gm-Message-State: AOAM530eceRtvUhyVmnooQxZL7VVWxZNUd3zP9USq4Oly8en9TnmRRfH
 LF+4ZGQN2G6Ryx7mRC8peM/zFb44aL9c/umgVYlkVWtHbXdzCWiQU3/+KhrBzKU9PsqfvpDu/sJ
 WorMPtmijJO5bwmY=
X-Received: by 2002:adf:cf0c:: with SMTP id o12mr2241636wrj.287.1603185157922; 
 Tue, 20 Oct 2020 02:12:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAEa+ld0zjD4JARwyJiZuj4t2TShTvfavi8q9BTO5rifan7zRYT50Ljk/IwEwLY4NLZ21wvA==
X-Received: by 2002:adf:cf0c:: with SMTP id o12mr2241620wrj.287.1603185157748; 
 Tue, 20 Oct 2020 02:12:37 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m12sm1741307wrs.92.2020.10.20.02.12.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Oct 2020 02:12:37 -0700 (PDT)
Subject: Re: [PATCH] meson: rewrite curses/iconv test
To: luoyonggang@gmail.com
References: <20201019094534.1713842-1-pbonzini@redhat.com>
 <CAE2XoE9YRWK64D8w605cwmp+bdNRMYui25mx677pLBmFxxaqXQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <50c8ae90-4eb3-0025-e177-eba51e51c9aa@redhat.com>
Date: Tue, 20 Oct 2020 11:12:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAE2XoE9YRWK64D8w605cwmp+bdNRMYui25mx677pLBmFxxaqXQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 01:16:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-level <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/10/20 21:58, 罗勇刚(Yonggang Luo) wrote:
> 
>> +  if not curses.found() +    curses_compile_args =
>> ['-DNCURSES_WIDECHAR']
> 
> Here is what I think need improve in meson, when declare
> dependencies, we need a extra option compile_args for easily testing
> extra compile args, and maybe also need link_args, and after suceed,
> these flags should as a part of the dependencies.

I think it would make sense if cc.find_library had extra arguments that
would be added to the dependency and, in case of compile_args, to the
has_headers check.  It's a tradeoff between keeping the language simple
and making the users' code smaller.

Another possible extension is for cc.links to allow internal
dependencies, as long as they do not depend on sources.

Paolo



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FBC55C02D
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 12:28:40 +0200 (CEST)
Received: from localhost ([::1]:41964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o68SV-0003Nc-5F
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 06:28:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o68Lp-0008Sa-Qu
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:21:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o68Ln-0000Kc-2A
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:21:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656411702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8xFIq2hV2ZXs0aMPJ4CXHs7IHNQedeW1p+i4yAZOZc8=;
 b=g3QuwBr8vlT1C4GcBoUKLOKddH52g8fPkjG1ZaRryf69vb6kbEilb2vGWH5cjNsh4Lbl+C
 uuOtXK+02k1JFIGlvJboOMDwiIOEPHGabj3OJTj91xp4s7Hu9goJLxgE1c6Qh8ojjNBK0D
 dUmXzcswPjIB8JFugXbS2H11fHKKhsk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-RhDWH-jxOa-pOBUuF20YYQ-1; Tue, 28 Jun 2022 06:21:41 -0400
X-MC-Unique: RhDWH-jxOa-pOBUuF20YYQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 c187-20020a1c35c4000000b003970013833aso4911290wma.1
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 03:21:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=8xFIq2hV2ZXs0aMPJ4CXHs7IHNQedeW1p+i4yAZOZc8=;
 b=pNZXYvREfi4OZ+8szn66W5zRNmc0IAFDAaFvnjcgM6XDPSQSi8eB3OxhRVnvrsrmU3
 ENraNTU8xQiG2jqFP9ObYYpFExR+N5iI0OuZSvqwlbrN0oVM2Bss8pYaPUxLB2YlJ4sz
 WeJYSUnU+BX8vF570k9unk1kLn+Yk4LdtAGq1PUubPc78OFbTQ3sGAJPn+r61pCAQ6LE
 yNqq0Xh2WZ+pdaFJIDIvcoLCZBRtNxeIt/Yc7Za97cJx9NhNO6rEnpghN4eXqg0rUpm7
 rRG1IPPtyn1ad7tOw7K4rU0rRZk/HXm84EuuUvZh+e2xjXA2kt0T/PmW+ImWAy2KOD3U
 D68w==
X-Gm-Message-State: AJIora/cXfWSYmzJnS5UxzmIPwumkt69tI6BQOjSilVB6OR4Ar7vEYAR
 i95wh1Eg9PnUOixyXgJqoxkNKQhQ4+stddOtM7TJ8gfCSCvxrAW7WB//YXPSQPqwnW/yJpex+gK
 hGiAVVcC8WGdpT5E=
X-Received: by 2002:a1c:6a06:0:b0:3a0:5099:f849 with SMTP id
 f6-20020a1c6a06000000b003a05099f849mr4019635wmc.14.1656411700128; 
 Tue, 28 Jun 2022 03:21:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vONX4VjSr40rxObaxWpaRR7JqMyAnDM0zI6S7mUNqCgo51GF7InOJ9ZcCfdDjc6D5kFTE+RQ==
X-Received: by 2002:a1c:6a06:0:b0:3a0:5099:f849 with SMTP id
 f6-20020a1c6a06000000b003a05099f849mr4019616wmc.14.1656411699894; 
 Tue, 28 Jun 2022 03:21:39 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 d18-20020adfe852000000b0021ba3d1f2a0sm13150850wrn.48.2022.06.28.03.21.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jun 2022 03:21:39 -0700 (PDT)
Message-ID: <d7a7b28f-a665-2567-0fb6-e31e7ecbb5c8@redhat.com>
Date: Tue, 28 Jun 2022 12:21:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com,
 qemu-devel@nongnu.org
References: <CAARzgww9KKx7fTw7WMMTb3PCQgdwJwS34X0jHhQ+41OrMWZazg@mail.gmail.com>
 <4e1c2a45-eb53-e210-1ce1-05837bf1e7c3@redhat.com>
 <20220628030749-mutt-send-email-mst@kernel.org>
 <7bf5976e-8277-7c78-f412-44f7be8754f4@redhat.com>
 <YrqyWhu8ThAcUGI4@redhat.com>
 <CAARzgwyZNAYK3p16wjeykoCB9C+tmznY+OZAM-vw+Pn_4CdMqQ@mail.gmail.com>
 <Yrq6anPW60FkjmK6@redhat.com>
 <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
 <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <CAARzgwxcjppQuO65aFzyzNBaFvJer7JEWoJeALaoKON=3XAQhg@mail.gmail.com>
 <20220628060210-mutt-send-email-mst@kernel.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Why we should avoid new submodules if possible
In-Reply-To: <20220628060210-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 28/06/2022 12.03, Michael S. Tsirkin wrote:
[...]
> For biosbits if we are going this route then I feel a submodule is much
> better.  It records which version exactly each qemu version wants.

As far as I know, you can also specify the version when using pip, can't 
you? So that's not really an advantage here.

On the contrary, submodules have a couple of disadvantages that I really 
dislike:

- submodules do not get updated automatically when doing a "git checkout", 
we have to update them via a script instead. This causes e.g. trouble if you 
rsync your source tree to a machine that has no access to the internet and 
you forgot to update the submodule before the sync

- the content of submodules is not added to the tarballs that get created on 
the git forges automatically. There were lots of requests from users in the 
past that tried to download a tarball from github and then wondered why they 
couldn't compile QEMU.

- we include the submodule content in our release tarballs, so people get 
the impression that hte submodule content is part of the QEMU sources. This 
has two disadvantages:
  * We already got bug reports for the code in the submodule,
    where people did not understand that they should report that
    rather to the original project instead (i.e. you ship it - you
    own it)
  * People get the impression that QEMU is a huge monster
    application if they count the number of code lines, run
    their code scanner tools on the tarball contents, etc.
    Remember "nemu", for example, where one of the main complaints
    was that QEMU has too many lines of code?

- If programs includes code via submodules, this gets a higher
   burder for distro maintainers, since they have to patch each
   and every package when there is a bug, instead of being able to
   fix it in one central place.

So in my opinion we should avoid new submodules if there is an alternative.

  Thomas



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A32D32D5CA7
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 15:01:41 +0100 (CET)
Received: from localhost ([::1]:36694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knMVo-00072C-Hk
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 09:01:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knLUC-0006tG-2t
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 07:55:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knLUA-0002qK-Bl
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 07:55:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607604953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P872E0NgP6cNmnhEWXzxfP+Gkvdoe+FPjZG7WSgpwt8=;
 b=ON79PqXo84XW7sfMsZkhQmfPE4i9K0bX0Hp3RU3Ww07AIdeGHDfgoX40QFFrPdRGG0xlx7
 rW071L02oalKtai7aKu+lxIpTz8L5yLMkrIZGTtrOy3aHmewrq9UFVpYKQob2OZivZkPrn
 rQds0D78r5o+jKTudmCJwTmMkf1vhpc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-lME5oNjZPI6d8n2I6NM2cQ-1; Thu, 10 Dec 2020 07:55:52 -0500
X-MC-Unique: lME5oNjZPI6d8n2I6NM2cQ-1
Received: by mail-wm1-f72.google.com with SMTP id l5so1091254wmi.4
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 04:55:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P872E0NgP6cNmnhEWXzxfP+Gkvdoe+FPjZG7WSgpwt8=;
 b=pmP/PulcTLaUByv+XstPfKZec02vWrSO3OnxEew+/pCVjKhaWInC48BScN89kff9Jo
 kkF4w1WZGToTwBk9TUgzRfYwOs9WgZoDV0e7bjDXq2nX6toDbpDsY2/dc7kAKrdwy4Ey
 PdAvnBoPWiBBqv7bxfuUdGtS07q+QnF+5tbyyfYpdLW3PLj4D0/cNzIbK+2FN0eZNgzS
 ARyqd7Ke9lq3TijkpjRjB7izuf6xbMF0b40TsazQVKpXqRy0T3eJnVVCYEwzkgV0dtug
 nYG1eFrlexlQYeg5/ZxI2bVoS8E1P2tNUMR+g7mVYOHHAhjhI9ArUG6byGmXvnd77E2N
 SJqA==
X-Gm-Message-State: AOAM531xjE3+7IXdBH8ccaBahN3BmaD2N7dHEaHCpJfSp7sePmykdm8f
 hj5QSG2aeSwE+D+AyHwUtOqLjKrKj02/OGqp1FwXqqLIMLyA5lB7AhFL8P54gFfts2DiyfTOd46
 FU1Ji38piV2n8rQo=
X-Received: by 2002:a5d:4d41:: with SMTP id a1mr8099872wru.399.1607604950392; 
 Thu, 10 Dec 2020 04:55:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy37kNp0ezFyo3zNK3PSCSK/VTFZkdyY8D/hwbS9/hs0vYk4yyhEpU7BmvDgghCXYTnPkqKlg==
X-Received: by 2002:a5d:4d41:: with SMTP id a1mr8099850wru.399.1607604950264; 
 Thu, 10 Dec 2020 04:55:50 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id c10sm8082514wrb.92.2020.12.10.04.55.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Dec 2020 04:55:49 -0800 (PST)
Subject: Re: [PATCH v10 23/32] cpu: move cc->do_interrupt to tcg_ops
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>
References: <20201210121226.19822-1-cfontana@suse.de>
 <20201210121226.19822-24-cfontana@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a3c59102-6bd8-84f6-9663-0f557f9f1ff4@redhat.com>
Date: Thu, 10 Dec 2020 13:55:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201210121226.19822-24-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/20 1:12 PM, Claudio Fontana wrote:
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  include/hw/core/cpu.h           |  2 --
>  include/hw/core/tcg-cpu-ops.h   |  3 +++
>  accel/tcg/cpu-exec.c            |  4 ++--
>  target/alpha/cpu.c              |  2 +-
>  target/arm/cpu.c                |  6 ++++--
>  target/arm/cpu_tcg.c            |  9 ++++-----
>  target/avr/cpu.c                |  2 +-
>  target/avr/helper.c             |  4 ++--
>  target/cris/cpu.c               | 12 ++++++------
>  target/cris/helper.c            |  4 ++--
>  target/hppa/cpu.c               |  2 +-
>  target/i386/tcg/tcg-cpu.c       |  2 +-
>  target/lm32/cpu.c               |  2 +-
>  target/m68k/cpu.c               |  2 +-
>  target/microblaze/cpu.c         |  2 +-
>  target/mips/cpu.c               |  6 ++++--
>  target/moxie/cpu.c              |  2 +-
>  target/nios2/cpu.c              |  2 +-
>  target/openrisc/cpu.c           |  2 +-
>  target/riscv/cpu.c              |  2 +-
>  target/rx/cpu.c                 |  2 +-
>  target/s390x/cpu.c              |  2 +-
>  target/sh4/cpu.c                |  2 +-
>  target/sparc/cpu.c              |  2 +-
>  target/tilegx/cpu.c             |  2 +-
>  target/unicore32/cpu.c          |  2 +-
>  target/xtensa/cpu.c             |  2 +-
>  target/ppc/translate_init.c.inc |  2 +-
>  28 files changed, 46 insertions(+), 42 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>



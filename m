Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4BE2CF553
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 21:10:40 +0100 (CET)
Received: from localhost ([::1]:35872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klHPb-00062j-7i
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 15:10:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klEhh-0008N3-1G
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 12:17:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klEf7-0008Nc-IL
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 12:16:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607102055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jOi6x5gGTIw/0jTzZRQHBvujr89FyqljaojH3q+1GKI=;
 b=P2PQo53HbvT1tnFnBs4fLZFFbwiTQ49hzqjqs1dLc5HuMeHV0Chz2J33nEIXCjuhZUTJWq
 KFX2kTY8qrY9y00Qd0kUPJ1f2V9lrIjEZhpOkH/mvB61GjRUDpDL9VudKp57NScXHMOSzp
 mYNBVpReN/BYTBVd7R8tip/GETrcZBo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-1QktqiWFO_SL5hMBsyd8rQ-1; Fri, 04 Dec 2020 12:14:11 -0500
X-MC-Unique: 1QktqiWFO_SL5hMBsyd8rQ-1
Received: by mail-ed1-f72.google.com with SMTP id dh21so1760673edb.6
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 09:14:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jOi6x5gGTIw/0jTzZRQHBvujr89FyqljaojH3q+1GKI=;
 b=r9QZpZQATdJ0gi08lhQgRC1rXlSeXBqaKIyySNmDitdmx1tnBW8b4YjaejUmgTlbgW
 aru9CBZyfl2GqIIzGg5/oxXhIWqOzoesd38foFTqr50smV3OSJkC1MnVIky/NQPiSxdz
 wlBWdhbJt1wABEqAAJE6nrJ3MsZGSotvQIj/QtRNdTsDU546GT2iCwazFpdancf8he20
 /S0w+wZkW3lZkU4uvnjFejCsMOhP3vPOXq7eXYF7AmL5byzSCnj9inyAu7p9+HT8Ld7C
 XGYLDJF8w1I7aVbaxMIgJpVH2m1qlX7a66EuKU4dSIny6uBGpLxCH/tRhblXoYL43ivF
 KOjw==
X-Gm-Message-State: AOAM531FwieVQWJcpKjGGCglD8SibpVF+Xyf15M2RXkdgkahPsBaoZX7
 +0EqoHdoOUJ0MI/NgZNt6KKye03q5/0C/01vOspMJHBkqxzeQqoQ6/yqlDmAPYb2CAdIo+AlCOD
 VQgIfXRkKl4SXAxE=
X-Received: by 2002:a50:bc04:: with SMTP id j4mr8680815edh.316.1607102050351; 
 Fri, 04 Dec 2020 09:14:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/UyL42qcsKjXzN8c9DynpFUyZDe81RWPWDM1XJ9eEDzUQWguW6cCVRQojTyj7MVTfEeKZmw==
X-Received: by 2002:a50:bc04:: with SMTP id j4mr8680794edh.316.1607102050216; 
 Fri, 04 Dec 2020 09:14:10 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id u17sm3443669eje.11.2020.12.04.09.14.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Dec 2020 09:14:09 -0800 (PST)
Subject: Re: [RFC v7 15/22] cpu: Move tlb_fill to tcg_ops
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>
References: <20201130023535.16689-1-cfontana@suse.de>
 <20201130023535.16689-16-cfontana@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4c7fe436-7c2d-e55d-1139-8aa30e91965f@redhat.com>
Date: Fri, 4 Dec 2020 18:14:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201130023535.16689-16-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Cameron Esfahani <dirty@apple.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Anthony Perard <anthony.perard@citrix.com>,
 Bruce Rogers <brogers@suse.com>, Olaf Hering <ohering@suse.de>,
 "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/30/20 3:35 AM, Claudio Fontana wrote:
> From: Eduardo Habkost <ehabkost@redhat.com>
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  accel/tcg/cputlb.c              |  6 +++---
>  accel/tcg/user-exec.c           |  6 +++---
>  include/hw/core/cpu.h           |  9 ---------
>  include/hw/core/tcg-cpu-ops.h   | 12 ++++++++++++
>  target/alpha/cpu.c              |  2 +-
>  target/arm/cpu.c                |  2 +-
>  target/avr/cpu.c                |  2 +-
>  target/cris/cpu.c               |  2 +-
>  target/hppa/cpu.c               |  2 +-
>  target/i386/tcg-cpu.c           |  2 +-
>  target/lm32/cpu.c               |  2 +-
>  target/m68k/cpu.c               |  2 +-
>  target/microblaze/cpu.c         |  2 +-
>  target/mips/cpu.c               |  2 +-
>  target/moxie/cpu.c              |  2 +-
>  target/nios2/cpu.c              |  2 +-
>  target/openrisc/cpu.c           |  2 +-
>  target/ppc/translate_init.c.inc |  2 +-
>  target/riscv/cpu.c              |  2 +-
>  target/rx/cpu.c                 |  2 +-
>  target/s390x/cpu.c              |  2 +-
>  target/sh4/cpu.c                |  2 +-
>  target/sparc/cpu.c              |  2 +-
>  target/tilegx/cpu.c             |  2 +-
>  target/tricore/cpu.c            |  2 +-
>  target/unicore32/cpu.c          |  2 +-
>  target/xtensa/cpu.c             |  2 +-
>  27 files changed, 41 insertions(+), 38 deletions(-)

With cc->tcg_ops.* guarded with #ifdef CONFIG_TCG:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>



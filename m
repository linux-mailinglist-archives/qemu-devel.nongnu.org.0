Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7CF651045
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 17:24:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7IvB-0000ay-Lg; Mon, 19 Dec 2022 11:23:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7Iv9-0000a4-NP
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 11:23:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7Iv7-0006tU-OA
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 11:23:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671466995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yquUcng3A002kNONt0VbVz69nwYvoU++xz32gs6N2YE=;
 b=C46N1vkYONK4vPf5kei6oB6PULIDHybbnI/T2eKtQeOCrvIl6PoVbbN5C3Hq62G9jv5ca3
 g6O9MIcD9RqHrVCzLWn5eQRx9WG4rBl2ARoebErp/b0HUNTHj+I+L9V7oRRYE/GsoZskhW
 kFak9BQlcq495pERqlAxHtOajYBgqgI=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-609-cABGzDxSNTeMPqeyJqEpEA-1; Mon, 19 Dec 2022 11:23:14 -0500
X-MC-Unique: cABGzDxSNTeMPqeyJqEpEA-1
Received: by mail-qt1-f197.google.com with SMTP id
 h26-20020ac8505a000000b003a7e8e8b03bso4184434qtm.18
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 08:23:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yquUcng3A002kNONt0VbVz69nwYvoU++xz32gs6N2YE=;
 b=Cb+a3WDpyZ/amiOx2hRbWDNVAkTegjtHJAFa+LulAp2eZ7tZq3jkkxZLDh5ikzD4ax
 WmGBpPnfouFfII6nFD2ClITaW6Cge6UJSWlcPLTzVMT+pHk33gqXPwsBXmHt80cRWVv8
 lvCvsDvHXrC/hkeBHRM6ijUjOEVJLvYMK02orU41rTYn62bN0rmMamCZE4wK3LwtNNEH
 CM8LEjosHX47z5sVLPi1/L214kafiqQhSHUgU3FPWyL8iekU8pbqgaun9Aa2VzOlX0d0
 ovQmbXdqrj1kVVsN1hrC+K0X0Z3ua6twSBlgFs3GEvm/KvZJBa2sFMF2dQ0stX6vrbD4
 obTw==
X-Gm-Message-State: ANoB5pmvdQn37H/y6KVbLWKTWPwuCHb0pgl25a+IG3RwlXpjZNro6JUY
 nGRchKpmVGn6mr0pihk2VBPA+MQl1/SFSRdoUgvIcZ2Lw93HTvNWErYUqsXwcEDtAru+ybyCj50
 L66555PKd/faUNTs=
X-Received: by 2002:a05:622a:6114:b0:3a7:fd82:f69b with SMTP id
 hg20-20020a05622a611400b003a7fd82f69bmr47740695qtb.8.1671466993638; 
 Mon, 19 Dec 2022 08:23:13 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6Y2qXzcA4DZZkshxgVOYiF728sVZhnpCCgaeTFr8ChBfqjOTeyokRTSMmdtNg+VXZcVKyyEg==
X-Received: by 2002:a05:622a:6114:b0:3a7:fd82:f69b with SMTP id
 hg20-20020a05622a611400b003a7fd82f69bmr47740674qtb.8.1671466993353; 
 Mon, 19 Dec 2022 08:23:13 -0800 (PST)
Received: from redhat.com ([45.144.113.29]) by smtp.gmail.com with ESMTPSA id
 b24-20020ac844d8000000b0035badb499c7sm6184812qto.21.2022.12.19.08.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 08:23:12 -0800 (PST)
Date: Mon, 19 Dec 2022 11:23:08 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: Should -overcommit cpu-pm=on|off be converted to some machine
 sugar property?
Message-ID: <20221219112210-mutt-send-email-mst@kernel.org>
References: <3ce8e739-4894-b79e-1972-f972fd763e5b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ce8e739-4894-b79e-1972-f972fd763e5b@linaro.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Dec 19, 2022 at 05:11:11PM +0100, Philippe Mathieu-Daudé wrote:
> Hi Paolo,
> 
> I just noticed 'enable_cpu_pm' which seems architecture specific
> option that ended into common code:
> 
> $ git grep -E 'cpu[_-]pm'
> accel/tcg/user-exec-stub.c:5:bool enable_cpu_pm = false;
> include/sysemu/sysemu.h:49:extern bool enable_cpu_pm;
> Binary file pc-bios/skiboot.lid matches
> qemu-options.hx:4196:    "-overcommit [mem-lock=on|off][cpu-pm=on|off]\n"
> qemu-options.hx:4199:    "                cpu-pm=on|off controls cpu power
> management (default: off)\n",
> qemu-options.hx:4204:``-overcommit cpu-pm=on|off``
> qemu-options.hx:4214:    guest) can be enabled via ``cpu-pm=on`` (disabled
> by default). This
> softmmu/globals.c:38:bool enable_cpu_pm;
> softmmu/vl.c:350:            .name = "cpu-pm",
> softmmu/vl.c:3440:                enable_cpu_pm = qemu_opt_get_bool(opts,
> "cpu-pm", false);
> target/i386/host-cpu.c:44:static void host_cpu_enable_cpu_pm(X86CPU *cpu)
> target/i386/host-cpu.c:88:    if (cpu->max_features && enable_cpu_pm) {
> target/i386/host-cpu.c:89:        host_cpu_enable_cpu_pm(cpu);
> target/i386/kvm/kvm-cpu.c:43:        if (enable_cpu_pm && kvm_has_waitpkg())
> {
> target/i386/kvm/kvm.c:390:        if (enable_cpu_pm) {
> target/i386/kvm/kvm.c:2576:    if (enable_cpu_pm) {
> 
> Do we want to maintain this as a generic property or
> can it be deprecated / converted to a machine-specific one?
> 
> Thanks,
> 
> Phil.

I don't care much.
ATM it only works well if you have a dedicated host CPU and memory, this
is why we put it in -overcommit.

-- 
MST



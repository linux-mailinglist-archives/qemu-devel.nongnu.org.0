Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 779433C5E80
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 16:40:40 +0200 (CEST)
Received: from localhost ([::1]:42122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2x6t-0006Ga-GG
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 10:40:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m2x50-0004yq-Fl
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 10:38:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m2x4x-0005nt-IQ
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 10:38:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626100719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yl4hHEMJEMAYUZGTElsVzoGhoUQhkOhR6Yjo2w7ommg=;
 b=OjQ7xvj/ZVdPhD1YEOdIJld6udZURYUUMMVbOWGrKH4lB5waxgOlKnsL/0VZZGJqJYL2n2
 1IJ3JRelHKQlgMKQqJkBMO3yR7Ho8NSmka55JWrZtZQtgRF1s+oDsLahEe2sLdykvCbGWg
 M60zvQOOMV7eSHF9MmFDWKLm6UdRxSM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-DrGKPfATNVeeo3jlQq6eQQ-1; Mon, 12 Jul 2021 10:38:35 -0400
X-MC-Unique: DrGKPfATNVeeo3jlQq6eQQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 1-20020a05600c0201b029022095f349f3so76172wmi.0
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 07:38:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Yl4hHEMJEMAYUZGTElsVzoGhoUQhkOhR6Yjo2w7ommg=;
 b=DhoZotUkzerLMxP3kFo34MREU71TOir9qAwcXxoWERmX/c2EHD8Jm/kuM2Gs75f5i7
 PXs16/k+ws0l5+vXVgVeVGUTUp3HOP8sbiz1vxoaA5bBrdRUnt/4axnAFt1J3Qdpmktn
 eP8tz3Ba7oKLkJjzKFyOQAd5FNAb4h8pF86tgPtormqNz89iY4uh5aKoUzf1X7B8ZMnw
 wq68Ayux8CWR1AV9MuF6s6BcC/46XAGMMEPKPch6qEMbYATV09PrGI1KPKuKcmN4FuCp
 y/WcoelQB5hxwBJWNnk3QwR+8UtES0W2rb3oglUQHpA6vWhmDAfVbiwPJOxJKhVo5iXJ
 67vg==
X-Gm-Message-State: AOAM532SmLTwDP6Ka4M9zlAR6JI4mlSFW2jcx/o85yQK8W8weqn0p9Jb
 3wo70w+mvbLaXe9qY/mQCLI0nqvNkAxQx5+Kz0ElK+OTJiBkXlwtfTI4oiyoIYOhpfMKgvACKHn
 ha5mal/lSuNMMqqs=
X-Received: by 2002:a05:600c:4e8f:: with SMTP id
 f15mr11322050wmq.174.1626100714415; 
 Mon, 12 Jul 2021 07:38:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRLySjmNUJuqz5y36NBseG+y5SRO9rM73PAXrYoA5qN6U5GFBE5M0i9G1FwPAQ4q+gjhBGOg==
X-Received: by 2002:a05:600c:4e8f:: with SMTP id
 f15mr11322025wmq.174.1626100714159; 
 Mon, 12 Jul 2021 07:38:34 -0700 (PDT)
Received: from [192.168.1.27] (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr.
 [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id b12sm10959327wro.1.2021.07.12.07.38.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 07:38:33 -0700 (PDT)
Subject: Re: [PATCH v2 21/23] hw/i386: Introduce X86_FW_OVMF Kconfig symbol
To: qemu-devel@nongnu.org
References: <20210616204328.2611406-1-philmd@redhat.com>
 <20210616204328.2611406-22-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ac09b18b-40c8-cf88-b3fc-dbda0246cdcb@redhat.com>
Date: Mon, 12 Jul 2021 16:38:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210616204328.2611406-22-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.479, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 10:43 PM, Philippe Mathieu-Daudé wrote:
> Introduce the X86_FW_OVMF Kconfig symbol for OVMF-specific code.
> Move the OVMF-specific code from pc_sysfw.c to pc_sysfw_ovmf.c,
> adding a pair of stubs.
> Update MAINTAINERS to reach OVMF maintainers when these new
> files are modified.
> 
> This fixes when building the microvm machine standalone:
> 
>   /usr/bin/ld: libqemu-i386-softmmu.fa.p/target_i386_monitor.c.o: in
>   function `qmp_sev_inject_launch_secret':
>   target/i386/monitor.c:749: undefined reference to `pc_system_ovmf_table_find'
> 
> Fixes: f522cef9b35 ("sev: update sev-inject-launch-secret to make gpa optional")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Thanks, queued to fw-edk2 tree.



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC44D38E3CC
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 12:17:16 +0200 (CEST)
Received: from localhost ([::1]:45768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll7e7-0004jr-Nt
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 06:17:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ll7ay-0000vC-AL
 for qemu-devel@nongnu.org; Mon, 24 May 2021 06:14:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ll7au-0001tU-Ro
 for qemu-devel@nongnu.org; Mon, 24 May 2021 06:13:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621851235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+c38WjvMpDN+6Rjwf4EFNWt4n/mNwo36EdfxuRYJpdw=;
 b=gIF5n0ZuZn5Urh+nKz1fkECbVLe9lWcFP5SrWKTOsbsQ88h4z2wjKRIQ3USeCiuomzAb8f
 U216PwmJpwrYE+po8DG4G5FZ0/ikWwxVNNO3JZnvsvPHDFSkCo/+WvjOlO13R+RDmzuZ5X
 lDNYr3vMMvdQfTZ39xYxJE69fe3ITvs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-sKG62-TJNWqdx3XZptpsXw-1; Mon, 24 May 2021 06:13:54 -0400
X-MC-Unique: sKG62-TJNWqdx3XZptpsXw-1
Received: by mail-wm1-f69.google.com with SMTP id
 h20-20020a05600c4154b029017cb077d60dso3151820wmm.4
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 03:13:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+c38WjvMpDN+6Rjwf4EFNWt4n/mNwo36EdfxuRYJpdw=;
 b=BWM/5Lx9egG6gm953cB/XTGWEc2aAzw52iA/kpWGINf64VARTtutBFKp64hJbST7Ga
 s4lUuWKs2YxXM2GiDYXulkO7kJchKtZLj2gW3Zy2Egqk6hiY5Q5EwgI36Lqv8SAHi1+W
 mSJKESk7u2l/dJrXg2jTWlPUiKOmqBkFfkkO2dwgSeiRuxcF36y1e3bGpXYmfTrmHAfi
 smF8uRXB5zUNuRX3rLW2cXx3L1rtVPi+r+zQF7QaqAfpVzPIRjAUWYn+i6HzyXvRQwce
 JRqNUqOZxh8KBK+z1tmPERhSXnEWzlWG2KVif1B0fzEyV9CJD+698hMR0rYZ9iBG2ooA
 6QPw==
X-Gm-Message-State: AOAM5328slPPLKVKhcJUARBSA2IDDMkUyw6JXRIhG4LrYz4ndPZbyUtU
 IzdVUz7wtf8uHNOFFhIPM4DbnRJ3ryEvqyUAV2naVqfOBQ4Dc2Cg3bXNqsXY3EN20sKOorNff1R
 9JULWhRyVT0XCU2w=
X-Received: by 2002:a5d:40cd:: with SMTP id b13mr21584135wrq.356.1621851232906; 
 Mon, 24 May 2021 03:13:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDyf+CK8zWNAHLPiY6kH+SY2jdygi8F4n8y9ufi3OpQ3QICMbepp/m72wZeVSVxyHBgevgMA==
X-Received: by 2002:a5d:40cd:: with SMTP id b13mr21584104wrq.356.1621851232665; 
 Mon, 24 May 2021 03:13:52 -0700 (PDT)
Received: from redhat.com ([2a10:8006:fcda:0:90d:c7e7:9e26:b297])
 by smtp.gmail.com with ESMTPSA id r11sm11824173wrp.46.2021.05.24.03.13.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 03:13:52 -0700 (PDT)
Date: Mon, 24 May 2021 06:13:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Siddharth Chandrasekaran <sidcha@amazon.de>
Subject: Re: Windows fails to boot after rebase to QEMU master
Message-ID: <20210524055322-mutt-send-email-mst@kernel.org>
References: <20210521091451.GA6016@u366d62d47e3651.ant.amazon.com>
MIME-Version: 1.0
In-Reply-To: <20210521091451.GA6016@u366d62d47e3651.ant.amazon.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 21, 2021 at 11:17:19AM +0200, Siddharth Chandrasekaran wrote:
> After a rebase to QEMU master, I am having trouble booting windows VMs.
> Git bisect indicates commit f5cc5a5c1686 ("i386: split cpu accelerators
> from cpu.c, using AccelCPUClass") to have introduced the issue. I spent
> some time looking at into it yesterday without much luck.
> 
> Steps to reproduce:
> 
>     $ ./configure --enable-kvm --disable-xen --target-list=x86_64-softmmu --enable-debug
>     $ make -j `nproc`
>     $ ./build/x86_64-softmmu/qemu-system-x86_64 \
>         -cpu host,hv_synic,hv_vpindex,hv_time,hv_runtime,hv_stimer,hv_crash \
>         -enable-kvm \
>         -name test,debug-threads=on \
>         -smp 1,threads=1,cores=1,sockets=1 \
>         -m 4G \
>         -net nic -net user \
>         -boot d,menu=on \
>         -usbdevice tablet \
>         -vnc :3 \
>         -machine q35,smm=on \
>         -drive if=pflash,format=raw,readonly=on,unit=0,file="../OVMF_CODE.secboot.fd" \
>         -drive if=pflash,format=raw,unit=1,file="../OVMF_VARS.secboot.fd" \
>         -global ICH9-LPC.disable_s3=1 \
>         -global driver=cfi.pflash01,property=secure,value=on \
>         -cdrom "../Windows_Server_2016_14393.ISO" \
>         -drive file="../win_server_2016.qcow2",format=qcow2,if=none,id=rootfs_drive \
>         -device ahci,id=ahci \
>         -device ide-hd,drive=rootfs_drive,bus=ahci.0
> 
> If the issue is not obvious, I'd like some pointers on how to go about
> fixing this issue.
> 
> ~ Sid.
> 

At a guess this commit inadvertently changed something in the CPU ID.
I'd start by using a linux guest to dump cpuid before and after the
change.


> 
> 
> Amazon Development Center Germany GmbH
> Krausenstr. 38
> 10117 Berlin
> Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
> Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
> Sitz: Berlin
> Ust-ID: DE 289 237 879
> 
> 



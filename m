Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C6B4B5574
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 16:57:43 +0100 (CET)
Received: from localhost ([::1]:46356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJdjS-0007N6-G4
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 10:57:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nJdhX-0004UP-GN
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 10:55:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nJdhT-00016i-Ct
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 10:55:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644854119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KUa0hl6k/nbpuVXlvGywiBDBTIXScMw6WCDwSAsa580=;
 b=UPHNe6aBag95QExqlX26GjrQkCa3HW/SQ42aULq0XYpF2nDL5qHBT4xMNPvbdi5fBKYKc8
 S/oBHGtTOB/n24F1BigcZ1Pud/xyJPbUBVXTsw9z44Xr43Jmp2jxOYacSmjOv6IqFkFyfG
 8XQkTAwNNO64ns9vLu91Egt2Rzp0jDs=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-544-A7sRtbQRNa-2mwfeLOS7sw-1; Mon, 14 Feb 2022 10:55:18 -0500
X-MC-Unique: A7sRtbQRNa-2mwfeLOS7sw-1
Received: by mail-ej1-f69.google.com with SMTP id
 hr36-20020a1709073fa400b006cd2c703959so6019461ejc.14
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 07:55:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KUa0hl6k/nbpuVXlvGywiBDBTIXScMw6WCDwSAsa580=;
 b=2IREoX+pB3Gez4tL9wtnldFk/Fl59FwetvOBqJnG6GKz9YZcfe/2dyRuDXqzvOp0d3
 LcFRL1Of1cCli3zspkDZpSmmFL7TAP8xvwQQZ3dlB5bKjrXdlH25xVjqyEki4uFm0sWW
 9untiIZGxeQfbenPXpVy6RigI9yQKeglmx8fbrfmyfMemPC7W6fIsBKTP0aNjf7kpjEm
 BGvBoHariDMiYvHMTFIlDDR++7MLT956XDNY0EkRyIf/VG/t8FNEmAS5+A2WEkdIZAWV
 DHUmAzOFnRCZMOcX4NUq6v3/pDdLxaW0KTCLtFRNND78ttsQYGh+HvRJKXmiyYqvAus0
 n/Ug==
X-Gm-Message-State: AOAM5321ce1HAP9jhCqC0O18ar/LzuLPyZEUWhs784iXS1shgYr12lMh
 llo6m02R1YPwLmnzNvQlYaSJq/zfAxkrWmtiT3yh64kCHhGhTl88MCXXzVSc/JuL0svTpAhMNyK
 EN/Fi+sT8MTK6QjA=
X-Received: by 2002:a17:906:c144:: with SMTP id
 dp4mr167074ejc.89.1644854116912; 
 Mon, 14 Feb 2022 07:55:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzh9lZQgMTWnpjEY/A1H9jKYIbUL7r5CNEvJS6H+WSrt91ekSKdyjpvbKBNvlHTq1cZDz1kwA==
X-Received: by 2002:a17:906:c144:: with SMTP id
 dp4mr167055ejc.89.1644854116647; 
 Mon, 14 Feb 2022 07:55:16 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id k7sm10746112eje.162.2022.02.14.07.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 07:55:16 -0800 (PST)
Date: Mon, 14 Feb 2022 16:55:15 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: 9 TiB vm memory creation
Message-ID: <20220214165515.226a1955@redhat.com>
In-Reply-To: <b9771171-8d28-b46b-4474-687a8fed0abd@redhat.com>
References: <alpine.DEB.2.22.394.2202141048390.13781@anisinha-lenovo>
 <20220214133634.248d7de0@redhat.com>
 <b9771171-8d28-b46b-4474-687a8fed0abd@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Feb 2022 15:37:53 +0100
David Hildenbrand <david@redhat.com> wrote:

> On 14.02.22 13:36, Igor Mammedov wrote:
> > On Mon, 14 Feb 2022 10:54:22 +0530 (IST)
> > Ani Sinha <ani@anisinha.ca> wrote:
> >   
> >> Hi Igor:
> >>
> >> I failed to spawn a 9 Tib VM. The max I could do was a 2 TiB vm on my
> >> system with the following commandline before either the system
> >> destabilized or the OOM killed killed qemu
> >>
> >> -m 2T,maxmem=9T,slots=1 \
> >> -object memory-backend-file,id=mem0,size=2T,mem-path=/data/temp/memfile,prealloc=off \
> >> -machine memory-backend=mem0 \
> >> -chardev file,path=/tmp/debugcon2.txt,id=debugcon \
> >> -device isa-debugcon,iobase=0x402,chardev=debugcon \
> >>
> >> I have attached the debugcon output from 2 TiB vm.
> >> Is there any other commandline parameters or options I should try?
> >>
> >> thanks
> >> ani  
> > 
> > $ truncate -s 9T 9tb_sparse_disk.img
> > $ qemu-system-x86_64 -m 9T \
> >   -object memory-backend-file,id=mem0,size=9T,mem-path=9tb_sparse_disk.img,prealloc=off,share=on \
> >   -machine memory-backend=mem0
> > 
> > works for me till GRUB menu, with sufficient guest kernel
> > persuasion (i.e. CLI limit ram size to something reasonable) you can boot linux
> > guest on it and inspect SMBIOS tables comfortably.
> > 
> > 
> > With KVM enabled it bails out with:
> >    qemu-system-x86_64: kvm_set_user_memory_region: KVM_SET_USER_MEMORY_REGION failed, slot=1, start=0x100000000, size=0x8ff40000000: Invalid argument
> > 
> > all of that on a host with 32G of RAM/no swap.
> >
> >   
> 
> #define KVM_MEM_MAX_NR_PAGES ((1UL << 31) - 1)
> 
> ~8 TiB (7,999999)

so essentially that's the our max for initial RAM
(ignoring initial RAM slots before 4Gb)

Are you aware of any attempts to make it larger?

But can we use extra pc-dimm devices for additional memory (with 8TiB limit)
as that will use another memslot?


> 
> In QEMU, we have
> 
> static hwaddr kvm_max_slot_size = ~0;
> 
> And only s390x sets
> 
> kvm_set_max_memslot_size(KVM_SLOT_MAX_BYTES);
> 
> with
> 
> #define KVM_SLOT_MAX_BYTES (4UL * TiB)
in QEMU default value is:
  static hwaddr kvm_max_slot_size = ~0
it is kernel side that's failing








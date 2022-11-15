Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 090BC6292A2
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 08:45:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouqcF-0005kC-AH; Tue, 15 Nov 2022 02:44:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ouqcB-0005ju-LK
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 02:44:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ouqcA-0002bu-1r
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 02:44:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668498252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IUayK19F7GRbk/JZ4FyjQnfJe7VwSKFvtpsxXEbqiTc=;
 b=hIklWenUwQZH4Qjax5OaQiksMNZOmEdrB3pJnRu4yLVLNsr1P/4kqac27gnpAiUN7Z+LET
 yyWADUrBGUZJEjUFOedMvtulVJ9+RPCbQ/Zh2+k+p9dfku4tm+0Amtdfey6Vj0sBD3aBMb
 zfUq3jK+wZDLgCSZ5SXl2VDXMrYVdDo=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-237-_a9ajoXcNMeLqr_6cJ7-tQ-1; Tue, 15 Nov 2022 02:44:10 -0500
X-MC-Unique: _a9ajoXcNMeLqr_6cJ7-tQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 bp10-20020a05620a458a00b006fa29f253dcso13065354qkb.11
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 23:44:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IUayK19F7GRbk/JZ4FyjQnfJe7VwSKFvtpsxXEbqiTc=;
 b=cvzj6q4sDijk3pO8C1Vqlbyu285zsLG4WvPIUV37WQIxtnadQBZ2yGEvQ27sxo2Qwv
 n3i6qIYU3QJVSFOCPSeo5ic9VPaUQFhsFFJwVKbIhpcmN2eKDtXuY/pOTvuupPSAG98B
 f7vj4JOx+so6P3/cs5yLt7s4jIbUHWO3LoPleXPraFMrK2MHI/dLQijt7LCOIitPGCWJ
 d5KDEPgOlMR0wB2nMG03g8ZiEhA8ES/sQa4znQEI/zPbdpSufwcaSaLOPd+lRebUi34w
 mqDiNj2Y0A9NPJeNuI9ICMSBAeuXCZAeO3amq+eV/w4UImMbvB+cT6VULgSuv0l2Ptmn
 GIfw==
X-Gm-Message-State: ANoB5pktbvoZrIveYnfDZd7E4jYwV18LXwETB8fcUOQZU0Yy79vApx9a
 rs/8tHW4HNLGwNzJA42zAwI/uv84PCYfqarwREXBPBbHK5X2wAXH+c/ejuKluZJs6+SMn/yu1bK
 Xc8rVsOVQHjnQWhA=
X-Received: by 2002:a37:aa92:0:b0:6fb:85ad:7019 with SMTP id
 t140-20020a37aa92000000b006fb85ad7019mr5820514qke.661.1668498250107; 
 Mon, 14 Nov 2022 23:44:10 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7kErvpCffa7Nn31R1lnhLhMzbFCN0g9nTo1KI6D603WbA+Z+vQubaHT4BSd51OcggDejT0nw==
X-Received: by 2002:a37:aa92:0:b0:6fb:85ad:7019 with SMTP id
 t140-20020a37aa92000000b006fb85ad7019mr5820507qke.661.1668498249872; 
 Mon, 14 Nov 2022 23:44:09 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-177-149.web.vodafone.de.
 [109.43.177.149]) by smtp.gmail.com with ESMTPSA id
 z12-20020ac8454c000000b003a4f435e381sm6804248qtn.18.2022.11.14.23.44.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Nov 2022 23:44:09 -0800 (PST)
Message-ID: <13a59cf1-cb58-4a79-2182-64c53ac41a3f@redhat.com>
Date: Tue, 15 Nov 2022 08:44:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [qemu-devel]
Content-Language: en-US
To: Pawel Polawski <ppolawsk@redhat.com>, qemu-devel@nongnu.org
References: <CABchEG2dNgOPnm9K6AJsiWb8z=dOaKe0yjrvxqyU3gdWygQaNw@mail.gmail.com>
Cc: KVM <kvm@vger.kernel.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CABchEG2dNgOPnm9K6AJsiWb8z=dOaKe0yjrvxqyU3gdWygQaNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 14/11/2022 23.58, Pawel Polawski wrote:
> Hi Everyone,
> 
> I am trying to check qemu virtual cpu boundaries when running a custom
> edk2 based firmware build. For that purpose I want to run qemu with more 
> than 1024 vCPU:
> $QEMU
> -accel kvm
> -m 4G
> -M q35,kernel-irqchip=on,smm=on
> -smp cpus=1025,maxcpus=1025 -global mch.extended-tseg-mbytes=128
> -drive if=pflash,format=raw,file=${CODE},readonly=on
> -drive if=pflash,format=raw,file=${VARS}
> -chardev stdio,id=fwlog
> -device isa-debugcon,iobase=0x402,chardev=fwlog "$@"
> 
> The result is as follows:
> QEMU emulator version 7.0.50 (v7.0.0-1651-g9cc1bf1ebc-dirty)
> Copyright (c) 2003-2022 Fabrice Bellard and the QEMU Project developers
> qemu-system-x86_64: -accel kvm: warning: Number of SMP cpus requested (1025) 
> exceeds the recommended cpus supported by KVM (8)
> Number of SMP cpus requested (1025) exceeds the maximum cpus supported by 
> KVM (1024)
> 
> It is not clear to me if I am hitting qemu limitation or KVM limitation here.
> I have changed hardcoded 1024 limits in hw/i386/* files but the limitation 
> is still presented.
> 
> Can someone advise what I should debug next looking for those vCPU limits?

Well, the error message says it: There is a limitation in KVM, i.e. in the 
kernel code, too. I think it is KVM_MAX_VCPUS in the file 
arch/x86/include/asm/kvm_host.h of the Linux kernel sources... so if you're 
brave, you might want to increase that value there and rebuild your own 
kernel. Not sure whether that works, though.

  Thomas



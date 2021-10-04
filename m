Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 136E842077F
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 10:42:54 +0200 (CEST)
Received: from localhost ([::1]:39402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJYj-00007q-1J
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 04:42:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXJJZ-0002uL-QU
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:27:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXJJX-00083g-4t
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:27:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633336030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gwvDByIC+vTfc+SW+nW5Q49khZ7Ca0Ksli141LQG9yw=;
 b=YjCXOP2TzLbaK0yYYjOEnGAAgPoJTCtub2tgDLE2bj8yfDjVogzK4LG3J4aLtCeED0H8YU
 DxMZ811WXNVYNJO+fY9V8bB7z75wJlUSf91AF/oUml/GH466UGf74U9HZFMTPnK0ESh88j
 ic0ulJirH/JQR4QD9EvFRIQ+K7ZXos8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-nJO18GtAM5GD3d9y8b6gIA-1; Mon, 04 Oct 2021 04:27:09 -0400
X-MC-Unique: nJO18GtAM5GD3d9y8b6gIA-1
Received: by mail-ed1-f69.google.com with SMTP id
 k2-20020a50ce42000000b003dadf140b15so4729910edj.19
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 01:27:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gwvDByIC+vTfc+SW+nW5Q49khZ7Ca0Ksli141LQG9yw=;
 b=Ssq3IvINaaixnYyo+MKFEUn0vEooC3bfDbaaK2Vw3A2v95UEdSDqRYvtdwYS5uSILe
 mRhYo/wxjn2W9stYu7UZC0vruwtawwYDVeqnxa2M6oXF1c5n+oK1d+vq2+y73TBGttZ3
 DA34RNRTjuC13yXego33UzeqR7rq6kl1rldlitBaQCOoRrnZskQinYT5/IMDPGhh71zm
 dVs5cCIE2gUfBpWlgo30AfbN+X5Q4XQzUDZZ4DndmWyopt9W8Ros74h73yrEy0BLT1xU
 AXrnag3HlKt5HQRtEEVS2A5i8Vhgc5H31xtDNtxLvM89BPRygjHjYEDXVzXJvxH3J4tr
 Ey+w==
X-Gm-Message-State: AOAM530vn+x+kMXQw/SFFSTuIx3ssqbp+deZwVR8seGezIULfqYbSHgV
 b3CVTpw7AAVc2KVEYpY7CwkuQ9Qh6yNtC0+hcUdzLye9k2coLG4jox0rbQ1SucFEHX354nWahtp
 202vDVj5KQKHsts4=
X-Received: by 2002:a50:e006:: with SMTP id e6mr16213678edl.302.1633336028345; 
 Mon, 04 Oct 2021 01:27:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwU7u03IjhG3DKilfNvbDjof5cqTK+DLAJqU3WAhInDEBELKB/AKQqVhKx1wx6OBCOzLpAj7w==
X-Received: by 2002:a50:e006:: with SMTP id e6mr16213665edl.302.1633336028131; 
 Mon, 04 Oct 2021 01:27:08 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id lb12sm6307833ejc.28.2021.10.04.01.27.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 01:27:07 -0700 (PDT)
Message-ID: <a603ce87-e315-06e0-ff53-2c961c046b82@redhat.com>
Date: Mon, 4 Oct 2021 10:27:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 22/22] MAINTAINERS: Cover AMD SEV files
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211002125317.3418648-1-philmd@redhat.com>
 <20211002125317.3418648-23-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211002125317.3418648-23-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Brijesh Singh <brijesh.singh@amd.com>, kvm@vger.kernel.org,
 Sergio Lopez <slp@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/10/21 14:53, Philippe Mathieu-Daudé wrote:
> Add an entry to list SEV-related files.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   MAINTAINERS | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 50435b8d2f5..733a5201e76 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3038,6 +3038,13 @@ F: hw/core/clock-vmstate.c
>   F: hw/core/qdev-clock.c
>   F: docs/devel/clocks.rst
>   
> +AMD Secure Encrypted Virtualization (SEV)
> +S: Orphan
> +F: docs/amd-memory-encryption.txt
> +F: target/i386/sev*
> +F: target/i386/kvm/sev-stub.c
> +F: include/sysemu/sev.h

I don't think it qualifies as orphan; it's covered by x86 maintainers.

Paolo



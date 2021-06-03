Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC2239A5FF
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:42:24 +0200 (CEST)
Received: from localhost ([::1]:46174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loqQJ-0006Ms-HB
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:42:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lopt8-0002qI-S2
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 12:08:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lopt7-00047a-Bm
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 12:08:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622736484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5dB4tTDG0/4cssCO/jEfbJ26lkVBLJ8R89oUsvukYNo=;
 b=dxa21ezpf3gc6n4l77Vne6bE1KD3cIjPaAbJK1EiZhxSxrrZum+ZvYODldBE98PYPAhxU1
 dPohQhi1unTSvJAzx9Yqdd+AP0KgTItwnhT9XoXOS4kZm3XiUjEjrp5uUOb6PQ2slNJxGO
 RS5Sxwd3EQvCoKCOebClY2yPr7gYKvA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-VRu3IN8_P4OSykqvdB8C_A-1; Thu, 03 Jun 2021 12:08:01 -0400
X-MC-Unique: VRu3IN8_P4OSykqvdB8C_A-1
Received: by mail-ed1-f70.google.com with SMTP id
 df3-20020a05640230a3b029039179c0f290so1818592edb.13
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 09:08:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5dB4tTDG0/4cssCO/jEfbJ26lkVBLJ8R89oUsvukYNo=;
 b=hhfRKZeWAxg7yADsDKabRfwzyzGH+3sEdh6tbTBSLWfJXOlpvMTTVI5zqAt7LK9zWw
 qVheQLZlearOsz8lDFWA9K0ZeNXrc52nxT/ZUX13yqnrUSU4Fr06VPS+vWN+FDuCz33i
 nidRIew+EBfZKOgiGNZ/eeikXhg3O2auiaVPl1te6OrZD8U8L60EBXPHnntmMcbmgfc3
 F6gtAl/K6sEb/Mq/DbkY7k4BGiG+501vi4hpR1NcFEOaB/W5XO8Fr0PMY04fuvBhHA8E
 wV1qy/REwfqVGwnMZn3U1p49H1hhyrNgxSm2o6UAt5ZtpwHoawSAZsrGoJN+42j86nJe
 pFCg==
X-Gm-Message-State: AOAM5320WRAIHf6cOrgbpE7k8VxLIRjXe+fbtcW9Isl1HbtzmKFEi1uF
 a3mUy7rNlJ4ZmvoyhvQJ5sukRcNPzEJZ2SrrYfCERebB73o2OkOWcu746UkKVnyAFx2SlwwxbLU
 J7rNX5dYktP00yVzP5xjQKjzLg7Jalyy4lCU5/AkmeVblOaeVL4qfftTbp1qHqLF16aQ=
X-Received: by 2002:a05:6402:42c1:: with SMTP id
 i1mr277054edc.62.1622736479348; 
 Thu, 03 Jun 2021 09:07:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrlSJ+0sHjHczb8TlMY097zVzPgV35QESlDhodFs/xgu0ZUohrqvuZ7xRI8/sAFLMTkfmrKQ==
X-Received: by 2002:a05:6402:42c1:: with SMTP id
 i1mr277034edc.62.1622736479174; 
 Thu, 03 Jun 2021 09:07:59 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r1sm1941848edp.90.2021.06.03.09.07.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 09:07:58 -0700 (PDT)
Subject: Re: [PATCH] buildsys: Restore listing binaries/tools/helpers in 'make
 help' target
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210602150809.2471467-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4761e55e-c796-e615-da34-51f427e1b6ea@redhat.com>
Date: Thu, 3 Jun 2021 18:07:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210602150809.2471467-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.603, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/06/21 17:08, Philippe Mathieu-Daudé wrote:
> +	@echo  'Architecture specific targets:'
> +	@ninja -t targets all | sed -ne 's/\(.*\): cpp_LINKER.*/  \1/p'
> +	@echo  ''

This doesn't work in general, it depends on the link_language 
established by configure.  The separation between qemu-* targets and 
other targets is not particularly useful in my opinion.

> The targets are not described as before, but it is still more
> useful to users rather than nothing listed at all.

Maybe add "make targets" and add it to the help?  The information in 
"make help" already includes what's generally useful; listing a few 
dozen targets overwhelms the user with output, whereas most people only 
care about "make all" and "make check".

Paolo



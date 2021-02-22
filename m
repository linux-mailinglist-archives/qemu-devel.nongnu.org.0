Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA4732184F
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 14:19:14 +0100 (CET)
Received: from localhost ([::1]:38408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEB7J-0008SL-PH
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 08:19:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEB2T-00055l-G7
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:14:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEB2R-0000PG-2S
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:14:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613999649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P895Ya1Ywbp7ip5r13DcIXocHgBMEj1dlGTHdhjeJUw=;
 b=LI5QPG7390fGL0tLh6Ib7DZIgNNArzIyyCEENVv/F729vLb2nHTzovLNWCANKBZ43Kj6wv
 8fp8C8eelPiYf/7in4LaQ0SeBldY0An5cAUzGpjZado9WMDd0XFw12QaS1XRnhmRk25IyN
 QyvwAJ0ANxXy5x4o6Vv0fbkYYFRGy3M=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-YsYg7we3Me-sD4710WubXQ-1; Mon, 22 Feb 2021 08:14:07 -0500
X-MC-Unique: YsYg7we3Me-sD4710WubXQ-1
Received: by mail-ed1-f69.google.com with SMTP id y90so7018522ede.8
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 05:14:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P895Ya1Ywbp7ip5r13DcIXocHgBMEj1dlGTHdhjeJUw=;
 b=NRPpA6Tef1SkXG+Pl6hF+3nWBiDTzlCUMaVL7WnrJ3pVWgKfapEdTKUozE+Fq66jup
 6iEyD83Se8ZFdXZTVa3oQJvenXqM/osuWzVm2rOcCPrr+XpN9JmnFSr+ImEGHnzEZN/b
 cAYy4B4N9cdBZcXXkPqGRvTSZra91rvO/ZBKYrZaJH9TYbuZ5uWVV0MFQmkUqzcGAO78
 hxlQJnh9OfC8YhK3xqBKaxjnJOZdH0J0agsXvo2uF0JUdmx55qPPR4xPS313O0kwpR2r
 U/3F+s0exj0eIhXdh6kXGZn9+XrIooAHGxPIquGZkb9UJkJQFzbnYv7eDM3aHlUuDIN+
 Q0Fg==
X-Gm-Message-State: AOAM532rd+BlcBviPcs2QVkwBnw98jrR823tXlEthQSkESj8F5wT5R3i
 cM/rqkhqw5x1I2Tcs/8Zy1eVRng2G91sLF4OKyFwPExYoEx0cg/7oioMokAIFpeoQ7SfQWG1BNG
 zBfXSKgDT332vzTA=
X-Received: by 2002:aa7:c95a:: with SMTP id h26mr22617799edt.166.1613999646583; 
 Mon, 22 Feb 2021 05:14:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyev2J1VzV6vBw10O1T/gPJNqbv4i8epynwo4RIMijIl7f1dly2quMxDCaddCAC+bP9Xw4b9w==
X-Received: by 2002:aa7:c95a:: with SMTP id h26mr22617779edt.166.1613999646445; 
 Mon, 22 Feb 2021 05:14:06 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id q27sm2530454ejc.74.2021.02.22.05.14.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 05:14:05 -0800 (PST)
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210222115708.7623-1-david@redhat.com>
 <20210222115708.7623-10-david@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v6 09/12] softmmu/physmem: Don't use atomic operations in
 ram_block_discard_(disable|require)
Message-ID: <b5be291b-5864-4852-50bd-e75352ba8876@redhat.com>
Date: Mon, 22 Feb 2021 14:14:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210222115708.7623-10-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 teawater <teawaterz@linux.alibaba.com>, Igor Mammedov <imammedo@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/02/21 12:57, David Hildenbrand wrote:
> 
>  
> -/*
> - * If positive, discarding RAM is disabled. If negative, discarding RAM is
> - * required to work and cannot be disabled.
> - */
> -static int ram_block_discard_disabled;
> +static unsigned int ram_block_discard_requirers;
> +static unsigned int ram_block_discard_disablers;

Requirer is not an English word, so perhaps use required_cnt and 
disabled_cnt?

Also, uncoordinated require is unused, and therefore uncoordinated 
disable is also never going to block anything.  Does it make sense to 
keep it in the API?

Paolo



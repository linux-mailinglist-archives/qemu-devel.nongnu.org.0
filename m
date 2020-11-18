Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FE42B7A01
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 10:10:22 +0100 (CET)
Received: from localhost ([::1]:49692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJTp-0003xK-2t
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 04:10:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kfJIa-0005a2-W0
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:58:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kfJIZ-0000DM-5r
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:58:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605689922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KpUw/H4/w5ZTU3O9YcLgtkZOVGdpaiYS5+FIM/2HnTg=;
 b=ccHwzquZa4cIlkAu3/VD71M57B5YZV53guVRC4/rEb4lRv+hoGyVvTJRg/NRH1b3X8P4Wk
 CWYZbs9ch0CnS9i+UCQrLOPcAoW9Jr1JCc3KOSum6jFj7ycXGCnOIJI7+FVIe8y6gsjiu2
 Qn2oMVUt5Eia5DP98kVaAmz2bTApHAc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-ul1tBNomNdmRhMEDjEs_bw-1; Wed, 18 Nov 2020 03:58:40 -0500
X-MC-Unique: ul1tBNomNdmRhMEDjEs_bw-1
Received: by mail-ed1-f72.google.com with SMTP id n25so508188edr.20
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 00:58:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KpUw/H4/w5ZTU3O9YcLgtkZOVGdpaiYS5+FIM/2HnTg=;
 b=ei2tOh5neXaxAM7G5FGNX0aGZPTJllsTRhrLZxH71S4k1LBQvVSX/TLv3WZNZyodNp
 BAZctrsJFs8XU7t4mw0BIRHSlKJbita8d5DlS+eeVV8YOvNXKT4AYlCZl5Hl8a9PcLff
 jtWb8sSoh1k9AsjwC7JI+VZ7hqC0GZu7Tf8lq/bi4S8PEsKmpyYwmZ/pSWpIzqxXZgk5
 Mr0JEBxslg5DiuoR4XzipU6ETUjOiQXpQdnAcVshW5ee1RCpib4gNAX9ogh9q3l9utRY
 KuOqLlhJ0CDoaJ7b+mBUvKti+kaTg0FinUapzp2oHeZgCoKPZdxOngrZoouzmhqWndWG
 M/eQ==
X-Gm-Message-State: AOAM532Ry8d/qvB+v1i1UWYMholhtPpso6/ZYgffSJyLO1ZQsGiZ4Xli
 4sbeBajEzyHn6Dec/VVbBWBkV8nshm5/kVCEN+NVR+VNwbR+Ds+mh5ct3jk41+SaAgPoyQwj7u+
 nJYpifqngekflbRI=
X-Received: by 2002:a50:ab15:: with SMTP id s21mr24669010edc.88.1605689919488; 
 Wed, 18 Nov 2020 00:58:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw11x3nTSGcbSSWaoayuNKtBYC4BUDI70nycMov2gE5aCBY7IIgmdQeR0i2IC02aWgvKyRT0Q==
X-Received: by 2002:a50:ab15:: with SMTP id s21mr24668992edc.88.1605689919281; 
 Wed, 18 Nov 2020 00:58:39 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id w18sm13051834edq.43.2020.11.18.00.58.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2020 00:58:38 -0800 (PST)
To: Jessica Clarke <jrtc27@jrtc27.com>, qemu-devel@nongnu.org
References: <20201116200414.28286-1-jrtc27@jrtc27.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] hvf: Fix segment selector format
Message-ID: <d0cd26c7-5187-74d0-1f90-6933958671dd@redhat.com>
Date: Wed, 18 Nov 2020 09:58:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116200414.28286-1-jrtc27@jrtc27.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Cameron Esfahani <dirty@apple.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/11/20 21:04, Jessica Clarke wrote:
> The Requested Privilege Level field is 2 bits, the Table Indicator field
> is 1 bit and the Index field is the remaining 15 bits, with TI=0 meaning
> GDT and TI=1 meaning LDT.
> 
> Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
> ---
>   target/i386/hvf/x86.h | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/target/i386/hvf/x86.h b/target/i386/hvf/x86.h
> index bacade7b65..ea3e1b86b3 100644
> --- a/target/i386/hvf/x86.h
> +++ b/target/i386/hvf/x86.h
> @@ -214,16 +214,16 @@ static inline uint32_t x86_call_gate_offset(x86_call_gate *gate)
>       return (uint32_t)((gate->offset1 << 16) | gate->offset0);
>   }
>   
> -#define LDT_SEL     0
> -#define GDT_SEL     1
> +#define GDT_SEL     0
> +#define LDT_SEL     1
>   
>   typedef struct x68_segment_selector {
>       union {
>           uint16_t sel;
>           struct {
> -            uint16_t rpl:3;
> +            uint16_t rpl:2;
>               uint16_t ti:1;
> -            uint16_t index:12;
> +            uint16_t index:13;
>           };
>       };
>   } __attribute__ ((__packed__)) x68_segment_selector;
> 

I queued the patch, thanks.

On further look, though, the bitfield part of the struct is almost never 
used, and therefore most uses of the struct itself are more or less 
superfluous (apart from some typechecking).  In particular, 
vmx_read_segment_selector and vmx_write_segment_selector only use the 
16-bit .self field, and the code would be simpler if it was changed to 
just use a uint16_t.

The only place that "needs" the struct is in vmx_handle_task_switch's 
calls to x86_read_segment_descriptor and x86_write_segment_descriptor. 
Those are also the places that benefit from this patch.  But even then, 
for the sake of consistency it would make sense for x86_segment_selector 
to be used only inside those two functions; the arguments could be just 
an uint16_t.

Paolo



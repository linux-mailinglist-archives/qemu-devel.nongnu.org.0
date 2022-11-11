Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE0C62591D
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 12:09:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otRu4-0003Jd-9b; Fri, 11 Nov 2022 06:08:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1otRtz-0003Iv-G5
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 06:08:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1otRtw-0006Te-HK
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 06:08:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668164923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JWK7XtYPhxxOJCfn4B6o6kPJ553p8g8+cIof3dTQhwI=;
 b=PNpMAsKIvF/QaXbb1Eof3bZc7ks70th6GoZPzCZoPLtmi9XVYq0XmHmqB4hU4YZ69UNaRf
 ekmNqWKuclFUncQ2MCvPfFwxO/ho/sc+eji+OfhTJMHkHhRCyX7tOh9tTQGQ8G8jo4Jun4
 fCoG3bkOISDVKDrRRUWwMMf7EOvtesA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-183-jYAaZGj1NLuEnOglIeN0Fw-1; Fri, 11 Nov 2022 06:08:42 -0500
X-MC-Unique: jYAaZGj1NLuEnOglIeN0Fw-1
Received: by mail-wr1-f70.google.com with SMTP id
 m24-20020adfa3d8000000b00236774fd74aso916649wrb.8
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 03:08:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JWK7XtYPhxxOJCfn4B6o6kPJ553p8g8+cIof3dTQhwI=;
 b=OO+hd281KWpOs49RwuovszW1uhAUaxwfH3IZoqh3TcpX4A6Qnb6hkkkOn8llLKoFKS
 n53xtyRMOZwQejmMcP8GCmY22VlHsOU7iHrOIwot3N8Cv80Z6Ggg7IO7K++GfGa1oLBO
 QKeKcS0M8t/FIqzWRYorVh0j+3RuB26ALKoqwfXZqFiSZtzej2fb//sw/3vgZgyoxxhw
 9sO/+riNhxvWAca2qZqPXPS/LLSp8mcuAj2RoylBGF23USFwAZEasZeuBvKMH9vbzV+/
 g9gQ60SAvX1JE7s2yAMHlXqrdwgnis/1KLtA+5FXs7k6Qyyf6So5HxGP4ac4MGwqTb5X
 WdCw==
X-Gm-Message-State: ANoB5pmB8brPT9AV1MfRd15SBR4Cf6TKraBPXJox7TAy66wm+gXEfYhd
 nalzdKd3Sdz/FGdU6/swvT6IlDwTTTcJU/MY/XKT5JP4BPKmnJCnr0ZpeLTtv388mAucatvgJej
 rFrvNKiKjWLpB0nw=
X-Received: by 2002:adf:e289:0:b0:238:55af:b5db with SMTP id
 v9-20020adfe289000000b0023855afb5dbmr936531wri.97.1668164920871; 
 Fri, 11 Nov 2022 03:08:40 -0800 (PST)
X-Google-Smtp-Source: AA0mqf76nQFC5uHRtXiePU+OoEkgrTQPv3HRf8r6ykzquECZSS6X2fjnHYpmDLKpA8l8sO7Zahqc+A==
X-Received: by 2002:adf:e289:0:b0:238:55af:b5db with SMTP id
 v9-20020adfe289000000b0023855afb5dbmr936516wri.97.1668164920603; 
 Fri, 11 Nov 2022 03:08:40 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 w2-20020adfd4c2000000b00225307f43fbsm1625940wrk.44.2022.11.11.03.08.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 03:08:40 -0800 (PST)
Message-ID: <022fd97e-3500-5830-9a22-7caadc03d5a0@redhat.com>
Date: Fri, 11 Nov 2022 12:08:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: should ioapic_service really be modelling cpu writes?
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu-daude@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <874jv6enct.fsf@linaro.org> <87zgcyd70g.fsf@linaro.org>
 <Y21+VFqKpF6LGz2C@x1n>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Y21+VFqKpF6LGz2C@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

On 11/10/22 23:42, Peter Xu wrote:
> I think it shouldn't?  Normally the irq will be in MSI format (IOAPIC will
> translate to an MSI in QEMU, per ioapic_entry_parse()).
> 
> I had a feeling that it'll just go the shortcut here (MSI always starts
> with 0xfeeXXXXX so definitely bigger than 0xfff):

Note that QEMU subtracts 0xfee00000 by the time you get to 
apic_mem_write, but still yes, that's what happens for IOAPIC.  The 
write is on the PCI bus.

>      if (addr > 0xfff || !index) {
>          /* MSI and MMIO APIC are at the same memory location,
>           * but actually not on the global bus: MSI is on PCI bus
>           * APIC is connected directly to the CPU.
>           * Mapping them on the global bus happens to work because
>           * MSI registers are reserved in APIC MMIO and vice versa. */
>          MSIMessage msi = { .address = addr, .data = val };
>          apic_send_msi(&msi);
>          return;
>      }
> 
> apic_send_msi() doesn't need a cpu context.

Alex, perhaps you can change the shortcut to

     if (size < 4) {
         return;
     }

     dev = cpu_get_current_apic(memtxattrs);
     if (!dev) {
         /* comment here... */
         MSIMessage msi = { .address = addr, .data = val };
         apic_send_msi(&msi);
         return;
     }

     s = APIC(dev);
     ...

Paolo



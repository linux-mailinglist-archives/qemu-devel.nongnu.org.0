Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D719D6AC1C8
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 14:49:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZBD2-0002eM-Qt; Mon, 06 Mar 2023 08:49:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZBCR-0002cR-PK
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:48:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZBCP-0003bd-QO
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:48:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678110501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xp1uVGpz5WAE3d5wBHh+CPfxFFEftI2bHpCIHpoRqB8=;
 b=Hs71Ej4SsTwAOmKy4q+p84QYzlDisW91X5BUjJEfZVhtLgF5n0qoTI0xRnXLIZsduO74UC
 DLZbYjFnnzgf6dA7KoWrfIrxCf8uktvLoad1/pTOS/VcLXBNBPXMYZ+H5NSPme7fqAV0ok
 HwxlCsd8ujnKTsf7WLh0P+0ymTkbYlg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-5kWsltlVOy-YkPKqHWs1dQ-1; Mon, 06 Mar 2023 08:48:19 -0500
X-MC-Unique: 5kWsltlVOy-YkPKqHWs1dQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 e17-20020a05600c219100b003e21fa60ec1so3769036wme.2
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 05:48:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678110498;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xp1uVGpz5WAE3d5wBHh+CPfxFFEftI2bHpCIHpoRqB8=;
 b=d0PKSVXBQvQINigpGM3hxxrOmBVxvCOR6Y1Te8b2LyrAKI5Vi6ZdjImQTXIU886OYz
 CR/+n0ZTRqHdPd251jG6febNNPi3kEtLe7BeLCXb9s0LFb/G0K5GWOVLUjBGcL7pKkaG
 6l6C4f7HRIUKvjL72pWg3ijISQA9Qwv/XGDZoM/Z2AZnCq1PHQ4JysmvozvZhMX1IGeZ
 +8dxGJjXIu3ErSU4ywEVhGpxex/vxEPRtfS2zt3GNJPk+jJdIV61RCVDuF3SoYvcRtL2
 AZtKdbfeph6l028mU+FSWO4A9KhbAcOF5h6O3H2nrLjA2DupG6pHjn/f3/erFeag2VJe
 CBRQ==
X-Gm-Message-State: AO0yUKV7xJ74n6iU5i53vf8lvO/J41/TVs6m2oMoCV9JU6nPBA6M8JXa
 qtkO6c/vf02VutF1FXrNFO1HaBlIGQatfKhXZCdL923DgKutlLn2qSmEvwj7eOd97iAIBUyBfcQ
 jlXz5oBB9VEddhes=
X-Received: by 2002:a05:600c:190b:b0:3eb:38e6:f64f with SMTP id
 j11-20020a05600c190b00b003eb38e6f64fmr9267077wmq.8.1678110498646; 
 Mon, 06 Mar 2023 05:48:18 -0800 (PST)
X-Google-Smtp-Source: AK7set8gc4hy0Y9b+zGdCJ1WXKWLCkTPj6LWr9s/xMhjNkm3Fu6ztFBbjS1tZSQvYUJf6SWYT6Lk9w==
X-Received: by 2002:a05:600c:190b:b0:3eb:38e6:f64f with SMTP id
 j11-20020a05600c190b00b003eb38e6f64fmr9267050wmq.8.1678110498419; 
 Mon, 06 Mar 2023 05:48:18 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-59.web.vodafone.de.
 [109.43.177.59]) by smtp.gmail.com with ESMTPSA id
 p21-20020a05600c431500b003daf672a616sm10046951wme.22.2023.03.06.05.48.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 05:48:17 -0800 (PST)
Message-ID: <a97c8b6d-8e58-82b5-d73f-72a7061fb5d4@redhat.com>
Date: Mon, 6 Mar 2023 14:48:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 2/5] docs/about/deprecated: Deprecate the
 qemu-system-i386 binary
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <20230306084658.29709-1-thuth@redhat.com>
 <20230306084658.29709-3-thuth@redhat.com> <ZAWx5eBskd1cItDx@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <ZAWx5eBskd1cItDx@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 06/03/2023 10.27, Daniel P. Berrangé wrote:
> On Mon, Mar 06, 2023 at 09:46:55AM +0100, Thomas Huth wrote:
>> [...] If a 32-bit CPU guest
>> +environment should be enforced, you can switch off the "long mode" CPU
>> +flag, e.g. with ``-cpu max,lm=off``.
> 
> I had the idea to check this today and this is not quite sufficient,
[...]
> A further difference is that qemy-system-i686 does not appear to enable
> the 'syscall' flag, but I've not figured out where that difference is
> coming from in the code.

I think I just spotted this by accident in target/i386/cpu.c
around line 637:

#ifdef TARGET_X86_64
#define TCG_EXT2_X86_64_FEATURES (CPUID_EXT2_SYSCALL | CPUID_EXT2_LM)
#else
#define TCG_EXT2_X86_64_FEATURES 0
#endif

  Thomas



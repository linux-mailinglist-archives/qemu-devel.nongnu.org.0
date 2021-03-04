Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D32F32D622
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 16:12:05 +0100 (CET)
Received: from localhost ([::1]:60362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHpe0-0001UQ-BS
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 10:12:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHpND-0000YZ-E8
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:54:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHpNB-0001zy-96
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:54:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614869679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xr+0xjbR8wujVaSiREj96vjfeZy56B32moH25XWztBo=;
 b=XUtReQOez1dg2/qOnmFKNmV7Sn0Mx3dKJ+RD2dj35/e8ujN9UtPkEUjIsI3YgvGIKykTs1
 stbOjRBU/ch4oxefbz+JYbqahJQZ4fu+zstVB0yPpE5AL62fOrAyjxdEDfmJtNOmCGsNKm
 e8HbD/lzlcWlNlvpijx1CALOhq/oMm8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-PmF1_cihPTSM2XOsxaoj-A-1; Thu, 04 Mar 2021 09:54:38 -0500
X-MC-Unique: PmF1_cihPTSM2XOsxaoj-A-1
Received: by mail-wm1-f69.google.com with SMTP id a65so2746205wmh.1
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 06:54:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xr+0xjbR8wujVaSiREj96vjfeZy56B32moH25XWztBo=;
 b=J5j/KIj/x+yWmFfrN5+61h96Mu4b5+qc/tpxX43qskxlfG18F+dIE0H8mLg0FJkp0a
 f/z+0y0qNTU8MLc2LsfIs28pL/lzvyeywGnlHMCNJzy2K4InLdkM+wjCDPOUerD+canN
 kc/Ww0F4YCXuC/E0fIzHYlm0/f9Cp4imdO/JZ+hWISCI8tV8r00xoCQofb39JznikXL4
 /ePD++q5wibYTC9hyIxS1snsF4u2nF0RNjtelnbtxI1SITnIT2KvC61gQONxTjuUYwk9
 4F96ntjufbX771QKl3i3wSdrL+7xnUrN7hqIs0tnzvuolC58YJaXJWnRPMLHeKXZ3agu
 FhVA==
X-Gm-Message-State: AOAM533DrW+uEXxnygjW3ZIpHQLJPQvnrQ5mp8/rgiMwHL+XE6t2FRRb
 DCk6JDCm/N3Kv/srJAMx6SYBmpB2+EEsBXvyG7zhRiRBIW/DsA5hm5rMo+Dy01ygrfncdsgjj1u
 SJnU5N7u18VIZzgo=
X-Received: by 2002:a1c:1f04:: with SMTP id f4mr4480705wmf.12.1614869676947;
 Thu, 04 Mar 2021 06:54:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwkvaeX62cIP49GRybRrBdkH5Eb5lkzjIfeG7/sCFGKZ5uRMBXqFUsG+t1YjvIFMgWx4AyviA==
X-Received: by 2002:a1c:1f04:: with SMTP id f4mr4480671wmf.12.1614869676729;
 Thu, 04 Mar 2021 06:54:36 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id w6sm16059433wrl.49.2021.03.04.06.54.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 06:54:36 -0800 (PST)
Subject: Re: [RFC PATCH 00/19] accel: Introduce AccelvCPUState opaque structure
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210303182219.1631042-1-philmd@redhat.com>
 <a84ce2e5-2c4c-9fce-d140-33e4c55c5055@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1eda0f3a-1b11-a90e-8502-cf86ef91f77e@redhat.com>
Date: Thu, 4 Mar 2021 15:54:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <a84ce2e5-2c4c-9fce-d140-33e4c55c5055@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Claudio Fontana <cfontana@suse.de>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcelo Tosatti <mtosatti@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/21 2:56 PM, Paolo Bonzini wrote:
> On 03/03/21 19:22, Philippe Mathieu-Daudé wrote:
>> Series is organized as:
>> - preliminary trivial cleanups
>> - introduce AccelvCPUState
>> - move WHPX fields (build-tested)
>> - move HAX fields (not tested)
>> - move KVM fields (build-tested)
>> - move HVF fields (not tested)
> 
> This approach prevents adding a TCG state.  Have you thought of using a
> union instead, or even a void pointer?

Why does it prevent it? We can only have one accelerator per vCPU.

TCG state has to be declared as another AccelvCPUState implementation.

Am I missing something?

Preventing building different accelerator-specific code in the same
unit file is on purpose.

Regards,

Phil.



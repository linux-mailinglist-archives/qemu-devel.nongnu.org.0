Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 654196F7F1B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 10:30:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puqoi-0003b9-VF; Fri, 05 May 2023 04:29:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puqog-0003aZ-Vu
 for qemu-devel@nongnu.org; Fri, 05 May 2023 04:29:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puqoe-0002sW-Mt
 for qemu-devel@nongnu.org; Fri, 05 May 2023 04:29:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683275364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LdGQ5Iff4ofU4lB9I6Mk/AZfuvu30ar3dTp7kzkc4Ho=;
 b=YHfsr+5mtsVOeeFVPxB+SAoGiz+WHyFUEBoqjJfa1C3FOp6TRZnA7or2Sm5l9rCQ/D/3p0
 TGmbunVjoysKb/bnnMA4YLMbwu8QrEf3dL8U6cw+vjtdwSDFlnw9ugcpK5jFf/C5cbxIdz
 fp8rvs1GboR5ooG0JtfyWstiqaeyTBQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-326-sOFvfRCeOG-ZXFgAt4mhjw-1; Fri, 05 May 2023 04:29:22 -0400
X-MC-Unique: sOFvfRCeOG-ZXFgAt4mhjw-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-965c6f849b9so121623366b.2
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 01:29:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683275361; x=1685867361;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LdGQ5Iff4ofU4lB9I6Mk/AZfuvu30ar3dTp7kzkc4Ho=;
 b=ewD7Cht4SHvbQdE0j4rXQMXFcAqBF1NFCMeiGpZu2whuG5j/OkELH3S5jIG6apvnCv
 c1Am4W7dn9vASt/3A9YB6ObiDRl0f/V966IzZ4vPTSZI3nTdxJcUAZjiHaMkv9yIx3IN
 iL9u2EzQXJUp6XsrhiWpzjQ1NhALAIG03YM5NxEiQuL4d6bQntlVbizU5pHEWUyDKWS9
 NiML81QAiH0gP0DDiYchrN2X7sTrsTWMA4QgPp4+0JBLjxxrv8ETcAStXjUTqDIcY2CQ
 8TCVb+Qy/QAgzD4rlcfwk5AltSWkYp6lBZj6chhFXx45/pggwemfwcZV+11ZX1WW3cOl
 xVlw==
X-Gm-Message-State: AC+VfDwbM7kNUOMzx2axnldpZx75kP7VrVHN6Ujy4e7CuvMF1CK4NtK1
 ZKZbLJuT0Tm4AlTZwB9vfCdvVJ0ptNVPdlk9wOCp7HP77Dw/UhM1hB6AB4SPat74YtH/UftYpSR
 YQgSVX0VQ7qXVCvk=
X-Received: by 2002:a17:906:ee84:b0:94a:549c:4731 with SMTP id
 wt4-20020a170906ee8400b0094a549c4731mr420882ejb.57.1683275361396; 
 Fri, 05 May 2023 01:29:21 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5U+UCVItL90FHF+zyfg8PN1bCH3TUFIlIH9StNOC6NT9eBmlQEUHqwEbrzfLrxbt8GDpe2Pg==
X-Received: by 2002:a17:906:ee84:b0:94a:549c:4731 with SMTP id
 wt4-20020a170906ee8400b0094a549c4731mr420858ejb.57.1683275361113; 
 Fri, 05 May 2023 01:29:21 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 ig2-20020a1709072e0200b00959b810efcbsm647109ejc.36.2023.05.05.01.29.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 May 2023 01:29:20 -0700 (PDT)
Message-ID: <4ac6c060-8655-c5df-e27b-3dfb520ad388@redhat.com>
Date: Fri, 5 May 2023 10:29:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Babu Moger <babu.moger@amd.com>, richard.henderson@linaro.org
Cc: weijiang.yang@intel.com, philmd@linaro.org, dwmw@amazon.co.uk,
 paul@xen.org, joao.m.martins@oracle.com, qemu-devel@nongnu.org,
 mtosatti@redhat.com, kvm@vger.kernel.org, mst@redhat.com,
 marcel.apfelbaum@gmail.com, yang.zhong@intel.com, jing2.liu@intel.com,
 vkuznets@redhat.com, michael.roth@amd.com, wei.huang2@amd.com,
 berrange@redhat.com, bdas@redhat.com
References: <20230504205313.225073-1-babu.moger@amd.com>
 <20230504205313.225073-5-babu.moger@amd.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v4 4/7] target/i386: Add feature bits for
 CPUID_Fn80000021_EAX
In-Reply-To: <20230504205313.225073-5-babu.moger@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.28, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/4/23 22:53, Babu Moger wrote:
> Add the following feature bits.
> no-nested-data-bp	  : Processor ignores nested data breakpoints.

This bit is useless, unfortunately.  Another similar bit include the one 
about availability of FCS/FDS in the x87 save state.

They say that something is _not_ available, so a strict interpretation 
would prevent migrating from any old processor to Genoa, because in 
theory you never know if guests are using nested data breakpoints.

In practice, this does not really matter because no one used 
them---that's why AMD could get away with removing them---but please 
tell the architects that while they're free to deprecate and remove old 
features, adding CPUID is basically pointless.

Paolo



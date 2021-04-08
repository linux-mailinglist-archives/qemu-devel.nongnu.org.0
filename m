Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 610AA35839B
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 14:48:50 +0200 (CEST)
Received: from localhost ([::1]:52182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUU5Z-0002cf-FN
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 08:48:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lUU3E-0001nS-VJ
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 08:46:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lUU3A-0006TG-Rp
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 08:46:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617885976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HwLNs81CEl94JDE2NVU9dA6672KQfUIm0bjV2m19UF0=;
 b=jPOZ9QJZlwkTH+sAb8ybTNYwbH7i6XLD23x2m6ZXkKzPHhWZPwj/eQAgvRImrpmy9uN+U3
 dfx4oxQ82Duq4TIspgPn4LLUsBmkEnLqdJ6hOc5sblPe3eWhn41Um2i5Y6/ZpiFGhtsrXd
 fH8ZI/8kEplsqw/D0FJn9vRTiowjEF8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-QqkT_mapNZuBCIe7fTIMpw-1; Thu, 08 Apr 2021 08:46:11 -0400
X-MC-Unique: QqkT_mapNZuBCIe7fTIMpw-1
Received: by mail-ed1-f72.google.com with SMTP id a8so978850edt.1
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 05:46:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HwLNs81CEl94JDE2NVU9dA6672KQfUIm0bjV2m19UF0=;
 b=DHo6eRara1m6PjJMCg/MJhQRenxh+BLVOEY9+R53T8r8hwt6pfitkNdHlSnE3rUpsn
 Q9dEHuptG6pVOsUjXuyewjkLNmycvap0AZYZeRcJkW3/rXmIdFz0LnizrvLLRvIeIUFR
 Y1WQrQVuUQRuARsMffBKdrSt/Mp7joTk8XjtPMAYtIAvOmuDeRen/TiiL9AwUMGfhMju
 aY5dNHPe4GsKyimPDRAFzeLNsf1XnuOJducOU7dqXQFb+LlX/YFFdvm0CZYWPLNa9eS/
 dPI3SNSQdWLdTXZoVtL0TXWRpm+e4XtwmB/kFGTe1p72TE/fJC6dco8me4r8jUAQ8Itd
 OeCQ==
X-Gm-Message-State: AOAM532U9fXq0Z4Bp1ASnhRdMWLJWcHjxnU3t+qeAYOQWx7NW7m5BL5A
 /T7heuA+XK+6IZxwfnuzuc51lV8vIy/PS0AoGFEjGw9eDOLUyCGYbKE+uD1YsoUFTXz77jTcde+
 j9ZNzPUr7E9o47Xw=
X-Received: by 2002:aa7:de8b:: with SMTP id j11mr11215715edv.363.1617885970027; 
 Thu, 08 Apr 2021 05:46:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyC5OwhjEitLVo+SzoGXnAC9lyHIWQZjd5ZflTYbewpRdXbStjlpLTaujk6WBnIBBMtX6AHg==
X-Received: by 2002:aa7:de8b:: with SMTP id j11mr11215688edv.363.1617885969830; 
 Thu, 08 Apr 2021 05:46:09 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d1sm14223774eje.26.2021.04.08.05.46.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 05:46:09 -0700 (PDT)
Subject: Re: [PATCH 0/2] i386: Fix interrupt based Async PF enablement
To: Vitaly Kuznetsov <vkuznets@redhat.com>, qemu-devel@nongnu.org
References: <20210401151957.408028-1-vkuznets@redhat.com>
 <ea3fc380-332f-b9e5-aa31-3540916cfc33@redhat.com>
 <87sg43d4gk.fsf@vitty.brq.redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <091dec53-cc0c-04ca-154a-3cfab6475705@redhat.com>
Date: Thu, 8 Apr 2021 14:46:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87sg43d4gk.fsf@vitty.brq.redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/04/21 13:42, Vitaly Kuznetsov wrote:
> older machine types are still available (I disable it for <= 5.1 but we
> can consider disabling it for 5.2 too). The feature is upstream since
> Linux 5.8, I know that QEMU supports much older kernels but this doesn't
> probably mean that we can't enable new KVM PV features unless all
> supported kernels have it, we'd have to wait many years otherwise.

Yes, this is a known problem in fact. :(  In 6.0 we even support RHEL 7, 
though that will go away in 6.1.

We should take the occasion of dropping RHEL7 to be clearer about which 
kernels are supported.

Paolo



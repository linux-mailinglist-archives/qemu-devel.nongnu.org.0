Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B42913E2DED
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 17:50:00 +0200 (CEST)
Received: from localhost ([::1]:47534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC26h-0005pX-Pq
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 11:49:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mC24X-000348-Ly
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 11:47:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mC24W-0001Tj-C5
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 11:47:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628264863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iJBs45xK23PNFRlmyQ8mnRU8+rUkxYlAtgW4j71Ftyk=;
 b=S/x50DFJyi8vkwFq0WUuDVmhYR0Jsl3mkSGm8UUtjAWnpvJ4+osJct0IG/qeejxPLTTpuh
 cv917cv3wy+jRsJ/aqsWOKtarbjIxulBE966qdU06nm/YcfkSpb57XJ1uf6sm805omeeN0
 CTw4m79rmpmVuhfb9CH3nQb6agAegBw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-F74-pk4vPTWdGPZYQSkmtg-1; Fri, 06 Aug 2021 11:47:42 -0400
X-MC-Unique: F74-pk4vPTWdGPZYQSkmtg-1
Received: by mail-ej1-f72.google.com with SMTP id
 lu19-20020a170906fad3b029058768348f55so3277496ejb.12
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 08:47:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iJBs45xK23PNFRlmyQ8mnRU8+rUkxYlAtgW4j71Ftyk=;
 b=aoK/YVnA+SYGGTr60v6NSU8KKJRFVnir64+A4gY0aGMbhUvPmelSK6BNAZAGbQ8zTu
 wtwzx0cSfDq+/eppLqOz/P5kOC2JYDskDGN43MuV7nzdZqSkXlm52MJSQKAe4updVOI7
 hjhVUXybWbjQefzNVYQyGQ6fHfFl2V8TdSk6FvVet65Qoxd92V/I8otci7PRes2fSyNq
 Gj3GkbRZ47LevHM29P6I/OWgg8lwNM2VuZ+4x4SNcfEdz8v/gC/+XKPHIBIGEL9eFzPp
 ELMCXeYPqeJVsRmofpVZXP1ulx6Wo2qNlIDapDaTJeYW1ukGZ3f7BrteAHNMFxC0UW1l
 Sn6A==
X-Gm-Message-State: AOAM533KTVQz2WqgW86TbMYN3D+fix4yf0eaNZPJKnZZdknDhwEN5n9T
 zLIvvWIwN4eAxqgEg0k2xYbcZT/E8TdwL9QuaeWV0gtqz97vLHS3aWCZqtUoZFrEJri8ijK2U1h
 LoIkn7NFi0i/LMe0=
X-Received: by 2002:a17:906:82ca:: with SMTP id
 a10mr10283194ejy.137.1628264861392; 
 Fri, 06 Aug 2021 08:47:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypLmr64auYVz+vyZvlGqSiSl+RIk44Bgp/cDiBZ7aGmuSohHPhlyj1TrbioPIJPYevU7cANQ==
X-Received: by 2002:a17:906:82ca:: with SMTP id
 a10mr10283093ejy.137.1628264859871; 
 Fri, 06 Aug 2021 08:47:39 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id d23sm2984793ejc.4.2021.08.06.08.47.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 08:47:39 -0700 (PDT)
Subject: Re: [PATCH 1/6] docs/about/removed-features: Document removed CLI
 options from QEMU v2.12
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210806151012.103108-1-thuth@redhat.com>
 <20210806151012.103108-2-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a5a25570-a61a-ee72-e4f2-5a37cffc275e@redhat.com>
Date: Fri, 6 Aug 2021 17:47:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806151012.103108-2-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.619, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/08/21 17:10, Thomas Huth wrote:
> +
> +``-no-kvm-pit`` (removed in 2.12)
> +'''''''''''''''''''''''''''''''''
> +
> +There is no replacement, since this was just a dummy option that has been
> +ignored.

The same effect (plus also disabling the KVM IOAPIC) can be obtained 
with "-machine kernel_irqchip=split".

> It still can be requested explicitly using
> +``-global kvm-pit.lost_tick_policy=discard``.

The right one is "delay" (it's wrong in the wiki), while discard 
corresponded to -no-kvm-pit-reinjection

Paolo



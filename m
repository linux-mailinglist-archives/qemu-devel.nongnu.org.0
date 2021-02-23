Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B07322D2B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 16:10:03 +0100 (CET)
Received: from localhost ([::1]:49484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEZK6-0003C3-9y
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 10:10:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEZI0-000268-8O
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 10:07:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEZHy-0002jb-MQ
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 10:07:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614092870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tUnt08oW2dZ1VVfk6tmBCSpZHR5vCmYTJ2TPBcdTils=;
 b=gyayIMUQtTKG+ZVmUpZwHiPxyWv5PkWyh0DE+s81YVY7XN3c+IMZrOUbQGxqLefAVolsZ0
 KDPrjwXHi2L4TFsMBfPLNxV1Ll57TITTqtWj6U73/Cnc44cD7cTcHnkLKxZrRcaQbKIQPc
 3TeYw8ym9cseYxMX96RLtSpoFR3020U=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-zx_JLGV6PoKDUyduukDpaA-1; Tue, 23 Feb 2021 10:07:39 -0500
X-MC-Unique: zx_JLGV6PoKDUyduukDpaA-1
Received: by mail-wr1-f70.google.com with SMTP id b7so2773602wrv.7
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 07:07:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tUnt08oW2dZ1VVfk6tmBCSpZHR5vCmYTJ2TPBcdTils=;
 b=Oz+dghZEq3y6CRqyGGL2DieAialhRyUBfxVjfg0La5La3LZlboHAuV3RbT7A0mit7A
 OOiw+MrTQVya0ujRlracKOsfXFmr2SwuZMUHT5Nf5ZNT6oxfspUS1aHNViFnpz/LztI9
 KNiZ+QDMI1edly1d9bKSK6PUcimVEjKqPiXUzPgYb39uEhX4cAkFNy2K3UX10Z1j3XCg
 JIORW2gvOIC72ct6ebi3ABpHWR0fJsnheYnbB9+vjdse06poDTA9WIehn96Aj7GB5JjB
 yBd3+N3cf5Jg6orXKVHZgpzVTbwvnwjyKULG7+Tss/qdfaphMeYlHbMqnSYhmmah8hEg
 VHNg==
X-Gm-Message-State: AOAM532hXeHILaB2Irrya5L85tckO6cGD7AsY/ah83a8u0EeFkHIQI7S
 imLLgC6WlT6eJxhK3gSdnTJsyoOzODRLaer9vW0iSG+YdB+RwnODMhl2UTqeFp4NF19QuK7Iy+S
 7/zEIOkHiXp46lck=
X-Received: by 2002:a05:600c:203:: with SMTP id
 3mr26080556wmi.187.1614092858644; 
 Tue, 23 Feb 2021 07:07:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz9ePvIFCJHrCBVNl8DFZFv3Op5bQKtjhPsb+g9rpTQE6Ya33A9qYXYBlwFpSixH9UX69icbw==
X-Received: by 2002:a05:600c:203:: with SMTP id
 3mr26080521wmi.187.1614092858485; 
 Tue, 23 Feb 2021 07:07:38 -0800 (PST)
Received: from ?IPv6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id z5sm33629613wrn.8.2021.02.23.07.07.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 07:07:37 -0800 (PST)
Subject: Re: [PATCH v6 01/11] hvf: Add hypervisor entitlement to output
 binaries
To: Akihiko Odaki <akihiko.odaki@gmail.com>, Alexander Graf
 <agraf@csgraf.de>, qemu-devel@nongnu.org
References: <20210120224444.71840-1-agraf@csgraf.de>
 <20210120224444.71840-2-agraf@csgraf.de>
 <a41a39e5-951f-c178-d50e-6041eec63cbe@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <419dbb9c-badd-25d8-1755-00978a592671@redhat.com>
Date: Tue, 23 Feb 2021 16:07:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <a41a39e5-951f-c178-d50e-6041eec63cbe@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Frank Yang <lfy@google.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/02/21 12:56, Akihiko Odaki wrote:
> 
> I noticed that the installation process corrupts the code signature 
> because meson modifies the file to fix dynamic shared library install 
> names. Also, stripping apparently does not work because the signed file 
> is not considered as "executable" by meson. Here is some change I wrote 
> for my own use, just for reference:
> https://github.com/akihikodaki/qemu/commit/6a9b5d7e4ea03b1e757be1eedf256871bb6a5bdd 
> 

That seems like a feasible way to do it.  We could also have a single 
script with --build and --install as the first argument.

Since entitlement support is already part of the upstream tree, would 
you like to submit the patch and Cc me so that I can include it?

Thanks,

Paolo



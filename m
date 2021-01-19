Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE63E2FBFB7
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 20:05:54 +0100 (CET)
Received: from localhost ([::1]:43990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1wK9-0003zY-B5
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 14:05:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1vWx-0002Td-OW
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:15:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1vWu-0006y0-Gj
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:15:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611080098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oHoF3RqC7zqSNCEmEZCX9KsBvhpayGxvg9Pthsg7Yr4=;
 b=WY9Y9VlYmk9LM748nt2a8MR272zBbnpXlGA2t+4VBROdPgGe5TMmuv6tQCO7nX0o3w3aWi
 x4Roh9pIETWvqLTASNKR7CS3pXYY3LTsqb/kjdA/Z43VhsITpLZwbd5t96mrDvIkrh9Nbf
 +aGk8dN0mDoYtxb/pLxEIQZFl0lI4HA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-N9joyx-DM5aldk5agHW_Aw-1; Tue, 19 Jan 2021 13:14:56 -0500
X-MC-Unique: N9joyx-DM5aldk5agHW_Aw-1
Received: by mail-wr1-f71.google.com with SMTP id j8so973643wrx.17
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 10:14:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oHoF3RqC7zqSNCEmEZCX9KsBvhpayGxvg9Pthsg7Yr4=;
 b=QPe2r42phlFruHhDjlN8ggp4U2X/rRMS+7DZ9GsJvTNMT/pcmAgI/lmGSOpqfzQp82
 LIzWkqBkZ/ykpil5OG/t+YyRyeHM4GIomVnWaiGKydieUkwuvPGZfoQywWxEjwQzJ0UD
 23/lt0kt6TTOxiFkZaCLZHVLdjyxACD1lxkpA+tiTvIWVqfbZuL8LF67mjXJRKcQU4Ho
 XHUAnlXRsRTxfJCk+Vl7Mb96qMulJ4u8HuxCKwQVduI0CS1Zq2iA+v9OKrPNIGY0O5S1
 tEfzSH1NpBWcbixSVcTw4o/YGuR8ICNka2wa3s7cR2FYcDGiPmhtCxDFbWQviD3CZWU4
 8jLw==
X-Gm-Message-State: AOAM530hfNyIciCRCEwZn4CwrSX0756ObhV6bN/hv1r2Bsa46+eJ1+Zp
 /65mlt4ldYUyvSOFvckfA35xAOyFFvQagaDOA+MR2d8A6Vl74J6BkO9+cUS08mi7oKy6xo+RqYl
 5edh1alcwvtgcrFk=
X-Received: by 2002:a5d:4882:: with SMTP id g2mr5536595wrq.273.1611080094824; 
 Tue, 19 Jan 2021 10:14:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyCsLeZ8re4jRmrU9YEi2pJJnjImuXvHoBHA7ca87z17lA4efh85gY4LtBMQazT/WiNkuwtOA==
X-Received: by 2002:a5d:4882:: with SMTP id g2mr5536570wrq.273.1611080094620; 
 Tue, 19 Jan 2021 10:14:54 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s13sm39369852wra.53.2021.01.19.10.14.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 10:14:53 -0800 (PST)
Subject: Re: [PATCH v2] target/i386/hvf: add vmware-cpuid-freq cpu feature
To: Roman Bolshakov <r.bolshakov@yadro.com>, yaroshchuk2000@gmail.com
References: <20210113205221.32308-1-yaroshchuk2000@gmail.com>
 <20210114194703.134333-1-yaroshchuk2000@gmail.com>
 <YAceePtQwCy8Gmwx@SPB-NB-133.local>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <827a0bdd-b897-3354-b7d6-53d9e7f90454@redhat.com>
Date: Tue, 19 Jan 2021 19:14:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <YAceePtQwCy8Gmwx@SPB-NB-133.local>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/01/21 19:01, Roman Bolshakov wrote:
>> +    switch (index) {
>> +    case 0x40000000:
>> +        memcpy(signature, "TCGTCGTCGTCG", 12); /* QEMU Signature */
> Hi Vladislav,
> 
> TCG belongs to TCG accel identification, for HVF it should be
> HVFHVFHVFHVF.

You can use the KVM identification just fine, as long as you comply with 
the rest of the KVM CPUID specification.

Paolo



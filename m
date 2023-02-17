Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE1769B11A
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 17:38:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT3kh-0002Vc-OH; Fri, 17 Feb 2023 11:38:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pT3kd-0002U2-AJ
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 11:38:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pT3kb-0008Cn-I1
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 11:38:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676651900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h1RtxEreGjpeu6w9jCvskREESVW8GRlfjHnkyi//YiU=;
 b=OzR+m1ZhPoL5jhZqIKrGultFSQXrczZehtoE5wBRmWDw5jTXt/8k5DHqNz3adfOQuOsApa
 LJKJBH7QvNDsrghvgUEBjkVuElhmGk4BKCtDK1mD10m4kJ75coHcLqfutEA0pUq/1At/xD
 3f5p7vFUEky9qNUY7uOGNa6B6T8Ljzc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-141-wAgJNr2WOpWwvFFcqtPvxQ-1; Fri, 17 Feb 2023 11:38:16 -0500
X-MC-Unique: wAgJNr2WOpWwvFFcqtPvxQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 ay3-20020a05600c1e0300b003e21fa6f404so1193358wmb.2
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 08:38:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h1RtxEreGjpeu6w9jCvskREESVW8GRlfjHnkyi//YiU=;
 b=O1x1Csilw5DNakb6QsjUITMZ4BNBdiAfnY9fjC4XhOxQcMc7/y1Imv3dedq0OrZgbI
 AJUo8ChDsEXZsu2IqU5kNJT9WheplWuJp9Dk0HolKigFGC6KWk8Tq0ADZjg365DXCDMK
 7zEopvRe6bNu5Y7S0T9zRHt8roQ8dsaRYtL5mr2CJTYavfww/WjreilUdfNoL3UaLBAc
 fKvjOal3GIvLfy3wdvUIz05599iBmICRUPugJLNLFPI1o/Yr7pXmr3MztA0YuTA4DHgo
 xsO9I7W8x27MuoMAPTBmONhw1tAl0U3WKkp3UhMog3Mk65coiltgCc+hLkenRvmTS6VA
 s6qA==
X-Gm-Message-State: AO0yUKXfe2CEiQCxA1PcIUBOy0cYfyF0sazcaQyiMRU/mb4OcJp5ttZU
 twsMZWyVvjITbENe986Tt3vb9p3Jm9wypkHkbePWFv+w2zvAwBs0svaq1PH8DC1njCG0/B1YP6U
 7JCF7883mgVm6kls=
X-Received: by 2002:a05:600c:6011:b0:3e2:2057:b9d6 with SMTP id
 az17-20020a05600c601100b003e22057b9d6mr2408927wmb.20.1676651895376; 
 Fri, 17 Feb 2023 08:38:15 -0800 (PST)
X-Google-Smtp-Source: AK7set/KGEP1e2wcntRbZpKZqyFpXGD3/Pu9CVT9A/AtmX6CXk61/h62DdteZI9uBQK/CbJ8peIt4Q==
X-Received: by 2002:a05:600c:6011:b0:3e2:2057:b9d6 with SMTP id
 az17-20020a05600c601100b003e22057b9d6mr2408913wmb.20.1676651895106; 
 Fri, 17 Feb 2023 08:38:15 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 iz7-20020a05600c554700b003e203681b26sm5158153wmb.29.2023.02.17.08.38.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 08:38:14 -0800 (PST)
Message-ID: <b55b506e-5a73-329a-24ee-14eafc5a95c1@redhat.com>
Date: Fri, 17 Feb 2023 17:38:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH] docs/about/deprecated: Deprecate 32-bit host systems
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, libvir-list@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Reinoud Zandijk <reinoud@netbsd.org>, Ryo ONODERA <ryoon@netbsd.org>,
 Brad Smith <brad@comstyle.com>, Stefan Weil <sw@weilnetz.de>
References: <20230130114428.1297295-1-thuth@redhat.com>
 <87a61cbmti.fsf@pond.sub.org> <Y+9bSHshiNnek31J@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Y+9bSHshiNnek31J@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.256, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 2/17/23 11:47, Daniel P. Berrangé wrote:
> On Fri, Feb 17, 2023 at 11:36:41AM +0100, Markus Armbruster wrote:
>> I feel the discussion petered out without a conclusion.
>>
>> I don't think letting the status quo win by inertia is a good outcome
>> here.
>>
>> Which 32-bit hosts are still useful, and why?
>
> Which 32-bit hosts does Linux still provide KVM  support for.

All except ARM: MIPS, x86, PPC and RISC-V.

I would like to remove x86, but encountered some objections.

MIPS, nobody is really using it I think.

So that leaves PPC and RISC-V.

> If any, is there an EOL date for Linux 32-bit KVM support ?

No, and I don't think there's going to be one.

Paolo



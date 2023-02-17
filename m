Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D69069B291
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 19:49:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT5m6-0004bL-Fo; Fri, 17 Feb 2023 13:48:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pT5m4-0004ar-AY
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 13:48:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pT5m2-0005xD-LM
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 13:48:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676659677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DHUvpsr4oPJ0GOY4xGj2d9Ecruh+V2SlNMkXku7h2oE=;
 b=DVycfaK/YFoMvAqFnARY03Y50r8IkUf64ZDTZMX8SdNQ7f2pGnsA2y3dn5Vuf07n2uhZ/Y
 ZE338ZfaI02ufZWMiyIW4p6ValHC8WSzgy3CwykZiLwi8O4NDx7u+ZTL+TchV/zgbG5k7J
 6rg70jDvOFrw3FAIuj5PhNYD2AV4emo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-638-j9OvzHjkMXiA50NvVmKa_g-1; Fri, 17 Feb 2023 13:47:55 -0500
X-MC-Unique: j9OvzHjkMXiA50NvVmKa_g-1
Received: by mail-wm1-f69.google.com with SMTP id
 s10-20020a7bc38a000000b003dfecb98d38so1048355wmj.0
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 10:47:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DHUvpsr4oPJ0GOY4xGj2d9Ecruh+V2SlNMkXku7h2oE=;
 b=zOkEq8lEktXVaDYVVdiF2TLUIZ4eTVsXjR4sVpjno3J63r/bF/5vzlFT39AVf5HQnr
 M0uWhYGdPvLtvnc1LrVSOQIsm0Fnu0wa9dSrks+6H2qwtboRn86je75ue1qmZVC3Qtrz
 AZUljk1bSKeu74XMAE3EJ1CSmgq3F2U4w0AuG9YJG/5EcA5SzfO55EzxLudVAad7PVhY
 mlcoZblFiQ0kHxilsZv3Orv8wuw5tvWVJC+r//0mIw4tDWtkl4U0gQwPrwYgWkYFUNEr
 y+Hb0XLGZEzgZfx30V8YbHWUjp+QWXVDYgdAnJtc360YdYV2m9WPh6oee8KkLX+XCXOf
 3lCw==
X-Gm-Message-State: AO0yUKWh3sbYdfzm/R29LDxadx6mQOLMWJblt3TWzzPBACeHHD4X63kL
 fgLCXgmak/GpDZ2NBK6TSmN0YiP5PFHjjOdfRFVLKR46yGkEyz5hlj/2MJJ4WIRBmddP1hChBpL
 sByMXtAvV9Tjey+A=
X-Received: by 2002:a5d:4dc5:0:b0:2c5:4ca0:1abb with SMTP id
 f5-20020a5d4dc5000000b002c54ca01abbmr2007603wru.60.1676659674596; 
 Fri, 17 Feb 2023 10:47:54 -0800 (PST)
X-Google-Smtp-Source: AK7set9bNA/kcizBQntsmtExEJMIsKhRuQdfhXiOkN+J3H6ue++Qa+aQIsF/gEd3BkpOOxKz4pAKSQ==
X-Received: by 2002:a5d:4dc5:0:b0:2c5:4ca0:1abb with SMTP id
 f5-20020a5d4dc5000000b002c54ca01abbmr2007576wru.60.1676659674295; 
 Fri, 17 Feb 2023 10:47:54 -0800 (PST)
Received: from [192.168.8.104] (tmo-110-21.customers.d1-online.com.
 [80.187.110.21]) by smtp.gmail.com with ESMTPSA id
 k8-20020a5d4288000000b002c559843748sm4850663wrq.10.2023.02.17.10.47.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 10:47:53 -0800 (PST)
Message-ID: <fe0de452-86df-ca43-8294-eac3938f72df@redhat.com>
Date: Fri, 17 Feb 2023 19:47:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Claudio Fontana <cfontana@suse.de>
References: <20230217132631.403112-1-thuth@redhat.com>
 <87sff470lj.fsf@pond.sub.org> <Y++ka8oPpHrNyonT@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH] docs/about/build-platforms: Refine the distro support
 policy
In-Reply-To: <Y++ka8oPpHrNyonT@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

On 17/02/2023 16.59, Daniel P. Berrangé wrote:
> On Fri, Feb 17, 2023 at 04:55:49PM +0100, Markus Armbruster wrote:
....
> The cost/benefit tradeoff of dropping the platforms entirely
> is not obviously favourable when we don't have clear demand
> to bump the min versions of native packages, and the cost to
> users stuck on these platforms to build their own toolchain
> or libraries is very high.

There's another urgent point which I completely forget to mention in my 
patch description (not sure how I managed that, since it's bugging me quite 
badly in the past weeks): We're struggling heavily with CI minutes. If we 
have to support multiple major releases for a long time in parallel, there 
will always be the desire to have all major releases also tested in the CI 
... and honestly, we're really struggling quite badly there right now - as 
you know, we've already run out of CI minutes in January in the main 
project, and also in my forked repo I'm struggling each month. Additionally, 
it's of course additional effort to keep everything in the "green" state the 
more you have to support.

We're currently "lucky" in a sense that we're only testing one version of 
CentOS, Debian and Ubuntu right now, but there have been voices in the past 
weeks asking for more already (like we also did in the past already). I'd 
really appreciate if we could have a clearer policy here to support less at 
the same time. It would help with the pressure on the CI and the effort and 
time it takes to maintain all that stuff.

  Thomas



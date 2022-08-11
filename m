Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1D358FD14
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 15:09:45 +0200 (CEST)
Received: from localhost ([::1]:51178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM7wV-0002vd-Vu
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 09:09:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oM7dK-0004oS-ET
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 08:49:54 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:41562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oM7dI-0006ey-8s
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 08:49:53 -0400
Received: by mail-ej1-x629.google.com with SMTP id gk3so33285371ejb.8
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 05:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=A07yJS5knIZsqQl19b8n3fBewyFGRsx5RsuaVhLPoLo=;
 b=YUBx0lYUDj0etKEoVt97sPntsfihRCs07LgEHcS4baIPdG6BJfgJhs2h9Pd0/tnoA+
 De1PVjWY92nPBMUsKU6PkDOBbtBe6vyI2JMGodbvF6MB6Gm9O/bjyrx4EbVK1D3eJIvp
 oPeGt4TrAaqoptbWdmFM62yNBSnZGPj954F4Rwwmd2/SnA124YQ1sbXlDOSxX71OT5HV
 JzGZnkq6sq1FbO2uOdc+B4cdbhWU0UYNaB2bbcJRgXo5wQQH4Fbs7jD0UORMmw8fx7dR
 LL/pzHwM1yj+ptTtS9WWpSfiHtVYnFwLp5cWcuNxSgEkXdg0OwFrKbe+zcAMX9m3vMZ8
 a1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=A07yJS5knIZsqQl19b8n3fBewyFGRsx5RsuaVhLPoLo=;
 b=mSGI+h4hazMjFVhKOQdo4GuQ3vxifuFSejIqJsu7dIgQuLo5lsu9IeTPpnvesnbnb0
 rQqX3reyxuokcEInEkfFzUk3+jaFKwBAA2bYuOBQrOEBNC4bv0M/GyG6l8glNSrjSgUf
 /5CKVgOqK9suwn8ybzPX21QdX0Sv27WixSoLJ6igauGtzwMvDQ3Lqlhod+7z4i7s8h7m
 d6CP6Qv69X/yi5XOam7FoL1DmxiA0IZxElVW26BP6q/BOsSfosQqLk+PNias5oEURu2h
 YIr53XEE2EaV8YSACgwY5oJEyOtg+3xHdujY1PE/5GMAxNHgJniDnSJymLVBwJ1nb9b+
 Ph+w==
X-Gm-Message-State: ACgBeo0vMRyTH235yGeckxfiXjGM+839EPOhVkmHyZEoe9MKdzr34cdT
 jgmBIz9cAp3tDjI+nGlacGo=
X-Google-Smtp-Source: AA6agR6NcetABSLC92M715mGsoNi3yGLYFsAF4pM3kVLFY67E3w3PvpzDhLM+ZfYJ1qeJ7jzl6uYyg==
X-Received: by 2002:a17:907:6095:b0:731:87a0:b9e8 with SMTP id
 ht21-20020a170907609500b0073187a0b9e8mr10440096ejc.124.1660222183495; 
 Thu, 11 Aug 2022 05:49:43 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 q9-20020a056402040900b0043ab81e4230sm9137115edv.50.2022.08.11.05.49.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 05:49:42 -0700 (PDT)
Message-ID: <6872ae96-df3d-fe4f-5815-37d044c8112e@redhat.com>
Date: Thu, 11 Aug 2022 14:49:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PULL 0/5] Misc QEMU 7.1 fixes for 2002-08-08
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220808125706.60511-1-pbonzini@redhat.com>
 <70743a29-474e-728f-4ee1-dd4c734f342f@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <70743a29-474e-728f-4ee1-dd4c734f342f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/8/22 16:23, Thomas Huth wrote:
> 
> I still had some questions wrt to Daniel's patch, especially there seems 
> to be a bug ("spcie" instead of "spice"), see:
> 
> https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg01153.html
> 
> I doubt that this test is working if spice is enabled...
> (which leads us to the next question: if the CI did not fail for you, 
> are we missing a build with spice enabled there?)

Fortunately the typo is not an issue; the top item of the visit does not 
have a key and therefore the name passed to the toplevel visit_type_* 
call is not used.

Paolo


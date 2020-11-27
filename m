Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4F72C5F58
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 05:55:44 +0100 (CET)
Received: from localhost ([::1]:58158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiVnK-0000eT-I0
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 23:55:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiVm3-0008Ps-2X
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 23:54:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiVm0-0005je-G4
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 23:54:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606452859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EegMfjvfPRjcfawqS2tz8g2pfdyCcUkD0dnKUymgO9A=;
 b=RNK1lUU6J7N4DVHYX2MPtfeNYi7xa9mp1q+qPa58LBH53BYvopIqmpoDyaKTR+gSe1N5BC
 cXp9Lx+J9fyLGf6iGKONQ0t8rOE+T88akhGjFYrhL10K2UrgLEcrA7/dUSeRb0vDYZvnwY
 uMQJ68Kx0k9mQm8ECOcwLDzMNW7ndok=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-ZLeJeqgoOMyy_UfcUjoC1Q-1; Thu, 26 Nov 2020 23:54:17 -0500
X-MC-Unique: ZLeJeqgoOMyy_UfcUjoC1Q-1
Received: by mail-ed1-f71.google.com with SMTP id i1so1953474edt.19
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 20:54:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EegMfjvfPRjcfawqS2tz8g2pfdyCcUkD0dnKUymgO9A=;
 b=jzV42mCx4dNVzhSV6aYBe6NvlSO1F1+uN9/puWBLLizKaRMM/PAgG8MSoEBBaIiu4v
 Hh13uq7d0saIv2YjWE17bKXPGI9qztyufPA3INckrPpVuwuL5YSmZvqHTXHAzk+344mo
 gq/7gZYekSRTjJ5y2PwFj9ustDG4iaC0zOOK7T3sSsUlV+JQdDmeJq1PH+/+yDmj5lSC
 IbCH75tF1li/YZltEioXu4H5oBXsIJ8gmJht2Dfe1AyDiDoT+AdHXTQnP2yfnTao0UIm
 tnqyFZ8YWFkb12IUYxTT+HN+pXXITLqoexI9iZkz8w97ZGYtvb4WCtWxQgPHffQqOcJh
 U7gg==
X-Gm-Message-State: AOAM530TwKECha58Ttdb34KKVDk0S79jcOGV/pEGMXq6XKwjYzL6mA2s
 Yc7i1ixbKFd+PDV9Q6HwDwgWN2z+rZ8wtzIZMVZPF3+WJsU0a1a2g4XySAeiDf21q3dMzAFIZf3
 KO7jkRghuyoettRY=
X-Received: by 2002:a17:906:d92c:: with SMTP id
 rn12mr5658399ejb.472.1606452855931; 
 Thu, 26 Nov 2020 20:54:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzt1welTwx9y5wMZPRiAHj5kehC32oNy3kvifWOmBBEtrOQSrNnIKNEtRZ4L1EtbgubDwy5Hw==
X-Received: by 2002:a17:906:d92c:: with SMTP id
 rn12mr5658382ejb.472.1606452855662; 
 Thu, 26 Nov 2020 20:54:15 -0800 (PST)
Received: from [192.168.10.118] ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id a12sm4333376edu.89.2020.11.26.20.54.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2020 20:54:14 -0800 (PST)
To: Alexander Graf <agraf@csgraf.de>, qemu-devel@nongnu.org
References: <20201126215017.41156-1-agraf@csgraf.de>
 <20201126215017.41156-2-agraf@csgraf.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/8] hvf: Add hypervisor entitlement to output binaries
Message-ID: <9ff569f7-b582-2d13-e17a-08d79e0d40a7@redhat.com>
Date: Fri, 27 Nov 2020 05:54:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201126215017.41156-2-agraf@csgraf.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/11/20 22:50, Alexander Graf wrote:
> +rm -f "$2"
> +cp -a "$SRC" "$DST"
> +codesign --entitlements "$ENTITLEMENT" --force -s - "$DST"

Slight improvement to avoid races between ^C and this script:

set -e
trap 'rm "$DST.tmp"' exit
cp -a "$SRC" "$DST.tmp"
codesign --entitlements "$ENTITLEMENT" --force -s - "$DST.tmp"
mv "$DST.tmp" "$DST"
trap '' exit

Paolo



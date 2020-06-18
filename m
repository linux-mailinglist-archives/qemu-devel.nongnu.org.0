Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C93811FF5C0
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jun 2020 16:54:08 +0200 (CEST)
Received: from localhost ([::1]:56436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlvvb-0000R7-TN
	for lists+qemu-devel@lfdr.de; Thu, 18 Jun 2020 10:54:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jlvur-0008Qh-Sb
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 10:53:21 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:55005
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jlvuq-0006NL-At
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 10:53:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592491999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fm/pSTH2hA6pgUwy+TMl04whdPlPFnDZucgZ0Gb/juo=;
 b=ALMi1EsBOhxrK9hbTxkPVBmwWbCBwjmvY4D9ermdABhze6bFXlTOoyzegp7kW2+RQwjERB
 HCj/Ubro8vmUnZFwKdL2cAnyjBOO9fmcNm20xYRKrdPrxF6rp8gOgrltvQdHeD319n9qO0
 qj3xrkZuqir2/R0n4RnXZPFSfCKP8XY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-bVxj0AbuNvO45wr-U7zwUA-1; Thu, 18 Jun 2020 10:53:16 -0400
X-MC-Unique: bVxj0AbuNvO45wr-U7zwUA-1
Received: by mail-wm1-f69.google.com with SMTP id q7so1889097wmj.9
 for <qemu-devel@nongnu.org>; Thu, 18 Jun 2020 07:53:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Fm/pSTH2hA6pgUwy+TMl04whdPlPFnDZucgZ0Gb/juo=;
 b=gdBO9uq93fLVkJpOYAXQoBaoSaT68yukJ1RHIFzn0FXKph8ZIhGMHBvOC9tSA3Ip1c
 m4YR7/5EGmGdJOV45dGdoL7QJmEr+1dZuCLohNhK3s4FuP1IrtLzfUilpNTsD/v0X4lU
 eMvcug5SOJ7PxhY3Udhu4dPTEWrr/YA43zQ4c/aG8B82c9HnQHVvdloR5/7dRMcfJZLC
 5oGu4vcr0RI0LamL4056CfMXHmfZme+1rsovRfp2VRyG1BqYNM2iKAS8HyQxKRCVtT+k
 HhimHzW1k39pKBVUhWt7dyi8cJM5kDAedWERqqjq6dW86hbTVtsiT5jzPQECBn3ncaW/
 5lBA==
X-Gm-Message-State: AOAM531oJQQiIX992JvS8u6oJdeGNZ2Vh8el1i+oXRkufSzESk5nHzVH
 rt7J0PpyJXntWPUlBgNnvZw53rOcTDMwr+TgkGNUROveEEU2PI5dFpRVixeKaQYi9tWFuPgbHbZ
 PJGzsOg91r8jKOSI=
X-Received: by 2002:adf:f552:: with SMTP id j18mr4780582wrp.279.1592491995021; 
 Thu, 18 Jun 2020 07:53:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydwyLkbTgO+8JeOIkmv0pz8T2aeHaHbNA76OBxDC0rKeJMseg5yFGv5JyIpIBhLTfD7DNemA==
X-Received: by 2002:adf:f552:: with SMTP id j18mr4780561wrp.279.1592491994815; 
 Thu, 18 Jun 2020 07:53:14 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:e1d2:138e:4eff:42cb?
 ([2001:b07:6468:f312:e1d2:138e:4eff:42cb])
 by smtp.gmail.com with ESMTPSA id x186sm3957386wmg.8.2020.06.18.07.53.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jun 2020 07:53:14 -0700 (PDT)
Subject: Re: [PATCH v1] memory: assert MemoryRegionOps callbacks are defined
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200618121218.215808-1-ppandit@redhat.com>
 <87r1ucv7pe.fsf@linaro.org> <51f137f0-89ee-e130-a43e-c82d0b3623fa@redhat.com>
 <CAFEAcA_O4SD69v9QvdA=_AVmQgQoNzHHrBYPN0b6BLDiMzFtdg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0d78e513-7b51-b95b-3cd4-757804dcbacb@redhat.com>
Date: Thu, 18 Jun 2020 16:53:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_O4SD69v9QvdA=_AVmQgQoNzHHrBYPN0b6BLDiMzFtdg@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/18 00:57:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Prasad J Pandit <pjp@fedoraproject.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Li Qiang <liq3ea@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 P J P <ppandit@redhat.com>, Lei Sun <slei.casper@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/06/20 16:29, Peter Maydell wrote:
>> - tz_ppc_dummy_ops which is broken and should just use NULL ops
> Why is it broken? The intention is to create a MemoryRegion
> which asserts if it's ever used (because it is a QEMU bug if
> board code ever actually maps that MemoryRegion into anything).
> NULL ops doesn't do that, it creates a MemoryRegion whose accesses
> all report an error to the guest.

I meant "broken by the assertions" but yeah the NULL ops suggestion is
wrong. I misread tz_ppc_dummy_accepts as "return false" (which is
exactly what you get from NULL ops) instead of "g_assert_not_reached()".

Paolo



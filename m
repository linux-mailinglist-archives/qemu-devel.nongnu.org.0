Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB75A4FD367
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 11:49:46 +0200 (CEST)
Received: from localhost ([::1]:58562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neD9d-0001GO-KF
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 05:49:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1neD7L-0000Tt-Ox
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 05:47:25 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:44891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1neD7J-0000K0-V3
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 05:47:23 -0400
Received: by mail-wr1-x429.google.com with SMTP id b19so26832736wrh.11
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 02:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jEYu5Dc4DrM1CeiFx20rntUZKHdIKyhqBQGEbRb+QEo=;
 b=MSfYzpmK8tn+uXXhR01V+fNirOZU31wliDT7ahVZuBpemgDi/9lLDSAJVDYSpZeTbK
 YQQZ3Vi4EWOxx+dFtFXwenHouaTwLx4s++6Ihuj5g+cZwyxYaYqJwNHwBcWqwNDIABXV
 sOF6eSR1FEjx2RARMY/b+sgg4jvWhwV/ntSyVIY5zJ2sMknGhHuIz38NMCHOzaW5vnug
 tbygB8NQlSK7osT568Zcj0/Y6GhTiRlqhnYZ+hfp3EWdCoS5NmUwBSzyEUxCiZImo9KD
 EVx0gknoyTlaDOb2phm0TpbMkQbbRVWfP0oorSNsd7q3GbydRyQvu3Mn6URcFylPvZH2
 Enaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jEYu5Dc4DrM1CeiFx20rntUZKHdIKyhqBQGEbRb+QEo=;
 b=ebfzpqm7Iin85H5l9WIYiGDyJFyaQIut3OfV3OHWdW/GS65uHfZ7L6kPYxKzyJ1d0s
 vNY30kb8gxk7OXJj4Iae1Guw1A0nFR2VM6YpEQphHUDlBkq2AAxrS0pDI/dCMoINI5Li
 JirV0DRmFOIdFs7zOwhSD66142ZHBMpDFU2nggjkN1bRcVDg2eP6h14JbNtQrrloaTOa
 h7FeX1F3zX2KQaPtT+NecSv8On16f93U+vHP1U3Tsa5wBkLDigenTmAocDYGmhf7x1w3
 mlfBC/8C3ugKXEJgid6hx9O2gerK03AXfDGP7U3tRl5Yrc0NSPtfn++id+wsC/JltO/I
 7sLg==
X-Gm-Message-State: AOAM531Nvw2gMWDsVgskf2TtPlwgz28ag/scQ75n0bR6XSAJNGWMQTuN
 aiYhFOddW9CPFQVNxQLRO34=
X-Google-Smtp-Source: ABdhPJxCyWsrTSnfaBIu38O7iMTAsodQWY+yafnQ23aeJwg2qr3DNeFG5SxlCZ0qf1FD8HUV3c+OzA==
X-Received: by 2002:a5d:598a:0:b0:204:6fb:6461 with SMTP id
 n10-20020a5d598a000000b0020406fb6461mr28331617wri.132.1649756839021; 
 Tue, 12 Apr 2022 02:47:19 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 o6-20020a05600002c600b00207a389117csm7316817wry.53.2022.04.12.02.47.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 02:47:18 -0700 (PDT)
Message-ID: <df758c80-ea85-d324-ad05-9bf07bb569e3@redhat.com>
Date: Tue, 12 Apr 2022 11:47:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 0/8] Introduce akcipher service for virtio-crypto
Content-Language: en-US
To: zhenwei pi <pizhenwei@bytedance.com>, mst@redhat.com,
 berrange@redhat.com, arei.gonglei@huawei.com, Simo Sorce <simo@redhat.com>
References: <20220411104327.197048-1-pizhenwei@bytedance.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220411104327.197048-1-pizhenwei@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x429.google.com
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
Cc: helei.sig11@bytedance.com, jasowang@redhat.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org,
 linux-crypto@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


> In our plan, the feature is designed for HTTPS offloading case and
> other applications which use kernel RSA/ecdsa by keyctl syscall.

Hi Zhenwei,

what is the % of time spent doing asymmetric key operations in your
benchmark?  I am not very familiar with crypto acceleration but my
understanding has always been that most time is spent doing either
hashing (for signing) or symmetric key operations (for encryption).

If I understand correctly, without support for acceleration these 
patches are more of a demonstration of virtio-crypto, or usable for 
testing purposes.

Would it be possible to extend virtio-crypto to use keys already in the
host keyctl, or in a PKCS#11 smartcard, so that virtio-crypto could also
provide the functionality of an HSM?  Or does the standard require that
the keys are provided by the guest?

Paolo


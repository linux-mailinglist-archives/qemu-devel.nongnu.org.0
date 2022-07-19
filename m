Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAFA57A68B
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 20:33:58 +0200 (CEST)
Received: from localhost ([::1]:34764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDs2f-0004R1-7b
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 14:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oDrkm-0000mC-13
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:15:28 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:33396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oDrkk-00034F-Gr
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:15:27 -0400
Received: by mail-ej1-x62a.google.com with SMTP id va17so28817630ejb.0
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 11:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=P1wvxLXd3ycK/OaY7dOKapScZKvtqSNqlQyzLhOQPt4=;
 b=W3W4K1ZcLOak8qQeSLjCKF6z+4MwecRrLXa+7No3BqCMvWUFPIbPluWHk//O2vlpCq
 u+qEnxHJ4y7cvwExMo7B7JOHddjxdA9IJMK8UBpV5BaGbkysOCPRMQ9pXtQD2q25/XmW
 wRQ6E6rJQN70aqTV47OBtYi5tjSL5e7CckioAR8uoXurwTTmBH5Bu6WecpWdaWSlIBL3
 tOrXijhJnAtzwbu2E4XG+ueQ+bPHidU0uAL29pu2WxKna0tUt+wdZHUS5CbARotHkEYH
 W0b6JWbnysSE8kbmHbrQCRu4CNU7FOYx44HTjjLVCR2fqyYEjtuoNL3KvmacEXR2sfIW
 gs8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=P1wvxLXd3ycK/OaY7dOKapScZKvtqSNqlQyzLhOQPt4=;
 b=OiJMS7hm8zZW9CjzeymRZAzB6khLsadt5s5FxlcqbbKlWLX9F2MVvO+r/+Of+4ZZF0
 kbiCdAAzyIXiYFQHlmzrz1WcA4m12knFkh2OfYGTYv9dzDsWnRGivut9Zg4HpofYw94b
 H3ezEgMPh+aH4f1GfzJuMq6Xy/Oco57pBMhdUkDl4EEBtlrNAFMOvdhSbow3uXvT9Gug
 OfUUBt1mWDZMIP2lgGgxe96m2D1r5+rXJnSy3DTXaLRfkrHBxtRMuM+EB+jCHEVGY7EV
 oZZninQpr3PWBpV2Uut0HN9txrGvSwBnqfzwsubM4N3Al8sT6NasGHdLs1r6mbxTT2Qz
 +BIQ==
X-Gm-Message-State: AJIora/i9BUxWxOhNZmiZGz9kaE9Yv5jSfM6pta/oIaVr17mHkD3LPiJ
 +fxxKjhYr/qugRAWBAzV5eM=
X-Google-Smtp-Source: AGRyM1sxmrTD7MjoKErIxEaXrYx+pWx2gYu/h2Sew5KlhA+GE80X9sV3X0XMrLghuWag5B2U9Uejrg==
X-Received: by 2002:a17:907:7631:b0:72b:3a31:6cb8 with SMTP id
 jy17-20020a170907763100b0072b3a316cb8mr30897305ejc.372.1658254524799; 
 Tue, 19 Jul 2022 11:15:24 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 25-20020a170906301900b0072b13a10477sm6819839ejz.108.2022.07.19.11.15.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 11:15:24 -0700 (PDT)
Message-ID: <b768df3d-4c36-549e-8e33-a3ec50ab95e2@redhat.com>
Date: Tue, 19 Jul 2022 20:15:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PULL 0/3] Misc patches for QEMU 7.1 freeze
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: qemu-devel@nongnu.org
References: <20220719093439.528810-1-pbonzini@redhat.com>
 <YtalBPp+QKS0wKWs@zx2c4.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YtalBPp+QKS0wKWs@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62a.google.com
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

On 7/19/22 14:35, Jason A. Donenfeld wrote:
>>   6 files changed, 19 insertions(+), 6 deletions(-)
> Considering the subject line, I'm quite distressed that the i386
> setup_data rng seed patch did not make it in. I just resent it to the
> mailing list [1] in case you missed it before. Do you think you could
> queue this up ASAP?

Sure, no problem.  Unfortunately I was on vacation around the time you 
sent it first.

Paolo


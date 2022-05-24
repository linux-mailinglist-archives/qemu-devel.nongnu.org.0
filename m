Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8DB532F41
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 18:54:52 +0200 (CEST)
Received: from localhost ([::1]:60630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntXo2-00057y-Cr
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 12:54:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ntXhS-0005qG-Uh
 for qemu-devel@nongnu.org; Tue, 24 May 2022 12:48:03 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:45049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ntXhR-00087D-9V
 for qemu-devel@nongnu.org; Tue, 24 May 2022 12:48:02 -0400
Received: by mail-ej1-x62a.google.com with SMTP id f21so22877863ejh.11
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 09:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CyTinPkx4gkUT3eatQUPDoqtPRcx94GxIQxtseR2SxA=;
 b=O5jv/NipWlyw/tg7opYUgKM3h2jBTBhAtfcujYS7dYgBBlZUKvGCA/jMIl5i2bwp0N
 8pQaCY27MCqmCBoValPjTQUEAp6t5Zcw1ScaWhvtTQ2/vk1D8Cdj+cz5ZUqUHRCEhNq8
 CaGGTu2SZIRm/vLN2OtBDPhrCZHZCaSHiYhV7S9FNGNcEKeFwBOFam1d97QQwgUPfKRg
 BSSqKtHqWllh91bRrA8tkn+wgj2QfMlg5+pWCwdLmgxK8CTsOVBiu0uCzAISjay5Mbxj
 K4FcpuG0/6H2HDDenvARc4QowCtWer50ZmH2o7PHMn1Q2DcdMJCFaFnU3RMUbsHhsEoh
 cGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CyTinPkx4gkUT3eatQUPDoqtPRcx94GxIQxtseR2SxA=;
 b=h8WMUEJAyKoVGVIlJOYjrtZNoziBHVRIEpgz2srWLkTU/6r8p9ioU2y511rxo5VLM7
 BSPASNo+e6AgutUI/dGH+dgzOFInBQM7q9Ygk007fXufNUFg5E4PaGjArbpLq9Vqcozs
 skHOpWnAvafcuBubeVrT2hr2wNTrMBuC4iJf7FwuxfKDMI1+3Ygzb+XeX1LZjTrHwbzw
 zyHEH2eksF5o8Dtgvv1lkviqg4S8KK2D5tLYCtnT1fxrcrRqhrjT7BLpl5oUYDcWPfni
 d/pVDWwrtd/oI2PHkoM3DkBrKgi89Fxs9m0gAofC6gJWapUUmY5PIoQxjSR+l1TKTZAP
 JYbw==
X-Gm-Message-State: AOAM531Ei7cRMaNQ3gu17LCdK449VmSWtNEya0oROBANTJWJpefJLy2X
 +F/Y3QUCXNBx7FNckvCGZIE=
X-Google-Smtp-Source: ABdhPJxLkc/N7x+k7jJcW7K5xzwyWDA+hkCkkK4529+nXpBlzCPyVpf6u1ilNzYpl5tHIFHFKjl2LA==
X-Received: by 2002:a17:907:7da3:b0:6f5:2d00:e069 with SMTP id
 oz35-20020a1709077da300b006f52d00e069mr24194920ejc.743.1653410879744; 
 Tue, 24 May 2022 09:47:59 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 v18-20020a056402349200b0042ac43be19dsm10224662edc.3.2022.05.24.09.47.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 09:47:59 -0700 (PDT)
Message-ID: <5459017a-8dae-7f73-fc1a-858dcddd49a6@redhat.com>
Date: Tue, 24 May 2022 18:47:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/8] qmp: Support for querying stats
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Mark Kanda <mark.kanda@oracle.com>
References: <20220523150509.349412-1-pbonzini@redhat.com>
 <20220523150722.349700-1-pbonzini@redhat.com> <878rqr1ac6.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <878rqr1ac6.fsf@pond.sub.org>
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

On 5/24/22 12:41, Markus Armbruster wrote:
>> +    return stats_results;
>> +}
> Have you considered making the callbacks return bool, following
> error.h's "Whenever practical, also return a value that indicates
> success / failure" recommendation?
> 

No, because I generally do not consider that recommendation to apply to 
callbacks.

Callbacks are written many times and typically invoked just once, so I 
prefer an O(1) loss in convenience to an O(n) chance of making a mistake 
in the return value.

Paolo


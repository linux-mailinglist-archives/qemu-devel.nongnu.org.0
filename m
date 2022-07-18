Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A623957872E
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 18:22:43 +0200 (CEST)
Received: from localhost ([::1]:54790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDTW6-0004WI-PU
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 12:22:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oDTU4-0000mb-2W; Mon, 18 Jul 2022 12:20:36 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:44594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oDTU2-0000WW-IC; Mon, 18 Jul 2022 12:20:35 -0400
Received: by mail-ej1-x634.google.com with SMTP id ss3so22154295ejc.11;
 Mon, 18 Jul 2022 09:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4aylmb9v4U4JMDZfBjN+lLzCPHxy6YG/nEDOs5OyKfY=;
 b=ldpLLPhZCIbiz7fkYl301ZRTeDnwdsn91w/k0fFs7X5c/pVgXihePmjLnAE2ulye4a
 b34p2lXzYDNfJeELqWqO1ksPSXnmG7ANGyCSEUWO9qVMEVY18F3QUvQT3TXWzPiHewVj
 umuI7kOCd8zPco0QpNUNKnXdDgtDcCcVFrtOcbo5JOW5vIRDXiOLgqVeIE4AQNYWVq0C
 zwWtfss+IAwOtNbpSblv/dNOo5uNpEWGz+C74ouqPKoDG0yE4akPcNbtNGzOVV/soAl4
 bNT2VosoXD/tppNaHM4g/fWQ/BuY1+T+DNJfKfGqVzEnfdHPwIh5ak3zjhix8Wrvojcd
 mpsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4aylmb9v4U4JMDZfBjN+lLzCPHxy6YG/nEDOs5OyKfY=;
 b=QWZ2k+Iob0sAQ5fICx+px/2hKG6igehOsWCzx2Vd9GwhbENwehej49XIWJOHvT0JD6
 ScrYJHEZnPITp8xnOeXXOuz84PwpLETOg/QyhLdOiNR/iRlC3ctkblsV1x3uTT9+prgT
 Vj2leZcgbimo4QRHkPjg+ZP+A8Flhdxl7FS0Gu7DKSw4GLaf76BaRWfe3tkT4F66fmMn
 hk6b53X99r3B1URuGMQAmM1qU4d3SABrQy0BCVK3bvbMhL3g63FUqH3poDR4Vpcnemag
 twMXhfFWsjKbFTILenRNImcvX9LThxhfHRtTZqXxUYGc0J4tfbh05I8GULWp8alD41Et
 oCig==
X-Gm-Message-State: AJIora9FjKWJq/buZhsqqVcI6oCghSC2eaibIIcbb98PwSHKyvGLejwR
 yGr4snTIHYzjntdamTWZdH23l+KFQTduSQ==
X-Google-Smtp-Source: AGRyM1umQaPPEsPON0T3hfAIcDgGzfKY+gQqr0K06eRfbCNb30t9axPQuX5hn9I+IyrkfPM0shzsQg==
X-Received: by 2002:a17:907:2cc8:b0:72b:7c72:e6a4 with SMTP id
 hg8-20020a1709072cc800b0072b7c72e6a4mr27012438ejc.160.1658161231534; 
 Mon, 18 Jul 2022 09:20:31 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 cd2-20020a170906b34200b0072a47b18f7csm5676118ejb.42.2022.07.18.09.20.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 09:20:31 -0700 (PDT)
Message-ID: <d65a18ba-0ec8-3b59-a203-a4c335bedbc3@redhat.com>
Date: Mon, 18 Jul 2022 18:20:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH 2/8] transactions: add tran_add_back
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-block@nongnu.org
References: <20220712211911.1302836-1-eesposit@redhat.com>
 <20220712211911.1302836-3-eesposit@redhat.com>
 <5f17518a-a2ae-8e6e-6864-84b13058d5d8@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <5f17518a-a2ae-8e6e-6864-84b13058d5d8@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
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

On 7/14/22 17:13, Hanna Reitz wrote:
>> that we want to run before the others but still only when invoking
>> finalize/commit/abort.
> 
> I don’t understand this yet (but perhaps it’ll become clearer with the 
> following patches); doesn’t the new function do the opposite? I.e., 
> basically add some clean-up that’s only used after everything else?

I agree about the commit message being incorrect, but is there any 
reason why transactions work LIFO by default?  Is there anything that 
requires that behavior?

Paolo


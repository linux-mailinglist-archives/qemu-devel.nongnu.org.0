Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F69652493
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 17:23:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7fLB-0000MJ-Ki; Tue, 20 Dec 2022 11:19:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p7fL9-0000MA-6l
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 11:19:39 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p7fL4-0003BX-0B
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 11:19:37 -0500
Received: by mail-wr1-x432.google.com with SMTP id y16so12257480wrm.2
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 08:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VLorJ7IwYVvBJc87OHuNcjlIgDxTxLnKK8QdOjIaM2M=;
 b=N0xZtoR4SpRjg/46NHkseL6tQx0DPwKrxvXexyVbgn2MhKYZOQ6x1DKnMjrM7E36T1
 f0udGpjiTnp1Mg1GMMawc//JO3FeUAU+rbATWGoO96U/0UD0BFz2nh0ETJm4Q9yEYPrd
 0SuR9Y1gYpooSiAQAsVM8p+30AANblmEsyM2Ad5ePYPyhrOIIx8qN/8u4xk5opfDLga3
 4A0eJbIOQH7ZHdn+ryMhdpgMfUPy5zZnwt6GtMeZUYGn/aczsBOZon8TOgvGQyfIyO14
 48WQnEAGGPXkSkJCbrih6Wjp+IkpUvueL+ss/VzF6iLQnqc4tNnzyhH9Rdxw7Mxxt8oS
 cW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VLorJ7IwYVvBJc87OHuNcjlIgDxTxLnKK8QdOjIaM2M=;
 b=xNWB6GtNEoWmyp5jSmpaxl19gV3Jv+qb6Kl5ZiHsMUXFsHC122cKWpEVHznN98xFyg
 8f65wTR0wA9rE2+T6QXp9Iv25LqYWa6aOpJ6PGKptmFN7465L6X6F1PD+9pcMpEE5ukW
 +w+NvwdDFwi2VJFazNYZaEiAsBGg1AxY50cIxXgBuz4Y4oHxGREY5ufMtKBn3IarPunz
 LQomcmFGZh0cYB0yLmThmA/btwr73sNqrbg6cu4lGeZIn09bbXXB1h6V0JeDhgPCUrCC
 Af4O1kjaK+nDbT6pc0MZyb3syjmfPo2c05IAQd4Pu2o78FkWc0NkkwOWc0LAed4A+Vlv
 Dinw==
X-Gm-Message-State: AFqh2kr9Imi3mKYt5a/t5IwHoMKHTmo4ojPV4bDXm8ZfPqVnJ3e7LHyU
 Wp+7Kc23IohXeuRMjwdFw5E=
X-Google-Smtp-Source: AMrXdXs8RHrZZ5uVwzweQ4gvMc2YlCaeAfBjoSgwqKmDAhWgS52OU1FniqY8Exn5TB+hNgjJ6vgkAg==
X-Received: by 2002:adf:cc83:0:b0:242:8d5:c6ee with SMTP id
 p3-20020adfcc83000000b0024208d5c6eemr1980360wrj.15.1671553134843; 
 Tue, 20 Dec 2022 08:18:54 -0800 (PST)
Received: from [192.168.6.89] (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id
 u1-20020a5d6ac1000000b00241cfe6e286sm13031930wrw.98.2022.12.20.08.18.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 08:18:54 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <33026063-bc1f-c0f5-eb94-30d11923816f@xen.org>
Date: Tue, 20 Dec 2022 16:18:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH v3 06/38] xen-platform: exclude vfio-pci from the PCI
 platform unplug
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
References: <20221216004117.862106-1-dwmw2@infradead.org>
 <20221216004117.862106-7-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20221216004117.862106-7-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.161, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 16/12/2022 00:40, David Woodhouse wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> Such that PCI passthrough devices work for Xen emulated guests.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/xen/xen_platform.c | 18 +++++++++++++++---
>   1 file changed, 15 insertions(+), 3 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>



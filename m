Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D8342E579
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 02:51:44 +0200 (CEST)
Received: from localhost ([::1]:45624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbBRo-00026Y-0U
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 20:51:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbBQ5-0001Gq-Nd
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 20:50:01 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:38818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbBPq-0007Ev-Ie
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 20:49:57 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so8167408pjc.3
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 17:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2dXvJUXIDzUKubJ7p2xvrWY5CRh06mo+LoGkICzg1Jw=;
 b=GKQAp9DC2X9+gxMQYgKHzSPomjCVgCFUrzJN00zd/n/+v+E24n605SOwhekQRQtZj7
 KgohZflkAG63aUt6aNVbHlekf7p7W4ROdFiYyl16sqSWBQgwhIVK6Ftrcl2eriwRzfOu
 tfo3oGQlbcNwBfpQOmOCueJzvY/eiSZPn2ouf4mWsXLkX/juxDKFhEKHfPPS4QiYlkpL
 0N7mE4H7tYTqF4mrHwChUPj7XfNtN45vOhwGSr7f7n4YwWcIsx7nVu7VM5Dozwc2q1ho
 1rp2u2tJ+jdNfJRRaF4oe6pDBokd/BjskVOoiqr1milucyTmNE9I539+oP3aKVHqhOY8
 7RDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2dXvJUXIDzUKubJ7p2xvrWY5CRh06mo+LoGkICzg1Jw=;
 b=xo1RQ4XMYvcZ3+dX6ucS33E7AOl3apzKemdjBAXT3uXMHmwHUOnJtVwjz4Uh4jYaS0
 VgkkkTuTc8m/uncJQs9V51arsr/ec6tI6/AetoLtqyYyk891kmonF/inSsbPWv7g8q9s
 5oibmt7X/l/6aze2CvYUk3AGFX9rDoY9IhELpdJdOlCY2AFMVJcrz6hECqS/A0DHsFnY
 bs4hZ9fnVPvA2h7makbuS1VBM2UVRW3JPsWPZ9XrF1qDtC/BsKtb/O/BMuj9yQUA5NvY
 j36oIc22SXolVlwTTGlrPo5CHjxe6JRjzqG6xI3OKJt2yXcFE1IAKgT+qi11Iedr/kAc
 SzcA==
X-Gm-Message-State: AOAM533ypuXeRXboFLFCgVhapHSRX6amyFIRVVH8HloY1Zbc9tIpqfTv
 iGnP7ZE91Tlal7CxKGvvUEczZg==
X-Google-Smtp-Source: ABdhPJz61S845FhLnmC55hYZq8nURmGeOjwRPswhy2b8g4r7JuIVjDSnV0EDAUfm+HnsjhE246TE7g==
X-Received: by 2002:a17:902:9b8d:b0:13e:b693:c23d with SMTP id
 y13-20020a1709029b8d00b0013eb693c23dmr8158856plp.11.1634258980806; 
 Thu, 14 Oct 2021 17:49:40 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id x35sm4199364pfh.52.2021.10.14.17.49.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 17:49:40 -0700 (PDT)
Subject: Re: [PATCH v3 0/3] hw/arm/virt_acpi_build: Upgrate the IORT table up
 to revision E.b
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 imammedo@redhat.com, mst@redhat.com, philmd@redhat.com,
 peter.maydell@linaro.org, shannon.zhaosl@gmail.com,
 shameerali.kolothum.thodi@huawei.com, ardb@kernel.org,
 jean-philippe@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 drjones@redhat.com
References: <20211014115643.756977-1-eric.auger@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <81aa40b1-621e-6800-993a-4189345039b1@linaro.org>
Date: Thu, 14 Oct 2021 17:49:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211014115643.756977-1-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: gshan@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/14/21 4:56 AM, Eric Auger wrote:
> This series upgrades the ACPI IORT table up to the E.b
> specification revision. One of the goal of this upgrade
> is to allow the addition of RMR nodes along with the SMMUv3.
> 
> The latest IORT specification (ARM DEN 0049E.b) can be found at
> IO Remapping Table - Platform Design Document
> https://developer.arm.com/documentation/den0049/latest/
> 
> This series can be found at
> https://github.com/eauger/qemu.git
> branch: iort_Eb_v3

Queued for target-arm.


r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A189B513E62
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 00:11:35 +0200 (CEST)
Received: from localhost ([::1]:53280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkCMI-00023U-74
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 18:11:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkCKz-0001CS-42
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 18:10:13 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:47032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkCKx-000606-DG
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 18:10:12 -0400
Received: by mail-ed1-x52b.google.com with SMTP id g23so7021432edy.13
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 15:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BXA4P6hA9sHF6plX6na3Z0AM70PkGS82zLxW1EpjJlw=;
 b=AEthiBdOJAwRv4STdsFPS4A0z0n7RPXa7r4Vwvw6o5XZFcWVXfQUJT24thgr9yY9qV
 R8G+oEN9q9PzFXf7QaYORaX+eV2MpMJ5r00XwuIAKfUuvtZjjj2714G3EbwmUVOYKpEa
 IdbVx4UQnM4ad0E0BNPU2JP7ETW8uw5jDL27tOiue1nei0PJNrbJBWKfUqbV3PuhefjJ
 hAghswe3/S+cTJWNthe3pjB15HK0+suwlBhM7bw3VJ0vocTVW42nBTgYKymePkQKeq4o
 H/yRRlYL/XZIDa64pCPNJi35XWV6DxkozkAT6DqMhntde0sf47fAbdFusggE6b15yMxs
 Ie4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BXA4P6hA9sHF6plX6na3Z0AM70PkGS82zLxW1EpjJlw=;
 b=3vSR8ilz5v267Ja4h2kQnZuv1DgH6BohKUKkuEWY4pQPGuMEQ+M/Y6Mn8V1fj/7onZ
 iS4E3aJ73sU+4KUBV3RoyuTiubAmfR7zJgsm+pclb1P64f9h2oAAYgNXdoA4+rtkkexT
 ncy1Tjnp9/VT+6amSNen3heSWdk9ZCDVPOPmKyXSh9PgpWOizYqPHAw8sR0JHD2PwLSM
 cA/G8m4kNH0RsNxBEfK0Sli6eu6ialZ8GVuvo5MY1Qrcgbny1UTITg5ePcIKwq43SppT
 Z0WpEDevAxT7VY4YQv4DXEPwjMWkc75Cr9y43I9UJrCxtFtV9+0tDvVqcaaE+qMLv3Bp
 Kj8w==
X-Gm-Message-State: AOAM53278oKb8pIOlyRdJzOGW6Gb9/S+6Xa7Q3ISBtPPAOPwFfC/Nbqx
 AFTEvHDih0vJwfSQVlxMG+s=
X-Google-Smtp-Source: ABdhPJy68Ndf3T7CoI7pBZCduQKgaePZZJLFCDuenkhhBJukTnaxrfU5prSA+nXNgEp/Gm0RndQcXw==
X-Received: by 2002:aa7:c351:0:b0:425:c086:a4bf with SMTP id
 j17-20020aa7c351000000b00425c086a4bfmr35580867edr.312.1651183809874; 
 Thu, 28 Apr 2022 15:10:09 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 cz9-20020a0564021ca900b0042617ba63b3sm2129861edb.61.2022.04.28.15.10.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 15:10:09 -0700 (PDT)
Message-ID: <79a868a8-0e6a-91cf-c231-e6788bb615a0@redhat.com>
Date: Fri, 29 Apr 2022 00:10:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: a qemu process has 54 threads, how to know who they are and what
 they are doing
Content-Language: en-US
To: yue <kvmluck@163.com>, qemu-devel <qemu-devel@nongnu.org>
References: <c34d759.1161.18049c8b2d4.Coremail.kvmluck@163.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <c34d759.1161.18049c8b2d4.Coremail.kvmluck@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
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

On 4/21/22 03:42, yue wrote:
> Hi, i think it is curios for a process to have so many threads.
> 
> my environment: 5.4.160-1.el7.x86_64, qemu-6.1.0

Use "-name debug-threads=yes".  Most of them are going to be I/O workers.

Paolo


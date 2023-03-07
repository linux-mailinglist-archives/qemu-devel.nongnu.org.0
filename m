Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7BC6AE6A9
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 17:32:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZaEZ-0003Ck-Ll; Tue, 07 Mar 2023 11:32:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZaES-0003BS-Rd
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:32:08 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZaER-0001Q2-9i
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:32:08 -0500
Received: by mail-wm1-x330.google.com with SMTP id j3so8196800wms.2
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 08:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678206726;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wo2nyWezgMrUSlQ0ywENZ53M6vCjCPPkUb3T+chO/ow=;
 b=AshgV2GkS3+RJ66KSYKxKsVqzQEIJwVxbG6KKWmadPR8f/xY9MC0l6y1LEJJgG6c2O
 Mm+2WyRKFOB4C70Orht0cDGvuWfgQK4+AJTZamTFkI9TmkfLe9bASReZfLK5rrwAb8iY
 zq4M01CvOlBH9yj/KIX9UZ3JPJDNWpY5WFJUJypWob4T4I38Uk1xlUdXUQ95sYCUBOeX
 DDmQHExGpDdQ37phxvZ5CCxc7Mo7zFOoNbZSziyX8ngYtOcMmdFIAPJymAiOJL7E/M06
 vARZntRkURBnlIc+ZNfMLgZAxHuXz8AB4a30DcX0SzzNph1MBsgV7B1E6tFKCGI+Jefc
 gG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678206726;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wo2nyWezgMrUSlQ0ywENZ53M6vCjCPPkUb3T+chO/ow=;
 b=Nnk5B0spvytHBSMn1VV2OUyqgoTzGXZJusE80AfZ4R8BXloWNSADuBtG1xXupMWhu8
 Fu6quLBFah/+qc3arUx0gZxytfsKzEvSYBSTqFQwgDvsm1uj+/63cKlv3R69cu+4tZa8
 xF9qlPHD79NvlX8I3p5+aXPFLWb8oWqjnFXZxFOa5eFkY4GZmrAGHx3g7DGRSO0q7nVH
 3uMvomqcFyYCN37P2qPYA7KOvIgK8xifQ56tQ6mFE5ZLiev1+EiHMsCnql6cK95ZsRY/
 ucdXg9W7Hm8ih/A84A8sG8DtwZi3ztDzJ92E6iGHd+fxomAl9+VyAEYPFcnQNl/mDtdz
 v7yA==
X-Gm-Message-State: AO0yUKVCUsQ9nBoteYkP4TLCn+s02vDw5amIO+JohAewAUbRfBSlLbOQ
 B+ADVXuRnu80bxx6NAKuHpn9289NTBoP0Q==
X-Google-Smtp-Source: AK7set/xpPfPLlbGNMfKXMxS/ilt+eY5w31j/giuEfniudx9Hi9/ZBYwx7Pn8FmkseeM0nBv1XRf6g==
X-Received: by 2002:a05:600c:35c6:b0:3eb:42ab:7b5 with SMTP id
 r6-20020a05600c35c600b003eb42ab07b5mr13836003wmq.1.1678206726019; 
 Tue, 07 Mar 2023 08:32:06 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id
 l36-20020a05600c08a400b003eb39e60ec9sm12904679wmp.36.2023.03.07.08.32.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 08:32:05 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <a40bc7ac-59f8-0b16-fdcb-c7d17234fa55@xen.org>
Date: Tue, 7 Mar 2023 16:32:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v1 26/25] MAINTAINERS: Add entry for Xen on KVM
 emulation
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <945564aa2d51aa6cd6f9b179981ca3ded5c94190.camel@infradead.org>
Organization: Xen Project
In-Reply-To: <945564aa2d51aa6cd6f9b179981ca3ded5c94190.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 07/03/2023 16:21, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   MAINTAINERS | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 

Reviewed-by: Paul Durrant <paul@xen.org>



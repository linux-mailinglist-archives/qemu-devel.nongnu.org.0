Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA446AE553
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 16:49:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZZYm-00012r-0V; Tue, 07 Mar 2023 10:49:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZZYi-0000wG-1x
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 10:49:00 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZZYg-0007Wn-8x
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 10:48:59 -0500
Received: by mail-wr1-x433.google.com with SMTP id t15so12582399wrz.7
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 07:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678204136;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=d4VVf6Ok91yoK/WSdCMtKSGd9K2hkIRITKppkJrbLbk=;
 b=KK8MTs5ZJ+ZGZsWyZ/FIL+lUClKCa0Q+Z4ogG+cNO02dCzn+vdapYF0FjTEJhOZ4l6
 i6yx740eVQkzPOleIGEfDPui4Ea0adeL/Du854HyDJH10+bneztjU7QT9M2V8NpEawK8
 FxLhH+1fiJ1YetEABOE1gC7l2jmUONt0gvRcxGlDaK8iOHJ9ZXtYxkg3kbfW+teyz9+t
 wPWMCZ4Fm8lVwzZBJYxYUD9iw3EmlSgUbU0A5ZgD1AvVyuZ2W5bKtaCWUmihO7tiIEtd
 uTqjCs1z3W0dua9HC/CGcLq1clRhBFCyXwkl8HGhwqahIX7GkIn80bNtcUtyvzFlsBri
 Rr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678204136;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d4VVf6Ok91yoK/WSdCMtKSGd9K2hkIRITKppkJrbLbk=;
 b=3negkzoj2IdZyI04MccpkouhsLchdOrGZKZ3Zn9YxgzPrlGV+T5ITwtYy+E9TdpKyv
 Cao+LK26JfHzCChuGBTVxPsw1tjGKBdQOTCfB4p5+VFVnUmFGdHp/KjSpo3SWTO7HPgo
 BvQ+O5F0ueeAn9uGap6SEdFBRnBjiYaHA8VaY/0QJiZMDLGJfaYsAviHj8OWlqq4goTV
 mtfNWwxs3yCXDCAeDgmvcTegPCWI13tBjQdVe14yUsZR7oF66bZl/PAjy3blCF+QqDAC
 sB7UZVu052KvmhDQxzaoirKAdjjWwNOyKw60ZhfBUXt6BSWo1eVKH5xTQyFuZ+vBDuHZ
 XM3A==
X-Gm-Message-State: AO0yUKUzUIyjnHtcJBYn4Sv5GfBtfaTrjuPR3VbN64MkYJYkVopG3JrZ
 m+zgljOf8N8B3AGh/h8jtI8=
X-Google-Smtp-Source: AK7set9MOYFY9eeCxPLSD/f3wYHB0MRb/Jt+n2KwWMszzZsOIF3uM6kkD/gdT3uc27zfP/zs8NTZdA==
X-Received: by 2002:adf:eecf:0:b0:2c9:8cd:55a with SMTP id
 a15-20020adfeecf000000b002c908cd055amr8384078wrp.15.1678204135733; 
 Tue, 07 Mar 2023 07:48:55 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a5d5048000000b002c592535839sm12810167wrt.17.2023.03.07.07.48.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 07:48:55 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <c8638efb-1c83-4394-11d5-2614f531834c@xen.org>
Date: Tue, 7 Mar 2023 15:48:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v1 19/25] hw/xen: Only advertise ring-page-order for
 xen-block if gnttab supports it
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-20-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-20-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x433.google.com
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

On 02/03/2023 15:34, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Whem emulating Xen, multi-page grants are distinctly non-trivial and we
> have elected not to support them for the time being. Don't advertise
> them to the guest.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/block/xen-block.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>



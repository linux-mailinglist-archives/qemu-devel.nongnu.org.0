Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A085A66CE1B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 18:57:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHTiz-0001FS-Vy; Mon, 16 Jan 2023 12:56:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHTiy-0001FE-Fv
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 12:56:48 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHTiw-0000Tv-Tt
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 12:56:48 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 m5-20020a05600c4f4500b003db03b2559eso706755wmq.5
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 09:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=O3J7BIluLhh+l1JKltJUXcBuQRrWos44Moduc/L9PPE=;
 b=alyQ+4+X3pyyAXlgGalCc/a99VQGx9B3Id784Hj6muNJhRzax7vTdolhYSVLQnNeA2
 hMn3E5BfWQ0Jy+aUrs3ZDbSrtSp/Uz+OF6KOuxNGvhzSVyYNofNe2NsmYH9UU+Yxuvut
 CJbAGoqc6ReR5XczKkLfUleZy3EeYpMaYM6AZ1MelI0M22qixNV4zNZceUZlmN1YQOEz
 YbvyEdOrPftaCqoympm7Fex5l2lumBdeZvG2lEc230PO1cYI5f9dxFMFRcLiMDHfwzVp
 MuvsDysc+RS+V5TCRJ9PqpILuXcqNtOBzlgvB7JCHTrx0v3eIg4TfPXmV5EnbtL9hZI7
 nW5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O3J7BIluLhh+l1JKltJUXcBuQRrWos44Moduc/L9PPE=;
 b=gntRoaxiDEr+wIPk3dibmqZG29mTBjYsxesGYFGAImR0i+bjcWRBLTzMDXK4vKJMtB
 u+uv3jBvwM5k/qjvr/6OkGYJMHaIdke18leYoyP6vS2QhWRlSRSSTWgUwzKvZHwDwuPu
 0efu0kMDhMsjgSjmS+cpCXZ322qQQUoLzJhnHT9Ebb9UawamtD87cg+OXhxC1p/OEG3W
 U0cjljKsKC84ZSAa4kSzwd9Nv+r8uHLRZDpVnSZLraNskvCdEqUApHvEGIGZI/e9jWY0
 AjXJx/0NEQA+Yl9ydTmhJogpcgLYOTH2H39ho5kMzNprG2kLgdQY9fZE0oWhopKSgZ7t
 DYxA==
X-Gm-Message-State: AFqh2kpK707Nx6/eEoa09u5v8JXTpSZGzurbVNytdCUpJvi2OzZUk82O
 LSEkkO8qcvL62AWOS2xXfyQ=
X-Google-Smtp-Source: AMrXdXuSMYj9bmtduhzQIoeKc8tf3VZT9fsfABVN1oG0IUtIVeiLdYfziZpfQOf2fhTbK2IkxoYV+g==
X-Received: by 2002:a05:600c:314b:b0:3d2:3ca2:2d4f with SMTP id
 h11-20020a05600c314b00b003d23ca22d4fmr287678wmo.36.1673891805417; 
 Mon, 16 Jan 2023 09:56:45 -0800 (PST)
Received: from [192.168.6.176] (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a05600c2d0800b003dafcd9b750sm3001924wmf.43.2023.01.16.09.56.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 09:56:45 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <de1ee60c-8f00-f113-a8f6-68250ad84687@xen.org>
Date: Mon, 16 Jan 2023 17:56:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6 22/51] i386/xen: handle
 VCPUOP_register_runstate_memory_area
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>
References: <20230110122042.1562155-1-dwmw2@infradead.org>
 <20230110122042.1562155-23-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230110122042.1562155-23-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 10/01/2023 12:20, David Woodhouse wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> Allow guest to setup the vcpu runstates which is used as
> steal clock.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   target/i386/cpu.h         |  1 +
>   target/i386/kvm/xen-emu.c | 57 +++++++++++++++++++++++++++++++++++++++
>   target/i386/machine.c     |  1 +
>   3 files changed, 59 insertions(+)
> 

Reviewed-by: Paul Durrant <paul@xen.org>



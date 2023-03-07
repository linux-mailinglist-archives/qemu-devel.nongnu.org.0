Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B4A6AE33B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 15:49:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZYcL-0008Hs-Au; Tue, 07 Mar 2023 09:48:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZYcJ-0008HK-IZ
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:48:39 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZYcG-0002eU-Rt
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:48:39 -0500
Received: by mail-wr1-x433.google.com with SMTP id q16so12394860wrw.2
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 06:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678200515;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qJV8X1ahMrwunc4I9nebCaoiX6hr9jR3+0dd1Yu8Uhk=;
 b=CrhWd3j/9hc/yzuu/AXDjfdbsI6i9Gul7zANq1FlfIjwYGAFkAVP9Fg3BP5uwQslNp
 hppBNBYJ402bnr6+mDBcrGND/dAXnEvibsFKH806PuoKguTQx2DilO6gy8jNgVGsQ4UR
 8tDS5uJxlUejZOcefYZhiN+chK2KjW9QppOpaHZXQ8Cbi5TBWeb5i0GjoPCvYxhWCPc1
 IZCjO6v7FRg07CcFR0J+Fuf7IKncGDNRKwzOb+9PGDNJRPa1Hk9zz5f0gChXcdFzIl1L
 IAvPZpj9WWtXRzjlCcHPqNlXIGB/EarWHgBhXmbBxDR9YioSmSVr4Rsmx4WmemO4d1Bv
 xzMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678200515;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qJV8X1ahMrwunc4I9nebCaoiX6hr9jR3+0dd1Yu8Uhk=;
 b=m/r74YCzNgJuOaAd1iU6RFSuFbZ1NyZKxhMgxCtOZXAlLZVIpQgaDQ9r6lDt6cSSAd
 bJYBCl7Si4+xO8KvZ//kaRrWyGMqVdVQLlSGEdCDwD8Hfp2uZY0PK3nuLsQ0DcROOQux
 975U7A4rvbJT3sA7DEmAI2pbn5+agCh6ID2cphsgN6TzQmVv3SJC+ufQLh/hRu4yV6sz
 fO1vtzg6o1gfZBPVl6pAmNB4pt9i/jQv1EYTlsNtA42nrsfHZqMuTIKvI29PbVlxtYHJ
 E0Fz4qHUyhFj6/SRdPEVlHvnE0evVsdEtziywlKEmrpjIvcN/+0pX9klcevh2GQrPtcJ
 QgIA==
X-Gm-Message-State: AO0yUKXlQz7yMAQHyenytVSawycFMnaHCav5HqQtCdscnTbB43fBtTYp
 SKrow/tiKV4wLEr3/KBOm7s=
X-Google-Smtp-Source: AK7set+QLpMeKjKDmL7zyyrzOxGL27KoFw6yVMrfR59U9/0wom9sKE5L/9llGVFsGi4zqDHS0OChcw==
X-Received: by 2002:adf:dc90:0:b0:2c5:4c1f:3c9 with SMTP id
 r16-20020adfdc90000000b002c54c1f03c9mr8856131wrj.49.1678200515429; 
 Tue, 07 Mar 2023 06:48:35 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 o16-20020a056000011000b002c703d59fa7sm12750392wrx.12.2023.03.07.06.48.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 06:48:35 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <9aba8f4d-0572-b6b4-44c8-a4f5f88e1477@xen.org>
Date: Tue, 7 Mar 2023 14:48:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v1 15/25] hw/xen: Use XEN_PAGE_SIZE in PV backend
 drivers
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-16-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-16-dwmw2@infradead.org>
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
> XC_PAGE_SIZE comes from the actual Xen libraries, while XEN_PAGE_SIZE is
> provided by QEMU itself in xen_backend_ops.h. For backends which may be
> built for emulation mode, use the latter.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/block/dataplane/xen-block.c |  8 ++++----
>   hw/display/xenfb.c             | 12 ++++++------
>   hw/net/xen_nic.c               | 12 ++++++------
>   hw/usb/xen-usb.c               |  8 ++++----
>   4 files changed, 20 insertions(+), 20 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>



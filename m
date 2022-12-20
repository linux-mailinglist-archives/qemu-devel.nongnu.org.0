Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A906D6522B4
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 15:34:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7dgW-00024M-4S; Tue, 20 Dec 2022 09:33:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p7dgU-00023n-Ek
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:33:34 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p7dgN-0000Of-P0
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:33:34 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 r204-20020a1c44d5000000b003d6b8e8e07fso9133wma.0
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 06:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=jucxqIbT9tKMyuQodlww6Swg7KnFVxmL66/+cdzBWPA=;
 b=Nu9Z1gtp5ViiVM1sjMd6nywf84s5eWfQhISNUWhixqL8VTskJqrQbOUaahXD7ILMmX
 fiNV7Ij1IaA0I48lgrRPTm+1W2IYgr1YZyaNMtov0zbDsQ3ljqL38Nvt7BI/CJJMP0i8
 BQR+EJ8MjEJv/jRH3/wGnUcBTp7OyST314vCR4yueiDxYjm/6fn+HhZG9rQAC7Cfo0tD
 KPEX6oLXODpiBLiEQWOQhO8Fc/MqWc7a+NiBvOhHGyhCJBIW4/vvQTQSbxYAIszd8cBq
 b/kSwYpHlA35PxJPqkNM5i1FOrW2v29HwV1atPJOoZBVKPE+Pvb69bZUKowDmjFPJkUN
 eUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jucxqIbT9tKMyuQodlww6Swg7KnFVxmL66/+cdzBWPA=;
 b=tVxsLVwrRHe7sOmwGgI55IK3N6ZJ2D2k15wwhLsN/iAviyJ8TWpFpOPjpUBUS/DmYX
 HY9BCtOnjvjKKagEATcsStCMaDUM+IFUU8SUuKalGFKfBZO3h4hogUrf95CTI8z6Shh0
 Zvw7uqX12/g/UJ+I7SvwJq9rJGs8bMQUTbCC1pdAJytakPokmABRh9QFginxBwEbzFlw
 +UdEH+o6ZJxKKVXeDWF/pP+hSTL5YnOWuw/0xM8lD+BNg5fWERcN/ILUhd3DAwvya/zq
 BxpDFytt4tISk52z4oGvnH9cqnEsOOBCp1JdW4zlehv63meX+wkfjCF4ZR9/I8srVbjO
 pnIQ==
X-Gm-Message-State: ANoB5plguIDbCZv4eAdRJSOYL+Vw5eDkPfyaSlLDJArP7OjgHQlCII42
 Pth1r+kAvvcJ3bYDK9GjElQ=
X-Google-Smtp-Source: AA0mqf7jxZFp8qjKNbn4KP+TWcssP4/bw0p8l5o4hu5FzyPZjzrS4HJMbPKzdeNU0osfUSNFfateWA==
X-Received: by 2002:a05:600c:795:b0:3d1:cee0:46d0 with SMTP id
 z21-20020a05600c079500b003d1cee046d0mr35391658wmo.25.1671546806283; 
 Tue, 20 Dec 2022 06:33:26 -0800 (PST)
Received: from [192.168.6.89] (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a05600c1c0600b003b4ff30e566sm3441080wms.3.2022.12.20.06.33.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 06:33:26 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <44d39825-d4df-e83f-159b-2d0395ad4f05@xen.org>
Date: Tue, 20 Dec 2022 14:33:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH v3 02/38] xen: add CONFIG_XENFV_MACHINE and
 CONFIG_XEN_EMU options for Xen emulation
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
 <20221216004117.862106-3-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20221216004117.862106-3-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 16/12/2022 00:40, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The XEN_EMU option will cover core Xen support in target/, which exists
> only for x86 with KVM today but could theoretically also be implemented
> on Arm/Aarch64 and with TCG or other accelerators. It will also cover
> the support for architecture-independent grant table and event channel
> support which will be added in hw/i386/kvm/ (on the basis that the
> non-KVM support is very theoretical and making it not use KVM directly
> seems like gratuitous overengineering at this point).
> 
> The XENFV_MACHINE option is for the xenfv platform support, which will
> now be used both by XEN_EMU and by real Xen.
> 
> The XEN option remains dependent on the Xen runtime libraries, and covers
> support for real Xen. Some code which currently resides under CONFIG_XEN
> will be moving to CONFIG_XENFV_MACHINE over time.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/Kconfig      | 1 +
>   hw/i386/Kconfig | 5 +++++
>   hw/xen/Kconfig  | 3 +++
>   meson.build     | 1 +
>   4 files changed, 10 insertions(+)
>   create mode 100644 hw/xen/Kconfig
> 

Reviewed-by: Paul Durrant <paul@xen.org>



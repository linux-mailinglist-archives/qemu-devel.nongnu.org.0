Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B06526E61
	for <lists+qemu-devel@lfdr.de>; Sat, 14 May 2022 09:08:46 +0200 (CEST)
Received: from localhost ([::1]:55004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npltN-0000ZL-MN
	for lists+qemu-devel@lfdr.de; Sat, 14 May 2022 03:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nplkv-00068W-HW
 for qemu-devel@nongnu.org; Sat, 14 May 2022 03:00:05 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:43715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nplkt-0000ML-OB
 for qemu-devel@nongnu.org; Sat, 14 May 2022 03:00:01 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 l38-20020a05600c1d2600b00395b809dfbaso5506182wms.2
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 23:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SrFdkfeomMv6zHaXWDpfb3VJqFRtE5eD3xklr16LlI0=;
 b=QmzgbufOF9zHr7ufBd9Mgns47uPYzpHvWmS4ULTZyfC3RYMQixHpNyYc3uEwIiY7M3
 NI8O1pdG1IJOe/eoLIs/yww3rw8s7IZim2bL8PyfSxW2mzUwf0mUTgt6eygqkfr3KpJO
 jDoF8Z6McMIiEq/L59rF8BSjOAD9wfd+mkzcECy41QRDjTP/+Vwmo7d1P3qlTfscOVUT
 g8N6ACtCGRzdJ9qWPzEyZaAQW8l7d1G3rht6XemANyCScelnI+MQGk3HpXYt2jzqaM7+
 PdT6s4DRME/aENz6fvZU2Z4NTm9CQoZmGRXlt/MGAsxu6o6oLMjH6Iqq0fTPjvnGzpbN
 Y1DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SrFdkfeomMv6zHaXWDpfb3VJqFRtE5eD3xklr16LlI0=;
 b=bgpIoJE29S3NQ1p0982TlYWpO193NdFo7HQslPD63d6tZQIpX8wT/wHxLsDnfa55iv
 W8WpBB/QswZSUoTanO0sCx1uvJWUjdfCxkqEQ6NBfwoaCa9mreckbrEY+7XZUW8yihAQ
 /xApJCrlVOMb5QkbciFctDaDRiN8+z+SGQsmClxXh7mHy6tgoneF5q2D6K19kxYQ6WSY
 AWAIrn2/Wigd3B6LIt4vLzeuNJE1wMK/4eJLts0xx2m3jwr2OdPjMsbwR6v9RkJ8yIr8
 sOyQZ0z+ANO39Rl2O46YAX8JxDM54+B59Zp42sYTqLERakHEUt3lB+hsr7iJlZ8a9Ccg
 ci3A==
X-Gm-Message-State: AOAM533NDW/RBjO33YU4AhlkcqFPeOiCaiOKGbko+yMdYlCfNgmFeIaX
 7BZQk/ZaFoaMvQcqp13uUi4=
X-Google-Smtp-Source: ABdhPJxM/we+lfmxKYZAjOI0/MSMbpxMxaIEsnBVIku7+yLZn1j7lDeTTL5z+zYxL62d+cDZGdgVtw==
X-Received: by 2002:a05:600c:1f0e:b0:396:8a52:bbc4 with SMTP id
 bd14-20020a05600c1f0e00b003968a52bbc4mr5339906wmb.119.1652511597243; 
 Fri, 13 May 2022 23:59:57 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 h7-20020a05600c350700b0039456c00ba7sm8807522wmq.1.2022.05.13.23.59.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 23:59:56 -0700 (PDT)
Message-ID: <e1229b1f-d94e-6529-311e-30999741fadc@redhat.com>
Date: Sat, 14 May 2022 08:59:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] whpx: Added support for saving/restoring VM state
Content-Language: en-US
To: Ivan Shcherbakov <ivan@sysprogs.com>, qemu-devel@nongnu.org
References: <004101d86732$0d33bd70$279b3850$@sysprogs.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <004101d86732$0d33bd70$279b3850$@sysprogs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32b.google.com
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

On 5/14/22 03:29, Ivan Shcherbakov wrote:
> +/*
> + * As of Windows 10 21H1, the layout of the XSAVE data returned by the WHPX
> API
> + * does not match the layout used by QEMU.
> + *
> + * Specifically, trying to pass the state returned by
> x86_cpu_xsave_all_areas()
> + * to WHvSetVirtualProcessorXsaveState() causes it to return an error.
> + *
> + * As a result, we do not reflect the captured XSAVE state in the X86CPU
> + * structure, and instead manually save it to the snapshots via the
> + * whpx_xsave_xxxx() callbacks.
> + *
> + * Note that unlike the device drivers that can use the new
> VMStateDescription
> + * mechanism via 'DeviceClass::vmsd' field, AccelClass objects cannot
> easily
> + * do it. Hence, we rely on the legacy state management API.
> + */
> +static SaveVMHandlers savevm_whpx = {
> +    .save_state = whpx_xsave_save,
> +    .load_state = whpx_xsave_load,
> +};
> +

What are the differences?  Is it using the XSAVEC/XSAVES ("compacted") 
format?

Paolo


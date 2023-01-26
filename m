Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB54B67C9EE
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 12:31:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL0Qc-0002FM-US; Thu, 26 Jan 2023 06:28:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pL0OV-0000T4-Jf
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:26:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pL0O7-0005Qy-LK
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:25:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674732350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qxDKFedOc/Zxj7f8WncoAXDoDIjik4SmoAZkt/mf7Gk=;
 b=ZZj06klWmNh6PaLV+dITF+P5f9GRDpMERG31p1LIaLs9wJWTSFgmOPgTlQzgKTuaCpDk9P
 fPMbAadYtDjMCIKXdyFslcySEGko3SuwalTEWI7ObYRj2uhQTTaJMIYwRvsfLAoqh4Pa2T
 zTXz7M+2KyPB75MC4lnxB+CPOS4Mrgc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-94-5P3-t2LiPPORtgtb4CgRUw-1; Thu, 26 Jan 2023 06:25:41 -0500
X-MC-Unique: 5P3-t2LiPPORtgtb4CgRUw-1
Received: by mail-wm1-f72.google.com with SMTP id
 k34-20020a05600c1ca200b003db30c3ed63so898260wms.2
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 03:25:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qxDKFedOc/Zxj7f8WncoAXDoDIjik4SmoAZkt/mf7Gk=;
 b=L/wC8DORY9Rk3lKDXMRBP1/oOqQznhHB7oDJ/9aS9Aw6rWrsp4Fjr/R8umN8Vh9WXa
 fU0U+cWqKyet0vVKDxfTE8a+e/50WOI9PvpgQML67qcp1vq1Qm5UVN/kJntbUDkF9/UF
 V+NAoVZtrv9b7MTDzOhuA4YKnz0jfBWGNXy8WDOxLZposW/pUupzsTmqFBMxpGlQYMot
 lXFnMALd+A5LQImiFM+FbbZ8IFnTNiwzp4WVyPS3YecmWbnyBRWRXkoxJ8leNzPrSgZs
 p4i1vw+3v6bjgkld4HlWreo3Ao7213FlIq3y1sMnv5emkX6Qj28uO5XSTIHWGsTPl8pB
 rnqQ==
X-Gm-Message-State: AFqh2kpeOX2KjvusbMrFQC3qbQX1YrJV/wgpAhNL7+yXZ06mhNYx5PFN
 5QghQbviOngKVPSCK6HkJcz/HuH4c1ld1vLo4CgicN7Hl0Jnrr9IPScrmNZBhx7ap+oOnIE0Hqr
 XuVAtZAXXz74oG34=
X-Received: by 2002:a05:600c:4347:b0:3da:fc2c:cda8 with SMTP id
 r7-20020a05600c434700b003dafc2ccda8mr35722825wme.6.1674732340801; 
 Thu, 26 Jan 2023 03:25:40 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtzl7UH1vDosFg3mcSVgrCS5Cpns8fHtbpvDCMq/yrl2hGW897WV7kfbH7ki2LTb8lg7u4xRQ==
X-Received: by 2002:a05:600c:4347:b0:3da:fc2c:cda8 with SMTP id
 r7-20020a05600c434700b003dafc2ccda8mr35722807wme.6.1674732340506; 
 Thu, 26 Jan 2023 03:25:40 -0800 (PST)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7?
 ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
 by smtp.gmail.com with ESMTPSA id
 az26-20020a05600c601a00b003d99469ece1sm4577766wmb.24.2023.01.26.03.25.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 03:25:40 -0800 (PST)
Message-ID: <b803232d-f5f1-2b9c-8544-dd9d8a2fd78b@redhat.com>
Date: Thu, 26 Jan 2023 12:25:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 33/36] target/s390x: Implement CC_OP_NZ in
 gen_op_calc_cc
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230126043824.54819-1-richard.henderson@linaro.org>
 <20230126043824.54819-34-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230126043824.54819-34-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 26.01.23 05:38, Richard Henderson wrote:
> This case is trivial to implement inline.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Ilya Leoshkevich <iii@linux.ibm.com>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb



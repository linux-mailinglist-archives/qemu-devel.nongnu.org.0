Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2327653CBE
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 09:02:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8GWV-0000fi-P6; Thu, 22 Dec 2022 03:01:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p8GWE-0000af-Hd
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 03:01:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p8GWC-00046D-DA
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 03:01:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671696091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ughr9q/aNsddUnXF9I8fHNIKCIj+wP0QNMNVjYdSzbk=;
 b=W0kNXbglT/8gpvgE1n9Wipx4BXWpM7hFkBijLEOkB0/LmQrbSQdOzze9ddpC9rOace0Hps
 qEQDSbjexAcozEVxrgDL7/9wrFlOkOPi9J0w4yoCt/sRaBxdAk8q/pdtGwvlIIHVv5TVls
 zAi7oU737jJcxISAGA7UAvE5OsKwhO8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-348-zjLQL2SlNDSZem-wFsmJeg-1; Thu, 22 Dec 2022 03:01:27 -0500
X-MC-Unique: zjLQL2SlNDSZem-wFsmJeg-1
Received: by mail-ej1-f72.google.com with SMTP id
 hr34-20020a1709073fa200b0083a60c1d7abso932404ejc.13
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 00:01:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ughr9q/aNsddUnXF9I8fHNIKCIj+wP0QNMNVjYdSzbk=;
 b=dxWGZIiMUFDJ8Do7VfPjgMQo8erWU3d3VYfQYq+Q8DBfFPbkWFJB0y1cFVcJZ/8dm0
 ZBzu18ENJWSeRgJQFOxrNzxyfom5LZH1JZnEBo+n8itPQAycVyyd/B3qbInXUyTOJbZZ
 YwPSvcmqg1uMzw/KbSJ6Ada2esr2HpLF44QbkfZNy6FApfBK+TKxKEgSJ5SsdWFd99uG
 IXBiMXD+VMTqHJSFDf4jLmgau3LnkkgS4VO3LoyRxXJMotQrcFJ9E3h2QkNbY9hTig76
 3gEWFaJ934lHLzL99Dp7SPFlnGDUST5TE8HykpOQKMLKiW3KJx4DZ4LT1LNPgFflz0ig
 Q2Rg==
X-Gm-Message-State: AFqh2koOSO4MH+iNeBMw/ALMr7x+yHJtzmMt+vQR188O8U7qMg28zeQx
 Csl0nSbaF57l9mRXSh7XPNggDsEwmFEfa+Ly4oV+6UKWmwVnmzrcwbBVGK/7Zumut0Cz0osd3wg
 2e8xHLw0VE1055yk=
X-Received: by 2002:a17:906:d052:b0:7c1:5098:907a with SMTP id
 bo18-20020a170906d05200b007c15098907amr3718372ejb.35.1671696086518; 
 Thu, 22 Dec 2022 00:01:26 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtOLz0qC5yJZkPmII6OIReaomDaaa6+Coa1NByirapF1OuESB4iqBKhFnyVC/rPX24IonbNNA==
X-Received: by 2002:a17:906:d052:b0:7c1:5098:907a with SMTP id
 bo18-20020a170906d05200b007c15098907amr3718360ejb.35.1671696086301; 
 Thu, 22 Dec 2022 00:01:26 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 ku10-20020a170907788a00b007c0d4d3a0c1sm8016059ejc.32.2022.12.22.00.01.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 00:01:25 -0800 (PST)
Message-ID: <f6be3b34-acfd-8ac2-1b13-9cff62a8542e@redhat.com>
Date: Thu, 22 Dec 2022 09:01:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 4/5] coroutine: Split qemu/coroutine-core.h off
 qemu/coroutine.h
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: stefanha@redhat.com, kwolf@redhat.com
References: <20221221131435.3851212-1-armbru@redhat.com>
 <20221221131435.3851212-5-armbru@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221221131435.3851212-5-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

On 12/21/22 14:14, Markus Armbruster wrote:
> +/**
> + * Mark a function that executes in coroutine context
> + *
> + *
> + * Functions that execute in coroutine context cannot be called
> + * directly from normal functions.  Use @coroutine_fn to mark such
> + * functions.  For example:
> + *
> + *   static void coroutine_fn foo(void) {
> + *       ....
> + *   }
> + *
> + * In the future it would be nice to have the compiler or a static
> + * checker catch misuse of such functions.  This annotation might make
> + * it possible and in the meantime it serves as documentation.
> + */
> +

Is it intentional that "#define coroutine_fn" is not here?

Paolo



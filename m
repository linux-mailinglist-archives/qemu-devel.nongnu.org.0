Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7E34D97B3
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 10:33:09 +0100 (CET)
Received: from localhost ([::1]:59236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU3YC-0002GS-1c
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 05:33:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nU3J1-0008Ei-DS
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 05:17:31 -0400
Received: from [2a00:1450:4864:20::634] (port=46867
 helo=mail-ej1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nU3Ix-0001zQ-Qk
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 05:17:26 -0400
Received: by mail-ej1-x634.google.com with SMTP id qx21so39684774ejb.13
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 02:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=byD7wEEVNl+soetw0IPcMCY6ZcyBlBZKGKNSU6rl9CM=;
 b=VK8d/gaUgMOvcMkgRY2sAkNyi9zrO1j89Ndyu7UsFRP0MQExMEh+vVqDSVsN4wHDme
 zpt+o6/rKMb2CCldYC+PMtES4auIc0L+W8Ba6T0h9uTPKMf587VxyNBKlUyFFmwY8BCe
 pXrs2/CJqFjc0P2KR2z93j6BbqZ/YdnCzeUJ4jIjOWH+JIIK8WuxgpJnaiR7sI8XW5xU
 9THJw1bnvtPA3CqOX9ns3bB7KeNlJ06kgUUilGav9wNZb5+pz8My+OZmlmaVTaR1I4JM
 5VzA9rbgXUiqrWkbXptneGCoWhSuZ/OpqmJiLimAC1jQLm7Bkvf0Ta/digJCjm8pUdPF
 ifpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=byD7wEEVNl+soetw0IPcMCY6ZcyBlBZKGKNSU6rl9CM=;
 b=jEUK+ZLV8nUDrHV0+UyoPzI48uoMmCbeIuFsfbNdrqhcu5VpyOrSgTRQhNt3qWInDB
 7A9xYnCW8XfkSkLmRcNYDOyWoBj59xY6RxKqP1DBL1unfDmY0uCWvgfrIpQ2pkSFcl+b
 DZO3OfviWbnj/w6oMlV3VvXSYvbICbFJi8Dv1abw11BXHHGOJeAOaRXqac8zS0iZYBxY
 MOInmSjrjS+6PEmB/acE/8Ul2jKExv8z1yBpv22VcCoqM4tNK/e+tSD0cFoFkqc3jNiN
 6Davf1333dFLY3zbKsBZ1c1D8D1nCLhkslzpdi8OtjAUx6JKM0OsQP1DFRMbEmvCH1xd
 yoqw==
X-Gm-Message-State: AOAM5330UUXD/Nl9xyvPFGGo3oy4d2QyLViLEq8TDDPed542ePk/nlPs
 +1Op/ZjY6cc9HRq6g3bjhmQ=
X-Google-Smtp-Source: ABdhPJybuqB9CLTZR6CZPegwlmfcCTMgiU4SEKPZ/BC1E7KpLTqgCbQLneBtDrTM1YQhl75isPtU6Q==
X-Received: by 2002:a17:906:a08b:b0:6b9:2e20:f139 with SMTP id
 q11-20020a170906a08b00b006b92e20f139mr22988160ejy.463.1647335842058; 
 Tue, 15 Mar 2022 02:17:22 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 og49-20020a1709071df100b006db0dcf673esm7911258ejc.27.2022.03.15.02.17.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 02:17:21 -0700 (PDT)
Message-ID: <e5a29f66-5d9e-3d4c-be41-aa76ea484cae@redhat.com>
Date: Tue, 15 Mar 2022 10:17:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/2] Replacing CONFIG_VNC_PNG with CONFIG_PNG
Content-Language: en-US
To: Kshitij Suri <kshitij.suri@nutanix.com>, qemu-devel@nongnu.org
References: <20220315044740.155268-1-kshitij.suri@nutanix.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220315044740.155268-1-kshitij.suri@nutanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::634
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: soham.ghosh@nutanix.com, berrange@redhat.com, prerna.saxena@nutanix.com,
 armbru@redhat.com, dgilbert@redhat.com, philippe.mathieu.daude@gmail.com,
 kraxel@redhat.com, thuth@redhat.com, prachatos.mitra@nutanix.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/22 05:47, Kshitij Suri wrote:
> +png = dependency('libpng', required: get_option('png'),
> +                 method: 'pkg-config', kwargs: static_kwargs)

The full way to write it would be:

png = not_found
if get_option('png').allowed() and have_system
   png = dependency('libpng', required: get_option('png'),
                    method: 'pkg-config', kwargs: static_kwargs)
endif

but we can now also use

png = dependency('libpng',
                  required: get_option('png').disable_auto_if(not have_system),
                  method: 'pkg-config', kwargs: static_kwargs)

Use the one that you prefer.

Paolo


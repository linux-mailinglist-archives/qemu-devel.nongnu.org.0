Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 251704936D9
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 10:09:52 +0100 (CET)
Received: from localhost ([::1]:59398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA6yV-0006V4-6D
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 04:09:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA6eJ-0005m9-MY
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:49:02 -0500
Received: from [2a00:1450:4864:20::329] (port=38546
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA6eI-0003Gi-9x
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:48:59 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 ay14-20020a05600c1e0e00b0034d7bef1b5dso5950193wmb.3
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 00:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lQS8JsYrfO1FtP9j+QIQ+zFmtF6DpRnXomGBvsB2Y1k=;
 b=ZoDgq36Evs7fi1YQDtR9/3Vr1W5eDj0ABAaCU+7ddWXMMl3jyABD/zfpr+hYDj+L+B
 VYhThu2nNZbfBzBsD1zEtfbCuG+wirQZl6jfKyIu/6zT8RWjSCB9X4VTqX3nWI3PQ83H
 pYnV1uPDpzIMsYHAjlEEdRLi0VCaXuNh5tQKzwdyqiV4zG//Cv8F9xgcq8Fol/qLJOQV
 vHdE4gNBgl+C06pSSP/90s2iOae3A8mu/YzoQhmQRxatucZoCGo0zPERnibyRCX+C59P
 S0ACcAk9XbqG3uGuZ0/2JcjtLfCrIWIwUCTe1WXU2l435gwgWu15LOSjclKfuJMNVAyC
 NHtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lQS8JsYrfO1FtP9j+QIQ+zFmtF6DpRnXomGBvsB2Y1k=;
 b=6AXHZOF8YqACRm2BWIsLwT7G4BmefyNr/6DDz2c8luP6b7NBN7uYf0dYds9rrkDmw3
 9bNTG5Nre8F0aoG1awgorcUYRxEr098somBWrHF1d702YiPmzYciIIwa1fSoRChN/dTR
 7e57zDr9sSVbcbkFerg/WgnTRySw8mOD/o6LZiA5ETHqTHB8QQkmrG2bL/m14kPaTvkz
 9wp2fWNk6lRh4XguJXCxzEB9tAuKkcVLkUFAUMBEz9pL/HBAjAnsdenEs1ZHoKUUnNcj
 sdfMjmVsWk9DdQMdl06VWV1Y5UdSeGPAzbYouYhllwyvE0WNqys5CNpYWGMER78CpsGY
 JOIQ==
X-Gm-Message-State: AOAM531QcJG9vObp8QavCbgxmMGiVILg2GZAZxQBfsgPO+/yAV8EYFsl
 mE0Wbj2Z5y+aHr//hHcZ+yU=
X-Google-Smtp-Source: ABdhPJyW+PUOAuFVfv1NqTQB2d/sdEdvp4CRg7HsCdmwtUxe0jwZr2KfzW8KALMEX7MWnO/nmyK0dg==
X-Received: by 2002:adf:d1e9:: with SMTP id g9mr14171290wrd.94.1642582136842; 
 Wed, 19 Jan 2022 00:48:56 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id 1sm11636353wry.81.2022.01.19.00.48.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 00:48:56 -0800 (PST)
Message-ID: <70842579-af1c-e633-0499-e865328bb466@redhat.com>
Date: Wed, 19 Jan 2022 09:48:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 1/3] qmp: Support for querying stats
Content-Language: en-US
To: Mark Kanda <mark.kanda@oracle.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20211119195153.11815-1-mark.kanda@oracle.com>
 <20211119195153.11815-2-mark.kanda@oracle.com> <Ya+rLex1djU/1Wc1@redhat.com>
 <ee0d6990-06f3-9a1b-f7d5-7c379f0e9773@redhat.com>
 <5b2f4acf-29fb-34fd-eee0-341eec163da7@oracle.com>
 <a39efdf3-82f3-9042-8b53-86394d7aa90d@redhat.com>
 <Yea3+t4qtk4iB9jr@redhat.com>
 <347bc34f-178a-a260-9498-6be627b7537e@oracle.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <347bc34f-178a-a260-9498-6be627b7537e@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/22 14:59, Mark Kanda wrote:
> OK. Thank you Daniel and Paolo. I'll implement these changes for v3.

To clarify, the command should be

   { 'command': 'query-stats',
     'data': 'StatsFilter',
     'returns': 'StatsResults' }

so the "target" would be mandatory and there's one level less of nesting 
in the arguments.

Paolo


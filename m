Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A55B4A5AAE
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 11:55:47 +0100 (CET)
Received: from localhost ([::1]:37358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEqp8-0005oR-Df
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 05:55:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nEql0-0000x1-Ct
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 05:51:30 -0500
Received: from [2a00:1450:4864:20::52e] (port=39767
 helo=mail-ed1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nEqky-0000LI-UQ
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 05:51:30 -0500
Received: by mail-ed1-x52e.google.com with SMTP id u18so33069611edt.6
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 02:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=J0u6yu/TFHi1cR7pb1UNJsB9ZbDreipZl9Qp5mTp/XI=;
 b=OqXG1AQMpNJ88ks6x0yVj35zjxxIGcEXn1IJq3Qk9bDAsTTqdtLJ9KF4UuoCglK8iT
 nLPzN1X8LPsaatcXNzj574ejINsp83JNQC/z/oK+wFBOVlPJMF4UrnLR4DWHi+HBLnjp
 9pUKyTMVTXVtyT3pMxcERvobLOjaSuLmRmYDgFF/c5J1MNZ7CT9cDHc1E3C9lfFkz/+7
 XB8H24oRa6wX0ZaAGhK3hSOzt+r4Lg0gIrwqGcEnAKBWPjZnnW33ZX4CCWtxVr3nrcmW
 xmWTRC7l11HM4JtCe1Xl0uE7TXhla05RAW91xhFh3aLMGiC0Y2wShF0Z+7kvu6ijNCY1
 bMJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=J0u6yu/TFHi1cR7pb1UNJsB9ZbDreipZl9Qp5mTp/XI=;
 b=qWaVEqSWtOANGuoxFHrPmtYzFqO9Oiey/0PTi+v1MIGn1AaSxU+LRhK9Wd1B7IBoo0
 fbA9j7htcMilTIvtg+jrgDG7X4kLLzOH9nfSMlcxfbv1/j1ynEbpientC7CKysOqO93e
 ikcKv0aOyQ8bMs/J/3eM7Oud6IevU5eN+eRHvtOSFcPKKKMtzuskgkQEB6VAc957rZuc
 tutb3PzMCc68yFTVW94A/l90qU98TCwHqda95AUTjqViliif8PaYghzZyN6pKp8e8oTL
 SHpv+BmpqIjbFyzbgioEXnYF4wLbvmgI3heCfTg6Rs8iU+ymR9EdQSj/LRa2qPOgX52n
 4WQw==
X-Gm-Message-State: AOAM531cBpWTwdgzthVaPaHCaefjIWBHuPNejmEsYt9SSXhi5KpSphhG
 aiQCoLsbi4Ze1wvFgK4XrMnpzz5pFOs=
X-Google-Smtp-Source: ABdhPJzDGop8Q5eQ8OIf4MeB9cLr2z+6tlyRuLMFEstWGVA9dLvZIuVcQwMKVmSPpMXqGY6ZN/cWjg==
X-Received: by 2002:a05:6402:254a:: with SMTP id
 l10mr24463640edb.230.1643712687334; 
 Tue, 01 Feb 2022 02:51:27 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id b26sm3837534eje.64.2022.02.01.02.51.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 02:51:26 -0800 (PST)
Message-ID: <5c635615-e5be-8c3c-6146-cac70c326cf5@redhat.com>
Date: Tue, 1 Feb 2022 11:51:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 1/3] qmp: Support for querying stats
Content-Language: en-US
To: Mark Kanda <mark.kanda@oracle.com>, qemu-devel@nongnu.org
References: <20220131194312.1192626-1-mark.kanda@oracle.com>
 <20220131194312.1192626-2-mark.kanda@oracle.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220131194312.1192626-2-mark.kanda@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: berrange@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/31/22 20:43, Mark Kanda wrote:
> 
> { "execute": "query-stats", "arguments" : { "target": "vm" } }
> { "return": {
>      "list": [
>        { "provider": "kvm",
>          "stats": [
>            { "name": "max_mmu_page_hash_collisions", "value": 0 },
>            { "name": "max_mmu_rmap_size", "value": 0 },
>            { "name": "nx_lpage_splits", "value": 131 },
>           ...
>          ] }
>        { "provider": "provider XYZ",
>        ...
>      ],
>      "target": "vm"
>    }
> }

Perhaps it's better to have a better name than "list" for clarity, like 
you already did with 'stats':

{ 'struct': 'VCPUResultsEntry',
   'data': { 'path': 'str',
             'providers': [ 'StatsResultsEntry' ] } }

{ 'struct': 'VCPUStatsResults',
   'data': { 'objects': [ 'VCPUResultsEntry' ] } }


{ 'struct': 'VMStatsResults',
   'data': { 'providers' : [ 'StatsResultsEntry' ] } }

Also, here:

> +{ 'alternate': 'StatsValue',
> +  'data': { 'scalar': 'uint64',
> +            'list': 'StatsValueArray' } }

is it possible to just do

{ 'alternate': 'StatsValue',
   'data': { 'scalar': 'uint64',
             'list': ['uint64'] } }



Thanks,

Paolo


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C065116AF
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 14:23:18 +0200 (CEST)
Received: from localhost ([::1]:47826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njghR-0005Gv-Bp
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 08:23:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njgd6-0003x8-5i
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 08:18:48 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:35835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njgd4-0001aE-Gt
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 08:18:47 -0400
Received: by mail-ej1-x635.google.com with SMTP id l7so3055992ejn.2
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 05:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WvbTolUiCiIBWYzOGsJ8XM1aPCKoJt0i2oS27nU0QAc=;
 b=aqlzFYe6eGisJBrnC/AIvUqoVyYo2SFhKrOqIhH+oskoPQnx0rZW3Erxg2nptFXdQW
 Z6SMREFaWVT2r9zm4zxG02crbApm+O6BVjhLLgIfNckesdqif6+Ss5BpzF4nZONdOig2
 e4SCEnc3ih+Ry0kHaM1jOPBJkg/MVKp+QlBcnEVHaNcY102qdgTwbZVVp3WQgayMJu1W
 NTYuqj3IbzsjjFTgXANtxL/nqnxcGJ1TNu0Ck+K7m8BgjQAFL5h7VyqdobFnNEWqpHDK
 AbXZbb5B8uImdWAiaR/bRpCSCnxPCAZrK+Yko9vEo1Ta3BaPJMMDWFJeGFcwV4xaqLQC
 /Y0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WvbTolUiCiIBWYzOGsJ8XM1aPCKoJt0i2oS27nU0QAc=;
 b=r+nM1r/WznB0w53NdmTLc0izPr+0iH/+nSbtONleflZzlr+//fEWNSvssSzfatmv+O
 VXtCLw9i+UELtTLUW9H08NiU8GmHlG+CZaMq8nTnnfS+8hb6mq218I3YNtvYX3tA++wd
 1UBFoEWCKLnIHrjOgddEC7bXbCt0zNUNzAqW39WqrSR60Bu3O89Nec9EnyJRvFkMSUwq
 oZ3qWeF7Wq2RCbdwoTl+Bop7SJTQw1PYs0OUsdkAguxDz/BFaRQzXqr1SGOkzCr6kQ1m
 QiqJ/mMEZ3TS6pVPk1aaGtQa9inomj6MAleAOx92e6xrJ7gA1rZBVgQRCF6svo1hAOqN
 1G/A==
X-Gm-Message-State: AOAM531ZqWYKmFcdKSNFlQc/5eCy59WCA3yEFObSouidkVSe2rBip/WL
 L3ko3Z88empfr+pmSd6HbwU=
X-Google-Smtp-Source: ABdhPJwHuoVoVGDp+Q94dzEWfl9ZUBSuNlPfoib6Ok7XL/PqSphSJYtEI2OGHTGpJS8Z07p80kLWxw==
X-Received: by 2002:a17:906:7c5:b0:6e8:7c6f:4f49 with SMTP id
 m5-20020a17090607c500b006e87c6f4f49mr26266338ejc.378.1651061924867; 
 Wed, 27 Apr 2022 05:18:44 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 kk14-20020a170907766e00b006f3a6a528c8sm3310645ejc.146.2022.04.27.05.18.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 05:18:44 -0700 (PDT)
Message-ID: <6655dcbe-860e-b107-e63e-ff397189d178@redhat.com>
Date: Wed, 27 Apr 2022 14:18:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 7/8] qmp: add filtering of statistics by name
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20220426141619.304611-1-pbonzini@redhat.com>
 <20220426141619.304611-8-pbonzini@redhat.com> <YmkwndPwSDxqqdZA@work-vm>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YmkwndPwSDxqqdZA@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
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
Cc: berrange@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/27/22 14:01, Dr. David Alan Gilbert wrote:
>>      "providers": [
>>        { "provider": "kvm",
>>          "names": [ "l1d_flush", "exits" ] } } }
> That looks inconsistent to me; I realise that 'names' has to be a child
> of providers (since the names are only relevant to a given provider) but
> how about making the "target" work similarly:
> 
> { "execute": "query-stats",
>    "arguments": {
>      "target": {
>        "vcpus": [ "/machine/unattached/device[2]",
>                   "/machine/unattached/device[4]" ] },

This would allow queries for different types of targets in a single 
command, but it would be harder for the client to do filtering:

* with something like "target": { "vcpus": [ array ] }, there is no way 
for the client to say "I want this one statistic, but for all the vCPUs"

* if target is optional, a client might expect relatively small output 
from today's QEMU, yet suddenly get hundreds of KB from targets other 
than VMs and vCPUs (e.g. block devices including all backing files in 
the chain, NIC backends, etc.).

>      "providers": [
>         { "provider": "kvm",
>           "names": [ "l1d_flush", "exits" ] } } }
> 
> It's not clear to me whether the "target" should also be specific
> to a given provider.

No, the target is a QEMU concept, such as a CPU or a device backend.  It 
is identified by either a QOM path or a unique id.

Paolo


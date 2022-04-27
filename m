Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 407C85118B3
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 16:19:10 +0200 (CEST)
Received: from localhost ([::1]:55594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njiVY-0005dI-7F
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 10:19:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njiUV-0004we-PE
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 10:18:03 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:34448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njiUU-0006D6-4t
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 10:18:03 -0400
Received: by mail-ej1-x636.google.com with SMTP id g6so3744642ejw.1
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 07:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RAopsNCDLrAOlgLzE1wtS5Z0gXCbsEXDUubxIK6q7cE=;
 b=Lzp7J4RAIv4ewQmi1eBEqUtD5DYPt22cSxjn68leuAghns8rigF9UtPcCzzH5Hyk8M
 BBrxkg/gZs40fXFMsBh82GFh5S5gT+ZiUO+B9Vog11yQG31Q+kpU43vsu42e84WC45ik
 0J1Qm8VrUOoGBKNloghZMsI3AOE+fz1NSboQwVTJ4T7klq506X0hCroFhlZrkSGk/cJj
 6UtXVzc2T3Yky6YPzzz2yxSL2rX3qs0kC9th3Zv6IPLt3mEY4lgkxV6Ai18xNVdWr9Gy
 oPKHrdYEgQiVN7ihnHOUeVR5u+o72AGtmkacPbpwWIhzBI1jT4hAF30pOBrZtO1tgB7D
 2Urw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RAopsNCDLrAOlgLzE1wtS5Z0gXCbsEXDUubxIK6q7cE=;
 b=W3++PEE3RKt51GV/p34xRmzvjfKB+2nMxJBU0EdfikESgkc33u6JTfSp0+80f0jS6K
 WuG4wRg6rjN7WfcM7TqeNKGQIJHQ1EH7eRF3b0I2sHaObhdI5jwdni3l8p/9falG3rtN
 s7KIoq0yZMoPWpXdndiA9s7cjo3QDS4TcY7DY6g/lf4Xg1IBSjzO33qoNfl/1uGBKG+F
 Hv5GrTAhrASyNZesr558Cr8YUkTaENL0j/kOG7KIjgO3+4SJK493KSCfO9gvBy9gaBSR
 bn9/I1+cjFYeNQfnso4+sr9uGWz9eDNZg95Hv3xZHerQMbOnDy6twCUx4dPRo1hHvHg7
 ddJA==
X-Gm-Message-State: AOAM5311Vy275Mz1gEWLImF0QGsNT7Lq+amj65y/9ErRulWXEqUMDKR+
 4aY9UOAWPZM+RmIRnA6NYJM=
X-Google-Smtp-Source: ABdhPJzgAt6uub6pZd6g8akUbUAHLCwulUSeX0sJ+1AqpbzRIGIo1nP8h5b5mQxBE5VxX/cEIBk4RA==
X-Received: by 2002:a17:907:160f:b0:6ee:8214:3cee with SMTP id
 hb15-20020a170907160f00b006ee82143ceemr26427933ejc.433.1651069079979; 
 Wed, 27 Apr 2022 07:17:59 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 u4-20020aa7db84000000b004136c2c357csm8423111edt.70.2022.04.27.07.17.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 07:17:59 -0700 (PDT)
Message-ID: <2aed3f83-5941-d723-7c27-cc657f7c257a@redhat.com>
Date: Wed, 27 Apr 2022 16:17:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 7/8] qmp: add filtering of statistics by name
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20220426141619.304611-1-pbonzini@redhat.com>
 <20220426141619.304611-8-pbonzini@redhat.com> <YmkwndPwSDxqqdZA@work-vm>
 <6655dcbe-860e-b107-e63e-ff397189d178@redhat.com> <Ymk4U4O4CN3e7+9A@work-vm>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Ymk4U4O4CN3e7+9A@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x636.google.com
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

On 4/27/22 14:34, Dr. David Alan Gilbert wrote:
> If I specify a 'vm' it's not obvious to me whether I'd get NICs and
> block devices in the future?

VM would not get those (it's global statistics), but the size could 
balloon if you specify no target at all.

> Adding a syntax for 'all' into the vcpus list would fix that?

I don't like having special syntax.  The current QAPI just doesn't 
filter what is not in the arguments.

>>>       "providers": [
>>>          { "provider": "kvm",
>>>            "names": [ "l1d_flush", "exits" ] } } }
>>>
>>> It's not clear to me whether the "target" should also be specific
>>> to a given provider.
>>
>> No, the target is a QEMU concept, such as a CPU or a device backend.  It is
>> identified by either a QOM path or a unique id.
> 
> But doesn't 'kvm' as a provider only make sense for vcpus and VMs; if
> you're imagining block devices and other things as targets it would seem
> wrong to have that set of providers separate.

Yes, those would have different providers.  But a single target can 
support multiple providers.

Paolo


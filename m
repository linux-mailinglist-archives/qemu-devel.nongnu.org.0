Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 713696EF2FA
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:59:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcrr-0003JP-TZ; Wed, 26 Apr 2023 06:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1prcrq-0003Hf-3E
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:59:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1prcro-0006sJ-Bj
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:59:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682506758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cNs4jTa+gmWqjssWjD62Jv3T5J/YUfCD/qHxFgUivXQ=;
 b=Rnb1TDOI+gzyr17+aypiI3Y9G1XhUGmirAG/vvCHaZYC7TLpHjAq12tj6/x0IHRcoAKpJk
 2FJS3gH7rUNyhFATE0qIkX4nnlASG33Ck8l+f3QTkbgsVBOsmidpsiWvTZghsu0BFs+NEm
 QfzNSN6u5J64qi+zaxvbXVlmM5f6HyM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-gLl5TNiZNbWZZ2ngrO6DOA-1; Wed, 26 Apr 2023 06:59:16 -0400
X-MC-Unique: gLl5TNiZNbWZZ2ngrO6DOA-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-9534238ffa6so751538166b.1
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 03:59:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682506755; x=1685098755;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cNs4jTa+gmWqjssWjD62Jv3T5J/YUfCD/qHxFgUivXQ=;
 b=MDmiRyH3rOgZQaksQtf7USnqnmK4c1vHjzf5zOtr6y0mcEIn7uPWRmkFu3K+JESBk6
 xk82XFA+9eWT1j8RoVRpNvRlhG0RWgT+mGEHmLRo+HibX6HufCi/9c2n9RBcrZtO2gMR
 9eR6M236xxdhDTF8rTs4fn7DwwFdPip9gTblLjr6QtXHdeef1/ReEHTgCzfpeltdabRI
 qyAPp0utWX0lhBvWQA9nc5OuaU/4yd2P8bBD0ov3o6+gWrWEZO4CpoPoaH1Os9j79y2+
 rcreeJqUuog/Mo+bSG2BciDQN9jy1viLNRaR8dR6C7FyJt369WCBVSgp5jvZ0R0sPSar
 Ccpg==
X-Gm-Message-State: AAQBX9flDq/yJl0PkOfyr7m/UQPjAx4paOJkSWPXlF7S74iAVE0UiJJU
 //aCjTLzEwsUljeJpC30hGdGRFaYafr/wPF2wMt2mRyt9y/XNH0qACvnoBWuIKBLuz0vJXU1+tC
 d3tPxqKC+Kg5RUBU=
X-Received: by 2002:a17:907:c001:b0:94f:449e:75db with SMTP id
 ss1-20020a170907c00100b0094f449e75dbmr19083360ejc.52.1682506755596; 
 Wed, 26 Apr 2023 03:59:15 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z1Nj1rBy4xouLY+bFHlUlUVhRuorEoUMWdGTP/4g3bKYBQXi9t4eF49cQeVd6yEwHRN4Lz5g==
X-Received: by 2002:a17:907:c001:b0:94f:449e:75db with SMTP id
 ss1-20020a170907c00100b0094f449e75dbmr19083335ejc.52.1682506755324; 
 Wed, 26 Apr 2023 03:59:15 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 l18-20020a056402345200b00506935b7c75sm6547057edc.69.2023.04.26.03.59.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 03:59:14 -0700 (PDT)
Message-ID: <5fc11d22-275d-cc8d-bf9c-f1c015cbee23@redhat.com>
Date: Wed, 26 Apr 2023 12:59:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [RFC PATCH 0/3] Deprecate the qemu-system-i386 binary
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20230425133851.489283-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230425133851.489283-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 4/25/23 15:38, Thomas Huth wrote:
> - CPU types have different suffixes between the -x86_64 and -i386
>    variant (see TYPE_X86_CPU in cpu-qom.h) ... do we need to care
>    about this in the new qemu-system-i386 symlink run mode?
> 
> - The code in target/i386/tcg/sysemu/smm_helper.c looks like it
>    maybe needs a runtime switch, too ... or is it ok to leave this
>    hard-coded to the x86_64 version?

Yes, it would have to switch based on the CPU's LM feature.

> Anyway, I'd like to get some feedback on this idea here... What
> do you think of the idea of getting rid of the qemu-system-i386
> binary this way in the future?

I wonder if we should take this a step further and rename 
qemu-system-x86_64 to qemu-system-x86!  Distros can if they wish create 
symlinks to both qemu-system-i386 and qemu-system-x86_64.

Then we would name the CPUs "foo-x86" and alias them to foo-x86_64 and, 
if they don't have LM set, to foo-i386 as well.

Paolo



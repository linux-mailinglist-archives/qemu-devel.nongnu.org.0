Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 244484243D8
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 19:18:04 +0200 (CEST)
Received: from localhost ([::1]:34134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYAYM-0003xt-Hm
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 13:18:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYAWt-0003I6-ST
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:16:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYAWq-00021C-QM
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:16:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633540587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DpU963GpnW0rhqMm4FNugO4WNkgkh9dbUFFuC0EejI4=;
 b=Q5GptOblP/nLXhSXv093e85Y2JtXQCg1yadsjtRKWWMETgnkxe2AoBHcXecNJf8EbEZVN9
 /iivkfMluwPefUikAiZg0xkzHjkuVL0YAm9jN/g/vFc/82XfsRcUvB2pl5ddZQmmbOxQsS
 +jLC0rbIXNnCFZdqySTgtnsHJ7U21Og=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-iudwCvl9MNa3keKg-2grpA-1; Wed, 06 Oct 2021 13:16:26 -0400
X-MC-Unique: iudwCvl9MNa3keKg-2grpA-1
Received: by mail-wr1-f69.google.com with SMTP id
 p12-20020adfc38c000000b00160d6a7e293so117864wrf.18
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 10:16:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DpU963GpnW0rhqMm4FNugO4WNkgkh9dbUFFuC0EejI4=;
 b=wVmjTmRnSY1BaElLE2Vg4eIaFoHKCHYacLP8tPgnx2LSfOdimhbO5vCk9sWwbb8T1I
 Z6CYVIyvIMh3XwCWJbogZ4k5Yw7BgQXyt71eEZ2lAdMAs13h+2BeOjqoOO+443Pj8Rsg
 Xgcj4uZsAf/4MZqx27jCi7Jbv6vwiKsuwDrEQVcDarlbYXJa0QsJAzyLNACNe5tepJYW
 RBnzw66YHB8kA22Qb2rZa+7DsBqfeOqpaNZ7tWe4dUab/rse3LGCnYDyBxhR1ITRw7ee
 XJZDb1ChAhmPoUl7uE9/iACpoAypG0cP8Bs+8e4QCBOR+HPikT/aM3e7o17gVS+97KNf
 867A==
X-Gm-Message-State: AOAM532j97rI0vJH77rxnGSsMS+lDqD5qFWy6N+IIbxuyNoC8s2tBlaL
 +TYuqKNaZfXvOAdJvmTyIr7BWHxdiReiH669cYS2jPNQp3KwMshDUkNVbqEYvTaPxQxqlrMvmzi
 WgZFux7zFkzXh4O8=
X-Received: by 2002:a1c:a9d3:: with SMTP id
 s202mr11211596wme.128.1633540584541; 
 Wed, 06 Oct 2021 10:16:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkbl2jotLk24THUo9vSeLVZ23mEBhkpcOKUfWw3wxB75y1IMvdnI6Cxie9m5vyfLjLMaMGUA==
X-Received: by 2002:a1c:a9d3:: with SMTP id
 s202mr11211570wme.128.1633540584245; 
 Wed, 06 Oct 2021 10:16:24 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n186sm6040547wme.31.2021.10.06.10.16.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 10:16:23 -0700 (PDT)
Message-ID: <face0d36-da9d-1ad1-4045-7de3e341f7d0@redhat.com>
Date: Wed, 6 Oct 2021 19:16:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PULL 12/12] meson: show library versions in the summary
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211005164408.288128-1-pbonzini@redhat.com>
 <20211005164408.288128-13-pbonzini@redhat.com>
 <2fe71843-bcbe-cbc7-dfed-d9beb60e9f2b@redhat.com>
 <658443a3-35ea-67ad-64f5-eb25059a454b@linaro.org>
 <8a067352-a8d5-6afb-6584-79604a0377a5@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <8a067352-a8d5-6afb-6584-79604a0377a5@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

On 06/10/21 18:55, Philippe Mathieu-Daudé wrote:
> So something doesn't work, because my system has 0.59.1 and it is used
> instead of the submodule...

How do you run "./configure"?  If you passed explicitly 
"--meson=/usr/bin/meson" or something like that, then you're asking for 
the broken version (which works fine except for the summary).

For example, on CI the various containers have

alpine   0.59.0 https://gitlab.com/bonzini/qemu/-/jobs/1571377952
centos   0.58.2 https://gitlab.com/bonzini/qemu/-/jobs/1571377957
Debian   0.58.2 https://gitlab.com/bonzini/qemu/-/jobs/1571377954
Fedora   0.59.0 https://gitlab.com/bonzini/qemu/-/jobs/1571377956
OpenSUSE 0.58.2 https://gitlab.com/bonzini/qemu/-/jobs/1571377958
Ubuntu   0.58.2 https://gitlab.com/bonzini/qemu/-/jobs/1571377953

and they are all upgraded to the in-tree 0.59.2 now 
(https://gitlab.com/bonzini/qemu/-/pipelines/382687127).

Paolo



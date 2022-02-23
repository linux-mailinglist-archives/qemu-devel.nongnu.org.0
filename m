Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 147634C11FF
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 12:56:21 +0100 (CET)
Received: from localhost ([::1]:41898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMqFo-0000ZD-47
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 06:56:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nMqAt-0002nR-2L
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 06:51:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nMqAq-00063c-9s
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 06:51:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645617071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YhtdNHHHt8BuxfDUCQQx1Is9e9SjvxXOhnrx1YyTHeg=;
 b=A5Y4tD1sWUiP12rt/LakeeA9qW2p8A5lsZJdzpvSg1wDUQ3ozU+trSyfrpwxTVwxi/fNH6
 JVkoypxymTVFtQcJAHUbDI3SAbcIoHcTzAVQVJrkd+rFRcgIzgtyYhdJYrWnqTBD/srYpl
 s9gIZlQbrwbYuiLgw0BrFTKMlXXp9yQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-330-7dawUrp6OnSnS2rDTP63Dw-1; Wed, 23 Feb 2022 06:51:10 -0500
X-MC-Unique: 7dawUrp6OnSnS2rDTP63Dw-1
Received: by mail-wm1-f70.google.com with SMTP id
 d8-20020a05600c34c800b0037e3cd6225eso2071124wmq.6
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 03:51:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=YhtdNHHHt8BuxfDUCQQx1Is9e9SjvxXOhnrx1YyTHeg=;
 b=uuAKtmFd+GvNzkGziTGZ1tZFU9mw8PTDgxeGaLpUbXLFZkrFfCmWdp7PQTiezhnrfn
 i9XonwFbN2v52n8MEK8xx1OpzHrVIFTlc40ZXRBH3iQ1Bz9cRy5rvtsIX0dOcDOM0w5b
 JAGI0/bHr9OA7b4DdfgjB3MwvXMcep3jEcvacqZKlzI5zsGVdHGnjE0Ikvl5sGOdIpA9
 ZUOtCqdgOnBlgkexOUVovPTDeG8k/hXDPSVE1lH2K+Hrm7eOLe9Vc4tvgC8V6fSjH3bX
 8oEfnR/FZKxZuKSC02WNeaI0FR0FoaSC6DQgL2QPY6gYQHzP2F7LcVeE16AoQnzBp+wo
 /ZEg==
X-Gm-Message-State: AOAM530GmVsiEmgl3BdtaJ7zUEFnLezOWTeee/y8bH33EHCAodDY2Yvi
 4TsR97kd3m6M1V21pYXxk8pzGqwUWL8iYSNt0qfWj6RaAvcBgYFoCz6Q2E8BPKu/5x6do4bjHoI
 S1ItL43PIPkKLRDs=
X-Received: by 2002:a05:6000:1141:b0:1e4:b28e:461d with SMTP id
 d1-20020a056000114100b001e4b28e461dmr22026432wrx.320.1645617068650; 
 Wed, 23 Feb 2022 03:51:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUn5jbLVsVJV0CmnYVTrpyLXkFV8YC5Sj2dWJ12KIikvjpnaSikH6NkMJcVqWmFzKxOTGIDw==
X-Received: by 2002:a05:6000:1141:b0:1e4:b28e:461d with SMTP id
 d1-20020a056000114100b001e4b28e461dmr22026413wrx.320.1645617068382; 
 Wed, 23 Feb 2022 03:51:08 -0800 (PST)
Received: from ?IPV6:2003:cb:c70d:5300:b415:ca4f:9aa8:c7ec?
 (p200300cbc70d5300b415ca4f9aa8c7ec.dip0.t-ipconnect.de.
 [2003:cb:c70d:5300:b415:ca4f:9aa8:c7ec])
 by smtp.gmail.com with ESMTPSA id
 ay30-20020a05600c1e1e00b0037fa9762d50sm5518589wmb.12.2022.02.23.03.51.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 03:51:08 -0800 (PST)
Message-ID: <e84a64d4-4095-5158-d974-5bbc3e8bead1@redhat.com>
Date: Wed, 23 Feb 2022 12:51:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 4/4] tests/tcg/s390x: changed to using .insn for tests
 requiring z15
To: Thomas Huth <thuth@redhat.com>, David Miller <dmiller423@gmail.com>,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <20220217231728.13932-1-dmiller423@gmail.com>
 <20220217231728.13932-5-dmiller423@gmail.com>
 <e0b1e009-6684-6a4a-a8f3-1fd6048a89ad@redhat.com>
 <12e026c0-1c27-db38-2404-85d572ae2bd9@redhat.com>
 <14eaf7fe-78f7-438e-1502-c646965c024d@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <14eaf7fe-78f7-438e-1502-c646965c024d@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: pasic@linux.ibm.com, borntraeger@linux.ibm.com, farman@linux.ibm.com,
 cohuck@redhat.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.02.22 12:49, Thomas Huth wrote:
> On 23/02/2022 11.54, David Hildenbrand wrote:
>> On 23.02.22 11:44, Thomas Huth wrote:
>>> On 18/02/2022 00.17, David Miller wrote:
>>>> Signed-off-by: David Miller <dmiller423@gmail.com>
>>>> ---
>>>>    tests/tcg/s390x/mie3-compl.c | 21 +++++++++++----------
>>>>    tests/tcg/s390x/mie3-mvcrl.c |  2 +-
>>>>    tests/tcg/s390x/mie3-sel.c   |  6 +++---
>>>>    3 files changed, 15 insertions(+), 14 deletions(-)
> ...
>>>
>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>>
>>> ... maybe best to squash this into the previous patch, though (I can do that
>>> when picking up the patch if you agree - no need to resend for this).
>>>
>>
>> Do we need this with my debian11 container change?
> 
> I just tried without, but this breaks on s390x hosts with older compilers, 
> where the TCG tests are run without a container:
> 
> https://app.travis-ci.com/github/huth/qemu/jobs/560854945#L12875
> 
> Since Ubuntu 20.04 is still a supported s390x build system for QEMU, I 
> assume it's best if we squash the .insn patch?

But then, the "-march=z15 -m64" in the previous patch is also unsafe.

-- 
Thanks,

David / dhildenb



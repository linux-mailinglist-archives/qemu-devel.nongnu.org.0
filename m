Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00822648689
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 17:36:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3gLh-0000ij-07; Fri, 09 Dec 2022 11:35:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3gLe-0000f9-Ds
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 11:35:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3gLc-0007sw-W7
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 11:35:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670603740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DaVjB9cbUGiV6CAsga6m0MRBz39By17CQic8UAwiIco=;
 b=JoHy93X/ktmV7yW9vYyCGomgJN6rNsClcDFLLxCoVpR+9I5Thr9dNowi8ysrspPqsBZVfN
 cvOakkTMGWYMQDl8i9dVQFsiF4cfME78RWHmsrIbt+HF/l9fWHR3A9/FbKsw6e5mqxBLfc
 byiV2uW9HEzCoQKbJQBHqxdtt7dKzM0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-444-10DrzTsmPtm3tdtldh1Kvg-1; Fri, 09 Dec 2022 11:35:38 -0500
X-MC-Unique: 10DrzTsmPtm3tdtldh1Kvg-1
Received: by mail-ed1-f70.google.com with SMTP id
 f17-20020a056402355100b00466481256f6so1673433edd.19
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 08:35:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DaVjB9cbUGiV6CAsga6m0MRBz39By17CQic8UAwiIco=;
 b=DBaRuSfbSzDoOM3hbpuujRc9YmQ86F0GnZDaoNSoH68k3ddgNliaW13V67gp36WysS
 I+29TPF5wh2xcTuu1MLRyNj/qMCKdYPK2lV2RrIO50rb6YtkiWc9vm7LgswLKhvRhlbO
 iFH67prQrKevhbTkpBROqBqY9fclxW3eCM0s2UPjFWNTyPQ7GmlxKvsous9J0E7YUQd0
 rAQzw31HZ8MV0wROEWKF4JXtt3XuiJLBVGDnIepqCwNqbX72r+4TEBgi334W1jykn0bV
 8sG/kflJRbTxdOfJYPymvdTNr9EHFJ/++qKfzbD+GKDBOD41rfWE6rvDr9MHdpxlx0DN
 v8Xg==
X-Gm-Message-State: ANoB5pmpXwNUeR2hGxru7wHTVlwuNezYZnoNT0D1PZhHX8KTg7ts6o3b
 xF8nUrrDqeDkUgjwNP5dHGsY/vnD4SNAa1F5eqg5PQzUSB0dKKQ3PwOBywyF6N8g4Xp48mDUNLh
 LIO3d6IV09UlDvtQ=
X-Received: by 2002:a17:906:4a8f:b0:7c1:23ef:4bb9 with SMTP id
 x15-20020a1709064a8f00b007c123ef4bb9mr4667466eju.13.1670603737781; 
 Fri, 09 Dec 2022 08:35:37 -0800 (PST)
X-Google-Smtp-Source: AA0mqf63u+7UOhkC6AgkSyPZJW9XPZtBpml/QyrQyYWX2Q8+OgUn8IKjqwhxwaRhw6iFkMz2pHZESA==
X-Received: by 2002:a17:906:4a8f:b0:7c1:23ef:4bb9 with SMTP id
 x15-20020a1709064a8f00b007c123ef4bb9mr4667459eju.13.1670603737581; 
 Fri, 09 Dec 2022 08:35:37 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 la1-20020a170907780100b007c073be0127sm80504ejc.202.2022.12.09.08.35.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 08:35:36 -0800 (PST)
Message-ID: <4f3f5bee-cfc8-133f-c4bc-53fa2f75cd5e@redhat.com>
Date: Fri, 9 Dec 2022 17:35:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 03/30] configure: remove useless test
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20221209112409.184703-1-pbonzini@redhat.com>
 <20221209112409.184703-4-pbonzini@redhat.com>
 <CAFEAcA9QbCxBW0ZmnzXr=ry3XyHX6YKH0ZxGDCfTmRmSbao+3Q@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA9QbCxBW0ZmnzXr=ry3XyHX6YKH0ZxGDCfTmRmSbao+3Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.288, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 12/9/22 12:34, Peter Maydell wrote:
>> -# Using uname is really, really broken.  Once we have the right set of checks
>> -# we can eliminate its usage altogether.
> I note that the fallback if we match no #defines is still "use uname".
> We can only get rid of that if we're willing to say "must be a
> known host architecture, even if using TCI", though. Or we could
> force the 1 person using that setup to specify --cpu manually, perhaps.

Ok I'll change a bit the comments, and add a warning in configure as 
well if the #define checks fail to detect the CPU architecture.

Paolo



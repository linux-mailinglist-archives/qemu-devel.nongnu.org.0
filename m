Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBFE6A9364
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 10:10:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY1Qj-00008L-Hc; Fri, 03 Mar 2023 04:10:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pY1Qg-00007g-Vq
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 04:10:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pY1Qf-00050P-Fx
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 04:10:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677834616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9+21rV9JTPJqEv5hAaO9XIP6+vcaQYqkxAqtWTVCpXo=;
 b=JieVK3t39PdAqLkrgjiiH2YPP3J0lNCzd7Pcq+0wbKb1WHVc/x/5kkweM5mUQmZBBZPDZz
 8uIVx5siW5wwaMbMuhtiG5rsMyxyHCnfsQbD39HaAyPPUg0jYK6J8Qy/QYI6LSRvHYnGe+
 Bt8p5ApAIkw9cYSWP0YhUr4Dgu5Ewbo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-624-i9z2GSAlNv2T9yNg5Dlqcw-1; Fri, 03 Mar 2023 04:10:14 -0500
X-MC-Unique: i9z2GSAlNv2T9yNg5Dlqcw-1
Received: by mail-wm1-f71.google.com with SMTP id
 z6-20020a7bc7c6000000b003e0107732f4so686598wmk.1
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 01:10:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9+21rV9JTPJqEv5hAaO9XIP6+vcaQYqkxAqtWTVCpXo=;
 b=HZ1rPdQvPgN/fMr2mJTuIb2URhd0cuHbwpxP4L08KWprxny55uENroLBCE3EOCH9/Q
 eXxGbyOJrR4RHIasI3zZ9disxGn19IUsQwLCtCu45+ZSOMxugAp30u5bU7voTHaoPCec
 Ei6oNVzZorqSEKYGGJmlcN0A+uUGr3N4LeCxzoo3ZdbFoEufAuEe8G7avqYnJ5E31xnf
 Dn5Rjkxz8NwuDkmJBu4aAKeXZiV6gDYqLzrYyRvvM3tC7RhtImomO1aoFc2e0250JGvO
 ms2oUJDfFHV8W9Pk64rgVwbvaNAu5MaeQh01MN3Mi0iTHXGyiFbEZjNXFqB9ZWxyAuEn
 9uYw==
X-Gm-Message-State: AO0yUKUL+bhhP7S0iTiXoYkeXVxYQMzE2coirQnnAUrNnJGL28dEmrC/
 nH31x1w6u3LCQrKOJj6Xy37IQQgQzGYiormo0H9I2HO+NJnydW6b3DHYhAqTFZMfAzsLuUGFWl5
 sFHwL2RtkEGvIRWc=
X-Received: by 2002:a7b:cc10:0:b0:3eb:3104:efef with SMTP id
 f16-20020a7bcc10000000b003eb3104efefmr885828wmh.31.1677834613687; 
 Fri, 03 Mar 2023 01:10:13 -0800 (PST)
X-Google-Smtp-Source: AK7set8sNUs5aIxfGLBghONN9hU8KRKJmuWW4ZRlWH0vxY0sJVns6zDMxd7ZTzr9WpfjWC7OFifobQ==
X-Received: by 2002:a7b:cc10:0:b0:3eb:3104:efef with SMTP id
 f16-20020a7bcc10000000b003eb3104efefmr885809wmh.31.1677834613378; 
 Fri, 03 Mar 2023 01:10:13 -0800 (PST)
Received: from ?IPV6:2003:cb:c702:6100:f5c9:50a5:3310:d8ac?
 (p200300cbc7026100f5c950a53310d8ac.dip0.t-ipconnect.de.
 [2003:cb:c702:6100:f5c9:50a5:3310:d8ac])
 by smtp.gmail.com with ESMTPSA id
 a17-20020a056000101100b002c553e061fdsm1592358wrx.112.2023.03.03.01.10.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 01:10:12 -0800 (PST)
Message-ID: <c4b70513-7cbc-a858-58ed-537c8fe7795e@redhat.com>
Date: Fri, 3 Mar 2023 10:10:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFC 0/4] memory: Fix (/ Discuss) a few rcu issues
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Chuang Xu <xuchuangxclwt@bytedance.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230225163141.1209368-1-peterx@redhat.com>
 <6c75e2e2-5ba9-bc52-2c6c-a0bfb5f5b56f@redhat.com> <ZAC2ccoQpFLa07ZK@x1n>
 <4f130497-1200-8c42-7d48-cadf54f3f6a4@redhat.com> <ZAEaO7Yqw2F8hbbV@x1n>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <ZAEaO7Yqw2F8hbbV@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.092, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 02.03.23 22:50, Peter Xu wrote:
> On Thu, Mar 02, 2023 at 04:11:56PM +0100, David Hildenbrand wrote:
>> I guess the main concern here would be overhead from gabbing/releasing the
>> BQL very often, and blocking the BQL while we're eventually in the kernel,
>> clearing bitmaps, correct?
> 
> More or less yes.  I think it's pretty clear we move on with RCU unless
> extremely necessary (which I don't think..), then it's about how to fix the
> bug so rcu safety guaranteed.

What about an additional simple lock?

Like:

* register/unregister requires that new notifier lock + BQL
* traversing notifiers requires either that new lock or the BQL

We simply take the new lock in that problematic function. That would 
work as long as we don't require traversal of the notifiers concurrently 
-- and as long as we have a lot of bouncing back and forth (I don't 
think we have, even in the migration context, or am I wrong?).

That way we also make sure that each notifier is only called once. I'm 
not 100% sure if all notifiers would expect to be called concurrently.

-- 
Thanks,

David / dhildenb



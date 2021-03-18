Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2053404AF
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 12:35:12 +0100 (CET)
Received: from localhost ([::1]:51296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMqvn-0004KC-Tg
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 07:35:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMqs7-0002ZZ-M8
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 07:31:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMqs2-0002fv-Fe
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 07:31:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616067076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ysM6uPvCTnBFvFlgfILPpEME73b7cXiBO8cNe3ntmI=;
 b=gv0QeJEE6QJ4rN7bESlvRRdPq2gEyTqkaawyXdjTTC9L4YDYfLrvVOkxlcCyxcfPTRoeho
 pQkuf7zzdwtvgVl5VydnnJh+MtoVYT/w/YD47CPrWYGsdsOFZ9FZYZ3rsxTFaWATNpxUMW
 kAx0TNkadwZCI4Mrmz3ugn/CZ4/14v8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-n0zuLgtYNLW47yeJ8y4NWg-1; Thu, 18 Mar 2021 07:31:14 -0400
X-MC-Unique: n0zuLgtYNLW47yeJ8y4NWg-1
Received: by mail-wr1-f70.google.com with SMTP id f3so19949386wrt.14
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 04:31:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+ysM6uPvCTnBFvFlgfILPpEME73b7cXiBO8cNe3ntmI=;
 b=pDkUXFmjJ5QT+Js4kvKBHq7MBq+yszCzz1y1diwZWvuTbrYuXL0ixAqycQG/YXNGmt
 IumNB5gzlTt2QrCxuno91eR7oqE6/nx3q0OPeHDzraGdU/BsQSru5Cs/A7696EFUbv2f
 Lb9ih6N1lSj/zToni9zOXK+XSZiRdfV8jOLJw79gUQIeIZ+DFK3lCqBvm7Md9ZqEOmG9
 dUroN8jo+bEsDAhM0uoZBBwdP0GL8JVGgEl81aj9n1MRVdJ31FqCy7SKovHUdIdonxtc
 j/INfX0PbEe0LYpcauGWJdSwsqGylSidcwnSeUpUuOFh1XSeCOHNtf/onqphWcCnzOjm
 HZTw==
X-Gm-Message-State: AOAM533BTKdupwApzFjtRyg82S3UBwJNBlJf8cktbhA9uIXTsJjw5xUA
 Em4f7xsLFiejTW5mdLiPBdC9HelVhyeWEWfm/6uUeZy0fxdSey2AfwsU3dc9XaamyhRShe5qZGF
 Qee45kxx6zz5m4t8=
X-Received: by 2002:a5d:538d:: with SMTP id d13mr9349462wrv.92.1616067073628; 
 Thu, 18 Mar 2021 04:31:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBtyXngtfdfe4a3ao469XeAfdS3Vamiu9M9YqQBz3uMFREzDyznGqm9VT169ExwqNnVLyncg==
X-Received: by 2002:a5d:538d:: with SMTP id d13mr9349439wrv.92.1616067073452; 
 Thu, 18 Mar 2021 04:31:13 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id p17sm1886330wmq.47.2021.03.18.04.31.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 04:31:13 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] target/arm: Restrict v7A TCG cpus to TCG accel
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>
References: <20210221222617.2579610-1-f4bug@amsat.org>
 <20210221222617.2579610-4-f4bug@amsat.org>
 <c395479b-d2e0-a862-3446-4afef601ca1f@suse.de>
 <8a302c84-b69c-b0c2-de45-607dd1f686a6@redhat.com>
 <e0d11b2c-7b1c-c968-feb2-675a8c98c7a4@suse.de>
 <ec296129-2c4d-fd74-d044-50c470e29609@redhat.com>
 <cd4caf9d-c32c-25fd-a27f-d352ece74ed3@redhat.com>
 <CAFEAcA8YybFf1=wQ7-scC2JnQEHr9nx0LBvt16dTBOXV0KuMAg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <28540fd5-3bd3-30d7-624d-da21d0f39806@redhat.com>
Date: Thu, 18 Mar 2021 12:31:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8YybFf1=wQ7-scC2JnQEHr9nx0LBvt16dTBOXV0KuMAg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/21 12:21 PM, Peter Maydell wrote:
> On Thu, 18 Mar 2021 at 11:09, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>> Still, I'm not sure it makes sense. If you want to migrate a such
>> machine, KVM can not virtualize it, so you'll be forced to use TCG
>> right? In that case cpu_tcg is built in and you have the A15.
>>
>> IOW the problem is not this patch, it is that since 82bf7ae84ce we
>> can not migrate A15.
> 
> Do you mean "we can't migrate a TCG A15" ? That would be a problem.

No problem here.

> Or do you mean "we can't migrate a KVM A15" ? That's entirely
> expected when we drop support for KVM A15 :-)

Yes, this is why I mentioned this is mostly a problem for downstream
distributions.

> Or do you mean "migration from KVM to TCG doesn't work?" That's
> a pre-existing thing I don't expect to work (we don't put anything
> in to stop it working, but I'm pretty sure there will be a bunch
> of things that mean it doesn't in practice work.)
> 
>> So we need both 1/ revert 82bf7ae84ce and 2/ be sure the kernel
>> support 32-bit host... Am I missing something?
> 
> We're definitely not reverting 82bf7ae84ce if we can avoid it...

I tend to agree. The problem is for the running VMs started before
82bf7ae84ce (so up to any fork based on v5.2). I don't know what
the forks are supposed to do with the running VMs if they want to
migrate them to newer QEMU (or upgrade the host QEMU).

I don't expect a guest being happy and reliable if we underneath
change its CPU by another one while migrating it...

KVM to TCG is not tested much indeed, and I don't think the performance
impact will be well accepted :)



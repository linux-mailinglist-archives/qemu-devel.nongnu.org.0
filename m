Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B02802D7E7C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 19:49:41 +0100 (CET)
Received: from localhost ([::1]:50110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knnU4-0004dY-Mm
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 13:49:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knn8K-0004cN-LS
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 13:27:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knn8H-0003nv-Ez
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 13:27:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607711227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KnjYxjfWG6qV0ZuUlZC9+NCBvHB/nJnplkvTXDh32hk=;
 b=VuWhDTs4Fy6vTsxZGOYzmGhcXU71JWxaIHSzIXMmOzLZ2roDhGHEGQPhXGiC/f7cfBtKM/
 hsBqJ55Fv4TR7YF6gBcy+5VuUROwa2qqqZ+VOd3qqRAktzYZjzg80TlS9FoHx3wM7ns/Zv
 nH4EUcl5oD8MG62XjhIa8Igda51jZaI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-y3fLTPAyNAavfxTnFHwIDQ-1; Fri, 11 Dec 2020 13:27:04 -0500
X-MC-Unique: y3fLTPAyNAavfxTnFHwIDQ-1
Received: by mail-ej1-f71.google.com with SMTP id u25so3082102ejf.3
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 10:27:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KnjYxjfWG6qV0ZuUlZC9+NCBvHB/nJnplkvTXDh32hk=;
 b=bAMkJ/EFYlHntbcc95bMVtvuX9agVu/z8BmABScDPuIiWMtB53ZsX8zOThcNq9zmzt
 cys03/3cMzhF/ksl/Ki4VGNHZmd4eaC6Wkj3NIvVsqK9mB2TPGHv2nLi554hrSGk2ChP
 unl6v4o5XaN8bjPXPVZ7WHGlhdA3mJMgf8U8uzTBR6geuFVv8NLl19G06Rqc4EvZQGzm
 Hn/go5mDeOmAj8F7P+JRPQxOtLggiGLtR+p9XJ3M5BOrRqwLqmB24Ym/2mwtTFl1QYn7
 DqefvBzgGcZH6XF33c++vvpzA9yTtIl+FJ0+3F4oSulq95wN5wRag009kET7ZvyZc0eh
 VAQA==
X-Gm-Message-State: AOAM533pR646YA/ahlfSXP3RA378yRZSCO3v+/jtCdvokXv6oa+foRBu
 bTaVsr3/o9xFZt4G0qcFbl0J9XnIk9hqKqPWzhm+YTTOODTe9mMHI8gbT92HBul7vCe5TX3mh7f
 iTygE/+UStU0w4hM=
X-Received: by 2002:a17:906:ae55:: with SMTP id
 lf21mr12049030ejb.101.1607711222795; 
 Fri, 11 Dec 2020 10:27:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxFewaXz6JIHqwtlHbkb6eY9yiIEL1ayIjQhOhsls87uksK4R9zsAk66/oscmtw3h2v0jOyOw==
X-Received: by 2002:a17:906:ae55:: with SMTP id
 lf21mr12048996ejb.101.1607711222578; 
 Fri, 11 Dec 2020 10:27:02 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id b11sm8389460edk.15.2020.12.11.10.27.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 10:27:01 -0800 (PST)
Subject: Re: [PATCH v11 18/25] cpu: Move synchronize_from_tb() to tcg_ops
To: Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>
References: <20201211083143.14350-1-cfontana@suse.de>
 <20201211083143.14350-19-cfontana@suse.de>
 <78a7119d-1b4b-47dc-8f16-510708c9fcd4@linaro.org>
 <cca08e8d-9235-46da-3610-8acafbc2de14@suse.de>
 <15b884b7-94e4-1476-f883-e84379b2661e@linaro.org>
 <5d9457df-c7c6-dd61-bbd7-1563d29102f8@suse.de>
 <946cb717-d1f3-5b30-5622-0126437420d7@suse.de>
 <b7db8e36-f623-a090-a19a-644b02c3cd76@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6c117162-7b6d-14bc-9d6e-f5169d7d1e31@redhat.com>
Date: Fri, 11 Dec 2020 19:26:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <b7db8e36-f623-a090-a19a-644b02c3cd76@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 7:22 PM, Richard Henderson wrote:
> On 12/11/20 12:15 PM, Claudio Fontana wrote:
>> Should I return this file to the original state (without the extra #includes that pretend it to be a standalone header file,
>> and call it
>>
>> tcg-cpu-ops.h.inc
>>
>> ?
> 
> If this header can work with qemu/typedefs.h, then no, because the circularity
> has been resolved.  Otherwise, yes.

My editor got confused with TranslationBlock, which is why I asked
to include its declaration.

Easier to forward-declare TranslationBlock in qemu/typedefs.h?

Regards,

Phil.



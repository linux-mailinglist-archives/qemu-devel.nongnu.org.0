Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCB56C4F98
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 16:41:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf0ZW-0000uN-Ra; Wed, 22 Mar 2023 11:40:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pf0ZN-0000r7-5Z
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:40:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pf0ZK-0001Lj-O3
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:40:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679499604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gFCkAPo26od6h1m/cZd8bvD7ikgAk8sWGPbnWs2XRg4=;
 b=VtRrb3ZolwsALCrmhEozqMUezYme8btYRtUMUeV6cCBgZJT5id4XDO4y6ruFHZCYUoSGPJ
 5XU4bp7xWwTgZeyDEKmIifouBjcwHURcxFHWHj8K72sSdyDdUJEM2sYaWCKXcNQbBC93w2
 AxkfvcGg9zvHA1ek6MJbk2ic1ZK2gBA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-aW5ser7IOMSokfAwM38R3Q-1; Wed, 22 Mar 2023 11:40:02 -0400
X-MC-Unique: aW5ser7IOMSokfAwM38R3Q-1
Received: by mail-ed1-f70.google.com with SMTP id
 r19-20020a50aad3000000b005002e950cd3so28020524edc.11
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 08:40:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679499600;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gFCkAPo26od6h1m/cZd8bvD7ikgAk8sWGPbnWs2XRg4=;
 b=INealHcX1dtXcCCmvheJ36AS40UHOg7Z096s5Sf0MW/xiNLSmUfuHFOogxRgl6cDQJ
 9XN3KNCtL9Wu+iKIYwIa38vnXjOrNjkeU52umO5q5TFNyL3DUbPf4FPDTGwE+NcD0trn
 N4ZuQAlmnthfIfOj77Qr42G9val0o/wwluZQ/4NrIlUa4vfuKnJ1090JGVh/ajVRe45S
 03qW7YscnAFHvprex/tECWDrJ7PovyVEffOP3fHGtbJqYSc5x0w8Euob4l4dCfRetaxB
 Km/DfgZIZS3va2gOvvkDsdhvUN9LmyZl3yTgC0LyeZcTycRws7TwNXHwGzrn8zaB+gEO
 K0cQ==
X-Gm-Message-State: AO0yUKV55uq4bG+uss8Xv+wqw6ubjieYtDFdwuXbC40pR3NRH7IasUyR
 Rjdo3gKkPLw5ii9kYgJQFwmni9zkdIG97DamMNoM+ncFgua2Zo/w8gYk6Yx7f4KMWFeCvYXiolA
 m8XmQoaAkEAFTnQQ=
X-Received: by 2002:a17:906:4dc4:b0:931:c077:2b63 with SMTP id
 f4-20020a1709064dc400b00931c0772b63mr2995447ejw.17.1679499600303; 
 Wed, 22 Mar 2023 08:40:00 -0700 (PDT)
X-Google-Smtp-Source: AK7set8JUWHea2nuJwZ0F1AUJrX+1kx38GQpJxaZbVu+x6ducCPEiLW5yMEpb9BoG+Am7os9Tbbqlw==
X-Received: by 2002:a17:906:4dc4:b0:931:c077:2b63 with SMTP id
 f4-20020a1709064dc400b00931c0772b63mr2995430ejw.17.1679499600060; 
 Wed, 22 Mar 2023 08:40:00 -0700 (PDT)
Received: from ?IPV6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.googlemail.com with ESMTPSA id
 v2-20020a1709064e8200b008d9ddd2da88sm7390203eju.6.2023.03.22.08.39.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 08:39:59 -0700 (PDT)
Message-ID: <e5f7dc9a-4116-9ffc-670b-c2a6180b1164@redhat.com>
Date: Wed, 22 Mar 2023 16:39:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [qemu-web PATCH] add post about plans for Python venvs
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, jsnow@redhat.com, berrange@redhat.com
References: <20230322151529.1020525-1-pbonzini@redhat.com>
 <CAFEAcA8U0bW72SWMK7k0tiFOMMZbk5Cd6kX=SwKFxqiLe0+YEw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA8U0bW72SWMK7k0tiFOMMZbk5Cd6kX=SwKFxqiLe0+YEw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 3/22/23 16:18, Peter Maydell wrote:
> On Wed, 22 Mar 2023 at 15:15, Paolo Bonzini<pbonzini@redhat.com>  wrote:
>> +Some of these tools are run through the `python3` executable, while others
>> +are invoked directly as `sphinx-build` or `meson`, and this can create
>> +inconsistencies.  For example, QEMU's `configure` script checks for a
>> +minimum version of Python and rejects too-old interpreters.  What would
>> +happen if code run via Sphinx or Meson used a different version?
> ...this is why configure also separately checks that when you run sphinx
> it is executing with a new enough Python version.

Point taken, though "new enough" is not "the same version" used by 
--python or $PYTHON.  I will tweak the end of the introduction as follows:

====
As a result, even if `configure` is told to use `/usr/bin/python3.8` for 
the build, QEMU's custom Sphinx extensions would still run under Python 
3.6.  configure does separately check that Sphinx is executing with a 
new enough Python version, but it would be nice if there were a more 
generic way to prepare a consistent Python environment.

This post will explain how QEMU 8.1 will ensure that a single 
interpreter is used for the whole of the build process.  Getting there 
will require some familiarity with Python packaging, so let's start with 
virtual environments.
====

Paolo



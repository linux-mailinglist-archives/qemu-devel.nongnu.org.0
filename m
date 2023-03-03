Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E6D6A9FDA
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 20:05:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYAgs-00031s-D5; Fri, 03 Mar 2023 14:03:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pYAgq-00031K-Mp
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 14:03:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pYAgo-00078q-Mh
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 14:03:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677870212;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=EoeGSvGYQgBfv6KiYLbuLb6qsOA/qRndYJhU7YOb8Hg=;
 b=gJr5QjtSpg0+LXg4jEA+uE+CY6WXeQURGm9xOMY390rZhHk58YVg8gLLpzkP1OCs0YIsSa
 9BYu/vkBQUhBUsXnPTrSWhJLMQwGnHsOqQn/qDi2MqaFVPG/Flqv5RQBvvc9Ty3HzFdYoV
 NNzMQX11Bqgdkh97+t8R0JZ9oZOjcQU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-29-QXDn-FM6OKO1-oxptl7pWw-1; Fri, 03 Mar 2023 14:03:31 -0500
X-MC-Unique: QXDn-FM6OKO1-oxptl7pWw-1
Received: by mail-wm1-f71.google.com with SMTP id
 z6-20020a05600c220600b003e222c9c5f4so1287588wml.4
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 11:03:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677870209;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EoeGSvGYQgBfv6KiYLbuLb6qsOA/qRndYJhU7YOb8Hg=;
 b=HyyoJZl6nqgNNpO7tOSAp52t3awDnsgpSrQSaq93s+gqLNDqSKIV/SaxcZOZI604wA
 hadavQsnWeh3V8dsM+zFZgl8JYl+L2JFFPg7mIa9hJqcds56UHgJlC1FcPXT2xhtMKUl
 VFWm4t7KC82KhTXRybyN4ouajHulplSd5+1lmnHuox7HuAno2sRhwY/9b37JVgUnsxeW
 v9ajierj8E9a58cCZQn36HDqZWOvHG1MLff6QnJ7S2EeN7b4Br6uCHPLwaAMCwp8zta3
 MAp2EKKaZ8qOTAzSubX352NMUcv15bakDcYjvtz8A07/0HqRMZKpKfKwRAju9AEbU34H
 4lKg==
X-Gm-Message-State: AO0yUKUh5YAkBYsnZrJ+oYTmdQDrCE2HpAbMnovCjgktCNcdBp6SrRO6
 oCUJGwgnlmQ5MspyGUknXALAFDJVLmYxf9euPhlEcbZvB+NuD96IznKqX7Ne2AIscw4d/dTOYEM
 u0Rc3kQOH895u3hs=
X-Received: by 2002:a5d:4f0c:0:b0:2c7:a9ec:3 with SMTP id
 c12-20020a5d4f0c000000b002c7a9ec0003mr2079573wru.65.1677870209542; 
 Fri, 03 Mar 2023 11:03:29 -0800 (PST)
X-Google-Smtp-Source: AK7set8dvyP8j+it43JlICl4IySNDhCVZHqdKdS0wfvdHwm2i+yWEM/qQG3jzqrkAZB3H4HjJwj8xA==
X-Received: by 2002:a5d:4f0c:0:b0:2c7:a9ec:3 with SMTP id
 c12-20020a5d4f0c000000b002c7a9ec0003mr2079565wru.65.1677870209224; 
 Fri, 03 Mar 2023 11:03:29 -0800 (PST)
Received: from redhat.com ([47.63.153.28]) by smtp.gmail.com with ESMTPSA id
 j14-20020a5d564e000000b002cde25fba30sm2940616wrw.1.2023.03.03.11.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 11:03:28 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>
Subject: Re: [PATCH] test: Fix test-crypto-secret when compiling without
 keyring support
In-Reply-To: <029b545a-e814-5917-0a3f-edc578844dbe@redhat.com> (Thomas Huth's
 message of "Fri, 3 Mar 2023 13:47:40 +0100")
References: <20230301110058.1255-1-quintela@redhat.com>
 <029b545a-e814-5917-0a3f-edc578844dbe@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 03 Mar 2023 20:03:27 +0100
Message-ID: <87wn3xhd34.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Thomas Huth <thuth@redhat.com> wrote:
> On 01/03/2023 12.00, Juan Quintela wrote:
>> Linux keyring support is protected by CONFIG_KEYUTILS.
>> Use CONFIG_SECRET_KEYRING.
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>> Previous version of this patch changed the meson build rules.
>> Daniel told me that the proper fix was to change the #ifdef test.
>> ---
>>   tests/unit/test-crypto-secret.c | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> This seems to cause failures in the CI:
>
> https://gitlab.com/thuth/qemu/-/jobs/3870672310#L1443
> https://gitlab.com/thuth/qemu/-/jobs/3870672331#L2353

What is your configuration?
Here (Fedora 37) it works perfectly with --enable/disable-keyring.
But I have installed keyutils-libs-devel, and it appears that there is
no way to disable keyutils support through the command line.

/me removes package and retries.


> ../tests/unit/test-crypto-secret.c:29:10: fatal error: keyutils.h: No such file or directory
>    29 | #include <keyutils.h>
>       |          ^~~~~~~~~~~~
> compilation terminated.
>
> And when building locally, I got:
>
> FAILED: tests/unit/test-crypto-secret
> tests/unit/test-crypto-secret.p/test-crypto-secret.c.o: In function `test_secret_keyring_expired_key':
> ../../devel/qemu/tests/unit/test-crypto-secret.c:194: undefined reference to `add_key'
> ../../devel/qemu/tests/unit/test-crypto-secret.c:197: undefined reference to `keyctl_set_timeout'
> ../../devel/qemu/tests/unit/test-crypto-secret.c:212: undefined reference to `keyctl_unlink'
> tests/unit/test-crypto-secret.p/test-crypto-secret.c.o: In function `test_secret_keyring_revoked_key':
> ../../devel/qemu/tests/unit/test-crypto-secret.c:169: undefined reference to `add_key'
> ../../devel/qemu/tests/unit/test-crypto-secret.c:172: undefined reference to `keyctl_revoke'
> ../../devel/qemu/tests/unit/test-crypto-secret.c:186: undefined reference to `keyctl_unlink'
> tests/unit/test-crypto-secret.p/test-crypto-secret.c.o: In function `test_secret_keyring_good':
> ../../devel/qemu/tests/unit/test-crypto-secret.c:141: undefined reference to `add_key'
> ../../devel/qemu/tests/unit/test-crypto-secret.c:155: undefined reference to `keyctl_unlink'
> collect2: error: ld returned 1 exit status
>
>  Thomas



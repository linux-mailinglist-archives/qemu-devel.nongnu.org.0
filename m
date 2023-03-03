Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8A56AA036
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 20:41:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYBHC-0001mO-KO; Fri, 03 Mar 2023 14:41:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pYBH6-0001kv-V2
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 14:41:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pYBH3-0002CJ-GY
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 14:41:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677872460;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jd72AudbeFgEUJOTJo0qaMv/Sav7gTZxNzWvul6PjFc=;
 b=HQWnkcV6MqAJufPk7JuO/dq3lFuQC8qyvJdSZz4RjPl3ZgM5WC7u7kZKIY8ElpIRVOUqcG
 hr4DTNZ87//9fmBJ4jdfiLItny3ipjuJqVhHF4HO2td18sncxRTlHptmkJQuY3BzjVdiId
 QUIqOWRWqVgXhSzgH4PaA5h4M8XQvpE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-SjaxZEkwP7-1747GdVuWvA-1; Fri, 03 Mar 2023 14:40:59 -0500
X-MC-Unique: SjaxZEkwP7-1747GdVuWvA-1
Received: by mail-wm1-f69.google.com with SMTP id
 bi21-20020a05600c3d9500b003e836e354e0so1447882wmb.5
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 11:40:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677872457;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jd72AudbeFgEUJOTJo0qaMv/Sav7gTZxNzWvul6PjFc=;
 b=bhWfYIYzS4Ecna+4EDiAOC4nUa+PDOc7LJmix1MyzxhKtQhrc13rf5Wrm4qFI5m7zd
 seodhentFFCgDazDqHW709QqPLRtTXx8DOx/hLhxc8K6s/331/Q7r3kLLG0McvTJKQ+3
 XdC1b8t4DHbBNU0th24WykDcQOlEGHVbCGSqXqaS09HuvR6YhZ4d0ANza/TW7eckXwmL
 7Lb0d9IWGXrzZKiovkNT1dcfn6fzKkkOGHse0JbgoCSnd/0050blsvQyYoTJFGT336RN
 IE+KAbZfsqhTVFBufigIf3hxm6xcVm2OMxORbRGw8qn60z2zYYeLt8Fq4NQT4Q9eDyA8
 ma1Q==
X-Gm-Message-State: AO0yUKWhtGC/7ozojpdST1IuUXNVg+olbifu9Q+vDDYFBKY9Sv1mK4Jd
 EmDxhCvyutHjeQ9Sf0R8ZqaUXkd8IuDIB5Pr0ef2SvvwkAzG86KJ6d5IlLhboQZG0U5jKg6Ko5K
 Xa7pEdjMwcuoyd+I=
X-Received: by 2002:a05:600c:4fc2:b0:3eb:37ce:4c3e with SMTP id
 o2-20020a05600c4fc200b003eb37ce4c3emr2738783wmq.16.1677872457781; 
 Fri, 03 Mar 2023 11:40:57 -0800 (PST)
X-Google-Smtp-Source: AK7set88bPiqr2wqwUyGhUCKmtO52RgONsMce+hJoBhHGm0YT71wBELHWGVzbHtCLQ2lIwG06/Unyg==
X-Received: by 2002:a05:600c:4fc2:b0:3eb:37ce:4c3e with SMTP id
 o2-20020a05600c4fc200b003eb37ce4c3emr2738773wmq.16.1677872457516; 
 Fri, 03 Mar 2023 11:40:57 -0800 (PST)
Received: from redhat.com ([47.63.153.28]) by smtp.gmail.com with ESMTPSA id
 r3-20020a1c2b03000000b003e9ae2a8cbfsm3594871wmr.2.2023.03.03.11.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 11:40:57 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,  qemu-devel@nongnu.org
Subject: Re: [PATCH] test: Fix test-crypto-secret when compiling without
 keyring support
In-Reply-To: <ZAHvWGvHLXp1OLL5@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Fri, 3 Mar 2023 13:00:08 +0000")
References: <20230301110058.1255-1-quintela@redhat.com>
 <029b545a-e814-5917-0a3f-edc578844dbe@redhat.com>
 <ZAHvWGvHLXp1OLL5@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 03 Mar 2023 20:40:56 +0100
Message-ID: <87sfelhbcn.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> On Fri, Mar 03, 2023 at 01:47:40PM +0100, Thomas Huth wrote:
>> On 01/03/2023 12.00, Juan Quintela wrote:
>> > Linux keyring support is protected by CONFIG_KEYUTILS.
>> > Use CONFIG_SECRET_KEYRING.
>> >=20
>> > Signed-off-by: Juan Quintela <quintela@redhat.com>
>> >=20
>> > ---
>> >=20
>> > Previous version of this patch changed the meson build rules.
>> > Daniel told me that the proper fix was to change the #ifdef test.
>> > ---
>> >   tests/unit/test-crypto-secret.c | 10 +++++-----
>> >   1 file changed, 5 insertions(+), 5 deletions(-)
>>=20
>> This seems to cause failures in the CI:
>>=20
>> https://gitlab.com/thuth/qemu/-/jobs/3870672310#L1443
>> https://gitlab.com/thuth/qemu/-/jobs/3870672331#L2353
>>=20
>> ../tests/unit/test-crypto-secret.c:29:10: fatal error: keyutils.h: No su=
ch file or directory
>>    29 | #include <keyutils.h>
>>       |          ^~~~~~~~~~~~
>> compilation terminated.
>
> Hmm, so we actually have to test for both #ifdefs then

Yeap.

I was trying to do something "clever":

diff --git a/meson.build b/meson.build
index 77d2ae87e4..01f3227d62 100644
--- a/meson.build
+++ b/meson.build
@@ -2309,6 +2309,7 @@ config_host_data.set('CONFIG_USBFS', have_linux_user =
and cc.compiles('''
   int main(void) { return 0; }'''))
=20
 have_keyring =3D get_option('keyring') \
+  .require(keyutils.found(), error_message: 'keyring requires keyutils lib=
raries') \
   .require(targetos =3D=3D 'linux', error_message: 'keyring is only availa=
ble on Linux') \
   .require(cc.compiles('''
     #include <errno.h>
(test-secret *)$=20

But it is only the test what requires CONFIG_KEYUTILS,
crypto/secret_keyring.c don't needs it, so we need to do both ifdefs.

> With regards,
> Daniel



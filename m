Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7B26C8360
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 18:31:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pflET-00072J-QS; Fri, 24 Mar 2023 13:29:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pflER-000729-Ck
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 13:29:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pflEP-0005ce-6Q
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 13:29:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679678975;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Em7ZZ0Kv2Cnq16ZoEWMoZzJ/lQe69W553Im+HxzSxKs=;
 b=RLiRRNZiYNtFEJi0Bp1tyb5ul82yqlP/XETVnsmdeNKaygzPCKr2X8xw3k29z8qcCCyoL1
 /c8IOeleHABLQMwVxB3SL++yTs+z581dQ4zueg1vlYWFJOe8MUceoPASHWyJTYbonUduVn
 hqQo+T8xPHTg/bhbhtZWBmkgwkK6DOI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-245-gsCKHGTwNge5-wZAbbQ44Q-1; Fri, 24 Mar 2023 13:29:34 -0400
X-MC-Unique: gsCKHGTwNge5-wZAbbQ44Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 bh19-20020a05600c3d1300b003ee93fac4a9so2521833wmb.2
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 10:29:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679678973;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Em7ZZ0Kv2Cnq16ZoEWMoZzJ/lQe69W553Im+HxzSxKs=;
 b=t6XWzNsG85zLHFFlyOC4jCf62/cDrKijrcyAIT3rpA6fhjZrjBu/n5mntXceGhDXj2
 SCo07fnRHPaW+ATAH+9HopYzNTbI8gaKLNNVLaJU9qddE1SsE0drbf7l3HsFZJzrAs/h
 MHVowHDtSVydH3xN+dZp4ANzLFtsI9JMwqQtv8ZOqG8xdrHdAC0TJaFyQhDOHbQXZyo6
 wQMQ4HDiFrnWdgssATUjJrwHFAvU2f+jLa7BjLMlBBNkhbFbGK8Msc4tBf9YlGPvDQTx
 4/2HfeucqcxEK7Qwhol8A7cRPo4DEl1Ll7jVuvE0mOvluSu3bHE3oWFOYuYDyU3D3Rps
 4rdQ==
X-Gm-Message-State: AO0yUKUMurKbfckRBPfxU9JRfVQOWhqfuLQajWNFXjd4FrkYDav3cYCo
 nO5z8LljiaMpwZ/ne+ipCT0RmdPEzxCSmMIW2nKJLK5BaUgHw57CbVkrPTB9rfCScxMaraXmOy2
 EhcSB2HBylnbUMC8=
X-Received: by 2002:a05:600c:214c:b0:3ed:358e:c1ec with SMTP id
 v12-20020a05600c214c00b003ed358ec1ecmr3041292wml.0.1679678973082; 
 Fri, 24 Mar 2023 10:29:33 -0700 (PDT)
X-Google-Smtp-Source: AK7set8HxoEnAvRKCgp/IvuUcmSTcfApjs6LW2VZ+p0ZS8clqSiWRNGz2tQcWIbqyMRGIxq1MnLUmw==
X-Received: by 2002:a05:600c:214c:b0:3ed:358e:c1ec with SMTP id
 v12-20020a05600c214c00b003ed358ec1ecmr3041276wml.0.1679678972785; 
 Fri, 24 Mar 2023 10:29:32 -0700 (PDT)
Received: from redhat.com ([47.60.41.136]) by smtp.gmail.com with ESMTPSA id
 fc18-20020a05600c525200b003ee0eb4b45csm400013wmb.24.2023.03.24.10.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 10:29:32 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,  Markus Armbruster
 <armbru@redhat.com>
Subject: Re: [PATCH] qtests: avoid printing comments before g_test_init()
In-Reply-To: <8df76c27-89b5-baee-9738-9b7585ae01e0@redhat.com> (Thomas Huth's
 message of "Fri, 24 Mar 2023 08:34:13 +0100")
References: <20230317170553.592707-1-berrange@redhat.com>
 <871qlfmi9q.fsf@secure.mitica>
 <8df76c27-89b5-baee-9738-9b7585ae01e0@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 24 Mar 2023 18:29:27 +0100
Message-ID: <87ttyakqh4.fsf@secure.mitica>
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

Thomas Huth <thuth@redhat.com> wrote:
> On 23/03/2023 19.31, Juan Quintela wrote:
>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
>>> The TAP protocol version line must be the first thing printed on
>>> stdout. The migration test failed that requirement in certain
>>> scenarios:
>>>
>>>    # Skipping test: Userfault not available (builtdtime)
>>>    TAP version 13
>>>    # random seed: R02Sc120c807f11053eb90bfea845ba1e368
>>>    1..32
>>>    # Start of x86_64 tests
>>>    # Start of migration tests
>>>    ....
>>>
>>> The TAP version is printed by g_test_init(), so we need to make
>>> sure that any methods which print are run after that.
>>>
>>> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>>> ---
>> Reviewed-by: Juan Quintela <quintela@redhat.com>
>>=20
>>> -    const bool has_kvm =3D qtest_has_accel("kvm");
>>> -    const bool has_uffd =3D ufd_version_check();
>>> -    const char *arch =3D qtest_get_arch();
>>> +    bool has_kvm;
>>> +    bool has_uffd;
>>> +    const char *arch;
>> Why don't you move also the declarations of the variables?
>> I think that one of the biggest troubles of C is variables that are not
>> initialized.
>> All compilers that we support are C99 or later, so we can do that
>> (and
>> we already do in lot of places.)
>
> I think the coding style has been created before we switched to
> -std=3Dgnu99 for compiling QEMU, so a lot of GCCs were still using C89
> by default?

Yes, that is the actitude.

I got sick when I see new code that still does:

char *foo =3D (char *)malloc(...);

It is is C89, it has been enough to know that it is not needed.

And yes, that particular one is not used in qemu anymore, but:

void *opaque;

....

Foo *foo =3D (Foo *)opaque;

Is still introduced in new code, and it is not needed since C89.

>> And yeap, I know that CodingStyle says otherwise, but I think that what
>> is wrong is CodingStyle.
>> https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg03836.html
>
> Please use proper prefixes in the subject when sending patches
> ("docs/devel:" here), otherwise your patches might not get the right
> attention (at least on my side, it was filtered away as a patch that
> was relevant to me) - and also put some recent contributors on CC:

I didn't knew the docs/devel preffix.

About the CC'd, I expected that git-publish be good enough at doing
that, but it appears not.

Anyways, thanks.

Later, Juan.



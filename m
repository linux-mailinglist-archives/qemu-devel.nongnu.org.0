Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 738CA6C7038
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 19:32:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfPiu-0006Qu-VK; Thu, 23 Mar 2023 14:31:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pfPit-0006QS-E6
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 14:31:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pfPir-0007zb-Bz
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 14:31:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679596294;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=90vRAU1/sgXoAh5vQQeuQPE4Ptc1QFKs/W63PJzc314=;
 b=XtnePafyMDqsAzcO0U40S9fNv2orTh01L8nuGgEwiPPf8kCwYOnICEWraElY191tWu7a5W
 qpMaHXo5qbKOqy6Tb/4/6hSlojMrNSdy5Ill7FiVoeYK363QmX2oXUmqLh0W8BLdfzKvoX
 CHbomD4Pw6Wv+rTStwaDLTZnxEw9AOY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-333-7cKRgplwMs6I0TGdf4tMBg-1; Thu, 23 Mar 2023 14:31:32 -0400
X-MC-Unique: 7cKRgplwMs6I0TGdf4tMBg-1
Received: by mail-wm1-f71.google.com with SMTP id
 bh19-20020a05600c3d1300b003ee93fac4a9so1055806wmb.2
 for <qemu-devel@nongnu.org>; Thu, 23 Mar 2023 11:31:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679596292;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=90vRAU1/sgXoAh5vQQeuQPE4Ptc1QFKs/W63PJzc314=;
 b=4gGjmFxhnOePk5ZJxhcFrJXuCp1mSbPJusUyCjj5hUnQ3Y7Uy+dIUMxlszKs1aXeYG
 JJYvLTo5z8FZbSHkB0wsbDCrPdp1INuadIU5akAvuvL3D/FqW0qzB2BPLSEnSnLo8RoI
 sKN/fqYjFBk0pK1bCPYw993sJlRtB0f1t73jur7TBRSuwMAvDUW7wqcN74MfmaKjllOd
 4Oj0Lub5cpX2Y7NmjaDQq9UF03KarcidMPOWr1x3vkV5bxyCLdjL1BDlaqQpMknt5DHh
 S6M9roBr+g3jmFJn6cvNauEXjhcQH/zkXPn7yhio+EPy0J26ampCQxmMufF90l1ixYEn
 7K9g==
X-Gm-Message-State: AAQBX9e2spM9SRET6d9PZX18+j1tNw7PDfpq6yd1L08qaxJ6hgBetWsZ
 v1T1qsi3/OnIXZcAmO/egsbVVQpDX+yVavkCuu1BCeQ3AC7SOa3KctHFvSk5iewSGXKYutNQCaY
 J3hISivBP+DYBX58=
X-Received: by 2002:adf:de08:0:b0:2d4:5117:f4b with SMTP id
 b8-20020adfde08000000b002d451170f4bmr3371175wrm.26.1679596291928; 
 Thu, 23 Mar 2023 11:31:31 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZprjT2szATqB8N/HSFF/0ZopPwLqftT7aGbstkXU90vmTf4wNyeBT61UkAsixtHSlstsp2TQ==
X-Received: by 2002:adf:de08:0:b0:2d4:5117:f4b with SMTP id
 b8-20020adfde08000000b002d451170f4bmr3371162wrm.26.1679596291698; 
 Thu, 23 Mar 2023 11:31:31 -0700 (PDT)
Received: from redhat.com ([77.211.5.130]) by smtp.gmail.com with ESMTPSA id
 v15-20020a5d590f000000b002cfec8b7f89sm16861162wrd.77.2023.03.23.11.31.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Mar 2023 11:31:30 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  Laurent Vivier <lvivier@redhat.com>,  Thomas
 Huth <thuth@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,  "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH] qtests: avoid printing comments before g_test_init()
In-Reply-To: <20230317170553.592707-1-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Fri, 17 Mar 2023 17:05:53
 +0000")
References: <20230317170553.592707-1-berrange@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 23 Mar 2023 19:31:29 +0100
Message-ID: <871qlfmi9q.fsf@secure.mitica>
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
> The TAP protocol version line must be the first thing printed on
> stdout. The migration test failed that requirement in certain
> scenarios:
>
>   # Skipping test: Userfault not available (builtdtime)
>   TAP version 13
>   # random seed: R02Sc120c807f11053eb90bfea845ba1e368
>   1..32
>   # Start of x86_64 tests
>   # Start of migration tests
>   ....
>
> The TAP version is printed by g_test_init(), so we need to make
> sure that any methods which print are run after that.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---

Reviewed-by: Juan Quintela <quintela@redhat.com>

> -    const bool has_kvm =3D qtest_has_accel("kvm");
> -    const bool has_uffd =3D ufd_version_check();
> -    const char *arch =3D qtest_get_arch();
> +    bool has_kvm;
> +    bool has_uffd;
> +    const char *arch;

Why don't you move also the declarations of the variables?
I think that one of the biggest troubles of C is variables that are not
initialized.

All compilers that we support are C99 or later, so we can do that (and
we already do in lot of places.)

And yeap, I know that CodingStyle says otherwise, but I think that what
is wrong is CodingStyle.

https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg03836.html

Later, Juan.



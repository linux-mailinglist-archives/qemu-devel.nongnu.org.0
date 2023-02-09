Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0558690860
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 13:12:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ5mj-00086i-Si; Thu, 09 Feb 2023 07:12:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQ5mh-00086N-Vu
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 07:12:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQ5mg-0002Zm-0m
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 07:12:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675944733;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=gBuwSjRANvfiweFg8pVwL8BlLuU2P7A08EQ4vpQsDME=;
 b=Eu+M9T7Ecm7bPT4g5k5aE8DjIXVKJo6risogtcHUeAAHJeOtV6kg5oue4vCPWMIzrXBrJW
 TJQctE8UKR/yNMJI4M1xPd//IZJFm2dUaRe/ay24Ak3zPokCdhkJ0lNKhtK5sKPRuLlTSl
 SEa5VOb5g9/esIQc0dJqRrpu+gWqHDM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-358-mis-v0tONkSprCrAMjArcw-1; Thu, 09 Feb 2023 07:12:12 -0500
X-MC-Unique: mis-v0tONkSprCrAMjArcw-1
Received: by mail-wm1-f70.google.com with SMTP id
 j20-20020a05600c1c1400b003dc5dd44c0cso967351wms.8
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 04:12:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gBuwSjRANvfiweFg8pVwL8BlLuU2P7A08EQ4vpQsDME=;
 b=43GfzraTqLBNCmLH96bS9QqALMGddXwDApDMudmWL+jlBU/KJvfcAI19lHZI2s3RT2
 +ZopZeEFVS9XlCWzyMKLRmZltCY1RPl6Ak7TpFIxRDKlgcmzIxc6i5OkNWK0xHJMUhkF
 m1FFkw/MXSGyAOQgHqsld4Y1mkBAo1SukeTt4gh4QiH6aNnu9Eu5UlJG9ahFtuky0tr+
 VPbJdVL5xdh15UEHiPee+o9mTyHadypaKhY7Xm5719r1wX0lKHquQ/D7pW842DDHYKlc
 YUrD+5jfZVnHqS1Bt6wMYEZLP3dWTAsuD7TrQk+sNbJncc8bkABnfDABIJ1Eds7Gba29
 Df5w==
X-Gm-Message-State: AO0yUKX+2HByzooQkLVH+1i4oxn7C7xEMfS3GPZ9W0RKI4yhJ8yB7Q6M
 XpGdHEItGg3gbl3Wuh6TjLUFxA8hudDRhsbVNm/HCdMBMi4a/TJx3JvihnIOJdJxD/1PQADQHJJ
 mT7u99aybEV+Qo3o=
X-Received: by 2002:a05:600c:920:b0:3dc:5390:6499 with SMTP id
 m32-20020a05600c092000b003dc53906499mr9906776wmp.1.1675944730910; 
 Thu, 09 Feb 2023 04:12:10 -0800 (PST)
X-Google-Smtp-Source: AK7set86YfF7FyG3XfEYBy6zmJ6FP/azSId1MTwPzU4IFiEBQb0lLeTo44bZluO+r27kp0Uvarv7Qw==
X-Received: by 2002:a05:600c:920:b0:3dc:5390:6499 with SMTP id
 m32-20020a05600c092000b003dc53906499mr9906755wmp.1.1675944730719; 
 Thu, 09 Feb 2023 04:12:10 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 f5-20020adff445000000b002c53f5b13f9sm344263wrp.0.2023.02.09.04.12.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 04:12:09 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Het Gala <het.gala@nutanix.com>,  qemu-devel@nongnu.org,
 prerna.saxena@nutanix.com,  dgilbert@redhat.com,  pbonzini@redhat.com,
 berrange@redhat.com,  eblake@redhat.com,  manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
Subject: Re: [PATCH v2 1/6] migration: moved hmp_split_at_commma() helper
 func to qapi-util.c file
In-Reply-To: <87y1p73v6u.fsf@pond.sub.org> (Markus Armbruster's message of
 "Thu, 09 Feb 2023 13:00:25 +0100")
References: <20230208093600.242665-1-het.gala@nutanix.com>
 <20230208093600.242665-2-het.gala@nutanix.com>
 <87y1p73v6u.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 09 Feb 2023 13:12:09 +0100
Message-ID: <87sfff597q.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

Markus Armbruster <armbru@redhat.com> wrote:
> Het Gala <het.gala@nutanix.com> writes:
>
>> renamed hmp_split_at_comma() --> str_split_at_comma()
>> Shifted helper function to qapi-util.c file.
>
> Not an appropriate home.

I don't have an opinion here.

> If we have to split up a string in QAPI/QMP, we screwed up.  Let me
> explain.
>
> In QAPI/QMP, data is not to be encoded in strings, it is to be
> represented directly in JSON.  Thus, ["a", "b", "c"], *not* "a,b,c".

In this case, we are already screwed up O:-)

the uri value in migration has to be split.
What this series does is creating a new way to express the command
(something on the lines that you describe), but we still have to
maintain the old way of doing it for some time, so we need this
function.

> When you find yourself parsing QAPI/QMP string values, you're dealing
> with a case where we violated this interface design principle.  Happens,
> but the proper home for code helping to deal with this is *not* qapi/.
> Simply because QAPI is not about parsing strings.

Ok, I drop my review-by.

See why I was asking for reviews from QAPI libvirt folks for this code O:-)

>>                                              Give external linkage, as
>> this function will be handy in coming commit for migration.
>
> It already has external linkage.
>
>> Minor correction:
>> g_strsplit(str ?: "", ",", -1) --> g_strsplit(str ? str : "", ",", -1)
>
> This is not actually a correction :)
>
> Omitting the second operand of a conditional expression like x ?: y is
> equivalent to x ? x : y, except it evaluates x only once.

You are (way) more C layer than me.

Once told that, I think that what he wanted to do is making this c
standard, no gcc standard.

Once told that, I think that every C compiler worth its salt has this
extension.

> https://gcc.gnu.org/onlinedocs/gcc/Conditionals.html
>
> Besides, please don't mix code motion with code changes.

Agreed.

Later, Juan.



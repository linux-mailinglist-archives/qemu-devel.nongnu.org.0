Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B6147BD03
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 10:38:40 +0100 (CET)
Received: from localhost ([::1]:56618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzbbT-0008F9-H7
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 04:38:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mzbYz-0006I8-EU
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 04:36:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mzbYq-0002bb-KX
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 04:35:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640079355;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lcKMZZiiJ2CgZcsdMKv0lfhh0f/czZSaJ/qGoQ9QtPA=;
 b=hiwLI+Bw0rMcDt7WzeT0ZM4AU/qVMnp+d9ZIwoX8E2H2k2oFGpN2MzDTMqocTcmJ2QQr/1
 r4XM5QKE6mLixxrv9CUXx9nvvnBSFfpOGxsJbfAooFR6e0Y+/TkQJkmtlOrRxvJgEOgFtZ
 zoxDrkK8yUrmi1bYCx9fFvIjOSo9CYA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-33-j9Wny9tNNt-sV-bMyFpvqw-1; Tue, 21 Dec 2021 04:35:54 -0500
X-MC-Unique: j9Wny9tNNt-sV-bMyFpvqw-1
Received: by mail-wm1-f72.google.com with SMTP id
 bi14-20020a05600c3d8e00b00345787d3177so909902wmb.0
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 01:35:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DOpS79yiVQVAuarbXJYdzKHrqOJL+v6NChkFQIji6a4=;
 b=ESlpGAMMOVWRwYxWtIytjeNMBk8cUCAq2VfBrQPp2xKNO95co12awocyR6YPi3Ljz3
 7gcKgO13kjMvDCjR8DTWKObDzpAbD61bWIzADtBlHIOwyfOjJtNZdMh+GOVixyMbbR+5
 RT6OBGZY+HshFGiSAnLRbhJPe/uHBWXXCplZmDW+D1cQ3OBR13IltlzYcyOs356MMwIl
 5FYJCAqCp3adgTiKQPAw4oZRCQ2gdTNi6KELxzC9imvhfW6IkK5X4zZiRoBMcvwXL8VW
 iBzVOmNlz5nwmBXUuDGMYc3SwP8f7zcKr99+nBTjHoj8p+87enPVIOT7MQApsouB3+YH
 rn6g==
X-Gm-Message-State: AOAM530S8LBOvoLZRvB2EMvgUSevVlzjkYwuSViKuoCTP4G9A1tOkJEC
 +AYR+ZZJ485KmewIuBCYtt4IpKfnpWu2o91yP2P1KsAr+pTdgd6MGpQhSW15iPrJEETpBpt0Cno
 XVHeNchw33H0SA6M=
X-Received: by 2002:a05:600c:1e24:: with SMTP id
 ay36mr1912315wmb.84.1640079352944; 
 Tue, 21 Dec 2021 01:35:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxooKgqHVSRQeETk9QhVlw8hQuE28Zu+DffA2g2mXg9fOqOxiqByb+HzbtSIiXOqxr4ukNtCw==
X-Received: by 2002:a05:600c:1e24:: with SMTP id
 ay36mr1912307wmb.84.1640079352756; 
 Tue, 21 Dec 2021 01:35:52 -0800 (PST)
Received: from localhost (static-174-144-85-188.ipcom.comunitel.net.
 [188.85.144.174])
 by smtp.gmail.com with ESMTPSA id f8sm11673319wry.16.2021.12.21.01.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 01:35:52 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 3/5] migration: ram_release_pages() always receive 1
 page as argument
In-Reply-To: <cd82bba4-89c6-8c92-7eb3-467893b43ff7@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 16 Dec 2021 10:27:49
 +0100")
References: <20211216091332.25681-1-quintela@redhat.com>
 <20211216091332.25681-4-quintela@redhat.com>
 <cd82bba4-89c6-8c92-7eb3-467893b43ff7@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 21 Dec 2021 10:35:50 +0100
Message-ID: <87a6gujo5l.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: quintela@redhat.com
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:
> On 12/16/21 10:13, Juan Quintela wrote:
>> Remove the pages argument. And s/pages/page/
>>=20
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>>  migration/ram.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>
>> -static void ram_release_pages(const char *rbname, uint64_t offset, int =
pages)
>> +static void ram_release_page(const char *rbname, uint64_t offset)
>>  {
>>      if (!migrate_release_ram() || !migration_in_postcopy()) {
>>          return;
>>      }
>> =20
>> -    ram_discard_range(rbname, offset, ((ram_addr_t)pages) << TARGET_PAG=
E_BITS);
>> +    ram_discard_range(rbname, offset, ((ram_addr_t)1) << TARGET_PAGE_BI=
TS);
>
> 1ULL?

I am changing it, but the argument to ram_discard_range is a size_t, and
that is different in 32 bits arch.  Once told that, it is not worse that
what we have here, as ram_addr_t type depends on the phase of the moon.

/* address in the RAM (different from a physical address) */
#if defined(CONFIG_XEN_BACKEND)
typedef uint64_t ram_addr_t;
#  define RAM_ADDR_MAX UINT64_MAX
#  define RAM_ADDR_FMT "%" PRIx64
#else
typedef uintptr_t ram_addr_t;
#  define RAM_ADDR_MAX UINTPTR_MAX
#  define RAM_ADDR_FMT "%" PRIxPTR
#endif

Later, Juan.

PD. No, I don't know either why it is not casted to size_t.

PD2. And yes, I still think that pure int operations should be ok.
     The value TARGET_PAGE_BITS more typical is 10, and here pages is
     only used with value 1.  C promotion rules should make everything
     ok (famous last words).



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D90446DB5
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Nov 2021 12:49:34 +0100 (CET)
Received: from localhost ([::1]:38070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjKCS-0007xm-Mh
	for lists+qemu-devel@lfdr.de; Sat, 06 Nov 2021 07:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mjK96-0005ze-AU
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 07:46:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mjK92-0002g6-LN
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 07:46:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636199159;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cnxx2Tj189dc6BUL6LWLlDG155Pqih41c6nmxkCVYvU=;
 b=dr9fx3yBFOkxmPfV62Leflen+5xwbDeT0MiPU/NxycPNz/5yJTQFqGSFeSqkwIW9+bM6/i
 b4kpwMfMNpjkCICYgk99pmb7iJdp+Ae+BFSWvQK9lT7WuPXZ5/r/Ulvy8AYH8ts+VdN0pi
 E6OZdSf1vs9Iid49JB+swZgjhvFjubo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-h6eAeRZKMMa3YDosCf9L1w-1; Sat, 06 Nov 2021 07:45:58 -0400
X-MC-Unique: h6eAeRZKMMa3YDosCf9L1w-1
Received: by mail-wm1-f72.google.com with SMTP id
 145-20020a1c0197000000b0032efc3eb9bcso7312335wmb.0
 for <qemu-devel@nongnu.org>; Sat, 06 Nov 2021 04:45:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cnxx2Tj189dc6BUL6LWLlDG155Pqih41c6nmxkCVYvU=;
 b=BwZc5AO3Xox8u0YLdNXi+b48BIItl+x7lWmv5Cw4+Fnc1jOFBcqr5Jhe5Or/OvQNFM
 Po8A4IXKql00Q924GrlgXWgF2AtlZEwviRDg9/hOvswPOh8rYZjE8wd4lZN6dzO8WdsK
 DJtREImz1GR1KxdCamVzHVvcSeWeOYQ6MnZhC6xremCQm64D4McN5tWBAIbSg8GVDQmW
 6TTZzxpf8CudVY72yb15cxjnV4A7m7jFvAKJXvGJQxzW1pg0RhXtaS1KqoxIBb5tot2d
 JhRZJh8nNvsxxYSGOJDSHloz39fHbaW+LfD2xl9pLTBNbKy//ZR33YLSr4s5rFUj3Q7P
 XIQg==
X-Gm-Message-State: AOAM530526jJ5lTIoyJ3S+EfTqLPZuAT8BDNFejoWJMrGWODeCcJAHZx
 pb6Ho07rDP9xRlHwmZV12OP+LvjKXt4jvxaKs0WPJMpAL4CFPQr4Wkx7KZvm1HBc21f5Cue9eeB
 vwnmfmsRYSSAQuxE=
X-Received: by 2002:a7b:c4c4:: with SMTP id g4mr36521080wmk.93.1636199156751; 
 Sat, 06 Nov 2021 04:45:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMxAvhoUUm4X8ECxWpBYCM4doPEZ8ec3FX/83U4znN+uCwNPGfmTfYrdtDKUB/9dwB/eM1YA==
X-Received: by 2002:a7b:c4c4:: with SMTP id g4mr36521035wmk.93.1636199156503; 
 Sat, 06 Nov 2021 04:45:56 -0700 (PDT)
Received: from localhost ([178.139.230.94])
 by smtp.gmail.com with ESMTPSA id t8sm8541831wmq.32.2021.11.06.04.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Nov 2021 04:45:55 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PULL 07/20] migration/dirtyrate: implement dirty-ring
 dirtyrate calculation
In-Reply-To: <6f8b30c5-d93d-882d-cf1a-502592e4bcf8@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 4 Nov 2021 23:05:14
 +0100")
References: <20211101220912.10039-1-quintela@redhat.com>
 <20211101220912.10039-8-quintela@redhat.com>
 <6f8b30c5-d93d-882d-cf1a-502592e4bcf8@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Sat, 06 Nov 2021 12:45:54 +0100
Message-ID: <87pmrdfqx9.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.735,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>,
 =?utf-8?B?SHltYW4gSHVhbmcow6nCu+KAnsOl4oC54oChKQ==?=
 <huangy81@chinatelecom.cn>, Paul Durrant <paul@xen.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Eric Blake <eblake@redhat.com>, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:
> Hi Juan,
>
> On 11/1/21 23:08, Juan Quintela wrote:
>> From: Hyman Huang(=C3=A9=C2=BB=E2=80=9E=C3=A5=E2=80=B9=E2=80=A1) <huangy=
81@chinatelecom.cn>
>>=20
>> use dirty ring feature to implement dirtyrate calculation.
>>=20
>> introduce mode option in qmp calc_dirty_rate to specify what
>> method should be used when calculating dirtyrate, either
>> page-sampling or dirty-ring should be passed.
>>=20
>> introduce "dirty_ring:-r" option in hmp calc_dirty_rate to
>> indicate dirty ring method should be used for calculation.
>>=20
>> Signed-off-by: Hyman Huang(=C3=A9=C2=BB=E2=80=9E=C3=A5=E2=80=B9=E2=80=A1=
) <huangy81@chinatelecom.cn>
>
> Just noticing in the git history some commits from your
> pull request have the author name (from + S-o-b) mojibaked.

Didn't knew the term.

I noticed that after the fact.  Still have to debug *why* my setup
decided to break some of the patches and not the others.  Obviosly, I
have no clue about how to write/read/whatever anything that is not
latin1, so if something breaks, I got in a difficult place O:-)

Thanks, Juan.

>> <7db445109bd18125ce8ec86816d14f6ab5de6a7d.1624040308.git.huangy81@chinat=
elecom.cn>
>> Reviewed-by: Peter Xu <peterx@redhat.com>
>> Reviewed-by: Juan Quintela <quintela@redhat.com>
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>>  qapi/migration.json    |  16 +++-
>>  migration/dirtyrate.c  | 208 +++++++++++++++++++++++++++++++++++++++--
>>  hmp-commands.hx        |   7 +-
>>  migration/trace-events |   2 +
>>  4 files changed, 218 insertions(+), 15 deletions(-)



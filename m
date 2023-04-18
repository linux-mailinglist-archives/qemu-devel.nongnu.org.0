Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A656E611C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 14:21:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pokK5-0001rZ-Fd; Tue, 18 Apr 2023 08:20:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pokK3-0001rF-Ka
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 08:20:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pokK1-0002Ln-4U
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 08:20:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681820431;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5VhJGTUO0n0vhHS+BQlH1pFbBJ4LcEF10jKMxEJdA10=;
 b=YA4JDNCugCqmborIs8L4G2y+ThXuIfQO7d7hSbjWJI4LkZGQmRkg9wFCJNts8HxCbzsUtO
 tQH/F75e2Kjy+539HfkW+u2yISBp1o0UOPL0YBxSxm1HwV1RHgdXLru+rxgKikL59LXBIm
 hDgfMv07wbyLF+HXdD2FU6e635KH63w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-61-EFY4_3qOOjS4at2k8kt7rg-1; Tue, 18 Apr 2023 08:20:30 -0400
X-MC-Unique: EFY4_3qOOjS4at2k8kt7rg-1
Received: by mail-wm1-f69.google.com with SMTP id
 bg10-20020a05600c3c8a00b003ef7b61e2fdso6269240wmb.4
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 05:20:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681820429; x=1684412429;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5VhJGTUO0n0vhHS+BQlH1pFbBJ4LcEF10jKMxEJdA10=;
 b=ZdYqow3AsdiMdIAfr9TYbdcSQC494pDbVqqDihGZxuB8/Ej4e3ElI4efIasot96/ht
 Q1ZrA8kVE03qo01HgRdVNrCZf/edd+7fr6Gd33Rsc4L5LdhBCZFEpjNocd0yfUy2ll3R
 Mb0FUQ4tyrTwq0E7qL+sTY5dmOZ1fyPZLxVyo95Wh5gZHDLf9KZ0L3czVAc2+8oyp/vT
 ikSPM9cVsKZgPbjOhhCD34s7SINkfd8YbI0q1jNchkq0Cs+FKa8x+GBkbGzN2Dxec1mY
 Cnd9lYSVsXup0U3paAlEDprfHZQdo+T+jWkz4R7mICPi/x2vC4XZu8ZerLb5viRPFJzR
 bBkQ==
X-Gm-Message-State: AAQBX9eGrd7r5HYX3Vu5Ol9zPjTgvWsvLI0yaSj5jKoXqg5biIbNQIjE
 QwLkoc/jClpIcm6N2tmHrl9LZ9UTF7tc4xPv6NZvNREyzJCgQvPbVmgneN5TTJGQ6pVeX96JDpH
 S8qZIOmY97jne2+c=
X-Received: by 2002:a05:600c:3647:b0:3f1:727d:77a4 with SMTP id
 y7-20020a05600c364700b003f1727d77a4mr5492089wmq.39.1681820429383; 
 Tue, 18 Apr 2023 05:20:29 -0700 (PDT)
X-Google-Smtp-Source: AKy350ayUWsTu3sEXp+W65t0298LbtAxyPTp4hFVGlZNJBkPDibbJz4X8pP+MB66goeLDtjhXUUpPw==
X-Received: by 2002:a05:600c:3647:b0:3f1:727d:77a4 with SMTP id
 y7-20020a05600c364700b003f1727d77a4mr5492076wmq.39.1681820429091; 
 Tue, 18 Apr 2023 05:20:29 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 s15-20020adfeb0f000000b002c55306f6edsm12994609wrn.54.2023.04.18.05.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 05:20:28 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  Laurent
 Vivier <lvivier@redhat.com>,  Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/2] tests/migration: Make precopy fast
In-Reply-To: <ZD6E0E6q/tKDl0k0@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Tue, 18 Apr 2023 12:53:52 +0100")
References: <20230412142001.16501-1-quintela@redhat.com>
 <20230412142001.16501-2-quintela@redhat.com>
 <ZD6E0E6q/tKDl0k0@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 18 Apr 2023 14:20:27 +0200
Message-ID: <87v8ht1iwk.fsf@secure.mitica>
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
> On Wed, Apr 12, 2023 at 04:20:00PM +0200, Juan Quintela wrote:
>> Otherwise we do the 1st migration iteration at a too slow speed.
>>=20
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>>  tests/qtest/migration-test.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>=20
>> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
>> index 3b615b0da9..7b05b0b7dd 100644
>> --- a/tests/qtest/migration-test.c
>> +++ b/tests/qtest/migration-test.c
>> @@ -1348,6 +1348,7 @@ static void test_precopy_common(MigrateCommon *arg=
s)
>>          migrate_qmp(from, args->connect_uri, "{}");
>>      }
>>=20=20
>> +    migrate_ensure_converge(from);
>
> This isn't right - it defeats the point of having the call to
> migrate_ensure_non_converge() a few lines earlier.

Depends on what is the definiton or "right" O:-)

>>      if (args->result !=3D MIG_TEST_SUCCEED) {
>>          bool allow_active =3D args->result =3D=3D MIG_TEST_FAIL;
>> @@ -1365,8 +1366,6 @@ static void test_precopy_common(MigrateCommon *arg=
s)
>>              wait_for_migration_pass(from);
>>          }
>>=20=20
>> -        migrate_ensure_converge(from);
>> -
>
> The reason why we had it here was to ensure that we test more than
> 1 iteration of migration. With this change, migrate will succeed
> on the first pass IIUC, and so we won't be exercising the more
> complex code path of repeated iterations.

Aha.

If that is the definition of "right", then I agree that my changes are
wrong.

But then I think we should change how we do the test.  We should split
this function (then same for postcopy, multifd, etc) to have to
versions, one that want to have multiple rounds, and another that can
finish as fast as possible.

This way we need to setup the 3MB/s only for the tests that we want to
loop, and for the others put something faster.


>
> I do agree with the overall idea though. We have many many migration
> test scenarios and we don't need all of them to be testing multiple
> iterations - a couple would be sufficient.
>
> In fact we don't even need to be testing live migration for most
> of the cases. All the TLS test cases could be run with guest CPUs
> paused entirely removing any dirtying, since they're only interested
> in the initial network handshake/setup process testnig.
>
> I had some patches I was finishing off just before I went on vacation
> a few weeks ago which do this kind of optimization, which I can send
> out shortly.

I will wait for your patches before I sent anything different.

I have local patches for doing something different, changing

      "-serial file:%s/src_serial "

and other friends to:

      "-serial file:%s/src_serial%pid "

So we are sure that two tests never "reuse" the socket, as it can create
problems for example when doing the cancel and relaunching the
destination.

But as said, will wait until you send your series to send anything.

Later, Juan.



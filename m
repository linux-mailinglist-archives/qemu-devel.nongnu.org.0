Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6D86E9DB3
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 23:12:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppbZc-000395-KG; Thu, 20 Apr 2023 17:12:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppbZa-00038m-Sq
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 17:12:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppbZY-0001yg-U3
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 17:12:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682025127;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=S6AiNjwfg8N6uN5Ia6SjOvao//KPjVxiy0lsSKULWxo=;
 b=JImaKoINLb3GnsjxsdPMjqF7YIlMt6zXqyrFZp/q17hAMixM96rHQBN01/cDTfHSd/VJQ0
 nGRTms/xERQQKbvorTdlK3JoBeo7hWuUsR01JiF1a3Va2C3oTyWCUrYqtTj5KcfOCW2goK
 vkWbS4beZawj61p0YLRGfjida+uDp+U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-470-raLDkKx_PTm59ROZ--NZZQ-1; Thu, 20 Apr 2023 17:12:06 -0400
X-MC-Unique: raLDkKx_PTm59ROZ--NZZQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f1763fac8bso6597295e9.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 14:12:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682025124; x=1684617124;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S6AiNjwfg8N6uN5Ia6SjOvao//KPjVxiy0lsSKULWxo=;
 b=Sc6LWbqsOTADPmsqMRJUrJs/pQqNXRZ0U3FsQDd42BZTzIw9znmGO9Uc9w2wAWI1nk
 6hUuUO5NWNXs4T28bZd3AKUAGaCYft3VeZYz+n3/BtCTWohXAHADRPa1vv1q9VMl5bBi
 KFMSNyKVzbR/J3ExUeILRYpDZfxLRCg58qAQDi+1tB1tm6wl4I+C26cwwzW3oyPIatVo
 xfM0ycEqiLmXUSGdb7B1UT11LvU8kyfm0G+Y3oo8omdKDd5vHLPABBmfcePuVQqu/xkf
 kxYn9xxi6mJkkZGPWz1hJEmRnyGPl/ADD2ZVl9DDKH/djrM05GrQfOSE+2iS1rVOAVlk
 svsQ==
X-Gm-Message-State: AAQBX9cHlH6i8dfYhrUGR4k5KaKzlROuFEZrexOTIfua8YikPiV1VACd
 6xQu5yYMeqRzZ+PT80KfdaWIGEokwR/HfqLLGxlw4mDWAdiNOX3hW2ErxH2gpbMfTY7rfvgeSD1
 441xCXKt9+2dwboRXtO0B9B0BYRuE
X-Received: by 2002:a1c:7902:0:b0:3ed:fc8c:f197 with SMTP id
 l2-20020a1c7902000000b003edfc8cf197mr181588wme.29.1682025123750; 
 Thu, 20 Apr 2023 14:12:03 -0700 (PDT)
X-Google-Smtp-Source: AKy350a8K79VfCc19ibi3HVe5CFxUqBZgQ82Sf2fKD1tSjebymX7H5TUiCEUuqTN70vDzmYO/7gaAQ==
X-Received: by 2002:a1c:7902:0:b0:3ed:fc8c:f197 with SMTP id
 l2-20020a1c7902000000b003edfc8cf197mr181579wme.29.1682025123462; 
 Thu, 20 Apr 2023 14:12:03 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 v17-20020a5d43d1000000b002fdf0f6b07csm2856894wrr.67.2023.04.20.14.12.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 14:12:02 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Cc: qemu-devel <qemu-devel@nongnu.org>,  Peter Xu <peterx@redhat.com>,
 Thomas Huth <thuth@redhat.com>,  Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 01/13] qtest/migration-test.c: Add postcopy tests
 with compress enabled
In-Reply-To: <20230420103756.2aada33a@gecko.fritz.box> (Lukas Straub's message
 of "Thu, 20 Apr 2023 12:37:56 +0200")
References: <cover.1681983401.git.lukasstraub2@web.de>
 <01a063686e62ce97e7d0bc9fa935389f074ecb4b.1681983401.git.lukasstraub2@web.de>
 <87cz3yzwgm.fsf@secure.mitica>
 <20230420103756.2aada33a@gecko.fritz.box>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 20 Apr 2023 23:12:02 +0200
Message-ID: <875y9quul9.fsf@secure.mitica>
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

Lukas Straub <lukasstraub2@web.de> wrote:
> On Thu, 20 Apr 2023 12:20:25 +0200
> Juan Quintela <quintela@redhat.com> wrote:
>
>> Lukas Straub <lukasstraub2@web.de> wrote:
>> > Add postcopy tests with compress enabled to ensure nothing breaks
>> > with the refactoring in the next commits.
>> >
>> > preempt+compress is blocked, so no test needed for that case.
>> >
>> > Signed-off-by: Lukas Straub <lukasstraub2@web.de>  
>> 
>> Reviewed-by: Juan Quintela <quintela@redhat.com>
>> 
>> And I wanted to removed the old compression code and it gets new users.  Sniff.
>
> Who know how many compress threads users are out there...

Not too much.
We broke it during development and nobody found it.

And the reason that I wrote the multifd-zlib compression code was
because I was not able to get a migration-test working with compression,
so ....

> By the way, I'm not against deprecating compress threads in the long
> run. I'm already working on (cleanly :)) adding colo support with
> multifd.

Ok, then I will still put the deprecate comment there.


>> > ---
>> >  tests/qtest/migration-test.c | 83 +++++++++++++++++++++++-------------
>> >  1 file changed, 53 insertions(+), 30 deletions(-)
>> >
>> > diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
>> > index 1f2a019ce0..930cb4f29d 100644
>> > --- a/tests/qtest/migration-test.c
>> > +++ b/tests/qtest/migration-test.c
>> > @@ -1127,6 +1127,36 @@ test_migrate_tls_x509_finish(QTestState *from,
>> >  #endif /* CONFIG_TASN1 */
>> >  #endif /* CONFIG_GNUTLS */
>> >
>> > +static void *
>> > +test_migrate_compress_start(QTestState *from,
>> > +                            QTestState *to)
>> > +{
>> > +    migrate_set_parameter_int(from, "compress-level", 1);
>> > +    migrate_set_parameter_int(from, "compress-threads", 4);
>> > +    migrate_set_parameter_bool(from, "compress-wait-thread", true);
>> > +    migrate_set_parameter_int(to, "decompress-threads", 4);
>> > +
>> > +    migrate_set_capability(from, "compress", true);
>> > +    migrate_set_capability(to, "compress", true);
>> > +
>> > +    return NULL;
>> > +}  
>> 
>> Independently of this patch, we need to change this test to use 4
>> compression tests and 3 decompression or anything that is not the same
>> number in both sides.
>> 
>> I was complaining about this and when I arrived to the end of the path
>> found that this was code movement.
>> 
>> Later, Juan.
>> 
>
> Oops, forgot to mention, the test is based on this patch
> https://lore.kernel.org/qemu-devel/2f4abb67cf5f3e1591b2666676462a93bdd20bbc.1680618040.git.lukasstraub2@web.de/
>
> Will probably carry the patch with this series then. So you mean 4
> compress _threads_ and 3 decompress _threads_?

Yeap.

Later, Juan.



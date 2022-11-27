Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 102C9639C26
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Nov 2022 19:01:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozLw9-0000Kz-Kq; Sun, 27 Nov 2022 12:59:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ozLw8-0000Kk-6P
 for qemu-devel@nongnu.org; Sun, 27 Nov 2022 12:59:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ozLw1-00062G-UQ
 for qemu-devel@nongnu.org; Sun, 27 Nov 2022 12:59:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669571959;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Z6PsLtQUsXpGNeddFLy0zfbuzjXjorMUBFneRIPC4dM=;
 b=Sa2Ga85QaQNgLlY/G9hpJwxAUMsacWVnWWFbIQWINk6PtiBkkXjekl8SxsKWqWydIbNf5c
 N6HRdGInKC7N1esXH4+4fHRV+95IwK66LrjGHAM190QErN07ackUbVZDY2vlEsdH+vC5vP
 W0v4zKyIYCbC7uOxQyaW940jHRoILJI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-338-6LqOGqbKNjGMUxrzB5_itg-1; Sun, 27 Nov 2022 12:59:16 -0500
X-MC-Unique: 6LqOGqbKNjGMUxrzB5_itg-1
Received: by mail-wm1-f69.google.com with SMTP id
 b47-20020a05600c4aaf00b003d031aeb1b6so7390049wmp.9
 for <qemu-devel@nongnu.org>; Sun, 27 Nov 2022 09:59:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z6PsLtQUsXpGNeddFLy0zfbuzjXjorMUBFneRIPC4dM=;
 b=vKULVTskUDJxXJiR4Jp7kT5gEVcXQX0bxYZZMtrBIevqjO5cRPk9GKoY3VaD5Vo82y
 Kse4JVhQuhmdvONpMlQabNWkj7giyNO/Oirvof0645l3wwQFO9GHHNS1kVPOuxRlHq+J
 /YMM3HmQx1mMJBLwhjLimt2Tn3d/wYHOnMvdaLJP2Cjtztgltah7fp7zYrwIdvzJS0zT
 aTgufg9uBNdLbTAVo0wi74mFD/OSeqhk98j9okqa5MllGJsWhHyKS26nW+vLgjmRBvhH
 MGrfRgli6BV3/139zmcpzNM2IP248L8y1F58pxIM0o27Al3CKLvt6FOyFAAM4xOX/fzJ
 +CPw==
X-Gm-Message-State: ANoB5pmf5FxK/RDqYLOuPlHQkPXSi40ttnn6krlVvUKb/kCsbRW+3z/t
 ZQAVWwTaxbIUL3U2ZaeqoQ6GL35fjYG31ke54HdKqO1DytUB7EM4s+MJWWDgqzNX2bmDILdmlYq
 TicxXzipXcvKD7Dc=
X-Received: by 2002:adf:f285:0:b0:238:44ec:945b with SMTP id
 k5-20020adff285000000b0023844ec945bmr28262964wro.209.1669571955045; 
 Sun, 27 Nov 2022 09:59:15 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6kxmmrfrdTM4JWYJQoQdRUhlj2radcW1rxbeKhGd9ob6RQCx/zlBWKeqskk15hWRN1FKcf2Q==
X-Received: by 2002:adf:f285:0:b0:238:44ec:945b with SMTP id
 k5-20020adff285000000b0023844ec945bmr28262956wro.209.1669571954847; 
 Sun, 27 Nov 2022 09:59:14 -0800 (PST)
Received: from localhost ([178.139.226.78]) by smtp.gmail.com with ESMTPSA id
 r17-20020a5d4e51000000b0023c8026841csm8714125wrt.23.2022.11.27.09.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Nov 2022 09:59:14 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Daniel P . =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH] tests/qtest/migration-test: Fix unlink error and memory
 leaks
In-Reply-To: <20221125083054.117504-1-thuth@redhat.com> (Thomas Huth's message
 of "Fri, 25 Nov 2022 09:30:54 +0100")
References: <20221125083054.117504-1-thuth@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Sun, 27 Nov 2022 18:59:13 +0100
Message-ID: <87wn7gnury.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_SORBS_WEB=1.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
> When running the migration test compiled with Clang from Fedora 37
> and sanitizers enabled, there is an error complaining about unlink():
>
>  ../tests/qtest/migration-test.c:1072:12: runtime error: null pointer
>   passed as argument 1, which is declared to never be null
>  /usr/include/unistd.h:858:48: note: nonnull attribute specified here
>  SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior
>   ../tests/qtest/migration-test.c:1072:12 in
>  (test program exited with status code 1)
>  TAP parsing error: Too few tests run (expected 33, got 20)
>
> The data->clientcert and data->clientkey pointers can indeed be unset
> in some tests, so we have to check them before calling unlink() with
> those.
>
> While we're at it, I also noticed that the code is only freeing
> some but not all of the allocated strings in this function, and
> indeed, valgrind is also complaining about memory leaks here.
> So let's call g_free() on all allocated strings to avoid leaking
> memory here.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>



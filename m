Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA32963AD81
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 17:20:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozgqS-00007p-Ix; Mon, 28 Nov 2022 11:19:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ozgqO-00006x-Gc
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 11:18:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ozgqM-0000zV-V5
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 11:18:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669652333;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NigQCgKtoVHBAi3+6tD92Hd+zh2iEn3Y4VR12ARso1E=;
 b=EGVHCBiNGJathZm04HWZug0EpN+9nB7T+CNhRIve/iHUirBsAiX0uNzR1h1an6KtRhQmrr
 QDcICUpErlvFT9AvtEoIFxQcaIZkPXDqvVmygmxxf0SeMjaysDpdv2XyOw/KLfGlrEcnc3
 lAPMzlfV9A6qUTATCfuvAP6GVrBoJds=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-472--HdYinnONz6qFOuTiDP9Yg-1; Mon, 28 Nov 2022 11:18:51 -0500
X-MC-Unique: -HdYinnONz6qFOuTiDP9Yg-1
Received: by mail-wm1-f72.google.com with SMTP id
 m34-20020a05600c3b2200b003cf549cb32bso8809629wms.1
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 08:18:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NigQCgKtoVHBAi3+6tD92Hd+zh2iEn3Y4VR12ARso1E=;
 b=A2awnZl5MlBOVj4+WXu1tS4gTN19jhpeoSBhcjdDrEe1AAIw5EEVfTFeG+02iG55pq
 j9a2mMqXRR/MJAi9UhnBSjSEppzb9uXoFgD8uJzcLP76hCKtAHbTZglwnAF57nmHGpC2
 twter+JNVkJe/q79VqwsO3WZy9ZUB7X3/hlPeKKzBA2ZrNEKk9W9nmoxsG7OmjweL0qY
 CDE3+8/yi+6nOSte7Ew9+VS357r5CY9BVXUV06e9A3E2qB7FvDrIOpxM/7x7yZIgqAim
 uBdDV6Ss5wSG1QOyKmF4twmUZaNokIVRueXvN4kpgzJQkzvjQN885Mc27hcqJl/wgxIh
 Qqbw==
X-Gm-Message-State: ANoB5pnm/BBGppwousyy1Yr6sVKNWdR/KvdnAyuzciQa8kJgJ1RKDgcr
 k02o8DJbxNO6PNc1wPb9413nbBUaF5G6uDiEns3ULated7NYw0OHvBYle1F8r3gfcC46lclgAIV
 l4Z8SZ4pPunJaZmg=
X-Received: by 2002:adf:d207:0:b0:242:880:20cc with SMTP id
 j7-20020adfd207000000b00242088020ccmr9525057wrh.467.1669652329454; 
 Mon, 28 Nov 2022 08:18:49 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6d7tG+TemRnKXfskx4oOQo7+Oy9waPk1W5zpsPUL2cAJBvfUsQsE4o90LlJR40QAw9d7REfQ==
X-Received: by 2002:adf:d207:0:b0:242:880:20cc with SMTP id
 j7-20020adfd207000000b00242088020ccmr9525039wrh.467.1669652329244; 
 Mon, 28 Nov 2022 08:18:49 -0800 (PST)
Received: from localhost ([31.4.242.188]) by smtp.gmail.com with ESMTPSA id
 y14-20020adff14e000000b00226dba960b4sm11407549wro.3.2022.11.28.08.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 08:18:47 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,  qemu-devel@nongnu.org,  "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH] tests/qtest/migration-test: Fix unlink error and memory
 leaks
In-Reply-To: <Y4CAp19HSRRieZug@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Fri, 25 Nov 2022 08:45:27 +0000")
References: <20221125083054.117504-1-thuth@redhat.com>
 <Y4CAp19HSRRieZug@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Mon, 28 Nov 2022 17:18:45 +0100
Message-ID: <87y1rvjbmi.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> On Fri, Nov 25, 2022 at 09:30:54AM +0100, Thomas Huth wrote:
>> When running the migration test compiled with Clang from Fedora 37
>> and sanitizers enabled, there is an error complaining about unlink():
>>=20
>>  ../tests/qtest/migration-test.c:1072:12: runtime error: null pointer
>>   passed as argument 1, which is declared to never be null
>>  /usr/include/unistd.h:858:48: note: nonnull attribute specified here
>>  SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior
>>   ../tests/qtest/migration-test.c:1072:12 in
>>  (test program exited with status code 1)
>>  TAP parsing error: Too few tests run (expected 33, got 20)
>>=20
>> The data->clientcert and data->clientkey pointers can indeed be unset
>> in some tests, so we have to check them before calling unlink() with
>> those.
>>=20
>> While we're at it, I also noticed that the code is only freeing
>> some but not all of the allocated strings in this function, and
>> indeed, valgrind is also complaining about memory leaks here.
>> So let's call g_free() on all allocated strings to avoid leaking
>> memory here.
>>=20
>> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5316BBDFF
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 21:35:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcXpq-0005om-EZ; Wed, 15 Mar 2023 16:34:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pcXpj-0005oN-Nu
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 16:34:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pcXpf-0006NA-AD
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 16:34:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678912485;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wjh+7cLzgXB4f5FOiqAhzhbFbtqybh3FuCpaHlNEJKw=;
 b=ViZ5IPcqQpgsvwpxdMNVBqd/NbaGG5t8jG2WYUMgdKA8zQD4Sz8l1HcBWUYt4YWg1Dr0Na
 0aNEG6tyi2MOpj23cv6msAFdZ+/iOgCFHEyxXfjF3rBJeNrXFcM+w78sOozY0oSPynr8s7
 AER8FLoYM8gJ4bJcMWOD9cP7d5VZWO0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-sG2gc4IEM1G3v7_wOV-I4g-1; Wed, 15 Mar 2023 16:34:44 -0400
X-MC-Unique: sG2gc4IEM1G3v7_wOV-I4g-1
Received: by mail-wr1-f72.google.com with SMTP id
 g14-20020a5d64ee000000b002cfe47b8ec4so1736162wri.10
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 13:34:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678912483;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wjh+7cLzgXB4f5FOiqAhzhbFbtqybh3FuCpaHlNEJKw=;
 b=nCvTX5HrA8EjkBfohray4afg8cOyufkQCtRS8CjTV/YFyBL1eKxSGz7QIUTyEMCo1z
 mnNaTUx2Vq7jnwz7DY4EyGzJAKrc1gAUYWLtC2hNrRyRtShs2Vt7gZyN0BNkqaUL8J6k
 Or2OlU+b/aEiA28oGKNsPYug29xt66s+kVfOFtRwZ33Co181XRAkGZwRqubP+Q/LbfEk
 QS2D8vuk4t42EvYTEnP6i/HBT04NFawipezBZp+iaJ2sTSy/m1QJ64MYs5bBlxn3YZ5R
 DTtTWYJongbaMhKZYXBLTYeQHh7YEzd/5dxWJueZsDx69WC9knyP2MdylN6CspjyQ8jH
 3+zQ==
X-Gm-Message-State: AO0yUKUmZ4NGP4eiXv6Xcnd4UavQ1XF5t+n4+acrpKWW7f+5hN00q9pR
 FeecyCIkKYnKXObzWU6gKtpG5Neu0t0Cx89MR4JGFeHSh6m0Cqu1L+pz7vDH0wdc/3nA7jL7efb
 8IuLIKgp6W4R99i4=
X-Received: by 2002:a05:600c:4f4e:b0:3eb:3945:d406 with SMTP id
 m14-20020a05600c4f4e00b003eb3945d406mr19194364wmq.16.1678912483190; 
 Wed, 15 Mar 2023 13:34:43 -0700 (PDT)
X-Google-Smtp-Source: AK7set/He1NWJ0B4GzdWgIG53Q0mQf9ean2hAMtD8bATjAmA9AWswDaPhXoDqc8O+0SJwCc9EDPvJg==
X-Received: by 2002:a05:600c:4f4e:b0:3eb:3945:d406 with SMTP id
 m14-20020a05600c4f4e00b003eb3945d406mr19194350wmq.16.1678912482907; 
 Wed, 15 Mar 2023 13:34:42 -0700 (PDT)
Received: from redhat.com (62.117.238.225.dyn.user.ono.com. [62.117.238.225])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a05600c21c200b003e1f2e43a1csm2847119wmj.48.2023.03.15.13.34.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 13:34:42 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,  Thomas
 Huth <thuth@redhat.com>,  Peter Maydell <peter.maydell@linaro.org>,  "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>,  Daniel P . =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH] migration: Wait on preempt channel in preempt thread
In-Reply-To: <20230314205429.1174295-1-peterx@redhat.com> (Peter Xu's message
 of "Tue, 14 Mar 2023 16:54:29 -0400")
References: <20230314205429.1174295-1-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 15 Mar 2023 21:34:41 +0100
Message-ID: <87edppoise.fsf@secure.mitica>
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

Peter Xu <peterx@redhat.com> wrote:
> QEMU main thread will wait until dest preempt channel established during
> processing the LISTEN command (within the whole postcopy PACKAGED data), =
by
> waiting on the semaphore postcopy_qemufile_dst_done.
>
> That's racy, because it's possible that the dest QEMU main thread hasn't
> yet accept()ed the new connection when processing the LISTEN event.  The
> sem_wait() will yield the main thread without being able to run anything
> else including the accept() of the new socket, which can cause deadlock
> within the main thread.
>
> To avoid the race, move the "wait channel" from main thread to the preempt
> thread right at the start.
>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Fixes: 5655aab079 ("migration: Postpone postcopy preempt channel to be af=
ter main")
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued.



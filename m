Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D23524ECD61
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 21:42:03 +0200 (CEST)
Received: from localhost ([::1]:53164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZeCg-0006ag-C6
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 15:42:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nZeBW-0005jj-Vs
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 15:40:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nZeBT-0001sA-EL
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 15:40:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648669245;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oq6ieihKLH/BVvQd0s1BP6aQgF/h3YLC8WStPfsI1BA=;
 b=XQAx3KrBWq0qHkND9cpxj6JS4SmTvWExdhl56ni8jOLVxlZXV5UC0k0kKMH7jz7hW2dQvR
 v0MMRlLj1ruqNJCceQu/+NwlGNJoaqiESIxTQeNBUmT1hBC14r+5sjua3ygPihRh633ohM
 Vkfkn2iJwQ4lds2XAiQydFWZ9OzoMYs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-177-chTnNZLsNo2bufA2-Jz1SQ-1; Wed, 30 Mar 2022 15:40:44 -0400
X-MC-Unique: chTnNZLsNo2bufA2-Jz1SQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 a17-20020a5d6cb1000000b00203f85a2ed9so6130868wra.7
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 12:40:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oq6ieihKLH/BVvQd0s1BP6aQgF/h3YLC8WStPfsI1BA=;
 b=Jxbftmd3l54vMUl7nkJIiq2UF4bEUyQ71+Bqna6j34EGD2/Bgn//knsV0MHhrRwwwi
 8AP+wwEitb6gYgF1xX7v+DFnGQW/C3eUx79GtdMzpmg92YNqhLK5Dw4Pg+RX4lgWPCtU
 47D0KkomLrgXyRMHGCfsda8PIBoWpl5VJ1T2g66omyYKk2mWUByT196w0I4M+hF/Qy0x
 3QOheZNIv7b9DgoTPNgthkjrCVabCC9ExGARGy4dQKHEfpZ/g2rA6M0x880CLmJBmt/l
 NCWImZrGMSpIe4oip2Uadx1/JRAauc5ylvLGj/QrmWh0uWwXXcVZtnFAZcNBn4mWT8j2
 jwhA==
X-Gm-Message-State: AOAM533t9g2sjsiQtvMql7DeHQT0SjOAn+xZ6xczvFeiGMPVvGGcukON
 e4182o806JRM8Mg4Djvcph63mbvAzDeakbB1LIMpbIbLxKZ2ZW9sdoz+66ZUioWoJObnYzrn7NJ
 /OegrEv2oND4tcdI=
X-Received: by 2002:a05:600c:1d9b:b0:38c:af70:9998 with SMTP id
 p27-20020a05600c1d9b00b0038caf709998mr1040744wms.169.1648669243301; 
 Wed, 30 Mar 2022 12:40:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVr8i9RK2S9M2C75nAMB46wVpbbydY+eF+iKg4tsGzkmFpuBlADriJrOyhfSLlT/4QgTecMA==
X-Received: by 2002:a05:600c:1d9b:b0:38c:af70:9998 with SMTP id
 p27-20020a05600c1d9b00b0038caf709998mr1040725wms.169.1648669243049; 
 Wed, 30 Mar 2022 12:40:43 -0700 (PDT)
Received: from localhost (static-247-177-6-89.ipcom.comunitel.net.
 [89.6.177.247]) by smtp.gmail.com with ESMTPSA id
 k18-20020a5d6d52000000b00203da94cf01sm18016208wri.14.2022.03.30.12.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 12:40:42 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v2 00/18] tests: introduce testing coverage for TLS with
 migration
In-Reply-To: <YkSQkIEgJhLxinjz@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Wed, 30 Mar 2022 18:17:04 +0100")
References: <20220310171821.3724080-1-berrange@redhat.com>
 <YiqswPa/VV/lY6yN@xz-m1.local> <YkSQkIEgJhLxinjz@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Wed, 30 Mar 2022 21:40:41 +0200
Message-ID: <87czi3cjpi.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> Juan,
>
> would you be able to include at least patch 6 in a migration
> pull before release ?

Yeap, will do tomorrow.

Later, Juan.

> On Fri, Mar 11, 2022 at 09:58:24AM +0800, Peter Xu wrote:
>> On Thu, Mar 10, 2022 at 05:18:03PM +0000, Daniel P. Berrang=C3=A9 wrote:
>> > This significantly expands the migration test suite to cover testing
>> > with TLS over TCP and UNIX sockets, with both PSK (pre shared keys)
>> > and x509 credentials, and for both single and multifd scenarios.
>> >=20
>> > It identified one bug in handling PSK credentials with UNIX sockets,
>> > but other than that everything was operating as expected.
>> >=20
>> > To minimize the impact on code duplication alopt of refactoring is
>> > done of the migration tests to introduce a common helper for running
>> > the migration process. The various tests mostly just have to provide
>> > a callback to set a few parameters/capabilities before migration
>> > starts, and sometimes a callback to cleanup or validate after
>> > completion/failure.
>> >=20
>> > There is one functional bugfix in patch 6, I would like to see
>> > in 7.0. The rest is all test suite additions, and I don't mind
>> > if they are in 7.0 or 7.1
>>=20
>> At least patch 1-4, 6-10 look already good candidates for 7.0, imho, if =
not
>> all..
>>=20
>> Thanks for doing this, Daniel.
>>=20
>> --=20
>> Peter Xu
>>=20
>
> With regards,
> Daniel



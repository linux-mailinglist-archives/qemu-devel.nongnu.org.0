Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B60A568053A
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 05:49:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMM6P-0005J5-Qd; Sun, 29 Jan 2023 23:49:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMM6N-0005HR-9O
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 23:49:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMM6L-0006L2-NL
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 23:49:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675054145;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EfPiOSf9W73yMRKCkVU0VbjeTsXQlutNmGxZE+NV/JE=;
 b=hes7VAHzPTAWOdj+//4bhNB9BbQZKX7pmGuavxvK25rOh+g4q0eUTF39UXCJ1xbqQ+K9XN
 vC7sd/otENyIiylgI8FK4a+CvTaAtCh2g050UEtpr3BP8QxBNhtXUDLlOBUmGNUJd/Hj7x
 S47S+CuPWsVIwOMMzlzi/f9qAO5nWLg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-377-9pUb9TnxPZmsq-u6dHXSkQ-1; Sun, 29 Jan 2023 23:49:03 -0500
X-MC-Unique: 9pUb9TnxPZmsq-u6dHXSkQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 r15-20020a05600c35cf00b003d9a14517b2so8893093wmq.2
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 20:49:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EfPiOSf9W73yMRKCkVU0VbjeTsXQlutNmGxZE+NV/JE=;
 b=cIY/hL+mC54Iy8TSTSyge2oKR8HNlQlToOqCQHGMw8Gm+ibJ9JUVg+iT8T+6y1S6HN
 1l1+L8efuZHW8ctgLymw42PNSkAkZwj94/eJyuY5dEwuQa+qtIgVdhETbUmBgZxoKTc4
 nD9pttQo9D+D47QiJ+3c6EfJckHiMwDDIwdTgTaU7gyP/Eu+nDIJXMZFNBVse51ffqxj
 lSRdZ7Z4JCW1Dynl+5VekA2YPYxmSG5xT7cdyIJt+rT8icoEIWOmqXh3lfvh9oiesn/V
 EibvH0zMohI44/PJrX3OTAh1k203ENFB8DtnSTfUrBvE2lS8sw9e7zczb4WsX+qDDH7U
 kKmg==
X-Gm-Message-State: AO0yUKXNzbh/TH2ar0er0Znskh1EA8FTi/FdSMmG+eapIXib2niGkKnD
 YWL0gfeM66w+B2HOFNJxEOiVpVtEZTtX6X2Q66z9lvUU9dP69pXx5JrYQ4Qmkx5Abu6MmYujCJi
 hRX2Dyj5wIUpPMxI=
X-Received: by 2002:a1c:f014:0:b0:3dc:4318:d00d with SMTP id
 a20-20020a1cf014000000b003dc4318d00dmr8897317wmb.11.1675054142807; 
 Sun, 29 Jan 2023 20:49:02 -0800 (PST)
X-Google-Smtp-Source: AK7set8cZ7YfQgkbf4HxBiGq3zn5qUcQgw9XFz5+ESYIw1NSUAriOVWD9JsRAHFkX15nr7toSvY0mw==
X-Received: by 2002:a1c:f014:0:b0:3dc:4318:d00d with SMTP id
 a20-20020a1cf014000000b003dc4318d00dmr8897306wmb.11.1675054142612; 
 Sun, 29 Jan 2023 20:49:02 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 l41-20020a05600c08a900b003dc3d9fb09asm8162518wmp.47.2023.01.29.20.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 20:49:02 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>,  Thomas Huth <thuth@redhat.com>,
 Fabiano Rosas <farosas@suse.de>,  Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org,  Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 11/11] tests/qtest/migration-test: Only use available
 accelerators
In-Reply-To: <20230120082341.59913-12-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 20 Jan 2023 09:23:41
 +0100")
References: <20230120082341.59913-1-philmd@linaro.org>
 <20230120082341.59913-12-philmd@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 05:49:01 +0100
Message-ID: <87o7qglj9e.fsf@secure.mitica>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
> For example, avoid when TCG is disabled:
>
>   $ make check-qtest-aarch64
>   ...
>   20/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/migration-test
>   qemu-system-aarch64: -accel tcg: invalid accelerator tcg
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>



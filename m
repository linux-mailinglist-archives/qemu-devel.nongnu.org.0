Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9174D5F32
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 11:11:12 +0100 (CET)
Received: from localhost ([::1]:38424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nScEp-00022U-7X
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 05:11:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nScBa-0007nT-Ab
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 05:07:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nScBU-00033u-SV
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 05:07:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646993264;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f4CCojAbKprqiDXgJsBxQi1dboqNYmrDe8hXqe7epzI=;
 b=gDncSFisaP9BjIoDt8wuh9tC1jkjOlQ6zXIPLIZMYfS+rYtL2hVFaGM/x0BHIgBYiUMm6Y
 uTfxmUso9G9ajhcnXQMa6fTuhCPQaaw8psFCFsgX4hWQshHfrkdAzSMFSc5LVB0p2ZMWMx
 RhvkrOvMGddX1K51Al02+Rpghr1Z1Co=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-372-21iSeB7nOhWHXuDNKmbtfg-1; Fri, 11 Mar 2022 05:07:43 -0500
X-MC-Unique: 21iSeB7nOhWHXuDNKmbtfg-1
Received: by mail-wm1-f71.google.com with SMTP id
 f24-20020a1c6a18000000b00388874b17a8so3309577wmc.3
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 02:07:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f4CCojAbKprqiDXgJsBxQi1dboqNYmrDe8hXqe7epzI=;
 b=06Y+PzC5d+Wkv+lHCmSkdzY0ADqxSPOuY70VCqd1dP5N3la4xaT/oIbb6AF8ACkNLM
 xLpWXT0sg7WEWc/sl6vfziX/t+uPbtgWpLW4g83Gopb3KEty4Ha8mN6ha7WMeyomZg1a
 hZQJZH3tZBj1exPfo9/6qkeuS4nHl6kG6nK25lVyuck6FAKI22kFbD6ZYmu1B+ujX/TH
 qnW/kQS3yCJdR4REGzJRyArDbSILO0chvM/JrysjmMk+g1+2CoglEKh9TInicf5ryhQw
 7PAh9QHkJ0SQ/5WvgkogJ7aanYr98tTPhdnxGV8cxUgBqqLxF+tac4AISNX9mOyWZ/Im
 ebwA==
X-Gm-Message-State: AOAM530KHXvg8upWILI0nYDeLH+mYEGhj1ItNhOg1khSdxgPg1C89hp7
 pL0GzG1Qy4yhQ8wi7mvK2CRl93So0rVvAtOO9glz9+yUZko4Qb2XXCf6R/YpGP2vmu9bw0Hnh4c
 86cHT9SYnqYONPyc=
X-Received: by 2002:adf:dc43:0:b0:203:771e:1c1d with SMTP id
 m3-20020adfdc43000000b00203771e1c1dmr6775619wrj.609.1646993261848; 
 Fri, 11 Mar 2022 02:07:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxNo0V4EbDG9qcoFeDYc2bSvpI6LY27MjYp32ZOwlddG/rzE7+vWWhyIz7zXu0PHe4a2GiiGQ==
X-Received: by 2002:adf:dc43:0:b0:203:771e:1c1d with SMTP id
 m3-20020adfdc43000000b00203771e1c1dmr6775611wrj.609.1646993261675; 
 Fri, 11 Mar 2022 02:07:41 -0800 (PST)
Received: from localhost (nat-252.udc.es. [193.144.61.252])
 by smtp.gmail.com with ESMTPSA id
 u25-20020a05600c211900b00389d4bdb3d2sm8067951wml.36.2022.03.11.02.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 02:07:41 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v2 06/18 for-7.0] migration: fix use of TLS PSK
 credentials with a UNIX socket
In-Reply-To: <20220310171821.3724080-7-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Thu, 10 Mar 2022 17:18:09
 +0000")
References: <20220310171821.3724080-1-berrange@redhat.com>
 <20220310171821.3724080-7-berrange@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Fri, 11 Mar 2022 11:07:40 +0100
Message-ID: <87pmmsiyz7.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
> The migration TLS code has a check mandating that a hostname be
> available when starting a TLS session. This is expected when using
> x509 credentials, but is bogus for PSK and anonymous credentials
> as neither involve hostname validation.
>
> The TLS crdentials object gained suitable error reporting in the
> case of TLS with x509 credentials, so there is no longer any need
> for the migration code to do its own (incorrect) validation.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

Should be safe for current one (famous last words).



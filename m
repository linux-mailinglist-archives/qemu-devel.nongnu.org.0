Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2B768D204
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 10:05:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPJuj-00039d-9F; Tue, 07 Feb 2023 04:05:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPJu2-0002kQ-46
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 04:04:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPJu0-0007tS-F4
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 04:04:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675760675;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=0wwO1yj0VAzNWvH55odwkPufAPFa2tXVVA8svxW+6qQ=;
 b=RHWeLoAxV1NGdyrZ5Py3+5vCzux5cI8IRL85cphyrSAaWFDe35vTgSS65zaKpDxjKHv4Rk
 raBsM1mSz6TszRrINHUrZFsc/qlLHmtXKdhfGPlLTInOaVuqz464ROR8FIQLU7fu0HVUO+
 9RyYVkyelkHBjhknds2lNRnqTVitVeA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-618-e2UjH1pIPeSvikJAJeIcbQ-1; Tue, 07 Feb 2023 04:04:34 -0500
X-MC-Unique: e2UjH1pIPeSvikJAJeIcbQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 fl9-20020a05600c0b8900b003dfe4bae099so6622602wmb.0
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 01:04:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0wwO1yj0VAzNWvH55odwkPufAPFa2tXVVA8svxW+6qQ=;
 b=TvUVjVnEn2SpGLRh9lt2mpWLHwq7CGKRRENns+CjysrDQSlFqybJIalSwzw34tqHit
 7Ew3MTkNterDxkYSY9/z+LJwBlc4xpp2CS4OE45JQCaeeqn43DteufiUPQhZ2yNT6IMl
 alTrdrMxl66018i0LMX1+i8T3YZFxCCUTDQWTW1symeeNcjHf3my4fqQyZvzrrTCGcZr
 1m5k75plkfhJuZ5PnUWSI19t4h86WpQeg2hy2PYZ8KZVSgXsQV5CEBA5/XA2lSr5abXC
 1PXwfjvH3Swry7OeqSLMcqD/jWz3hi7dzHiImrz8WKIrMOtXd+HOsvpfUrUsRjsealzM
 QcKQ==
X-Gm-Message-State: AO0yUKUYcIe5981kqsKIH/svsZYnPeokuzP1MlVVoApkB4svBSFVlkef
 xz5r1yxhMLyG0f/+iWtlYzS0faQG0Gl6mkf69O9UC9Wehyy1maI0/zs9qjehvdfVQKkzvzQ0uAT
 xMURfvU5WWLctknA=
X-Received: by 2002:a5d:6a47:0:b0:2c3:be89:7c2f with SMTP id
 t7-20020a5d6a47000000b002c3be897c2fmr10322514wrw.18.1675760673393; 
 Tue, 07 Feb 2023 01:04:33 -0800 (PST)
X-Google-Smtp-Source: AK7set9VsgcO8tXIeb94XiwFGYUYLNCst5gyH5QBSR39NUr6B9oe0lfpYbpn/kXUkK4JeSq5LRlJFA==
X-Received: by 2002:a5d:6a47:0:b0:2c3:be89:7c2f with SMTP id
 t7-20020a5d6a47000000b002c3be897c2fmr10322494wrw.18.1675760673196; 
 Tue, 07 Feb 2023 01:04:33 -0800 (PST)
Received: from redhat.com (nat-252.udc.es. [193.144.61.252])
 by smtp.gmail.com with ESMTPSA id
 m20-20020a05600c3b1400b003db1ca20170sm14463369wms.37.2023.02.07.01.04.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 01:04:32 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,  marcandre.lureau@redhat.com,  mst@redhat.com,
 imammedo@redhat.com,  ani@anisinha.ca,  eduardo@habkost.net,
 marcel.apfelbaum@gmail.com,  philmd@linaro.org,  wangyanan55@huawei.com,
 jiri@resnulli.us,  jasowang@redhat.com,  pavel.dovgaluk@ispras.ru,
 pbonzini@redhat.com,  zhanghailiang@xfusion.com,  dgilbert@redhat.com,
 michael.roth@amd.com,  kkostiuk@redhat.com
Subject: Re: [PATCH 12/12] rocker: Tweak stubbed out monitor commands' error
 messages
In-Reply-To: <20230207075115.1525-13-armbru@redhat.com> (Markus Armbruster's
 message of "Tue, 7 Feb 2023 08:51:15 +0100")
References: <20230207075115.1525-1-armbru@redhat.com>
 <20230207075115.1525-13-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 07 Feb 2023 10:04:31 +0100
Message-ID: <87sffhalsw.fsf@secure.mitica>
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

Markus Armbruster <armbru@redhat.com> wrote:
> The QERR_ macros are leftovers from the days of "rich" error objects.
> We've been trying to reduce their remaining use.
>
> The stubbed out Rocker monitor commands are the last remaining users
> of QERR_FEATURE_DISABLED.  They fail like this:
>
>     (qemu) info rocker mumble
>     Error: The feature 'rocker' is not enabled
>
> The real rocker commands fail like this when the named object doesn't
> exist:
>
>     Error: rocker mumble not found
>
> If that's good enough when Rocker is enabled, then it's good enough
> when it's disabled, so replace QERR_FEATURE_DISABLED with that, and
> drop the macro.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>



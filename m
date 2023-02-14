Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB264696C69
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 19:08:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRziF-00085i-Up; Tue, 14 Feb 2023 13:07:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pRziA-00081s-T3
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 13:07:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pRzi9-0000AJ-9U
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 13:07:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676398044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MQtPHoYaminB0V51pLSMUCWpleUyw/OcaQhqOE1QpLA=;
 b=cYthcYakLwh86zxX+MTpwDG30SX1DHw7nqm9BUjF7J4vd5+xpM5JK1dUVjC+3Pe4AwqlqQ
 fIlwu5N5xKC6znL30ApxBl3v6ru31K7JL6DwZKSrlJtFV1sYEbsvg8YbsewGf72+O+MEXp
 4sOwh24nmmmbwdQDg+MBmemD8XlKegc=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-341-tPnAI6XaOgSWME65XJZsNw-1; Tue, 14 Feb 2023 13:07:23 -0500
X-MC-Unique: tPnAI6XaOgSWME65XJZsNw-1
Received: by mail-pj1-f69.google.com with SMTP id
 pv3-20020a17090b3c8300b002342e23955cso1254454pjb.7
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 10:07:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MQtPHoYaminB0V51pLSMUCWpleUyw/OcaQhqOE1QpLA=;
 b=CzLVxaW2BSdG59JfTu5KvfUxSpyYxxt+ZPlfl0jehgSWT531BGX2h2slurA7hl1buV
 3PCrIY5YP2cqDMV9gC8SUZv4cqIoERrWdx9lBQnT0dpdlHqXEoC8ComqO5KYurf4JwG9
 SmmyBLvvlPGZ5RmlvJ3LCFS5a0s2hIywzk7yQ0AyDxHm/Ogiw3JEWxnzC90eKNLdMVca
 LkoW2Ia6Pb33dq9HBgCxKvvP9oqWhKB5EaZmOgnjyS2meptMYLQKt4yqZ0Q6PkqweGSM
 KdH3vP8h87FJ7I4q4PUjwkXBl3bug1R4yqNtZH9grfXUd1qIqLJJOGJm7vfagjZalXPp
 TlKA==
X-Gm-Message-State: AO0yUKUyoS6IXsjGCB15WPrM0KmVunaOtQWiDMONCNqbH6n2zW0OZH8t
 rMS8Gx95ayxZn05wYbswFsmG9WsMcxkw+VW0kI2UNHmZ1eBKbDL4UVIhXuBWK5tpJu/vytbJ86q
 +zBGmeaZ2NyNfX+p3NJw30xhTMcExjng=
X-Received: by 2002:a17:902:9f97:b0:19a:9b8c:279f with SMTP id
 g23-20020a1709029f9700b0019a9b8c279fmr891689plq.26.1676398041597; 
 Tue, 14 Feb 2023 10:07:21 -0800 (PST)
X-Google-Smtp-Source: AK7set+ZiFnrtT67tViW+6HkBnl9nVXekR4kCv7UnaxQQPOkyTixYoJCM03kem0VUe5RhPJ8owy9tPTYltSdKEQoeLA=
X-Received: by 2002:a17:902:9f97:b0:19a:9b8c:279f with SMTP id
 g23-20020a1709029f9700b0019a9b8c279fmr891682plq.26.1676398041295; Tue, 14 Feb
 2023 10:07:21 -0800 (PST)
MIME-Version: 1.0
References: <Y+VbmXj2be2rBWMN@fedora>
In-Reply-To: <Y+VbmXj2be2rBWMN@fedora>
From: John Snow <jsnow@redhat.com>
Date: Tue, 14 Feb 2023 13:07:10 -0500
Message-ID: <CAFn=p-ZrEus58Dfp4R6qnC34-KVy0xhHsDXB359DQ=4uKuRupQ@mail.gmail.com>
Subject: Re: "patches" tool has a new patches.json URL
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Feb 9, 2023 at 3:46 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> Hi,
> For those using the https://github.com/stefanha/patches tool to work
> with QEMU patch series, please update your configuration file to the new
> patches.json URL:
>
>   $ $EDITOR ~/.patchesrc
>   [fetch]
>   url=https://patches.qemu.org/patches.json
>       ^^^^^^^^^^^^ new URL ^^^^^^^^^^^^^^^^
>
> Sorry for the change, we've been migrating QEMU's servers and it was
> time to stop using the wiki.qemu.org server for patches.json.
>
> Stefan

Thank you, Stefan :)



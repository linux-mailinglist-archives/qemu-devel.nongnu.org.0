Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D95FF23B6E0
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Aug 2020 10:37:17 +0200 (CEST)
Received: from localhost ([::1]:44118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k2sRg-0000vJ-Uu
	for lists+qemu-devel@lfdr.de; Tue, 04 Aug 2020 04:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1k2sK2-0004AZ-Vl
 for qemu-devel@nongnu.org; Tue, 04 Aug 2020 04:29:22 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:46486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1k2sJz-0000d9-NI
 for qemu-devel@nongnu.org; Tue, 04 Aug 2020 04:29:22 -0400
Received: by mail-wr1-x444.google.com with SMTP id f12so689690wru.13
 for <qemu-devel@nongnu.org>; Tue, 04 Aug 2020 01:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=GIa8l8JMwmELsls/Au6Q7tJ/epyxjBh2ISKWRQMF4So=;
 b=YvI1+Od74ARf7NQyN8D7nlbVcMap9xpn3JLMBugjBtzoUBN20ZskEd5/nxkoH3B2nO
 /JB5TZGXBMu8coY1NZb258blm0oUCTiLkSLBoSAvT9L4hbjhADahBR64cj3msppIO+wv
 czQ1gDt6zKFyUC02JWDqTr9MuiBex1yEHGI/Xd+sJpJJXtHKDUMazfQReuW0k165bWrQ
 LxgXtWyxK9NcDQZDkrwVK6RBeXVbt6j01ECkieXTaHgUVhbwjvUFaxEgJI7qywwFz3ke
 p+upGFwj9hTScEm8PHDI02wv13dJKZHF0onYAobcIkcX8maGQHAVwsJjBwi+Xa5SPhLX
 xpzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=GIa8l8JMwmELsls/Au6Q7tJ/epyxjBh2ISKWRQMF4So=;
 b=iuX+CScIsK1XyTduem3WPqvYElY28KkMvzbAYDPSmlgVI5D26y//KwwRs6FYA9WDzn
 H+4w0gkTtnWjU4wlAThkVZFHqxOXTiy7Xgj+YLRsulnl/wTtvipivbYFDXwaSoZxg012
 6Atb3WFK5a2ebAkXhLEYOZFWQgA7um9Xt2o9D3RpPyto1pAAhPkbNQM+B3XgR5XOUEo4
 G9WjQ/6ngZBdh1bOVWefblHA/ZYu7n5NeZ9Gj8M8PC6zVY4e1c4U7hDfFE5pq9xxa9+u
 xJnZDCtyl+95faTSlNlssR9za3TX37k7dOxqql0qpgMDSoCqmfCMqnK2rHQL1/b9wC8J
 lWrg==
X-Gm-Message-State: AOAM5310Ff0gGZ2oLES4PBCMyhYyAlO3R3KlgMS9csjLl+iI8zFhoUk/
 ktR/RfW6S92hJjJ2iNPGqv1ZWw==
X-Google-Smtp-Source: ABdhPJyhqgb9EbCjFWtgxpBX2mj88Czp44UgF1cLuPvC4EvspKeDscYIMouKmz3HB2TIns6uncmOBg==
X-Received: by 2002:adf:c983:: with SMTP id f3mr18246109wrh.348.1596529757771; 
 Tue, 04 Aug 2020 01:29:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l1sm30891040wrb.12.2020.08.04.01.29.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 01:29:16 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6B2DE1FF7E;
 Tue,  4 Aug 2020 09:29:15 +0100 (BST)
References: <20200729185024.121766-1-abologna@redhat.com>
 <87ime52wxd.fsf@dusky.pond.sub.org> <20200730093732.GB3477223@redhat.com>
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH] schemas: Add vim modeline
In-reply-to: <20200730093732.GB3477223@redhat.com>
Date: Tue, 04 Aug 2020 09:29:15 +0100
Message-ID: <87tuxin7ac.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Andrea Bolognani <abologna@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Thu, Jul 30, 2020 at 11:07:26AM +0200, Markus Armbruster wrote:
>> Andrea Bolognani <abologna@redhat.com> writes:
>>=20
>> > The various schemas included in QEMU use a JSON-based format which
>> > is, however, strictly speaking not valid JSON.
>> >
>> > As a consequence, when vim tries to apply syntax highlight rules
>> > for JSON (as guessed from the file name), the result is an unreadable
>> > mess which mostly consist of red markers pointing out supposed errors
>> > in, well, pretty much everything.
>> >
>> > Using Python syntax highlighting produces much better results, and
>> > in fact these files already start with specially-formatted comments
>> > that instruct Emacs to process them as if they were Python files.
>> >
>> > This commit adds the equivalent special comments for vim.
>> >
>> > Signed-off-by: Andrea Bolognani <abologna@redhat.com>
>
> Given that we already have emacs mode-lines, I see no reason to
> not also have vim mode-lines, so regardless of the deeper discussion
> I think this is patch is fine to merge in the short term
>
>   Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

We could remove them all and defer to .editorconfig but I'm not going to
get in the way of making our Vim brethren's lives a little easier.

--=20
Alex Benn=C3=A9e


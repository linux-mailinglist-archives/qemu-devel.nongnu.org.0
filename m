Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3C33703DE
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 01:00:48 +0200 (CEST)
Received: from localhost ([::1]:54574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcc7p-0006wG-KM
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 19:00:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcc5o-0006Xb-PM
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 18:58:40 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:35549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcc5n-0000VW-26
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 18:58:40 -0400
Received: by mail-ej1-x62c.google.com with SMTP id u17so107626403ejk.2
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 15:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4DK9gMqtb+maJw2WuB0jtYlj9eVQuccew2j0oi3l314=;
 b=jp0mmutU6GNfjZNWPKd6wi7p/Hf18ee38ENEzhhFHRUopLd4bQI6w0XZOHh/ZObwMN
 RKq+XYke5CS/BPec54uQjgBWjObv68uI569aJea1jwxwxuOif+ve2UsIDPPO1DsobfTU
 +rm+0o08kcOvf4r+UolEQAHSo3cQNV7CFYKDpO/qdkyHoKwHQhZczzkvlvFaMFx+2M9v
 8mk+YpuiFVmre5XdDE9LxuMGwHxxcKXwp4fk5qk7ba2SJ5yEWdYWqB2+RQPfa/8Wk/Di
 gfHzmmE2Sr5g8B0dHwXWlPWriw4kJkTLVx9iYmOchhk3yUTcqy/K/GscpyHLyh7kt5Mj
 x7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4DK9gMqtb+maJw2WuB0jtYlj9eVQuccew2j0oi3l314=;
 b=hLaqyFDgPX9O+QsKk+8xaUuckYagPOtBTmPEJ0p3NMyeAYTAA6oyrH/evfGbLWkH3E
 0HL5peaeZaWEhpEw7wqMNsRiN3WfiXdEUsNjxc2Rbl2/EdaEsIUH+1w+n/xNOPQ4TFyN
 EAiazH5nxWy7rwuK9oucQuVRE6tmktdFa0ZuRFXbXpEgWX4Kg7mfzGsZXNOMnsVbxTOD
 hS/6VLwoa1sa+d81VSk+wDSswCxG8bjLfVTpIH9VIgQH6JBSBdTdUSA2+PpDE24mXzen
 S4KAknJc+UynFaZDMA5QvyWsAG7MtmU3xlVvap9A9E7QWQbcS03VypVA46An0+olTCTs
 BnHA==
X-Gm-Message-State: AOAM531zQv7uKERkAtG3UM3SI8fzdpcksqSvdkUtHOgH6FSvMR+fxnxO
 OJz8w2QNbkbMwKewHk0DLWbyoZMMxCJDZfPd1BDpkg==
X-Google-Smtp-Source: ABdhPJxasP1+cuWcPBZKhj4e0bY3BHtDm9Bicc8/WEZlIRxrut+BfVcGJEVTCok/0LxsH2GypHBmDHF9hZWT7RlEsTw=
X-Received: by 2002:a17:906:11cc:: with SMTP id
 o12mr6850727eja.85.1619823517193; 
 Fri, 30 Apr 2021 15:58:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200122111517.33223-1-quintela@redhat.com>
 <20200122111517.33223-5-quintela@redhat.com>
In-Reply-To: <20200122111517.33223-5-quintela@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Apr 2021 23:57:34 +0100
Message-ID: <CAFEAcA8XG2ATagb=ed5oDW=PsMBzAYoQK3DN6Os3_oMusYkAuA@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] migration-test: Make sure that multifd and cancel
 works
To: Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 22 Jan 2020 at 11:20, Juan Quintela <quintela@redhat.com> wrote:
>
> Test that this sequerce works:
>
> - launch source
> - launch target
> - start migration
> - cancel migration
> - relaunch target
> - do migration again
>
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Juan Quintela <quintela@redhat.com>

A year-old commit, but we've just got around to running Coverity
on the tests/ directory, and it spotted this one:

>  static void migrate_set_capability(QTestState *who, const char *capability,
>                                     bool value)

The 3rd argument to migrate_set_capability() is a bool...


> +static void test_multifd_tcp_cancel(void)
> +{

> +    migrate_set_parameter_int(from, "downtime-limit", 1);
> +    /* 300MB/s */
> +    migrate_set_parameter_int(from, "max-bandwidth", 30000000);
> +
> +    migrate_set_parameter_int(from, "multifd-channels", 16);
> +    migrate_set_parameter_int(to, "multifd-channels", 16);
> +
> +    migrate_set_capability(from, "multifd", "true");
> +    migrate_set_capability(to, "multifd", "true");

...but here you pass it the character string '"true"' rather than
the boolean value 'true'.

This works by fluke since the implicit comparison of the literal string
against NULL will evaluate to true, but it isn't really right :-)

CID 1432373, 1432292, 1432288.

There seem to be 7 uses of the string "true" when the boolean
was intended; I don't know why Coverity only found 3 issues.

thanks
-- PMM


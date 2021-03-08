Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B286A331061
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 15:08:05 +0100 (CET)
Received: from localhost ([::1]:60880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJGYG-0002iV-Nx
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 09:08:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJFv2-000319-Be
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:27:32 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:34000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJFv0-0007dh-NE
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:27:32 -0500
Received: by mail-ej1-x630.google.com with SMTP id hs11so20394765ejc.1
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 05:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=i4hhXUaYb761kkFeA5Q3p//rkyZEmF/NY0wcW+Et2dA=;
 b=SwEd2mSLNjlna7WmUBya1mwd3VoNpftRgkLKj+fbyzdSJfmopu0uSufDp7P26j929/
 MIIiQ5mDY+QWf2NLFObKBw8kRSYBwA45P28OsKXfZEo3KHtESlueRiyhUYx6OEkGfSWT
 QYd24luPSOuq1ZU6/ua7Y1QG9ryiG6WnhRPbBeKn0C8+9Byl+FdZIeSfvUUiDayKkRBp
 Q1vio2UwBM7+ZEERU41bkImUK0rsdQa7Ztw3TaLRCQlF1s7kyGwm5I86g2K6tvUGGSgL
 FqP9QotqLH+TVkWDWyuz6LgsuDCd5JSW4z6KBcUOPjUcFtUx2YrvrrxWBzu33JMav2r+
 ap8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i4hhXUaYb761kkFeA5Q3p//rkyZEmF/NY0wcW+Et2dA=;
 b=YZgQcXEjQD2y48n9Ab62vBTHIqSxbsg/egm7Z55Qddr2xHkNgn3WY+6Lsuo4s39yhz
 YVnHpZNVYqkoM666HT6MPsbGVkUrj46ZGaK/aBHKqfFI7WbGHkRaLGbH/wKfh7X0oo/b
 OQmkEycksGxBEZYwy9CcosCLD4f0OIU9A7OPsGTq/i1YOxq8CCdi8YiABmxgWXMmoCXP
 nt0y4/6xab0nXoYh4XNhoOgTBVhRJUu+ZyViK3arkOq3aEp7rWuxPa5R0rWCega1FeLA
 aQjrlM+taZLM3sX25hDsbGIH8VY/z3Cd1YL18/fXgNHxS37oAhzykKR/XdxOnAAMPeyh
 GOaw==
X-Gm-Message-State: AOAM533wsFVYOZ2R9fpixm2fvJiQUfsJ970omV0NppgQdCsgbZVubEgg
 4aHhipYgOBPLj+zhjOw+KqsYtnL2Q8c=
X-Google-Smtp-Source: ABdhPJy5kivV/r4HUD+iv6MOkI9yHYo/sp9lCDbFp6Uu0caG3RL5CQ/tvpXsJIRYMMg0qquNFC9gIQ==
X-Received: by 2002:a17:906:3b99:: with SMTP id
 u25mr14949685ejf.277.1615210048740; 
 Mon, 08 Mar 2021 05:27:28 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q22sm6627101ejy.5.2021.03.08.05.27.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 05:27:27 -0800 (PST)
Subject: Re: [PATCH v26 00/20] i386 cleanup PART 2
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210301085450.1732-1-cfontana@suse.de>
 <cfeead83-4890-bdd8-c5cb-9bdb2ca24abb@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6230ef40-c0ec-875e-dbd3-46fb5925322e@amsat.org>
Date: Mon, 8 Mar 2021 14:27:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <cfeead83-4890-bdd8-c5cb-9bdb2ca24abb@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Claudio,

On 3/8/21 1:57 PM, Claudio Fontana wrote:
> Hi,
> 
> anything else for me to do here?
> 
> The latest rebased state of this series should be always available here:
> 
> https://gitlab.com/hw-claudio/qemu/-/tree/i386_cleanup_8
> 
> When it comes to the ARM cleanup series,
> I would like to have the tests pass for ARM, before doing even more changes, could you help me there Philippe?
> 
> Maybe applying some of your changes on top would fix the failures? I tried, for example with the arm-cpu-features ones, but it didn't work for me..

TBH I wrote these patches during my personal spare time and this
became a real Pandora box that drained too much energy. I prefer
to step back and focus on finishing smaller tasks before burning
out. That said I appreciate your effort and am interested in
following / reviewing your work.

Regards,

Phil.


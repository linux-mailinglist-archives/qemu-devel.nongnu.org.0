Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A38E632F98
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 23:12:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxEzn-0007xI-Ft; Mon, 21 Nov 2022 17:10:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oxEzh-0007vU-OH
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 17:10:25 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oxEzf-0007WZ-7b
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 17:10:25 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 m7-20020a05600c090700b003cf8a105d9eso10017841wmp.5
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 14:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HUz2SV9jmYBMm+2fNl8Mzpi9ahY8L3ES46riBu78VyA=;
 b=hDf69OopnkDEJBh4V6wGphX1CKNwZM0SarGwZI9OO15QGRnWWLpdPVLKm1WCO5Fi+t
 wG9kQtrzAnHJDnijrQJ4d51qaOT+xSMIGf4RfOnAmzhukzFCm0+/gI5yl3udw4XKr43c
 NCJNop86Cipqvha5P+UKdJ5p6KBg/yqjxDQ5bG9w5qeMh5dXlB5oa9N9RWfNKUwgRdXZ
 acsa8j/Ku2JBn9j8SCBFOHUWnBYeXfktqU3CZfw+WctxYhAktKfGH3TOq6WsL5S6/Lz7
 cc6wUhrhJjNUDsSi8UIFhundyJ4hFAiF8mUb70EgO16UvMlPCbGtdNpMAdxUTeE/tDXU
 u2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=HUz2SV9jmYBMm+2fNl8Mzpi9ahY8L3ES46riBu78VyA=;
 b=mxfAFHqiZxn0ilLngnstcSc7+cBf99yHNJrYOR1Ek8yEvzEdcNY2K6RwlMETDZvG1n
 oAu976ptfU0u/thehoUhpXXfY01RUv0fDHlUwL8z+y2SAGAhV7CPNF/yUaOnMkFn1xs5
 Hhylnk3ZmVCmeYGfrv/rxgBqlOH2unM0p+acAfmY+hUF5weEnRzsbDOrSog8+imf8Slp
 CE7j+KyD8FLbA5c1wlurTY8AZ4LhmVN4U4+VOwxBtqmh8bD7dzk4RlJ5NWEHZ7oUzrsD
 Ruja95QG+36wNa75xeuiJDOJxe7cXtJmQ2SXFxXx9bbFP0wI9wqhFy1LfD2WuetHiVv8
 vcgA==
X-Gm-Message-State: ANoB5pliHfuEX63CgWZqjS0D5soIxpIvIgr1He1ab4xPXh5AZ6DE7FYx
 sj9MtgntovHk4qNOR3/QOdZGpw==
X-Google-Smtp-Source: AA0mqf7F8ZrGk2Wy2DyIUB+Xe2EaIyN2cwXVrrFd+xuF2M6CmzGDIrNPzbVAYgXNmhnpc7jxpwtskw==
X-Received: by 2002:a05:600c:907:b0:3cf:a5df:8bb6 with SMTP id
 m7-20020a05600c090700b003cfa5df8bb6mr588083wmp.37.1669068620815; 
 Mon, 21 Nov 2022 14:10:20 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a05600c4f1200b003c6f3f6675bsm21467500wmq.26.2022.11.21.14.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 14:10:20 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AA46C1FFB7;
 Mon, 21 Nov 2022 22:10:19 +0000 (GMT)
References: <Y3QNRWUK8BLRQlaQ@strawberry.localdomain>
 <878rkbalba.fsf@linaro.org> <Y3gAIEythPY+z0q0@strawberry.localdomain>
 <Y3gA/i8bBkR7mgkQ@strawberry.localdomain>
User-agent: mu4e 1.9.3; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Cc: qemu-devel@nongnu.org, "Emilio G. Cota" <cota@braap.org>, Richard
 Henderson <richard.henderson@linaro.org>
Subject: Re: Plugin Memory Callback Debugging
Date: Mon, 21 Nov 2022 22:02:08 +0000
In-reply-to: <Y3gA/i8bBkR7mgkQ@strawberry.localdomain>
Message-ID: <87wn7oarhw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


Aaron Lindsay <aaron@os.amperecomputing.com> writes:

> Sorry, left off the very end of my timeline:
>
> On Nov 18 16:58, Aaron Lindsay wrote:
>> I have, so far, discovered the following timeline:
>> 1. My plugin receives a instruction execution callback for a load
>>    instruction. At this time, cpu->plugin_mem_cbs points to the same
>>    memory which will later be freed
>> 2. During the handling of this callback, my plugin calls
>qemu_plugin_reset()

The final plugin reset should only execute in the safe async context
(i.e. no other vCPUs running code). That flushes all current generated
code.

>> 3. Ostensibly something goes wrong here with the cleanup of
>>    cpu->plugin_mem_cbs???

This may be missed by the reset path (hence your patch) but it should be
being reset every instruction we instrument.

>> 4. Step 2 triggers the TBs to be flushed, which frees the memory pointed
>>    to by cpu->plugin_mem_cbs=20
>
> 5. A store exclusive instruction is translated and then executed, which
>    requires the use of a helper. When executed, this helper checks
>    cpu->plugin_mem_cbs, which is non-null, so it attempts to dereference
>    and use it, resulting in the assertion.

It should be being reset for each instruction I think.

>
> -Aaron


--=20
Alex Benn=C3=A9e


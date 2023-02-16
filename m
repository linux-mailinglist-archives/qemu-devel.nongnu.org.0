Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B98C7699115
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 11:24:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSbQL-00069u-5b; Thu, 16 Feb 2023 05:23:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pSbQJ-00064D-5M
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 05:23:31 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pSbQH-0001a4-0N
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 05:23:30 -0500
Received: by mail-pf1-x432.google.com with SMTP id r3so1141172pfh.4
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 02:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1676543007;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qF4xFLnMHBKEml2AutB7MUFOJuO3omVk9yCB0KBkUV0=;
 b=Q4CGNwBigZMMKyqn/yw8bVPrau63aRCYI7COHya4oVnXQujAb56TeKUfX/FkfAR0br
 7OwyYY4eq2CXi6qY3DUSmzbpZEkN3FpJ85Yhqy5f8akNj5lupww7muuGuk/58+oyGjMn
 m/EsZKB1BKdiwgZWJGvuRfn3fSOBp4vkKJ/7S+o6OqtfazrFO4bLMEQjAr2TEQjPj1UW
 NKdo6jKmnQ4yQzPFZq8vtwV76aMQhA7yp7Sp2dZeglNaCLb/+E+vgzMtnvUKACI4Dlo2
 TLq7H75dsRuJoMVPSVr2+n+DRgYLnEF6784GkX+FCegfl6tm5WUvx0pbiHKdh5QFCv0I
 IxqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676543007;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qF4xFLnMHBKEml2AutB7MUFOJuO3omVk9yCB0KBkUV0=;
 b=Vs5Kh4IfiIu/WmUop5UIkRidNpc8HZOyKCz/ubchra7GBhhbZRpyKRvPKRT2Q/J/lq
 4yh0umOm9977rtUk+PyUFuDEdRzlu4J+w+S58taMnFaAaRd+4NfWZpdJPa6g8pr5XSvP
 os31gxrKZVOeD7FuA3l6qHcieYKgatMru1Xb6JDNs6LWreNfD8OTJQ1T5yR8LcC/x7b2
 8ZTCKMTxQDa9HtqKh6nmCJ8d6yle3EuDn1ASzDZ2hN5jw4D9kr+Ru1gHnEIVCRKStIMg
 9EGZWzT8vai/tN7PxOmLLCgN8B1BJC7dcoRs6QJifut9tvQBYPdEL5eyrNalw88YQWht
 Aohg==
X-Gm-Message-State: AO0yUKV4YyJ7KgLmk4zhVxwJxP+KDvH0H8i+a7ugpP6Rim5jRKB6QHc6
 9f+lakzNZNhOf7DvxOvqww7UNbxvYfsndXgNTlYUrieb+hpnyg==
X-Google-Smtp-Source: AK7set9g7gxYdLhPlhMc/tiPuJgHkc+CUILmjOcdY+IUigQv+x+FYtVfZoK0qID31vsqg25H2JPNYKWn5LAK1G+sjkU=
X-Received: by 2002:a62:840e:0:b0:5a9:babe:6cb9 with SMTP id
 k14-20020a62840e000000b005a9babe6cb9mr13867pfd.48.1676543007244; Thu, 16 Feb
 2023 02:23:27 -0800 (PST)
MIME-Version: 1.0
References: <20230215234846.GJ95670@funkthat.com>
In-Reply-To: <20230215234846.GJ95670@funkthat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Feb 2023 10:23:16 +0000
Message-ID: <CAFEAcA8UDrzWQjutAwWQE2kzP7-RgjbFCnWb2j4ve+UARnHh7A@mail.gmail.com>
Subject: Re: Detecting qemu from guest on arm/hvf (apple arm)
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x432.google.com
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

On Thu, 16 Feb 2023 at 02:05, John-Mark Gurney <jmg@funkthat.com> wrote:
>
> Hello,
>
> I was wondering what the best way to detect that FreeBSD is running
> under qemu/hvf on Apple ARM?  FreeBSD doesn't see the ACPI FADT table,
> so I'm wondering if keying off of something like the QEMU0002 device
> in ACPI is the best way?  Or is there another option?

I guess the question is, why do you want to know? Typically
the guest OS shouldn't care about whether it's running
on bare metal, under a hypervisor, or under emulated QEMU,
except to the extent that it wants to use specific features,
in which case the question is more "how do I query for the
existence of feature X?".

thanks
-- PMM


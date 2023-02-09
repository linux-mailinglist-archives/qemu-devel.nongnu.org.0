Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD5669084F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 13:11:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ5lW-00061B-VO; Thu, 09 Feb 2023 07:11:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pQ5lT-0005s3-Bc
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 07:11:00 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pQ5lR-0002IC-3T
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 07:10:58 -0500
Received: by mail-wr1-x436.google.com with SMTP id j23so1597585wra.0
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 04:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4qw+oYzl+QyY6xS8TU5UPKWdodxsfQk+KLl+LSVcIeQ=;
 b=AUYr0ySJhyRhLN44KLtYGrDw9dI3GrbHvKAvA7cBcX4a5rLY9CflUfTxt/Fo0qATun
 8JQdRQxgNFqYSfajU6kyIToAglbvXVOSeGtca+aSuaS4qpzX8YoY8Dpxwiopxybf5Cuu
 qVx3nNJIkfE5uBD5L+Xc3pkhYHwaGsNNnLBLpJFESaeK0n2jx9y7Jv0RZfqp4QTHfYPG
 HF50WYyKHyfvhz3DaLuhmdPSPFjpjQ6Dpiv6hSaUSrAC5/0UEfReJijhX0zAYTM6dOPH
 LXcms9XPgcI+VJCaygM9wqilRBg/SinWd2NGC3mGREbUKDP77NOfi+vBRnIiqk2rzSmn
 cCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4qw+oYzl+QyY6xS8TU5UPKWdodxsfQk+KLl+LSVcIeQ=;
 b=LZLNBcZePZHtLuCLDA146ydGBb+IqVV1lYI22x+umrr1WVcE/JA1rM/9ut1zgvWfHk
 xeyNQRX3eWN7CWBKDDH+WLrqJ6c3ez6RMxFsw7neqtdLBTuXoypLc1O5br70YSQQz6Te
 1pTHNozyLQEoQRAfoWEVgIAFg4bXD3ix9R38V4+Wq02pZFxk9xeI1tvSu86ju2+vXw78
 xTGAmlqD/yslO2VY70ij6qU0c6m2LFinUOO3eIUPGmXmtiivbkRk6/GChWlqc3/8+dlm
 jvXGiVZ0nAosLG8GSmGKkdz7j53pcgLEADXBdI5a2WXgx230HWRVn+BIp10lVXnhsp0/
 IynQ==
X-Gm-Message-State: AO0yUKVO15nL0boMLe+12tX7LFfvSBYfI1x2ZykhcFJv8zeYyBQjA+ZU
 AgiLdUcx3oDdLlwAF04iA1xQv8wbpuvvA/HL
X-Google-Smtp-Source: AK7set92NYM4Qm0bwKnlEomrTvsmwTOZlqEefyOJGw9YKvSy4vOaXfv6FviULarepjWBIIhDdLU5bw==
X-Received: by 2002:a5d:5341:0:b0:2c3:eaff:aaeb with SMTP id
 t1-20020a5d5341000000b002c3eaffaaebmr10813954wrv.21.1675944654290; 
 Thu, 09 Feb 2023 04:10:54 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m7-20020a056000008700b002c3dd82a0e9sm1089572wrx.91.2023.02.09.04.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 04:10:53 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3718E1FFB7;
 Thu,  9 Feb 2023 12:10:53 +0000 (GMT)
References: <20230209102754.81578-1-het.gala@nutanix.com>
 <20230209102754.81578-2-het.gala@nutanix.com>
User-agent: mu4e 1.9.19; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Het Gala <het.gala@nutanix.com>
Cc: prerna.saxena@nutanix.com, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 1/6] migration: moved hmp_split_at_commma() helper
 func to qapi-util.c file
Date: Thu, 09 Feb 2023 12:04:12 +0000
In-reply-to: <20230209102754.81578-2-het.gala@nutanix.com>
Message-ID: <87v8kbm436.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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


Het Gala <het.gala@nutanix.com> writes:

> renamed hmp_split_at_comma() --> str_split_at_comma()
> Shifted helper function to qapi-util.c file. Give external linkage, as
> this function will be handy in coming commit for migration.
>
> Minor correction:
> g_strsplit(str ?: "", ",", -1) --> g_strsplit(str ? str : "", ",", -1)
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

I think there has been a misunderstanding here about when to apply
review tags. Looking at v2:

  Subject: [PATCH v2 1/6] migration: moved hmp_split_at_commma() helper fun=
c to
   qapi-util.c file
  Date: Wed,  8 Feb 2023 09:35:55 +0000
  Message-Id: <20230208093600.242665-2-het.gala@nutanix.com>

I don't see any of the above developers responding to the message with
an explicit Reviewed-by tag email. We talk a bit about the process of
applying tags in:
=20=20
  https://qemu.readthedocs.io/en/latest/devel/submitting-a-patch.html#prope=
r-use-of-reviewed-by-tags-can-aid-review

There are tools that can help. For example the b4 tool can fetch a
series from the mailing list (via kernel.org archives) and collect the
tags and apply them to the patches. It will also add Message-Id tags so
you can go directly to the thread when the patch was last discussed.

I would suggest you remove the tags and re-post a v4 of the series.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro


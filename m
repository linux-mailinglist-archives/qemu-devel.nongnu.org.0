Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CEA42A7CA
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 17:02:29 +0200 (CEST)
Received: from localhost ([::1]:47774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maJIQ-0004fP-Qu
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 11:02:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1maJFl-000344-Ca
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 10:59:41 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:37635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1maJFi-0006pn-Ga
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 10:59:41 -0400
Received: by mail-wr1-x42a.google.com with SMTP id e12so67849596wra.4
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 07:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ikVVv1M7q+jpOBlwTdQK6Roa7jXZQIcDztGD1IoZA78=;
 b=E0/G8hvJSlgpjCvDRnsCuJR1XGRR64zGv7jRF0tznVrfNAjOXrYnh89aYdFSomkPRg
 i3iI2zdzegpQot6/HTU+avhLm6Savi1LcNzBURYmQPDqFHa7Ji07SIBwYS6DsN0PHXhO
 5PbWNvYVA0gRNFIfP9qy9MExyLjo3VoMLnmt71zuBP5hdGkO8tgXKtIwBkTXpSqxvi5p
 An57PDHO18JnWiY0HpoVnk0YOq1wY3vvvmZ0a1RYOzJX60AVpsKghTvcqfwndN9h/bzn
 R+0fQniIHmfCObKQmzk1WyvWYXELK/XFq3H87flgtwU3Kuxe1YOX5uREm31N0sCqm1mj
 +l3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ikVVv1M7q+jpOBlwTdQK6Roa7jXZQIcDztGD1IoZA78=;
 b=trKU48KIpce/LqRxXQRHOP+kMLA3Mn5qzLlwq1SLAK8xX0NjpcfTWcl9K6hD22UVYE
 JMetD5Cfytf0zhXP7cTIsLMIn3wMgm3hzI9iXPGr6Pt9/rn+Yrv4CeOpAKMiuquFSwhn
 tmmFvByi+hDv9iRxRYwbalKX3TvuVz8x2/tb6YMmmIG9RMthbZVOPg2rmVE0JfA/3q7S
 DkHyv4d5f/qPkm0QBZjRBDdLaiZ4JX579Td7M+tn1sOwomZ6p8LxuAO0ryTcVpycJwrz
 NCZGO7KwAZmb6APqoeix8Di5nfP7VWOSYBX3JE9MbJ8XwZs4mJIw9vKVnVLAxR8H/mwb
 bkaw==
X-Gm-Message-State: AOAM530Sm2hQoM+uT7nsurwVcJChKBKcYoVyX6YRJX1qMo6sHVOyIZYH
 05lbH18RiMniVhXV8awBFe/IiA==
X-Google-Smtp-Source: ABdhPJwIPy5Z2zX8AqHjU7vux27mGLnKkuCXy/CNt3ENnOvd2steqbO5a2Q+5zRleeJuKkYLsfB75Q==
X-Received: by 2002:a05:600c:1548:: with SMTP id
 f8mr6338187wmg.35.1634050776639; 
 Tue, 12 Oct 2021 07:59:36 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x21sm2735196wmc.14.2021.10.12.07.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 07:59:35 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 211711FF96;
 Tue, 12 Oct 2021 15:59:35 +0100 (BST)
References: <20211012093128.3909859-1-alex.bennee@linaro.org>
 <b512ff29-4db2-5574-7e2b-b806db624d0e@linaro.org>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [RFC PATCH] target/s390x: don't double ld_code() when reading
 instructions
Date: Tue, 12 Oct 2021 15:52:13 +0100
In-reply-to: <b512ff29-4db2-5574-7e2b-b806db624d0e@linaro.org>
Message-ID: <87lf2ywap4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: "open list:S390
 TCG CPUs" <qemu-s390x@nongnu.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 10/12/21 2:31 AM, Alex Benn=C3=A9e wrote:
>> For the 4 byte instruction case we started doing an ld_code2 and then
>> reloaded the data with ld_code4 once it was identified as a 4 byte op.
>> This is confusing for the plugin hooks which are expecting to see
>> simple sequential loading so end up reporting a malformed 6 byte
>> instruction buffer.
>
> I think the plugin stuff could be more clever, knowing where the read
> occurs within the sequence.  Otherwise, we should simplify the
> interface so that it is not possible to make this mistake.

It's plugin_insn_append which is doing the tracking here so we could
extend the interface to include the current pc of the load and make the
appropriate adjustments. That said it's a bunch hoops to jump every
instruction when we could just as easily add an assert and fix up any
cases where we do. I guess it comes down to how prevalent double dipping
in the instruction stream is when constructing a translation?

What happens if the protection of the code area changes half way through
a translation? Could a mapping change in flight?

>
>
> r~


--=20
Alex Benn=C3=A9e


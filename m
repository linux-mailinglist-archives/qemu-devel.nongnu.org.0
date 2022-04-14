Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B936D501353
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 17:18:32 +0200 (CEST)
Received: from localhost ([::1]:46238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf1Et-0001RH-Hm
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 11:18:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf1DS-000892-4E
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 11:17:02 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:42868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf1DQ-0002wJ-Jg
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 11:17:01 -0400
Received: by mail-ed1-x52b.google.com with SMTP id t25so6764240edt.9
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 08:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=gZdByVB3s3+CxbZatNfrLRvQhfiRUVRi6jCo9lW1yH4=;
 b=y/q9EIbrsEimvuZgktP70rQzn51j8+ZE0MzWRh9VFy+8PEsEO35D8TOPRLxhywzXUK
 c17lBWlnaulxmAtsS0icSlFv6qLey8QLS17shSnIo2VXm3Dm0Bj3+7bCVCUt/1wlycM5
 qXNImXAkjrLU6u25AImJiVixaaXWLrs+GlFFZWw/wV4H5LfzAocGSpkrrvbtbW4R/Rku
 Lkrq3XmAFzI4pt6eDQMKzUddg5hCXlgB8hvy84Hblguwfim2RmbCNYy5ytu7o18yEsvl
 f8jp8PhWTWrtkcRhWXLzpwne59kMHt6Lb5jyOizYobPzjRITpWbjgznqhXe1vHyz38+e
 jLaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=gZdByVB3s3+CxbZatNfrLRvQhfiRUVRi6jCo9lW1yH4=;
 b=KSKjn7/w+bi7ME0uQHJod+DxaeukjDKYBOm08qHKqUT3AD1bXBs+6BQDrCbs/TwNeX
 mGixTCDKITPMMfLKk7AQ/BoGnQ/SBy7Yl4GQJwJ7trF/ZOBKDRCaq5XQ5gzzWqCxiI2y
 pYwbDcaiCkfSg7UpEUmecUsTvb5kNqhpSTllweDPuVC5gwrnKQ4rIGx6Pi7b9q3he26X
 JpXvvxPKu+o+o9OdGE/XxtLgJ6Ka09OmoegxxJiR1z1C0lhEbzNoR0Ck7DMuA1YmuBxS
 UCRzKxInM3CQ8iA1CiP6DWcy2gVPg2ka+TkF+IkvbMYlyLuezkB21j/PA5AXjxnBTkHM
 kX4A==
X-Gm-Message-State: AOAM530oh8G7ebekmtwqx1Eq9NeC0a3Q6QXL7nLgkuIb0AdzwNQ0qHti
 WAbxPeZUGUbD2QG8DON75U4WQP1cFz7exA==
X-Google-Smtp-Source: ABdhPJyymhuCxyhYZmu7TTLJIMgC5JZFxrRE+EsNkIXyL6rmA1otoU76HRwgvlHrYPjrYHLX9sM9oA==
X-Received: by 2002:a05:6402:1ca8:b0:41d:8cd4:6557 with SMTP id
 cz8-20020a0564021ca800b0041d8cd46557mr3568825edb.64.1649949419180; 
 Thu, 14 Apr 2022 08:16:59 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 lb4-20020a170907784400b006e0d13f65e5sm713512ejc.167.2022.04.14.08.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 08:16:58 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9CE111FFB7;
 Thu, 14 Apr 2022 16:16:57 +0100 (BST)
References: <20220326132534.543738-1-richard.henderson@linaro.org>
 <20220326132534.543738-40-richard.henderson@linaro.org>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 31/39] util/log: Remove qemu_log_close
Date: Thu, 14 Apr 2022 16:16:52 +0100
In-reply-to: <20220326132534.543738-40-richard.henderson@linaro.org>
Message-ID: <87wnfru23a.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> The only real use is in cpu_abort, where we have just
> flushed the file via qemu_log_unlock, and are just about
> to force-crash the application via abort.  We do not
> really need to close the FILE before the abort.
>
> The two uses in test-logging.c can be handled with
> qemu_set_log_filename_flags.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e


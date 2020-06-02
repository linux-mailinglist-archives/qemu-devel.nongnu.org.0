Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BDA1EBEE2
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jun 2020 17:17:23 +0200 (CEST)
Received: from localhost ([::1]:46032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jg8fK-000168-4g
	for lists+qemu-devel@lfdr.de; Tue, 02 Jun 2020 11:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jg8e6-0008Tf-FX
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 11:16:06 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:40592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jg8e3-0006ig-7y
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 11:16:06 -0400
Received: by mail-pl1-x644.google.com with SMTP id t16so1461877plo.7
 for <qemu-devel@nongnu.org>; Tue, 02 Jun 2020 08:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/d6UWJQB8fahiirjJdQd3oovV4jJwtJzRq1KzYfuYKU=;
 b=fbJnqy5JxxAaIFo8Xjz3uKFwd4ll5mIojY7KjFJepVBzrwXn9nalITgqJKeseJYfiz
 6h1q2WFRCqwXG5fyYIXprBGyDKeiKlGgbrlrAy1ydwcJwhTLpOxIFcD93t9Qppi886SO
 4xQZdlvLsyIEOfd4mQrRYf9WR3qZMMZcYp3wvVHQ1OC6QGESgFS6S76KW8EcjXs/cjgC
 p+phXEg5cVft6QMZqc9U0UUarufj+nOmOT/c2f1zsK/cMhaLNSwaPC28fa8CHmPNdG5C
 XMPZMT2OfbnzhpEimcU7mRO6HXvP5J8ALTl7FdUBVJ5T3UZwW5LG4CsnuRb/oS67sOrv
 dbSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/d6UWJQB8fahiirjJdQd3oovV4jJwtJzRq1KzYfuYKU=;
 b=epwojNOsyo8qQV/7qCJSrprQhOkbXV3rnQZt+GVtJwXIOMX2m+quYwl6glOBGl0gP/
 eGxpUmrmQq1n6mr65UTkBneCQsHTrt1EYHwWP6E4+O1JoefZVfsB+gFhIQsLqh/Ax7cY
 2GqlcJ/TP+wBhsmv6xKWooG2U6f8hqvWkrW1bLsHD4JZOERFO5/SulSSqmYiQNE+ZOsW
 unBz0SjJldV6NJn5dERtd6cacVoTX4BaIfe7l0G5inkSScmaLZ2DDPefB06iPgFvPbiA
 +klQ4U4fRk3btWKnEh1GWQ+d8kmvccAXc4pkjyRBrJTTCUdDas0QtMpZ9/E5ydb2SvJm
 kELQ==
X-Gm-Message-State: AOAM533n5NgBMNCkjzbIJ6mKrYh3OoLKow5NeV9qhq1e120Bof7dBnOt
 oRpKeHnyo/V0PQpqa9sct9KPXkYcHqU=
X-Google-Smtp-Source: ABdhPJzKuZtFMUbLTINfaNXhxuC80j0QhrNdVLY0c4eryNJ+3zl8125lUJXZUmZIr9i6aPogruPqNg==
X-Received: by 2002:a17:90a:6483:: with SMTP id
 h3mr6004864pjj.229.1591110960697; 
 Tue, 02 Jun 2020 08:16:00 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id x7sm2643286pfm.14.2020.06.02.08.15.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2020 08:16:00 -0700 (PDT)
Subject: Re: [PATCH 5/8] decodetree: Allow group covering the entire insn space
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200518164052.18689-1-richard.henderson@linaro.org>
 <20200518164052.18689-6-richard.henderson@linaro.org>
 <CAFEAcA9VHdzV+7fpZPqDzF6-Y2PhtR3ERm=8w=78BnogUE8uKQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f09c7b3d-65c6-aca0-7309-59ee38f0a1dd@linaro.org>
Date: Tue, 2 Jun 2020 08:15:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9VHdzV+7fpZPqDzF6-Y2PhtR3ERm=8w=78BnogUE8uKQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/2/20 7:35 AM, Peter Maydell wrote:
> On Mon, 18 May 2020 at 17:41, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> This is an edge case for sure, but the logic that disallowed
>> this case was faulty.  Further, a few fixes scattered about
>> can allow this to work.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  ...est1.decode => succ_pattern_group_nest2.decode} |  2 +-
>>  scripts/decodetree.py                              | 14 +++++++++++---
>>  2 files changed, 12 insertions(+), 4 deletions(-)
>>  rename tests/decode/{err_pattern_group_nest1.decode => succ_pattern_group_nest2.decode} (85%)
> 
>> @@ -978,6 +980,12 @@ def build_tree(pats, outerbits, outermask):
>>          innermask &= i.fixedmask
>>
>>      if innermask == 0:
>> +        # Edge condition: One pattern covers the entire insnmask
>> +        if len(pats) == 1:
>> +            t = Tree(outermask, innermask)
>> +            t.subs.append((0, pats[0]))
>> +            return t
>> +
>>          text = 'overlapping patterns:'
>>          for p in pats:
>>              text += '\n' + p.file + ':' + str(p.lineno) + ': ' + str(p)
> 
> I don't really understand this code, but does the similar
> looking build_size_tree() also need a change to handle a
> length-one pats ?

I don't think so, because in that case we'd exit earlier with

    if onewidth:
        return SizeLeaf(innermask, minwidth)


r~



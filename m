Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFF636400D
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 13:01:16 +0200 (CEST)
Received: from localhost ([::1]:34316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYReV-00041u-NT
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 07:01:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYROY-0004Kv-VH
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 06:44:47 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:35750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYROX-0005ji-Ac
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 06:44:46 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 w7-20020a1cdf070000b0290125f388fb34so17776933wmg.0
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 03:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qGjQI/3n3PeGCb5nJJmIisOi/+5ukBUtT/f3tdoz4mQ=;
 b=tYQfP1uTCghyfIbIZI7X9qBApr9Pd3LbKf/EFR+ve/M5Vw94+3z5/Ywq9ep+bLlGSy
 qoJdbSyL7Kcf+lqi2RpJElH/7TxPnv/MsU+bIWN4233DWkToWFSlFDleTXTlP2zhtPBR
 5GlB1ETveTavCgEtL7rjUdEtFmYPi/nxZzESzNp9r7CeG3K0lS8aimqEQQBfJNyTi8Lt
 gsSntDvfhtSb6pCwN0P3tFz4lDkaiUHVXvpykg5q3jvXLYvBmvDhlnTCLsL67NwwNNX1
 Q2CtK1PleHpzfWIJ8QK04ykFqleA4iKVbb7s3dNxbw7oNiOsf1eVDaX48MjdFLS5bZg7
 XciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qGjQI/3n3PeGCb5nJJmIisOi/+5ukBUtT/f3tdoz4mQ=;
 b=MkEQXCwSNe6SG8i4ppFEgeztAaZ3V5yXkqEDtZzrrJv79aPivqacJNhXJDhpYNqM84
 HowO+l28JcoxCvvW8ENRL9BB1kdzj69IUV7ssuQ/JkB+eMVPvGvc7PTFCfdhutgv9Zhq
 mcty2kqXVThUxQ8SPGloYAGfT61rZF9k0V7bFCv+j8x6LdgMV3mfmpr8a2aVhLNfNLYq
 W7ccy1N23vrgyg/xtEQxcahwKbrKhwXRJecXd+d4S1iS49Fn+7LpODt2oTEYY8+CAYKc
 PCKfbwZ0W8UInW0U5sWd6gECFow/rbJQ2Avw7FjhsbAFHm9exj7qxzJ+RO7Yof4Sxawo
 rhKg==
X-Gm-Message-State: AOAM530IfbXNYogJjRFIXHZ0+FQ1w2H7U0Elvlz3222RqXyQ0emuGMH9
 OOzr0wrcw/GPG5Wab9G3gqI=
X-Google-Smtp-Source: ABdhPJxzmvf7AZDzFRozHVGXLTq+S5+EMf7nygG3Kt50DvkS9GGHV8L7qHlrNf0Dr6248TU8cNsj9w==
X-Received: by 2002:a05:600c:4854:: with SMTP id
 j20mr21299058wmo.139.1618829083809; 
 Mon, 19 Apr 2021 03:44:43 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id z14sm24311112wrt.54.2021.04.19.03.44.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Apr 2021 03:44:43 -0700 (PDT)
Subject: Re: [RFC PATCH 14/15] gitlab-ci: Allow forks to use different set of
 jobs
To: Erik Skultety <eskultet@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210418233448.1267991-1-f4bug@amsat.org>
 <20210418233448.1267991-15-f4bug@amsat.org> <YH1QJZGYQXc6x9Et@redhat.com>
 <YH1XLd34h7OXXqYR@nautilus.local>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5ab4e0e4-f494-c8c1-9b9e-20e82578cc39@amsat.org>
Date: Mon, 19 Apr 2021 12:44:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YH1XLd34h7OXXqYR@nautilus.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/21 12:10 PM, Erik Skultety wrote:
> On Mon, Apr 19, 2021 at 10:40:53AM +0100, Daniel P. Berrangé wrote:
>> On Mon, Apr 19, 2021 at 01:34:47AM +0200, Philippe Mathieu-Daudé wrote:
>>> Forks run the same jobs than mainstream, which might be overkill.
>>> Allow them to easily rebase their custom set, while keeping using
>>> the mainstream templates, and ability to pick specific jobs from
>>> the mainstream set.
>>>
>>> To switch to your set, simply add your .gitlab-ci.yml as
>>> .gitlab-ci.d/${CI_PROJECT_NAMESPACE}.yml (where CI_PROJECT_NAMESPACE
>>> is your gitlab 'namespace', usually username). This file will be
>>> used instead of the default mainstream set.
>>
>> I find this approach undesirable, because AFAICT, it means you have
>> to commit this extra file to any of your downstream branches that
>> you want this to be used for.  Then you have to be either delete it
>> again before sending patches upstream, or tell git-publish to
>> exclude the commit that adds this.
>>
>> IMHO any per-contributor overhead needs to not involve committing
>> stuff to their git branches, that isn't intended to go upstream.
> 
> Not just that, ideally, they should also run all the upstream workloads before
> submitting a PR or posting patches because they'd have to respin because of a
> potential failure in upstream pipelines anyway.

Working a patch series on your fork could take days/weeks/months before
you post it to mainstream... I believe forks are only interested
in running mainstream pipelines when they are ready to post their work,
not at every push to their repository.


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5AE3ED34A
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 13:47:18 +0200 (CEST)
Received: from localhost ([::1]:43572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFb5J-00065T-AS
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 07:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFb3N-0004Rq-B6
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 07:45:20 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:33488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFb3D-00012S-5L
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 07:45:12 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 a201-20020a1c7fd2000000b002e6d33447f9so3100989wmd.0
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 04:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MvzRJZhT32t8YLq1p7tTmTftvQr2Kw+sjRA39Zk7VJA=;
 b=PO2Amu7cuN+velHlhrXyauDttGCpW5XBy2HTUGcqglVj5u/mXj7qlTHedLazi93cqw
 vghI1fRWirKQ8T+UDJJWu0XgaXm5cWcQNtXpih+Sx3M7hSR6CbXS6dy8D1ehRTWu6b+Z
 KuXqShPwws9xKqD/f6nM3BmMveqXJa2VVebg8AXpjKehdjPLCuuSo25vEYQZsB/tPGY9
 Dhe5mk7vSuUnEztd3RvlYwqzVWXXGdtz/9JYYJcNUI8XpqrpCptL23Rc7DJw/0PIIyt+
 C6C//kO+RrA0CbuSh065GGeP94k/G+2xlWiWjBFqxiQqzNP33tNs95ojV2olNXvzsHaa
 dc+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MvzRJZhT32t8YLq1p7tTmTftvQr2Kw+sjRA39Zk7VJA=;
 b=W1XECo+Pt/ZBJJj6GvQWck3ByXf9S9QAo1pZVwFawOC4sT96w5t/8DVXlJvPdIDm/Z
 5g29WKxvcuT1VOauZ4mzug1udvT4ILwVa+eoQMUX42RHbe0oK4lGBQyQV3vcOFcvxvmc
 EM9fUoYvyUafxJffiDDrR2YWSnPgY6eBFEaofiWoJ0HYZYpARQR6Jue7PcXR8pUNloP7
 TUUrmjvEdqR59esw1z5jwZ6F4catbtvpomEQ5niEr2qZD+YeRpDnpn3sXFQCtv831Rzi
 QBoQXBrsfATxXGVKDheGFZpRhH6fbsfxg5SXHDQ3rY4Ka3KGRO2C7QgGf7a+2uhz/vo7
 bwvA==
X-Gm-Message-State: AOAM5330+8HXRqtxtBdOeiF3ROFDhqeDFg2nGHl3eGwVllNxgW2TAnNj
 ANJvsqlmQMqrjHDFThpeghE=
X-Google-Smtp-Source: ABdhPJz+GszmbArYU42rrLZYTAZPSKxrMWnHd4ohUiCjNKuWcylfIu0ogoX18rp84GNvKKN0FCAt2g==
X-Received: by 2002:a7b:c014:: with SMTP id c20mr14662626wmb.81.1629114305730; 
 Mon, 16 Aug 2021 04:45:05 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id w11sm10174890wrr.48.2021.08.16.04.45.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 04:45:05 -0700 (PDT)
Subject: Re: [PATCH 2/2] gitlab: don't run CI jobs by default on push to user
 forks
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210812180403.4129067-1-berrange@redhat.com>
 <20210812180403.4129067-3-berrange@redhat.com> <87y291u0st.fsf@redhat.com>
 <YRpGFnvZznlU9RKQ@redhat.com>
 <3062c8e9-b7f1-30ef-ddfa-006f4ea4f7e7@amsat.org>
 <YRpNUE7722YPIYjq@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5f6194a8-1cf9-ae2a-1e29-556bd0ec1d46@amsat.org>
Date: Mon, 16 Aug 2021 13:45:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRpNUE7722YPIYjq@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-3.71,
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/16/21 1:35 PM, Daniel P. Berrangé wrote:
> On Mon, Aug 16, 2021 at 01:20:14PM +0200, Philippe Mathieu-Daudé wrote:
>> On 8/16/21 1:03 PM, Daniel P. Berrangé wrote:
>>>> (c) a subsystem maintainer is preparing a pull request
>>>>
>>>> Ideally, that should run the 'gating' set, to eliminate needless bounces
>>>> of the pull request; plus some subsystem-specific manual testing on
>>>> top. In practice, the 'full' set might be good enough.
>>>
>>> Yeah, the full/gating set is what I would thing subsys maintainers
>>> would want to use, to minimize risk that Peter's tests throw back
>>> the merge due to failure. The only difference of gating vs full
>>> is whether the acceptance tests run.
>>
>> "run" or "pass"?
> 
> In 'full' set the acceptance test jobs are marked to allow to be
> triggered manually and won't affect pipeline status if they fail

I'd expect 'full' to *run* all tests, having acceptance tests
tagged with 'allow_failure', not 'manual', but I realize this
is a waste of resources. OK then.

> In 'gating' set the acceptance test jobs always run and are
> required to pass.
> 
> 
> Regards,
> Daniel
> 


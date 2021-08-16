Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F8E3ED9C2
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 17:18:40 +0200 (CEST)
Received: from localhost ([::1]:42364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFeNr-00059f-8V
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 11:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFeMB-0003gB-RG
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 11:16:56 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFeM7-000828-Co
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 11:16:52 -0400
Received: by mail-wr1-x435.google.com with SMTP id r7so24259079wrs.0
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 08:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YZe/BDZbmVZK4dwT+WcyuIkqDh3UMzwxfRRRIF+xk1o=;
 b=RehAevzhOuOiAbBI8+914DmYmGtdgA+TtQl93ruwbt03VK4pwb/n9p6Vvz9YSAS0wp
 nfKLnPyQzkbD2Ff8tHpWk5K94IlSY6JbNTZsDmYIOWA5Xl9R4QoiigmTTU45OW/e6GS8
 ZUnP0tMBCaSPPtvTjnqgkmByf+kmmjMcGh1cejABPKRmPa9oi3FMBRw3NjqX2unsGApf
 CcTPe9juultKDySIKh6oMBDNNSr8pKsQD1RBIKkLoNsU/aJnXRHMR9Gb+RnO6FswQD5r
 +MIKdaR0vq4HDNhjWs/oSDXwJBWPJLi9MJWiuq2z+bws7H0dycxRHwZcF2zVzh5ynRXN
 BKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YZe/BDZbmVZK4dwT+WcyuIkqDh3UMzwxfRRRIF+xk1o=;
 b=KZoPx0I9jJE5Sr6idH7hSe9KWbP55N5zfiGi1/0KT9oIJ5YbUjXMXfpOzPcVwcJaxm
 FdlabchdiahplU9eSWFKAtBbQwHTLhtqs0mRo4Psl45LKWH06EsbvkSCX25YumF7ZXZx
 xHVao1FPMonpeKYl5DgxfDombsxCnn7EWh1qy/+0igtGokloXsR0lpHFhWPVW2f/Bez2
 H6h56g9K4Y4CuNpwidjxCQNcu/zuU+GYmJF+8LFIQjdPeU1jhS8YRe+iYwVjiVX4a0Vo
 Gr0FRhAKBArvCrMh138DSHYRUFYsGkvN13esOW6wyZibHFZRZUPcL6DpVBq9XAuzng63
 ZvZg==
X-Gm-Message-State: AOAM530aDNQOON+LjyLrl4JJJhKhbyN72b+Wuhf/M7runUKgxxpeQsnE
 wZvjByzjXStfE9su9e4CZYY=
X-Google-Smtp-Source: ABdhPJzGN3WlX/1BQd5vQi6LRAWDwCrfrniSP0owEmJ6D+F/Fz1eCbwTBfmHjnpbvQ2Ei+EYUgig5w==
X-Received: by 2002:a5d:4309:: with SMTP id h9mr18833452wrq.299.1629127009916; 
 Mon, 16 Aug 2021 08:16:49 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id p5sm13290369wrd.25.2021.08.16.08.16.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 08:16:48 -0700 (PDT)
Subject: Re: [PATCH 2/2] gitlab: don't run CI jobs by default on push to user
 forks
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
References: <20210812180403.4129067-1-berrange@redhat.com>
 <20210812180403.4129067-3-berrange@redhat.com> <87y291u0st.fsf@redhat.com>
 <YRpGFnvZznlU9RKQ@redhat.com> <87v945txvn.fsf@redhat.com>
 <YRpTqmv/yXU0cK5H@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <01c92ef1-462f-7a27-0884-ac98b37bf954@amsat.org>
Date: Mon, 16 Aug 2021 17:16:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRpTqmv/yXU0cK5H@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/16/21 2:01 PM, Daniel P. Berrangé wrote:
> On Mon, Aug 16, 2021 at 01:47:08PM +0200, Cornelia Huck wrote:
>> On Mon, Aug 16 2021, Daniel P. Berrangé <berrange@redhat.com> wrote:
>>>> On Thu, Aug 12 2021, Daniel P. Berrangé <berrange@redhat.com> wrote:

>>> When I'm working on changing gitlab CI rules, then I burn loads of
>>> minutes which is especially troubling - limited CI minutes will make
>>> it very hard for me to debug future CI rule changes :-(
>>
>> I hope that will not make gitlab CI a complete non-starter -- if you
>> cannot easily debug a test case that is failing, it's mostly
>> useless. We've seen too many cases where a failure could not be
>> reproduced when the test case was running locally.
> 
> One of the best things about GitLab compared to what we had with
> Travis is that the build environment is 100% container based (until
> Cleber's custom runners arrived).  This meant that when something
> does fail in GitLab, you can pull the container image down from
> the gitlab registry and run the build locally. You still have
> differences due to hardware or CPUs resources, but its a hell of
> alot easier to reproduce than before. This is good enough for most
> contributors in general, but not for the CI maintainers, who need
> to debug especially the CI system as it exists on GitLab.

FWIW we could do that with Travis-CI too using:

 $ make docker-test-build@travis


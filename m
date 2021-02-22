Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B13FD32225C
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 23:50:02 +0100 (CET)
Received: from localhost ([::1]:41812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEK1h-00037F-BH
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 17:50:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEJzN-00011D-F2
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 17:47:37 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:33710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEJzL-0000gm-ME
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 17:47:37 -0500
Received: by mail-pg1-x530.google.com with SMTP id g4so535719pgj.0
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 14:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=U5n7ELO++M+VzahdFR6JSW1dMohOB0Vs4VTA+kbowmg=;
 b=EXjf5zzxFi+K09OhaznlcSr5Enn2Hc3oIWBbI/eJ82dDm2OJArEsarxqjyfZBdHOGm
 Mbb9evptlsnCsL/aybkAvK/0Aepoxyq3MOMb1CggxYst8ugfgOHrUG/ZZhPKLm4eFg/6
 UBs9u/48/uh13djYEq1Gh8hR6jBa4aY16GFvkgM/Qf/aGR4E5JB6U15SxODHrouTVMpe
 evZMf55Ima2GmggzWgRHe/Cwc6kjmt9J5diU9Qu8uB5wRHNA4DYdTsN3ntnYLnjfD6mD
 5/YBf8epapMuGFfh/5XZ3zeaQMAONxjV0bZ3GBlPH5QpCsPZsubTJVjFHs5YP5cAk62B
 Wlqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=U5n7ELO++M+VzahdFR6JSW1dMohOB0Vs4VTA+kbowmg=;
 b=cDI8CPXiXFWTQ6VlcN+RFpwCpijCcYBV7T8T/NpGJsva1pU3eqhk04AB8hc+1gGjwu
 4XPuXw0AeN5qyNQBZDozK8pc3sOryRf6V1WqSMrR0RC2So5sjXzT2D/0wcFshf/uHsnm
 USca5WwDtAwgpXrHwL0r1aAr40OSZLQJFFLc50M3xRJZZ7UuqD+zkeVpsA4W+bFgjTCB
 4O3Kl8sr8VuzxYfoPI4EkhxiTfxS3noq+2WtKz3MknlsK4K7C14dTgu3S6ljIFOTZ/Kw
 Uewu3580ZiseMYIUa8A7jUTpn/I0+wFvp/ZkyrUm3CTheVWtIyph4pAic9PPyO6kNX3g
 p/4A==
X-Gm-Message-State: AOAM530XgjFzPEohbRZZFDCyJBgzA/5VJhmsuUL22X+nlplwKnEZ3Qqd
 /Zpvp7SbcehQCY1KRQYXrazxfA==
X-Google-Smtp-Source: ABdhPJxA+eJqRc4b61aCE14bljpwlN4IJUNkqKHU/SAcj1YJ4unUZteSnNejnSJGLdw81zLT/Ih/VA==
X-Received: by 2002:a65:6096:: with SMTP id t22mr21455082pgu.66.1614034054100; 
 Mon, 22 Feb 2021 14:47:34 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id r13sm1741496pfh.159.2021.02.22.14.47.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 14:47:33 -0800 (PST)
Subject: Re: [RFC PATCH 4/5] Add migration support for KVM guest with MTE
To: Haibo Xu <haibo.xu@linaro.org>
References: <cover.1612747873.git.haibo.xu@linaro.org>
 <25a922038d256e47f3eb99683c5e3bd9c34753ac.1612747873.git.haibo.xu@linaro.org>
 <ae0326e2-8766-803a-ef89-1155d45fdd2a@linaro.org>
 <CAJc+Z1EERnkp1QhZu0Xkrxuw3u8bFM02x0=QVfXYxCRSbXiZeA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <eaa33646-f25b-a5df-a5f7-0c0ed9fd847b@linaro.org>
Date: Mon, 22 Feb 2021 14:47:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAJc+Z1EERnkp1QhZu0Xkrxuw3u8bFM02x0=QVfXYxCRSbXiZeA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 1:46 AM, Haibo Xu wrote:
> As I mentioned in the cover later, the reason to let the tag go with the
> memory data together is to make it easier to sync with each other. I think
> if we migratie them separately, it would be hard to keep the tags to sync
> with the data.
Well, maybe, maybe not.  See below.


> Saying if we migration all the data first, then the tags. If the data got
> dirty during the migration of the tag memory, we may need to send the data
> again, or freeze the source VM after data migration? What's more, the
> KVM_GET_DIRTY_LOG API may not be able to differentiate between a tag and
> data changes.
I would certainly expect KVM_GET_DIRTY_LOG to only care about the normal
memory.  That is, pages as viewed by the guest.

I would expect the separate tag_memory block to be private to the host.  If a
normal page is dirty, then we would read the tags into the tag_memory and
manually mark that dirty.  Migration would continue as normal, and eventually
both normal and tag memory would all be clean and migrated.

But I'll admit that it does require that we retain a buffer 1/16 the size of
main memory, which is otherwise unused, and thus this is less than ideal.  So
if we do it your way, we should arrange for tcg to migrate the tag data in the
same way.

I'll still wait for migration experts, of which I am not one.


r~


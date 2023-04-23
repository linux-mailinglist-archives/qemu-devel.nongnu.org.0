Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9816EC168
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 19:40:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqdgk-0007CV-GG; Sun, 23 Apr 2023 13:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1pqdgh-00079t-TM
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 13:39:47 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1pqdgf-0008Ik-NG
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 13:39:47 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-63b4a64c72bso3030651b3a.0
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 10:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682271584; x=1684863584;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pm/A8c1vjNJyuYRTZaf4b4Z7dHr5NNOzfsHRkoKxTxw=;
 b=k2s3Tm18M6jAqZG+ZMVevGz+12eJKBMokGiRzfb2PWwDFTJ79jR27mgUm/h6jQWK33
 mMa3NGgIShdLd176CaNLNkTfFxkslv20eBtCZoTGgQZrJm6o9Brng04irT6WRVTMlPxQ
 YVxPPDurhi4BeqBp6g0X23kkuF0Nf9IpOoLxkikFDqUSQrBxjzkn2lDNjhaJkdWDm4ac
 6H48pxLKD1LMS79EDHlfaBswDiMxVnVp6nwC0BKC1EHHIpzmENPvVG0oc0sqZMRn3u8a
 ntdEbXrOADdX8PZ9+KpBDB8Kx+P7d6L6eodX1C7IV7Gl+W5T0xL/1GojxM2ptiVfLaG+
 17hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682271584; x=1684863584;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pm/A8c1vjNJyuYRTZaf4b4Z7dHr5NNOzfsHRkoKxTxw=;
 b=iA0sna1/bownekQw/ociRpcu69KTvK42C7tUs9REM3GGSa0Exgud4GyfNtGPQIWGhU
 hAXMr2Bt4PaPbPdrtYfUVdTJvShg6LEPmeoyMFvlCb0wACs912DHAmZkwYZPS+OQMiVk
 cnEj+rIOFp5VJSaSzDfLifDEz6G2cHIvps2zhsUHXHFsBojYsuMzWYWHGK9D546h3Erd
 F1WMdbQSOII2drSF0Ds7hS2OCqZzC6x3YV2qAwhk1mt6k/z5zgInCGJkDJ8+4GTkOeb/
 48E/TuZTpOQO8nwVTmh4EKy3fuz6mSWmKaPZbN0QIkVj7/1OrVYosHXAlMqyv8Wiw1go
 lHmw==
X-Gm-Message-State: AAQBX9coCaSyyc34PBgC+BDruopDGoQW65kw/dQgDep/CKoKXaNP1SD0
 Qjbjcsz93t4CE2C5TvhLeopqhBNAb0Q=
X-Google-Smtp-Source: AKy350ZsYQPmIVdfHnRE7hTVRSjNuHaddGLA/WTgABqLaYDf3rl3TJpygRfc6mk/zdnZBz08GAXxeA==
X-Received: by 2002:a05:6a00:2346:b0:63b:7fc0:a4af with SMTP id
 j6-20020a056a00234600b0063b7fc0a4afmr15253781pfj.26.1682271583497; 
 Sun, 23 Apr 2023 10:39:43 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a62f949000000b006334699ee51sm5852711pfm.47.2023.04.23.10.39.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 10:39:42 -0700 (PDT)
Message-ID: <c5568089-d8e4-36da-4a77-92ccc350f003@gmail.com>
Date: Mon, 24 Apr 2023 02:39:40 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: get_relocated_path: the configured paths are not looked for?
To: Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>
References: <7f96ff38-2268-07d3-23a3-d46bf036b711@msgid.tls.msk.ru>
 <20e76562-b1c7-3574-a277-7df6260226cc@gmail.com>
 <a01a470e-891e-bdfc-aefc-00701a6a0413@msgid.tls.msk.ru>
 <63948283-d7dc-924b-c19a-6e376096daac@gmail.com>
 <30817af4-5b21-b1ff-293c-f39196842077@msgid.tls.msk.ru>
 <fa344795-07c0-b6a2-5666-9a44e1671b38@gmail.com>
 <bccc8256-30f9-95e4-68a2-793ba4bceb0a@msgid.tls.msk.ru>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <bccc8256-30f9-95e4-68a2-793ba4bceb0a@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-2.143, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 2023/04/23 22:22, Michael Tokarev wrote:
> 23.04.2023 14:47, Akihiko Odaki пишет:
> 
> https://salsa.debian.org/qemu-team/qemu/-/commit/e017f53a8550d0bcaaca81c6dacac8ec34295cf0
> fwiw.

I seriously think you better consult GCC and other package maintainers 
to have consensus on handling this kind of scenario. Otherwise you don't 
get the behavior you expect from other packages.

> 
>> Also, that works only if the version changed. For example, consider 
>> the case where you patched a module downstream. To compare the 
>> behaviors of the patched and unpatched ones, you'll need to copy the 
>> modules somewhere else.
>>
>> Let's focus on modules in this discussion. There should be no problem 
>> with data files here. You can pick data files from a different QEMU 
>> version and it should just work fine. And even if it unfortunately 
>> does not work, you can still use -L option to fix it.
>>
>> That's not the case for modules. Modules are coupled with the 
>> executable so you need to copy them along with the executable and the 
>> executable should be able to find them.
> 
> The modules case is actually trivial.  For this one, we have
> $QEMU_MODULE_DIR which, if set, will be searched first.
> 
> There's no need to make tricks and turn --libdir or --datadir
> specified at configure time as absolute paths, into something
> entirely unpredictable.
> 
> /mjt

It is more preferable to use modules which are bundled with the 
executable by default since they are coupled with the executable and you 
should never want to use alternative modules unless you are debugging 
QEMU. The current logic can reliably find the modules if either relative 
paths or absolute paths of the executable and modules are preserved.

That said, it's very reasonable to specify absolute paths to --libdir 
when you want to relocate only the executable (e.g. moving 
bin/qemu-system-i386 into libexec/xen/qemu-system-i386) but keep other 
files in the configured path, and the current QEMU build scripts do not 
allow that. If you explain a convincing reason for doing that, I think 
there is a good chance to get a patch to cover such a case merged.

But of course that is something a maintainer decides and I'm not 
responsible here. util/cutils.c has no maintainer listed and the last 
change made for get_relocated_path() was merged by Paolo Bonzini. He is 
also a maintainer of the build infrastructure.

Regards,
Akihiko Odaki


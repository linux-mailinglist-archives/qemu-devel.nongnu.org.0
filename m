Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7EF4158F2
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 09:19:02 +0200 (CEST)
Received: from localhost ([::1]:60012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTJ0X-00080o-Kg
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 03:19:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTIzh-0007Kz-Pu
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 03:18:09 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:38797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTIze-0008ER-VF
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 03:18:09 -0400
Received: by mail-ed1-x52c.google.com with SMTP id dj4so20138038edb.5
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 00:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=e2BvDcyPaFB1J3WVl/FATXXyGTxez1s+/3Vd/KEsNN8=;
 b=NZDnrdqCYZp9z3maYI3WgvUf+RS0wO7dF5ZZAMrab2CqOnSgpDsYSClRisoPFC+ThO
 UsL0fogPvwZKJQ2rt43MqQaL0FvwX/1m2Oa18fTmzg/Vq4q//7ulhN/Zlygp2zLLcJ65
 u34mx24m1BvwDsECee3G960OxrIU7OkfPAeQ4p2LNhX1bf4GUpI3uzPCmJ8FyjVk/jDX
 +RFP7NTFrWnmrLqLrQnlmIUULo2xsEhwZ8+38rziVcKMnqTEEEvQqAT8k+G1Dws1byQq
 D6aUJnM8wf6bBI46ABZMGulmHW2yt/L97YIzJ3J3H9w0d+GGqk5kOelSHEQRH10htmis
 Mz3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e2BvDcyPaFB1J3WVl/FATXXyGTxez1s+/3Vd/KEsNN8=;
 b=IUhgVGNmw25yB+bq3DzCIAb5X56gQGUTx2IJt8gwo5k2051HKNIaqTjnjH/BKZAi46
 gjA8PdKmktr4uQxeu0r8BAeq0o881O2mllj4yC/O8sQVZ0UbOK6mvfascyMyrsZnD6Kw
 yME0NV0wyDYrnQN9+zRtlgLnOMtaSJXe9sGgSEzbGoM+npzViU8m4K5UHlEeDKag0Nxs
 0c+OzKlAta+ERS9qDSaItCtgiH4csnQV3CfNN7+4AstdC7pgD2C0QaKPkio8aIFqwABZ
 gqYs/wF6otyOkUreIYUh8f0s7NRnTs626CNE3TFUmKqilBTtwOJRWCgjtZVRoOODxZnk
 bmFA==
X-Gm-Message-State: AOAM533E5GagOqs0HCt6SzgzUmBU3IZuJHdQC4mGoqSpJ8cQRWvj995B
 6x1M0eZjh8HTvFx2LtRAhMlQaesGDok=
X-Google-Smtp-Source: ABdhPJzQWDqAYQYQ+Ch0jTXGAlY82kFjDeZU6XHS7370kOq2ytfMC1kdN5B4oBwvgs0zMMEmGwj4eA==
X-Received: by 2002:a50:d84c:: with SMTP id v12mr3713743edj.201.1632381484225; 
 Thu, 23 Sep 2021 00:18:04 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id f22sm2410875ejz.122.2021.09.23.00.18.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 00:18:03 -0700 (PDT)
Subject: Re: [PATCH 1/2] meson: introduce modules_arch
To: "Jose R. Ziviani" <jziviani@suse.de>
References: <20210917012904.26544-1-jziviani@suse.de>
 <20210917012904.26544-2-jziviani@suse.de>
 <20210917071404.efhv3tlnad2ezz3e@sirius.home.kraxel.org>
 <YUSS0Jp+GBwNwYg3@pizza>
 <20210920051532.tzanl2asdqzuxlzn@sirius.home.kraxel.org>
 <YUiGcjBviIqPIyJB@pizza> <05b09438-43ef-bd40-2b0a-2fdebf0425bd@redhat.com>
 <YUniTK6jLpKtuWX7@pizza>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0a089de0-48dd-20de-3eb4-9db7c7a6c3d8@redhat.com>
Date: Thu, 23 Sep 2021 09:18:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YUniTK6jLpKtuWX7@pizza>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/09/21 15:46, Jose R. Ziviani wrote:
>> Alternatively, you could C-ify the contents of config-devices.mak, and embed
>> them in the per-arch modinfo-*.c; and record CONFIG_* symbols for each
>> module (e.g. '{ "CONFIG_QXL", "hw-display-qxl" }' from a
>> 'module_config("CONFIG_QXL")' line in the global modinfo.c file.  Then
>> before loading a module you do a binary search on the per-arch
>> config-devices array.
> With a per-arch modinfo-*.c we don't even need a modinfo.c global, do
> we?
> 
> Each target could be linked to its own modinfo-target.c only.

Yes, I suppose you don't need it.  However, you may want to use 
different Python scripts to generate modinfo-*.c (currently from 
config-devices.mak only) and modinfo.c (from compile_commands.json and 
various sources), so it may be handy to separate them.

Paolo



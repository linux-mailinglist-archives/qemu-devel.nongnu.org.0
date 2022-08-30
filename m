Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23ADD5A6351
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 14:29:25 +0200 (CEST)
Received: from localhost ([::1]:51208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT0Mt-0003JI-TV
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 08:29:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oT0AQ-0008Um-Ff
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 08:16:30 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:34508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oT0AO-0008S7-6J
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 08:16:30 -0400
Received: by mail-pl1-x62c.google.com with SMTP id f24so8175244plr.1
 for <qemu-devel@nongnu.org>; Tue, 30 Aug 2022 05:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=tncN8vpLg+fwno95vO2HO8IaqKkTdm7lzL9m6S71fe4=;
 b=ItdpzKrzispU5kxumCPGdRqlQ87M68701XbE2w/wXFt0NguTwpbvFyzzFJl6ylXH23
 d7BNpGThVkuSjxmBEmo+gBJzX+H3u8/R7Z8/KFst2vdLo3viZ5OMk+CL8oG74kmon6nN
 664MgD97516xUUBFcHVMnhdMtOifGMKxGIhZlSpFexDyhRF2wavJUFIkLMBuyFnAtW4i
 TeCvPqks9vU3y4j62JDc9vity8ZbRLJ+GRfxPk1EC7Hp1lEmhpCxAN5nSdwrXlD7Sb63
 ge66W2X6cI5+E3r5WPo0+qBfcwyK8VU8g8PnNwyGgoqz42zyUPzSo7F7zwHqT68+opei
 8WEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=tncN8vpLg+fwno95vO2HO8IaqKkTdm7lzL9m6S71fe4=;
 b=PYkv5nkTZBo4qSJFXZJT9jNi5uCAxlxXtnLsjjCkMh0TQ1qMmfkhfNXgYqOdi5xdUy
 O2uugxHn3mIb9ITnvUvcgzEckva+3uajXbuaDtoqLu8gnVp6aXnYZlGBiVV8LHE2KKYz
 alN72349Znn6V+2vjs9NwEubpJ2jH3MlgOTyh7Q4EM+NX1iPD8VqhKGEiFy0GVAadcr+
 WhPC2aLgbyzgfUT2tHd70zpyZIavnbmF6vCAT0vTTj3rN3oHai6w7F0t6YsUaWYnS/rx
 bX5/RCsJ0ysT5j4TM9T5Z7Jps2qwtN0slA7xslK01RTH4rviBaVVNNQyVyoagp6F4ASQ
 6urQ==
X-Gm-Message-State: ACgBeo0juWqeggkiCsu/D2qrL9b0Jge9ZrTOUHQFOvJl9mRlx2v965o9
 7h5n2Fwe6EZkqNp4eO4nJJC8XyBQO1c=
X-Google-Smtp-Source: AA6agR6gXeIbbzD8AP0ZTvwiHqb2dc+RfIPFGDHMLk6Z0lxCCjQdC9D+zB3Z4EvyL7BANHzCedNLDg==
X-Received: by 2002:a17:90b:3e8b:b0:1f5:2a52:9148 with SMTP id
 rj11-20020a17090b3e8b00b001f52a529148mr22968585pjb.175.1661861786853; 
 Tue, 30 Aug 2022 05:16:26 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a1709027ec900b00172c7d6badcsm9425525plb.251.2022.08.30.05.16.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 05:16:26 -0700 (PDT)
Message-ID: <387638d7-8c4c-2096-d24d-9d2b7b5f3a0b@amsat.org>
Date: Tue, 30 Aug 2022 14:16:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 0/7] configure: fix misc shellcheck warnings
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220825150703.4074125-1-peter.maydell@linaro.org>
In-Reply-To: <20220825150703.4074125-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 25/8/22 17:06, Peter Maydell wrote:
> Currently if you run shellcheck on our configure script it
> generates a ton of warnings. This patchset fixes some of the
> easier ones. I wasn't aiming for completeness or consistency;
> I just wanted to zap some of the ones where the fix is clear
> and didn't take long to write and is hopefully easy to review.
> We can always come back and take another swing at it later.
> 
> thanks
> -- PMM
> 
> Peter Maydell (7):
>    configure: Remove unused python_version variable
>    configure: Remove unused meson_args variable
>    configure: Add missing quoting for some easy cases
>    configure: Add './' on front of glob of */config-devices.mak.d
>    configure: Remove use of backtick `...` syntax
>    configure: Check mkdir result directly, not via $?
>    configure: Avoid use of 'local' as it is non-POSIX

Series:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>



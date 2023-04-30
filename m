Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D583F6F27C8
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Apr 2023 08:07:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pt0CK-0006cn-4L; Sun, 30 Apr 2023 02:06:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pt0C7-0006b8-8v
 for qemu-devel@nongnu.org; Sun, 30 Apr 2023 02:05:59 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pt0C5-0007Tz-GL
 for qemu-devel@nongnu.org; Sun, 30 Apr 2023 02:05:59 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-24dea6d5ce8so601234a91.2
 for <qemu-devel@nongnu.org>; Sat, 29 Apr 2023 23:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682834753; x=1685426753;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5GwuLWXKn3s3pyOZ1JrXhMu8pyGBTdVX9Dq2gUC/ap8=;
 b=ftiwenPHu9bUCoiTSAS5Qhu7VrnfJdZEPqJaO9dUf4HiwSJPgS7iDTslG/PO6nvlHK
 r9I6X7wYjOf/pE1BsN6qGoPXiLlK5D3FfbeNoXAN6LUJwJqKeNzkXkNhzLSlx/I+oqKU
 1ZTIoEh0WXTVIT5P1GTal74KaeoMFTcrV6XQhxJvMGGpCX+VrLj0LQ855H6J1qw5gL9m
 ps/V1aTzpWmuBaLKBd62bbApQ1TWitOygDGlQn+eovidtBGsJnrezxNEHTO8gLDCqKsW
 hXP19UhFbaS2nKzcmoCUjxTcOVViYGOZGeiWZAWeE3AhYc/NUkYmtsQPrdCKzTz9T5A0
 wH5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682834753; x=1685426753;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5GwuLWXKn3s3pyOZ1JrXhMu8pyGBTdVX9Dq2gUC/ap8=;
 b=g6Zq7FpD0S9eGHQOou192L1aoqYjcplPrQ6EfeBayTycS5H8xGEXIiRvOlWQjfckpr
 QqcQpvHrtaigDxZP+zjLExxrLI13+IVcZsiwEFk0EISOrJs9QTQIJM/HB8bMJoiCHAtd
 MAckZJ78LoWe3B3bKBvGYaCZFFuv4zJZnlqcYoeI6Vlezo7ldo5uqR0iBnpVkN7gqH4L
 0j8QARUup1Vohh1uUDRyDkzJGkPmb63+R84cAW8He1hmb9oeGodhSNG8JXUTTTqlb5o8
 hWzIwPb9LSw/f3gGMQwLpf0eMzZkcysRKvYgbNc+JMn6m+mZK+CmjaWJbfg//9RLtJok
 Rb1A==
X-Gm-Message-State: AC+VfDzkT5zDDNHLjVj7lQnua2YD/hmvjnosKjyPKZn8j0G6gmdYlBnQ
 0fkU9fwAUINWRpEPK6BPxv8kgA==
X-Google-Smtp-Source: ACHHUZ50SVEfgszZJw3JQr2yVCPnFy5B1EsM9bbuR8syGAjpmKdV+1MJatSysJvlzofKUKSErrgJ4g==
X-Received: by 2002:a17:90a:ab88:b0:23f:abfc:5acb with SMTP id
 n8-20020a17090aab8800b0023fabfc5acbmr10562186pjq.18.1682834753628; 
 Sat, 29 Apr 2023 23:05:53 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 dt15-20020a17090afa4f00b00233e860f69esm17165756pjb.56.2023.04.29.23.05.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Apr 2023 23:05:53 -0700 (PDT)
Message-ID: <a904ce6c-08e5-e4ed-6250-00940ad73fd4@daynix.com>
Date: Sun, 30 Apr 2023 15:05:50 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 1/2] igb: RX descriptors handling cleanup
To: "Tomasz Dzieciol/VIM Integration (NC) /SRPOL/Engineer/Samsung Electronics"
 <t.dzieciol@partner.samsung.com>, qemu-devel@nongnu.org
Cc: sriram.yagnaraman@est.tech, jasowang@redhat.com, k.kwiecien@samsung.com,
 m.sochacki@samsung.com
References: <20230427104743.9072-1-t.dzieciol@partner.samsung.com>
 <CGME20230427104750eucas1p1158eee5a37c71cacaea021a7abbd6ace@eucas1p1.samsung.com>
 <20230427104743.9072-2-t.dzieciol@partner.samsung.com>
 <d1eb27dd-1b2e-dca1-2d1e-aa16397c2f15@daynix.com>
 <000001d979d0$23571b90$6a0552b0$@partner.samsung.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <000001d979d0$23571b90$6a0552b0$@partner.samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102a;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2023/04/28 21:51, Tomasz Dzieciol/VIM Integration (NC) 
/SRPOL/Engineer/Samsung Electronics wrote:
>> Please don't ignore comments in reviews, and if you have a question with them or you don't agree with them, please write so in a reply. You don't have to post a new version quickly so take time to address all problems pointed out.
> 
> I assumed that comments referred only to places pointed in the code and fixed only those places. Sorry about that. I will keep in mind that your comments are more general and fix all the places, where array is passed as parameter.
> 
>> Please split up those changes into separate patches.
> 
> I will extract TCP ACK detection removal and IPv6 extensions traffic detection to separate patches. Those will be small patches in comparison to the rest of cleanup, however those are functional changes.
> 
>> Do *not*:
>> - suffix struct name with _st. The convention is not common in QEMU code base, or even e1000e and igb do not always use the suffixes.
>> - use _.
> 
> ok, I was looking at E1000E_RingInfo_st, which was added recently with IGB code in commit 3a977deebe6b9a10043182e922f6883924ef21f5 ("Intrdocue igb device emulation").

It's just copied from e1000e code. Check for e1000e_core.c for history 
older than that commit.


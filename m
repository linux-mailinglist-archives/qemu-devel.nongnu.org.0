Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FF74158F6
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 09:21:47 +0200 (CEST)
Received: from localhost ([::1]:34562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTJ3C-0001Zo-Cd
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 03:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTJ0z-0000Ot-OW
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 03:19:29 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:45887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTJ0y-0000uu-8O
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 03:19:29 -0400
Received: by mail-ed1-x530.google.com with SMTP id c22so19694109edn.12
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 00:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ag6PEcb2YRyLOqCZcPcvCnNRlIGvQNd2Yv3a1WNfAoE=;
 b=k9GVBbBRPUpudeMvYclIMbk/Klx7UpU8Z+qxIJ3To/1G9qbSwCUsn+RLYs/MjD1iru
 WsJT6tSoxg9P3leEAmFu+Gf35DHcXZY8FckcEieKKpItlnuKIal1VJak1OOe3ci4Dw/T
 bpak89vb+bCKQ5+PsXhy1LfNs+AtTheRqjAdq4SYpvRuqjyLnIMHZeAlZrdUeyA3o2md
 /h8YK+rP7qZR3QGa8Tx6ALHu4cdRU1kb7jt/exvCJtXz1olhoNEvLS1ay5s2ZDn613Yz
 Brl924V/3XQasw3rA8JQ4dGFar1KLnN71AQvrP8jbFOR24F0WIZkP/PreazskuXUWvL4
 wiZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ag6PEcb2YRyLOqCZcPcvCnNRlIGvQNd2Yv3a1WNfAoE=;
 b=ADYCWqAns2NrHI4uJasHdH0VbqZgW7ul6O+PPs44OOtVhx/23MCjrHiaVauFHCvsAZ
 cu/41gitoBbnodA+/O9qXQhp8CFpxpamzokPRa+7S7Otg0xPjubKkK1yWr8xmV9aD1em
 1492QO6Wy8tXP30S9YDUIVTVbttimKldF6c2f7POdUn7RVFx8xU9JS56HKF+ub0aQ5jz
 9S+D0Ypox/YjV8sQ8y92OdR1HUgivUnqTtrdvyiOGe/rdR76sob4gvIa3ivZe2HnOP4k
 1qJVlmZHI85MYJVK6SvobB2eX5rIyjdm0p9ykHPcrl3bIvLmarLxQwypFZkZdCTlIxZY
 8scA==
X-Gm-Message-State: AOAM5321+qJ6W6wA9K9tqC29SQbx38yYdTUCsTknsd3/zebn8EVAjRSm
 NKB/lWY+2pgLU1uDwu8Y6Gij0grsjW4=
X-Google-Smtp-Source: ABdhPJxnfCFf3d0+s6wolc/aGFSZldZgzQyCxFcattNHPdgiWS8Iini8lIiQo6/N3QMtLU4XtgoTpA==
X-Received: by 2002:a17:907:760d:: with SMTP id
 jx13mr3440978ejc.194.1632381565697; 
 Thu, 23 Sep 2021 00:19:25 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id k15sm2370584ejb.92.2021.09.23.00.19.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 00:19:25 -0700 (PDT)
Subject: Re: [PATCH 2/3] scsi: make io_timeout configurable
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Hannes Reinecke <hare@suse.de>
References: <20201116183114.55703-1-hare@suse.de>
 <20201116183114.55703-3-hare@suse.de>
 <dae9daae-aa8d-ddb7-ecf3-95e91defea53@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <89b0f267-8d62-3cfe-7908-cc872506cc8d@redhat.com>
Date: Thu, 23 Sep 2021 09:19:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <dae9daae-aa8d-ddb7-ecf3-95e91defea53@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/09/21 17:47, Philippe Mathieu-Daudé wrote:
>>
> 
>> @@ -637,7 +639,7 @@ static int get_stream_blocksize(BlockBackend *blk)
>>       cmd[0] = MODE_SENSE;
>>       cmd[4] = sizeof(buf);
>> -    ret = scsi_SG_IO_FROM_DEV(blk, cmd, sizeof(cmd), buf, sizeof(buf));
>> +    ret = scsi_SG_IO_FROM_DEV(blk, cmd, sizeof(cmd), buf, 
>> sizeof(buf), 6);
> 
> Why is this timeout hardcoded? Due to the /* XXX */ comment?

This command is only invoked at startup and involves no I/O, so 6 
seconds should be plenty.

Paolo


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1DA68EF54
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 13:49:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPjsd-00011V-LN; Wed, 08 Feb 2023 07:48:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pPjsc-00011M-AM
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 07:48:54 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pPjsX-00078K-Uh
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 07:48:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
 Cc:To:Subject:Reply-To:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TF45O/m+FWUtpsWWa05eSH3QiWdJwV4Z/O2O/eQ9NRw=; b=beiBkdQGD37t2NjECvjdlwQTgV
 cQeQj01ln6AW5dFIv11l8U3bwhEaWaWSgOXutPXl5wx/2ko6VZLST+RghosdNqyoJrBoZZjfJF3ns
 GElns44USeViWlkZP501hQcAyDBnvm8nZwvK4aqbCtrls39ESQrwWE/f8b9GVX/wjXeQ=;
Message-ID: <f9abaab1-b900-1029-18c8-85bff540e783@rev.ng>
Date: Wed, 8 Feb 2023 13:48:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 2/3] Replace `TARGET_TB_PCREL` with `CF_PCREL`
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: ale@rev.ng, richard.henderson@linaro.org, pbonzini@redhat.com,
 eduardo@habkost.net, peter.maydell@linaro.org
References: <20230207104352.11055-1-anjo@rev.ng>
 <20230207104352.11055-3-anjo@rev.ng>
 <82cdff33-4a41-cfae-2235-f6d4345f4f1c@linaro.org>
Content-Language: en-US
Organization: rev.ng
In-Reply-To: <82cdff33-4a41-cfae-2235-f6d4345f4f1c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  anjo@rev.ng
X-ACL-Warn: ,  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 2/7/23 12:26, Philippe Mathieu-Daudé wrote:
> Possibly:
>
> #ifdef CONFIG_DEBUG_TCG
>
>> -            assert(!TARGET_TB_PCREL);
>> +            assert(!(tb_cflags(last_tb) & CF_PCREL));
>>               assert(cc->set_pc);
>
> #endif
>
> Or maybe clearer, use tcg_debug_assert()?
>
>>               cc->set_pc(cpu, tb_pc(last_tb));
>>           }
Thanks for the review!

tcg_debug_assert makes sense for the cflags check, but do we really want 
to disable
assert(cc->set_pc) in non-debug?

-- 
Anton Johansson,
rev.ng Labs Srl.



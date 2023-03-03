Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A086A9AF2
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 16:45:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY7aL-0000wJ-Sn; Fri, 03 Mar 2023 10:44:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pY7aI-0000s2-Uo
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 10:44:38 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pY7aG-000621-Jb
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 10:44:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
 Cc:To:Subject:Reply-To:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4pWq/EmDXEg9f0Fade3QqrfP8k8UV5TC7qG2osVXFso=; b=uutOpciFRMmGIOxKcjMI4aJnDL
 xZQm81jC4rbZIDVQqUDhQr/B3gb/bzVMrZeCqt54JNh740yhVT5GUgsgbhBqwXgKP/pM6vSV0fXet
 4+uGbblRfeNBKDuj2DDFR3MrnS1wtER90PF5hTeUtg8yOGhWT9haNZ+Fd7/l7AJ2KBhw=;
Message-ID: <397944f4-96a6-8764-3e46-ce0e0f4f33ed@rev.ng>
Date: Fri, 3 Mar 2023 16:44:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH] tcg: `reachable_code_pass()` remove empty else-branch
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "ale@rev.ng" <ale@rev.ng>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>
References: <20230301142221.24495-1-anjo@rev.ng>
 <SN4PR0201MB8808E80B0AD000E394223813DEAD9@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <4c181663-5ec3-cd94-1e0f-f6551823fac4@rev.ng>
 <SN4PR0201MB8808D8C4AF4601FB5F8E3BECDEB39@SN4PR0201MB8808.namprd02.prod.outlook.com>
Organization: rev.ng
In-Reply-To: <SN4PR0201MB8808D8C4AF4601FB5F8E3BECDEB39@SN4PR0201MB8808.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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


On 3/3/23 16:39, Taylor Simpson wrote:
>>       dead = false;
>>       remove = false;
>>
>>       if (label->refs == 1) {
>>           TCGOp *op_prev = NULL;
>>           do {
>>               op_prev = QTAILQ_PREV(op_prev, link);
> You can't use op_prev as the argument here.  It is NULL the first time through the loop ☹
Ah right

     TCGop *op_prev = op;

should do it.



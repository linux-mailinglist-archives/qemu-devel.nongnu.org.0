Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 310F564FF50
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 16:36:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6vgh-0002p4-4u; Sun, 18 Dec 2022 10:34:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1p6vge-0002ob-Hj
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 10:34:48 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1p6vgc-00030w-RR
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 10:34:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Reply-To:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=708uB/yL1zWO2t1NjmCyZGwop1jEsxIVCfKOv4UJVcY=; b=tf3/Ak6E3zPmxpFr2+gM/zJm2g
 4X+S7mOU7e6x1zeHDIgOrCtPh1Mygs1e1O0R1C3yj6egD5AJldEmzRWAgpRtgqhpIrzmWyVpcGU7C
 cJmIwCA1gSs7aE9SdWCjymZ1oisaw7t0nR+4wZC4Bc/tTnBwG+FR1qzx5oftO/K6GFOE=;
Message-ID: <9e158e82-9d6c-9aab-372e-1165f038765c@rev.ng>
Date: Sun, 18 Dec 2022 16:34:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PULL 00/21] Hexagon update: bug fixes, performance, idef-parser
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Taylor Simpson <tsimpson@quicinc.com>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org, philmd@linaro.org,
 bcain@quicinc.com, quic_mathbern@quicinc.com, stefanha@redhat.com
References: <20221216204845.19290-1-tsimpson@quicinc.com>
 <CAFEAcA-Tr-RU0TjsXpn59EJPy9rnT6tVdkcyAENYHjxaXr+2VA@mail.gmail.com>
Organization: rev.ng
In-Reply-To: <CAFEAcA-Tr-RU0TjsXpn59EJPy9rnT6tVdkcyAENYHjxaXr+2VA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 12/18/22 14:52, Peter Maydell wrote:

> Failed to build, s390x:
>
> https://gitlab.com/qemu-project/qemu/-/jobs/3492490152
>
> Program scripts/decodetree.py found: YES (/usr/bin/python3
> /home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/scripts/decodetree.py)
> Program flex found: NO
> ../target/hexagon/meson.build:179:4: ERROR: Program 'flex' not found
> or not executable
>
> Can you get the CI requirements sorted out first, and then
> let me know when I can try re-merging this, please?
>
> thanks
> -- PMM
Oh, this is my bad. I didn't know we built Hexagon on s390x, I naively 
assumed the CI jobs ran locally matched those upstream.

I'll send a patch adding flex/bison to s390x then.

Thanks,

-- 
Anton Johansson,
rev.ng Labs Srl.



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E60B1662693
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 14:11:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pErha-0007ta-2a; Mon, 09 Jan 2023 07:56:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pErhX-0007t7-NP
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:56:31 -0500
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pErhV-0000Vb-Nv
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:56:31 -0500
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id DD7135FBC5;
 Mon,  9 Jan 2023 15:56:18 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b685::1:3c] (unknown
 [2a02:6b8:b081:b685::1:3c])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 GubxKm1R50U1-2xyTcDA6; Mon, 09 Jan 2023 15:56:17 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1673268977; bh=1VgH0piQYRTPLsuyEQ2vOHsGfEDWRxag93SkGsLlZIQ=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=YLwoxXF0j5WR/3GbDbue6Z7C0INNF1o7MuhQG7OVmPVYui8SgpfvchE+4/7UPcgx0
 bl1n3Mm/FW2A/XbyjOiRi3rWzoYKSTO+sqklDf1tba2485aOrx7gYGSY1kZw33nNFa
 v58zuHZ42Ts/tMGimq4HDKtNatBD5lWnl+b5W/dI=
Authentication-Results: sas1-c73b4b4f4b95.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <ef0016b0-c744-9d8b-59a3-145f90db9edb@yandex-team.ru>
Date: Mon, 9 Jan 2023 15:56:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH for-8.0] ui/vnc: fix bad address parsing
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: kraxel@redhat.com, qemu-trivial@nongnu.org,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20221206192334.65012-1-vsementsov@yandex-team.ru>
 <6fb5f423-cb24-6214-e776-e8c27920240c@linaro.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <6fb5f423-cb24-6214-e776-e8c27920240c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c02:900:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/6/22 23:12, Philippe Mathieu-Daudé wrote:
> I was pretty sure we had a helper for that, but can't find any.


is uri_parse() from util/uri.c appropriate?

-- 
Best regards,
Vladimir



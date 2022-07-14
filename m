Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7365753E1
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 19:20:37 +0200 (CEST)
Received: from localhost ([::1]:35522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC2Vw-0004pN-Qg
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 13:20:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1oC2T3-0002yz-7c
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 13:17:38 -0400
Received: from rev.ng ([5.9.113.41]:54269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1oC2T1-000495-4f
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 13:17:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:Subject:Cc:Reply-To:To:From:
 MIME-Version:Date:Message-ID:Sender:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4xwCA7Mfw8ONnI9BmsExYQyRHEcLuHtxU7GVnq6UXCY=; b=rgWR4nUnFh8FWZ2UXElVluCk4c
 CzjcbCHzi+ekhQqIXdXeeawY/Lo5XeGCrictl8fy+uWao5Q4iG8l12AezXmtGWAzfQAXnpsKPwmOm
 Xn6jPDB+IUx52irxZaiVt94ZCwLkbIhyuOW480AMLr33dnqRVRQBKDsq3UEmUqImisMU=;
Message-ID: <1076da40-3076-a161-d6f5-e6a3253dd756@rev.ng>
Date: Thu, 14 Jul 2022 19:17:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Organization: rev.ng
Cc: alex.bennee@linaro.org,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "ale@rev.ng" <ale@rev.ng>, Taylor Simpson <tsimpson@quicinc.com>,
 Michael Lambert <mlambert@quicinc.com>, Brian Cain <bcain@quicinc.com>
Subject: target/hexagon: Fixed container/CI feedback on idef-parser v9 patchset
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  anjo@rev.ng
X-ACL-Warn: ,  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>

Hi, Alex and Richard,

I implemented the changes you suggested in this conversation:

https://lists.nongnu.org/archive/html/qemu-devel/2022-05/threads.html#04679

The 9:th patch which updated libvirt-ci and added flex/bison to the
CI containers, has now been split into 5 separate patches that:

     1. Update libvirt-ci

     2. Fix renamed packages mappings in qemu.yml

     3. add flex/bison/glib2-static to qemu.yml

     4. regenerate CI containers

     5. manually add flex/bison to containers that build qemu-hexagon,
        but aren't covered by libvirt-ci

The v10 patchset contains these fixes in patches 8-12, and can be found 
here:

https://lists.nongnu.org/archive/html/qemu-devel/2022-06/threads.html#00122

If someone could take a look whenever you have the time, I would greatly 
appreciate it!

Thanks,

-- 
Anton Johansson,
rev.ng Labs Srl.



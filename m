Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE385345A1
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 23:07:43 +0200 (CEST)
Received: from localhost ([::1]:43174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntyEH-0007W1-VK
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 17:07:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <juew@google.com>) id 1ntxR3-0007nE-7U
 for qemu-devel@nongnu.org; Wed, 25 May 2022 16:16:49 -0400
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34]:38494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <juew@google.com>) id 1ntxR1-0002OW-JB
 for qemu-devel@nongnu.org; Wed, 25 May 2022 16:16:48 -0400
Received: by mail-vk1-xa34.google.com with SMTP id ay20so3310528vkb.5
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 13:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=sEG0icEbQWzQToljyqBgD3aSPQ/mar2lnW/ygu4neoY=;
 b=eEqJ7TQi6I6W8fbEV9Ibmb7lons3Vl5rNCaekxwVLzqN0iym/F9GFmW3m8TS31Fe45
 ePM+S2RHy/r20laDdii5e9VQiY5RSKaoLD/pgXZ2ghVStHsVV5ugwG8dbXSzeW5nOv7D
 MC9/aFVH0Dx69kSHo86+3frP64Ss6OcL9dq7i3UzIX7lf9daLy05BVveI+yKZVbFg464
 RBO63ztSg2not7N8aYKfyAshrQzRJpnlQfMOl16HBb484uCMYX8FkRSYqNpNIp2ZE1j2
 AQJiXPAQQOuoJxAGTQ7Gw+Iev/omSlrkzV5CgbHvyOKaLku4CDlo7dualO3zn2tzIivB
 nyDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=sEG0icEbQWzQToljyqBgD3aSPQ/mar2lnW/ygu4neoY=;
 b=pp+sqPpNbpewBtScEJSXpt0YQflg5NQVEVHr57SVJYYNmnXv57YrBEjCqKECfhRzBP
 256TWVePQ2VLNcDv05khV/PyNFYhE3zl2+x5mu5EfuyUj+nJFrnhGjtO9a4He6X9qkE9
 LU4/IKqx4bMIQRw0Ln4ZLGoiV0PytHSw/YKiskFTDqDX34eDED2CMkMcwfRkSx6F11vK
 sW4WSATgZ8UtZKFpC22gbG5vUaMZdhRRwnC3E+Ut2h9AxnYaT840Puc2+fYWQygDLt8Q
 KMH8VXlJJKkMgzwBKX6lM/lZS9KviCjGVEXPY5mbO97v0Peu1IZ2P2uemYbv7HUlbUED
 RZ/A==
X-Gm-Message-State: AOAM530jCc5NzF2UXznsav+GiQnA7SiFLs/5zERfh4nqEzYbE6av8xgQ
 2l9VxT8Jij+7Ts37MEZQKjARIfXa4iXoSLjlACR8yA==
X-Google-Smtp-Source: ABdhPJxXTD0b0wGt11g6Sf3EIcNgykMMnDOGoXDZJlAhtASlMQY8J+Li2flc5Z6ipSE6ZXPSEPSpTccxmE+am9GnerQ=
X-Received: by 2002:ac5:cdec:0:b0:358:269a:8a24 with SMTP id
 v12-20020ac5cdec000000b00358269a8a24mr2737096vkn.22.1653509805414; Wed, 25
 May 2022 13:16:45 -0700 (PDT)
MIME-Version: 1.0
From: Jue Wang <juew@google.com>
Date: Wed, 25 May 2022 13:16:34 -0700
Message-ID: <CAPcxDJ5pduUyMA0rf+-aTjK_2eBvig05UTiTptX1nVkWE-_g8w@mail.gmail.com>
Subject: Re: [PATCH 0/3] recover hardware corrupted page by virtio balloon
To: pizhenwei@bytedance.com
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, jasowang@redhat.com, 
 LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 mst@redhat.com, 
 =?UTF-8?B?SE9SSUdVQ0hJIE5BT1lBKOWggOWPoyDnm7TkuZ8p?= <naoya.horiguchi@nec.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a34;
 envelope-from=juew@google.com; helo=mail-vk1-xa34.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 25 May 2022 17:04:46 -0400
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

Some points to consider:

The injected MCE has _done_ the damages to guest workload. Recovering
the guest poisoned memory doesn't help with the already happened guest
workload memory corruption / loss / interruption due to injected MCEs.

The hypervisor _must_ emulate poisons identified in guest physical
address space (could be transported from the source VM), this is to
prevent silent data corruption in the guest. With a paravirtual
approach like this patch series, the hypervisor can clear some of the
poisoned HVAs knowing for certain that the guest OS has isolated the
poisoned page. I wonder how much value it provides to the guest if the
guest and workload are _not_ in a pressing need for the extra KB/MB
worth of memory.

Thanks,
-Jue


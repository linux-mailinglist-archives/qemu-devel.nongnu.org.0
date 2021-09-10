Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A2D407042
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 19:08:42 +0200 (CEST)
Received: from localhost ([::1]:41318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOk12-0002Qy-UQ
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 13:08:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mOjzV-0000Zq-O9
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 13:07:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mOjzS-0004WJ-Ho
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 13:07:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631293621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MzmoE4tzkjYiyCMtwMN0IZgrK0AVcFhDw5olOcMHa1s=;
 b=H5aEDWj2yT+g5XzrtMGBBvaozpdeCw7gPzYwrbhDaaTgvvi1bZrGTxcCqiKY2gBpdGz4ut
 V76aVcJXSd4XffYzjHK+UlRI+vRx/m0GNVYA4yvCtjCGj8cRiS0dmIVxjjejCKhHsd8Uiv
 08LRDg/5owRweH7kDIfZ+/WjzG0P0wI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-HvzWIQIKPPuExOFqvadtzw-1; Fri, 10 Sep 2021 13:07:00 -0400
X-MC-Unique: HvzWIQIKPPuExOFqvadtzw-1
Received: by mail-wr1-f70.google.com with SMTP id
 p18-20020a5d4e12000000b0015940dc586aso756225wrt.6
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 10:07:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+s6MgbOEfICWD6/7636UW+jANfJaIA74BetWIRypg30=;
 b=teYkBIpIZfJzb7qMojSvDDle1VjYEweb5qVHZggBxLdekiohpaf9brthe80e2Vas56
 uV9hAAZy7c21hBDyN9qob/g9X2aEl9XUs/9VPaNFYwCznF5zGOeuwuaKMLVEDcnM7j9X
 0jhUVdiYXepA8ranvyBlonzWxJEOripeNgyCKbTfAlR379/Z2MoPu6Wdvap+KlKxI4r1
 KOHTXVDlAZf3sQP4EV9XWPyOyflYPxebO0h6HiT2tiYcMvV4ZAqxKdZN8qkJRfpQAYvk
 7ARfzmqjO5FvsZVr7pZzAsltf/8F8B7Hm23gOyQ2Mk8HizhCAxYhai1XfV23WHyhhwcS
 wGmg==
X-Gm-Message-State: AOAM530Q0C06sbkFqCPt/em3aTrbqaDYjjKbBYuP41xura8nWEhJE3fE
 xaCSUD64edbL6re4BhdexIGIa8bpjELQz5n/U0UB4Urd0LehOVh9jqC7n28XikX18RADfgkzcls
 4pipmiICTeaX518iqKkIYS6OVvxJ0px8iRIPtW4NjYymn2iO2VgayJQ8xx6OG6UqT
X-Received: by 2002:a5d:6381:: with SMTP id p1mr11052434wru.310.1631293618465; 
 Fri, 10 Sep 2021 10:06:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZXWN8m9ZanqxAXxlgQ0dx54eWStEPIVvnGE0TE5yeZV4y82Z3BPjJctKc/FRO66Okbr7jEw==
X-Received: by 2002:a5d:6381:: with SMTP id p1mr11052399wru.310.1631293618209; 
 Fri, 10 Sep 2021 10:06:58 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id n4sm5415866wra.37.2021.09.10.10.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 10:06:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] elf2dmp: Fix minor Coverity nits
Date: Fri, 10 Sep 2021 19:06:54 +0200
Message-Id: <20210910170656.366592-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a respin of Peter Maydell series, with slightly different=0D
logic on the first patch. Quoting v1 cover [*]:=0D
=0D
  Coverity complains about a couple of minor issues in elf2dmp:=0D
   * we weren't checking the return value from curl_easy_setopt()=0D
   * we might divide by zero if presented with a corrupt PDB file=0D
=0D
  This patchseries fixes those.=0D
=0D
Viktor Prutyanov tested the patch but didn't provided a formal=0D
Tested-by tag, so I haven't included it in the patches.=0D
=0D
[*] https://lore.kernel.org/qemu-devel/20210901143910.17112-1-peter.maydell=
@linaro.org/=0D
=0D
Peter Maydell (2):=0D
  elf2dmp: Check curl_easy_setopt() return value=0D
  elf2dmp: Fail cleanly if PDB file specifies zero block_size=0D
=0D
 contrib/elf2dmp/download.c | 22 ++++++++++------------=0D
 contrib/elf2dmp/pdb.c      |  4 ++++=0D
 2 files changed, 14 insertions(+), 12 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D



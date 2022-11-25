Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 859826390DC
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 21:52:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyff0-0000d5-At; Fri, 25 Nov 2022 15:50:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oyfex-0000cc-Rs; Fri, 25 Nov 2022 15:50:55 -0500
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oyfev-0005me-FV; Fri, 25 Nov 2022 15:50:54 -0500
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-36cbcda2157so51264777b3.11; 
 Fri, 25 Nov 2022 12:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=m1aaK3L/+fA1S5eKN82KltOBbvGbfJ4TlIvoza+IPyw=;
 b=l3gTf7TUoc9iL/SgTiy+GEYudBjSTyVdGKME8sYqwLAFIObRvhzPW0QzYeRmjV89Qt
 NkrQ8MB2KMMGRqhxOI9to9n4zdrr0iffAlz9IO7TT/TIwNhJHSg12YVmT2T0Rx+KIDe+
 1se3ZT8O3VTdlCSOW2fMx/b3hEVxhlyz4uio1sock78pasPqdmJBP5eHXd8i3zwzXkU1
 Psx9tyhHdYpAd7zPHNEYkuEv2aNBipJMeL/XA3qCU95Ygk1Ha5wBNWt1uVz6kWuyEJTZ
 YAJdTu3aCzEYkq0e6tvsgzu2o1fc0j72imSwtdy43wi8JzSBEHCHi862XgiGzWV96uni
 S7aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m1aaK3L/+fA1S5eKN82KltOBbvGbfJ4TlIvoza+IPyw=;
 b=MLo2kJnUtnPVSoIzO4H2TFnXNBr0Ptss9U93QFULwsOUc/7iPopgm4oaS4YISpT08c
 U9wsrlAU2bxziTlsWmm4VMWu533WngGIPgy4OjfxS9w81X5e1uIspaBQl3qaqeAwFzlW
 IeWtcYZHVn/brhMCn8Pl8eapreWfioPj4HVDva3fU8OXVqZTkXwR7r0iRaCbmlaHDuHr
 zHDCvGZnHYPIvDnMjsvYDTOf2ShWJcQL3LIhgwpFyq/gyYVWGQlYKYZq1Evp4EZCUR1i
 O/s5dPNCSGBx6DrwxSwZx/xpsk1bsjJrJBCQJ+pOFJL5fjC/hd1M55+0G63GtLmjeaZ4
 0e1w==
X-Gm-Message-State: ANoB5pmvBtTW05If9bBJn++kH0lRwpVLCk/u18eqo85bzzIeq4m5v4c7
 69OxXcZqis+PhiKxnJlf7kDNyd8ap34p3ueZN4Q=
X-Google-Smtp-Source: AA0mqf6izOmIYFcMdFa2CO/zMoPX1yegSe2t7mJ8gPebPe+YEtzHAulYddVjl5pQrZmjIh/lNDjRrZwzHLG4goXhgsw=
X-Received: by 2002:a81:9204:0:b0:3bb:ff1:8d57 with SMTP id
 j4-20020a819204000000b003bb0ff18d57mr4239515ywg.62.1669409451684; Fri, 25 Nov
 2022 12:50:51 -0800 (PST)
MIME-Version: 1.0
References: <20221125143946.27717-1-mhartmay@linux.ibm.com>
In-Reply-To: <20221125143946.27717-1-mhartmay@linux.ibm.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Fri, 25 Nov 2022 15:50:39 -0500
Message-ID: <CAJSP0QVJJYAaY_9a-DTmKqFJ+yRKAoASBMXuqNuZHghk3KN9aQ@mail.gmail.com>
Subject: Re: [PATCH] virtiofsd: Add `sigreturn` to the seccomp whitelist
To: Marc Hartmayer <mhartmay@linux.ibm.com>
Cc: qemu-devel@nongnu.org, qemu-s390x <qemu-s390x@nongnu.org>,
 virtio-fs@redhat.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, 
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Stefan Liebler <stli@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Thanks, applied to qemu.git/master.

Stefan


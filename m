Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DE16D471D
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 16:17:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjKyZ-0000X3-Kb; Mon, 03 Apr 2023 10:16:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=xBS6=72=zx2c4.com=Jason@kernel.org>)
 id 1pjKyV-0000Wi-TU
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 10:16:00 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=xBS6=72=zx2c4.com=Jason@kernel.org>)
 id 1pjKyS-0003Zt-Uu
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 10:15:59 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 29CBA61CAF
 for <qemu-devel@nongnu.org>; Mon,  3 Apr 2023 14:15:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A78F8C433A1
 for <qemu-devel@nongnu.org>; Mon,  3 Apr 2023 14:15:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="AEoUdL93"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1680531342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0mQmAx02Zj5uOCocaZqE67gVVXoPRHHRUuBGcWk6B7w=;
 b=AEoUdL93A/bndlaqzbF38NqVqsTX3vPLvKBF0oALXuTYMxxbkTeQqP/IgKRus55ETsH5sn
 b8w5HVFNWdA9rVGg8fUYkBgWadqkDPcfA40MGLkLVQBZ+VgzHMhtpFeHD0qj/KuinE5F+c
 /Ct7GgX8ILo9olR3wuiHnfXLA4NYk6o=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 73030cb7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Mon, 3 Apr 2023 14:15:42 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id d18so25499657vsv.11
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 07:15:42 -0700 (PDT)
X-Gm-Message-State: AAQBX9es+UzV2ASuVIUIlhUwbqQ7YmOyFdq2sQhPXlVeeO+gljEqkOQb
 LLEYyNKnK1E4oQZFvrciwiRt4O+qjDedFtSLgBQ=
X-Google-Smtp-Source: AKy350abbvl83cQP41wFloYpBwPFithghD4JmQGFihHDOH//a+xVCNuFl3g+BXT3X3K19lkdQgEuKZ/aI7vnl4AQMpU=
X-Received: by 2002:a67:c812:0:b0:426:da10:2408 with SMTP id
 u18-20020a67c812000000b00426da102408mr8497333vsk.5.1680531341755; Mon, 03 Apr
 2023 07:15:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230403105245.29499-1-bchalios@amazon.es>
In-Reply-To: <20230403105245.29499-1-bchalios@amazon.es>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 3 Apr 2023 16:15:30 +0200
X-Gmail-Original-Message-ID: <CAHmME9q3W4HKXERGdtrMHvaTO_as3UYow9qHQjRroyWW0iA-8Q@mail.gmail.com>
Message-ID: <CAHmME9q3W4HKXERGdtrMHvaTO_as3UYow9qHQjRroyWW0iA-8Q@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] Implement entropy leak reporting for virtio-rng
To: Babis Chalios <bchalios@amazon.es>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Amit Shah <amit@kernel.org>, 
 qemu-devel@nongnu.org, sgarzare@redhat.com, graf@amazon.de, 
 xmarcalx@amazon.co.uk
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=xBS6=72=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

Hi Babis,

Why are you resending this? As I mentioned before, I'm going to move
forward in implementing this feature in a way that actually works with
the RNG. I'll use your RFC patch as a base, but I think beyond that, I
can take it from here.

Thanks,
Jason


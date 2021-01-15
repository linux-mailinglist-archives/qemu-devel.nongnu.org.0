Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3692F7E46
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 15:32:29 +0100 (CET)
Received: from localhost ([::1]:37786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Q9M-00056J-Kn
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 09:32:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l0PzN-0001DN-O5; Fri, 15 Jan 2021 09:22:09 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:39341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l0PzH-0003H9-Nw; Fri, 15 Jan 2021 09:22:05 -0500
Received: by mail-pf1-x42e.google.com with SMTP id m6so5585966pfm.6;
 Fri, 15 Jan 2021 06:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Np5+ZwVxsAg+UTqhxxHHj7Zw2V2fnzjOl0oDw9Ic4dc=;
 b=HupQRx5FWAvIkV+YVjEmVYHxpbTeU3NDmFzx6POFMNrmn4pxkdyQakwOxohp7fTU9/
 k1BlFEbuICXeVZXipv5vza7rUup4o0rBDpaDQuZL4zTrpuPuorHjw9iFx7A2gC1EE/eA
 6cxet67f1qRiFU1h2wi9IirVol5t3TgjV+41lZHBpEyw16RWHxDd8bIGgxkTSi6aBiHd
 ceIEyNU+rzk9a+qkw/DInlGdj5IBqt9XM4u9q3Y63GJRdv38jdKBLCcGqrDViVolL1Wa
 xzW2Y5W17lVj2jT4MoRUueTXB9U+NEqxnl1j+qQKo79nQqRc/Ju1N2fLuTUYe42qPDn+
 i+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Np5+ZwVxsAg+UTqhxxHHj7Zw2V2fnzjOl0oDw9Ic4dc=;
 b=XjuLiar2toFuypkgZ5XJLw3Y5M46kIC95JTVKZzyjxa8YUYVroyOJP8KKHMzk7Nn5l
 dO2vEHtENcWOocLLgeHci29nAzYM+KxRt0J7jJHwllSBMXfkL7p07GAQc+0OFxbUcffa
 LdWS6T5zIF4iKktMoGC3DqvQv7B2Ke981zx9ghcC3U7g6Tgzy0XVGO877U50sTEkiToM
 AoFkWhaB9qQK8MXYs+DhbKuKiAOnhcJMv7awwvdBVph6XhHcSKx+96REgbuyuOaYPdIK
 xVMJf/+LSGUuqaFTXJohp3ByaXhcKxJlci80o4GrVP9jnxc/hjZ5o7WbvN5s+0gwLD/+
 CkXg==
X-Gm-Message-State: AOAM533DR8L+KhhSuf6UKX2CSQ+HyLXErrK3nKlJaf37DTKMJuOz65EJ
 MDe7L1KL/KX5eSJLjJSJWGQ=
X-Google-Smtp-Source: ABdhPJwDDKpx/82oz41SpQU8KyRkFDudX/99Z+m/qQu9faC5twDhLOnh1APiXa0GFK9fEcZHs3NCGQ==
X-Received: by 2002:aa7:95a4:0:b029:1a5:b7a4:9aa1 with SMTP id
 a4-20020aa795a40000b02901a5b7a49aa1mr12740496pfk.53.1610720521211; 
 Fri, 15 Jan 2021 06:22:01 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id z5sm8243499pff.44.2021.01.15.06.22.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 15 Jan 2021 06:22:00 -0800 (PST)
Date: Fri, 15 Jan 2021 23:21:58 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH] hw/block/nvme: add zoned I/O commands to nvme_io_opc_str()
Message-ID: <20210115142158.GA27592@localhost.localdomain>
References: <20210115134845.17618-1-minwoo.im.dev@gmail.com>
 <YAGf9NOJwxtufjNx@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YAGf9NOJwxtufjNx@apples.localdomain>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Oh, I think I missed that one :-).

Thanks!


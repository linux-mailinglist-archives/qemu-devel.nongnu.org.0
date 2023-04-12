Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2856DFF72
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 22:10:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmgmd-0004Aa-4g; Wed, 12 Apr 2023 16:09:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pmgmb-0004AO-PH
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 16:09:33 -0400
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pmgma-0003VI-7k
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 16:09:33 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A4EF662F85;
 Wed, 12 Apr 2023 20:09:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46C3FC433EF;
 Wed, 12 Apr 2023 20:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681330163;
 bh=8B2OVPHQHUwiNOLLrscY/I401k0vtxih3jLGGUDSZUk=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=isH2hHlC7MKcTEpi3cvYBuFwSXm7bfi+7UtiCiSxRhJvoJrz1bZTtaEX878g9+FO8
 ZZuTFhx3o0CydAnW4JtkqWFL/IS1rIea/bPm/69Vs72f5GTfYgCkanvHSEojuUtCNH
 rMrcizdGo05D0QTIVEWIKkSGHjIQv3z8oPVt4Lycz58HVAx5lRkqHPhYv4e/iemkm2
 UlLe8bzNTJ4ztwDIZkYpmsVhIYNjFn8K47YZm3ZH4HZPnD7cai47soX5RIsO8wahf2
 8KAX4BdpEqi/qDwiOJjWH7M9TZHYiwvHMtwpCOlCfl/WYt4Xo1QdQB0UTl5zmdDc2Y
 hnLqFZYN3h/Hw==
Date: Wed, 12 Apr 2023 13:09:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: David Woodhouse <dwmw2@infradead.org>
cc: qemu-devel@nongnu.org, no Stabellini <sstabellini@kernel.org>, 
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>, 
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-8.0 0/5] Xen emulation build/Coverity fixes
In-Reply-To: <20230412185102.441523-1-dwmw2@infradead.org>
Message-ID: <alpine.DEB.2.22.394.2304121309050.15580@ubuntu-linux-20-04-desktop>
References: <20230412185102.441523-1-dwmw2@infradead.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=sstabellini@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

On Wed, 11 Apr 2023, David Woodhouse wrote:
> Some Coverity fixes and minor cleanups. And most notably, dropping
> support for Xen libraries older than 4.7.1.

I just wanted to say that I am fine with this


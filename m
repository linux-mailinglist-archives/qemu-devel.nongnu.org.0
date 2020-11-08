Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B802AAC05
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Nov 2020 16:54:46 +0100 (CET)
Received: from localhost ([::1]:39804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kbn1i-0007So-31
	for lists+qemu-devel@lfdr.de; Sun, 08 Nov 2020 10:54:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agrecascino123@gmail.com>)
 id 1kbn0Y-00072M-Da
 for qemu-devel@nongnu.org; Sun, 08 Nov 2020 10:53:34 -0500
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:32824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <agrecascino123@gmail.com>)
 id 1kbn0W-00023b-Ra
 for qemu-devel@nongnu.org; Sun, 08 Nov 2020 10:53:34 -0500
Received: by mail-qk1-x736.google.com with SMTP id l2so5794511qkf.0
 for <qemu-devel@nongnu.org>; Sun, 08 Nov 2020 07:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=2ANAv8q/DjOlcFKRd9LNjHcUbBYsqzcIYYDP6Adn1VQ=;
 b=MSc4aKcX/SmUd5nbrG31SLO1GTHbG/CXo3BSo8fyC2SrnkvNlJe6TgTMYFm4TLsD3K
 u7qkBvEI+de7GtaLHm8aXnLN+3rNF2l05GdKB+81IDVYG5Z9402UPDapqexuL8F8LSV/
 vgku8VCL2l8rB4Qk6K/nm6dfkUH7GpE/JSEzR/qN0wFcIkY8FhLpgYgrqkyuTEl7lYP7
 TC321mX7NQISOyxNIDOUxDO63vH1DeCm1SzfLHHzYiKkZDZ4xuQMFdiZGpcPflXUo42O
 VfuWa3Mw/z+pkTEZ+YRH1YcfRueQC70NVVPLfQANmwNOlwXgcZ/Oaj6ktaw2qvcqGa4T
 9KQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=2ANAv8q/DjOlcFKRd9LNjHcUbBYsqzcIYYDP6Adn1VQ=;
 b=ZD2IvLYo3XjBGhTDNE0w0ZwzObCNeHHYpvtuBnyz0+qeDYy4NjnmidORNnjtdnqVDN
 Dj0xjPpuzhQw5uJ94LmDkHuz6UKCz1tI19ntcSITe8nRlDsN4+K5+TrxbaMRda2aB1GR
 qJEODXhITJW1GyoL9o6iICBsFnXHzPwBWydXTsZL2xVhDhYoQnWEyhm3I8JgFS4LM7rK
 UAmUVzHXKoG5wuMI/rgLMBYuzoa026TH/i6d2Ow0+6fF7RRrSPPkxCyrB75NNtt/HjJS
 pCQAu4sucxa2FGGFf4bo0zOktEazcxckCWs2ufBlcRCgPNt+EgS1Zl8fruh84KHDaZd1
 fdhw==
X-Gm-Message-State: AOAM530DeXG4CgnJwwJeEO1KdPUog7AZ7HxulSuBa1FflrDOEFwpiqRw
 QmkDMFAkeImkgUEceh+0jup0GefI9j0=
X-Google-Smtp-Source: ABdhPJzXjumd41LQoRU6c5OIscdi/LpjGvwTcOZA20vXZNA8PDxMraLJv3Eq/qWWV69Ou9d69dzpog==
X-Received: by 2002:a37:4796:: with SMTP id
 u144mr10292381qka.235.1604850810139; 
 Sun, 08 Nov 2020 07:53:30 -0800 (PST)
Received: from ?IPv6:2600:1700:3c90:1b60:30c4:1ea:cfac:fd68?
 ([2600:1700:3c90:1b60:30c4:1ea:cfac:fd68])
 by smtp.gmail.com with ESMTPSA id a200sm4466998qkb.66.2020.11.08.07.53.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Nov 2020 07:53:29 -0800 (PST)
To: qemu-devel@nongnu.org
From: "Catherine A. Frederick" <agrecascino123@gmail.com>
Subject: mmap2 is probably still broken in linux-user & other things
Message-ID: <cceb3d0d-958f-91f0-770e-4acb01fedd7f@gmail.com>
Date: Sun, 8 Nov 2020 10:53:28 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=agrecascino123@gmail.com; helo=mail-qk1-x736.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, I submitted a patch a while ago and then dropped off the face of the 
planet like most people do. In my journey to fix DRM/radeonsi in 
user-mode emulation I discovered a few bugs. I don't really have the 
time to write the infrastructure to make wrapping DRM IOCTLs remotely 
not-ugly, but I do want to get patches in for the last bug I encountered 
as it's kinda sneaky.

Currently(as of 6 months ago, and I doubt anyone noticed) mmap2 is 
completely broken for it's intended use(mapping pages outside the 
address limit). The value of the address input to mmap is clipped to an 
abi_ulong(4 bytes of 32 bit platforms afaik?) and because of this the 
value in pages when converted to addresses and passed to mmap on the 
host is invalid and this breaks radeonsi(and probably any other GPU 
driver in linux-user.

I don't really know how to fix this in a sane way so I'm looking for ideas.

Another thing I'm looking for ideas wrt is I'm thinking about is some 
form of automagic(opt-in, through a new type) pointer/union translation 
in IOCTLs over the guest barrier. Currently it's really ugly to wrap 
most of the IOCTLs in DRM and amdgpu because the DRM ioctls frequently 
pass pointers to the kernel and because of this I don't feel comfortable 
merging my patches(manually translating the struct to the types of the 
host sucks and feels like redundant work). On top of that AMDGPU uses a 
lot of structs where currently having one type for the call would 
corrupt the data in the return union.

Last thing: I never really got any performance benefit out of my 
scheduler, but I think that's mostly from bad implementation. Is there 
any information on TCG's performance characteristics? Thanks.



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 425B667D9F8
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 00:54:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLC3A-0000mR-Ls; Thu, 26 Jan 2023 18:53:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin@koconnor.net>)
 id 1pLC38-0000kU-0G
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 18:52:58 -0500
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kevin@koconnor.net>)
 id 1pLC36-0000r2-9K
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 18:52:57 -0500
Received: by mail-qt1-x831.google.com with SMTP id s4so2783769qtx.6
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 15:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koconnor.net; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=UroPNeyGolPSc4AeIUJptAUxE2BU/L0w0GU3C1PJzJc=;
 b=KVRXSZlcq9t+wUG/QENleViQ72Qmw5LwKgEqKoPBm/sOgrjGjIkRYDp2+ZPwyO3B8I
 M0tTrWHY/Ps1cZxrrNYNcy/pQP5RqkiBilyAOW93nlovnDDp6Zf+YBHAfbvNRiSoPmWw
 Z00f58fy/xSV3sSdiuQ5iindJwIPSpUzJ4Fuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UroPNeyGolPSc4AeIUJptAUxE2BU/L0w0GU3C1PJzJc=;
 b=6hKQHO6OBe6pXrVHqsNHAyE5IzpHR8qDh0FIkFtEGGBUj9+V/RT+8igjtw39Et5mNv
 dqaHyuDqIa264cOa8uEy8ShXbE9NvzYxJ9LeOk5BFco4uJxr8vtoSS+ucAJlT6v5+GCj
 1paje4uvpSr53MpAKaUUExh8jk/Hnf/zyz8hRdwnrJJAsc18dyUhlDuNCEDLHBJnrAdB
 qLLSE17nkCsKkk85NG3s4XXDwmvsi1PM72PgNhYdaWo6AvSxAHiy+V4u9euRdg/V2mO8
 KNs6RBEPcNPcDRS9ZJTjLWpwta7fbiSOR9Ahgg44m9NmnLiumpmm0bsQnT+xvpYu/nDX
 lJlg==
X-Gm-Message-State: AFqh2kpfnSoQPJqS0QwQOZYLGPktiZKGXGK/Ptty7Dv5Cv5XDq3zqSDI
 u1iUxitsa9CQDDoIRSyVrlbXwQ==
X-Google-Smtp-Source: AMrXdXsrfVzASVRgvjjBI+Fccg+qIz2lwVVPSChxGQajRz8mS4PHXRer1c82HYJIpg8zeOQLroq52A==
X-Received: by 2002:ac8:4a0a:0:b0:3b6:2d6d:3546 with SMTP id
 x10-20020ac84a0a000000b003b62d6d3546mr53029151qtq.64.1674777174879; 
 Thu, 26 Jan 2023 15:52:54 -0800 (PST)
Received: from localhost ([64.18.11.71]) by smtp.gmail.com with ESMTPSA id
 pj4-20020a05620a1d8400b0070648cf78bdsm1845526qkn.54.2023.01.26.15.52.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 15:52:54 -0800 (PST)
Date: Thu, 26 Jan 2023 18:52:53 -0500
From: Kevin O'Connor <kevin@koconnor.net>
To: David Woodhouse <dwmw2@infradead.org>
Cc: seabios <seabios@seabios.org>, xen-devel <xen-devel@lists.xenproject.org>,
 qemu-devel <qemu-devel@nongnu.org>, paul <paul@xen.org>
Subject: Re: [SeaBIOS] [SeaBIOS PATCH] xen: require Xen info structure at
 0x1000 to detect Xen
Message-ID: <Y9MSVYx4sN1dMRbn@morn>
References: <feef99dd2e1a5dce004d22baf07d716d6ea1344c.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <feef99dd2e1a5dce004d22baf07d716d6ea1344c.camel@infradead.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=kevin@koconnor.net; helo=mail-qt1-x831.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Fri, Jan 20, 2023 at 11:33:19AM +0000, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> When running under Xen, hvmloader places a table at 0x1000 with the e820
> information and BIOS tables. If this isn't present, SeaBIOS will 
> currently panic.
> 
> We now have support for running Xen guests natively in QEMU/KVM, which
> boots SeaBIOS directly instead of via hvmloader, and does not provide
> the same structure.
> 
> As it happens, this doesn't matter on first boot. because although we
> set PlatformRunningOn to PF_QEMU|PF_XEN, reading it back again still
> gives zero. Presumably because in true Xen, this is all already RAM. But
> in QEMU with a faithfully-emulated PAM config in the host bridge, it's
> still in ROM mode at this point so we don't see what we've just written.
> 
> On reboot, however, the region *is* set to RAM mode and we do see the
> updated value of PlatformRunningOn, do manage to remember that we've
> detected Xen in CPUID, and hit the panic.
> 
> It's not trivial to detect QEMU vs. real Xen at the time xen_preinit()
> runs, because it's so early. We can't even make a XENVER_extraversion
> hypercall to look for hints, because we haven't set up the hypercall
> page (and don't have an allocator to give us a page in which to do so).
> 
> So just make Xen detection contingent on the info structure being
> present. If it wasn't, we were going to panic anyway. That leaves us
> taking the standard QEMU init path for Xen guests in native QEMU,
> which is just fine.
> 
> Untested on actual Xen but ObviouslyCorrect™.

Thanks.  I don't have a way to test this, but it looks fine to me.
I'll give a few more days to see if others have comments, and
otherwise look to commit.

Cheers,
-Kevin


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 927743B244F
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 02:44:00 +0200 (CEST)
Received: from localhost ([::1]:58046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwDTL-0003I2-3W
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 20:43:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwDSJ-0002Za-H9
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 20:42:55 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:55810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwDSH-0004k6-TZ
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 20:42:55 -0400
Received: by mail-wm1-x336.google.com with SMTP id c84so2759127wme.5
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 17:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=N06CAPYvOlm5/W3aXi8/Mqk0vScqXn5giEaCnBLbpU8=;
 b=Z9nK5xuxkRmi/I9q3ZPGQkAyOhypo+DaBXvevS2mO0T4hz6c+knR8K+IWm9ahUcGck
 awYNKbv3CVMNI07ZLCRoLt219zXlYwe2fNgOfBxK7odvwC2nBXK1K8tcFVGE8owehJD8
 rLYEUat3uG/K+1ZNtMlbackiQJjUWYD0/9D+Jc7zAmTzun3/6OWXCle/OlrbepTXVY9J
 0/Z1b/crBAKzbBi9cuoMu9nMYGpgS0OHTNIO6yRY2I6KqK8443rfdhf2LtFt6yEThnoX
 OcPK81LUc7p//m0V0OFIytEo0YCSdjstokCvZsC0VE7+64h61Hph3HXN8JRtr4Vbjrxv
 DY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N06CAPYvOlm5/W3aXi8/Mqk0vScqXn5giEaCnBLbpU8=;
 b=mkhNPhRqtdkf6dRSagPno5fiyGEZZO1aGH8thetUSvl/Vl/f52vRF2DN1PHJYZYpQu
 hdR55IwBs0iytrmarBlzrkDmVfmXQY0V6ChwS5KZlsi5PTzZfiepvFGke+Mfcpvn2nO+
 dUUmrlGUEfJHWgCADyppm+SO8JBA+1rF0PSQyQKJSfAK0oRHZ2OFf93ESWDVND7VPCeO
 fsSrnA8DyLjHtBLgxgF6QZQ3SU4MkrS2PF97TFxLw9YZpNfTk9iC6U0DO6k5qXSI7bvX
 lUJxNSn860/SpFKYdZlfoOpbPG8mUCxtp5tMCsQaTE6vQ4neDqzbd7brXmaD+rM9wwqc
 CGgA==
X-Gm-Message-State: AOAM531EZz+0AvZRPalHCYZuIxhwI9/0zaqu7AOXC947aDBfNue3X19f
 ZijCXTybs/8Vq0UVaxyCw89Z2O739Btf/g==
X-Google-Smtp-Source: ABdhPJyEkV1+5q73FH36JNv/UFXhvHIiuoSD2j4fO5HgZP6ZN49oLVSr2uuA8bAG65z3pysZnUXgMQ==
X-Received: by 2002:a1c:2cc3:: with SMTP id s186mr970121wms.150.1624495371787; 
 Wed, 23 Jun 2021 17:42:51 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id 24sm6882368wmi.35.2021.06.23.17.42.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 17:42:50 -0700 (PDT)
Subject: Re: Guidance on emulating "sparse" address spaces
To: Jason Thorpe <thorpej@me.com>, qemu-devel@nongnu.org
References: <B588EDAA-3A97-44A9-8CAF-B2858CBE0A93@me.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <13c2d220-4000-74e2-a07b-88d6b898fb34@amsat.org>
Date: Thu, 24 Jun 2021 02:42:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <B588EDAA-3A97-44A9-8CAF-B2858CBE0A93@me.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 6/24/21 2:27 AM, Jason Thorpe wrote:
> As a "learn the internals of Qemu a little better" exercise, I am planning to write models for some older Alpha systems, initially for one based on the LCA45.  One of the quirks of these old systems, though, is lack of byte/word load/store.  So, to support 8- and 16-bit accesses to I/O devices, the PCI interfaces on these systems implement "sparse" I/O and memory spaces (some also implement a "dense" space that can be used for e.g. frame buffers; more on that another time).
> 
> The way the sparse spaces work is that the address space is exploded out, and the CPU-visible address used to perform the access is computed using the desired bus address along with a field to specify the byte-enables.
> 
> Using the 21066's IOC as an example, PCI I/O addresses 0000.0000 - 00ff.ffff are mapped to 1.c000.0000 - 0x1.dfff.fff.  The offset into the I/O space is shifted left 5 bits, and the byte-enables code is shifted left 3 bits, and both are added to the base address of PCI I/O space in the system memory map (1.c000.0000) resulting in the system physical address to use in a 32-bit load/store.  Software then does e.g. a 32-bit read to that location, and extracts the value out the relevant field.
> 
> Further complicating things ... it's possible for the bus region that's mapped into the system address space to not begin at 0.  As a hypothetical example you might have a PCI sparse memory space that maps PCI memory addresses 1000.0000 - 1fff.ffff.  The 2117x chipsets used on EV5/EV56 is a concrete example of a PCI interface that implements multiple windows for each space type.
> 
> I'm trying to wrap my head around how to achieve this in Qemu.  I don't see an obvious way from my initial study of how the PCI code and memory regions work.  Some guidance would be appreciated!

Is bitband_ops[] useful? (see hw/arm/armv7m.c)


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F28CA186020
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Mar 2020 22:55:28 +0100 (CET)
Received: from localhost ([::1]:59310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDbEF-0005Y0-HL
	for lists+qemu-devel@lfdr.de; Sun, 15 Mar 2020 17:55:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39058)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDb2J-0002QY-IJ
 for qemu-devel@nongnu.org; Sun, 15 Mar 2020 17:43:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDb2I-00058I-8d
 for qemu-devel@nongnu.org; Sun, 15 Mar 2020 17:43:07 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:45232)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDb2H-0004sa-Ul
 for qemu-devel@nongnu.org; Sun, 15 Mar 2020 17:43:06 -0400
Received: by mail-pg1-x544.google.com with SMTP id m15so8494345pgv.12
 for <qemu-devel@nongnu.org>; Sun, 15 Mar 2020 14:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gJLaGEE7zUZWZHfYiB6KWmfh/dPmWfAd8FO2l5bXGh4=;
 b=e//BMzK7h0KzXXIKSYg/0AS94qNPUzrKMFGQeKSq6SR11dmWG7FyfUWdTTkVBHvbS/
 AODVx2xHMjW7QMUuit0l49PdQCGT/LhxYYgfqpm02ChNDk15UVaxrHLGU2+AV6dlVLPC
 SL8XDwXRoiRfOWbRsBiWchl6n4uX+gCFGimNZ4hPIgmHHjb2qtmDUWLlfYQ62JEChU6o
 GhJu2RRH0sVwvjBldwm6sdL6sEu3zYSD2p5UY78NmKybDg3iKiTDOBGf7kdDmYDdxl0p
 GBLNS/HHywjSpwZixzkn3LCBYdiWhWG1YC2SQKvjbGZaWv8fghmMTuFXkK6l7DSeyUzv
 GtgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gJLaGEE7zUZWZHfYiB6KWmfh/dPmWfAd8FO2l5bXGh4=;
 b=WlCNV/j22nHdji+zkses4674AHVTmzPGTiUoBaU0Qw+at94h3+mKxOPvKkFQOG5wtU
 NRDpAGSjOr4EoFv+M8ez+d3cxWTEqMF68oDtq7cDIJMAaX/rgowyFu10SZCX6/0CBMil
 TEgrYiOzpqHvslL1nFUYc7VakxGqyjOinRt2eO2jG3cUHOpIeBJ0x+WKzetyjpC1Jdpy
 /dxyBcYggwC6zY7ReDHMa5L0TOl7eOI1zNz7RkTDjsfOBDD9I0vWs89sp49umN8FUsML
 FzPcyd1TMGPrhGuim0VOJGwr1ZJF0Xp7k1gYgNGholR+Wle/gg86JGqcqwBGHdZKk+Tr
 8BsQ==
X-Gm-Message-State: ANhLgQ2ZzoaoHnD+C9ExMb2ic8tkPWFBa73A5ZwfkBJU+UXX1doltmIm
 TWZqTQpxA2fwX/VCb/9IJys+bg==
X-Google-Smtp-Source: ADFU+vsokuRvKp8IGIEwHKA98fWLbJAUgVjRVx6Gj4Ve/d/MEmLVrwUH59iy6rrs2FPePRa7/WeW6w==
X-Received: by 2002:a63:7e56:: with SMTP id o22mr23036465pgn.136.1584308584206; 
 Sun, 15 Mar 2020 14:43:04 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 b22sm13508882pfi.213.2020.03.15.14.43.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Mar 2020 14:43:03 -0700 (PDT)
Subject: Re: [PATCH 2/9] hw/core/qdev-properties: Use qemu_strtoul() in
 set_pci_host_devaddr()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200313184607.11792-1-philmd@redhat.com>
 <20200313184607.11792-3-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1a758040-fc3e-fb2a-b49a-00fbd449daad@linaro.org>
Date: Sun, 15 Mar 2020 14:43:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200313184607.11792-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/13/20 11:46 AM, Philippe Mathieu-Daudé wrote:
> Replace strtoul() by qemu_strtoul() so checkpatch.pl won't complain
> if we move this code later.
...

>      p = str;
> -    val = strtoul(p, &e, 16);
> -    if (e == p || *e != ':') {
> +    if (qemu_strtoul(p, &e, 16, &val) < 0 || val > 0xffff || e == p) {
> +        goto inval;
> +    }
> +    if (*e != ':') {

You can drop the e == p test.  That's done in check_strtox_error, called by
qemu_strtoul.  Same for the other 2 instances.

The range check looks wrong, as we have not yet decided if this element is
"dom" or "bus".

> -    if (dom > 0xffff || bus > 0xff || slot > 0x1f || func > 7) {
> +    if (bus > 0xff) {

I think it makes sense to leave this line unchanged.  Increase the slot and
func local variables increased to unsigned long so that the range check isn't
truncated.


r~


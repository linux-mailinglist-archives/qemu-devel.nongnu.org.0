Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB962B4342
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 13:03:42 +0100 (CET)
Received: from localhost ([::1]:44308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kedET-0002lx-76
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 07:03:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ked51-0006gG-GH
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 06:53:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ked4y-0000vg-HP
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 06:53:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605527631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qighUjhPe2rPbWr6/lKqOkXqBAZdahc+QslYcVaynOY=;
 b=U5twrKMBQmOVNb8gKyZgC2voE7hXqmHFCf2dbq4TPI0FrfMkSDPG0ZqpTolD7xY6UxRZB4
 gYbz2VbG0YAe4WLv/2zgD4fdxwT9t0L/njbbVbsCzS01yoUAMSXp2sT9atMjQ3HQRxuj1b
 +VFCsQjLqNOuQJCbjpDisZofypWp/Go=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-GJO5mcl-P9i8NXWJ8AA-BQ-1; Mon, 16 Nov 2020 06:53:49 -0500
X-MC-Unique: GJO5mcl-P9i8NXWJ8AA-BQ-1
Received: by mail-wm1-f72.google.com with SMTP id u9so8678715wmb.2
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 03:53:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qighUjhPe2rPbWr6/lKqOkXqBAZdahc+QslYcVaynOY=;
 b=h0X82xO7X3ST/1s8IVton4YmoNQT78pdHREP5WF+Bp2NzfSFAuxw8vGmHDBou9Wjt8
 NWbinU1XbX4LhiHRqKarPziwit9zLrDl/jSI5AQCVKQdwZMRy2EQUiyxUOfonmOAGZ/i
 zd1AcDKx1fhxAxH54AJA02VfzJvnYIjLoEJxAhQmE76Me1p9mh41jrCk8XRFOHwmgsZX
 5nFb3VBgKeOnGhy5kGqlOC7/c5+rSgDbTdXm98QGmKAPJloYzX+bxaMvRF3bi3eRA/j+
 apcOTLgZpurRHlYHDFyeXS+w4rECxMSTpHSJLtt4tsNwavPr75B+ftvQLwMLrQ0lhDUc
 fnMg==
X-Gm-Message-State: AOAM53077AXGgu1orYIrYs28MubEewpX7VvL/8QUpT9AtGT5/AiZaOCf
 SFgiK/DeMz3bNifl6ym1b0gn7YmxnvpcwUIMcIOfxW3v/AomKVu4csSG9CKdehs2MdcXvWfd/Kp
 gnJPK0WzOky0ckkY=
X-Received: by 2002:adf:df83:: with SMTP id z3mr18145093wrl.23.1605527628721; 
 Mon, 16 Nov 2020 03:53:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy4jO6e5bbA1BGbgj5QmfZDYUm7uOV6/eSRAnelJ159XNrAmuWfQqtcYSsMjxpXBJ7I6gbSAw==
X-Received: by 2002:adf:df83:: with SMTP id z3mr18145084wrl.23.1605527628548; 
 Mon, 16 Nov 2020 03:53:48 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id u7sm428055wmb.20.2020.11.16.03.53.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 03:53:47 -0800 (PST)
Subject: Re: [Bug 1904317] [NEW] cpu feature selection is not affected to
 guest 's cpuid with whpx
To: Bug 1904317 <1904317@bugs.launchpad.net>, qemu-devel@nongnu.org
References: <160543118215.29327.13808899207251644228.malonedeb@wampee.canonical.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <acd1ef91-aa59-37a0-bee2-199afe890a2d@redhat.com>
Date: Mon, 16 Nov 2020 12:53:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <160543118215.29327.13808899207251644228.malonedeb@wampee.canonical.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Sunil Muthuswamy <sunilmut@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Sunil (WHPX maintainer).

On 11/15/20 10:06 AM, Takumi Nakamura wrote:
> Public bug reported:
> 
> On windows with -accel whpx, "-cpu" is ignored without any messages.
> Guest recognizes features as same as host's.
> 
> Confirmed on v5.2.0-rc1.
> 
> I suggest qemu may do,
> 
> - Warn with incompatible -cpu options were given.
> - Enhance cpuid handling.
> 
> Background:
> I was investigated mmio and block copy issue in Linux kernel.
> I met a problem that Linux went ill for touching mmio with whpx. (not with tcg)
> I suspect erms(enhanced rep movs) might trigger.
> I tried to mask erms on qemu with -feature,erms, but it was ineffective.
> 
> At last, I disabled erms manually, to tweak whpx-all.c to mask erms in
> cpuid.
> 
> FYI, qemu with whpx from/to mmio, "rep movsb" does byte access regardless of erms.
> Linux kernel tends to choose not "rep movsq" but "rep movsb" with erms.
> 
> ** Affects: qemu
>      Importance: Undecided
>          Status: New
> 



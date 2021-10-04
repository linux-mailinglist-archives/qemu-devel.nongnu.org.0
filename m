Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D6542092F
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 12:14:14 +0200 (CEST)
Received: from localhost ([::1]:54606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXKz7-00035g-SB
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 06:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mXKwF-0001OJ-Po
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 06:11:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mXKwB-0001fA-SQ
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 06:11:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633342269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zu8sEWH4FsQFacwZ4S/EkrrjoXHQ0nXDtvd+ns0lDeI=;
 b=LfEYCTERIs5TXFjpz0en27T50w0eM8HP6NxjyZlubfSiixgHY0GIMhQsrrlB5uBj9jtRCt
 QDMY1wKLKWYDKusWwZ6qaeDEYNE64Hd7rVDjvfv7sLUzDyJodkO8ftZgRgQnxpO5kfSStV
 rgB1zCM17HnRuoTfKjQHfhqlBf8Z5mY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-YN-Hv5NgPaSt-vfmZ8Ms1g-1; Mon, 04 Oct 2021 06:11:02 -0400
X-MC-Unique: YN-Hv5NgPaSt-vfmZ8Ms1g-1
Received: by mail-wm1-f70.google.com with SMTP id
 f10-20020a7bcd0a000000b0030d2def848dso3441937wmj.0
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 03:11:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zu8sEWH4FsQFacwZ4S/EkrrjoXHQ0nXDtvd+ns0lDeI=;
 b=c3HGrqRTcMG0UapnV7BFmqj+/8tglrLfqL/uBvDoXezFYeoBQWhYA8bDOiN5DoaSKO
 yzFaOvfIx2CUOk563kSsk1QXjrbmwjYM5kZ73+tthIbk/AaMkMjUc0zfo5UqGj7s4NoL
 sIQdMrgpxlqsNjnqapM6wGorlgS05N65x+DFvtgy3Hp+CeHh07tUyYM/kyN6Py3ax4hs
 Wa97uPUCmAh26Arv8YL62NTMRExreMdK9MCL5G+C4tNqZ1y4dTU1m03NT9jfZGF/HoT/
 SKilWUIHWuQ/9AB6pB6PYWXiTpw4cGfMuP3M80dFaN8GTIBOwXDcmztmqS4eBIvl4XSe
 C07g==
X-Gm-Message-State: AOAM533WToNVNPfHANakR1JF9M3uNYyzor8+EmkvvfpyGq1fGzqEticd
 JhKxtrgAXzZk84KpdTmVIrLlWYI5SGbZmVbxn0zxqEdGdujjxVBgEERSx48ffzq+EWNWkn5ylmX
 p2zV8PfWSjdZa+ak=
X-Received: by 2002:a5d:64e2:: with SMTP id g2mr13292931wri.20.1633342261815; 
 Mon, 04 Oct 2021 03:11:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6MJI5/rNG+t8CCmTFUONQxiO7SWXj+VjW653elXVO/QjqhryQoKffb3QZfPbHpeR9WRQ7Cg==
X-Received: by 2002:a5d:64e2:: with SMTP id g2mr13292921wri.20.1633342261637; 
 Mon, 04 Oct 2021 03:11:01 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id c7sm17635516wmq.13.2021.10.04.03.11.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 03:11:01 -0700 (PDT)
Message-ID: <475b055d-b3b4-a98f-c4da-94b47e80afbf@redhat.com>
Date: Mon, 4 Oct 2021 12:11:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 5/5] meson: show library versions in the summary
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211004093053.87883-1-pbonzini@redhat.com>
 <20211004094943.92925-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211004094943.92925-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/4/21 11:49, Paolo Bonzini wrote:
> Meson 0.57 allows passing external programs and dependency objects
> to summary().  Use this to show library versions and paths in the
> summary.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  meson.build | 112 +++++++++++++++++++++++++---------------------------
>  1 file changed, 54 insertions(+), 58 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>



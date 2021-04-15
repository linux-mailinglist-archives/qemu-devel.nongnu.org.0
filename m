Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF47036081A
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 13:19:44 +0200 (CEST)
Received: from localhost ([::1]:59596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX02B-0003uC-QG
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 07:19:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lX01B-0003Tc-U5
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 07:18:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lX018-0005tS-Ii
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 07:18:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618485516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l8CX0j3kKcDw4myT1viTw7tCdwC2X/FToEXeuE4DRLc=;
 b=CYdqQHrUgHC/jdjJGWo8VVMO209eLdJJ5qoWqY9FOFVRbqIL51L9SqfWCSUMfKWkdxD4Tb
 XY5lz4zvtGd3xHGNRXOi0uax+Pbopou+SHlefMjQYOwLZzaB6og++etiHk7bRll8K5FUnJ
 fwih/Qp7XF++eYY1xRy0xwA19K4qOvQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-Ji0MYzYhPh-_JP2izxyTgA-1; Thu, 15 Apr 2021 07:18:34 -0400
X-MC-Unique: Ji0MYzYhPh-_JP2izxyTgA-1
Received: by mail-ej1-f70.google.com with SMTP id
 ji8-20020a1709079808b029037c921a9ea0so805613ejc.9
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 04:18:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=l8CX0j3kKcDw4myT1viTw7tCdwC2X/FToEXeuE4DRLc=;
 b=P5MetT1rFIFpPhHfJfNp5MJKNNCTv5O7PTNBjUnpQmIjI5e7G2Lh4tQSXbyvt+7OJf
 zxy8Tw7J6QJEqapZ51wCy2bfB+MRsCWCDOa+mFSqm6FpmTNpW9rSqjgGw1TukxQ2VvGe
 5AkFDn75M9y6XPElHXGVW0AGiJ8nzwbWSOb3s/KlIGJz8pFBWZX7ebd1eJT6zwQApqSc
 Q65HGQqIV8x7KunIAvTiYwbUxZZGmjiWkEaQwTigEenZS8Ay+9tZsnU2yWNX/dsVZuIo
 lDX25Tyr4fDSO/Zxu9WyjJuKkfNYL+XYCNeCxBgFUT0KSs7CIIIJm3qIpGe6rqMw7Flz
 CBNA==
X-Gm-Message-State: AOAM530cY2sKFOB3yMJXbbwN2YDZnwaw152EqrTsuqtfTgBqhSfLr7vJ
 KErYUjH5/lyfqbd+XjrfKB6GJndqyVOgr90N1jsIs6JjrjqgqAJ2pZ5wYUSlu78metfJWyFXghC
 w2+j8cDc+4ctm1EI=
X-Received: by 2002:a50:aad9:: with SMTP id r25mr3551240edc.125.1618485513830; 
 Thu, 15 Apr 2021 04:18:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlebJwTK2IBVfRnkcflNTDkMaFmftbaq9N4EnBgg+Ec7gheTaPU5tO57W+Lr7JA+csRRv3iA==
X-Received: by 2002:a50:aad9:: with SMTP id r25mr3551226edc.125.1618485513676; 
 Thu, 15 Apr 2021 04:18:33 -0700 (PDT)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id g10sm2417811edf.82.2021.04.15.04.18.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 04:18:33 -0700 (PDT)
Date: Thu, 15 Apr 2021 13:18:31 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 1/2] exec/memory: Extract address_space_set() from
 dma_memory_set()
Message-ID: <20210415111831.ibgipfy7uiwbeacs@steredhat>
References: <20210415100409.3977971-1-philmd@redhat.com>
 <20210415100409.3977971-2-philmd@redhat.com>
 <20210415110047.ku3uqj5evcprs77r@steredhat>
 <CAFEAcA9=hGVPgN0bCcgkRmqGG-ouHwz09VxXHBH-eyToWugRPA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9=hGVPgN0bCcgkRmqGG-ouHwz09VxXHBH-eyToWugRPA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 15, 2021 at 12:05:07PM +0100, Peter Maydell wrote:
>On Thu, 15 Apr 2021 at 12:00, Stefano Garzarella <sgarzare@redhat.com> wrote:
>>
>> On Thu, Apr 15, 2021 at 12:04:08PM +0200, Philippe Mathieu-Daudé wrote:
>> >dma_memory_set() does a DMA barrier, set the address space with
>> >a constant value. The constant value filling code is not specific
>> >to DMA and can be used for AddressSpace. Extract it as a new
>> >helper: address_space_set().
>
>> >
>> >+MemTxResult address_space_set(AddressSpace *as, hwaddr addr,
>> >+                              uint8_t c, hwaddr len, MemTxAttrs attrs)
>> >+{
>> >+#define FILLBUF_SIZE 512
>> >+    uint8_t fillbuf[FILLBUF_SIZE];
>> >+    int l;
>> >+    MemTxResult error = MEMTX_OK;
>> >+
>> >+    memset(fillbuf, c, FILLBUF_SIZE);
>> >+    while (len > 0) {
>>
>> What about return immediately if there is an error?
>> I mean:
>>      while (len > 0 && result == MEMTX_OK) {
>
>I think that (a) we're just moving code here so we don't want to also
>change semantics; (b) there's a comment in memattrs.h that says
> * A zero (MEMTX_OK) response means success; anything else is a failure
> * of some kind. The memory subsystem will bitwise-OR together results
> * if it is synthesizing an operation from multiple smaller accesses.
>
>so in this function "keep going but merge errors" is in keeping with that
>principle.

Got it, thanks for the explanation! :-)

Stefano



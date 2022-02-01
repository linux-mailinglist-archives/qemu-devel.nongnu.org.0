Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCDD4A57BF
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 08:28:52 +0100 (CET)
Received: from localhost ([::1]:51746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEnat-0002Dr-O1
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 02:28:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nEmyR-0007a0-Hs
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 01:49:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nEmyP-0000aq-Kt
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 01:49:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643698142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=22DWGy59xjH+zk4cQU6WsUGCyBzko5ilGlEqn/uehJk=;
 b=eUYAbPtTAflG/Na+HUQqduO2nYSHEpnX1wqy94n8qWCt/z1P6q8CXvM5CL62T0c+CMnyJS
 pMNhQCDIfd4kAE3oQwRkaKpHohtefgamqJDlWqpjghj9wu0tEGIfdnOfq2u7t1/zwtoHUX
 4LgbHzVpbkjlgmtP7YErM6X3DtdPkYI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-6ySH-bguOI-2HncmecBhGg-1; Tue, 01 Feb 2022 01:49:01 -0500
X-MC-Unique: 6ySH-bguOI-2HncmecBhGg-1
Received: by mail-wm1-f71.google.com with SMTP id
 q71-20020a1ca74a000000b003507f38e330so1018420wme.9
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 22:49:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=22DWGy59xjH+zk4cQU6WsUGCyBzko5ilGlEqn/uehJk=;
 b=vvAN6EzCTkQV1g8zWLdGXGbzbF2/vvNLiCcKUxXlr4xwhnUD4lRKyrpjt/4kyCdcu6
 V39VCBPvNoL7vcULaBI8/jq8Bn9Q7vUInrzPa1wYXW8bvw8hOd9/NLHfWLt4+6Vhqhb+
 DJOO8YTcSZKfVZYaTzxrR858EFWsNMdwjlDBlii/YbqqBKORdegzcB79GE0bH958SNqC
 gmO17k4/jtvDdj0OsJZ30CvvfhFxAIV99FfOziJFt5vIQw5kHUzUViVJWaigP0hw6unk
 Y14XUcS+CJ3ZgCNE6/CgRC8ev0TQMCzfGICxHqiHPzlcna0CvAUfLd+3Z/qfTGETqeh6
 60Gw==
X-Gm-Message-State: AOAM53190QIZUqV0PKJ0XkLeEm1dxhUIo1PoTjpA8XEwtGLX36UCu57j
 +LmluYXzVe6oLPkv+63+q3hSbE1dxnTsT/MARFE0PBYyY73uZxIg9qdhWqK/oQ9m45BagtPrx+6
 5JZJOVbLApeajeLI=
X-Received: by 2002:a1c:7c05:: with SMTP id x5mr464085wmc.71.1643698140264;
 Mon, 31 Jan 2022 22:49:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxapriMrrEfIS0o4pukcKgnRKJl/xZSDZDbPca1KFIxE90ztP+Fi9Ovgv0cUCIUjC7R0dYxwA==
X-Received: by 2002:a1c:7c05:: with SMTP id x5mr464074wmc.71.1643698140030;
 Mon, 31 Jan 2022 22:49:00 -0800 (PST)
Received: from [192.168.8.100] (tmo-096-196.customers.d1-online.com.
 [80.187.96.196])
 by smtp.gmail.com with ESMTPSA id j19sm1260135wmq.17.2022.01.31.22.48.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 22:48:59 -0800 (PST)
Message-ID: <de031f36-963c-8828-6724-450e9fbf48d6@redhat.com>
Date: Tue, 1 Feb 2022 07:48:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] hw/char/renesas_sci: Add fifo buffer to backend
 interface.
To: Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-devel@nongnu.org
References: <20220131094246.772550-1-ysato@users.sourceforge.jp>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220131094246.772550-1-ysato@users.sourceforge.jp>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 31/01/2022 10.42, Yoshinori Sato wrote:
> SCI does not have a fifo, it is necessary to send and receive
>   at a bit rate speed.
> But, qemu's chardev backend does not have a buffer,
>   so it sends received data continuously.
> By buffering the received data with the FIFO, continuous
>   received data can be received.

  Hi!

If you describe it like this, it sounds like you're now emulating a buffer 
that is not there with real hardware? Is that really what you want here, 
i.e. wouldn't this hide problems with the real hardware that are mitigated 
in QEMU with this buffer?

Anyway, please use scripts/get_maintainer.pl to get a list of people who 
should be put on CC:, otherwise your patches might get lost in the high 
traffic of the mailing list.

  Thomas



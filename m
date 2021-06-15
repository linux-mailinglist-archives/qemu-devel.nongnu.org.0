Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0886E3A80BE
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 15:40:10 +0200 (CEST)
Received: from localhost ([::1]:35264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt9IU-0005Pp-Lq
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 09:40:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lt9ES-0002o8-Dj
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:35:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lt9EO-00012y-2i
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:35:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623764149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jOanARBwpH2KjRmqtZ/jvCNI9f84dr/P5VcJ2IgFK3g=;
 b=dR2P4HgGzPMfouV++SVUCQIKR6neqfSBwORPzf0vnMYF8Jo41XLZD6lpdUqKbyWIxbOxwg
 IbzOZJ4G+9g9Ej3fQLIT4B5j9v7vudPGMOl4CkmHwaG/djnk3taanjhJdN+q3lo4LiNiTg
 gFCP5ZN5KnmGgmnqsf2ZhAZ0+EZjwBw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-xTjRg30HM6OceVnLl_GnTg-1; Tue, 15 Jun 2021 09:35:47 -0400
X-MC-Unique: xTjRg30HM6OceVnLl_GnTg-1
Received: by mail-ed1-f70.google.com with SMTP id
 f12-20020a056402150cb029038fdcfb6ea2so22183207edw.14
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 06:35:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jOanARBwpH2KjRmqtZ/jvCNI9f84dr/P5VcJ2IgFK3g=;
 b=QjxXxR1rHSxvAmbDDumAAoqnpk2+IvmBnzy3dHtzvTbDtv9WGyXOjOMmhgepdbGzCn
 cSPpZFeV00F1LiNnoSZ5HJBfyXOGwvqpvJoq+jn/xdZtitLj9FR9DMPz10Wvru/S2Oi+
 ro7LJlRKTgI5pD90MPFaqv6cgNmciDY/rdbzXUzqQ+vepZueM/ZZc0aRfPFHFfZYzEFr
 McDj3W5fMgkYNIYsxEKlrZlAedCxQAWGj3o4YbynrHjyGSaIpQRVncpWy71Nt26sSmpM
 RHhbiOrnzK2kS4YaLiXF7YhU90DJngbrMhBAQ5hCFWu2yFJWtEF+VRIZq0fZnIiAy31e
 90bw==
X-Gm-Message-State: AOAM533OX0JnwTLD5idbFB+ETQ+CX/+7hF3AzSyWvBni5M0u8f2ttQy5
 iDIq6M+vW5wAJFzKpojLHY1GdU4g9GFNTiyf6Q4Dtx4tvW2sd3f+YWfsoOwbmTdSZ3zIpEoFlgY
 kWxa528Gjoujchtk8M7hCodmqKhpOQMPQ8evnflPYCY0L1rrkOyu+SDRbHxsH/AfV7b8=
X-Received: by 2002:aa7:d590:: with SMTP id r16mr23680149edq.355.1623764146035; 
 Tue, 15 Jun 2021 06:35:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0xTcUCT6tekLqGcVnywmoE6JQ8NWpBwhtFppukPlfgAm82VN1IW/2zl3QoGVvSFZtpFiENQ==
X-Received: by 2002:aa7:d590:: with SMTP id r16mr23680116edq.355.1623764145801; 
 Tue, 15 Jun 2021 06:35:45 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id e18sm10023823ejh.64.2021.06.15.06.35.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 06:35:45 -0700 (PDT)
Subject: Re: [PATCH v2 03/18] modules: add qemu-modinfo utility
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20210610055755.538119-1-kraxel@redhat.com>
 <20210610055755.538119-4-kraxel@redhat.com>
 <20210610130424.fj6fsufnunccmhmx@sirius.home.kraxel.org>
 <YMIP/cKc570Ozvdh@redhat.com>
 <1636b96e-9073-b145-3fcc-3370fa2d7506@redhat.com>
 <8b860457-7c51-f4cb-1e80-02848ad92648@redhat.com>
 <20210615044915.agzl7vsjewpatyhp@sirius.home.kraxel.org>
 <20210615075646.vcv3bhbrffs5exez@sirius.home.kraxel.org>
 <20210615130715.lye3spkpa24x3pyj@sirius.home.kraxel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <279b97e2-d06d-b929-0265-d4bd41dc6ee2@redhat.com>
Date: Tue, 15 Jun 2021 15:35:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210615130715.lye3spkpa24x3pyj@sirius.home.kraxel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/06/21 15:07, Gerd Hoffmann wrote:
>> Hmm, looks like I actually need both.  Seems there is no easy way to get
>> the cflags out of a source_set to construct a cpp command line.  Pulling
>> this out of compile_commands.json with jq works though.
> Well, easy until I look at target-specific modules where the
> "source file" -> "command" mapping isn't unique any more.  Which makes
> this route less attractive ...

I was almost giving up... but it looks like the result of 
extract_all_objects(recursive: true) can be passed to custom_target(). 
Then you can match it after compile_commands.json's "output" key.

Paolo

> Any idea on getting the cflags in meson.build  Or maybe I can somehow
> ask meson to run the cpp pass only for a given source set?



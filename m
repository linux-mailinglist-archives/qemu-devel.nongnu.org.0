Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F063EE942
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 11:14:46 +0200 (CEST)
Received: from localhost ([::1]:47098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFvBF-00059K-W7
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 05:14:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFv99-0003EY-3X
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 05:12:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFv97-0001G2-3f
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 05:12:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629191552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lnMr3ghTnf5q8go4arGHZR4ZFPnk0bLmIVCZpJpXJGk=;
 b=CiIETBCotwAJiSoHscZevwQKZVlcwEyEtxu9ZyfXPhTJxj3mbdfR/S9Zl0u3sDjZ37cDCN
 2pqqh2iSBWxvnsbklWP2eSKZRt+PDUleeyQ+fLsaJQeJacfusfD8MdfTlTN2Oepcxntevn
 efJe6dcMBPKnFSUaVeyhIkldJkXkCGA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-xXcD5OI4Ncy2yGOlJN0sCg-1; Tue, 17 Aug 2021 05:12:31 -0400
X-MC-Unique: xXcD5OI4Ncy2yGOlJN0sCg-1
Received: by mail-wr1-f71.google.com with SMTP id
 m5-20020a5d6a050000b0290154e83dce73so6289856wru.19
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 02:12:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lnMr3ghTnf5q8go4arGHZR4ZFPnk0bLmIVCZpJpXJGk=;
 b=iTGhbI34ujHK1iHQjjoWaUj5O/WEOtNz7VnSl3/w/rNdvQ40d+V0zs6/mRKz2Oz/K5
 +QQqocypzNspZ40/ghQdVpp8/WyI0AGWVaNM8LXlZRPCSqx6sNvW00Ek7n2J7omU/8FL
 KhyQvElw78DixBJSA3jtlT6etmwWD3UczHAcZ12XJv0pH7ZEDjAIXH5Acm8FL+835Zh5
 RXjUvXWml+rrU883JFUszTfWEL0NMsA2vvSJPFIp6y3SBViO6EZ1XP2xzKuqlQEJ4LMr
 +Dht7+7CVSZI6g565PUVzw2kDzTt5k9K1kB7y0rkzSpgouLw+vtPBWhz7XKPDNP1K3ga
 f5fQ==
X-Gm-Message-State: AOAM532sZWCiiXSQOLFlLacxqTFoS10n/M8d790T/aJzOpjll4qQChTO
 PdP4qk9A9GvioM2vN8GGRiBYhd/M3Kb54LR4KYIAB8qywmV8OoGcttgfnpxhl95pWwMPbSZXRSp
 NSrrLi5/9yR8ZL+0=
X-Received: by 2002:a7b:c1cf:: with SMTP id a15mr2235996wmj.72.1629191550013; 
 Tue, 17 Aug 2021 02:12:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeAIgS2YKvXG0nne5L+mZoosAF40eXCbug4VMLASu3xhiYjsMY4dIXJj9XNT1C7oHQi6tD6A==
X-Received: by 2002:a7b:c1cf:: with SMTP id a15mr2235983wmj.72.1629191549907; 
 Tue, 17 Aug 2021 02:12:29 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id j6sm1328204wms.44.2021.08.17.02.12.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 02:12:29 -0700 (PDT)
Subject: Re: [PATCH 1/2] chardev: Propagate error from logfile opening
To: Michal Privoznik <mprivozn@redhat.com>, qemu-devel@nongnu.org
References: <cover.1629190206.git.mprivozn@redhat.com>
 <f34ee80866e6f591bcb98401dee27682f5543fca.1629190206.git.mprivozn@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <44d0c359-f063-bdf9-fede-1d6d905ca815@redhat.com>
Date: Tue, 17 Aug 2021 11:12:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f34ee80866e6f591bcb98401dee27682f5543fca.1629190206.git.mprivozn@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.71, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/17/21 10:56 AM, Michal Privoznik wrote:
> If a chardev has a logfile the file is opened using
> qemu_open_old() which does the job, but since @errp is not
> propagated into qemu_open_internal() we lose much more accurate
> error and just report "Unable to open logfile $errno".  When
> using plain files, it's probably okay as nothing complex is
> happening behind the curtains. But the problem becomes more
> prominent when passing an "/dev/fdset/XXX" path since much more
> needs to be done.
> 
> The fix is to use qemu_create() which passes @errp further down.
> 
> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
> ---
>  chardev/char.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>



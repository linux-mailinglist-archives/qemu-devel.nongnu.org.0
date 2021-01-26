Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACC1303B9A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 12:29:10 +0100 (CET)
Received: from localhost ([::1]:38672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4MWz-0005EU-7p
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 06:29:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4MOM-00066S-Ou
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:20:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4MOL-0000zO-8a
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:20:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611660012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZK4C9W7DSjxUZTRQ2v7f+/HXM95m0tgAqoFrqWzNbDQ=;
 b=FxOcsRYB9jYFhIsHxaopjoZu8DuvjVO68tP2ohazMwFyFPGB0VRCWDlwn+o+qSePH5foVL
 5dY8z/kQfQf8F25L3D7jZarvE00x7JY1oEDsBLtMBFnv5i+nxtHsCKqWmvT4URgufq8KQ5
 MMR2PlXKM/fYtqjKMbmT0WlNAzRAHZQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-OWbQ2XYxNdGGrza9dAhb4g-1; Tue, 26 Jan 2021 06:20:11 -0500
X-MC-Unique: OWbQ2XYxNdGGrza9dAhb4g-1
Received: by mail-ed1-f69.google.com with SMTP id f21so9256122edx.23
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 03:20:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZK4C9W7DSjxUZTRQ2v7f+/HXM95m0tgAqoFrqWzNbDQ=;
 b=FwWJ+t1Vp0igHPf8rJ8WpSo4zjjnGxw7YJfMl+PFyK+Mn2HyU7wkUv0TuC5k8bmJZi
 TsY1MVbJOq6fSkX1bkXovRX1sTrE28uALtyjrhC98FPzyKF58J61MJmmu++0TD7F2qdr
 zO90euFK5i0Zs14wGKZclFcbsyRCL48NqZVWptinvo2pnmE+B8Vs6tI/6UdJGtYMbTm3
 ncvbrYrAFdap4xd5D622iD2Qf+e3WkZkQXznc2NIQqu7D31a94Bb1rIh2Goij6V9U6KI
 zfQNGsAQAHuoI2gcAQCay4hPuSQ6OoRIOiimy7GXOGWlbeUQ+rgapjSqg9QlDRBmaBRW
 34DA==
X-Gm-Message-State: AOAM531kmDD9hHdXcw0pMljngT/7hIi5O7eD7De1s/4svP8kDL0h8c/n
 lRiW74ctxpBDlUX4D9NqCYN3ySnayt5KAqwObZJHhHmeg1DZzofmo0MTRCFU07sidftoeztUpAp
 TSu/9wGY6tYJWU90=
X-Received: by 2002:aa7:cb42:: with SMTP id w2mr4232362edt.21.1611660009372;
 Tue, 26 Jan 2021 03:20:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdPHXzjQ0BbsfMx7IQMp6BWAg4AoBqgPBFX3c62mBX2HyBJIqPlGryw3aJfzdEiR2ClweexQ==
X-Received: by 2002:aa7:cb42:: with SMTP id w2mr4232353edt.21.1611660009237;
 Tue, 26 Jan 2021 03:20:09 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id r23sm9446569ejd.56.2021.01.26.03.20.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jan 2021 03:20:08 -0800 (PST)
Subject: Re: [PATCH v2 0/2] tests/qtest: Only run fuzz-tests when tested
 devices are available
To: qemu-devel@nongnu.org
References: <20210126111638.3141780-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9fab24c7-50d7-3744-efa6-b8452d06ed4d@redhat.com>
Date: Tue, 26 Jan 2021 12:20:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210126111638.3141780-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Hannes Reinecke <hare@suse.com>, qemu-block@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/26/21 12:16 PM, Philippe Mathieu-Daudé wrote:
> Some tests/qtest/fuzz-test fail when the device tested is
> not available in the build. Fix this by only running the
> test when devices are available.

Forgot, since v1:

- Do not make the testing generic, keep it restricted to x86 (thuth)

> FWIW Alexander Bulekov suggested an improvement, putting each
> test in a directory named by the device tested. This series
> does not cover that.
> 
> Supersedes: <20210115150936.3333282-1-philmd@redhat.com>
> 
> Philippe Mathieu-Daudé (2):
>   tests/qtest: Only run fuzz-megasas-test if megasas device is available
>   tests/qtest: Only run fuzz-virtio-scsi when virtio-scsi is available



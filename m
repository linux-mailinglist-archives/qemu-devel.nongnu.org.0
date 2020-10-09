Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B75528880A
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Oct 2020 13:47:58 +0200 (CEST)
Received: from localhost ([::1]:40710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQqsO-0003j3-N2
	for lists+qemu-devel@lfdr.de; Fri, 09 Oct 2020 07:47:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kQqrT-0003Jq-7X
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 07:46:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kQqrQ-000400-Vw
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 07:46:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602244015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gbiX0RPxueyEoG4YLe4GoIj+2mKyFdonIvSzCKKSz0o=;
 b=EonGQQENFD362xviceH8S1naRfnTP5BuGQwHMblUa7+X+UkkTnqnNdS05jNx71FjAzb+ud
 kRzYpC1Z3TxMISKz/afBzfp9CxDHMIxdtUaBaqswTzTZlrisg33Tu8GQ5TAu2ddmlffGvl
 yDvkSrqD+qfpSZzjQwKOlqPJGnvWrMA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-YKnBfm7CNGu2bQZiCQvDmg-1; Fri, 09 Oct 2020 07:46:53 -0400
X-MC-Unique: YKnBfm7CNGu2bQZiCQvDmg-1
Received: by mail-wr1-f71.google.com with SMTP id d9so5142075wrv.16
 for <qemu-devel@nongnu.org>; Fri, 09 Oct 2020 04:46:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gbiX0RPxueyEoG4YLe4GoIj+2mKyFdonIvSzCKKSz0o=;
 b=gseBq1r8hV6LfGJ+LpcpOICL2rmYxZS6il94dOsLPgzcpQ0bP6sL5SDKoFPPE6x9GG
 uIm5K04WmSPvdKluZIxc+b4QCA59K6KLwyQilJrZMJUNmfj++jpsqgSqSVH7PpZkifq1
 W0TX/xgbmgsps2vhqCxnjvqo/GNC1OOVDey+ImlTSoDhgV3cQ3EkGYu+YcM3+z509YDA
 UFI6kD4RPCoie1D023lHWF5xjKQvykgleMq9N9Rq847p2nxEwfFIklrF9c3l7OOyo0M2
 FBnUjHcTxtY4oWbv7H6bnqkEYw4ffmdMzVgraNh1K5GmeRk3LFoZjYrlbceb4LwpzUdp
 c5Ew==
X-Gm-Message-State: AOAM532ZwrFpXOhxuVAnZ/QCLvx/hKpNva4sQBpiBLVyffzOvqmW9pdr
 IVv/wQv8s0qoUU0hUg7ziGRhnrdw+44pKeH3L7VPNLdj0B/7zQlAoMnEyfZq73ufdCudNmi6THG
 3umETWt9jHmYziUs=
X-Received: by 2002:a1c:ed19:: with SMTP id l25mr13798584wmh.49.1602244012475; 
 Fri, 09 Oct 2020 04:46:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyN3BIr5ftK/5B2jVyTGKq/8oXFqoaLFFgmexUIJGUJVWoV8vJSQthuU8cDdT0Gm/QBtGlorA==
X-Received: by 2002:a1c:ed19:: with SMTP id l25mr13798571wmh.49.1602244012270; 
 Fri, 09 Oct 2020 04:46:52 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:cee1:4797:6958:7698?
 ([2001:b07:6468:f312:cee1:4797:6958:7698])
 by smtp.gmail.com with ESMTPSA id c18sm12137882wrq.5.2020.10.09.04.46.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2020 04:46:51 -0700 (PDT)
Subject: Re: does make check now require TCG? Or is it a parallelism issue?
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
References: <11ef73ff-4178-b3e8-2e49-44ff014a13ed@suse.de>
 <569520f6-adf6-6212-9625-a184bf499e24@redhat.com>
 <e6300199-39e3-4f11-d97e-e2e7d9a9e8ef@suse.de>
 <16b01645-7a80-7f79-aba0-fd6c6c8ba6e8@suse.de>
 <62339951-606d-15d0-e2ad-bd46f3e6de87@redhat.com>
 <0b6397b1-019c-4b92-f00d-09214e276e46@suse.de>
 <b8487188-e492-d6f3-6c3d-c33fdf6f2404@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f0893295-7697-78c6-ef78-e6c605c3ce2e@redhat.com>
Date: Fri, 9 Oct 2020 13:46:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <b8487188-e492-d6f3-6c3d-c33fdf6f2404@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/09 02:34:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.208, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Alex Bennee <alex.bennee@linaro.org>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/10/20 11:23, Philippe Mathieu-Daudé wrote:
> 
> Soft accelerator are TCG and QTest. Replay only works with soft
> accelerator. Should replay work with QTest? Is this useful?

Probably not, since we don't have icount (anymore) in qtest.

Paolo

> If replay is only usable with TCG, can we merge it into it?
> It seems quite accel-related.



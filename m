Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 231272B43FC
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 13:50:43 +0100 (CET)
Received: from localhost ([::1]:45976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kedxy-0006Mw-6O
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 07:50:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kedwA-0004rJ-Dh
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:48:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kedw7-0003Ep-NO
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:48:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605530925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PTWWKBiJb0Zfw9B1RfrhlrgPZz1Oc5gjK3Jm1vkbD2M=;
 b=dTK2bJ1oyfoeKNAxyXiYfee7QSTcDNhESawlepFTGaQBhdVQwYGpi/LErxuyGDHVkRP//s
 zt82vQrb6n51cV4cTpDU29tCb421OdsWt6KZfmROoPUeGNPLc01kj279F+S6xDA7TlOXjX
 3meYK/zyBh08vidxgPvS0GQfvtxYq44=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-oLhknK2-NOq0ZnT1zKyjJA-1; Mon, 16 Nov 2020 07:48:44 -0500
X-MC-Unique: oLhknK2-NOq0ZnT1zKyjJA-1
Received: by mail-wr1-f71.google.com with SMTP id y2so11145727wrl.3
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 04:48:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PTWWKBiJb0Zfw9B1RfrhlrgPZz1Oc5gjK3Jm1vkbD2M=;
 b=Gmd5jTIpzER3iGDwoiANhbWqEqEWkT9wh7C1qqnus+aI4L03R/rFn7SgZ5lSmOe4FL
 6I7hUElUJZMToGZd1oBnerA9Vm6HelokOfa7c6qcViNaUdJ58ekfk1rer3BBfC6LGtuz
 z5/C1ry2RVIKOM1D0wBQv9jSvsQOqxYnOkzvBwn/z0/cY3LjynRmVYBsPeB4UbP8VHRY
 5jQ8CcTTnGqj0zmxk448nqqduKZP5BWrlH8usRauSQRwS4rVgxm9neIjpwWuWWCVdS8+
 qMVzZxb7jMT78jHBdfJxaio/o04lMJYpAu0P8zAqVZ+q0iPSGKtQu8F05nCPMXMmgfn7
 X+VQ==
X-Gm-Message-State: AOAM531A6YNQQwsV0K+kZDezclKOGunkBv/5kFsjU5ImCv+bK4IS7no7
 uakk0ogW9Q9sYIEvbjkl+uy6qB/3Bpth9WWPTW5TTLW+7b00RUuZVW+b9ahFhLn8rw5vtGGoNWe
 2wd3lJ4r/s054ims=
X-Received: by 2002:a1c:2b03:: with SMTP id r3mr14719437wmr.184.1605530922464; 
 Mon, 16 Nov 2020 04:48:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQgImdTeAsJt+jMXpUPhVDlXhZzIw9NV8xvTGv1KUcs0QezYalGdS/wDmBFvkq8ig3V7D08A==
X-Received: by 2002:a1c:2b03:: with SMTP id r3mr14719419wmr.184.1605530922331; 
 Mon, 16 Nov 2020 04:48:42 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id q16sm22840091wrn.13.2020.11.16.04.48.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 04:48:41 -0800 (PST)
Subject: Re: [PATCH v2] target/i386: seg_helper: Correct segement selector
 nullification in the RET/IRET helper
To: Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <1605261378-77971-1-git-send-email-bmeng.cn@gmail.com>
 <4e7e41c4-ce96-05c7-f2cf-27f926639d49@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8a814c60-7863-6f63-0f69-a909eb371d7d@redhat.com>
Date: Mon, 16 Nov 2020 13:48:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <4e7e41c4-ce96-05c7-f2cf-27f926639d49@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/13/20 11:18 AM, Paolo Bonzini wrote:
> On 13/11/20 10:56, Bin Meng wrote:
...
> 
> Queued, thanks.  It would be nicer if the commit message explained how
> the guest can notice the difference.

Typo "segement" -> "segment" in subject.

> 
> Paolo
> 
> 



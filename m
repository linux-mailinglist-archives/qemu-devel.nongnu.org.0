Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC38325E2A9
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 22:20:44 +0200 (CEST)
Received: from localhost ([::1]:57110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kEICR-0005lE-Bs
	for lists+qemu-devel@lfdr.de; Fri, 04 Sep 2020 16:20:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kEIBc-0005Hx-7a
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 16:19:52 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:32037
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kEIBa-0000st-5e
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 16:19:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599250788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h2yDX6JY8kJNEVi1nWZOy3rE8pcoXTBlWkwr7ZV5M5k=;
 b=NQwYZXaSqEEl1maIqMs0U5Ew2ubSV6lmTFjV7iW0hnxPpGNK4Kv4ZqZttdCvrlTWjDC/dK
 mLq9pKXcLAAQFqKcIojHp4tkM5Tf3j+6dcbn59bYzXvYpFoN44kRfHeQxzm+ckF0N4a0yV
 /PhTDugpZOqmdB0h37L6FJ0i7VxebW8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-_OKwEbygPwa_HuNKuglyNg-1; Fri, 04 Sep 2020 16:19:46 -0400
X-MC-Unique: _OKwEbygPwa_HuNKuglyNg-1
Received: by mail-ed1-f69.google.com with SMTP id n4so3127036edo.20
 for <qemu-devel@nongnu.org>; Fri, 04 Sep 2020 13:19:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h2yDX6JY8kJNEVi1nWZOy3rE8pcoXTBlWkwr7ZV5M5k=;
 b=cKs3S/vIhAkqr0HLesRLkQmVKTD2e8TQOZK/Aiq5f0wsFXkbPLzrsLoE+ChjGsgL42
 zKwJasdtiitkN2B6v9ZXw5sBQbVxkgFdQOE/SDfrdwqxtMBh6JDzlA1CZVYC4c0CxmZk
 w22rcL2+H5Ao8BCaIBSddtdYQlP4MgxUXW7fAXBTPxZ7UBrq97CQiftMEqhqviFzFlB7
 Zwms0JH7Jix6bZEL5rhcegMs9hO1nS29CT1zV76hze0U/Gu6AYw5VW7dkCvmSx7Q1gJ8
 UinOxYhuySFtNYVP5kCdkPkh5Kay6vwyhfNQHNh2Xxc+WZ2aZycKdn653FXjV6TNrLak
 4XUQ==
X-Gm-Message-State: AOAM5327btM97+40tOjT5dyami03vZ/W8qLdoUdhwFarAHcrKI+bu4Au
 ZW/pJRUnIKzjeW3p1EIG9BI7nOXSUwYHlLW4OVKn0Is6hDX4u5VWgtIwqu0NBKGdP6//GwOWaJx
 NFgBi//jd9FDNk68=
X-Received: by 2002:a50:e807:: with SMTP id e7mr5374750edn.84.1599250785099;
 Fri, 04 Sep 2020 13:19:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCa6sEG0MtBVhntIFtRb938KBoLq6nLf6h0IBVKTHsLTZ49xKNZ9Uyd82l3iXwBW+SqBM9AA==
X-Received: by 2002:a50:e807:: with SMTP id e7mr5374721edn.84.1599250784896;
 Fri, 04 Sep 2020 13:19:44 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:6276:52ed:96d5:c094?
 ([2001:b07:6468:f312:6276:52ed:96d5:c094])
 by smtp.gmail.com with ESMTPSA id lz22sm6687702ejb.98.2020.09.04.13.19.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Sep 2020 13:19:44 -0700 (PDT)
Subject: Re: [PATCH v2 0/7] CTU CAN FD core support - patchew problem
To: Pavel Pisa <pisa@cmp.felk.cvut.cz>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <cover.1599168753.git.pisa@cmp.felk.cvut.cz>
 <202009041931.05173.pisa@cmp.felk.cvut.cz>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d5216d49-8226-ab88-4877-3b6face291cb@redhat.com>
Date: Fri, 4 Sep 2020 22:19:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <202009041931.05173.pisa@cmp.felk.cvut.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/04 03:57:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.107, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Marek Vasut <marex@denx.de>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 Jiri Novak <jnovak@fel.cvut.cz>, Stefan Hajnoczi <stefanha@gmail.com>,
 Deniz Eren <deniz.eren@icloud.com>, Markus Armbruster <armbru@redhat.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Konrad Frederic <frederic.konrad@adacore.com>,
 Jan Kiszka <jan.kiszka@siemens.com>, Jan Charvat <charvj10@fel.cvut.cz>,
 Oliver Hartkopp <socketcan@hartkopp.net>, Ondrej Ille <ondrej.ille@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/09/20 19:31, Pavel Pisa wrote:
> Hello everybody,
> 
> On Thursday 03 of September 2020 23:37:17 pisa@cmp.felk.cvut.cz wrote:
>> From: Pavel Pisa <pisa@cmp.felk.cvut.cz>
>>
>> CTU CAN FD is an open source soft core written in VHDL.
>> It originated in 2015 as Ondrej Ille's project at the
>> Department of Measurement of FEE at CTU.
> It seems that there has been problem with QEMU CI
> run by patchew
> 
>    No space left on device
> 
> It seems it is resolved for later patches

Yes there seems to be a bug where timeouts fail to stop the
container---eventually they pile up and occupy all disk space.  I should
really just add a cron job until I figure it out.

Paolo



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D842482E7
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 12:27:04 +0200 (CEST)
Received: from localhost ([::1]:37428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7ypb-0002FN-Ig
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 06:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k7yo6-0000ug-30
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 06:25:30 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:44832
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k7yo4-0000rm-0D
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 06:25:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597746327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J5XHfSeKd7kFAizhLAE+mlOGd0I9dnGWeL8B27AG2qM=;
 b=XYbnB8ohwpx+RTPfHYC3Xdwinp3TjAXW1Bkmhf95O8u19ixMn+6nvsdP7fpb45h/Xbm2hA
 AeAcVdFSzSChMuuvkDcPv7S4kCX1dlCwd8SmSwJXzt3Jt6GFXALMXznWJ0id6aZ6p+nC6V
 VH6s0hrG8qdcd5wds249BydjRKHHkaM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-yQnH8d73Ptie6v3JKi9C3A-1; Tue, 18 Aug 2020 06:25:25 -0400
X-MC-Unique: yQnH8d73Ptie6v3JKi9C3A-1
Received: by mail-wm1-f69.google.com with SMTP id q15so7225701wmj.6
 for <qemu-devel@nongnu.org>; Tue, 18 Aug 2020 03:25:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J5XHfSeKd7kFAizhLAE+mlOGd0I9dnGWeL8B27AG2qM=;
 b=gJma1TFjYa8I2xcnRpQa3A6GVJu5lxk13OvnM7TgnP4TFtanPOsdbADikxkkjyMFsn
 TJSLUH6Bp4aaovZw7zUo2s1w7EFd+1Iip4GtZVyLGynmracOUvVbGkmTeVeV326c+Ywz
 WFE0DOBZ105Vf0mm+GbgdI0AfeKqLbMa9wl4w6Oa1vm9N0bNmZfkBWYbPvzT3H+AgwFa
 aNEHkRb6MJqsPCFit0mV0TgAcVOXp5yAQIB5YfUktAVakkfOLAjgOGjrlFYgR8cpvyJX
 Q6Ghu0xErEBO8DtunjbYZLT/gtG6BnLjbP/Z9J1yey4ru8QOhoJzzNqkQFr96xSNePwN
 2NZQ==
X-Gm-Message-State: AOAM531I16ZVX3OIoUShVxLGdl1eCX7npLgmWmLQ5rjCN821WQDiS635
 OUo/TxPUEFvtekbkbg+CzxqX5Jm2LgrYgJPAgAAmOtIztApZrRKEwhgmS4+cxHiXJN8lgEF69gE
 7OQGD9gYZsM02zDM=
X-Received: by 2002:a7b:c38d:: with SMTP id s13mr19161240wmj.153.1597746324129; 
 Tue, 18 Aug 2020 03:25:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7bUzOO5StLhBUwleK56Y8dQyoS3ygW5pUb9UZJllh60f1zjFHY/tAIi42qAUVG0hfdgsNwQ==
X-Received: by 2002:a7b:c38d:: with SMTP id s13mr19161222wmj.153.1597746323895; 
 Tue, 18 Aug 2020 03:25:23 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:a0d1:fc42:c610:f977?
 ([2001:b07:6468:f312:a0d1:fc42:c610:f977])
 by smtp.gmail.com with ESMTPSA id q19sm35359466wrf.48.2020.08.18.03.25.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2020 03:25:23 -0700 (PDT)
Subject: Re: [PATCH v3 000/150] Meson integration for 5.2
To: Cornelia Huck <cohuck@redhat.com>
References: <20200817143723.343284-1-pbonzini@redhat.com>
 <20200818115907.74f353e0.cohuck@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <79afeb13-85cc-32f2-7e56-7a98a58bed8f@redhat.com>
Date: Tue, 18 Aug 2020 12:25:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200818115907.74f353e0.cohuck@redhat.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 02:16:14
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/08/20 11:59, Cornelia Huck wrote:
> On Mon, 17 Aug 2020 16:34:53 +0200
> Paolo Bonzini <pbonzini@redhat.com> wrote:
> 
>> - Simplified/rewrote handling of the modules variable [Howard]
>> - Fixed access to gdb-xml files [Howard]
>> - Fixed cross-compilation failure due to mingw prefix [Howard]
>> - Fixed SDL2 detection on cross compiles [Howard]
>> - Fixed sub-makefiles that include config-host.mak
>>
>> You can find it at the usual place, https://gitlab.com/bonzini/qemu.git
>> branch meson-poc-next.
> 
> Builds (on x86 & s390x), runs (this time with the right binary ;), and
> passes make check, make check-tcg, and kvm unit tests (s390x) for me.
> 

Great, I'll do the last tests here and send a pull request.

Paolo



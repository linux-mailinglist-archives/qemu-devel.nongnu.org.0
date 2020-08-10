Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3369B241125
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Aug 2020 21:51:09 +0200 (CEST)
Received: from localhost ([::1]:57138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5Dp5-0000Bo-S5
	for lists+qemu-devel@lfdr.de; Mon, 10 Aug 2020 15:51:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k5Dnw-0007WS-P7
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 15:49:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k5Dnu-0004fO-TI
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 15:49:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597088993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IQeleJRoD9V0GWn68LG4tE0qSm3PsHuZMohv7KFMM2M=;
 b=OHb9zqpnbBhFney6aBQ8jKPNRwcmX5s7C8eDnebY6RrFbtbLKW9akoT+VjAfT5Trk7eJN9
 RXHzsEC3JhyyNr6c/L6FT5NrDbRQX4SQl1eIPWJW4UnMOtfbtcAc1x6nUQVW0/pvZlwJc7
 AtXa5fZtadJg2mkwnk61C7NrWDBHyno=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-qBzLsy1sO4SXCoxbYqFzNA-1; Mon, 10 Aug 2020 15:49:51 -0400
X-MC-Unique: qBzLsy1sO4SXCoxbYqFzNA-1
Received: by mail-wr1-f70.google.com with SMTP id z7so4616110wrw.21
 for <qemu-devel@nongnu.org>; Mon, 10 Aug 2020 12:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IQeleJRoD9V0GWn68LG4tE0qSm3PsHuZMohv7KFMM2M=;
 b=PskNuS6yj+4+b5RPk/2XnueZ3hXiZ75P/rs6kj7UGXetVYKUGmbLy952BKgjVr1Lsd
 emwxj7fO075baWlUkY+M9Q05QYLroA8wIHtv4/TlCAFm3PZkalmUjNLWQwocC6VoZ5QT
 coMir1+9Y0DR9W1Bw7VeimQ2h2iMps4s6awUaAtpHaaO1k19owC/Ku5ROfFSaKWWACxM
 ooomiZQ+8470ejkMB80GRKVNCQiEWODzs7KV9Zwhufiuqr1r5HPNjMyzeDNY+g9il8HI
 LyHli0dmdgXIoj33InJ7fHDaJcgQOPOvEcFjiN/oKCqyz/grcBBXrLZv3scvFs2Wg9xe
 rLhw==
X-Gm-Message-State: AOAM532nGtVntU8RWa4cQLuo2/EmxVThwK+oFACbddgMULSRH9U/RGpl
 gPhBrAP9ShmacqrrYiwOXIuVtnKGLEYNZHl4vma+2e5NC1M47AEJ2DhoiapbRc+HIdDZ0nhJl7m
 ggGQJI8yakLIeA7Q=
X-Received: by 2002:a5d:6702:: with SMTP id o2mr25597043wru.364.1597088990563; 
 Mon, 10 Aug 2020 12:49:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIQ6Z6ETtJ6t/T65BBbV66EKUaHTCCZg8xpUGFlnXLINJtphVxZ89cAsp483viGD7/lZvcdA==
X-Received: by 2002:a5d:6702:: with SMTP id o2mr25597025wru.364.1597088990297; 
 Mon, 10 Aug 2020 12:49:50 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5d6c:f50:4462:5103?
 ([2001:b07:6468:f312:5d6c:f50:4462:5103])
 by smtp.gmail.com with ESMTPSA id z6sm23431833wrs.36.2020.08.10.12.49.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Aug 2020 12:49:49 -0700 (PDT)
Subject: Re: [PATCH 000/147] Meson integration for 5.2
To: Peter Maydell <peter.maydell@linaro.org>
References: <1597079345-42801-1-git-send-email-pbonzini@redhat.com>
 <CAFEAcA_icj94N6eotg9W7FutXTY_6U-Ak6pJMyYH0n9eggunrg@mail.gmail.com>
 <CAFEAcA8smstwpQUD9UJzMuE6Cq2WutQzBPrKLLs=3wvfXUmpUg@mail.gmail.com>
 <b710345e-1644-782a-44a9-537493b85d95@redhat.com>
 <CAFEAcA9v7jv=SYZ0NLeSkjoM3da-apeu4OC5BMmorxMue0-viQ@mail.gmail.com>
 <6a82c3b5-037f-7cd7-68fd-0fffd8eff192@redhat.com>
 <CAFEAcA8xB=vOLvj_w9iTWWKh6kwu7fWN8QUbVAYunRdnJG0Qmg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4bbf807f-6ff0-66b5-ac13-65f2bc954d9c@redhat.com>
Date: Mon, 10 Aug 2020 21:49:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8xB=vOLvj_w9iTWWKh6kwu7fWN8QUbVAYunRdnJG0Qmg@mail.gmail.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/10 13:09:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/08/20 21:45, Peter Maydell wrote:
>> Note that if you don't install it, you just get the previous behavior
>> (plus a warning).  But if you want that, it would be simply "gettext" I
>> guess.  You're using tests/vm/*bsd right?
> Yes. Unless there's a strong reason for testing the no-gettext
> configuration via the BSD VMs it seems like we might as well
> just install the dependency. Silencing the warning would be
> nice as well if the lack of it isn't actually problematic.
> 

No, I think the warning is valid.  Silencing it would be predicated on
--disable-gettext or something like that.  I'll just add the dependency.

Paolo



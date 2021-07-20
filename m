Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E093CF939
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 13:54:51 +0200 (CEST)
Received: from localhost ([::1]:55068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5oKo-00075E-Jb
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 07:54:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5oBA-0003pz-QW
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 07:44:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5oB8-0001sH-Mq
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 07:44:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626781488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y1D4tzMfPLFBjYm6oD33udxi5OrdjG2/KXJy0Pwa+uc=;
 b=EB109zkU9dHh9hqqJG4pTKO3IwZ1KjoFmE9AwAKtc4ts+N2lPdoC1BHmcZfkb+4v6JqDy5
 yXItNHuWN2NGiVkzFJxkAdJoRLIF3Xa2TV3r4jJ/cUNrBC9Xv/xkxIYULgbIXhP1P14Yza
 yOsJcMoFm66nFm7LykdK2dlLQRF1ukY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-Pemk5EVsOGqgS-6UtrU3UQ-1; Tue, 20 Jul 2021 07:44:47 -0400
X-MC-Unique: Pemk5EVsOGqgS-6UtrU3UQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 k3-20020a5d52430000b0290138092aea94so10221552wrc.20
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 04:44:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y1D4tzMfPLFBjYm6oD33udxi5OrdjG2/KXJy0Pwa+uc=;
 b=CQJ77cpDkR7tOmkUL7B8E4qWeH9OSd9bHrrnt4WdGZwYfNu89xdwF+JhdcqE3mfzFV
 XFceb13rl+oXTijDzYTH76NDKUeTbpsLMb8navNAIx8HABZFGteScnLSjKSiZzht2s3M
 rurGuqwepFGilALqYDh7FNE6dVvJ/HmslimCTqfFrIrVi5KXVfVjs0ktFcbwC2W4ejEr
 U40MrIYwniqs2hS0aOKjd0pEoT8qQgldyQE6I+6MLWV0za51xAh34clzykTiAWlbAuXj
 OvfKLATTFxGy51lGtG4wUbgdEWcEe7sRXiyA9EZ8JodJbidZ7cqQPmoUcu5NGbsKz0mF
 HOcw==
X-Gm-Message-State: AOAM531OOEs6kbCvweO26baFu9R3TZMakkMAvbL72k1zl6ochk55lC5b
 KXCHpcVCBm/I8Q6aHA5Vc362jtqYBODSfYodA5wwvqjvdINKgoN9chKY0TcAIXnPvdX8z57EHIj
 wjBwyS+yG012kr50=
X-Received: by 2002:adf:da43:: with SMTP id r3mr30787114wrl.307.1626781486632; 
 Tue, 20 Jul 2021 04:44:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEc2gxVoUBY9WcMOjGe0zIzOoNjr6vdFJdQn5Pj1+//Wa7TXWX/yaLxu8pIuthwRQ/r/MU6Q==
X-Received: by 2002:adf:da43:: with SMTP id r3mr30787105wrl.307.1626781486540; 
 Tue, 20 Jul 2021 04:44:46 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id 129sm19871702wmz.26.2021.07.20.04.44.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 04:44:46 -0700 (PDT)
Subject: Re: [PATCH] tests/qtest/migration-test.c: use 127.0.0.1 instead of 0
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, thuth@redhat.com, peterx@redhat.com,
 berrange@redhat.com, quintela@redhat.com
References: <20210719185217.122105-1-dgilbert@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <582882b2-71ba-4c2c-e4f8-647f2ac13b89@redhat.com>
Date: Tue, 20 Jul 2021 13:44:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210719185217.122105-1-dgilbert@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/19/21 8:52 PM, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> OpenBSD doesn't like :0 as an address, switch to using 127.0.0.1
> in baddest; it's really testing the :0 port number that isn't allowed
> on anything.
> 
> (The test doesn't currently run anyway because of the userfault
> problem that Peter noticed, but this gets us closer to being able to
> reenable it)
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  tests/qtest/migration-test.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daude <philmd@redhat.com>



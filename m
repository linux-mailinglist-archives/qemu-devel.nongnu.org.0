Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3E62FD2FE
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 15:50:49 +0100 (CET)
Received: from localhost ([::1]:38210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Eoq-0003Zg-6V
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 09:50:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2EmG-0001sU-8U
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 09:48:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2EmD-0005pa-O4
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 09:48:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611154083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fLvT6s3nRAez/dLh+9gaREIeg8gvgofc/TzATYiTilY=;
 b=Qft1IykV5BsQmJUoiwU2wJXSG4ZVL/0YWFjfeIHZab3osWIhQBUz/Y2c4bBENbGF2W3TMr
 5mufuRGoZB+HtMg0Nb4JSO1QbMzfVLEPfsKhak4lS9FY7y9IzaV/+1e0I3M8ZV/9L39RhS
 XfcmIoFAtVcAZlmFDQLABGrinZ+5Qe8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-UkId8XwEOIm_OSSXUgpZjA-1; Wed, 20 Jan 2021 09:48:02 -0500
X-MC-Unique: UkId8XwEOIm_OSSXUgpZjA-1
Received: by mail-ed1-f71.google.com with SMTP id l33so11151361ede.1
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 06:48:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fLvT6s3nRAez/dLh+9gaREIeg8gvgofc/TzATYiTilY=;
 b=Dcw7y8IPpfRxBOY2AnPve+55xBlvdBfYf+d3M7BSyBexrDocr594uUkZhXjGPs2Cgh
 Tkvkk7iq3/beLo27D+JRDQ0AmFwTGMgqMyCHtE0yk6Ec+kC5tOsgOLSLVr9o+B0nc1jt
 1Hw8xorTMFfgvxOjCKj2RfaFoeT7rxIE08LF0TEuCaGriqW29238W3nN1srvaCDKHsu3
 faCRItLcTBUTcfOP5p4CcWYvom/2Mb6/g+AxClYERSZTvLVjfoN2n+ItHwA1KbNFSITe
 HWtvtNWa4q2pBnEmwwknD30+62QZbTDsZZBQFkaBBj5b6A21oOGO6Jh4bUoXqK/tRWen
 c5yg==
X-Gm-Message-State: AOAM532fvs/LRrUnW1Byowo+h14vVDOxK4qsN/yvQkSzuZMDo8Vt6HiF
 DS4erbKZuF73N8N8kTc1Zz4deLEfFW/8VMSMewfrWusdCqTWnHQhwEVh8xL4XbObUQr0minEnfX
 YMSwFejpMGEuJbgXnOIq2CZ8CLKfBaf3csaOBxIZSzlaBoA/9Z4sphLCpvfCFt4EHLIE=
X-Received: by 2002:a50:b765:: with SMTP id g92mr7576971ede.317.1611154080802; 
 Wed, 20 Jan 2021 06:48:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdWblMfdkvtC7I7Gzy+W9opgmBKggSuWljfhzLD2b4+APY0BmrRxWL5Zc+y82AQ+7syOmnrg==
X-Received: by 2002:a50:b765:: with SMTP id g92mr7576957ede.317.1611154080623; 
 Wed, 20 Jan 2021 06:48:00 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id v9sm971023ejd.92.2021.01.20.06.47.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 06:47:59 -0800 (PST)
Subject: Re: [PULL 16/45] vl: Add option to avoid stopping VM upon guest panic
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
References: <20201215175445.1272776-1-pbonzini@redhat.com>
 <20201215175445.1272776-17-pbonzini@redhat.com>
 <CAFEAcA93tYRjdjQJm8GKNS2=4iV5QU4X_JJevWEBc7wggX6Cwg@mail.gmail.com>
 <3f399e69-f941-d928-acee-f3d16182df5d@oracle.com>
 <20210120135459.GJ3015589@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e3608cbe-b13b-446c-68b9-1cf89a236b08@redhat.com>
Date: Wed, 20 Jan 2021 15:47:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210120135459.GJ3015589@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Mihai Carabas <mihai.carabas@oracle.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/01/21 14:54, Daniel P. Berrangé wrote:
> Why would pause be immediately followed by poweroff ? These are independant
> actions, and the mgmt app should be deciding what todo next after the
> pause action. It may wish to capture a guest crash image before poweroff.

That's exactly why -action was introduced (and before that, why 
-no-shutdown affected the behavior of panicking too).

Guest panic will exit QEMU by default, but you can use "-action 
panic=pause" or "-no-shutdown" to change the default.

Paolo



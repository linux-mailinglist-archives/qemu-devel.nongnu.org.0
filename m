Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A9C30FBB9
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 19:42:34 +0100 (CET)
Received: from localhost ([::1]:54450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7jaL-0006FC-EI
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 13:42:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l7ibb-0004Dv-JH
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:39:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l7iba-0005yy-03
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:39:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612460385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=irHaApcUGr7AS2Jk6i4+P4gGpHQSRSqF4rROqoyC5cY=;
 b=Cnb2GG2KMw9iXk5Z4o25zYCWqFW+qxF1IzxqkapJpPCICofYbos7gQTy/WB54+I7Djlxeb
 z/kLuUxuLKmODV9W4GiqdOy5tJxGUdVzSPsZk22ysxDtsvgVUohdYKbl5iCPC8wmUQO/of
 tN9aUxnYaFtroClLZGSCrjVVEw9Nud4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-VI26o5HpM0OJ5zoaKoNSQg-1; Thu, 04 Feb 2021 12:39:43 -0500
X-MC-Unique: VI26o5HpM0OJ5zoaKoNSQg-1
Received: by mail-wm1-f69.google.com with SMTP id n17so1999808wmk.3
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 09:39:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=irHaApcUGr7AS2Jk6i4+P4gGpHQSRSqF4rROqoyC5cY=;
 b=mBbt2uoyXDJMk2WQ7AnnABXC2TIkQBASSS4DbPsLYQro646tWz7xh+IYvgQD7eiQr7
 ZwCyn0PGqXE8hSsAHlzfDdl/ehjwWFjFfkTWtn4H3Jaj8IRvSF9RDlqaY47w48aO2NFS
 72Exy3zy05ucwk8iJ2+5illpwYvUjYrO6eg0DVNlPW9Y0CCEFTy9NNqA87joy+hH0pWG
 T7I8Pc1dsIDE2OFwipoAjzru/fLMjhAz6Kf10A35t999v/4iKO71Mn7uaJLe+ssVxd8M
 3aTEeccu3ODh6ouXPbBhUgSmeykP/1GnhMMmXP1N+ZUHseGB+uWAczspm96PMhdaJXRl
 gCig==
X-Gm-Message-State: AOAM530A7sQ9QfJ/OOJOn6XYGljdJCFyUYX2aEQIJcECBueTJEQOATul
 ++JE2cEpZuN9aGqQans91ly9iAJAICEZa0ImMsexSdkixPgZ1mJ8vs7yIhC8YvDlClKmv0p+fBL
 hUBpbLia8WmXd1IQ=
X-Received: by 2002:a05:6000:2:: with SMTP id h2mr474382wrx.91.1612460382400; 
 Thu, 04 Feb 2021 09:39:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwunYt9i05kAliUpvv9Drx3MY+x52ksPVm4nNSS3EnjjXo8DU82rC1zR8APZch+9kJyGRfpdw==
X-Received: by 2002:a05:6000:2:: with SMTP id h2mr474363wrx.91.1612460382266; 
 Thu, 04 Feb 2021 09:39:42 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h207sm7123089wme.18.2021.02.04.09.39.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 09:39:41 -0800 (PST)
Subject: Re: [RFC] Move tools sources to the tools directory (was Re: [PATCH
 v2] MAINTAINERS: Fix the location of tools manuals)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210204135425.1380280-1-wainersm@redhat.com>
 <516694bd-42fe-7929-811b-545f257c58bf@redhat.com>
 <0e0f9745-fe21-0bc6-2d02-431d67a6b57e@redhat.com>
 <CAFEAcA9nwnii1geGFpwEg8CFfST8B21y0BRL5ci=4ykiwqJywQ@mail.gmail.com>
 <20210204144006.GI6496@merkur.fritz.box> <20210204144700.GN549438@redhat.com>
 <CAFEAcA_=ANGKcy7QNfEdxUft9qGyCHttHo9hfvjQHC_ZfYeo1g@mail.gmail.com>
 <6339c78f-e77c-85e7-8e3f-6c2c514f3206@redhat.com>
 <20210204150601.GQ549438@redhat.com>
 <8de7541f-60ce-0b7f-f11c-557d127698aa@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ac140b18-148b-ff74-f9de-28e61c1ac491@redhat.com>
Date: Thu, 4 Feb 2021 18:39:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <8de7541f-60ce-0b7f-f11c-557d127698aa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Greg Kurz <groug@kaod.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/02/21 18:37, Philippe Mathieu-Daudé wrote:
>> - elf2dmp and rdmacm-mux should be in tools/, probably it's in contrib/
>> because nobody uses it and there's no tests so it might bitrot.
>
> Why keep something nobody uses?

Well, not really nobody but no maintainer.

Paolo



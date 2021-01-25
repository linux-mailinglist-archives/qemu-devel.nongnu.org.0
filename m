Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A5A3025FA
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 15:02:53 +0100 (CET)
Received: from localhost ([::1]:43058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l42SC-00047H-K1
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 09:02:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l42QY-00036e-Lk
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 09:01:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l42QV-0006yk-TM
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 09:01:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611583266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WXYwEPIlAlVfKk1YS52IzIWNQLA+ElBBkxGztJ/n2J4=;
 b=Tk27twG7teaVABIDvS3RSZayKmA82hLl6d90yzB6t9oOzjYMOSg6JmI9S2jQr/cjmIeGul
 VrwIxxvr4PXbcaUc96k98EzpBQh9XeAcy4OPvtbOfsWjT3tBcxBrHMNgB4WVurux/d5eLg
 t9NRXiHNvOel8vyk/8MC3S54zVzigbs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-BQGViNZsPjyuu5uT3EfOGQ-1; Mon, 25 Jan 2021 09:01:04 -0500
X-MC-Unique: BQGViNZsPjyuu5uT3EfOGQ-1
Received: by mail-ed1-f72.google.com with SMTP id e25so7415005edq.6
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 06:01:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WXYwEPIlAlVfKk1YS52IzIWNQLA+ElBBkxGztJ/n2J4=;
 b=dYfIBVx3XW1EPhct8GM/UVVrZYKe6QsrWAzuNmMDEDLcYQmPnYvPF2QuRWeltdZxmT
 56W7nXOw/pJr7C7RAIoMYA5K7KR89sXriUZuXGsZOz0LkXqyPMEQQEFp3NLOmJEE23ih
 0aIIrHNO8eq2IelcUqCVzYxewWHz/aQTxoS+0NQ4bavReWhqO17WlUgF5S4w/IOW116g
 HOZT4vjm1HhGXwogRe635Amy3k7nPnKcT8VacB7slO/HdSjhJqvqDX83N5pVpLjLaWSA
 VbadKQ5N+myh2Fu7isg/pFMg7u2PAyaNqzUA4pi0Etxnd27fQZ8mXw/sD/rtpXWudq8U
 pJIQ==
X-Gm-Message-State: AOAM533OJZfx0PPt8Dx5WGwp1uKf/l0jALjIuqayjNjXIsleUSpsUrIn
 OpY843/Uc0kDWE9+tFdpo24pG/0RXVDLEd/ZElKPRAut82Ip5QaOzxUsVX1E4QDVvRKpScV7DAw
 3OBDzkmlMRVQLlY0=
X-Received: by 2002:a17:906:40ca:: with SMTP id
 a10mr457828ejk.295.1611583263023; 
 Mon, 25 Jan 2021 06:01:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGrg+cJt4Hw7xcLGNPP8NrZIQ5i+rbpAMTrwZ/FdGECO5lTYYCfNv7vGN8BzepgmNgYbD8pg==
X-Received: by 2002:a17:906:40ca:: with SMTP id
 a10mr457820ejk.295.1611583262887; 
 Mon, 25 Jan 2021 06:01:02 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h15sm8391781ejj.43.2021.01.25.06.01.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 06:01:02 -0800 (PST)
Subject: Re: [PATCH 11/25] remove -writeconfig
To: Markus Armbruster <armbru@redhat.com>
References: <20210118163113.780171-1-pbonzini@redhat.com>
 <20210118163113.780171-12-pbonzini@redhat.com>
 <87y2ghfa8u.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <70b3a8fd-8f54-8eeb-3f9d-be731d9367ac@redhat.com>
Date: Mon, 25 Jan 2021 15:01:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87y2ghfa8u.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/01/21 13:53, Markus Armbruster wrote:
> I love the "and how give me a config file for all that" idea, but I
> agree our -writeconfig is flawed.  I hope we can bring it back in more
> useful shape.
> 
> No deprecation grace period?
> 

That's a decision that we have to take overall once the whole series is 
reviewed, I think.  I have no problem having a grace period:

- the patches aren't 101% ready

- the real conflict magnets have been merged already

- I have a large KVM backlog so I don't mind leaving this aside for a 
few months

Paolo



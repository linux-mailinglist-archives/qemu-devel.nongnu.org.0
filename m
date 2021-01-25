Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AFB302F56
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 23:46:39 +0100 (CET)
Received: from localhost ([::1]:46490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Ad3-0004nk-Rc
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 17:46:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l4Abf-0004FT-8x
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 17:45:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l4Abc-0003p4-HE
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 17:45:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611614706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EnWSCl4P+R0GH1IqIsKC8WfJRH/Z/TvWHD97WncXawU=;
 b=Ze8mCDCPCe5bSQxakDFXypSGgli9Xg6RoIf6cF+ZaU7dWURxPj7JM9q+1Fuqg9rQTM3AZ6
 aqFLkfuchu/YlXq5JfQb+Xl1DYRLUAN3vze6zoVsYfkOLO8vz+A6UrY+z172nsfE7Nfvh0
 ScIZhue9oEIwwPX40grxVMyzu/hVth0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-9xEkmhx1NRuvLJHtBGJxjw-1; Mon, 25 Jan 2021 17:45:04 -0500
X-MC-Unique: 9xEkmhx1NRuvLJHtBGJxjw-1
Received: by mail-ed1-f70.google.com with SMTP id x13so8364556edi.7
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 14:45:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EnWSCl4P+R0GH1IqIsKC8WfJRH/Z/TvWHD97WncXawU=;
 b=dfwwQEZZrV5EDAWgRHPTncIclmK840JVnponP3JATNK2tr3uqHd8nFewGRbPeDudTC
 P+WgdUx9h2rlu+x7Kv5fIJW1z3cDVobxFE+uPJzA/oT2UClSHpbefPhjfSLhXwIHWqmN
 4OEQiKrcjRsEsBEU5C/UxwSTq6KBjpJ1Q1dIeuvmmMVqUTF8ASbTHMpMywZPieU+VW2Y
 yyd/unPDtmlY7HQucAKSybmknFLQpxq9uwX6+aGouQfWjxr8qiiXTWDwUyswRFXuifOp
 UtBgruV1uxxGBrbIRjLDFqWbJ6mSJQJYlxGftLUITWDI207JsMbnxIHl2Ilv2iBzUQY9
 r8UQ==
X-Gm-Message-State: AOAM532qUGit49iwnpP4SqjTVplvYCRpgk6ijvOnNsZT4k9bErGGP0/b
 zQWtBHjgmOuckahSovOF0d8RQW7NSOwqDoaTHSjlWhIzIBZzI3O9VXkwZr9mfcw1JDB56T0ahLM
 vMLZfo54pE8WLn7s=
X-Received: by 2002:a05:6402:22db:: with SMTP id
 dm27mr2337528edb.379.1611614703646; 
 Mon, 25 Jan 2021 14:45:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJytiXAZcVH79tZQFh3upu32mFBCXtPK1UKC1qvnarcWMmsc6xKnBtkRzSTnrR+rA9/2EzhsFQ==
X-Received: by 2002:a05:6402:22db:: with SMTP id
 dm27mr2337519edb.379.1611614703498; 
 Mon, 25 Jan 2021 14:45:03 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id q2sm11127786edv.93.2021.01.25.14.45.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 14:45:02 -0800 (PST)
Subject: Re: Thread safety of coroutine-sigaltstack
To: Laszlo Ersek <lersek@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <7b8155ad-0942-dc1c-f43c-bb5eb518a278@redhat.com>
 <445268c9-d91f-af5a-3d7e-f4c6f014ca52@redhat.com>
 <fc35da77-a5c2-08dd-05f2-0ebe781b338c@redhat.com>
 <CAFEAcA8GWMh=Cbrnw4+mzbG7gkHLkeQKXCTGxev6iYu8Q8TkxQ@mail.gmail.com>
 <bd4c2b77-11f5-88aa-ff9b-63f5782e99cd@redhat.com>
 <CAFEAcA_ZtJAQDiGRNeBzcmJ8mvrR-nDVGr=7ECHJmEogY-_T_Q@mail.gmail.com>
 <d797d8fd-5f50-89b2-d858-85573372ffb4@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <74c3929b-555c-0e17-feaa-a8e893d2f9ed@redhat.com>
Date: Mon, 25 Jan 2021 23:45:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <d797d8fd-5f50-89b2-d858-85573372ffb4@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/01/21 23:15, Laszlo Ersek wrote:
> 
> - How does this case differ from the registration of types? type_init()
> is a constructor function, and it generally ends up adding some
> structures with function pointers (I reckon) via type_table_add(). The
> main executable doesn't call into the device code directly -- only the
> constructor function calls another function from the same module. The
> main executable only goes through the registered type interfaces. How
> does the linker know in that case to preserve the whole object?

We use either link_whole or extract_objects() for libraries that have 
type-registering constructors.

Paolo



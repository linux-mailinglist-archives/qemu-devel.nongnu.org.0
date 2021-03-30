Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 860FA34E8E3
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 15:22:04 +0200 (CEST)
Received: from localhost ([::1]:54816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lREJn-0005Bp-Ja
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 09:22:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lREHr-0004B5-Mg
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 09:20:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lREHk-0000Kz-M9
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 09:20:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617110394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ep0cy/RwhubB/lWshHEH8YCwMUTPM19tnJXMBT/HgvY=;
 b=QTd62VMZtE6fx1OhLvQ0xTrzOYwM5Q4PCpcHQ/7R0z42aZVXYmF2qclLCjoN2xPdMQLfEi
 Kd9+ycfOR+SUhlVUeJIjhyHsrzlGEiJuLo9ytIJMiep/R6jWWhgyjGxoymE7lm+CAqdDKG
 2azZa6oiDHeGP7ufJIyFP/BeAda5g6w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-l8IVAXxaMnGOYQVGXB4ukg-1; Tue, 30 Mar 2021 09:19:52 -0400
X-MC-Unique: l8IVAXxaMnGOYQVGXB4ukg-1
Received: by mail-wm1-f70.google.com with SMTP id n2so687201wmi.2
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 06:19:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ep0cy/RwhubB/lWshHEH8YCwMUTPM19tnJXMBT/HgvY=;
 b=nBi9xQiJim8o7uQ5CRpZSkXRYmwVMsa3XA2suDp6JgDAJBT3/bm7mUzCE6ArXeWESI
 Jx7GIYBa2wb32GQayq/u43ECWxL6gkpQY/+ABZ6Ui1Y+92ZjSL7YoeEGs9IZ1z1Gwdmx
 RCyb7gRIIN7rhkmsa/plsXgD8u1q9/B6UIU6KrjQDXFEWqXcepctRCzDHEXcqk/uARpK
 gwrfjWxH0z/vc0A/mVk0/g8IiWXHWR4hbIoR1vkaN0ucf6v8YL7NzExK5RgDXXyYjwsE
 qv9vKqz5qUbzgIuQseA0ETWbUER0jOJve9lxYGfVwdbPIvcNypiHh2fExrr6IGQpp+c9
 Qo7A==
X-Gm-Message-State: AOAM533/+G1mpH4Z1BggqZ9R8G2yBKeHdwT8FCF3R0YUJzPQ6rYOS05e
 5Z3Qzs+rIR4Y6CHtZuUCPvI7vUqhlqoRsIi+osmfrmzXNT+LJKBGHwT9AWfdHY6pqJFNmY8qYN4
 r9wY1Rw90cDvo0KU=
X-Received: by 2002:a5d:6602:: with SMTP id n2mr34818752wru.262.1617110391856; 
 Tue, 30 Mar 2021 06:19:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzP7LYeZobrxrL25euxjRdYYK+Y3fsMJTByds7P2VRbtiJUr6+nIq9EMc1JfN+0R4fHQdvWZA==
X-Received: by 2002:a5d:6602:: with SMTP id n2mr34818727wru.262.1617110391646; 
 Tue, 30 Mar 2021 06:19:51 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i26sm3976677wmb.18.2021.03.30.06.19.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 06:19:50 -0700 (PDT)
Subject: Re: Serious doubts about Gitlab CI
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210319101848.ebdwkfttay73jajr@kamzik.brq.redhat.com>
 <cad173cb-7715-1286-eba2-75e9816e6177@redhat.com>
 <b351f107-a9fd-f7cf-1f27-2d435cea612a@amsat.org>
 <d05a40b2-ff80-d9c8-8dfe-5dfce2e57d3d@redhat.com>
 <YGHf3HjYTRJwktbf@stefanha-x1.localdomain> <YGMJSoIGa5VoVDB1@redhat.com>
 <04e5e251-7a09-dcf6-82ad-31bf696bc248@redhat.com>
 <902a93ca-bd71-504b-fcf5-fec2480f9ec0@redhat.com>
 <a5a40558-4f5a-223d-a7ea-c02f7fc14eef@amsat.org>
 <1bb868bb-d9d7-3a9a-cbd4-2e1780b46442@redhat.com>
 <YGMjypzf1hHk47bC@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <23fcbe91-1b9c-559d-1a61-6cce839bb390@redhat.com>
Date: Tue, 30 Mar 2021 15:19:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YGMjypzf1hHk47bC@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrew Jones <drjones@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/03/21 15:12, Daniel P. Berrangé wrote:
>> Now, but that may change already in 6.1 in order to add CFI support.
> We can bundle a newer version, but we don't need to require a newer
> version. Simply conditional compile for the bits we need. If distro
> slirp is too old, then sorry, you can't enable CFI + slirp at the
> same time. If the distro really wants that combination we don't have
> to own the solution - the distro should update their slirp.
> 
> Or to put it another way, QEMU doesn't need to go out of its way to
> enable new features on old distros. We merely need to not regress
> in the features we previously offered.  We bundled slirp as a submodule
> so that old distros didn't loose slirp entirely. We don't need to
> offer CFI on those distros.

This is true, on the other hand only having to support one API version 
has its benefits.  The complication in the build system is minimal once 
slirp is made into a subproject; therefore it is appealing to keep the 
QEMU code simple.

Paolo



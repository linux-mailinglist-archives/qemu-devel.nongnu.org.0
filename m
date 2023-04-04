Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4266D6928
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 18:47:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjjn7-0007PQ-IG; Tue, 04 Apr 2023 12:45:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pjjn3-0007OB-5t
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 12:45:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pjjmt-000421-5j
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 12:45:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680626737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ndWR11NkzxovhMIm8rGoNndSjqnjqdi8SZTT4ufuZvo=;
 b=i38CNPp0qrshb3cepaoVulLNtCYnyPfcZ5qC0nWd+Am70rYq0ScukGg3/Vc4Jj7F5QLuVK
 HvGOG36A6c4v/f8sa61tpCZ1nMNUjmpd4cQzx3vUjxU7ISf+GLDFFLDoVFz+y9/BpegSX3
 9LFgPGuiRNHM4J6sPxn5Gmpy1wAgepE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-5jmBe6DaOcuAsWnpkVGHbg-1; Tue, 04 Apr 2023 12:45:35 -0400
X-MC-Unique: 5jmBe6DaOcuAsWnpkVGHbg-1
Received: by mail-ed1-f69.google.com with SMTP id
 y35-20020a50bb26000000b005029d37a3ffso10503849ede.6
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 09:45:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680626734; x=1683218734;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ndWR11NkzxovhMIm8rGoNndSjqnjqdi8SZTT4ufuZvo=;
 b=zr6S8/ZrwZ/Ow0Oibjq8PZZB4nUzpUUPaNVjQlsiz7vy4q9krCERO7Kxd3rrQaMwbB
 8C7efSnxVAf0SBMRx1AQFGRAQ9N51EJeEHAOYYI+3WX1S0ey9QiY/SiyA7KfOcDpwRrr
 JVktAOx27FO3uwfht7yExuHHlAbPHKuYj9zm1OJvjzrSuTNL6pGl5epX1MLa/pou38IM
 xenF7wd+vzut3yN5sCwYTuI/6c9IsoNs9sI15GkJlh011Px3y/BB3fHpH2qB0UoWu0yU
 qQo4hHSEeVFDz/Jky90Wg6nIHnGa6SLeJE82xTK6RVlYhqFS3C2hITImWS7Dwse/iJNr
 mbRg==
X-Gm-Message-State: AAQBX9c0XwZ02fvgf5UIaLy8kPga1xgik5DNeiIMezlzw6jb2nRlr9oJ
 VAQnvUNsrNxCqHv+9TtAn/Y1Xx6EVQiON1ioHI0ykZZ7p5le6DBsGtXRrTEGvqbB+LTMVetoxZU
 yA92irj8KCNPzAEI=
X-Received: by 2002:a17:907:9607:b0:930:3916:df19 with SMTP id
 gb7-20020a170907960700b009303916df19mr329776ejc.5.1680626734798; 
 Tue, 04 Apr 2023 09:45:34 -0700 (PDT)
X-Google-Smtp-Source: AKy350YUpmerKoiFB91FncBoPq4dMjoVO1Vk1a3P5IQFPO1acGneVnhrEdoZxWLgSEyHoqPL+6xjSA==
X-Received: by 2002:a17:907:9607:b0:930:3916:df19 with SMTP id
 gb7-20020a170907960700b009303916df19mr329750ejc.5.1680626734549; 
 Tue, 04 Apr 2023 09:45:34 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 a8-20020a170906190800b0094771bfca1csm6135717eje.20.2023.04.04.09.45.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 09:45:34 -0700 (PDT)
Message-ID: <f492b77e-811d-e707-6d31-bfd06f6a7399@redhat.com>
Date: Tue, 4 Apr 2023 18:45:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 03/10] kvm: dirty-ring: Fix race with vcpu creation
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>
Cc: Hyman <huangy81@chinatelecom.cn>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eric Blake <eblake@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <cover.1676563222.git.huangy81@chinatelecom.cn>
 <1d14deb6684bcb7de1c9633c5bd21113988cc698.1676563222.git.huangy81@chinatelecom.cn>
 <3c9e06ce-3166-f7c4-cb56-6df123c145a2@redhat.com> <ZCwv87m1Gs5TjGVr@x1n>
 <CABgObfZtW2YSFS-g4grBWHiuaYM1z6zsAUKm332qFtLv+uFGWg@mail.gmail.com>
 <ZCxSHwgRglKNglCP@x1n>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <ZCxSHwgRglKNglCP@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.925, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/4/23 18:36, Peter Xu wrote:
> Oh.. I just noticed that both vcpu creation and destruction will require
> BQL, while right now dirty ring reaping also requires BQL (taken at all
> callers of kvm_dirty_ring_reap()).. so I assume even the current patch will
> be race-free already?

Oh, indeed!  Queued then, thanks.

Thanks,

Paolo



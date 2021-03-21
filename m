Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE273432C5
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Mar 2021 14:38:33 +0100 (CET)
Received: from localhost ([::1]:45038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNyHn-00006I-Kj
	for lists+qemu-devel@lfdr.de; Sun, 21 Mar 2021 09:38:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNyGb-00081e-6I
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 09:37:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNyGY-0001NS-Bs
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 09:37:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616333832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IF8x/kC6nPtihWyLpHWjes5Jek/gVOMY4PohNgH0KeA=;
 b=KfAeJASSey2bTn0ue2LZXKdrAeJ7XZkQ6wLHlhLoCq9cXa4Hh5dRkM0/otXN/g43QZ2LWs
 VgkmCxb/gJmXmWwtTg+A4NRWks+SfokG/gSF2Jp3OXva2gXAG3lHIcDxa680mHX7IwJjbF
 bPIQ4QSfG826ETtH0cj7BBcQJFii6XI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-_O4T5RrCO-G52-S2F-P-YA-1; Sun, 21 Mar 2021 09:37:11 -0400
X-MC-Unique: _O4T5RrCO-G52-S2F-P-YA-1
Received: by mail-ed1-f72.google.com with SMTP id a26so18890724edt.23
 for <qemu-devel@nongnu.org>; Sun, 21 Mar 2021 06:37:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IF8x/kC6nPtihWyLpHWjes5Jek/gVOMY4PohNgH0KeA=;
 b=CN93cNfP4mVZSKujujgwkaIBBwdFgVsODQ6yka2Qa2CV12tUTi4NZqUiw4NUmlI0Lq
 Gu/eCov2I03IyUvQg6lDZQ9xyXgT4v38poRtYIKnApvZ6jLQoqX0HZe5rq4lL9ZiJ1Ag
 us/nXVH+iInnW4g0f8FKUIgJif14bgNRGWbgbU0BdQ+tgVqrLwez69BNhMXDyB1Tq4R4
 Ige2A5lsy13ur4/8/VNwNuZTaLSRGVX4QzONwQVnUNBktMDQxheT/BAFPBBdhCQmNR2v
 pa0L703Mfibn+pp5cWeeHJEL0WR8Ztwoyp37pv7AJ48t+IdH9oZLgawqNbNuS3kyBOcx
 AhyQ==
X-Gm-Message-State: AOAM533sWxwwxyv9nt3p0oz/1uBD1L9yan5RNZUCTLsPhxiI5UCYkrN9
 ByuMgm+MYj/2aQ3QISwawqYXC7UOliw6co9yNR1geIsHihexT13X7xcHMPBKO9kq48+Jh/O5S37
 aJ60DBbfsdUgW1tI=
X-Received: by 2002:aa7:cd6a:: with SMTP id ca10mr20663855edb.7.1616333829936; 
 Sun, 21 Mar 2021 06:37:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQI5N+8UcJh29Nji8bpk2VBqLJhUsC3+X7uu7DqK166Y0fI0E+QWo02assD4fwDlPC6B+G7w==
X-Received: by 2002:aa7:cd6a:: with SMTP id ca10mr20663841edb.7.1616333829790; 
 Sun, 21 Mar 2021 06:37:09 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id oy8sm7077708ejb.58.2021.03.21.06.37.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Mar 2021 06:37:09 -0700 (PDT)
Subject: Re: [PATCH v2] configure: Improve alias attribute check
To: Gavin Shan <gshan@redhat.com>, qemu-devel@nongnu.org
References: <20210321001703.81812-1-gshan@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d3ed2dd6-5bfb-8be8-6929-6277a768abcb@redhat.com>
Date: Sun, 21 Mar 2021 14:37:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210321001703.81812-1-gshan@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: thuth@redhat.com, richard.henderson@linaro.org, laurent@vivier.eu,
 qemu-arm@nongnu.org, shan.gavin@gmail.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/03/21 01:17, Gavin Shan wrote:
> It's still possible that the wrong value is returned from the alias
> of variable even if the program can be compiled without issue. This
> improves the check by executing the binary to check the result.
> 
> If alias attribute can't be working properly, the @target_page in
> exec-vary.c will always return zeroes when we have the following gcc
> version and the combination of options "-O2 -flto=auto".
> 
>    # gcc --version
>    gcc (GCC) 11.0.0 20210210 (Red Hat 11.0.0-0)
> 
> This abstracts the code from exec-vary.c and use it as indicator to
> enable gcc alias attribute or not. The gcc alias attribute is disabled
> for the cross-compiling case as the compiled binary isn't executable.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>

NACK, let's first try to figure out a way to preserve the optimization 
without using aliases.

Paolo



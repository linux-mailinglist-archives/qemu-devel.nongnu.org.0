Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 648EC365952
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 14:55:35 +0200 (CEST)
Received: from localhost ([::1]:52328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYpug-0001wg-FD
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 08:55:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lYpth-0001Ul-3Y
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 08:54:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lYptb-0008Ur-NN
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 08:54:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618923267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tYw/mSR3Ck3ZDwMXaKA1Y2F+8Tp/U5/nL2wUhcEzAmI=;
 b=gpnKYvg18uITfuMFxw1+mlBH60YUCRA6THpzLyDnUQ8eQqfovOrpzbyJqDC0mdoexs80cD
 mcHTsiyMYKzgP3vURP3WEk9XcEm2FBiXeV4fjo8DqUliaX31f1wcVc68Y1j64EdvDBAxrM
 QgN0nPm9cHoaGfCL2E45Opr5ULBi6uU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-RHcCnhpYNuiN1KFkC8NAgg-1; Tue, 20 Apr 2021 08:54:25 -0400
X-MC-Unique: RHcCnhpYNuiN1KFkC8NAgg-1
Received: by mail-wr1-f69.google.com with SMTP id
 k1-20020adfd2210000b02901040d1dbcaeso10794406wrh.17
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 05:54:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=tYw/mSR3Ck3ZDwMXaKA1Y2F+8Tp/U5/nL2wUhcEzAmI=;
 b=A+pN6GsMmQSof2VQXRbHrC+kiZTa35uW8jNOESJZAeTpXMwy+kBQlnekbmW2kmfOZz
 JoHiLaxY1/ZDApVim0g1aH0Ta0IfAVNKWoJI3H9aEVhvzA+6W4xI+fIGkcgXILpwSJyk
 ZdsCJ3IUQTzBWlrLge3XKsL53x2i1h5YE8du64DwJ9eV2HzLZTzDNceE/mnNwIRgcanU
 yVCKeL8BO5ytG9FrNNnQ4wI/pxdxT9ApN9z0wOSSQQTGrVP+9HOzXEnHuKHsEWNx3EgJ
 I+n1mK5Hp9jPJ+3W1V/Ssa7zeRa/VW0xcO3xtkTpXACtmCzjqruzP/Nme7FibRSDmG/z
 5MYA==
X-Gm-Message-State: AOAM530s7HBQQSspyxpbkoJFWTwPMunlmCaF8/h7+bzLqrm8CVKSQVnP
 FlgmuDBQwx26tckxvURpdFfDHMFP3+TYRhH2jZm2gTbqYVmr7XGKTdt+SlqUlTpH5DNKxBC+msJ
 mnpKm8/2iyR1jwUg=
X-Received: by 2002:a05:6000:1ac7:: with SMTP id
 i7mr20848672wry.9.1618923264012; 
 Tue, 20 Apr 2021 05:54:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxu7O0H3lgIJMucSiQGk8uflh+AduktngymvgSYeg2GgA2XWXEMPn32GRNHItfyTOBqNDtfHg==
X-Received: by 2002:a05:6000:1ac7:: with SMTP id
 i7mr20848649wry.9.1618923263873; 
 Tue, 20 Apr 2021 05:54:23 -0700 (PDT)
Received: from [192.168.3.132] (p4ff2390a.dip0.t-ipconnect.de. [79.242.57.10])
 by smtp.gmail.com with ESMTPSA id
 l25sm3345605wmi.17.2021.04.20.05.54.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 05:54:22 -0700 (PDT)
Subject: Re: [RFC v2 04/13] target/s390x: remove tcg-stub.c
To: Claudio Fontana <cfontana@suse.de>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210420103616.32731-1-cfontana@suse.de>
 <20210420103616.32731-5-cfontana@suse.de>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <f40727a3-9687-6821-804b-d35fa2bd5d23@redhat.com>
Date: Tue, 20 Apr 2021 14:54:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210420103616.32731-5-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.04.21 12:36, Claudio Fontana wrote:
> now that we protect all calls to the tcg-specific functions
> with if (tcg_enabled()), we do not need the TCG stub anymore.

You need compile-time checks, not runtime checks. Any calls have to be 
protected by #ifdef, otherwise the compiler might bail out.

Maybe you just wanted to state it differently in this patch description.

-- 
Thanks,

David / dhildenb



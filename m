Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7022643E6C2
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 19:03:16 +0200 (CEST)
Received: from localhost ([::1]:52056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg8o7-00022X-HY
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 13:03:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mg8lZ-0000Vh-JT
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 13:00:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mg8lW-00015Q-SY
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 13:00:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635440434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3GxF9bUp5+AoUZhFijcypdOe8Pow/gP99Hkm1gaqZCQ=;
 b=REqA3nhv6U+AsNq3Iw923kycLgvbibxjqWvjtI5GWA1HmfquZfVlAuU5nHpnmxjjH+bYmZ
 WJa6LXQWSXcdztz/FLvi4c0SVUZT2BbCt/7ZDME6BlT/voN1RsyB2vnyN8vZLkaxMtmpsK
 Aaa/9SY6O4wmqzA0M0lQsFubgqBvNLQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-sdQxL28MOg-M_vVvuLxVyQ-1; Thu, 28 Oct 2021 13:00:32 -0400
X-MC-Unique: sdQxL28MOg-M_vVvuLxVyQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 c4-20020a056000184400b0016e0cc310b3so2348952wri.3
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 10:00:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3GxF9bUp5+AoUZhFijcypdOe8Pow/gP99Hkm1gaqZCQ=;
 b=UdrBL3hI4evjKIflFnpGJ5juP1xKKJVSmjw76XV5QbnlbSzf0VeE1E+n9YpP74fWGf
 XmWE4R9IMlu3S4waTPDnrtKTVAoTY8QQEkLJuZ3cIgLGYjYZ3AWHZ/G/9cTcZ1qIx1Yb
 bQoimgOKyNCn1sRHCRG3787FNz5hKvVo1jAUIYfE8Tbetin8NpF5Y0s0sftGxxkWrVGh
 J7qdXywB+SKt/jah0MfGzVKLWEtzjKA909YZZS/aSYJJExtSsODec+hpDIB6icUZv+vi
 UoUTC7LSqKbiaXEx3QX+uuXK+94a8GIybiCy9nkzfTGoEC1uf40py3xjjHYIpI0Zveu1
 KI1A==
X-Gm-Message-State: AOAM530DMB8nD54fuVHXNUkJrE5Nv6uJdcmuxBWGTnpg6ClgeTyt4z7F
 xGI2si4TMyO74C+JRbzdbOVqr57pbbbWAGdYL3m9eB7mro44tYXJV+t0K7gFuH3tWwad4nG2MdU
 51Koj1bg1+fSuiGw=
X-Received: by 2002:a7b:cb56:: with SMTP id v22mr13208115wmj.77.1635440431756; 
 Thu, 28 Oct 2021 10:00:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKXHXaBY6pruM1Ldi87zBpySWvfDwZIAnD8aVRyKCkC6Jl5sQ/+1O/Hs/RD9JkJ/3jxp44zw==
X-Received: by 2002:a7b:cb56:: with SMTP id v22mr13208093wmj.77.1635440431593; 
 Thu, 28 Oct 2021 10:00:31 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id i13sm3429346wmq.41.2021.10.28.10.00.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 10:00:30 -0700 (PDT)
Message-ID: <5dfd104e-4d0e-ad8c-7e9e-58908fa02ef3@redhat.com>
Date: Thu, 28 Oct 2021 19:00:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 17/22] qapi: introduce x-query-cmma QMP command
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20211028155457.967291-1-berrange@redhat.com>
 <20211028155457.967291-18-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211028155457.967291-18-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.847, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 17:54, Daniel P. Berrangé wrote:
> This is a counterpart to the HMP "info cmma" command. It is being
> added with an "x-" prefix because this QMP command is intended as an
> adhoc debugging tool and will thus not be modelled in QAPI as fully
> structured data, nor will it have long term guaranteed stability.
> The existing HMP command is rewritten to call the QMP command.
> 
> This command is unable to use the pre-existing HumanReadableText,
> because if 'common.json' is included into 'machine-target.json'
> the static marshalling method for HumanReadableText will be reported
> as unused by the compiler on all architectures except s390x.
> 
> Possible options were
> 
>  1 Support 'if' conditionals on 'include' statements in QAPI
>  2 Add further commands to 'machine-target.json' that use
>    HumanReadableText, such that it has at least one usage
>    on all architecture targets.
>  3 Duplicate HumanReadableText as TargetHumanReadableText
>    adding conditions
> 
> This patch takes option (3) in the belief that we will eventually
> get to a point where option (2) happens, and TargetHumanReadableText
> can be removed again.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  hw/s390x/s390-stattrib.c | 56 +++++++++++++++++++++++++++-------------
>  qapi/machine-target.json | 14 ++++++++++
>  2 files changed, 52 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>



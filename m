Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 805414E543A
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 15:28:04 +0100 (CET)
Received: from localhost ([::1]:37804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX1xz-0008EV-5f
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 10:28:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nX1w6-0007OU-06
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 10:26:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nX1w2-0002wj-UM
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 10:26:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648045561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RDJCkJnDoA0yMoY3NC4QxidDNKo8BdCcLcE6kXnYFDk=;
 b=akP04kitwYmsiVK/yPTwVx/vnGr3n35lja6A14Oik5DTFrjKVCBWkh3I2tZPEAiQMIoBNO
 HFbau/e4eftiylEvOvj7glphDMC+efLv04Goupi0+UlY5kaCI9fRjlPgw2HxPaw1UTTsiZ
 4G9zUs/dIiAaZ8CeUsMEwsNYRVhYMlU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-114-dyeYmYKuMUqu6VrSoLsmdg-1; Wed, 23 Mar 2022 10:26:00 -0400
X-MC-Unique: dyeYmYKuMUqu6VrSoLsmdg-1
Received: by mail-wm1-f72.google.com with SMTP id
 r9-20020a1c4409000000b0038c15a1ed8cso2871253wma.7
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 07:26:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=RDJCkJnDoA0yMoY3NC4QxidDNKo8BdCcLcE6kXnYFDk=;
 b=KvW2gYh759tYy8h9Tjqa4yD9AAK/lsBmBmVP8yml7K0RSTj1y+AxiWdlB0JE+U/Dpm
 Ic2CRIvUkBAD9kKhAAXNJSaC0QpJhdt5RriJPE7u3xaHLqWUcCcDspnw7yBtvzF9hlfF
 G9l09B28LFoy8AcX4EA8aAbCVfzvbWTyqVJ82lyeX9L+Bq1DHXiyaEPudpZBmavu5GRc
 qoEd9VAXg/dQvXR58XKEjp/F3BuRN6RNfBX0nGXfqGDIcJmlG/f+F4tFkNbVXD0TDzY6
 +7A3zcO0kIJFFJmRpMHo9Wp9kwRK6RsQF4Y203OHKUPtTmHicfjTrJUUHVVgPggfp+cI
 hh3A==
X-Gm-Message-State: AOAM532I+Q18VVkRN+lwOlHJyL+aAptYTKqEh94zGgPwuK6tGRDe38Pk
 wMtLeI7ICZKEBwqO3Sq7fh8x/jVBEx0Fuw1kC81t7JVw8GC+38e92GA1yfpGLrrNScD4q65SLEe
 5O9FXiQzfe4Rn0BI=
X-Received: by 2002:a05:6000:120a:b0:203:d837:be76 with SMTP id
 e10-20020a056000120a00b00203d837be76mr25189wrx.511.1648045559553; 
 Wed, 23 Mar 2022 07:25:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6zGFgAuKXcQttjvMlPJauA0r2yNEEY2CbwPvAnxk7FsFpRfw4oaeq9W+wQvsjOKiRjRnnHw==
X-Received: by 2002:a05:6000:120a:b0:203:d837:be76 with SMTP id
 e10-20020a056000120a00b00203d837be76mr25163wrx.511.1648045559240; 
 Wed, 23 Mar 2022 07:25:59 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:a300:f7c1:f4a5:f958:a561?
 (p200300cbc704a300f7c1f4a5f958a561.dip0.t-ipconnect.de.
 [2003:cb:c704:a300:f7c1:f4a5:f958:a561])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a5d5988000000b00203d5f1f3e4sm9255wri.105.2022.03.23.07.25.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 07:25:58 -0700 (PDT)
Message-ID: <34d56391-3176-c50c-1476-431de3cfd34a@redhat.com>
Date: Wed, 23 Mar 2022 15:25:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v5 09/11] target/s390x: add S390_FEAT_VECTOR_ENH2 to qemu
 CPU model
To: David Miller <dmiller423@gmail.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20220323135722.1623-1-dmiller423@gmail.com>
 <20220323135722.1623-10-dmiller423@gmail.com>
 <CAEgyohWY5822AB1AzArYypf+rDyYh5UB-0n0eWoQGOR3PhpaCg@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <CAEgyohWY5822AB1AzArYypf+rDyYh5UB-0n0eWoQGOR3PhpaCg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, cohuck@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, farman@linux.ibm.com,
 pasic@linux.ibm.com, Christian Borntraeger <borntraeger@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.03.22 15:03, David Miller wrote:
> I am sending v5 now as I'm away from my desk until Sunday.
> As I'm unsure whether or not this just needs a V7_0 and the patch
> shown as an example isn't a direct correlation : I've left it out for
> now.
> I will dig into it further Monday March 28th.

We can tackle this after the 7.0 release, then basing it on the new
compat machines and most probably on [1].

Should be easy to adjust.

[1] https://lkml.kernel.org/r/20220322112256.118417-1-david@redhat.com


-- 
Thanks,

David / dhildenb



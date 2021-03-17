Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CA633EF9B
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 12:32:16 +0100 (CET)
Received: from localhost ([::1]:37674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMUPP-0001Oz-4j
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 07:32:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMUNh-0000X3-AM
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 07:30:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMUNd-0005Fz-Ju
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 07:30:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615980624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wmFcQb9nVfT1WKtLLqSa7isjgVCKv19Dt0nLWnVP5tU=;
 b=hFw9muudLejgNEsZ7ewvth7Alybk/y+Ipt2UrPfkTiOO1clp3EICwZHL8Y4P7cn3Ja7Ifa
 4zPCFsZa/xtUFEolBgCZN/rDvnnKPBP2zy5/PRvi4AdiBPFCfE5KLGN5vtL4vRhLWTvUcJ
 mnvNERHSrp7BXKSSpN3+RzgCWsX87to=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-1qxDOmv_MNyUftnmWoTRCQ-1; Wed, 17 Mar 2021 07:30:23 -0400
X-MC-Unique: 1qxDOmv_MNyUftnmWoTRCQ-1
Received: by mail-wr1-f72.google.com with SMTP id v13so18270173wrs.21
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 04:30:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wmFcQb9nVfT1WKtLLqSa7isjgVCKv19Dt0nLWnVP5tU=;
 b=SFfPEoqTRRuzWousbNbPBnXT1e7nMhF9+GEnR8Qyzz7wkenBAnXmok0clqEkGlKQcl
 QH1kr30HJb1fkseNK8pbJm5fjSPkDNQsjWY00y9wtlk65OMBFx+ak8IEw8N+mg6ELEcC
 yqIEctlopCrNy1RqIGqomoJehT0rZKTQ+XMPIaQhwkw5jbmvAEeocS4ggYKOVx5RrSDV
 OFZgw1Nj7MhyjE9M2oNCM1YsrkuFmnifKTOmCnAOLV4MEMVQ9kZ8QPNpHAdfSF1izTpQ
 r4wKuAWq9Uzi1s11gjOyWKTjnt1xIYZxWwjMUJlacwV6AYNlK+rIVfwZMUrOCynz2voQ
 7YDw==
X-Gm-Message-State: AOAM532JI7XtJ1m2bPUPegaY4XRBD9UxrMaTp+vuZeoOKJiQSveeCMS4
 Tg+hbV5xDapZlv/2yoswknwJjh/14nIMPLIYO+0DKigUnwYj2qFlnMFZ0rbX5yPqnJoB/e5ldlD
 Ohkmof58oRwQ2tso=
X-Received: by 2002:a5d:42d2:: with SMTP id t18mr3912314wrr.258.1615980622049; 
 Wed, 17 Mar 2021 04:30:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwKTwfPkkca4lQI7M+PuyfD7QY8Dc1ORPvz1OszInqrmOqKOAzofBHwafqSayIixaHwDKvZw==
X-Received: by 2002:a5d:42d2:: with SMTP id t18mr3912279wrr.258.1615980621775; 
 Wed, 17 Mar 2021 04:30:21 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id n6sm29524550wrw.63.2021.03.17.04.30.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 04:30:21 -0700 (PDT)
Subject: Re: [PATCH 1/3] s390x: move S390_ADAPTER_SUPPRESSIBLE
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20210317095622.2839895-1-kraxel@redhat.com>
 <20210317095622.2839895-2-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3be3264f-1400-5b57-1a99-c7f92610c9be@redhat.com>
Date: Wed, 17 Mar 2021 12:30:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210317095622.2839895-2-kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/21 10:56 AM, Gerd Hoffmann wrote:
> The definition S390_ADAPTER_SUPPRESSIBLE was moved to "cpu.h", per
> suggestion of Thomas Huth. From interface design perspective, IMHO, not
> a good thing as it belongs to the public interface of
> css_register_io_adapters(). We did this because CONFIG_KVM requeires

Typo "requeires" -> "requires"

> NEED_CPU_H and Thomas, and other commenters did not like the
> consequences of that.
> 
> Moving the interrupt related declarations to s390_flic.h was suggested
> by Cornelia Huck.
> 
> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/hw/s390x/css.h       | 7 -------
>  include/hw/s390x/s390_flic.h | 3 +++
>  target/s390x/cpu.h           | 9 ++++++---
>  3 files changed, 9 insertions(+), 10 deletions(-)



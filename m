Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2BF4024AC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 09:46:28 +0200 (CEST)
Received: from localhost ([::1]:37036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNVoJ-0007UD-45
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 03:46:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNVml-0006er-0w
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 03:44:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNVma-0005vJ-16
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 03:44:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631000678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MTP6wlgGEfKTwYVIP96B3fjsMoQL/qewotC4CxGHzpY=;
 b=Xlk2JiRV7BeMQ8YnqOizrr0Qf4uzGit1NfXJKvIDD/DT7wxQsYFkDIH6GFbErHH4AcIfhx
 ShsYWHtcDQGZ0LZd7LnRSEXtJts0byiRC/kuCsVsRmVh3JWH8NkA2HauAZWrw2CU9ZIoxr
 SDGr9P8OlB50e4J4IJi0np35j0cG2rU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-l5i2JNYhMvWd_15a_smKJg-1; Tue, 07 Sep 2021 03:44:37 -0400
X-MC-Unique: l5i2JNYhMvWd_15a_smKJg-1
Received: by mail-wm1-f71.google.com with SMTP id
 c2-20020a7bc8420000b0290238db573ab7so812725wml.5
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 00:44:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MTP6wlgGEfKTwYVIP96B3fjsMoQL/qewotC4CxGHzpY=;
 b=TECXbu6cAnLbsjSLCs5sm9WtVoKaYuHLEdiBQ41rbqt8EHldEK+W9Jdj3BCr8Lz3GJ
 fVrJAjFnWgfYi7h8EJ1YlSMArnCUQhmqV7iCGY9urTG19WEONEq7C2bIR79OQfJvEhnw
 aVaqKBa5iG+W3iSeSD/MYjPRqiXG0Am+/QfdKgAFFP9eeP+HlS1ccOEWQ8tkQHFX1SEZ
 zX3l2OFuDw3K4E3BXpfYuqxWxK1YIduYLy5YBMI2kAz9ly4tvJoFsiun5uTIN9SmC0eK
 /0JWW9f1bthFaqUTjveU0bmcO0x0MQTBm0t4ZEUwXGkS4W2Zte/PwRhGCwr72smN1X5I
 kv5w==
X-Gm-Message-State: AOAM531DxRO2obHAD2/eoZrcyCqh6obHVbe7jJ9jIYrcgpyicnCC/X+B
 p0ulbWvbjL4x3MtmRUxcoBymzJJJWuxINyhxLdXPZJYW1rjwRYOrU/zyXEoKzGftMD5jlBvPvxq
 9sWP2VJOVOKpNjOg=
X-Received: by 2002:adf:c10b:: with SMTP id r11mr17240627wre.336.1631000676519; 
 Tue, 07 Sep 2021 00:44:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJmlmMkCD3zIaWXRy5Br+MVinSGw8sEU0Y7p3U8704LolgmV2QsFOJ88XpKhaCdpyP6XBqKA==
X-Received: by 2002:adf:c10b:: with SMTP id r11mr17240606wre.336.1631000676270; 
 Tue, 07 Sep 2021 00:44:36 -0700 (PDT)
Received: from thuth.remote.csb (pd9e8396c.dip0.t-ipconnect.de.
 [217.232.57.108])
 by smtp.gmail.com with ESMTPSA id q195sm1613485wme.37.2021.09.07.00.44.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 00:44:35 -0700 (PDT)
Subject: Re: [PATCH v3 00/13] s390x: skey related fixes, cleanups, and memory
 device preparations
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210903155514.44772-1-david@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <da2b4842-98e5-395a-6abe-67e134b457d2@redhat.com>
Date: Tue, 7 Sep 2021 09:44:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210903155514.44772-1-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/09/2021 17.55, David Hildenbrand wrote:
> This series fixes multiple TCG issues related to storage key instructions,
> fixes some TCG issues related to LOAD REAL ADDRESS and skeys, implements
> lazy skey enablement under TCG, and prepares the whole skey infrastructure
> for dealing with addresses beyond initial RAM (e.g., memory devices like
> virtio-mem). Along, some cleanups.
> 
> To prepare for memory devices / memory hotplug, my goal was to get rid of
> as many ms->ram_size users as possible. Unfortunately, I stumbled over
> many other things on the way. The remaining s390x users of ms->ram_size
> are:
> 
> a) hw/s390x/ipl.c: loading the FW. Won't need adjustment.
> b) hw/s390x/s390-skeys.c: allocating the array for storage keys. Will need
>     adjustment for memory devices.
> c) hw/s390x/s390-stattrib-kvm.c: will need adjustments in the future when
>     using memory devices with CMM.
> d) hw/s390x/s390-virtio-ccw.c: fixing up / handling initital ram. Won't
>     need adjustment.
> e) hw/s390x/sclp.c: same as d)
> 
> Especially patch 9-12 also affect KVM. The remaining ones mostly only
> affect TCG.

Thanks, applied to my s390x-next branch:

  https://gitlab.com/thuth/qemu/-/commits/s390x-next/

  Thomas



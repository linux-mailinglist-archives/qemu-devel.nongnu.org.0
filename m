Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AB845B607
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 08:57:12 +0100 (CET)
Received: from localhost ([::1]:48220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpn9T-0000BN-KM
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 02:57:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpmuc-0004Cm-J5
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 02:41:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpmub-0001fa-4j
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 02:41:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637739708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NDTM8pbk0KJ519je+cZMFj/jM8l/UsfAnV4r7RDFsYM=;
 b=WmFm8HmCFOuf5Q8GreGruejC60dMFWy0EyWuvBc4aLbxqyh/kRUedxrqbZipWcpfoCAzOc
 CedUSX93sd2DFoMgYOwZGw+T5lBD3gIIvrx0GOX6Sr56O/k9q4svEbSoNDbs2gItj2jQhZ
 orrjBJS/7i9KyxKlsLz04zxMU/hRcwg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-585-au1WvpVlPrOXKsa1rEh-bA-1; Wed, 24 Nov 2021 02:41:47 -0500
X-MC-Unique: au1WvpVlPrOXKsa1rEh-bA-1
Received: by mail-wm1-f71.google.com with SMTP id
 g81-20020a1c9d54000000b003330e488323so1387492wme.0
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 23:41:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NDTM8pbk0KJ519je+cZMFj/jM8l/UsfAnV4r7RDFsYM=;
 b=jI5P+kA1JYrQhTvtRGtqw2wMHkMHBdnadwIqd14BkhSzy/vKhd74mFu8N75iaqbeG+
 CRG4TNVOWmUdkrqNPQ8SWwykBUH5feDQAVq+6+xBAKcvGn0FamxknIcG++JHkQqK9AW1
 wtYyNkZrESbZD1Kky2rAyphN8y2fdFZLhqiH8FxfiDdgIJAiJJjbyKjFc4RDzELJN8hn
 w8OTophMDv4DIVwKQbARD0kYTDnNdPkZCScMy7fmeNPspBs1EXoaaHR9JImGjGIMtddy
 mjXMqGHNT65Vn+NyJmnDNuFTB8/FWCgF3IniiWU38R9kDQ0AuLsjdeEuywO4rBsRIJUM
 hwAg==
X-Gm-Message-State: AOAM532piXJx7sqRM5XSypSWF0NiZTn33lHMbVRlzzP5OTvx5kZ9tz9H
 EhGcW5eY/brHSAFWs0WzaZ5B0X5bOZyzqtx6V4nhqRKiY7eywzRdjY5nQGaeMIsQIY4yRbEaki9
 Km7RBY1FFDgocUGY=
X-Received: by 2002:adf:fed0:: with SMTP id q16mr16742495wrs.276.1637739706187; 
 Tue, 23 Nov 2021 23:41:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxAj/bAq1CDyJS2jqi70CS/PRKDGUA+oCFgoj5RUy6BF98kYHAUFzPOzxumX54Fy+U+hnpjPA==
X-Received: by 2002:adf:fed0:: with SMTP id q16mr16742465wrs.276.1637739705996; 
 Tue, 23 Nov 2021 23:41:45 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id f15sm4947825wmg.30.2021.11.23.23.41.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 23:41:45 -0800 (PST)
Message-ID: <04a4b695-eaf7-e7ec-8c49-45387ce3518b@redhat.com>
Date: Wed, 24 Nov 2021 08:41:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] microvm: use MachineState->dumpdtb
To: Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <20211123091648.115334-1-kraxel@redhat.com>
 <20211124082426.329ca0d4@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211124082426.329ca0d4@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/21 08:24, Igor Mammedov wrote:
> On Tue, 23 Nov 2021 10:16:48 +0100
> Gerd Hoffmann <kraxel@redhat.com> wrote:
> 
>> There already is a machine property to dumb the device tree for
> s/dumb/dump/
> 
> 
>> debugging purposes, and the helper function qemu_fdt_dumpdtb()
>> implementing the dumbing.  Make microvm use it for consistency.
> ditto
> 
>>
>> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>> ---
>>  hw/i386/microvm-dt.c | 9 +--------
>>  1 file changed, 1 insertion(+), 8 deletions(-)

Regardless of the funny typo:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>



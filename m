Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F953B09F0
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 18:07:14 +0200 (CEST)
Received: from localhost ([::1]:41330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvivh-0001FN-Qb
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 12:07:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lvisU-0004Dj-Lq
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 12:03:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lvisS-0005q5-K1
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 12:03:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624377831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kP7Md80zgi5juiSwSJjkj59pr5rEW1urtWDsw5/4F04=;
 b=aR6j3t0pk7L3DYZxEnf3oIi9622RUlsbi/OSiu4VYFj8waZhOzmgFuGt96ZecXH3JEl4pf
 OlmnxWcMvcrO7ux9GugWKl4F64Uyu80gFfTUO8p9RtCf4f3BKasBb/FUT0KeP/UmDnL6Zu
 dUhxAkiKYEQa6gM8xbBv2skJ09fl7hQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-4IA8yX5wNhC4oFjjYjwhEg-1; Tue, 22 Jun 2021 12:03:49 -0400
X-MC-Unique: 4IA8yX5wNhC4oFjjYjwhEg-1
Received: by mail-wr1-f70.google.com with SMTP id
 d8-20020adfef880000b029011a9391927aso3626735wro.22
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 09:03:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:from:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=kP7Md80zgi5juiSwSJjkj59pr5rEW1urtWDsw5/4F04=;
 b=BLE4qF9XfCLlQwZQVKt6h5MVSWp46uZxqmEQb+UXDWPorTaNmyqkW+mPC3582UyVBG
 u46anj3Y7FjkM4gxhKcD04cyJgeKMmy2rQSK84pA9xf0BJncvcZSOYBd58WQH48pujOF
 YHaHUfHcVnXwMzDbsvV4cKzIJIGiy6Wb6jcCsb06Z6ieFFse5WCcr3Rtqrvc0HzXPyr9
 FfuuxYVG3EOYloTtI3tVKhm9fan8pK/CiOz1KpQTuCMWy3vmbxZnCKEdh4nRuyuu5gYR
 JrGJiomGU9RqN7GztZRQubcv+07g69kEi/aufE0MhT7rGjAaTAaO5La7ine4GN4hf7L/
 Vi3g==
X-Gm-Message-State: AOAM531Pfq9Bd1u8eZAHO+muDDMtMW/2RGwlJVoRJjarWuL+oVVkj2TI
 3BwsKpTTxunN5vUl/UYxj9S6KaTUOGW68btfAlJyD31WD7E7ZhO+B+hnxih1cEDeO2JRLC6pe12
 Yjm2v3jpn7XzA48Q=
X-Received: by 2002:adf:ebc6:: with SMTP id v6mr5719392wrn.398.1624377827947; 
 Tue, 22 Jun 2021 09:03:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyR8z9aSU2zgSxlIZpvrGu3U2EuFkbf4khTQ+xNckVpisnmC72Ctt9Uhnasvg/gIgjLe9X+tw==
X-Received: by 2002:adf:ebc6:: with SMTP id v6mr5719342wrn.398.1624377827653; 
 Tue, 22 Jun 2021 09:03:47 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id j18sm21666396wrw.30.2021.06.22.09.03.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 09:03:47 -0700 (PDT)
Subject: Re: [PATCH v3 02/24] modules: collect module meta-data
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu block <qemu-block@nongnu.org>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Peter Lieven <pl@kamp.de>,
 Max Reitz <mreitz@redhat.com>, Halil Pasic <pasic@linux.vnet.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <eeadb47b-d35c-2608-7970-8f754a34258c@redhat.com>
Date: Tue, 22 Jun 2021 18:03:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FAKE_REPLY_A1=2.899, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/06/21 14:52, Gerd Hoffmann wrote:
> ninja: error: 'libui-curses.a.p/meson-generated_.._config-host.h.o', needed by 'ui-curses.modinfo.test', missing and no known rule to make it
> 
> Hmm, not sure where this comes from.  meson doesn't try to link
> config-host.h.o into libui-curses.a, so why does extract_all_objects()
> return it?
> 
> Test patch (incremental to this series) below.

Bug in Meson, fix at https://github.com/mesonbuild/meson/pull/8900.  You 
can just ignore missing files.

Paolo



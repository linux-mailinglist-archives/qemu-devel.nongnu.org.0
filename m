Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2292D338853
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 10:13:03 +0100 (CET)
Received: from localhost ([::1]:34440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKdqw-0005ZE-5C
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 04:13:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKdio-00039Y-Al
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:04:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKdil-0001jb-Sa
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:04:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615539875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CoRPUG24Tw9/OvkXRpZwvuO3KdQLX7bpR/po3jAZDMY=;
 b=CLCbD26OCnqp6A7hXATXSVZYju5Pl9K9GKySopIsJ+0b2pm9QNyFcydJRNzMsBOrvx4k6q
 G6AeTiJIR2rj/8hPZOAh2GehwOdrP6h9Cc6H57foe3oFGl/Aacf6gQY+RzrzUuABwf/GmT
 6UFbsiN10n3T2SiJ3vRHxnsvfmZAW80=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-zxHWZXYeNXKdHUcKbdnFtQ-1; Fri, 12 Mar 2021 04:04:33 -0500
X-MC-Unique: zxHWZXYeNXKdHUcKbdnFtQ-1
Received: by mail-wr1-f69.google.com with SMTP id l10so10873679wry.16
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 01:04:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CoRPUG24Tw9/OvkXRpZwvuO3KdQLX7bpR/po3jAZDMY=;
 b=NCfHmj/TwVkvmNcuJ1B2CUo/VqOp3PhHZ5PdtOFdEKG9zwk0tFGtnPvsL9HyRcMTmB
 G1psg49k0jrMr9zBN1nVgOiPSQy8RBVNGPNh/za9kn55arCmln3V3QwNlsyiTJstluZW
 Ns7LtBJU4c7ayoY59wF1Ksx3jL35PAe92l2oSUkQqaKfMygyGx5844yBll2//y0En+GS
 T+v5G+gZCTaTdeyhTvRZV4GPjw3ZwwgJRn9Ab1pNZ1zsu7ZhOWK/yKFlRZznALSXi2/g
 FN1gtatHpkSput0zhCPk8hsR5FJWxJHxcWK7rUohRrM6uRG9GcfJa6J8RxAqzLSc48xk
 ZS9A==
X-Gm-Message-State: AOAM531RrypDpj4Jhr/2U4eFCloTWMVm+OO93rXvgnfY2cNULU1DJ1TU
 lkl7n7Sq0cZ4de735qhHFURB0kjtxMiHO5QVRSQhbKgTgiwskQT5J+SeCkIRmRW8Cgh+i3VN5rr
 JtdFuUx9O/fYKxko=
X-Received: by 2002:a5d:6989:: with SMTP id g9mr13500324wru.198.1615539872295; 
 Fri, 12 Mar 2021 01:04:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQ7qy3mUFbDReMxBDqMwOqApddxsPg5rjQiFBI/GQbsS0/n/UhU2LZVluAzywIUNxiFC1P7A==
X-Received: by 2002:a5d:6989:: with SMTP id g9mr13500299wru.198.1615539872086; 
 Fri, 12 Mar 2021 01:04:32 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id r2sm6784461wrt.8.2021.03.12.01.04.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 01:04:31 -0800 (PST)
Subject: Re: [PATCH 1/6] accel: Introduce 'query-accels' QMP command
To: Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20210311231202.1536040-1-philmd@redhat.com>
 <20210311231202.1536040-2-philmd@redhat.com>
 <CAJ+F1CLu=A4CaL+KbsSuOr9A36DX_9PpkVNg7PH7-4hCzpfoFg@mail.gmail.com>
 <b0eabd3c-b044-0420-d7e7-175c8f2b8206@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e611d7bd-49af-39e6-2cb3-cbce0c89e050@redhat.com>
Date: Fri, 12 Mar 2021 10:04:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <b0eabd3c-b044-0420-d7e7-175c8f2b8206@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, QEMU <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, "open list:ARM" <qemu-arm@nongnu.org>,
 Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/03/21 09:46, Claudio Fontana wrote:
> 
> Maybe for clarity this could be 'query-accels-available' (which is probably the goal of this series).
> Possibly a separate one would be 'query-accel-enabled'?

The accelerator object is not included in the QOM tree.  I think it 
should be added to /machine/accel so that you can get the enabled 
accelerator with "qom-get /machine/accel type".

Paolo



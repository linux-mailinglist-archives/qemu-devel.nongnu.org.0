Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4636E08D0
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 10:21:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmsBe-0006dr-0z; Thu, 13 Apr 2023 04:20:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pmsBb-0006aI-EL
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 04:20:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pmsBZ-0007zj-PG
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 04:20:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681374004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TtkdcBug85rou4tzTRY5CoMDtcg3Zw1hTK6bBuvvsWQ=;
 b=YsJMQrHuFK1LQaBT4ho6DwBr6TuSS2XrbrUjk2qnmiCnFm+Xa358+0ynC4JI9bB85sTROm
 IW8Qqy3wd9zYccqtfLxNyVJeq9RTFn+Kt9B7MUNXBEAgoopMmyxtrmBGdmwenaY1dOBKB5
 uIb29jOdzG9wCVfmMjMKW05LdIgUVXk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-CM9uF69OMuWMZ59m30XRtQ-1; Thu, 13 Apr 2023 04:20:03 -0400
X-MC-Unique: CM9uF69OMuWMZ59m30XRtQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 s30-20020adf979e000000b002eeddf27e71so3094657wrb.13
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 01:20:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681374002; x=1683966002;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TtkdcBug85rou4tzTRY5CoMDtcg3Zw1hTK6bBuvvsWQ=;
 b=DmOpdOkrJkSJYhXuTBf+4jBEUoH8L5NxyU8mgsimjIFZHKnUFnAdqoFzj8U3H9bLYa
 JxcpIW408238Cicis4gcdILk98hMIbXAywScye+8HT54dTn3OMWVGo24J4SLwQh1huod
 731aCdIR+tptDNSidgAVWWoP+6IZZ5OcVIzod1bnYpeo0AgKZhNLWC+TkYuSCPvkXszN
 K18HS4gW0Uz90yM1V6qreF5Bs/d/VffdbRa6azF6rA9RJARa2QsmfEKFjEv9o6tF5WzF
 qd7qh/A/Uu4eD4j0cuorGeu2PiLXfZLgCzS8OPsvysKtSW9Y5PP4b+/ojy+ncPhatCpu
 pzKw==
X-Gm-Message-State: AAQBX9eJ4FwtWfGmG26S10l/m+2/Ar1ccxV1lb8oxUHBUqxAFRL9Xt2P
 TyB+ZUgzPBVN2iSVmpfKWu45HzH/4anuNbM2Y7FPTS389qO/szoOFNGxKj7Qtfbg/eIEFq7qybS
 7DzAz/HBIDdcG4FU=
X-Received: by 2002:a7b:ce14:0:b0:3f0:a3c4:5f70 with SMTP id
 m20-20020a7bce14000000b003f0a3c45f70mr1186721wmc.7.1681374002343; 
 Thu, 13 Apr 2023 01:20:02 -0700 (PDT)
X-Google-Smtp-Source: AKy350bkk2f/Screzg0iaWAy1kP2i5tZZgbezgVm1I9/dSgHJe82dHn1j/e24ufpcyfOYwxVfv2x0Q==
X-Received: by 2002:a7b:ce14:0:b0:3f0:a3c4:5f70 with SMTP id
 m20-20020a7bce14000000b003f0a3c45f70mr1186709wmc.7.1681374002056; 
 Thu, 13 Apr 2023 01:20:02 -0700 (PDT)
Received: from ?IPV6:2003:cf:d735:c67f:6ed9:8c90:7a1d:e97e?
 (p200300cfd735c67f6ed98c907a1de97e.dip0.t-ipconnect.de.
 [2003:cf:d735:c67f:6ed9:8c90:7a1d:e97e])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c470900b003edddae1068sm4762953wmo.9.2023.04.13.01.20.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Apr 2023 01:20:01 -0700 (PDT)
Message-ID: <f3fbcccb-5dc0-a7e8-ed92-001d275792b0@redhat.com>
Date: Thu, 13 Apr 2023 10:20:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 0/4] vhost-user-fs: Internal migration
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, virtio-fs@redhat.com,
 German Maglione <gmaglione@redhat.com>,
 Anton Kuchin <antonkuchin@yandex-team.ru>,
 Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
References: <20230411150515.14020-1-hreitz@redhat.com>
 <20230412210000.GB2813183@fedora>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <20230412210000.GB2813183@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.083, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 12.04.23 23:00, Stefan Hajnoczi wrote:
> Hi,
> Is there a vhost-user.rst spec patch?

Ah, right, I forgot.

Will add!

Hanna



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9517D3F17BA
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 13:09:10 +0200 (CEST)
Received: from localhost ([::1]:46424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGfv3-0001xh-Mx
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 07:09:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mGfu2-00012Z-0j
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 07:08:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mGfu0-0007VK-7e
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 07:08:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629371281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VZMcIeRt5eyINQG2V+JzpABomF08uRoGip0zpikU4uQ=;
 b=LeSgXODARuTgdpb0wSF7h0XdLYqHtJbmNExZOtJzr/Nvo9zkilRZSlUArejp6TvnUZQum2
 6/WF1jaxC+bySua0ZVu9i6WljJjVBZPtj2TPM73L7qxv17gz+4RZJ0rogwlQ4XgoZJeTEK
 PbGBCF5FFFRijFjDHRw44R3PdJK6RAo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-1kjWFKYIOTC5jgX2ToA1iw-1; Thu, 19 Aug 2021 07:08:00 -0400
X-MC-Unique: 1kjWFKYIOTC5jgX2ToA1iw-1
Received: by mail-ed1-f69.google.com with SMTP id
 f21-20020a056402005500b003bf4e6b5b96so853326edu.5
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 04:08:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VZMcIeRt5eyINQG2V+JzpABomF08uRoGip0zpikU4uQ=;
 b=kcsfXvX0VYAJrgWtmBxSisH8M4kg+0GoDu2s+9V8NSNnOks/MBW5ympM7IqXqj4gbc
 gw/jidT68BGVGjyahYXEoNpiY3XISA+qcAgtV6iPMW95f9il/LcHOjI4fSqgHALTfZlZ
 3utua8sevRTV8JsZxCrlsz9V9s+uFmy57nsKeKNdkmSDIv6lnA5gx1q6xLhcauM9D82E
 XY3fUbbJf3exoYRDFzAvLJUwe3May0fRal2Eit2arp7ABA6IsENJx9c6uZqa+L54mABR
 rZcojNMRaD87EM5LsL2kr1fl5W69ofSnYocTFfDENNRipeXfFfzQTZrx54XOvfP1Hq84
 kIsg==
X-Gm-Message-State: AOAM532WTndm3hocbtEnTD3QsMcTDautNofEQ3aTH7Lb1os8vZFxG9Do
 Ukq0hBClZYwKSO3dumr21BFT7isCho+BSKGLdG6RwaDzPDhoS/o36tQwynFzrVRfENGuGR2cSkr
 llxlNZsfhdTUNoyU=
X-Received: by 2002:a17:906:3ce2:: with SMTP id
 d2mr15077909ejh.410.1629371279031; 
 Thu, 19 Aug 2021 04:07:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaibMQ2YbJ+4d8hrZTiQirD3bTvRH11CUXzndmLAO23Vp9Hi8/aM3Tga/ndGO273xm2tva+A==
X-Received: by 2002:a17:906:3ce2:: with SMTP id
 d2mr15077887ejh.410.1629371278795; 
 Thu, 19 Aug 2021 04:07:58 -0700 (PDT)
Received: from thuth.remote.csb (p5791d8f7.dip0.t-ipconnect.de.
 [87.145.216.247])
 by smtp.gmail.com with ESMTPSA id o17sm1509690edc.58.2021.08.19.04.07.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 04:07:58 -0700 (PDT)
Subject: Re: [PATCH v3] blog: add a post for the new TCG cache modelling plugin
To: Mahmoud Mandour <ma.mandourr@gmail.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20210809164559.66638-1-ma.mandourr@gmail.com>
 <CAD-LL6iv8n-1Jo4UJ6EQxLEu5a13VK_B1RPK3VMZiyPrX_dgAg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <7b4693ce-9dbb-fe64-803b-97fdcf5d9f96@redhat.com>
Date: Thu, 19 Aug 2021 13:07:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAD-LL6iv8n-1Jo4UJ6EQxLEu5a13VK_B1RPK3VMZiyPrX_dgAg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/08/2021 13.22, Mahmoud Mandour wrote:
> CC Stefan Hajnoczi and Thomas Huth
> 
> On Mon, Aug 9, 2021 at 6:46 PM Mahmoud Mandour <ma.mandourr@gmail.com 
> <mailto:ma.mandourr@gmail.com>> wrote:
> 
>     This post introduces the new TCG plugin `cache` that's used for cache
>     modelling. This plugin is a part of my GSoC 2021 participation.
> 
>     Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com

Thanks, pushed now.

  Thomas



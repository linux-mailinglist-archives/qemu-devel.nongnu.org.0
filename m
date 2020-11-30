Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A70C32C8195
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 11:01:58 +0100 (CET)
Received: from localhost ([::1]:43930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjg0L-0000Em-OK
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 05:01:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kjfyN-0007nV-LF
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 04:59:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kjfyJ-0002zL-JM
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 04:59:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606730390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=osdoeYE9kBtx3W/AyyeCIzHjenuRzNHkCzRmoQbfMX4=;
 b=hNIhnZZHdVDYnPOn69vRLFY0daoK8J+WM0EoS5MyB81sN9QkNl2rtKDjRhwPccRxLAga/S
 TE+6YmkEA4hBoXC87nYWcM8fnihNzKRtfMsfI+Wys0hsCr5tymx6rgOihvI1Dk8LDv/0U+
 nN30+JITSPfQzZ1k1Ktp9aHH3wyG+0E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-CByG9RPeNyuE3FNkjslWoA-1; Mon, 30 Nov 2020 04:59:47 -0500
X-MC-Unique: CByG9RPeNyuE3FNkjslWoA-1
Received: by mail-wm1-f71.google.com with SMTP id v5so7223844wmj.0
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 01:59:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=osdoeYE9kBtx3W/AyyeCIzHjenuRzNHkCzRmoQbfMX4=;
 b=TYBE+oiy4Zebm11PjzABS04N0wF7Ko7xwYUSvbnC6bGJ+liIQAFMh+FEURtFk4WIoH
 3OM+1KsxMrlnCSLu6xjZgbqmRjFMiff/3Zaowrglm9TgsUQDIPhFgLWtzXuM0YCc0xil
 FGuqgDbooLULyAPQzELOtQkjg1DqFp8eZSxoEU9K98ImzSqkzjjlacq2kf0SAPJkRy63
 tbPfkECnH8Z4bqXpZAa3qBdgwol1Ob2SsEkUxM4uTQMfEqsD01HNoMjEvgpFmmsrSD+R
 MJuJyutGjb5lA7XQP1KbDmiLwD/77JRU6xK8b4Ze5PA18d81UorvR+ClFKL6olMA3XxO
 7kwQ==
X-Gm-Message-State: AOAM530zJqH/Mlr7xlbOsh0Xnc4yJmsyzWWS5OMXpvgNTcVnCefIXAfa
 zjpJ7Mi3X5IacvW+sLj1NZ0j8Hkuzn4MLhE97QCMXy5NNxuqeeArcXEJrTFYE7Ky5UC29gSiSLl
 bkKQYY5THPQWocJ8=
X-Received: by 2002:a5d:4e87:: with SMTP id e7mr28228185wru.70.1606730386077; 
 Mon, 30 Nov 2020 01:59:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwsvzGl6TBjcVCc72AmWsic5tj2ImWuFsoYI6J1747Bce4HyCrk4qtl84HRq07qNkhweQsaqQ==
X-Received: by 2002:a5d:4e87:: with SMTP id e7mr28228157wru.70.1606730385850; 
 Mon, 30 Nov 2020 01:59:45 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id w10sm27549983wra.34.2020.11.30.01.59.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Nov 2020 01:59:45 -0800 (PST)
Subject: Re: [RFC PATCH-for-5.2 1/2] net: Do not accept packets bigger then
 NET_BUFSIZE
To: Mauro Matteo Cascella <mcascell@redhat.com>,
 Jason Wang <jasowang@redhat.com>
References: <20201127154524.1902024-1-philmd@redhat.com>
 <20201127154524.1902024-2-philmd@redhat.com>
 <733cc7a3-bbf8-7462-cbeb-34dd1229532e@redhat.com>
 <CAA8xKjVg6E3zPzQ2PMP7OVNNUG6_2v_JsL_4vsGnkDfUTGmihw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ecc376c1-af1b-8a76-67c2-5c23f7f9d47a@redhat.com>
Date: Mon, 30 Nov 2020 10:59:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAA8xKjVg6E3zPzQ2PMP7OVNNUG6_2v_JsL_4vsGnkDfUTGmihw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, P J P <ppandit@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/30/20 10:20 AM, Mauro Matteo Cascella wrote:
> Hello,
> 
> On Mon, Nov 30, 2020 at 3:36 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>>
>> On 2020/11/27 下午11:45, Philippe Mathieu-Daudé wrote:
>>> Do not allow qemu_send_packet*() and qemu_net_queue_send()
>>> functions to accept packets bigger then NET_BUFSIZE.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> ---
>>> We have to put a limit somewhere. NET_BUFSIZE is defined as:
>>>
>>>   /* Maximum GSO packet size (64k) plus plenty of room for
>>>    * the ethernet and virtio_net headers
>>>    */
>>>   #define NET_BUFSIZE (4096 + 65536)
>>>
>>> If we do want to accept bigger packets (i.e. multiple GSO packets
>>> in a IOV), we could use INT32_MAX as limit...
>>
>>
>> This looks like a complaint for:
>>
>> commit 25c01bd19d0e4b66f357618aeefda1ef7a41e21a
>> Author: Jason Wang <jasowang@redhat.com>
>> Date:   Tue Dec 4 11:53:43 2018 +0800
>>
>>      net: drop too large packet early
>>
>> which only fixes the iov version of the function.
>>
>> If you don't see any real bug, I suggest to merge the fix in next release.

Fine by me, I don't have access to the big picture.

> Following is the reference bug along with a proposed patch, although I
> guess the patch [2] is not strictly required once this patchset is
> merged.
> 
> [1] https://bugzilla.redhat.com/show_bug.cgi?id=1899722
> [2] https://lists.nongnu.org/archive/html/qemu-devel/2020-11/msg05935.html

I didn't noticed your patch. While it prevents this kind of
error on a particular device, it doesn't for the rest.



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68121334182
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 16:29:02 +0100 (CET)
Received: from localhost ([::1]:53068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK0lh-0003tm-73
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 10:29:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lK0ji-00037m-Rc
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 10:26:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lK0jf-0001bR-Tq
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 10:26:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615390013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6xW+/BbFmjm68kZvf09BXYs2gT/JTFXpj2Q2JbSoDZk=;
 b=ZQ//km3FqWSZ7ZVj44DSdZHs13sdY/aeLzwomv7E0MUVMhFLzP2qSJkZwr3Dz5XD7UEpjZ
 WHVTzDHSQNSLllV5hOH9enWwaLmVGR2O7EQNAamPvdQ0aEPdqyYihdixj6pIF3zaDDy2Nn
 re1UipQ6erEqi++aBvwyzUlNKjTgVXk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-h0OZic0BPi-sakWjL4-q4A-1; Wed, 10 Mar 2021 10:26:49 -0500
X-MC-Unique: h0OZic0BPi-sakWjL4-q4A-1
Received: by mail-wm1-f70.google.com with SMTP id s192so2800613wme.6
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 07:26:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6xW+/BbFmjm68kZvf09BXYs2gT/JTFXpj2Q2JbSoDZk=;
 b=WFapFGXhoq992ZgCWtjGxHRZZR0cD22iWi+4lIPO2vHB7TT5pduZgk5KWJc07WE68D
 JuWd3gShxaLqFDgyECGL1NkQ/97RQR9kf5kfOkVyOcY9cMx0FmsAERdp/kC7UqEZsc8Z
 fvYBJY0WqQsHYY7lChxryEJb65puD/f4+arzzgTNP8tMYnCWLvMNhDtEokj3YNhAyQ6D
 KW/eCn+ed97B4dqlh7eLrsO2VklqGHGzYfiH31wHxIBz9Wk5niJenIhpWopbszPnmWQV
 yjqEJ0PVLwic3NXcAW3hKLPIYcOX8q3P8h0SbP7+xsmDHAO8cWPvUeusRcZ0IqQn9sfi
 kBdA==
X-Gm-Message-State: AOAM5315usjxba4yuZFCJ++gS1yzzcOdn7H+JJKdrsvRz37P6+WtKLK/
 WV5nei+K8ZBp7FkKmwpiUb6BmdbNui0vi5BheWHV7V+VQ5S8J539p6Qc3XF8mQflnKA6gnLSfD3
 19TAdrfDfXXeowug=
X-Received: by 2002:a05:600c:4ba2:: with SMTP id
 e34mr3866314wmp.121.1615390008141; 
 Wed, 10 Mar 2021 07:26:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxfE4t5N8iNExNOj5v7VYu9sQsLGVGFJQlcVISLq9zkrFXyqm/PAohO2ld8BmpB07tTSjoLJw==
X-Received: by 2002:a05:600c:4ba2:: with SMTP id
 e34mr3866299wmp.121.1615390007990; 
 Wed, 10 Mar 2021 07:26:47 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f22sm9267220wmc.33.2021.03.10.07.26.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 07:26:47 -0800 (PST)
Subject: Re: [PATCH v2] usb: Un-deprecate -usbdevice (except for -usbdevice
 audio which gets removed)
To: Samuel Thibault <samuel.thibault@gnu.org>,
 Markus Armbruster <armbru@redhat.com>
References: <20210309165035.967853-1-thuth@redhat.com>
 <87y2ev2lmr.fsf@dusky.pond.sub.org> <20210310150209.nie5fifqi5od3r5u@begin>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5139e2b3-447e-2373-71b7-6fb5af020867@redhat.com>
Date: Wed, 10 Mar 2021 16:26:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210310150209.nie5fifqi5od3r5u@begin>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/03/21 16:02, Samuel Thibault wrote:
>>> When trying to remove the -usbdevice option, there were complaints that
>>> "-usbdevice braille" is still a very useful shortcut for some people.
>> Pointer?  I missed it.
> 
> For instance
> https://lists.nongnu.org/archive/html/qemu-devel/2018-01/msg00693.html

In one sentence: "Braille is worth a special case because a subset of 
our user base (blind people) will use it 100% of the time, plus it is 
not supported by libvirt and hence virt-manager".

Paolo



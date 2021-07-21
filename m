Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 271C93D0E15
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 13:51:42 +0200 (CEST)
Received: from localhost ([::1]:57582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6AlJ-0005Sz-6f
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 07:51:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m6AkV-0004iR-FB
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 07:50:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m6AkS-0002JR-Oc
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 07:50:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626868247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B3wOiRB32mGsq2Rk/o5t0dXmE2bx2xXqettT2QxtdOU=;
 b=g/jvmP4P9vwwvlD+yCDPWm9khJCDhS5Uv7xI5cG6HjPYQ5ccYSs0q473axuJ6ZhYSvXY1P
 W6WFyLhLui9VIeqFXVGXHnWTrRKGOF2mwpbbwNie6dOJL12CAM7yAS8yURWB6H558Dmu/r
 x5t4I1YHfzXIQdm48Y8xbDXQrv1rLA0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-nv8dzBRFOriveLXSHrPbYA-1; Wed, 21 Jul 2021 07:50:43 -0400
X-MC-Unique: nv8dzBRFOriveLXSHrPbYA-1
Received: by mail-ed1-f71.google.com with SMTP id
 e1-20020a0564021481b02903a66550f6f4so898336edv.21
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 04:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B3wOiRB32mGsq2Rk/o5t0dXmE2bx2xXqettT2QxtdOU=;
 b=uea1pond04/VsF5rIoOBJYk3gzKQzZj3Vw+oPbMpdmvejAkht/bwD5zw9jH+odQGAP
 ThyImP0kLV3vGWYSg/gvirr+laAvuh0SU1k59M9rTzlVR0SaL+zyfxEdsOB3G2+0ucOD
 1lBzrP0j30ibKUfTgQ7i22JMa/HlfR704kQrwiolhxcFUdDj7wLRuQg4WM1/vgifsUnD
 IDC2DHMd0C1u+94fpd4s20PUrinM6H1ZxD32JJRom5rzq5gB77UoI3ojsgrK2avXXUOm
 KBL7SXlAoZaN2CTMJR/xHyNegwVbS6iijcW252yHdx8SR5/fEijjV17c4WkXhULlWjE8
 4XlA==
X-Gm-Message-State: AOAM531L1eii3y2hga1Hw+S06tGYpXC+6Yc36h6u5u2nSvszFuLRkk9O
 wTgL4ZhIOZ3y5USbZIxI3SsXzlQrTxlpBF5F9VbtBoLiTRgf3sowvqwqC8fX0HCCwP0+R6WU8y5
 l8nWRToTHliINj/tGQQGnPJwdzwOwZ8ZbotEtKHSwjMs6vd3KfHMr5PhEVhTANQnpEJk=
X-Received: by 2002:aa7:dbc8:: with SMTP id v8mr46394697edt.242.1626868242327; 
 Wed, 21 Jul 2021 04:50:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybbLrXu0SU+oVPftVyRyw6/vW2VMoXUq3BKAY345UB5p88lQ4SmDHfObSgoiEqSY4zQFbQag==
X-Received: by 2002:aa7:dbc8:: with SMTP id v8mr46394680edt.242.1626868242169; 
 Wed, 21 Jul 2021 04:50:42 -0700 (PDT)
Received: from [192.168.10.118] ([93.56.169.140])
 by smtp.gmail.com with ESMTPSA id y4sm1891898edq.48.2021.07.21.04.50.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 04:50:41 -0700 (PDT)
Subject: Re: [PATCH 0/2] qapi/qom: use correct field name when getting/setting
 alias properties
To: Markus Armbruster <armbru@redhat.com>
References: <20210719104033.185109-1-pbonzini@redhat.com>
 <87czrddlqe.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4430dc1a-5938-f0da-dcd5-18f3565a485c@redhat.com>
Date: Wed, 21 Jul 2021 13:50:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87czrddlqe.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.117, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: imammedo@redhat.com, alex.williamson@redhat.com, eblake@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/07/21 17:54, Markus Armbruster wrote:
> First, let me describe what's wrong in my own words, because that's how
> I understand stuff.
> 
> [snip]

All correct.

> Next, the solution.  I get the idea of a wrapper visitor which gives you
> "pflash0" when you ask for "drive", but oh boy do I wish we could fix
> the bug with a lot less code.

Yeah, if QOM didn't use visitors and just went with QObject as the 
argument to getters/setters, all this wouldn't be needed.

That said, 1/3rd of this patch is tests, and visitors do have a hidden 
advantage: they give type checking for free.  So all in all I'm not sure 
it would be better, especially now that we're starting to get more 
benefit from them (e.g. with compound properties replacing 
special-purpose command line parsing code).

Paolo



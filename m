Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BC430057C
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 15:33:21 +0100 (CET)
Received: from localhost ([::1]:54022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2xV2-0006Sx-Hm
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 09:33:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2xSt-0005Kb-BN
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 09:31:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2xSl-0006tA-Dc
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 09:31:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611325856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XBrxOXugg1T6it7mduyBWKHK/3pKrn9ppinRsCTijoI=;
 b=JAI3tWM8ZrFliomZogqupIlLmi/yO6p+Yi0FksMzpHkzTjPsHGSyGCfZjeNDNmnjz7bki8
 aAoy5QDwfJpTQ+Z1dWp6KxZnf+YDYcOSU7CAeE8mq3Ib7ttARTrXImJDmvBQlyl26n/huA
 MwLEyOoZ/ivHw+LbR+IcG8a+Cu3wXpU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-P8_CnC_9NpG5a3Y7B_r1pA-1; Fri, 22 Jan 2021 09:30:55 -0500
X-MC-Unique: P8_CnC_9NpG5a3Y7B_r1pA-1
Received: by mail-wm1-f70.google.com with SMTP id 5so1927174wmq.0
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 06:30:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XBrxOXugg1T6it7mduyBWKHK/3pKrn9ppinRsCTijoI=;
 b=nJ3AUpqQkC6C/mrj0EuL6rsIi2GW03oUIwJTDUzNnBI9IEnY1rpR5NfmlmhKznnvqq
 MsbQKOLzxod65WBMnp2RXMDXsbGInndcHoPjgq2ytmaO/o/Snku3edmwQl60yswoOnR4
 f7uz9r1L/wj748pvAuzMQ2c5fwEfC4Pp7GrABpCL5X3wb2LE8AHodeiIHtnhS4zr5c49
 ybTaECOxZHJAQv4nIOr/5EFcKd/NYBFrYUUX/4uYmHeqCGggbPSYfK9DSJAYSkI8G+XI
 ekNs7jwBgBoO4tJjNa/mV9m4ymYM0kuHR+l4tuEWAPLwpJHcLXYZ9+NhEuI4yZ23FI0g
 uyfw==
X-Gm-Message-State: AOAM5300r4ybYWlj4FbId3enx3/LS9/mneOdVDX9zPsPX/puH9QQcxNx
 YzWI2An0DjSURE+pWyZwd2GZ3MNNACgLAq3f3I1wc6p5FDQ50yZd9A6sybbuMBiVtNZpq4UmecL
 tPwZ1rVm/ffrl6r2mlEL8cmsMQJSt5icjSm/TSBZmwj2au0HJdEaeRgp7YyhH3XtAnP0=
X-Received: by 2002:adf:e80d:: with SMTP id o13mr4782780wrm.293.1611325853621; 
 Fri, 22 Jan 2021 06:30:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx/3dDV0O8keikoaj922K97wJ21qEQJdPOYJ0q3ei9peUYofOMKtOk6PXQM+Vc5EXzjVFvwRw==
X-Received: by 2002:adf:e80d:: with SMTP id o13mr4782759wrm.293.1611325853418; 
 Fri, 22 Jan 2021 06:30:53 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id k9sm12495769wma.17.2021.01.22.06.30.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 06:30:52 -0800 (PST)
Subject: Re: [PATCH 07/25] keyval: introduce keyval_parse_into
To: Markus Armbruster <armbru@redhat.com>
References: <20210118163113.780171-1-pbonzini@redhat.com>
 <20210118163113.780171-8-pbonzini@redhat.com>
 <87o8hh2grs.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d41bc3aa-5484-3b04-8158-079ca0e6866c@redhat.com>
Date: Fri, 22 Jan 2021 15:30:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87o8hh2grs.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.221, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/01/21 15:22, Markus Armbruster wrote:
>> + * On success, return @dict, now filled with the parsed keys and values.
>>    * On failure, store an error through @errp and return NULL.
> May @dict be modified then?

Yes, it can.  Good point.

Paolo



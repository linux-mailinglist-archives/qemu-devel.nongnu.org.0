Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9D12BAA27
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 13:33:10 +0100 (CET)
Received: from localhost ([::1]:39520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg5bB-0002PB-J4
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 07:33:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kg5ZE-0001FZ-B6
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 07:31:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kg5Yy-0004k4-DG
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 07:31:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605875447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HaBUDPWDZCQqiTiaxPZ7MeL8GZdJlN38kOmRXPDYzTI=;
 b=h7ETRDd/QWs57iu6TsSauT+Gaz6loz4UJlA+E5CXxO5qKvEccAaiVhHMCrCAhy60slwUyr
 AOUDLvAUN22RxOFxHJqOZAHtMnrgDtvX/DFC0FaVuxI71tgD473KXr2stzyt7L5wy2bZiS
 Oko4HIpQjW2o8GBiGtMZi93AdzEj16o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-1L5Sqv96O_i-ObtOo_v0hw-1; Fri, 20 Nov 2020 07:30:44 -0500
X-MC-Unique: 1L5Sqv96O_i-ObtOo_v0hw-1
Received: by mail-wm1-f70.google.com with SMTP id k128so3980285wme.7
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 04:30:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HaBUDPWDZCQqiTiaxPZ7MeL8GZdJlN38kOmRXPDYzTI=;
 b=XwqrnISgU2BePrVdksvxx+gj047x9pwRHKdhT4ujvZlkyVkGBE9lgg6JEDYnurUktJ
 D5xhuFsaCE07bRr7BIqxgGL9R/hgCYhZWOs3BEppsG8niXLQzHInn7tQA04zmuRLLeIh
 YIQYWPunZDewhME3/XOMxdLbYzdqGMZlhLsLlRFQyLvdi3niaiNjZdcaJJjJh+7vPxFb
 vbZXpNFjXX/On3iKkbgKUlq3tnyiLxrPf5EyqnCOhXUWr5P4y7qKc7aXpgMn46QUGowv
 faMdmwkcq7EpCp38exzOPenmZOv0CAh4stmpdVTffxCNQfeQ1rqbzJRHZoFFbLrNFu+Z
 wEAA==
X-Gm-Message-State: AOAM530Q1pza88LiYw4du+H99BDERAHEb7ghoCbSMvM8g+EetJWHoyOl
 p1ZSnriJt7m6OhlClqrtloJTD3mV6paDkYh9WNHIlg/IivwPdRsy/jJFW2Bf2S61eoyhbdQwxCI
 Vm6IUbP8m8xPPyotCQ07B2DBN/HcXd33dDI1GFCceAmV2RRhatOCzgGPzCozQk9vd
X-Received: by 2002:adf:e80b:: with SMTP id o11mr15801929wrm.409.1605875443466; 
 Fri, 20 Nov 2020 04:30:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyCtbH+My+eFildFRnsbef7WzistXq/yZfigEccajJlIWoous1MLG5kEILyCxmmIyEB0ESY9A==
X-Received: by 2002:adf:e80b:: with SMTP id o11mr15801902wrm.409.1605875443163; 
 Fri, 20 Nov 2020 04:30:43 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id f18sm4690128wru.42.2020.11.20.04.30.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 04:30:42 -0800 (PST)
Subject: Re: [PATCH 4/4] [broken] meson: try link tracepoints to module
To: Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20201119084448.24397-1-kraxel@redhat.com>
 <20201119084448.24397-5-kraxel@redhat.com>
 <20201119110316.GG701869@stefanha-x1.localdomain>
 <20201119112323.3rcfmee2jm3uw3ym@sirius.home.kraxel.org>
 <20201119115514.GA838600@stefanha-x1.localdomain>
 <20201120102355.mayek7z4ud5orqme@sirius.home.kraxel.org>
 <20201120112539.bsyjsfrqxz4ffo4r@sirius.home.kraxel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8102f2fa-1902-050d-d6c4-cd2bc80c7cb5@redhat.com>
Date: Fri, 20 Nov 2020 13:30:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201120112539.bsyjsfrqxz4ffo4r@sirius.home.kraxel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/20/20 12:25 PM, Gerd Hoffmann wrote:
>   Hi,
> 
>> Guess I'll go dig into the meson documentation, this looks more like a
>> build system than a tracing problem to me.
> 
> Looking at https://mesonbuild.com/Syntax.html ...
> 
> "all objects are immutable".
> 
> So "var2 = var1" creates a copy not a reference I guess?
> 
> Which implies that ...
> 
> 	foo_ss.add(something)
> 
> ... is different from ...
> 
> 	bar_ss = foo_ss
> 	bar_ss.add(something)
> 
> ... which in turn explains why the patch doesn't work at all.
> 
> Now I'm wondering how I can make trace/meson.build add the trace
> objects to the module source sets if I can't pass around references
> to the module source sets?
> 
> Paolo?  Any hints how to tackle this the meson way?

Maybe managing it all in the main meson.build, like the
e28ab096bf8..da33fc09873 cleanup?
("Move the creation of the library to the main meson.build")

> 
> thanks,
>   Gerd
> 
> 



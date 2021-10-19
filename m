Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FDC433470
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 13:11:21 +0200 (CEST)
Received: from localhost ([::1]:56938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcn1c-0000CM-Ue
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 07:11:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mcmzq-00077Z-M6
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:09:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mcmzm-0004dG-9b
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:09:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634641764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u3CsX8T3qEYZQyF3xI6T7fQ16w3pF9wnmJbWY2Smv3U=;
 b=FG/+Bx8AmpRkC/tYS8fxEAUWkwhLxTeH+bwtzvAIr/GU4bv+dtfD/k1c2SNUjFrueTUAkl
 0EIzZRI2s0SEG/t2Gtg5If4j8JxPr5wx03zVT8WNyb8tL4HsIhz8p6ExrFahLO9dsUZq/Y
 0erTvx2fafj0hGtZjyn0e15aXcP6Xy4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-Mfv0apBxMqiL8KdaJd_u8Q-1; Tue, 19 Oct 2021 07:09:23 -0400
X-MC-Unique: Mfv0apBxMqiL8KdaJd_u8Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 s26-20020a7bc39a000000b0030d9db6c428so2474389wmj.6
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 04:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=u3CsX8T3qEYZQyF3xI6T7fQ16w3pF9wnmJbWY2Smv3U=;
 b=ikkvLBcJBcT4q548WF8FPqsbYrXBZUIRFrERC0sHnbbekRF7VPhBruG2t9tnCnlRNj
 o/Iv9s5zcKUbjPPX8tBwveU/vnhi/Ka/2RoxswPM9HR86aamYVzILvPidBjFqcn59rct
 2W299+yMmfqfwIfkczQmjBDYZSEz23pQdKAD9EqGpdjxogq4YOX5MZM12lncVzwxEl+r
 0XJI/ohnuCo/zs/cHwgmdydltIL7Gca4jRyiRymL2ojsGK56VKo/4C9s5hPHzp3uuU1W
 lzbi8Qp9B5/JBUVQ7EuOtOKyTUyHPkus1yPVXS6pzmgjswTmr6Fi/HmPPkBcb8yRNnfd
 n4RQ==
X-Gm-Message-State: AOAM531ty5UvRDt4aXdNof2lZhFALyNkRJpnm0Z5NA2LFPdvC7WXMFmx
 jqZrIQz63bMwXnUU0n+s/9SZyio56WUWNN2SPlRp0SUBWElJTH2wmldw0NeIqn7WYgiF9Ub/Xgq
 t8ZcFyDcpXfv1yUQ=
X-Received: by 2002:a05:600c:4305:: with SMTP id
 p5mr5242555wme.185.1634641762622; 
 Tue, 19 Oct 2021 04:09:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyteFgNmRHy85Nuz+p8H08zOMufE4QGRhWjygS6YTDm6DYyI+mjabmB0eI3kARX/8AOktqmKw==
X-Received: by 2002:a05:600c:4305:: with SMTP id
 p5mr5242432wme.185.1634641761296; 
 Tue, 19 Oct 2021 04:09:21 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:8e02:b072:96b1:56d0?
 ([2001:b07:6468:f312:8e02:b072:96b1:56d0])
 by smtp.gmail.com with ESMTPSA id f20sm2190045wmq.38.2021.10.19.04.09.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 04:09:20 -0700 (PDT)
Message-ID: <0a36e753-7750-17d3-f1ba-39e27cf16371@redhat.com>
Date: Tue, 19 Oct 2021 13:09:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] po: update turkish translation
To: Laurent Vivier <laurent@vivier.eu>, =?UTF-8?Q?O=c4=9fuz_Ersen?=
 <oguzersen@protonmail.com>
References: <lDpmNUjNrVETJ2QoHoYmSoRvKoEIVFbF4IZAa1R5PVzqPCTh7nmV_ERHQlgYtNJN1Ppagtvelbo4uhSihEd5bSqIxCvGQchEWVpP-ofn2kw=@protonmail.com>
 <57904976-7779-7519-f1e4-f7e800c1145f@vivier.eu>
 <164d5ec6-b29a-eb8a-9bce-3b690039522e@redhat.com>
 <d87ba143-9430-c4ec-ba81-f975b7e8067b@vivier.eu>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <d87ba143-9430-c4ec-ba81-f975b7e8067b@vivier.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/10/21 13:07, Laurent Vivier wrote:
>> Can you squash this in the commit in your trivial-patches branch?
> mmhhh, there is also "_Kapat"... and there is no "Copy" menuentry in GUI,
> 
> So perhaps I should only remove the "_" from "Kopyala"

_Kapat is in the Machine menu, and Copy is only there if you have 
CONFIG_VTE.

Paolo



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D70EC42669A
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 11:21:18 +0200 (CEST)
Received: from localhost ([::1]:58640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYm45-0004Ul-5j
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 05:21:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYm2S-0003mP-IK
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 05:19:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYm2N-0006eJ-NH
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 05:19:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633684770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IZoOLLnlmPUwQARVVM2PiBwH9YCbVCbzXE+h7KqAnzc=;
 b=bKPFTeOPsNqv28Bfuwr7WO13k0lIpXNl31gPb2lq2STcB75MgOwNMF5t6i7ycq9Br2SC/d
 SflTUzUf5I+wBsFM51QE6wdI1kNLS/anBSgi4GUtP9GG9zUutQVGnLxbkY25iArUHPugbh
 NntEyD8lF5FMJ/0+PlQfU4MoYnmpzuQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49--660mEpONMSQ6yUy5A56eg-1; Fri, 08 Oct 2021 05:19:27 -0400
X-MC-Unique: -660mEpONMSQ6yUy5A56eg-1
Received: by mail-ed1-f70.google.com with SMTP id
 l10-20020a056402230a00b003db6977b694so255182eda.23
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 02:19:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IZoOLLnlmPUwQARVVM2PiBwH9YCbVCbzXE+h7KqAnzc=;
 b=MpOAf23Mf97XZLhWVYwTU7KqBhgd2jhWUf2cEQo3BUldHhlrVWPHm8yzrQd23Te0LM
 8c43acBW7eGfc5pd89fDt+PdxMktj72WcfWT3BmGox6dOfnBvDc+v7Rkougs2hSAvK+A
 nTZ+2/PNVD6+aDrig5N+1p32XVvjXGWa2UvGtcIpU2exJumTS7tu4J3HNGRGiX292QR9
 aL0Aq3rfhDHtIFatlYQ8RfOiKd334hjZ0gRoB2FB4OU52KxfepMOqhf3pohQduXywAov
 7F15anHD9GAMxmzPBPjmmTy4gKR8iix0UucP1h53R34IPqtIEmyj4dIhjODRrYLZSk2J
 2PKQ==
X-Gm-Message-State: AOAM531Y6qmRM5b4AzLn3n7oPFrL8H+7jOhAFUv27MvOpNbARBAgN58i
 eADdYnRp+10r+AY4uju/liIZkiJK4fvj5tOUpQZrscQyWXy4xO52SR0E9F/KGuKNiVYuQpt1iYZ
 5tRM3Y7iIo9xlnwc=
X-Received: by 2002:a17:906:4fd6:: with SMTP id
 i22mr2800887ejw.92.1633684766731; 
 Fri, 08 Oct 2021 02:19:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCmWqJ/f0mbCz78ECQFbDSDDX3IUIrnG6DMumgwykg1Te/c00XBhyVc5YlibfnjoodVnp47A==
X-Received: by 2002:a17:906:4fd6:: with SMTP id
 i22mr2800871ejw.92.1633684766563; 
 Fri, 08 Oct 2021 02:19:26 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ee13sm766045edb.14.2021.10.08.02.19.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 02:19:26 -0700 (PDT)
Message-ID: <12144fd8-e58d-78f6-4cd9-7010bbcd754a@redhat.com>
Date: Fri, 8 Oct 2021 11:19:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 01/24] configure: remove --oss-lib
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <20211007130630.632028-1-pbonzini@redhat.com>
 <20211007130630.632028-2-pbonzini@redhat.com>
 <CAJ+F1C+j8EqmNZUCZ5DdNwMp+nj_1ZV6fAfV0q0x2QB7iXyjAg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAJ+F1C+j8EqmNZUCZ5DdNwMp+nj_1ZV6fAfV0q0x2QB7iXyjAg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 QEMU <qemu-devel@nongnu.org>, Gerd Hoffman <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/10/21 22:42, Marc-André Lureau wrote:
> 
>     Cc: Gerd Hoffman <kraxel@redhat.com <mailto:kraxel@redhat.com>>
>     Cc: Volker Rümelin <vr_qemu@t-online.de <mailto:vr_qemu@t-online.de>>
>     Signed-off-by: Paolo Bonzini <pbonzini@redhat.com
>     <mailto:pbonzini@redhat.com>>
> 
> Not just NetBSD. You could --audio-drv-list=oss and --oss-lib= to 
> specify the library to link with.

Yes, but the question is who would use --oss-lib.  And secondarily, if 
the answer is not "no one", whether they would be accomodated better by 
a change to QEMU itself.

For example OpenBSD support was removed in 2013:

     Remove OSS support for OpenBSD

     Remove the OSS support for OpenBSD. The OSS API has not been usable
     for quite some time.

     Signed-off-by: Brad Smith <brad@comstyle.com>
     Reviewed-by: Laszlo Ersek <lersek@redhat.com>
     Reviewed-by: Andreas Färber <afaerber@suse.de>
     Signed-off-by: Blue Swirl <blauwirbel@gmail.com>

However, if it came back from the dead, one could just

    if not cc.has_header('sys/soundcard.h')
      # not found
-  elif targetos == 'netbsd'
+  elif targetos in ['netbsd', 'openbsd']
      oss = cc.find_library('ossaudio', required: get_option('oss'),
                            kwargs: static_kwargs)
    else

instead of using something like --oss-lib.

Paolo



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3D917184B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 14:11:25 +0100 (CET)
Received: from localhost ([::1]:59312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7Iwm-0006do-Hd
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 08:11:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53664)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1j7IvO-0005Zu-KN
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 08:09:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1j7IvN-0003De-OS
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 08:09:58 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:49822
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1j7IvN-0003DE-Jm
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 08:09:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582808997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w+SYiYo3C/3fhbX4vTYUURrXhXNnLeajms940O5qSpc=;
 b=aa+kah2F2I5LpiHVUYzSc/ADr4w3/P4PPwbV/wpiDxA9waG36qiZid7CYqA3l2In3KCcIa
 wBysJOLPlzHg9Byei4A02/TjV6OLpDUL9fa1+gjrXHxWosxBHlufQVXqW174LJpt4abSmP
 px+15vsQg1k7dkrI0coNo9bHhgkJNdk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-CdPEFyoXOS6ud7JWt89O-Q-1; Thu, 27 Feb 2020 08:09:45 -0500
X-MC-Unique: CdPEFyoXOS6ud7JWt89O-Q-1
Received: by mail-wm1-f70.google.com with SMTP id y18so939739wmi.1
 for <qemu-devel@nongnu.org>; Thu, 27 Feb 2020 05:09:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w+SYiYo3C/3fhbX4vTYUURrXhXNnLeajms940O5qSpc=;
 b=EAVizlcCYKAYPLeozY8JCbIJXG2JgCV4slGdIFq9sJHmGNVvEW8mJwvTPP2TV5RRoo
 sTll7Fhd0fo5ppILyaMGmygnNFALiaZprvoozQ457WfYBho8D+DfQcrCcL/Dz7HOQLVt
 pFZs2P29bRFsjUWQikFHZ6D4OP2RwxF+Qd5cEq8yjZBDkqKrrmfZMT4IMvvCMhT1acW4
 gQoNpjQqXl1dURebqxpL7iTkEXfWpx4N0r4Jb2SEDp9a5av/iZ/gyKoT8f+3JRuiM5yf
 n7o0lNwyDgGQo3n4bGzrLaaqRfkqQ/y+1IQ/TQyeg3s5jk4TI9PLDFQ2CCQ/vqympT2S
 H70Q==
X-Gm-Message-State: APjAAAVPgj/e/2yllOY42/DAi/TE+5buLkFSGOcUWsjJ7JTcNRvU+jtt
 IzacUrKUX+UkBaLlsNIdtCsqyiI1su7UcBxagSWtiiBxSQQs8pv2WYIjQJGBapQbei+ZFm2yEcK
 9GOtiJsGPklEuaB4=
X-Received: by 2002:a7b:cab1:: with SMTP id r17mr5241673wml.116.1582808983828; 
 Thu, 27 Feb 2020 05:09:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqxOQ6J/E20la8FsPyYovCpg/ltZqbTtdHaP2xkqKmcvVaaY/jERjR0ypOVJoNYfDAcouhA59g==
X-Received: by 2002:a7b:cab1:: with SMTP id r17mr5241659wml.116.1582808983589; 
 Thu, 27 Feb 2020 05:09:43 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:30cb:d037:e500:2b47?
 ([2001:b07:6468:f312:30cb:d037:e500:2b47])
 by smtp.gmail.com with ESMTPSA id h2sm7995289wrt.45.2020.02.27.05.09.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2020 05:09:43 -0800 (PST)
Subject: Re: [PATCH 05/18] qemu-doc: split qemu-doc.texi in multiple files
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200226113034.6741-1-pbonzini@redhat.com>
 <20200226113034.6741-6-pbonzini@redhat.com>
 <CAFEAcA9T=1iMJJSOK6YEBoN84Bq0uMqAbHdCFS976uJgtxZf=g@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <06219f12-8ea6-0c4c-da3c-24c0306fce3f@redhat.com>
Date: Thu, 27 Feb 2020 14:09:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9T=1iMJJSOK6YEBoN84Bq0uMqAbHdCFS976uJgtxZf=g@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/02/20 12:38, Peter Maydell wrote:
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> (used git's colorMoved feature to check nothing accidentally
> changed during the reshuffle and eyeballed the table of
> contents in the generated HTML to confirm it's all still
> there and in the same order.)

For what it's worth, "make qemu-doc.info" is very helpful in finding
sections that are placed at the wrong level, because it forces you to
sync @menu...@end menu with @chapter/@section headings.

Paolo



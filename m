Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7338F452E03
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 10:31:51 +0100 (CET)
Received: from localhost ([::1]:50316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmuog-0006WD-9z
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 04:31:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mmumc-0005GW-1l
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 04:29:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mmumZ-00011C-6e
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 04:29:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637054978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RiGgbHbtyDU1LYud1ya1edMz86nitvomxOmhEM7kc20=;
 b=Bdx8QdJFzxh+crC18ZtuBtSEeYt4EnpUIVDCG7gdkXx8KsOaTDBMbX0Aj4wB8RNMRJoFJ7
 r5v5p0bVgdmo3TPp3PLFgzJKAiWM2jUlp0GG+lXmnxc3jgseOKAbovyMo7ga/cRSqLcMg7
 vPCnHtL13lK87vYGajr+L+YyvMtBgRo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-A8NbBsDMNh2xaLauq3913Q-1; Tue, 16 Nov 2021 04:29:34 -0500
X-MC-Unique: A8NbBsDMNh2xaLauq3913Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC91B80A5CD;
 Tue, 16 Nov 2021 09:29:33 +0000 (UTC)
Received: from [10.39.192.245] (unknown [10.39.192.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 05BB25BAF0;
 Tue, 16 Nov 2021 09:29:29 +0000 (UTC)
Message-ID: <a5101180-3f28-d6a4-8ee2-b98ff4623e36@redhat.com>
Date: Tue, 16 Nov 2021 10:29:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PULL 21/26] configure, meson: move more compiler checks to Meson
To: Peter Maydell <peter.maydell@linaro.org>
References: <20211014162938.430211-1-pbonzini@redhat.com>
 <20211014162938.430211-22-pbonzini@redhat.com>
 <CAFEAcA8dxLqx4uXGRmhdWmP2aRXChk6gqO3t_RY54UVMHPEjWQ@mail.gmail.com>
 <CAFEAcA9HoX9riUjU_N6erkLu0r5gRawDTKSJgwjNb+2Mcn+0=g@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA9HoX9riUjU_N6erkLu0r5gRawDTKSJgwjNb+2Mcn+0=g@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.446, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/15/21 17:42, Peter Maydell wrote:
>> Hi -- I've just noticed that this change breaks compilation for me,
>> because this test incorrectly fails to set CONFIG_IOVEC on a system
>> where the header defines 'struct iovec'. This seems to be because
>> "struct iovec" isn't a valid thing to test with has_header_symbol,
>> because it provokes a compiler error from clang.
> https://github.com/mesonbuild/meson/issues/1975  says that for gcc
> it's actually going to be wrong the other way (always setting CONFIG_IOVEC
> whether the system header has the struct or not), because "struct wombat;"
> is syntactically OK as a*declaration*, not a use.
> 
> Maybe we can work around this by testing for the presence of something else,
> eg IOV_MAX or the readv or writev functions ?

It can just use cc.has_type.

Paolo



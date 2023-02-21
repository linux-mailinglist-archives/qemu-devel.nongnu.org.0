Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1801369DD8A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 11:05:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUPVh-0006Ny-AE; Tue, 21 Feb 2023 05:04:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pUPVf-0006N5-Ii
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 05:04:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pUPVc-0000kR-Tf
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 05:04:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676973866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dxm85y5xVyedPy18kRG7+gwmjwt5HmGfgZHePGEhj4U=;
 b=az/LpSw2IT1uzEnzeH9e65GbjjjehVhe8NZfeHbuoci7Z4E+Uo7Z35DKJcr4u0Su5m3TO+
 ce4LnkgKOFvX2WAqAmQJ6kFB6Ci9E5qLNh3RvEOjvRmdKOny81cRCrNKg9IHYt4c8ZiMgk
 ZSGgNnz/5vVWxKE+4NVpKEWRkLDiHUU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-639-LgjCRWLGMUuq3a32pBTw2g-1; Tue, 21 Feb 2023 05:04:25 -0500
X-MC-Unique: LgjCRWLGMUuq3a32pBTw2g-1
Received: by mail-wm1-f69.google.com with SMTP id
 l20-20020a05600c1d1400b003e10d3e1c23so1764727wms.1
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 02:04:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Dxm85y5xVyedPy18kRG7+gwmjwt5HmGfgZHePGEhj4U=;
 b=EeoBTpgpDQrE6xZ+peBOAQ2TUkU/6qeNHu2RaC/mXxBLK9gjA4jxeq4OQIrinIWXdZ
 K0uuE/8LaGJImO2HsXSKWAelgKh7odgIRhK2+7wKj5tt0JbXwgLj17k3cOERthTuDLmK
 jye+8bCCVV9oGuOK+UA0n02x/zzUT+ygTwYeeIRAWLYe5p1kUbRnYUoWfLUxxIsTvAVL
 IIhN28jrbCNi0yigrC+AxfqO0BBEYmoZxIRuuxHj2AHuHiLVD1OEHC3J+OBq9laWfuSi
 bg/Wiz2dS877NQ1JBMtlYZN/P3KpJAVd9a4tw3JAixhPCQ2q63juTYP0UJxbnlD1eD36
 tC7Q==
X-Gm-Message-State: AO0yUKVRFaSvwFK/Ryj6vGt0o94lDuW4w1pdJ6kA/BT94vb9qcy1aRzO
 Y6vJ76AT3JxuXo1eCFzGXiDi+2CiJIVEijd3cyEMUsWaOR2trKh4MkHjMgNcnevF4iDDg0orjz9
 u8Jh805jo+a67qH0=
X-Received: by 2002:a05:6000:10c9:b0:2c5:52f5:c63b with SMTP id
 b9-20020a05600010c900b002c552f5c63bmr3552864wrx.11.1676973863917; 
 Tue, 21 Feb 2023 02:04:23 -0800 (PST)
X-Google-Smtp-Source: AK7set/1nAqUAaKWOLn220SeBmHLf/hbhTtkJug/sBJtVu4fYocF03u4Q4NXiK+aOvbgC3YsI7cI4Q==
X-Received: by 2002:a05:6000:10c9:b0:2c5:52f5:c63b with SMTP id
 b9-20020a05600010c900b002c552f5c63bmr3552828wrx.11.1676973863675; 
 Tue, 21 Feb 2023 02:04:23 -0800 (PST)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 x17-20020adff651000000b002c563b124basm4223543wrp.103.2023.02.21.02.04.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 02:04:23 -0800 (PST)
Message-ID: <2f29e811-6fc8-7e5f-0ce8-49a409348d6e@redhat.com>
Date: Tue, 21 Feb 2023 11:04:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 05/14] tests: make fp-test less chatty when running
 from test suite
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Bandan Das <bsd@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, qemu-block@nongnu.org,
 Beraldo Leal <bleal@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-arm@nongnu.org, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Alexander Bulekov
 <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20230221094558.2864616-1-alex.bennee@linaro.org>
 <20230221094558.2864616-6-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230221094558.2864616-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 21/02/2023 10.45, Alex Bennée wrote:
> As we like to run tests under CI with V=1 flags the softfloat tests
> can add up to a fair amount of extra log lines. With an update to the
> testfloat library we can now call fp-test with the -q flag and reduce
> the output to a terse one line per function tested.
> 
>    make check-softfloat V=1 | wc -l
>    759
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/fp/fp-test.c            | 19 ++++++++++++++-----
>   tests/fp/berkeley-testfloat-3 |  2 +-
>   tests/fp/meson.build          |  2 +-
>   3 files changed, 16 insertions(+), 7 deletions(-)

FWIW, the testfloat counterpart can be seen here:

https://gitlab.com/qemu-project/berkeley-testfloat-3/-/commit/40619cbb3bf32872df8c53cc457039229428a263

Thanks for tackling this!

Reviewed-by: Thomas Huth <thuth@redhat.com>



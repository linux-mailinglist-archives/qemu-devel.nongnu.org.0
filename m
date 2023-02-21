Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B63069DE49
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 11:57:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUQKA-0007rp-V8; Tue, 21 Feb 2023 05:56:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pUQK5-0007om-Ia
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 05:56:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pUQK3-00048r-Hi
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 05:56:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676976994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RUy2vNlZo5xe12js8pkQZQ6aHs7wr2RYdU2j7igV2aQ=;
 b=GFNsPjiAcl9yGoJJnd0Zi7/pdOo5ZvtqXbRLXwxO/CXizz9/F+NkU3ictfkHoyWcxF4ns8
 uged9UFH2nRr6CVa7tZ94EZAENqevyHB6CV3uGNKet8tMD4PW/lm9/XJrPF9AnnyubW3bG
 k8Ieye96Bt1E4piWklobhZC/L0XYQz8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-523-NFVIIvCQMPGbOQhM8d2RMg-1; Tue, 21 Feb 2023 05:56:32 -0500
X-MC-Unique: NFVIIvCQMPGbOQhM8d2RMg-1
Received: by mail-wm1-f70.google.com with SMTP id
 c7-20020a7bc847000000b003e00be23a70so1845969wml.2
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 02:56:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RUy2vNlZo5xe12js8pkQZQ6aHs7wr2RYdU2j7igV2aQ=;
 b=OlKzFwk7SUufiPSkfNAbiykRb9zQgQACI27LvH2pU2Fnb9Nl0unfN8qwo3fDhkqw2q
 /6j5gbj2Ldu+TFl2tDE1ciLM7j3+h8X5hXxB324GNJA8zPtoqXQcgPpEHjhhZq4FPX/7
 G3X9nGZiF5Z1WpotCIa2VHuO7sn2JLRlMKS9MWBU4Wened2owEyN+4t7L5LvfVPMTr0s
 qReqiGriDdjgo/D7V/Bxzn5SXwCGWmsC3UvsqFSIg+vr0ET9qw0JemN5oA0iZoz6nY4b
 r1MoYaNTWGPeRxYfMbCt/zVYRRPdma1laZw8eXjrL2BDmxCx2KNbSIhl40kKlYtoRkiP
 i8BA==
X-Gm-Message-State: AO0yUKW+1oxJNUTZjLT4dMLRpWrxbt6DPRQ89odfxuzZIXriX/BE8XC4
 yRIzXiBIVua54tPXgFLC4vPracz6tv3+lkr6dLzqddOPljXsb6+Hyoza960Ns1Evvx3OWbbRi0z
 NTTRbJ/YVEWExUt0=
X-Received: by 2002:adf:df0d:0:b0:2c6:b7e:e4c0 with SMTP id
 y13-20020adfdf0d000000b002c60b7ee4c0mr2943897wrl.28.1676976991436; 
 Tue, 21 Feb 2023 02:56:31 -0800 (PST)
X-Google-Smtp-Source: AK7set/FernaeY9IQRUe+TvSnqQzqKKsfFdWdrkKGAPoWXK24aG8xhnuGBXSfZr6wBTaVPr8dRzMyg==
X-Received: by 2002:adf:df0d:0:b0:2c6:b7e:e4c0 with SMTP id
 y13-20020adfdf0d000000b002c60b7ee4c0mr2943869wrl.28.1676976991185; 
 Tue, 21 Feb 2023 02:56:31 -0800 (PST)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a5d6991000000b002c54911f50bsm4849517wru.84.2023.02.21.02.56.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 02:56:30 -0800 (PST)
Message-ID: <6b363773-5797-ccb8-1089-0bb924705126@redhat.com>
Date: Tue, 21 Feb 2023 11:56:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 09/14] testing: update ubuntu2004 to ubuntu2204
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
 <20230221094558.2864616-10-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230221094558.2864616-10-alex.bennee@linaro.org>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> The 22.04 LTS release has been out for almost a year now so its time
> to update all the remaining images to the current LTS. We can also
> drop some hacks we need for older clang TSAN support.
> 
> We will keep the ubuntu2004 container around for those who wish to
> test builds on the currently still supported baseline.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: John Snow <jsnow@redhat.com>

Reviewed-by: Thomas Huth <thuth@redhat.com>



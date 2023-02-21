Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A450D69DD96
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 11:11:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUPcG-0001as-9e; Tue, 21 Feb 2023 05:11:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pUPcB-0001Ya-84
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 05:11:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pUPc8-000243-Ay
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 05:11:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676974271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2YdYK4E8dfImOWaZXVXYI5dpFmqmpKsIQj1oVojEGUY=;
 b=TSZDStZqakOc0Vp9xugZrCQjdezV5y2J+sV0dt05eEtYmLJwrWZee0ziFd6PIi81ZG2pDN
 Hfk8zCQ/68SsIQKm1bbYmG0rex0cTAjnnAcL45XcNlW129GYGSryD6/RsMmGRMkBgEh9bJ
 M1Cw1v7OU91+tOWsD8R2/hPbh7GCFvE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-460-P9Sa204qNm-Q-f2zk8CduA-1; Tue, 21 Feb 2023 05:11:10 -0500
X-MC-Unique: P9Sa204qNm-Q-f2zk8CduA-1
Received: by mail-wr1-f72.google.com with SMTP id
 1-20020a056000154100b002c54d9b8312so718727wry.5
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 02:11:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2YdYK4E8dfImOWaZXVXYI5dpFmqmpKsIQj1oVojEGUY=;
 b=uwHDAT9RuWAphomm24zpPWQc2EOMr9ExxZYBPiuXsgaGbn2auphQSwKiyplilGwQDt
 0q1pgF21gMUTtJQ6LTFZsAqf/i4IiOxh6u3nJeuaRGo2DBVb6GaCOaEVg5ZgZkLR6Jwg
 cHFkEotknKdV/L6bWnWfkHDvfgTtH/eG9OM9QxpbhslsjuwZC6Z1zhPG6UMharO9YDak
 da8DzW2slMFDOH9cqoy55ruoQNrmPI3fKggxjlI3oCwN0tnVFWeN//JEB7+LGvhKTIng
 vsxaY6R4eJdkw8WLL3AApHBMiMTiHG/AneBfE5zECyhZL1ZH1GKdXSRB8s5RgfjGFqMu
 tuyQ==
X-Gm-Message-State: AO0yUKVHNT9b3x2WGZOauvhb3C2gKowsc2dhgCnAt3TavdbAoNht0scm
 wK+Bjr/gwaGf6Kic38sISbePvre6e1m2/J8zFm/z7oQlIV1HjfW5pVy97IDGRoUw+JreYrvdKTb
 Y8ehwLsKsKxBOBDI=
X-Received: by 2002:a5d:4d4b:0:b0:2c5:5d15:4e25 with SMTP id
 a11-20020a5d4d4b000000b002c55d154e25mr4170958wru.16.1676974269308; 
 Tue, 21 Feb 2023 02:11:09 -0800 (PST)
X-Google-Smtp-Source: AK7set8+zD+aBMuo4sYUOuFp1C9TqhaRpUwcztiAMih+fS3JqTTBZcSdN10yUW+kMGq3OXoAiNoxwA==
X-Received: by 2002:a5d:4d4b:0:b0:2c5:5d15:4e25 with SMTP id
 a11-20020a5d4d4b000000b002c55d154e25mr4170922wru.16.1676974269063; 
 Tue, 21 Feb 2023 02:11:09 -0800 (PST)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a5d4710000000b002c3e3ee7d1asm8417179wrq.79.2023.02.21.02.11.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 02:11:08 -0800 (PST)
Message-ID: <5ca3c321-1e6a-a108-7031-60be2709abda@redhat.com>
Date: Tue, 21 Feb 2023 11:11:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 13/14] tests: ensure we export job results for some
 cross builds
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
 <20230221094558.2864616-14-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230221094558.2864616-14-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
> We do run tests on some cross builds. Provide a template to ensure we
> export the testlog to the build artefacts and report the test results
> via the junit.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>


Reviewed-by: Thomas Huth <thuth@redhat.com>



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C916A67C8
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 07:52:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXGJT-0000vl-VS; Wed, 01 Mar 2023 01:51:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pXGJQ-0000uv-O9
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 01:51:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pXGJM-0001gY-Ap
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 01:51:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677653495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ogcx5DhNbs0kPQsBcGT4fpTGR69uQde5lIC/j0vtRXE=;
 b=MFCn7ja6QRjL9+PLnonjXtulNMihe2CrWfzTST8yHynFBibsiMexNFIFaenzHYLlV+3bqM
 t6JDNqi8r6xV6ZGF++j4gs2DYbrlSMnPtXKoN6go/bpgAUIiOLXuNyovXYMzcGc0cF5PKi
 bOBD9MiVKuAabbByTAKgAW27Tqgn/RQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-277-IFDbmX4RN92HNXfhBRTAzw-1; Wed, 01 Mar 2023 01:51:34 -0500
X-MC-Unique: IFDbmX4RN92HNXfhBRTAzw-1
Received: by mail-wr1-f70.google.com with SMTP id
 l14-20020a5d526e000000b002cd851d79b2so1081184wrc.5
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 22:51:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ogcx5DhNbs0kPQsBcGT4fpTGR69uQde5lIC/j0vtRXE=;
 b=aHThNKL05gZenx8HkIhs+8Q/wBsw7CA2+NqSGtwsuqKegEUUmC2zhtiXUpcP+A0tCt
 wiZBPY+R89BEKe0/xNIpiuuJlm8IBrLaCFVKRRUjvne1jjjREnv6vm+Jp/qYxPy/fNZl
 yI7yw75HrXx8J5kgU/3QHHgqgcsCbxFREAw76dTxOz9/l87eWFkOQvjcklbQZwSUPyF7
 C+fT8NAO/s2HPcXKqhKDJIRVBIbj+7qNyJSEReunbhuOPbJjYA+skIQtzBx1b4oFHSc+
 BOc5GUlidS8arbVE4vDp5v5lOs6TeHIiWOvvrG+Zdw2xUGLzp1rvPjOawzbN5HLkPVBF
 10cQ==
X-Gm-Message-State: AO0yUKW3FslW6457Eq5v7qaSroB6EXFs3LaufcLwynkDnSL+1cJwm6FC
 Cu7+FNTxnZy010jiUtRZl5IsGhT2zYEe3ck543/7HmVaV9V+wFWvW3eZMCDenGwzfqTWE2dxYX8
 5iRKJLujuT1yp5rY=
X-Received: by 2002:a05:600c:2ed3:b0:3c6:e61e:ae71 with SMTP id
 q19-20020a05600c2ed300b003c6e61eae71mr4746517wmn.1.1677653493155; 
 Tue, 28 Feb 2023 22:51:33 -0800 (PST)
X-Google-Smtp-Source: AK7set+Yf8j3PzY19U0an28wyc4BTin8SfYAnC5mWUncjm0qkiuAXCWUGVeUWWU27kV1Sga5qK1nrg==
X-Received: by 2002:a05:600c:2ed3:b0:3c6:e61e:ae71 with SMTP id
 q19-20020a05600c2ed300b003c6e61eae71mr4746493wmn.1.1677653492872; 
 Tue, 28 Feb 2023 22:51:32 -0800 (PST)
Received: from [192.168.8.100] (tmo-114-247.customers.d1-online.com.
 [80.187.114.247]) by smtp.gmail.com with ESMTPSA id
 n41-20020a05600c3ba900b003e20fa01a86sm15879007wms.13.2023.02.28.22.51.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 22:51:32 -0800 (PST)
Message-ID: <199f0714-901a-a15d-690a-2a2f56db015a@redhat.com>
Date: Wed, 1 Mar 2023 07:51:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 22/24] gitlab: move the majority of artefact handling
 to a template
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Peter Maydell
 <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Aurelien Jarno <aurelien@aurel32.net>, Markus Armbruster
 <armbru@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Ed Maste <emaste@freebsd.org>,
 qemu-arm@nongnu.org, Fam Zheng <fam@euphon.net>,
 Yonggang Luo <luoyonggang@gmail.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
 <20230228190653.1602033-23-alex.bennee@linaro.org>
 <85fa3961-eb23-8d93-b4e4-e3e4227fac26@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <85fa3961-eb23-8d93-b4e4-e3e4227fac26@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.092, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 28/02/2023 22.41, Philippe Mathieu-Daudé wrote:
> On 28/2/23 20:06, Alex Bennée wrote:
>> To avoid lots of copy and paste lets deal with artefacts in a
>> template. This way we can filter out most of the pre-binary object and
>> library files we no longer need as we have the final binaries.
>>
>> build-system-alpine also saved .git-submodule-status so for simplicity
>> we bring that into the template as well.
>>
>> As an example the build-system-ubuntu artefacts before this patch
>> where around 1.3 GB, after dropping the object files it comes to 970
>> MB.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>   .gitlab-ci.d/buildtest-template.yml | 16 ++++++
>>   .gitlab-ci.d/buildtest.yml          | 81 +++++++++++------------------
>>   2 files changed, 46 insertions(+), 51 deletions(-)
> 
> This is still kludging the fact that 'make check-qtest' rebuild
> the world even if QEMU binaries are present.

Did you try? ... if so, that would kill even more CI minutes, i.e. it would 
IMHO be a show-stopper for this patch.

  Thomas



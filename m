Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C919D2B6C67
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 18:57:26 +0100 (CET)
Received: from localhost ([::1]:45414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf5EL-0005Op-N4
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 12:57:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kf5DU-0004wt-PV
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 12:56:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kf5DO-0005Ua-KG
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 12:56:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605635784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xX6pvoNLwF8QHgoJ6HFm6ZsO8c2sfJhwEkUJCgL1w0w=;
 b=EYWWLIMq5osmjeq9fxh/WjosWkSldfs8gpry/Nhw80ZJVvFrgJTh07HwyfVlGCogPFjYYe
 PW/MKtw2gFfM36r7JpA2tjwaiChZ8BjEhhV561CaraiyMfQ7Iu+cNIafkgUzYDixAPNu/h
 e4CWFzkl413I8vLnNy2WCZyhwslT9u0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-G0VGKeYpPwyYf71F0UE9Xg-1; Tue, 17 Nov 2020 12:56:22 -0500
X-MC-Unique: G0VGKeYpPwyYf71F0UE9Xg-1
Received: by mail-wm1-f72.google.com with SMTP id k128so2102641wme.7
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 09:56:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xX6pvoNLwF8QHgoJ6HFm6ZsO8c2sfJhwEkUJCgL1w0w=;
 b=U7Y6XOMXtqcqsjIwkKls9wqiwri7poT20TiucE48W4dvWuLoOcbPx+N/30+SDMOmAR
 QwuzPevnVra59oipWYFaknw/a5AYuUocqGbYIGUDokOfNnta73+EwwR3BhihQEA03D2Y
 7c430TNbpQVQ8z23vh+riQvekot3zI/6co0QR5mKh+ywV3YogJI+lHucA7NfA2H7hNyf
 pUyBoD5JmlxXrBheHt8U9vP0NRKLByJxzVmYbIWMBJzjf119jnJdwKgBlPqI4buu91DF
 ZGkkIZdbH72Ukv6jS83VOzxsiCz4lu0tMTNJBNHiblYYuwK0+LWaFRPA7lYdFB+/iYIn
 gwfw==
X-Gm-Message-State: AOAM530XoXEuo4s4oMAAJ4Tk+TfafpDqWV0YzsT93RzJf/wvfE1EXVuZ
 IDVmaEQYwkVwOnst/0tppTor76shCgF4k27ySnp3CWqNW0/CJ+hZ2Z5riakze6k8aeHh/VkkPA3
 V+zpGpi9IJu/IvS8=
X-Received: by 2002:a1c:9c56:: with SMTP id f83mr269933wme.49.1605635781182;
 Tue, 17 Nov 2020 09:56:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyaFAZc2RovTYVn9BIQiJQAESqILLzbe/KirbJTHNVAMRqSUrE4oekIACAm7CKGR95jkrOy9w==
X-Received: by 2002:a1c:9c56:: with SMTP id f83mr269915wme.49.1605635781000;
 Tue, 17 Nov 2020 09:56:21 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id x2sm23013477wru.44.2020.11.17.09.56.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 09:56:20 -0800 (PST)
Subject: Re: [PATCH v1 2/6] tests: add prefixes to the bare mkdtemp calls
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20201117173635.29101-1-alex.bennee@linaro.org>
 <20201117173635.29101-3-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bdbc996d-83b5-5106-fb5f-44cdb9bedef2@redhat.com>
Date: Tue, 17 Nov 2020 18:56:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201117173635.29101-3-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/17/20 6:36 PM, Alex Bennée wrote:
> The first step to debug a thing is to know what created the thing in
> the first place. Add some prefixes so random tmpdir's have something
> grep in the code.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>   - fix long lines
> ---
>  python/qemu/machine.py                    | 3 ++-
>  tests/acceptance/avocado_qemu/__init__.py | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>



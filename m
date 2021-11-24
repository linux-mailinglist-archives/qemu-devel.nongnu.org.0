Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADECD45C5B5
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 14:57:18 +0100 (CET)
Received: from localhost ([::1]:34178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpslx-0005cm-Pk
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 08:57:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpsVD-0003mk-BV
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 08:39:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpsVB-0002I5-Ct
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 08:39:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637761196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YxQlJch83QX5gAdwMFfPLWCaH0M5do7pLPN+WXjxhOo=;
 b=Zvq3exjTMTgBg2QuAJk+BoNp+leHfb+XK+xtHcZ9BHM/XG0PvkzA33vTSCYEBG7gOhvQtq
 uSx3m7du8w38CPSxJwuCJEG4pZK/vqiS1tYaLNht3JPhIFQ0+poquM9/PiEDi7Ao8IqXxq
 AO5+p6gIKvxs0BvTbxUi3BioX44hF+U=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-2sXWNDlfN6CU-MxZgPxo3g-1; Wed, 24 Nov 2021 08:39:55 -0500
X-MC-Unique: 2sXWNDlfN6CU-MxZgPxo3g-1
Received: by mail-wm1-f71.google.com with SMTP id
 205-20020a1c00d6000000b003335d1384f1so3042247wma.3
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 05:39:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YxQlJch83QX5gAdwMFfPLWCaH0M5do7pLPN+WXjxhOo=;
 b=6XnWky6Uer60V7kNSwcyOQZ6PMNkIQtNBxHIEhPA11nz/wf8amywUf+Eq9vw65vavl
 aH/O3DVo5pzUx+KKTjItgg3E8i3SX0RYjDVS0rIvNK7l+BaG5i3qdco3Ga9LSQJ6G5IW
 Zq5XeLnsOrce14xfkztqAenqKjlS3QfpakuZ3Z9Lg2tey77QCw/zI9bMj6QSgo2So0cQ
 FmErLR1pAfML6BrkO7lfgII2aGOSaNwscG1Ad66FqPoNJgMs+YDcTYhvtlgcvLj0n8jP
 A+sXXor7PRpE9KLCnj5mKoalz4bEky+nBaO279TZGSv5zBkN1erDHXwLapxdXKQ6XDUa
 S2zA==
X-Gm-Message-State: AOAM531qBy2PksyRAUpGzqtkLvAv8Y0I+rHEfN2BahSz1iwOS4MctmMB
 9KYZ047vofL1mUlhGMDdz/07wKffmIJh4GJgFiffAyZty+8diqx60Xvk2z+fRS+OHkPSjS9SbxP
 dA3qwlQKaktWTzYw=
X-Received: by 2002:a1c:ed18:: with SMTP id l24mr15975758wmh.99.1637761194627; 
 Wed, 24 Nov 2021 05:39:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyHhRbi8/App8BxmAa6F/nYONU1W34ai/daw3B3A8AARwrLuhQAfoOrgZmnLvipMzt+MFh0LA==
X-Received: by 2002:a1c:ed18:: with SMTP id l24mr15975716wmh.99.1637761194404; 
 Wed, 24 Nov 2021 05:39:54 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id v15sm15061706wro.35.2021.11.24.05.39.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 05:39:54 -0800 (PST)
Message-ID: <a2af53f7-e0aa-4257-0c2c-ae23499a70bd@redhat.com>
Date: Wed, 24 Nov 2021 14:39:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 16/18] tests/docker: fix sorting of alpine image
 package lists
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20211124130150.268230-1-berrange@redhat.com>
 <20211124130150.268230-17-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211124130150.268230-17-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/21 14:01, Daniel P. Berrangé wrote:
> "python" sorts alphabetically after "py3-xxxx"
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  tests/docker/dockerfiles/alpine.docker | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>



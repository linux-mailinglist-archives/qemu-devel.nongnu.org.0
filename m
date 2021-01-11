Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1D22F1237
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 13:19:00 +0100 (CET)
Received: from localhost ([::1]:33360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyw9z-0005tN-AW
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 07:18:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kyw83-00053O-8S
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 07:16:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kyw81-0004s5-PM
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 07:16:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610367417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3piF4Rp00dJP7X5tKD6ZUfebhyZeASP1t049+HfATnU=;
 b=PYkPa3FvBq0Z+Ti3XCoI8HCSniKstL8/J8Ffrbsdj5Gvg13xPPa6gsx8Uld27a/u4/uJ7W
 FMlDeb3LQoswG5p2tDG57xTsq7X5TJwBRRwTXIl1XTp4el/dgyju4jF6Pvyq7kqDirQyrC
 HgNB+5qQ0uH4zGvPA8WMiyRCys6FC9c=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-uKngUr77OPaQPlbIZi2_CQ-1; Mon, 11 Jan 2021 07:16:55 -0500
X-MC-Unique: uKngUr77OPaQPlbIZi2_CQ-1
Received: by mail-ej1-f70.google.com with SMTP id w6so4945270ejo.2
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 04:16:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3piF4Rp00dJP7X5tKD6ZUfebhyZeASP1t049+HfATnU=;
 b=Ax+wCGRBJh/uCtTUHRDoFZhwkXr/tLyQPnrnV4WHatKa+l8DqLJeCkHVCJFenHYw92
 XtYliLP5lrBZZ307mOHg4wX630jcG3gEDAAZBB9xxPczJ8zLFaoymaDSj0zdF69r7yck
 w1jeSVBBBaTujU4XVcoN7wZj9pTHIbX20daxi+fdxdqBjT8Q4UKX9SJRch7YMFpEzyNz
 ZjKVO5/VjzD+aJ1a9vt3DmTK7mQdq/DZBYJjdiTInerfTdbWItsJB10oTEWZMLBP/vp8
 F2Dmt+MCIab0d6fMDVIsILQFezUohIWIxqiKWjaHFXlEBqYQvVHy9hwDIVOePC/K8uZ4
 WE/Q==
X-Gm-Message-State: AOAM5317FHYhvcpQ37wWBja1H7w7gshdOAFiYkubu6iTx/3ubk+YpERO
 AkgdNOmExQ20g7Zcs07F1BfKfG90YEQd43t18Joq4s6aSR+JCXyIzzPpCXazC9KEXcm5hQmRsjH
 nc5P1APbtHTb6gxg=
X-Received: by 2002:a05:6402:50ca:: with SMTP id
 h10mr13612390edb.181.1610367414162; 
 Mon, 11 Jan 2021 04:16:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1CKCFSmx3I/qTmfT7HBRVwF/voUBLRz9JIDhOxqcVUeT3jGT3HPbZ6zfP5Gw8kJe1AJTxxA==
X-Received: by 2002:a05:6402:50ca:: with SMTP id
 h10mr13612370edb.181.1610367413989; 
 Mon, 11 Jan 2021 04:16:53 -0800 (PST)
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id f8sm7610037eds.19.2021.01.11.04.16.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 04:16:53 -0800 (PST)
Subject: Re: [PATCH 3/6] gitlab-ci: remove redundant GitLab repo URL command
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210111115017.156802-1-stefanha@redhat.com>
 <20210111115017.156802-4-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1ccfc782-7fb1-d305-9194-2f9f0ca4f373@redhat.com>
Date: Mon, 11 Jan 2021 13:16:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210111115017.156802-4-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/11/21 12:50 PM, Stefan Hajnoczi wrote:
> It is no longer necessary to point .gitmodules at GitLab repos when
> running in GitLab CI since they are now used all the time.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  .gitlab-ci.yml | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>



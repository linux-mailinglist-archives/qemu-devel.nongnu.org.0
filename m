Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0216ADE95
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 13:21:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZWJB-0001jj-18; Tue, 07 Mar 2023 07:20:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pZWJ5-0001jD-B5
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:20:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pZWJ3-0008AE-Pr
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:20:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678191637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JObthbqtR0Py8xqXa1hDwZNKtp62riQZVGjL+w8IDO0=;
 b=AVdW3Pw7BzwSc7x0ffOwGQIJlu6dpWuIrUf/H19bGuLfUnrD81Wqm5tY4NbpOuQp69STPy
 HEEQsAoUuLkBRusSBdrphAvzHgTfDrWGEvRaPGO8h4wLBInLiPFy92NSNRHoGz2auNGhof
 zIu51pMBF+2dapUccvVsoLypdhk2NV0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-203-5pAc8x1iOIOSRefnPD6eWQ-1; Tue, 07 Mar 2023 07:20:35 -0500
X-MC-Unique: 5pAc8x1iOIOSRefnPD6eWQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 ev6-20020a056402540600b004bc2358ac04so18839920edb.21
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 04:20:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678191634;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JObthbqtR0Py8xqXa1hDwZNKtp62riQZVGjL+w8IDO0=;
 b=kaO5v3VDlCiycD2jQCMTZJRWdCaaj9e4MVcphS9+8Ixrx5Vdt91W3hE5Dtw5Uw4snH
 7ic1bmbFUP4I6jcBJhUrPME7VquB1HYyhETUf8c6xeIgF0OfpTAudz3lVwieOd6ppUgo
 HPPR25NZ5uTeElMPcqQa3QnqENzqrwae2Upfc9FKIgEeShybmXg9ogNlv7/3SnMOs1GF
 SjgGzpr9fiIu7Ms33/FNNgTj/t7jkKvTmoBib2UMZGNLkach1dA6slT4aR+fkGz7jD2t
 Tk2Byn8KivXZTGsApXgxjVVgYZuElLzKQv4NOVQYCVAf4CRPi0NKqsZpZcg4DCJ8tG2j
 ruhg==
X-Gm-Message-State: AO0yUKWL+J4n6SVxf+mMYHI4P9AEq54zLyge0kVt3/Vf5UAy1vteahQu
 ObItt4Lj+BKsWq8aEu/5XYNSJf5XxGi3saS89k77AQ7er6GJsq/gSw4mpw8/coiDvFcEGwoh6mt
 LUXyryvvq2wKiaG8=
X-Received: by 2002:a17:907:a40b:b0:87b:d2b3:67ca with SMTP id
 sg11-20020a170907a40b00b0087bd2b367camr17910427ejc.75.1678191634678; 
 Tue, 07 Mar 2023 04:20:34 -0800 (PST)
X-Google-Smtp-Source: AK7set+PFLuQihzLzdUjDKklCm7HubK8sJm/GuIDeVbELLh0WI2fRb4055gZiiZU7gnCzHdmDeoT3g==
X-Received: by 2002:a17:907:a40b:b0:87b:d2b3:67ca with SMTP id
 sg11-20020a170907a40b00b0087bd2b367camr17910408ejc.75.1678191634454; 
 Tue, 07 Mar 2023 04:20:34 -0800 (PST)
Received: from ?IPV6:2003:cf:d729:7d22:58d:9cdf:192f:c786?
 (p200300cfd7297d22058d9cdf192fc786.dip0.t-ipconnect.de.
 [2003:cf:d729:7d22:58d:9cdf:192f:c786])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a1709063ec500b008b1797a53b4sm6002911ejj.215.2023.03.07.04.20.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 04:20:34 -0800 (PST)
Message-ID: <6bbbfd5f-90c3-5e15-d417-a54fc25222d6@redhat.com>
Date: Tue, 7 Mar 2023 13:20:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v10 00/12] parallels: Refactor the code of images checks
 and fix a bug
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com
References: <20230203091854.2221397-1-alexander.ivanov@virtuozzo.com>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <20230203091854.2221397-1-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 03.02.23 10:18, Alexander Ivanov wrote:
> Fix image inflation when offset in BAT is out of image.
>
> Replace whole BAT syncing by flushing only dirty blocks.
>
> Move all the checks outside the main check function in
> separate functions
>
> Use WITH_QEMU_LOCK_GUARD for simplier code.
>
> Fix incorrect condition in out-of-image check.

Apart from my comments (and I think regardless of what happens for patch 
1), looks good to me!  Some patches will need to be rebased on the 
GRAPH_RDLOCK changes, but that looks straightforward.

Hanna


